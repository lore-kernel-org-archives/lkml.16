Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F619F120
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 04:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746593928; cv=none; b=rR+353nOxbMt2oWoeQI2IHdSVR2pgLAEPJJpAgVoRQtW/lVn8qXd9OGwfxxNhx8GB+mLep+8IugBGSVHOSYWDxCH4X6zEzAxnhjtP9MQJjrSsQnHGmScwYQYAUT0lB3ju6QM9auZbgPrR7ELKDTfkVhNGh8048yp03jHOSXfxVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746593928; c=relaxed/simple;
	bh=pzgtFbjZON84SEGtuanQhnWeC6jG6k3/9yY2gWN1TUg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iQXWumjjfFJxrRYyUC/yVaYZaGx3rtnvuanueu4yx5ccdMYw6hMnAXtcUhnccsYF+FwbzgITOrH0IdXufkRR/4FTsd2oVlNWU0f4sHKW92mgqclNYWNyj6kpo0eV+xmY/IuLFgCSJ+ZpraCeYAbPaYqvC+7HDDXCB/iuy56RP9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VDZFVckz; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VDZFVckz"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5474wLUw1411396
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 23:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746593901;
	bh=3ph+zW/HhZzU0ILeetbcWx03PBH2LJRC/8Epaxttqf0=;
	h=From:To:CC:Subject:Date;
	b=VDZFVckzkm6cz/MaEpf/7TrWBkCiw093f+M4PB3QkafbUa1dyudH5AqptyZLIrJE0
	 ifpbHfmtQtsOHuwBKxSJzSCqcY4foHNHTIcdJpr0dqg7TCViWgTumpnYmMQVVJdy+o
	 Gbug0oledBHWXQ9QLhCd45/KkmbCSGbQtNUH1/v0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5474wLjJ054783
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 23:58:21 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 23:58:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 23:58:21 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com [10.85.15.5])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5474wGv9098750;
	Tue, 6 May 2025 23:58:17 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <robinchen@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver
Date: Wed, 7 May 2025 12:58:13 +0800
Message-ID: <20250507045813.151-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Some common parts, such as struct tas2781_hda{...} and some audio
kcontrols are moved into an independent lib for code cleanup.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Define a shared struct tas2781_hda{...} for both SPI and I2C HDA driver.
 - Move the different part, such as sound controls, into tas2781_hda::priv.
 - remove the unused dacpi in struct tas2781_hda{...} for SPI driver.
 - Move tas2781_hda_remove to the tas2781-hda-lib.
 - Optimize the kcontrols creation in SPI driver, remove the unnecessary
   kcotnrols
---
 sound/pci/hda/Kconfig           |   7 +
 sound/pci/hda/Makefile          |   2 +
 sound/pci/hda/tas2781_hda.c     | 198 +++++++++++++++
 sound/pci/hda/tas2781_hda.h     |  31 +++
 sound/pci/hda/tas2781_hda_i2c.c | 214 ++---------------
 sound/pci/hda/tas2781_hda_spi.c | 410 ++++++++++++--------------------
 6 files changed, 405 insertions(+), 457 deletions(-)
 create mode 100644 sound/pci/hda/tas2781_hda.c

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index d5b29b5eb1f6..339c80d2cce5 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -180,12 +180,17 @@ config SND_HDA_SCODEC_CS35L56_SPI
 	  Say Y or M here to include CS35L56 amplifier support with
 	  SPI control.
 
+config SND_HDA_SCODEC_TAS2781
+	tristate
+	select SND_HDA_GENERIC
+
 config SND_HDA_SCODEC_TAS2781_I2C
 	tristate "Build TAS2781 HD-audio side codec support for I2C Bus"
 	depends on I2C
 	depends on ACPI
 	depends on EFI
 	depends on SND_SOC
+	select SND_HDA_SCODEC_TAS2781
 	select SND_SOC_TAS2781_COMLIB_I2C
 	select SND_SOC_TAS2781_FMWLIB
 	select CRC32
@@ -202,6 +207,8 @@ config SND_HDA_SCODEC_TAS2781_SPI
 	depends on ACPI
 	depends on EFI
 	depends on SND_SOC
+	select SND_HDA_SCODEC_TAS2781
+	select SND_SOC_TAS2781_COMLIB
 	select SND_SOC_TAS2781_FMWLIB
 	select CRC8
 	select CRC32
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index 13d6c7e63203..5adff1cab101 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -38,6 +38,7 @@ snd-hda-scodec-cs35l56-y :=	cs35l56_hda.o
 snd-hda-scodec-cs35l56-i2c-y :=	cs35l56_hda_i2c.o
 snd-hda-scodec-cs35l56-spi-y :=	cs35l56_hda_spi.o
 snd-hda-scodec-component-y :=	hda_component.o
