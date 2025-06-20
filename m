Received: from out198-28.us.a.mail.aliyun.com (out198-28.us.a.mail.aliyun.com [47.90.198.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E592522A7;
	Fri, 20 Jun 2025 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413444; cv=none; b=Re9rnifmOCmKABlldcMgrVnQNpuy1SWH0+yf3X87dm3fsGVxV0gyCrLdIzaE5bnojTqRo+OtZm5P9P16AwsswSPaThlLOgAxkcVEHxVddz5guJsQewLfljmemj/3FYpepqs1+t8UsT4AYOlldrKUmufLJ5RQi+/YeLld15tQezQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413444; c=relaxed/simple;
	bh=ebzjoLjV8//VsMazb6M6IGFADF65MrRUbd1DxZ8Nc6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ubI2ZOnnDDwQyLYF2tNYtJDMqcuCsj5tNX4qrMGvwjkp8nq7vhiw71FP83zVu5FPQiZE+Kyaf8njFUyCDlWj1dkfOAB/H/7qZikp7CmhXQuVsbNkaFu/b6qwNrWNmVRp3FLxLZdqlposPh4otvkeozpKFwuVq4fDCZYtN0MMk7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.dRFhbAC_1750413418 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 17:57:00 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	zhujun2@cmss.chinamobile.com,
	colin.i.king@gmail.com,
	thorsten.blum@linux.dev,
	u.kleine-koenig@baylibre.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com
Subject: [PATCH V1] ASoC: codecs: Add calibration function to aw88399 chip
Date: Fri, 20 Jun 2025 17:56:57 +0800
Message-ID: <20250620095657.327382-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weidong Wang <wangweidong.a@awinic.com>

Add calibration functionality to the aw88399 chip.
When the chip is in working condition, calibration
can be achieved by configuring the chip's internal DSP
and save the calibration values in cali_re.

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88395/aw88395_device.h |  19 ++
 sound/soc/codecs/aw88399.c                | 391 +++++++++++++++++++++-
 sound/soc/codecs/aw88399.h                |  39 +++
 3 files changed, 447 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_device.h b/sound/soc/codecs/aw88395/aw88395_device.h
index 0f750f654f3e..c1e7c0b6af5c 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.h
+++ b/sound/soc/codecs/aw88395/aw88395_device.h
@@ -102,6 +102,11 @@ struct aw_profctrl_desc {
 	unsigned int cur_mode;
 };
 
+enum {
+	CALI_RESULT_NORMAL,
+	CALI_RESULT_ERROR,
+};
+
 struct aw_volume_desc {
 	unsigned int init_volume;
 	unsigned int mute_volume;
@@ -124,9 +129,23 @@ struct aw_cali_delay_desc {
 	unsigned int delay;
 };
 
+#define AW_CALI_CFG_NUM (4)
+struct cali_cfg {
+	uint32_t data[AW_CALI_CFG_NUM];
+};
+
+struct aw_cali_backup_desc {
+	unsigned int dsp_ng_cfg;
+	unsigned int dsp_lp_cfg;
+};
+
 struct aw_cali_desc {
 	u32 cali_re;
 	u32 ra;
+	uint16_t cali_result;
+	uint16_t store_vol;
+	struct cali_cfg cali_cfg;
+	struct aw_cali_backup_desc backup_info;
 };
 
 struct aw_container {
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index 4b90133e5ab4..ef433d786429 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -13,6 +13,7 @@
 #include <linux/firmware.h>
 #include <linux/minmax.h>
 #include <linux/regmap.h>
+#include <linux/sort.h>
 #include <sound/soc.h>
 #include "aw88399.h"
 #include "aw88395/aw88395_device.h"
@@ -45,6 +46,67 @@ static int aw_dev_dsp_write_16bit(struct aw_device *aw_dev,
 	return 0;
 }
 
+static int aw_dev_dsp_write_32bit(struct aw_device *aw_dev,
+		unsigned short dsp_addr, unsigned int dsp_data)
+{
+	unsigned int temp_data;
+	int ret;
+
+	ret = regmap_write(aw_dev->regmap, AW88399_DSPMADD_REG, dsp_addr);
+	if (ret) {
+		dev_err(aw_dev->dev, "%s write addr error, ret=%d", __func__, ret);
+		return ret;
+	}
+
+	temp_data = dsp_data & AW88395_DSP_16_DATA_MASK;
+	ret = regmap_write(aw_dev->regmap, AW88399_DSPMDAT_REG, temp_data);
+	if (ret) {
+		dev_err(aw_dev->dev, "%s write datal error, ret=%d", __func__, ret);
+		return ret;
+	}
+
+	temp_data = dsp_data >> 16;
+	ret = regmap_write(aw_dev->regmap, AW88399_DSPMDAT_REG, temp_data);
+	if (ret)
+		dev_err(aw_dev->dev, "%s write datah error, ret=%d", __func__, ret);
+
+	return ret;
+}
+
+static int aw_dev_dsp_write(struct aw_device *aw_dev,
+		unsigned short dsp_addr, unsigned int dsp_data, unsigned char data_type)
+{
+	unsigned int reg_value;
+	int ret;
+
+	mutex_lock(&aw_dev->dsp_lock);
+	switch (data_type) {
+	case AW88395_DSP_16_DATA:
+		ret = aw_dev_dsp_write_16bit(aw_dev, dsp_addr, dsp_data);
+		if (ret)
+			dev_err(aw_dev->dev, "write dsp_addr[0x%x] 16-bit dsp_data[0x%x] failed",
+					dsp_addr, dsp_data);
+		break;
+	case AW88395_DSP_32_DATA:
+		ret = aw_dev_dsp_write_32bit(aw_dev, dsp_addr, dsp_data);
+		if (ret)
+			dev_err(aw_dev->dev, "write dsp_addr[0x%x] 32-bit dsp_data[0x%x] failed",
+					dsp_addr, dsp_data);
+		break;
+	default:
+		dev_err(aw_dev->dev, "data type[%d] unsupported", data_type);
+		ret = -EINVAL;
+		break;
+	}
+
+	/* clear dsp chip select state*/
+	if (regmap_read(aw_dev->regmap, 0x00, &reg_value))
+		dev_err(aw_dev->dev, "%s fail to clear chip state. Err=%d\n", __func__, ret);
+	mutex_unlock(&aw_dev->dsp_lock);
+
+	return ret;
+}
+
 static int aw_dev_dsp_read_16bit(struct aw_device *aw_dev,
 		unsigned short dsp_addr, unsigned int *dsp_data)
 {
@@ -452,14 +514,14 @@ static int aw_dev_set_vcalb(struct aw88399 *aw88399)
 	case AW88399_DEV_VDSEL_VSENSE:
 		ret = aw88399_dev_get_vcalk(aw88399, &vcalk);
 		vcal_k = vcalk * AW88399_VCABLK_FACTOR + AW88399_CABL_BASE_VALUE;
-		vcalb = AW88399_VCALB_ACCURACY * AW88399_VSCAL_FACTOR / AW88399_ISCAL_FACTOR /
+		vcalb = AW88399_VCALB_ACCURACY * AW88399_VSCAL_FACTOR / AW88399_ISCAL_FACTOR *
 			ical_k / vcal_k * aw88399->vcalb_init_val;
 		break;
 	case AW88399_DEV_VDSEL_DAC:
 		ret = aw88399_dev_get_internal_vcalk(aw88399, &vcalk);
 		vcal_k = vcalk * AW88399_VCABLK_DAC_FACTOR + AW88399_CABL_BASE_VALUE;
 		vcalb = AW88399_VCALB_ACCURACY * AW88399_VSCAL_DAC_FACTOR /
-					AW88399_ISCAL_DAC_FACTOR / ical_k /
+					AW88399_ISCAL_DAC_FACTOR * ical_k /
 					vcal_k * aw88399->vcalb_init_val;
 		break;
 	default:
@@ -1356,6 +1418,324 @@ static struct snd_soc_dai_driver aw88399_dai[] = {
 	},
 };
 
+static void aw_cali_svc_run_mute(struct aw_device *aw_dev, uint16_t cali_result)
+{
+	if (cali_result == CALI_RESULT_ERROR)
+		aw88399_dev_mute(aw_dev, true);
+	else if (cali_result == CALI_RESULT_NORMAL)
+		aw88399_dev_mute(aw_dev, false);
+}
+
+static int aw_cali_svc_get_cali_cfg(struct aw_device *aw_dev)
+{
+	struct cali_cfg *cali_cfg = &aw_dev->cali_desc.cali_cfg;
+	int ret;
+
+	ret = aw_dev_dsp_read(aw_dev, AW88399_DSP_REG_CFG_MBMEC_ACTAMPTH,
+					&cali_cfg->data[0], AW88399_DSP_32_DATA);
+	if (ret)
+		return ret;
+
+	ret = aw_dev_dsp_read(aw_dev, AW88399_DSP_REG_CFG_MBMEC_NOISEAMPTH,
+					&cali_cfg->data[1], AW88399_DSP_32_DATA);
+	if (ret)
+		return ret;
+
+	ret = aw_dev_dsp_read(aw_dev, AW88399_DSP_REG_CFG_ADPZ_USTEPN,
+					&cali_cfg->data[2], AW88399_DSP_16_DATA);
+	if (ret)
+		return ret;
+
+	ret = aw_dev_dsp_read(aw_dev, AW88399_DSP_REG_CFG_RE_ALPHA,
+					&cali_cfg->data[3], AW88399_DSP_16_DATA);
+
+	return ret;
+}
+
+static int aw_cali_svc_set_cali_cfg(struct aw_device *aw_dev,
+				struct cali_cfg cali_cfg)
+{
+	int ret;
+
+	ret = aw_dev_dsp_write(aw_dev, AW88399_DSP_REG_CFG_MBMEC_ACTAMPTH,
+					cali_cfg.data[0], AW88399_DSP_32_DATA);
+	if (ret)
+		return ret;
+
+	ret = aw_dev_dsp_write(aw_dev, AW88399_DSP_REG_CFG_MBMEC_NOISEAMPTH,
+					cali_cfg.data[1], AW88399_DSP_32_DATA);
+	if (ret)
+		return ret;
+
+	ret = aw_dev_dsp_write(aw_dev, AW88399_DSP_REG_CFG_ADPZ_USTEPN,
+					cali_cfg.data[2], AW88399_DSP_16_DATA);
+	if (ret)
+		return ret;
+
+	ret = aw_dev_dsp_write(aw_dev, AW88399_DSP_REG_CFG_RE_ALPHA,
+					cali_cfg.data[3], AW88399_DSP_16_DATA);
+
+	return ret;
+}
+
+static int aw_cali_svc_cali_en(struct aw_device *aw_dev, bool cali_en)
+{
+	struct cali_cfg set_cfg;
+	int ret;
+
+	aw_dev_dsp_enable(aw_dev, false);
+	if (cali_en) {
+		regmap_update_bits(aw_dev->regmap, AW88399_DBGCTRL_REG,
+				~AW883XX_DSP_NG_EN_MASK, AW883XX_DSP_NG_EN_DISABLE_VALUE);
+		aw_dev_dsp_write(aw_dev, AW88399_DSP_LOW_POWER_SWITCH_CFG_ADDR,
+				AW88399_DSP_LOW_POWER_SWITCH_DISABLE, AW88399_DSP_16_DATA);
+
+		ret = aw_cali_svc_get_cali_cfg(aw_dev);
+		if (ret) {
+			dev_err(aw_dev->dev, "get cali cfg failed");
+			aw_dev_dsp_enable(aw_dev, true);
+			return ret;
+		}
+		set_cfg.data[0] = 0;
+		set_cfg.data[1] = 0;
+		set_cfg.data[2] = -1;
+		set_cfg.data[3] = 1;
+
+		ret = aw_cali_svc_set_cali_cfg(aw_dev, set_cfg);
+		if (ret) {
+			dev_err(aw_dev->dev, "set cali cfg failed");
+			aw_cali_svc_set_cali_cfg(aw_dev, aw_dev->cali_desc.cali_cfg);
+			aw_dev_dsp_enable(aw_dev, true);
+			return ret;
+		}
+	} else {
+		aw_cali_svc_set_cali_cfg(aw_dev, aw_dev->cali_desc.cali_cfg);
+	}
+
+	aw_dev_dsp_enable(aw_dev, true);
+
+	return 0;
+}
+
+static int aw_cali_svc_cali_run_dsp_vol(struct aw_device *aw_dev, bool enable)
+{
+	unsigned int reg_val;
+	int ret;
+
+	if (enable) {
+		ret = regmap_read(aw_dev->regmap, AW88399_DSPCFG_REG, &reg_val);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "read reg 0x%x failed", AW88399_DSPCFG_REG);
+			return ret;
+		}
+
+		aw_dev->cali_desc.store_vol = reg_val & (~AW88399_DSP_VOL_MASK);
+		ret = regmap_update_bits(aw_dev->regmap, AW88399_DSPCFG_REG,
+				~AW88399_DSP_VOL_MASK, AW88399_DSP_VOL_MUTE);
+	} else {
+		ret = regmap_update_bits(aw_dev->regmap, AW88399_DSPCFG_REG,
+				~AW88399_DSP_VOL_MASK, aw_dev->cali_desc.store_vol);
+	}
+
+	return ret;
+}
+
+static void aw_cali_svc_backup_info(struct aw_device *aw_dev)
+{
+	struct aw_cali_backup_desc *backup_desc = &aw_dev->cali_desc.backup_info;
+	unsigned int reg_val, dsp_val;
+
+	regmap_read(aw_dev->regmap, AW88399_DBGCTRL_REG, &reg_val);
+	backup_desc->dsp_ng_cfg = reg_val & (~AW883XX_DSP_NG_EN_MASK);
+
+	aw_dev_dsp_read(aw_dev, AW88399_DSP_LOW_POWER_SWITCH_CFG_ADDR,
+			&dsp_val, AW88399_DSP_16_DATA);
+
+	backup_desc->dsp_lp_cfg = dsp_val;
+}
+
+static void aw_cali_svc_recover_info(struct aw_device *aw_dev)
+{
+	struct aw_cali_backup_desc *backup_desc = &aw_dev->cali_desc.backup_info;
+
+	regmap_update_bits(aw_dev->regmap, AW88399_DBGCTRL_REG,
+			~AW883XX_DSP_NG_EN_MASK, backup_desc->dsp_ng_cfg);
+
+	aw_dev_dsp_write(aw_dev, AW88399_DSP_LOW_POWER_SWITCH_CFG_ADDR,
+			backup_desc->dsp_lp_cfg, AW88399_DSP_16_DATA);
+}
+
+static int aw_cali_svc_cali_re_mode_enable(struct aw_device *aw_dev, bool is_enable)
+{
+	int ret;
+
+	if (is_enable) {
+		ret = aw_dev_check_syspll(aw_dev);
+		if (ret) {
+			dev_err(aw_dev->dev, "pll check failed cannot start");
+			return ret;
+		}
+
+		ret = aw_dev_get_dsp_status(aw_dev);
+		if (ret) {
+			dev_err(aw_dev->dev, "dsp status error\n");
+			return ret;
+		}
+
+		aw_cali_svc_backup_info(aw_dev);
+		ret = aw_cali_svc_cali_en(aw_dev, true);
+		if (ret) {
+			dev_err(aw_dev->dev, "aw_cali_svc_cali_en failed\n");
+			return ret;
+		}
+
+		ret = aw_cali_svc_cali_run_dsp_vol(aw_dev, true);
+		if (ret) {
+			aw_cali_svc_cali_en(aw_dev, false);
+			return ret;
+		}
+
+	} else {
+		aw_cali_svc_cali_run_dsp_vol(aw_dev, false);
+		aw_cali_svc_recover_info(aw_dev);
+		aw_cali_svc_cali_en(aw_dev, false);
+	}
+
+	return 0;
+}
+
+static int aw_cali_svc_get_dev_re(struct aw_device *aw_dev,
+					uint32_t *re)
+{
+	uint32_t dsp_re, show_re;
+	int ret;
+
+	ret = aw_dev_dsp_read(aw_dev, AW88399_DSP_REG_CALRE, &dsp_re, AW88399_DSP_16_DATA);
+	if (ret)
+		return ret;
+
+	show_re = AW88399_DSP_RE_TO_SHOW_RE(dsp_re, AW88399_DSP_REG_CALRE_SHIFT);
+
+	*re = (uint32_t)(show_re - aw_dev->cali_desc.ra);
+
+	return 0;
+}
+
+static void aw_cali_svc_del_max_min_ave_algo(uint32_t *data, int data_size, uint32_t *dsp_re)
+{
+	int sum = 0, i;
+
+	for (i = 1; i < data_size - 1; i++)
+		sum += data[i];
+
+	*dsp_re = sum / (data_size - AW_CALI_DATA_SUM_RM);
+}
+
+static int aw_cali_svc_get_iv_st(struct aw_device *aw_dev)
+{
+	unsigned int reg_data;
+	int ret, i;
+
+	for (i = 0; i < AW_GET_IV_CNT_MAX; i++) {
+		ret = regmap_read(aw_dev->regmap, AW88399_ASR1_REG, &reg_data);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "read 0x%x failed", AW88399_ASR1_REG);
+			return ret;
+		}
+
+		reg_data &= (~AW88399_REABS_MASK);
+		if (!reg_data)
+			return 0;
+		msleep(30);
+	}
+
+	dev_err(aw_dev->dev, "IV data abnormal, please check");
+
+	return -EINVAL;
+}
+
+static int compare_ints(const void *a, const void *b)
+{
+	return *(int *)a - *(int *)b;
+}
+
+static int aw_cali_svc_get_smooth_cali_re(struct aw_device *aw_dev)
+{
+	uint32_t re_temp[AW_CALI_READ_CNT_MAX];
+	uint32_t dsp_re;
+	int ret, i;
+
+	for (i = 0; i < AW_CALI_READ_CNT_MAX; i++) {
+		ret = aw_cali_svc_get_dev_re(aw_dev, &re_temp[i]);
+		if (ret)
+			goto cali_re_fail;
+		msleep(30);
+	}
+
+	sort(re_temp, AW_CALI_READ_CNT_MAX, sizeof(uint32_t), compare_ints, NULL);
+
+	aw_cali_svc_del_max_min_ave_algo(re_temp, AW_CALI_READ_CNT_MAX, &dsp_re);
+
+	ret = aw_cali_svc_get_iv_st(aw_dev);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "get iv data failed");
+		goto cali_re_fail;
+	}
+
+	if (dsp_re < AW88399_CALI_RE_MIN || dsp_re > AW88399_CALI_RE_MAX) {
+		dev_err(aw_dev->dev, "out range re value: [%d]mohm", dsp_re);
+		aw_dev->cali_desc.cali_re = dsp_re;
+		aw_dev->cali_desc.cali_result = CALI_RESULT_ERROR;
+		aw_cali_svc_run_mute(aw_dev, aw_dev->cali_desc.cali_result);
+
+		return 0;
+	}
+
+	aw_dev->cali_desc.cali_result = CALI_RESULT_NORMAL;
+
+	aw_dev->cali_desc.cali_re = dsp_re;
+	dev_dbg(aw_dev->dev, "re[%d]mohm", aw_dev->cali_desc.cali_re);
+
+	aw_dev_dsp_enable(aw_dev, false);
+	aw_dev_update_cali_re(&aw_dev->cali_desc);
+	aw_dev_dsp_enable(aw_dev, true);
+
+	return 0;
+
+cali_re_fail:
+	aw_dev->cali_desc.cali_result = CALI_RESULT_ERROR;
+	aw_cali_svc_run_mute(aw_dev, aw_dev->cali_desc.cali_result);
+	return -EINVAL;
+}
+
+static int aw_cali_svc_dev_cali_re(struct aw88399 *aw88399)
+{
+	struct aw_device *aw_dev = aw88399->aw_pa;
+	int ret;
+
+	mutex_lock(&aw88399->lock);
+	aw_cali_svc_run_mute(aw_dev, CALI_RESULT_NORMAL);
+
+	ret = aw_cali_svc_cali_re_mode_enable(aw_dev, true);
+	if (ret) {
+		dev_err(aw_dev->dev, "start cali re failed\n");
+		goto exit;
+	}
+
+	msleep(3000);
+
+	ret = aw_cali_svc_get_smooth_cali_re(aw_dev);
+	if (ret < 0)
+		dev_err(aw_dev->dev, "get cali re failed");
+
+	aw_cali_svc_cali_re_mode_enable(aw_dev, false);
+
+exit:
+	mutex_unlock(&aw88399->lock);
+
+	return ret;
+}
+
 static int aw88399_get_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -1588,6 +1968,13 @@ static int aw88399_re_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	struct aw_device *aw_dev = aw88399->aw_pa;
