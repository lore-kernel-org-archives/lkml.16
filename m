Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBF012B63;
	Sat, 31 May 2025 12:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748693920; cv=none; b=e8OPg3mxRxY/wIKdugI4WUd4ulmV+SINV4cOGFsnr36y6US8pxAlbdJ+YbogBIYytrZnMXWvq8OY+aqj75Az8/0TMwoF7x/MjKawofYeUvnCzuNnT7JmrmNlDYZM7E4vSzSsOC4MJPOL8RW2r3WYfEgDPL/5qFbURaohi/sVlq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748693920; c=relaxed/simple;
	bh=yzynbwJvm3HS/5jmTL08InbBRr9Gg9nwk97p6mdiZPo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JATzwjWBI8tcz1w+Nnoqd8W+ozyf3+fmk3HIUPkR72McVAQvoWSWrPaW7phkpJ7WZGhnMwVkwlUyfIL+LfUl+tw9ssFgtK8skji6ayIGnpqunuilDdTCmXUlTvXp4fFOEAGN7scvrXPCE/RZq9hgQaaKFCoDxzU/HRDvFnwY7yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JTpHwJXN; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JTpHwJXN"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54VCI8jc4076149;
	Sat, 31 May 2025 07:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748693888;
	bh=/nQJ4eVfDTDgxUtEpAAOtlIXcJDiyoymSPdj71uUwTU=;
	h=From:To:CC:Subject:Date;
	b=JTpHwJXN/DgHpyixbJJRbWH9tn9eP2ZPp8nRdtTWwFdAkZXxBWQrCfl9frysWnr04
	 K85fnbpYPU341UBW1gIwB/Fohnk5EaTEixh/PpFD5+k9kyYc4DRHBj0+NR47nKFngZ
	 ZO511le0gkMZFoHWZm4UN4yNuEiWp16Sx9AWmB9M=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54VCI8531521341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 31 May 2025 07:18:08 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 31
 May 2025 07:18:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 31 May 2025 07:18:07 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54VCI1wK284629;
	Sat, 31 May 2025 07:18:03 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>, <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Add compatible for hardware id TIAS2781 and TXNW2781
Date: Sat, 31 May 2025 20:17:33 +0800
Message-ID: <20250531121733.17493-1-baojun.xu@ti.com>
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

TIAS2781 is unofficial hardware id in acpi for tas2781 in HDA,
has been used for several projects. TXNW is the official hardware
id for TI, will be used in new projects, including device on SPI bus.
This patch will support both TIAS2781 and TXNW2781 in acpi
with tas2781 under HDA.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/patch_realtek.c   | 21 +++++++++++++++++----
 sound/pci/hda/tas2781_hda_i2c.c | 10 +++++++---
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba73..ff32ac25d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7323,7 +7323,7 @@ static void alc285_fixup_asus_ga403u(struct hda_codec *cdc, const struct hda_fix
 		alc_fixup_inv_dmic(cdc, fix, action);
 }
 
-static void tas2781_fixup_i2c(struct hda_codec *cdc,
+static void tas2781_fixup_tias_i2c(struct hda_codec *cdc,
 	const struct hda_fixup *fix, int action)
 {
 	comp_generic_fixup(cdc, action, "i2c", "TIAS2781", "-%s:00", 1);
@@ -7334,6 +7334,12 @@ static void tas2781_fixup_spi(struct hda_codec *cdc, const struct hda_fixup *fix
 	comp_generic_fixup(cdc, action, "spi", "TXNW2781", "-%s:00-tas2781-hda.%d", 2);
 }
 
+static void tas2781_fixup_txnw_i2c(struct hda_codec *cdc,
+	const struct hda_fixup *fix, int action)
+{
+	comp_generic_fixup(cdc, action, "i2c", "TXNW2781", "-%s:00-tas2781-hda.%d", 1);
+}
+
 static void yoga7_14arb7_fixup_i2c(struct hda_codec *cdc,
 	const struct hda_fixup *fix, int action)
 {
@@ -8001,6 +8007,7 @@ enum {
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
 	ALC287_FIXUP_TAS2781_I2C,
 	ALC245_FIXUP_TAS2781_SPI_2,
+	ALC287_FIXUP_TXNW2781_I2C,
 	ALC287_FIXUP_YOGA7_14ARB7_I2C,
 	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
 	ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT,
@@ -10251,7 +10258,7 @@ static const struct hda_fixup alc269_fixups[] = {
 	},
 	[ALC287_FIXUP_TAS2781_I2C] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = tas2781_fixup_i2c,
+		.v.func = tas2781_fixup_tias_i2c,
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
@@ -10261,6 +10268,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
 	},
+	[ALC287_FIXUP_TXNW2781_I2C] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = tas2781_fixup_txnw_i2c,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
+	},
 	[ALC287_FIXUP_YOGA7_14ARB7_I2C] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = yoga7_14arb7_fixup_i2c,
@@ -11318,8 +11331,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
-	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TXNW2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_PCM_44K),
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index d91eed9f7..48c7af191 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -583,16 +583,19 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	if (!tas_hda->priv)
 		return -ENOMEM;
 
+	hda_priv->save_calibration = tas2781_save_calibration;
+	tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
 	if (strstr(dev_name(&clt->dev), "TIAS2781")) {
 		device_name = "TIAS2781";
-		hda_priv->save_calibration = tas2781_save_calibration;
-		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
+	} else if (strstr(dev_name(&clt->dev), "TXNW2781:00-tas2781-hda.0")) {
+		device_name = "TXNW2781";
 	} else if (strstr(dev_name(&clt->dev), "INT8866")) {
 		device_name = "INT8866";
 		hda_priv->save_calibration = tas2563_save_calibration;
 		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
-	} else
+	} else {
 		return -ENODEV;
+	}
 
 	tas_hda->priv->irq = clt->irq;
 	ret = tas2781_read_acpi(tas_hda->priv, device_name);
@@ -723,6 +726,7 @@ static const struct i2c_device_id tas2781_hda_i2c_id[] = {
 
 static const struct acpi_device_id tas2781_acpi_hda_match[] = {
 	{"TIAS2781", 0 },
+	{"TXNW2781", 0 },
 	{"INT8866", 0 },
 	{}
 };
-- 
2.43.0