+snd-hda-scodec-tas2781-y :=	tas2781_hda.o
 snd-hda-scodec-tas2781-i2c-y :=	tas2781_hda_i2c.o
 snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o
 
@@ -70,6 +71,7 @@ obj-$(CONFIG_SND_HDA_SCODEC_CS35L56) += snd-hda-scodec-cs35l56.o
 obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_I2C) += snd-hda-scodec-cs35l56-i2c.o
 obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_SPI) += snd-hda-scodec-cs35l56-spi.o
 obj-$(CONFIG_SND_HDA_SCODEC_COMPONENT) += snd-hda-scodec-component.o
+obj-$(CONFIG_SND_HDA_SCODEC_TAS2781) += snd-hda-scodec-tas2781.o
 obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_I2C) += snd-hda-scodec-tas2781-i2c.o
 obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
 
diff --git a/sound/pci/hda/tas2781_hda.c b/sound/pci/hda/tas2781_hda.c
new file mode 100644
index 000000000000..9d8e0d938d5a
--- /dev/null
+++ b/sound/pci/hda/tas2781_hda.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// TAS2781 HDA Shared Lib for I2C&SPI driver
+//
+// Copyright 2025 Texas Instruments, Inc.
+//
+// Author: Shenghao Ding <shenghao-ding@ti.com>
+
+#include <linux/component.h>
+#include <linux/crc8.h>
+#include <linux/crc32.h>
+#include <linux/efi.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/pm_runtime.h>
+#include <sound/soc.h>
+#include <sound/tas2781.h>
+
+#include "tas2781_hda.h"
+
+void tas2781_hda_remove(struct device *dev,
+	const struct component_ops *ops)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+
+	component_del(tas_hda->dev, ops);
+
+	pm_runtime_get_sync(tas_hda->dev);
+	pm_runtime_disable(tas_hda->dev);
+
+	pm_runtime_put_noidle(tas_hda->dev);
+
+	tasdevice_remove(tas_hda->priv);
+}
+EXPORT_SYMBOL_NS_GPL(tas2781_hda_remove, "SND_HDA_SCODEC_TAS2781");
+
+int tasdevice_info_profile(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_info *uinfo)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->rcabin.ncfgs - 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tasdevice_info_profile, "SND_HDA_SCODEC_TAS2781");
+
+int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->fmw->nr_programs - 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tasdevice_info_programs, "SND_HDA_SCODEC_TAS2781");
+
+int tasdevice_info_config(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_fw *tas_fw = tas_priv->fmw;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_fw->nr_configurations - 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tasdevice_info_config, "SND_HDA_SCODEC_TAS2781");
+
+int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
+
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n", __func__,
+		kcontrol->id.name, tas_priv->rcabin.profile_cfg_id);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tasdevice_get_profile_id, "SND_HDA_SCODEC_TAS2781");
+
+int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	int profile_id = ucontrol->value.integer.value[0];
+	int max = tas_priv->rcabin.ncfgs - 1;
+	int val, ret = 0;
+
+	val = clamp(profile_id, 0, max);
+
+	guard(mutex)(&tas_priv->codec_lock);
+
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n", __func__,
+		kcontrol->id.name, tas_priv->rcabin.profile_cfg_id, val);
+
+	if (tas_priv->rcabin.profile_cfg_id != val) {
+		tas_priv->rcabin.profile_cfg_id = val;
+		ret = 1;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(tasdevice_set_profile_id, "SND_HDA_SCODEC_TAS2781");
+
+int tasdevice_program_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
+
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n", __func__,
+		kcontrol->id.name, tas_priv->cur_prog);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tasdevice_program_get, "SND_HDA_SCODEC_TAS2781");
+
+int tasdevice_program_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_fw *tas_fw = tas_priv->fmw;
+	int nr_program = ucontrol->value.integer.value[0];
+	int max = tas_fw->nr_programs - 1;
+	int val, ret = 0;
+
+	val = clamp(nr_program, 0, max);
+
+	guard(mutex)(&tas_priv->codec_lock);
+
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n", __func__,
+		kcontrol->id.name, tas_priv->cur_prog, val);
+
+	if (tas_priv->cur_prog != val) {
+		tas_priv->cur_prog = val;
+		ret = 1;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(tasdevice_program_put, "SND_HDA_SCODEC_TAS2781");
+
+int tasdevice_config_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
+
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n", __func__,
+		kcontrol->id.name, tas_priv->cur_conf);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tasdevice_config_get, "SND_HDA_SCODEC_TAS2781");
+
+int tasdevice_config_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_fw *tas_fw = tas_priv->fmw;
+	int nr_config = ucontrol->value.integer.value[0];
+	int max = tas_fw->nr_configurations - 1;
+	int val, ret = 0;
+
+	val = clamp(nr_config, 0, max);
+
+	guard(mutex)(&tas_priv->codec_lock);
+
+	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n", __func__,
+		kcontrol->id.name, tas_priv->cur_conf, val);
+
+	if (tas_priv->cur_conf != val) {
+		tas_priv->cur_conf = val;
+		ret = 1;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(tasdevice_config_put, "SND_HDA_SCODEC_TAS2781");
+
+MODULE_DESCRIPTION("TAS2781 HDA Driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");
diff --git a/sound/pci/hda/tas2781_hda.h b/sound/pci/hda/tas2781_hda.h
index 444231f87e53..95229083ce6a 100644
--- a/sound/pci/hda/tas2781_hda.h
+++ b/sound/pci/hda/tas2781_hda.h
@@ -44,4 +44,35 @@
 	.private_value = xdata, \
 }
 
