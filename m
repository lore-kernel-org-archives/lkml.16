Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4266E19C546;
	Thu,  6 Feb 2025 19:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869944; cv=none; b=MXYyUZVd4ob9p4IoxxBgfNlf4LcbRL/1zoiLRDc1Zc53zKN6uT6MkZ63DABH+DvtuGoIaxNqZDQx/fetOrJlSLXs9jFSd8jioEeWtGIDB9mnmIQzmuAycOkLbMbix6lr+YVOyBvCSbwsh/U6pLTPA+PM6SuB5izs7ECvBTOcSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869944; c=relaxed/simple;
	bh=n/YkYURb4rl9cMKZh02BgtPCD4nz7KgShrKwZzPCxcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QXGbwod+04k9eJZ+zcKmro4E/uIi6ks+Mq2w63Br52noLdx6ykgoqOGvx9J0M92ApNeRKdveRxxCIYIEv0e0IxtssFXbwUOP958Ds+UJ9Bm5wmzlVCqf7kU8vCEq7glLq3wjnnYG3AbdVNOxpW2qQGAoHEy+YaeT5R3Ev3yal2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mj2WMYG1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mj2WMYG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738869942; x=1770405942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n/YkYURb4rl9cMKZh02BgtPCD4nz7KgShrKwZzPCxcA=;
  b=mj2WMYG1x/gUC4xK2xp2ZOLkWw6+muee19lnzeQ8arha3TqSVcw1TyDW
   W9iRjK3eqw5+r+nToxOoahwX5ncomBNpHYfvRbVBu+ZqQLL88+HJIcTSs
   0nhH78+Zc+JLn/OhvNICV4quqeoANssmpThJiUjq1fwRn/AYluz/ulDVC
   aCnp3pypPPPwkF2SyZrjpZ1eDYlSLO5X6NhdG5DtWDx+7bVu7Hxfl+25q
   TYw9wK548Guvw5lr3cruVrRRfHdTgh8Fh5JxQcsvkBD/xuq8ngO4KLJGK
   VzpApdwFaqeBEnhvLltRPRSlYnnME9IkE8XQOu76CWQ9j5Snh9mozE6ag
   w==;
X-CSE-ConnectionGUID: RPNvtQ/yQjSHeapp9zx43g==
X-CSE-MsgGUID: VnxrGBQiTay+UgLPOQjFRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39399542"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39399542"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:25:42 -0800
X-CSE-ConnectionGUID: h9KvzgslQQq2dsH4t3yMug==
X-CSE-MsgGUID: BpbfZF9bTUKVuJecSZ1agA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111165253"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 06 Feb 2025 11:25:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A62B7EE; Thu, 06 Feb 2025 21:25:38 +0200 (EET)
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
Subject: [PATCH v2 1/1] ASoC: tas2781: Switch to use %ptTsr
Date: Thu,  6 Feb 2025 21:25:15 +0200
Message-ID: <20250206192537.1133763-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use %ptTsr instead of open-coded variant to print contents of time64_t type
in human readable form.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: made sure the parameter is the pointer as required by %pt

 include/sound/tas2781.h         | 1 -
 sound/pci/hda/tas2781-spi.h     | 1 -
 sound/pci/hda/tas2781_hda_i2c.c | 8 +++-----
 sound/pci/hda/tas2781_hda_spi.c | 3 ---
 4 files changed, 3 insertions(+), 10 deletions(-)

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
index 0e42b87dadb8..be9a90f643eb 100644
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
@@ -629,10 +628,9 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 		crc, tmp_val[21]);
 
 	if (crc == tmp_val[21]) {
-		time64_to_tm(tmp_val[20], 0, tm);
-		dev_dbg(tas_priv->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
-			tm->tm_year, tm->tm_mon, tm->tm_mday,
-			tm->tm_hour, tm->tm_min, tm->tm_sec);
+		time64_t seconds = tmp_val[20];
+
+		dev_dbg(tas_priv->dev, "%ptTsr\n", &seconds);
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