+	int ret;
+
+	if (aw_dev->status) {
+		ret = aw_cali_svc_dev_cali_re(aw88399);
+		if (ret)
+			return -EPERM;
+	}
 
 	ucontrol->value.integer.value[0] = aw_dev->cali_desc.cali_re;
 
diff --git a/sound/soc/codecs/aw88399.h b/sound/soc/codecs/aw88399.h
index 5e9cdf725d3d..db854e0b12f1 100644
--- a/sound/soc/codecs/aw88399.h
+++ b/sound/soc/codecs/aw88399.h
@@ -451,6 +451,29 @@
 #define AW88399_WDT_CNT_MASK		\
 	(~(((1<<AW88399_WDT_CNT_BITS_LEN)-1) << AW88399_WDT_CNT_START_BIT))
 
+#define AW88399_REABS_START_BIT	(3)
+#define AW88399_REABS_BITS_LEN		(1)
+#define AW88399_REABS_MASK			\
+	(~(((1<<AW88399_REABS_BITS_LEN)-1) << AW88399_REABS_START_BIT))
+
+#define AW88399_DSP_VOL_START_BIT	(8)
+#define AW88399_DSP_VOL_BITS_LEN	(8)
+#define AW88399_DSP_VOL_MASK		\
+	(~(((1<<AW88399_DSP_VOL_BITS_LEN)-1) << AW88399_DSP_VOL_START_BIT))
+
+#define AW883XX_DSP_NG_EN_START	(13)
+#define AW883XX_DSP_NG_EN_LEN		(1)
+#define AW883XX_DSP_NG_EN_MASK		\
+	(~(((1 << AW883XX_DSP_NG_EN_LEN) - 1) << AW883XX_DSP_NG_EN_START))
+
+#define AW883XX_DSP_NG_EN_START	(13)
+#define AW883XX_DSP_NG_EN_LEN		(1)
+#define AW883XX_DSP_NG_EN_MASK		\
+	(~(((1 << AW883XX_DSP_NG_EN_LEN) - 1) << AW883XX_DSP_NG_EN_START))
+#define AW883XX_DSP_NG_EN_DISABLE	(0)
+#define AW883XX_DSP_NG_EN_DISABLE_VALUE	\
+	(AW883XX_DSP_NG_EN_DISABLE << AW883XX_DSP_NG_EN_START)
+
 #define AW88399_VOLUME_STEP_DB			(64)
 #define AW88399_VOL_DEFAULT_VALUE		(0)
 #define AW88399_DSP_ODD_NUM_BIT_TEST		(0x5555)