+struct tas2781_hda {
+	struct device *dev;
+	struct tasdevice_priv *priv;
+	struct snd_kcontrol *dsp_prog_ctl;
+	struct snd_kcontrol *dsp_conf_ctl;
+	struct snd_kcontrol *prof_ctl;
+	enum device_catlog_id catlog_id;
+	void *hda_priv;
+};
+
+void tas2781_hda_remove(struct device *dev,
+	const struct component_ops *ops);
+int tasdevice_info_profile(struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_info *uctl);
+int tasdevice_info_programs(struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_info *uctl);
+int tasdevice_info_config(struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_info *uctl);
+int tasdevice_set_profile_id(struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_value *uctl);
+int tasdevice_get_profile_id(struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_value *uctl);
+int tasdevice_program_get(struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_value *uctl);
+int tasdevice_program_put(struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_value *uctl);
+int tasdevice_config_put(struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_value *uctl);
+int tasdevice_config_get(struct snd_kcontrol *kctl,
+	struct snd_ctl_elem_value *uctl);
+
 #endif
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0a686e850540..0e51b07dbd05 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -51,12 +51,7 @@ static unsigned int cal_regs[TASDEV_CALIB_N] = {
 	TAS2563_CAL_R0_LOW, TAS2563_CAL_TLIM,
 };
 
-struct tas2781_hda {
-	struct device *dev;
-	struct tasdevice_priv *priv;
-	struct snd_kcontrol *dsp_prog_ctl;
-	struct snd_kcontrol *dsp_conf_ctl;
-	struct snd_kcontrol *prof_ctl;
+struct tas2781_hda_i2c_priv {
 	struct snd_kcontrol *snd_ctls[2];
 };
 
@@ -175,176 +170,6 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 	}
 }
 
-static int tasdevice_info_profile(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_info *uinfo)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = tas_priv->rcabin.ncfgs - 1;
-
-	return 0;
-}
-
-static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	mutex_lock(&tas_priv->codec_lock);
-
-	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
-
-	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n",
-		__func__, kcontrol->id.name, tas_priv->rcabin.profile_cfg_id);
-
-	mutex_unlock(&tas_priv->codec_lock);
-
-	return 0;
-}
-
-static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	int nr_profile = ucontrol->value.integer.value[0];
-	int max = tas_priv->rcabin.ncfgs - 1;
-	int val, ret = 0;
-
-	val = clamp(nr_profile, 0, max);
-
-	mutex_lock(&tas_priv->codec_lock);
-
-	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n",
-		__func__, kcontrol->id.name,
-		tas_priv->rcabin.profile_cfg_id, val);
-
-	if (tas_priv->rcabin.profile_cfg_id != val) {
-		tas_priv->rcabin.profile_cfg_id = val;
-		ret = 1;
-	}
-
-	mutex_unlock(&tas_priv->codec_lock);
-
-	return ret;
-}
-
-static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_info *uinfo)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	struct tasdevice_fw *tas_fw = tas_priv->fmw;
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = tas_fw->nr_programs - 1;
-
-	return 0;
-}
-
-static int tasdevice_info_config(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_info *uinfo)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	struct tasdevice_fw *tas_fw = tas_priv->fmw;
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = tas_fw->nr_configurations - 1;
-
-	return 0;
-}
-
-static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	mutex_lock(&tas_priv->codec_lock);
-
-	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
-
-	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n",
-		__func__, kcontrol->id.name, tas_priv->cur_prog);
-
-	mutex_unlock(&tas_priv->codec_lock);
-
-	return 0;
-}
-
-static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	struct tasdevice_fw *tas_fw = tas_priv->fmw;
-	int nr_program = ucontrol->value.integer.value[0];
-	int max = tas_fw->nr_programs - 1;
-	int val, ret = 0;
-
-	val = clamp(nr_program, 0, max);
-
-	mutex_lock(&tas_priv->codec_lock);
-
-	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n",
-		__func__, kcontrol->id.name, tas_priv->cur_prog, val);
-
-	if (tas_priv->cur_prog != val) {
-		tas_priv->cur_prog = val;
-		ret = 1;
-	}
-
-	mutex_unlock(&tas_priv->codec_lock);
-
-	return ret;
-}
-
-static int tasdevice_config_get(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	mutex_lock(&tas_priv->codec_lock);
-
-	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
-
-	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n",
-		__func__, kcontrol->id.name, tas_priv->cur_conf);
-
-	mutex_unlock(&tas_priv->codec_lock);
-
-	return 0;
-}
-
-static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	struct tasdevice_fw *tas_fw = tas_priv->fmw;
-	int nr_config = ucontrol->value.integer.value[0];
-	int max = tas_fw->nr_configurations - 1;
-	int val, ret = 0;
-
-	val = clamp(nr_config, 0, max);
-
-	mutex_lock(&tas_priv->codec_lock);
-
-	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n",
-		__func__, kcontrol->id.name, tas_priv->cur_conf, val);
-
-	if (tas_priv->cur_conf != val) {
-		tas_priv->cur_conf = val;
-		ret = 1;
-	}
-
-	mutex_unlock(&tas_priv->codec_lock);
-
-	return ret;
-}
-
 static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -615,13 +440,14 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 
 static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
 {
+	struct tas2781_hda_i2c_priv *hda_priv = tas_hda->hda_priv;
 	struct hda_codec *codec = tas_hda->priv->codec;
 
 	snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
 	snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
 
-	for (int i = ARRAY_SIZE(tas_hda->snd_ctls) - 1; i >= 0; i--)
-		snd_ctl_remove(codec->card, tas_hda->snd_ctls[i]);
+	for (int i = ARRAY_SIZE(hda_priv->snd_ctls) - 1; i >= 0; i--)
+		snd_ctl_remove(codec->card, hda_priv->snd_ctls[i]);
 
 	snd_ctl_remove(codec->card, tas_hda->prof_ctl);
 }
