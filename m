Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03912BE023;
	Mon,  7 Jul 2025 13:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895907; cv=none; b=VD8mKa8OpYMP2cpJl7+7Ev7mxoZb88h0bwFRwZOYg6T1D26emMt8evYGm0la5GrNwICmviXoLZDXMpEnhezScxbGkYE0PuYGjhXe/eGW80pW54cW7Tc4OcLvq1PqPeZ64/TWmFC6MuN3z6ZE6tETsfe38s7DLQJ+9LXGJ1jz0Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895907; c=relaxed/simple;
	bh=TDhblROLZEQC/Q5OcMSI0EfzmeJfexlIS4Nx04JPKfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EeHnElELsltJBuV+WFO3lPKMlGd164PMK30PqKllV1jGW2+XPCDk4H8RVizSTf/NtmBWv6qaHVgglPw8TxHNI4YtsymrLf94zsf12AdTITqgHjajf23BmA0U5A/06JYGPPk5HoThC7kwrLWzt4PX4x9ypKiGoh/qzGuaoUpp8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VR8XAZNO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VR8XAZNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751895902;
	bh=TDhblROLZEQC/Q5OcMSI0EfzmeJfexlIS4Nx04JPKfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VR8XAZNOrDUDbjW7DUb55ngkovxyvjXcw6gICNWwrryG8Edw9uCRtijJvJ8KLwr4z
	 1cyye9uWIRaOd79TCDm5KlP5KV+9Dai9ovyuEWQ94Uyyf/ki/iLPHADFwPRylrj5HQ
	 5VcEeFZyPEC5phRZwfQHopo5YEkJ5VifuCu3qz+kg8qIUeLlkvBbaPmVfZvJo/1E+5
	 /oKebhQ2eXsbqiARkJHZd/prxbvGRic81i8n6hhCasIedH1k+ctV3bQozBhWMYQqXJ
	 iGxUR5iiJZFCTiauD2TIp1kV/YE4JcCT7nofw3uO54xDBBBPYyefCZNfEPlAs3J1No
	 y18KP/PY34etg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D04517E090E;
	Mon,  7 Jul 2025 15:45:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 2/8] regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
Date: Mon,  7 Jul 2025 15:44:45 +0200
Message-ID: <20250707134451.154346-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
References: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for the regulators found on all types of the MediaTek
MT6316 SPMI PMIC, fully controlled by SPMI interface and featuring
four step down DCDC (buck) converters.

In particular, this includes support for:
 - MT6316(BP/VP):    2+2 Phase (Phase 1: buck1+2, Phase 2: buck3+4)
 - MT6316(CP/HP/KP): 3+1 Phase (Phase 1: buck1+2+4, Phase 2: buck3)
 - MT6316(DP/TP):    4+0 Phase (Single phase, buck1+2+3+4)

Link: https://lore.kernel.org/r/20250624073548.29732-3-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/Kconfig            |   9 +
 drivers/regulator/Makefile           |   1 +
 drivers/regulator/mt6316-regulator.c | 345 +++++++++++++++++++++++++++
 3 files changed, 355 insertions(+)
 create mode 100644 drivers/regulator/mt6316-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 7423954153b0..81f2acd0f960 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -864,6 +864,15 @@ config REGULATOR_MT6315
 	  This driver supports the control of different power rails of device
 	  through regulator interface.
 
