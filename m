Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64A2E3706;
	Sat,  5 Jul 2025 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751721015; cv=none; b=hDSERkifMCRbdk3wHHCzapmu4a6vLqSkPgMlwEZT7Ng0iEQwmTaCHKDNo+ex3Y+S4SIuUk3XT8jn69veA6m1RaC1CsLgap5vVBSoOadFtxwcARjYZpu0fwmuZv67B17My0HdjtCRp081sxj6BYBjH5yiwYXPZ7AiAIICl6hVpHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751721015; c=relaxed/simple;
	bh=UIXup+LNXzlJkMEvN+DweufuUSjQf331SNhY6u+dwkE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jrz9dmljytYD2vhYxyjdX1nGWfPuqxpdlhgMZfMCGuDObS68HoUlf9OJF63UarrVnvCA4qsU8/jGmHScpM3VImYa2mhpcXlSk/YKYiyB0V9a1jilU3FbU9m8bppbaZF77zPrJ9QT0MWet9Hockc8wSUbQZjlF67olz+irvemLVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=daS93Z0z; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="daS93Z0z"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 565D9ovt462902;
	Sat, 5 Jul 2025 08:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751720990;
	bh=ttqjqkTwAbS4h3qGA1nHlnNHYoKbG6HRZs4IHbCT+c8=;
	h=From:To:CC:Subject:Date;
	b=daS93Z0znHcxGrRqwRwVnJNdcXTSEnN/3haIvwCNKSfAcZd42Y7uc1qtZxzQmcoAa
	 IxrCCY+kZGsB3EmMK5q3NY3k8VlE2TTNNX6fwLUIfJhhrxv6ekANCQi1e5kutc+f5I
	 oBjqu3Vn1LtDua5dP/Qe/BsLvqnkF2vBFW5T993I=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 565D9n5i2728577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 5 Jul 2025 08:09:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 5
 Jul 2025 08:09:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 5 Jul 2025 08:09:49 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 565D9hrL707887;
	Sat, 5 Jul 2025 08:09:44 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>, <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Fix calibration data parser issue
Date: Sat, 5 Jul 2025 21:09:08 +0800
Message-ID: <20250705130908.26248-1-baojun.xu@ti.com>
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

Calibration data was overwritten during parser, it cause issue.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/tas2781_hda.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda.c b/sound/pci/hda/tas2781_hda.c
index 5f1d4b3e9688..34217ce9f28e 100644
--- a/sound/pci/hda/tas2781_hda.c
+++ b/sound/pci/hda/tas2781_hda.c
@@ -44,7 +44,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		TASDEVICE_REG(0, 0x13, 0x70),
 		TASDEVICE_REG(0, 0x18, 0x7c),
 	};
-	unsigned int crc, oft;
+	unsigned int crc, oft, node_num;
 	unsigned char *buf;
 	int i, j, k, l;
 
@@ -80,8 +80,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 			dev_err(p->dev, "%s: CRC error\n", __func__);
 			return;
 		}
+		node_num = tmp_val[1];
 
-		for (j = 0, k = 0; j < tmp_val[1]; j++) {
+		for (j = 0, k = 0; j < node_num; j++) {
 			oft = j * 6 + 3;
 			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
 				for (i = 0; i < TASDEV_CALIB_N; i++) {
@@ -99,8 +100,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 				}
 
 				data[l] = k;
+				oft++;
 				for (i = 0; i < TASDEV_CALIB_N * 4; i++)
-					data[l + i] = data[4 * oft + i];
+					data[l + i + 1] = data[4 * oft + i];
 				k++;
 			}
 		}
-- 
2.43.0