@@ -630,6 +456,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 {
 	struct tasdevice_priv *tas_priv = context;
 	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
+	struct tas2781_hda_i2c_priv *hda_priv = tas_hda->hda_priv;
 	struct hda_codec *codec = tas_priv->codec;
 	int i, ret, spk_id;
 
@@ -650,9 +477,9 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tas2781_snd_controls); i++) {
-		tas_hda->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_controls[i],
+		hda_priv->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_controls[i],
 			tas_priv);
-		ret = snd_ctl_add(codec->card, tas_hda->snd_ctls[i]);
+		ret = snd_ctl_add(codec->card, hda_priv->snd_ctls[i]);
 		if (ret) {
 			dev_err(tas_priv->dev,
 				"Failed to add KControl %s = %d\n",
@@ -805,31 +632,23 @@ static const struct component_ops tas2781_hda_comp_ops = {
 	.unbind = tas2781_hda_unbind,
 };
 
-static void tas2781_hda_remove(struct device *dev)
-{
-	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
-
-	component_del(tas_hda->dev, &tas2781_hda_comp_ops);
-
-	pm_runtime_get_sync(tas_hda->dev);
-	pm_runtime_disable(tas_hda->dev);
-
-	pm_runtime_put_noidle(tas_hda->dev);
-
-	tasdevice_remove(tas_hda->priv);
-}
-
 static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 {
+	struct tas2781_hda_i2c_priv *hda_priv;
 	struct tas2781_hda *tas_hda;
 	const char *device_name;
 	int ret;
 
-
 	tas_hda = devm_kzalloc(&clt->dev, sizeof(*tas_hda), GFP_KERNEL);
 	if (!tas_hda)
 		return -ENOMEM;
 
+	hda_priv = devm_kzalloc(&clt->dev, sizeof(*hda_priv), GFP_KERNEL);
+	if (!hda_priv)
+		return -ENOMEM;
+
+	tas_hda->hda_priv = hda_priv;
+
 	dev_set_drvdata(&clt->dev, tas_hda);
 	tas_hda->dev = &clt->dev;
 
@@ -876,13 +695,13 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 
 err:
 	if (ret)
-		tas2781_hda_remove(&clt->dev);
+		tas2781_hda_remove(&clt->dev, &tas2781_hda_comp_ops);
 	return ret;
 }
 
 static void tas2781_hda_i2c_remove(struct i2c_client *clt)
 {
-	tas2781_hda_remove(&clt->dev);
+	tas2781_hda_remove(&clt->dev, &tas2781_hda_comp_ops);
 }
 
 static int tas2781_runtime_suspend(struct device *dev)
@@ -1010,3 +829,4 @@ MODULE_DESCRIPTION("TAS2781 HDA Driver");
 MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("SND_SOC_TAS2781_FMWLIB");
+MODULE_IMPORT_NS("SND_HDA_SCODEC_TAS2781");
diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index 426fc6044c65..50b82ecabb90 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -49,13 +49,8 @@
 #define TAS2781_REG_CLK_CONFIG		TASDEVICE_REG(0x0, 0x0, 0x5c)
 #define TAS2781_REG_CLK_CONFIG_RESET	0x19
 
-struct tas2781_hda {
-	struct tasdevice_priv *priv;
-	struct acpi_device *dacpi;
-	struct snd_kcontrol *dsp_prog_ctl;
-	struct snd_kcontrol *dsp_conf_ctl;
+struct tas2781_hda_spi_priv {
 	struct snd_kcontrol *snd_ctls[3];
-	struct snd_kcontrol *prof_ctl;
 };
 
 static const struct regmap_range_cfg tasdevice_ranges[] = {
@@ -193,8 +188,10 @@ static void tas2781_spi_reset(struct tasdevice_priv *tas_dev)
 	} else {
 		ret = tasdevice_dev_write(tas_dev, tas_dev->index,
 			TASDEVICE_REG_SWRESET, TASDEVICE_REG_SWRESET_RESET);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(tas_dev->dev, "dev sw-reset fail, %d\n", ret);
+			return;
+		}
 		fsleep(1000);
 	}
 }
@@ -323,8 +320,7 @@ static int tasdevice_spi_digital_getvol(struct tasdevice_priv *p,
 }
 
 static int tas2781_read_acpi(struct tas2781_hda *tas_hda,
-			     const char *hid,
-			     int id)
+	const char *hid, int id)
 {
 	struct tasdevice_priv *p = tas_hda->priv;
 	struct acpi_device *adev;
@@ -341,7 +337,6 @@ static int tas2781_read_acpi(struct tas2781_hda *tas_hda,
 	}
 
 	strscpy(p->dev_name, hid, sizeof(p->dev_name));
-	tas_hda->dacpi = adev;
 	physdev = get_device(acpi_get_first_physical_node(adev));
 	acpi_dev_put(adev);
 
@@ -410,126 +405,6 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 	}
 }
 