+config REGULATOR_MT6316
+	tristate "MT6316 SPMI PMIC regulator driver"
+	depends on SPMI || COMPILE_TEST
+	help
+          Say Y here to enable support for 2+2, 3+1 and 4 phase regulators
+          found in the MediaTek MT6316 BP, CP, DP, HP, VP and TP SPMI PMICs.
+	  This driver supports the control of different power rails of device
+	  through regulator interface.
+
 config REGULATOR_MT6323
 	tristate "MediaTek MT6323 PMIC"
 	depends on MFD_MT6397
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index be98b29d6675..46c0e75f6107 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
+obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
diff --git a/drivers/regulator/mt6316-regulator.c b/drivers/regulator/mt6316-regulator.c
new file mode 100644
index 000000000000..952852bbe923
--- /dev/null
+++ b/drivers/regulator/mt6316-regulator.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2024 MediaTek Inc.
+// Copyright (c) 2025 Collabora Ltd
+//                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/spmi.h>
+
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+
+#define MT6316_BUCK_MODE_AUTO			0
+#define MT6316_BUCK_MODE_FORCE_PWM		1
+#define MT6316_BUCK_MODE_LP			2
+
+#define MT6316_CHIP_ID				0x20b
+#define MT6316_BUCK_TOP_CON0			0x1440
+#define EN_SET_OFFSET				0x1
+#define EN_CLR_OFFSET				0x2
+
+#define MT6316_BUCK_TOP_CON1			0x1443
+
+#define MT6316_BUCK_TOP_ELR0			0x1448
+#define MT6316_BUCK_TOP_ELR2			0x144a
+#define MT6316_BUCK_TOP_ELR4			0x144c
+#define MT6316_BUCK_TOP_ELR6			0x144e
+#define MT6316_VSEL_MASK			GENMASK(8, 0)
+
+#define MT6316_VBUCK1_DBG			0x14a8
+#define MT6316_VBUCK2_DBG			0x1528
+#define MT6316_VBUCK3_DBG			0x15a8
+#define MT6316_VBUCK4_DBG			0x1628
+#define MT6316_BUCK_QI				BIT(0)
+
+#define MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0	0x1688
+#define MT6316_BUCK_TOP_4PHASE_TOP_ELR_0	0x1690
+
+enum mt6316_type {
+	MT6316_TYPE_2PHASE,
+	MT6316_TYPE_3PHASE,
+	MT6316_TYPE_4PHASE
+};
+
+/**
+ * struct mt6316_regulator_info - MT6316 regulators information
+ * @desc: Regulator description structure
+ * @debug_reg: Debug register for regulator status
+ * @lp_mode_reg: Low Power mode register (normal/idle)
+ * @lp_mode_mask: Low Power mode regulator mask
+ * @modeset_reg: AUTO/PWM mode register
+ * @modeset_mask: AUTO/PWM regulator mask
+ */
+struct mt6316_regulator_info {
+	struct regulator_desc desc;
+	u16 debug_reg;
+	u16 lp_mode_reg;
+	u16 lp_mode_mask;
+	u16 modeset_reg;
+	u16 modeset_mask;
+};
+
+#define MT6316_BUCK(match, vreg_id, min, max, step, vs_reg)		\
+{									\
+	.desc = {							\
+		.name = match,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6316_vreg_setclr_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.owner = THIS_MODULE,					\
+		.n_voltages = (max - min) / step + 1,			\
+		.min_uV = min,						\
+		.uV_step = step,					\
+		.enable_reg = MT6316_BUCK_TOP_CON0,			\
+		.enable_mask = BIT(vreg_id - 1),			\
+		.vsel_reg = vs_reg,					\
+		.vsel_mask = MT6316_VSEL_MASK,				\
+		.of_map_mode = mt6316_map_mode,				\
+	},								\
+	.lp_mode_reg = MT6316_BUCK_TOP_CON1,				\
+	.lp_mode_mask = BIT(vreg_id - 1),				\
+	.modeset_reg = MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0,		\
+	.modeset_mask = BIT(vreg_id - 1),				\
+	.debug_reg = MT6316_VBUCK##vreg_id##_DBG,			\
+}
+
+/* Values in some MT6316 registers are big endian, 9 bits long... */
+static inline u16 mt6316_be9_to_cpu(u16 val)
+{
+	return ((val >> 8) & BIT(0)) | ((val & GENMASK(7, 0)) << 1);
+}
+
+static inline u16 mt6316_cpu_to_be9(u16 val)
+{
+	return ((val & BIT(0)) << 8) | (val >> 1);
+}
+
+static unsigned int mt6316_map_mode(u32 mode)
+{
+	switch (mode) {
+	case MT6316_BUCK_MODE_AUTO:
+		return REGULATOR_MODE_NORMAL;
+	case MT6316_BUCK_MODE_FORCE_PWM:
+		return REGULATOR_MODE_FAST;
+	case MT6316_BUCK_MODE_LP:
+		return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
+static int mt6316_vreg_enable_setclr(struct regulator_dev *rdev)
+{
+	return regmap_write(rdev->regmap, rdev->desc->enable_reg + EN_SET_OFFSET,
+			    rdev->desc->enable_mask);
+}
+
+static int mt6316_vreg_disable_setclr(struct regulator_dev *rdev)
+{
+	return regmap_write(rdev->regmap, rdev->desc->enable_reg + EN_CLR_OFFSET,
+			    rdev->desc->enable_mask);
+}
+
+static int mt6316_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
+{
+	u16 val = mt6316_cpu_to_be9(selector);
+
+	return regmap_bulk_write(rdev->regmap, rdev->desc->vsel_reg, &val, sizeof(val));
+}
+
+static int mt6316_regulator_get_voltage_sel(struct regulator_dev *rdev)
+{
+	u16 val;
+	int ret;
+
+	ret = regmap_bulk_read(rdev->regmap, rdev->desc->vsel_reg, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	return mt6316_be9_to_cpu(val & rdev->desc->vsel_mask);
+}
+
+static int mt6316_regulator_get_status(struct regulator_dev *rdev)
+{
+	struct mt6316_regulator_info *info = rdev_get_drvdata(rdev);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(rdev->regmap, info->debug_reg, &val);
+	if (ret)
+		return ret;
+
+	return val & MT6316_BUCK_QI ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+}
+
+static unsigned int mt6316_regulator_get_mode(struct regulator_dev *rdev)
+{
+	struct mt6316_regulator_info *info = rdev_get_drvdata(rdev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
+	if (ret) {
+		dev_err(&rdev->dev, "Failed to get mode: %d\n", ret);
+		return ret;
+	}
+
+	if ((val & info->modeset_mask) == info->modeset_mask)
+		return REGULATOR_MODE_FAST;
+
+	ret = regmap_read(rdev->regmap, info->lp_mode_reg, &val);
+	val &= info->lp_mode_mask;
+	if (ret) {
+		dev_err(&rdev->dev, "Failed to get lp mode: %d\n", ret);
+		return ret;
+	}
+
+	return val ? REGULATOR_MODE_IDLE : REGULATOR_MODE_NORMAL;
+}
+
+static int mt6316_regulator_set_mode(struct regulator_dev *rdev,
+				     unsigned int mode)
+{
+	struct mt6316_regulator_info *info = rdev_get_drvdata(rdev);
+	struct regmap *regmap = rdev->regmap;
+	int cur_mode, ret;
+
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
+		break;
+	case REGULATOR_MODE_NORMAL:
+		cur_mode = mt6316_regulator_get_mode(rdev);
+		if (cur_mode < 0) {
+			ret = cur_mode;
+			break;
+		}
+
+		if (cur_mode == REGULATOR_MODE_FAST) {
+			ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
+			break;
+		} else if (cur_mode == REGULATOR_MODE_IDLE) {
+			ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
+			if (ret == 0)
+				usleep_range(100, 200);
+		} else {
+			ret = 0;
+		}
+		break;
+	case REGULATOR_MODE_IDLE:
+		ret = regmap_set_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(&rdev->dev, "Failed to set mode %u: %d\n", mode, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct regulator_ops mt6316_vreg_setclr_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.map_voltage = regulator_map_voltage_linear,
+	.set_voltage_sel = mt6316_regulator_set_voltage_sel,
+	.get_voltage_sel = mt6316_regulator_get_voltage_sel,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = mt6316_vreg_enable_setclr,
+	.disable = mt6316_vreg_disable_setclr,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6316_regulator_get_status,
+	.set_mode = mt6316_regulator_set_mode,
+	.get_mode = mt6316_regulator_get_mode,
+};
+
+/* MT6316BP/VP - 2+2 phase buck */
+static struct mt6316_regulator_info mt6316bv_regulators[] = {
+	MT6316_BUCK("vbuck12", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0),
+	MT6316_BUCK("vbuck34", 3, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR4),
+};
+
+/* MT6316CP/HP/KP - 3+1 phase buck */
+static struct mt6316_regulator_info mt6316chk_regulators[] = {
+	MT6316_BUCK("vbuck124", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0),
+	MT6316_BUCK("vbuck3", 3, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR4),
+};
+
+/* MT6316DP/TP - 4 phase buck */
+static struct mt6316_regulator_info mt6316dt_regulators[] = {
+	MT6316_BUCK("vbuck1234", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0),
+};
+
+static const struct regmap_config mt6316_spmi_regmap_config = {
+	.reg_bits	= 16,
+	.val_bits	= 8,
+	.max_register	= 0x1700,
+	.fast_io	= true,
+};
+
+static int mt6316_regulator_probe(struct spmi_device *sdev)
+{
+	struct regulator_config config = {};
+	struct mt6316_regulator_info *info;
+	struct regulator_dev *rdev;
+	enum mt6316_type type;
+	int num_vregs, ret;
+	unsigned int i;
+	u32 chip_id;
+
+	config.regmap = devm_regmap_init_spmi_ext(sdev, &mt6316_spmi_regmap_config);
+	if (IS_ERR(config.regmap))
+		return PTR_ERR(config.regmap);
+
+	/*
+	 * The first read is expected to fail: this PMIC needs to be woken up
+	 * and that can be done with any activity over the SPMI bus.
+	 */
+	regmap_read(config.regmap, MT6316_CHIP_ID, &chip_id);
+
+	/* The second read, instead, shall not fail! */
+	ret = regmap_read(config.regmap, MT6316_CHIP_ID, &chip_id);
+	if (ret) {
+		dev_err(&sdev->dev, "Cannot read Chip ID!\n");
+		return ret;
+	}
+	dev_dbg(&sdev->dev, "Chip ID: 0x%x\n", chip_id);
+
+	config.dev = &sdev->dev;
+
+	type = (uintptr_t)device_get_match_data(&sdev->dev);
+	switch (type) {
+	case MT6316_TYPE_2PHASE:
+		info = mt6316bv_regulators;
+		num_vregs = ARRAY_SIZE(mt6316bv_regulators);
+		break;
+	case MT6316_TYPE_3PHASE:
+		info = mt6316chk_regulators;
+		num_vregs = ARRAY_SIZE(mt6316chk_regulators);
+		break;
+	case MT6316_TYPE_4PHASE:
+		info = mt6316dt_regulators;
+		num_vregs = ARRAY_SIZE(mt6316dt_regulators);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_vregs; i++) {
+		config.driver_data = &info[i];
+
+		rdev = devm_regulator_register(&sdev->dev, &info[i].desc, &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(&sdev->dev, PTR_ERR(rdev),
+					     "failed to register %s\n", info[i].desc.name);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id mt6316_regulator_match[] = {
+	{ .compatible = "mediatek,mt6316b-regulator", .data = (void *)MT6316_TYPE_2PHASE },
+	{ .compatible = "mediatek,mt6316c-regulator", .data = (void *)MT6316_TYPE_3PHASE },
+	{ .compatible = "mediatek,mt6316d-regulator", .data = (void *)MT6316_TYPE_4PHASE },
+	{ /* sentinel */ }
+};
+
+static struct spmi_driver mt6316_regulator_driver = {
+	.driver = {
+		.name = "mt6316-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = mt6316_regulator_match,
+	},
+	.probe = mt6316_regulator_probe,
+};
+module_spmi_driver(mt6316_regulator_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6316 PMIC");
+MODULE_LICENSE("GPL");
-- 
2.49.0