@@ -507,6 +530,22 @@
 #define FADE_TIME_MAX		100000
 #define FADE_TIME_MIN		0
 
+#define AW_CALI_READ_CNT_MAX			(8)
+#define AW88399_DSP_REG_CALRE			(0x8141)
+#define AW88399_DSP_REG_CALRE_SHIFT		(10)
+#define AW_CALI_DATA_SUM_RM			(2)
+
+#define AW88399_DSP_REG_CFG_MBMEC_ACTAMPTH	(0x9B4C)
+#define AW88399_DSP_REG_CFG_MBMEC_NOISEAMPTH	(0x9B4E)
+#define AW88399_DSP_REG_CFG_ADPZ_USTEPN	(0x9B6E)
+#define AW88399_DSP_REG_CFG_RE_ALPHA		(0x9BD4)
+#define AW_GET_IV_CNT_MAX			(6)
+
+#define AW88399_DSP_VOL_MUTE			(0XFF00)
+
+#define AW88399_DSP_LOW_POWER_SWITCH_CFG_ADDR	(0x9BEC)
+#define AW88399_DSP_LOW_POWER_SWITCH_DISABLE	(0x110b)
+
 #define AW88399_PROFILE_EXT(xname, profile_info, profile_get, profile_set) \
 { \
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \

base-commit: 41687a5c6f8b07ad0850d6c46452376d54fe9b65
-- 
2.47.0