-static int tasdevice_info_profile(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_info *uinfo)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = tas_priv->rcabin.ncfgs - 1;
-
-	return 0;
-}
-
-static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
-
-	return 0;
-}
-
-static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
-				    struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	int max = tas_priv->rcabin.ncfgs - 1;
-	int val;
-
-	val = clamp(ucontrol->value.integer.value[0], 0, max);
-	if (tas_priv->rcabin.profile_cfg_id != val) {
-		tas_priv->rcabin.profile_cfg_id = val;
-		return 1;
-	}
-
-	return 0;
-}
-
-static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_info *uinfo)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = tas_priv->fmw->nr_programs - 1;
-
-	return 0;
-}
-
-static int tasdevice_info_config(struct snd_kcontrol *kcontrol,
-				 struct snd_ctl_elem_info *uinfo)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = tas_priv->fmw->nr_configurations - 1;
-
-	return 0;
-}
-
-static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
-				 struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
-
-	return 0;
-}
-
-static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
-				 struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	int nr_program = ucontrol->value.integer.value[0];
-	int max = tas_priv->fmw->nr_programs - 1;
-	int val;
-
-	val = clamp(nr_program, 0, max);
-
-	if (tas_priv->cur_prog != val) {
-		tas_priv->cur_prog = val;
-		return 1;
-	}
-
-	return 0;
-}
-
-static int tasdevice_config_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-
-	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
-
-	return 0;
-}
-
-static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
-	int max = tas_priv->fmw->nr_configurations - 1;
-	int val;
-
-	val = clamp(ucontrol->value.integer.value[0], 0, max);
-
-	if (tas_priv->cur_conf != val) {
-		tas_priv->cur_conf = val;
-		return 1;
-	}
-
-	return 0;
-}
-
 /*
  * tas2781_digital_getvol - get the volum control
  * @kcontrol: control pointer
@@ -618,73 +493,37 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-static const struct snd_kcontrol_new tas2781_snd_controls[] = {
-	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain 0", TAS2781_AMP_LEVEL,
-		1, 0, 20, 0, tas2781_amp_getvol,
-		tas2781_amp_putvol, amp_vol_tlv),
-	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain 0", TAS2781_DVC_LVL,
-		0, 0, 200, 1, tas2781_digital_getvol,
-		tas2781_digital_putvol, dvc_tlv),
-	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load 0", 0,
-		tas2781_force_fwload_get, tas2781_force_fwload_put),
-	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain 1", TAS2781_AMP_LEVEL,
-		1, 0, 20, 0, tas2781_amp_getvol,
-		tas2781_amp_putvol, amp_vol_tlv),
-	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain 1", TAS2781_DVC_LVL,
-		0, 0, 200, 1, tas2781_digital_getvol,
-		tas2781_digital_putvol, dvc_tlv),
-	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load 1", 0,
-		tas2781_force_fwload_get, tas2781_force_fwload_put),
+struct snd_kcontrol_new tas2781_snd_ctls[] = {
+	ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_AMP_LEVEL, 1, 0, 20, 0,
+		tas2781_amp_getvol, tas2781_amp_putvol, amp_vol_tlv),
+	ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_DVC_LVL, 0, 0, 200, 1,
+		tas2781_digital_getvol, tas2781_digital_putvol, dvc_tlv),
+	ACARD_SINGLE_BOOL_EXT(NULL, 0, tas2781_force_fwload_get,
+		tas2781_force_fwload_put),
 };
 
-static const struct snd_kcontrol_new tas2781_prof_ctrl[] = {
-{
-	.name = "Speaker Profile Id - 0",
+struct snd_kcontrol_new tas2781_prof_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
 	.info = tasdevice_info_profile,
 	.get = tasdevice_get_profile_id,
 	.put = tasdevice_set_profile_id,
-},
-{
-	.name = "Speaker Profile Id - 1",
-	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
-	.info = tasdevice_info_profile,
-	.get = tasdevice_get_profile_id,
-	.put = tasdevice_set_profile_id,
-},
-};
-static const struct snd_kcontrol_new tas2781_dsp_prog_ctrl[] = {
-{
-	.name = "Speaker Program Id 0",
-	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
-	.info = tasdevice_info_programs,
-	.get = tasdevice_program_get,
-	.put = tasdevice_program_put,
-},
-{
-	.name = "Speaker Program Id 1",
-	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
-	.info = tasdevice_info_programs,
-	.get = tasdevice_program_get,
-	.put = tasdevice_program_put,
-},
 };
 
-static const struct snd_kcontrol_new tas2781_dsp_conf_ctrl[] = {
-{
-	.name = "Speaker Config Id 0",
-	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
-	.info = tasdevice_info_config,
-	.get = tasdevice_config_get,
-	.put = tasdevice_config_put,
-},
-{
-	.name = "Speaker Config Id 1",
-	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
-	.info = tasdevice_info_config,
-	.get = tasdevice_config_get,
-	.put = tasdevice_config_put,
-},
+struct snd_kcontrol_new tas2781_dsp_ctls[] = {
+	/* Speaker Program */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.info = tasdevice_info_programs,
+		.get = tasdevice_program_get,
+		.put = tasdevice_program_put,
+	},
+	/* Speaker Config */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.info = tasdevice_info_config,
+		.get = tasdevice_config_get,
+		.put = tasdevice_config_put,
+	},
 };
 
 static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
