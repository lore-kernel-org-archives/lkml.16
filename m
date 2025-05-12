Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E49F9CB
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037942; cv=none; b=gJ8UE+IrX/lUmVj7PExwyzlw6jn0aCCjMJ6xGVWFfojQGcRBnQtdLIE1AqaQeStmi3NXDswDrrdeBeYt1SsSsmWRBV3OJ7J3cFaEjPQzdThRXmyl9aGQpWS8xdZI9VVlHmxhSFwlpJ+qlkry6cMOnb/C/a7cOnvq0G3lntoJ+iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037942; c=relaxed/simple;
	bh=2jepknxWjE/0XKgZzfXVHNANqnmrBGpNCfDIqn35WIw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p/Tkae6iwlfHgmDpzecUAdgDq50oqFs4fSK3kxKSK89mftUv+SIauRKiVNR0oqGuDm0U3IPOX9RkHq/SIh+hb50uKsjIwXrvJfynpVAM9Xa7FZRv80RMoWRoq7fBRjkynMw+4OyuJ8s2t53cFyCasXkuq36z55GxGvB2cPpARIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ayaLAO/w; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ayaLAO/w"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54C8IUXV1928408
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 03:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747037910;
	bh=ge8Dl/TyFR3+BosL2y3ZH63GxgS1a+2mlep3avVb4D8=;
	h=From:To:CC:Subject:Date;
	b=ayaLAO/wtOTUI15x3sTy3JRN4CN7GWgM/ATYqfqv5Q4yO2Ods0rCwOJZvB8S2QSWy
	 tRVSWA+MjquKKekduWwYyACHradaVr5EI4NWcQVopIPXsLjy18mu4fTpLYYOZc3Eux
	 OJ/XlakOgV2tam64ncgN3FWEVot4nTrHBIti0KKc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54C8IUaY003426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 May 2025 03:18:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 03:18:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 03:18:30 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.59])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54C8IQUV095806;
	Mon, 12 May 2025 03:18:26 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ALSA: hda/tas2781: Fix the ld issue reported by kernel test robot
Date: Mon, 12 May 2025 16:18:22 +0800
Message-ID: <20250512081822.1513-1-shenghao-ding@ti.com>
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
tasdevice_remove used for not only for I2C but for SPI being still in
that lib caused ld issue.
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://urldefense.com/v3/__https://lore.kernel.org/
|  oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/
|  __;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJDVs7u17Z9-7Xa-
|  0lnyE4S3m2qmLCcHVK4qH1bD1JuBdzg$
All errors (new ones prefixed by >>):
>> ld.lld: error: undefined symbol: tasdevice_remove
   >>> referenced by tas2781_hda.c:33 (sound/pci/hda/tas2781_hda.c:33)
   >>>               vmlinux.o:(tas2781_hda_remove)
To fix this issue, the implementation of tasdevice_remove was moved from
tas2781-comlib-i2c.c to tas2781-comlib.c.

Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
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

