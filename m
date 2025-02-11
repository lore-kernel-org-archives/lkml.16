Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D771F03C7;
	Tue, 11 Feb 2025 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263242; cv=none; b=lkNA8hkvFxTW2tm16/l3iNlplZsKxamiGOMEMbjMM2ewIeIix+Rv83bI5ALaSUzkkmtlXw1U54TZAuO0R8pK80Q7juMogbmnMkhRXHYQH2xHhbiKQ2GhyCwyLMw7G96rMVrkMiMKTgC/G1B4S5y7XeM7urmR7SmriTXksrz7uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263242; c=relaxed/simple;
	bh=W4DRSL4K/KEOy9AvY0O91anOHMQHX+GYFB/twvnu8S4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kBBBrmBYn0NRXHuTS0rZBAaIZ1jsg4sKQoWwkMG8eYwEbZoIMKgIZNsaP4W0QwASiqJSG5LhT8KZuL+vUksTt5TLnt1Nnfg/BJjIkUJy7NGvEkfJhQJl0NSCiI+cnOVBra1pHkoV+nH2+SWkakXDj6wgxqXdSB8fgg8YsmWb9e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Uwd9kh2u; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Uwd9kh2u"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51B8eJH53663813
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 02:40:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739263219;
	bh=MRx1F45NLGZ+RvK84XPegyXLR2nCJ1Bf5SbXjicPzSw=;
	h=From:To:CC:Subject:Date;
	b=Uwd9kh2uLYX0JVizzc2biAe+gl52zyV7MevItIDCTCyKFv8blul/cutDkeRTgjJBF
	 Avdq7mzBjyl+GIwrLpoajsTv+bO0bzH7qAL9f8JBjbxTJjvBpUuteIOqcPaPL2zyi4
	 H2pnRyzZmYbc5fsglc0JQve/QNdiY2tahNPRcfdg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51B8eJxW094261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Feb 2025 02:40:19 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 02:40:18 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 02:40:19 -0600
Received: from lelvsmtp5.itg.ti.com ([10.250.165.138])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51B8e9X1020567;
	Tue, 11 Feb 2025 02:40:10 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <shenghao-ding@ti.com>,
        <navada@ti.com>, <13916275206@139.com>, <v-hampiholi@ti.com>,
        <v-po@ti.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <baojun.xu@ti.com>,
        <broonie@kernel.org>, <antheas.dk@gmail.com>,
        <stuart.a.hayhurst@gmail.com>, <dan.carpenter@linaro.org>
Subject: [PATCH v1] ALSA: hda/tas2781: Update tas2781 hda SPI driver
Date: Tue, 11 Feb 2025 16:39:41 +0800
Message-ID: <20250211083941.5574-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Because firmware issue of platform, found spi device is not stable,
so add status check before firmware download, and remove some
operations which is not must in current stage.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/tas2781_hda_spi.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index d91b19602485..00676cbb2c8e 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -909,7 +909,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	struct tasdevice_priv *tas_priv = context;
 	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
 	struct hda_codec *codec = tas_priv->codec;
-	int i, j, ret;
+	int i, j, ret, val;
 
 	pm_runtime_get_sync(tas_priv->dev);
 	guard(mutex)(&tas_priv->codec_lock);
@@ -978,13 +978,16 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 
 	/* Perform AMP reset before firmware download. */
 	tas_priv->rcabin.profile_cfg_id = TAS2781_PRE_POST_RESET_CFG;
-	tasdevice_spi_tuning_switch(tas_priv, 0);
 	tas2781_spi_reset(tas_priv);
 	tas_priv->rcabin.profile_cfg_id = 0;
-	tasdevice_spi_tuning_switch(tas_priv, 1);
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
-	ret = tasdevice_spi_prmg_load(tas_priv, 0);
+	ret = tasdevice_spi_dev_read(tas_priv, TAS2781_REG_CLK_CONFIG, &val);
+	if (ret < 0)
+		goto out;
+
+	if (val == TAS2781_REG_CLK_CONFIG_RESET)
+		ret = tasdevice_spi_prmg_load(tas_priv, 0);
 	if (ret < 0) {
 		dev_err(tas_priv->dev, "FW download failed = %d\n", ret);
 		goto out;
@@ -998,7 +1001,6 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	 * If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
-	tas_priv->save_calibration(tas_priv);
 
 out:
 	if (fmw)
@@ -1157,7 +1159,8 @@ static int tas2781_runtime_suspend(struct device *dev)
 
 	guard(mutex)(&tas_hda->priv->codec_lock);
 
-	tasdevice_spi_tuning_switch(tas_hda->priv, 1);
+	if (tas_hda->priv->playback_started)
+		tasdevice_spi_tuning_switch(tas_hda->priv, 1);
 
 	tas_hda->priv->cur_book = -1;
 	tas_hda->priv->cur_conf = -1;
@@ -1171,7 +1174,8 @@ static int tas2781_runtime_resume(struct device *dev)
 
 	guard(mutex)(&tas_hda->priv->codec_lock);
 
-	tasdevice_spi_tuning_switch(tas_hda->priv, 0);
+	if (tas_hda->priv->playback_started)
+		tasdevice_spi_tuning_switch(tas_hda->priv, 0);
 
 	return 0;
 }
@@ -1186,12 +1190,9 @@ static int tas2781_system_suspend(struct device *dev)
 		return ret;
 
 	/* Shutdown chip before system suspend */
-	tasdevice_spi_tuning_switch(tas_hda->priv, 1);
-	tas2781_spi_reset(tas_hda->priv);
-	/*
-	 * Reset GPIO may be shared, so cannot reset here.
-	 * However beyond this point, amps may be powered down.
-	 */
+	if (tas_hda->priv->playback_started)
+		tasdevice_spi_tuning_switch(tas_hda->priv, 1);
+
 	return 0;
 }
 
-- 
2.34.1

