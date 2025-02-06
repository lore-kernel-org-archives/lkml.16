Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C65237169;
	Thu,  6 Feb 2025 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859143; cv=none; b=Mfx+bLV1OLiFnF3VbAE3AwZRNyBPSIhmFO2Cc+Q4jXLXkf4SMOjmC26J8VsyQMb0BsZ38f10frSpW8dxXUxIxGqrZ1XZIGc9R9jB76S2hiLbleNyk0K6ycNL3LDN67TuTSlJGZEFKO9kFqNfpmHdqOKKcGw4gg98Ov+MhCJUPuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859143; c=relaxed/simple;
	bh=UBM7K5jIs1vjeXeRhtp2A/7wFqEP9V/8yrHRCTla9to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VjRBYcZjIyNSsjVqExuPxMh1h4fLfmKatzVVdroOBH9/Qa2XIYlNhSlFENeyUf/cwg5SooxBO38ZT6X3YuSEw+BpZp63T/85kP+7Gvjfetxxd5TQQWkpPXoarb4qsFrKDw8ThInN+yuyFv4meWy2FE+87pPraiqrObqOehdtAgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaDhJcyD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaDhJcyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738859142; x=1770395142;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UBM7K5jIs1vjeXeRhtp2A/7wFqEP9V/8yrHRCTla9to=;
  b=CaDhJcyDodgwHnZnsXXn0Pv0mHF7WfbQ5pmlOQBGnTThJEnU25QeTCqX
   jTLsCRjWhHF7Uug1bE4i7gnK3a3XTcz9KOBCUTlxPPLzARpc8x08H7yP3
   veXRz8ZLl+INpTQIOUg73irWLaigKxJZqRDM5NTVhZPd7nOkPS+ILn5FZ
   4qEPHJpezHlG1ccC7XDDsNDUYgHSxlvBj/fhsWuNxUHH97EYj5MQkCXUQ
   tOuS5QbPzXKl5ikn1uIOWgsjz6jSQEf7CciLMZ5nUfGLmW2fv/JkvELQB
   ZRmlsrptLxpy+P38gb5GB5L6Xf2G/i9at0NtuqTcYinszPkvtGcMBbsWz
   w==;
X-CSE-ConnectionGUID: pbKT6tIvQpey3d4V41arBg==
X-CSE-MsgGUID: TNwajMkZRfOVK1NFXLlxeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50863587"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="50863587"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 08:25:17 -0800
X-CSE-ConnectionGUID: L1SN4zSdQc+LBbC9Z5HnGQ==
X-CSE-MsgGUID: 47pp94E+Q864Yq+XRGQzMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115338100"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 06 Feb 2025 08:25:14 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ACF41EE; Thu, 06 Feb 2025 18:25:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Kevin Lu <kevin-lu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 1/1] ASoC: tas2781: Switch to use %ptTs
Date: Thu,  6 Feb 2025 18:23:39 +0200
Message-ID: <20250206162339.1127836-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use %ptTs instead of open-coded variant to print contents of time64_t type
in human readable form.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/sound/tas2781.h         | 1 -
 sound/pci/hda/tas2781-spi.h     | 1 -
 sound/pci/hda/tas2781_hda_i2c.c | 6 +-----
 sound/pci/hda/tas2781_hda_spi.c | 3 ---
 4 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 72d2060904f6..0f1e585635bb 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -161,7 +161,6 @@ struct tasdevice_priv {
 	struct mutex codec_lock;
 	struct regmap *regmap;
 	struct device *dev;
-	struct tm tm;
 
 	enum device_catlog_id catlog_id;
 	unsigned char cal_binaryname[TASDEVICE_MAX_CHANNELS][64];
diff --git a/sound/pci/hda/tas2781-spi.h b/sound/pci/hda/tas2781-spi.h
index ecfc3c8bb821..7a0faceeb675 100644
--- a/sound/pci/hda/tas2781-spi.h
+++ b/sound/pci/hda/tas2781-spi.h
@@ -88,7 +88,6 @@ struct tasdevice_priv {
 	struct mutex codec_lock;
 	struct regmap *regmap;
 	struct device *dev;
-	struct tm tm;
 
 	unsigned char crc8_lkp_tbl[CRC8_TABLE_SIZE];
 	unsigned char coef_binaryname[64];
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0e42b87dadb8..87dcbf88bff6 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -594,7 +594,6 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 	efi_guid_t efi_guid = EFI_GUID(0x02f9af02, 0x7734, 0x4233, 0xb4, 0x3d,
 		0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
 	static efi_char16_t efi_name[] = L"CALI_DATA";
-	struct tm *tm = &tas_priv->tm;
 	unsigned int attr, crc;
 	unsigned int *tmp_val;
 	efi_status_t status;
@@ -629,10 +628,7 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 		crc, tmp_val[21]);
 
 	if (crc == tmp_val[21]) {
-		time64_to_tm(tmp_val[20], 0, tm);
-		dev_dbg(tas_priv->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
-			tm->tm_year, tm->tm_mon, tm->tm_mday,
-			tm->tm_hour, tm->tm_min, tm->tm_sec);
+		dev_dbg(tas_priv->dev, "%ptTsr\n", tmp_val[20]);
 		tasdevice_apply_calibration(tas_priv);
 	} else
 		tas_priv->cali_data.total_sz = 0;
diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index a42fa990e7b9..d91b19602485 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -802,7 +802,6 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 	static efi_char16_t efi_name[] = TASDEVICE_CALIBRATION_DATA_NAME;
 	unsigned char data[TASDEVICE_CALIBRATION_DATA_SIZE], *buf;
 	unsigned int attr, crc, offset, *tmp_val;
-	struct tm *tm = &tas_priv->tm;
 	unsigned long total_sz = 0;
 	efi_status_t status;
 
@@ -849,7 +848,6 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 		if (crc != tmp_val[3 + tmp_val[1] * 6])
 			return 0;
 
-		time64_to_tm(tmp_val[2], 0, tm);
 		for (int j = 0; j < tmp_val[1]; j++) {
 			offset = j * 6 + 3;
 			if (tmp_val[offset] == tas_priv->index) {
@@ -882,7 +880,6 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 		 */
 		crc = crc32(~0, data, 84) ^ ~0;
 		if (crc == tmp_val[21]) {
-			time64_to_tm(tmp_val[20], 0, tm);
 			for (int i = 0; i < CALIB_MAX; i++)
 				tas_priv->cali_data[i] =
 					tmp_val[tas_priv->index * 5 + i];
-- 
2.43.0.rc1.1336.g36b5255a03ac