@@ -853,23 +692,111 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
 {
 	struct hda_codec *codec = tas_hda->priv->codec;
+	struct tas2781_hda_spi_priv *h_priv = tas_hda->hda_priv;
 
 	snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
 
 	snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
 
-	for (int i = ARRAY_SIZE(tas_hda->snd_ctls) - 1; i >= 0; i--)
-		snd_ctl_remove(codec->card, tas_hda->snd_ctls[i]);
+	for (int i = ARRAY_SIZE(h_priv->snd_ctls) - 1; i >= 0; i--)
+		snd_ctl_remove(codec->card, h_priv->snd_ctls[i]);
 
 	snd_ctl_remove(codec->card, tas_hda->prof_ctl);
 }
 
+static int tas2781_hda_spi_prf_ctl(struct tas2781_hda *h)
+{
+	struct tasdevice_priv *p = h->priv;
+	struct hda_codec *c = p->codec;
+	char name[64];
+	int rc;
+
+	snprintf(name, sizeof(name), "Speaker-%d Profile Id", p->index);
+	tas2781_prof_ctl.name = name;
+	h->prof_ctl = snd_ctl_new1(&tas2781_prof_ctl, p);
+	rc = snd_ctl_add(c->card, h->prof_ctl);
+	if (rc)
+		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
+			tas2781_prof_ctl.name, rc);
+	return rc;
+}
+
+static int tas2781_hda_spi_snd_ctls(struct tas2781_hda *h)
+{
+	struct tas2781_hda_spi_priv *h_priv = h->hda_priv;
+	struct tasdevice_priv *p = h->priv;
+	struct hda_codec *c = p->codec;
+	char name[64];
+	int i = 0;
+	int rc;
+
+	snprintf(name, sizeof(name), "Speaker-%d Analog Volume", p->index);
+	tas2781_snd_ctls[i].name = name;
+	h_priv->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_ctls[i], p);
+	rc = snd_ctl_add(c->card, h_priv->snd_ctls[i]);
+	if (rc) {
+		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
+			tas2781_snd_ctls[i].name, rc);
+		return rc;
+	}
+	i++;
+	snprintf(name, sizeof(name), "Speaker-%d Digital Volume", p->index);
+	tas2781_snd_ctls[i].name = name;
+	h_priv->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_ctls[i], p);
+	rc = snd_ctl_add(c->card, h_priv->snd_ctls[i]);
+	if (rc) {
+		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
+			tas2781_snd_ctls[i].name, rc);
+		return rc;
+	}
+	i++;
+	snprintf(name, sizeof(name), "Froce Speaker-%d FW Load", p->index);
+	tas2781_snd_ctls[i].name = name;
+	h_priv->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_ctls[i], p);
+	rc = snd_ctl_add(c->card, h_priv->snd_ctls[i]);
+	if (rc) {
+		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
+			tas2781_snd_ctls[i].name, rc);
+	}
+	return rc;
+}
+
+static int tas2781_hda_spi_dsp_ctls(struct tas2781_hda *h)
+{
+	struct tasdevice_priv *p = h->priv;
+	struct hda_codec *c = p->codec;
+	char name[64];
+	int i = 0;
+	int rc;
+
+	snprintf(name, sizeof(name), "Speaker-%d Program Id", p->index);
+	tas2781_dsp_ctls[i].name = name;
+	h->dsp_prog_ctl = snd_ctl_new1(&tas2781_dsp_ctls[i], p);
+	rc = snd_ctl_add(c->card, h->dsp_prog_ctl);
+	if (rc) {
+		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
+			tas2781_dsp_ctls[i].name, rc);
+		return rc;
+	}
+	i++;
+	snprintf(name, sizeof(name), "Speaker-%d Config Id", p->index);
+	tas2781_dsp_ctls[i].name = name;
+	h->dsp_conf_ctl = snd_ctl_new1(&tas2781_dsp_ctls[i], p);
+	rc = snd_ctl_add(c->card, h->dsp_conf_ctl);
+	if (rc) {
+		dev_err(p->dev, "Failed to add KControl: %s, rc = %d\n",
+			tas2781_dsp_ctls[i].name, rc);
+	}
+
+	return rc;
+}
+
 static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 {
 	struct tasdevice_priv *tas_priv = context;
 	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
 	struct hda_codec *codec = tas_priv->codec;
-	int i, j, ret, val;
+	int ret, val;
 
 	pm_runtime_get_sync(tas_priv->dev);
 	guard(mutex)(&tas_priv->codec_lock);
@@ -879,33 +806,19 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 
 	/* Add control one time only. */
-	tas_hda->prof_ctl = snd_ctl_new1(&tas2781_prof_ctrl[tas_priv->index],
-		tas_priv);
-	ret = snd_ctl_add(codec->card, tas_hda->prof_ctl);
-	if (ret) {
-		dev_err(tas_priv->dev, "Failed to add KControl %s = %d\n",
-			tas2781_prof_ctrl[tas_priv->index].name, ret);
+	ret = tas2781_hda_spi_prf_ctl(tas_hda);
+	if (ret)
+		goto out;
+
+	ret = tas2781_hda_spi_snd_ctls(tas_hda);
+	if (ret)
 		goto out;
-	}
-	j = tas_priv->index * ARRAY_SIZE(tas2781_snd_controls) / 2;
-	for (i = 0; i < 3; i++) {
-		tas_hda->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_controls[i+j],
-			tas_priv);
-		ret = snd_ctl_add(codec->card, tas_hda->snd_ctls[i]);
-		if (ret) {
-			dev_err(tas_priv->dev,
-				"Failed to add KControl %s = %d\n",
-				tas2781_snd_controls[i+tas_priv->index*3].name,
-				ret);
-			goto out;
-		}
-	}
 
 	tasdevice_dsp_remove(tas_priv);
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
-	scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%08X-%01d.bin",
-		codec->core.subsystem_id, tas_priv->index);
+	scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X-%01d.bin",
+		lower_16_bits(codec->core.subsystem_id), tas_priv->index);
 	ret = tasdevice_dsp_parser(tas_priv);
 	if (ret) {
 		dev_err(tas_priv->dev, "dspfw load %s error\n",
@@ -914,33 +827,15 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
-	/* Add control one time only. */
-	tas_hda->dsp_prog_ctl =
-		snd_ctl_new1(&tas2781_dsp_prog_ctrl[tas_priv->index],
-			     tas_priv);
-	ret = snd_ctl_add(codec->card, tas_hda->dsp_prog_ctl);
-	if (ret) {
-		dev_err(tas_priv->dev,
-			"Failed to add KControl %s = %d\n",
-			tas2781_dsp_prog_ctrl[tas_priv->index].name, ret);
-		goto out;
-	}
-
-	tas_hda->dsp_conf_ctl =
-		snd_ctl_new1(&tas2781_dsp_conf_ctrl[tas_priv->index],
-			     tas_priv);
-	ret = snd_ctl_add(codec->card, tas_hda->dsp_conf_ctl);
-	if (ret) {
-		dev_err(tas_priv->dev, "Failed to add KControl %s = %d\n",
-			tas2781_dsp_conf_ctrl[tas_priv->index].name, ret);
+	ret = tas2781_hda_spi_dsp_ctls(tas_hda);
+	if (ret)
 		goto out;
-	}
-
+	/* Perform AMP reset before firmware download. */
 	tas2781_spi_reset(tas_priv);
 	tas_priv->rcabin.profile_cfg_id = 0;
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
-	ret = tas_priv->dev_read(tas_priv, tas_priv->index,
+	ret = tasdevice_spi_dev_read(tas_priv, tas_priv->index,
 		TAS2781_REG_CLK_CONFIG, &val);
 	if (ret < 0)
 		goto out;
@@ -952,6 +847,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 				ret);
 			goto out;
 		}
+		tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 	}
 	if (tas_priv->fmw->nr_programs > 0)
 		tas_priv->tasdevice[tas_priv->index].cur_prog = 0;
