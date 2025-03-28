Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FD21146D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147840; cv=none; b=gTe5u6Sn4Smzp1EmrDaD6EfzwCPyky815Gyltcr8JNAZbWb1t8roDdjxO//H1lHQFNpWZhP+57AGnPsfhMpEg3OE7Max50zrUVFslas13IFiMlcdORAxbIDvY6FjhtcgFsDz8a4ATc7SD82U2d0g6UZk6+H/k5p6S7KmGIO1xHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147840; c=relaxed/simple;
	bh=0/vjERDIJMMC+2dqUKXHIBYUze3YUG3Cb8i8cl8vJSc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C49TTS7qQ2Y53CO6YQm07KA+zRa/ohrgI+ezTcPFCpweLDIOQjXPsocHzg+eIHTkNRrPCzR6o83gG75jzOu0Iqz9st6HIJP+MB2ikpvdABridlmcY9CsvVXHvjHvZQQFGsbFezXlLZp2wycw+THJgYvofHjV36oe/jwoF3xic10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=q6P7ihcN; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q6P7ihcN"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52S7hZH72657494
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 28 Mar 2025 02:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743147815;
	bh=VteTomVWAYBRvfsVvWo6AoT8N/QhMeFBSeZOBw2+QCU=;
	h=From:To:CC:Subject:Date;
	b=q6P7ihcN9BcDL985eHVg22wm/N5x3vUJluhs0YNUjiq7r7aO4rOR+ID3cFVSBVmP9
	 33H/IGa1hL3MHGfUg0FD+JCHTiE81DJHJlnWeKFATMZsdSFSCtocmbt/Ag2WQSh2Uq
	 kiqAXnvDXb6ML94FQYpYVo4er8E6hVzYdyax3gfU=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52S7hZ5x079092;
	Fri, 28 Mar 2025 02:43:35 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 02:43:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 02:43:35 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.197])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52S7hUZf056206;
	Fri, 28 Mar 2025 02:43:31 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, <robinchen@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Upgrade calibratd-data writing code to support Alpha and Beta dsp firmware
Date: Fri, 28 Mar 2025 15:43:26 +0800
Message-ID: <20250328074326.796-1-shenghao-ding@ti.com>
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

Since 2025, the firmware for tas2781 has been added more audio acoustic
features, such as non-linear compensation, advanced battery guard,
rattle-noise suppression, etc. The version was divided into two different
series. Both series have a slight change on the calibrated data storage
addresses, which becames flexible instead of fixed. In order to support
new firwmares in time, the code have some related upgrades.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - revise the subject and description.
v1:
 - Add updating calibration addresses code into tas2781_apply_calib in
   case of Alpha and Beta firmware.
---
 sound/pci/hda/tas2781_hda_i2c.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 9ed49b0dbe6b..29dc4f500580 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -558,28 +558,38 @@ static int tas2563_save_calibration(struct tasdevice_priv *tas_priv)
 
 static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
 {
-	static const unsigned char page_array[CALIB_MAX] = {
-		0x17, 0x18, 0x18, 0x13, 0x18,
+	struct calidata *cali_data = &tas_priv->cali_data;
+	struct cali_reg *r = &cali_data->cali_reg_array;
+	unsigned int cali_reg[CALIB_MAX] = {
+		TASDEVICE_REG(0, 0x17, 0x74),
+		TASDEVICE_REG(0, 0x18, 0x0c),
+		TASDEVICE_REG(0, 0x18, 0x14),
+		TASDEVICE_REG(0, 0x13, 0x70),
+		TASDEVICE_REG(0, 0x18, 0x7c),
 	};
-	static const unsigned char rgno_array[CALIB_MAX] = {
-		0x74, 0x0c, 0x14, 0x70, 0x7c,
-	};
-	int offset = 0;
 	int i, j, rc;
+	int oft = 0;
 	__be32 data;
 
+	if (tas_priv->dspbin_typ != TASDEV_BASIC) {
+		cali_reg[0] = r->r0_reg;
+		cali_reg[1] = r->invr0_reg;
+		cali_reg[2] = r->r0_low_reg;
+		cali_reg[3] = r->pow_reg;
+		cali_reg[4] = r->tlimit_reg;
+	}
+
 	for (i = 0; i < tas_priv->ndev; i++) {
 		for (j = 0; j < CALIB_MAX; j++) {
 			data = cpu_to_be32(
-				*(uint32_t *)&tas_priv->cali_data.data[offset]);
+				*(uint32_t *)&tas_priv->cali_data.data[oft]);
 			rc = tasdevice_dev_bulk_write(tas_priv, i,
-				TASDEVICE_REG(0, page_array[j], rgno_array[j]),
-				(unsigned char *)&data, 4);
+				cali_reg[j], (unsigned char *)&data, 4);
 			if (rc < 0)
 				dev_err(tas_priv->dev,
 					"chn %d calib %d bulk_wr err = %d\n",
 					i, j, rc);
-			offset += 4;
+			oft += 4;
 		}
 	}
 }
-- 
2.34.1

