Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2EC3FE7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126822; cv=none; b=bQqDW/DNaeuzqGKQqkZsv8xdyF5+YbHcBcae9aSn+HkC/8vzNzpAsAqOLlC7Ae+JJQ4688Huim0tceoOuHgdF3b7BKHCbdOJXTOARisCZ/5+GCZA7eGt4nMYjgTpDcRcREQBI1U6XL3WR7ZaiFq0VjsDS0pLH+i3GzQKNT7UFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126822; c=relaxed/simple;
	bh=qixPsvx68QpQdJN2+HaEShxgh1Pq8m7eQVfo4KQLOJ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pxeHijFrOEDpaKf2ua6qAp6/b6kUrL0JjxGY8RCmLYagtVpUKBUrq3eaIPyXPaKvCHCE/FPRgzvHAT3X4L9ySnAoq6pvJMq3DqS6pvSrbDawjch7CPrTIIbrGSNMIGpaRfQDvhXhczrZ3DbQFNIKtVohM7Mw+d+NA6dwzJ91c0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=isIsk3Zx; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="isIsk3Zx"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54D8xurX3035121;
	Tue, 13 May 2025 03:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747126796;
	bh=GoAfN8SkH9CD8o22DgIP7HQF9KZ68PufaMe/60HCH6I=;
	h=From:To:CC:Subject:Date;
	b=isIsk3ZxqUrYnjqtwR5aPGMjnVzxs8MXTNopUfNl+nrlyGY6t4DcuxzY6dNd/eZdG
	 t2I4YA4B7/kuWAvFzK7NJjTxOElfJ4A6PFk3uYTdi+RyFrReP1Kzv58m7YfA34wQBv
	 AtGavxXvAMfQFTbzPUd+/qP9LBPDISC8wEYyfdzE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54D8xuig1614569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 03:59:56 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 03:59:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 03:59:55 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.59])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D8xpZS121462;
	Tue, 13 May 2025 03:59:52 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>,
        kernel test robot
	<lkp@intel.com>
Subject: [PATCH v4] ALSA: hda/tas2781: Fix the ld issue reported by kernel test robot
Date: Tue, 13 May 2025 16:59:47 +0800
Message-ID: <20250513085947.1121-1-shenghao-ding@ti.com>
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

After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
However, tasdevice_remove() used for not only for I2C but for SPI being
still in that lib caused ld issue.
All errors (new ones prefixed by >>):
>> ld.lld: error: undefined symbol: tasdevice_remove
   >>> referenced by tas2781_hda.c:33 (sound/pci/hda/tas2781_hda.c:33)
   >>>               vmlinux.o:(tas2781_hda_remove)
To fix this issue, the implementation of tasdevice_remove was moved from
tas2781-comlib-i2c.c to tas2781-comlib.c.

Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/__;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJD
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v4:
 - Put report tag around Signed-off-by without quotes.
v3:
 - Drop the report tag in the patch description.
v2:
 - put the Fixes tag to point out the commit that introduced the regression
 - Add compiling error information reported by kernel test robot into patch
   description.
v1:
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/__;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJD
---
 sound/soc/codecs/tas2781-comlib-i2c.c | 6 ------
 sound/soc/codecs/tas2781-comlib.c     | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index a75b812618ee..c078bb0a8437 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -364,12 +364,6 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 }
 EXPORT_SYMBOL_GPL(tascodec_init);
 
-void tasdevice_remove(struct tasdevice_priv *tas_priv)
-{
-	mutex_destroy(&tas_priv->codec_lock);
-}
-EXPORT_SYMBOL_GPL(tasdevice_remove);
-
 MODULE_DESCRIPTION("TAS2781 common library for I2C");
 MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index ad2f65359b15..076c1d955972 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -225,6 +225,12 @@ void tasdevice_dsp_remove(void *context)
 }
 EXPORT_SYMBOL_GPL(tasdevice_dsp_remove);
 
+void tasdevice_remove(struct tasdevice_priv *tas_priv)
+{
+	mutex_destroy(&tas_priv->codec_lock);
+}
+EXPORT_SYMBOL_GPL(tasdevice_remove);
+
 MODULE_DESCRIPTION("TAS2781 common library");
 MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");
 MODULE_LICENSE("GPL");
-- 
2.43.0