@@ -962,7 +858,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	 * If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
-
+	tas2781_save_calibration(tas_priv);
 out:
 	release_firmware(fmw);
 	pm_runtime_mark_last_busy(tas_hda->priv->dev);
@@ -1032,22 +928,9 @@ static const struct component_ops tas2781_hda_comp_ops = {
 	.unbind = tas2781_hda_unbind,
 };
 
-static void tas2781_hda_remove(struct device *dev)
-{
-	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
-
-	component_del(tas_hda->priv->dev, &tas2781_hda_comp_ops);
-
-	pm_runtime_get_sync(tas_hda->priv->dev);
-	pm_runtime_disable(tas_hda->priv->dev);
-
-	pm_runtime_put_noidle(tas_hda->priv->dev);
-
-	mutex_destroy(&tas_hda->priv->codec_lock);
-}
-
 static int tas2781_hda_spi_probe(struct spi_device *spi)
 {
+	struct tas2781_hda_spi_priv *hda_priv;
 	struct tasdevice_priv *tas_priv;
 	struct tas2781_hda *tas_hda;
 	const char *device_name;
@@ -1057,6 +940,11 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 	if (!tas_hda)
 		return -ENOMEM;
 
+	hda_priv = devm_kzalloc(&spi->dev, sizeof(*hda_priv), GFP_KERNEL);
+	if (!hda_priv)
+		return -ENOMEM;
+
+	tas_hda->hda_priv = hda_priv;
 	spi->max_speed_hz = TAS2781_SPI_MAX_FREQ;
 
 	tas_priv = devm_kzalloc(&spi->dev, sizeof(*tas_priv), GFP_KERNEL);
@@ -1087,16 +975,10 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 				spi_get_chipselect(spi, 0));
 	if (ret)
 		return dev_err_probe(tas_priv->dev, ret,
-				     "Platform not supported\n");
+				"Platform not supported\n");
 
 	tasdevice_spi_init(tas_priv);
 
-	ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
-	if (ret) {
-		dev_err(tas_priv->dev, "Register component fail: %d\n", ret);
-		return ret;
-	}
-
 	pm_runtime_set_autosuspend_delay(tas_priv->dev, 3000);
 	pm_runtime_use_autosuspend(tas_priv->dev);
 	pm_runtime_mark_last_busy(tas_priv->dev);
@@ -1106,12 +988,19 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 
 	pm_runtime_put_autosuspend(tas_priv->dev);
 
-	return 0;
+	ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
+	if (ret) {
+		dev_err(tas_priv->dev, "Register component fail: %d\n", ret);
+		pm_runtime_disable(tas_priv->dev);
+		tas2781_hda_remove(&spi->dev, &tas2781_hda_comp_ops);
+	}
+
+	return ret;
 }
 
 static void tas2781_hda_spi_remove(struct spi_device *spi)
 {
-	tas2781_hda_remove(&spi->dev);
+	tas2781_hda_remove(&spi->dev, &tas2781_hda_comp_ops);
 }
 
 static int tas2781_runtime_suspend(struct device *dev)
@@ -1231,3 +1120,4 @@ MODULE_DESCRIPTION("TAS2781 HDA SPI Driver");
 MODULE_AUTHOR("Baojun, Xu, <baojun.xug@ti.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("SND_SOC_TAS2781_FMWLIB");
+MODULE_IMPORT_NS("SND_HDA_SCODEC_TAS2781");
-- 
2.43.0

