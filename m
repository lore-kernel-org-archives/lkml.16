Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2558179D2
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 23:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747093761; cv=none; b=qmShMR2xJZJ25SwKPua2lzP5t2GDSIuILrbbiH5gHwGdiwQ8w7SA2oz0VoNpnR+PQgS9bSgP5h4scVyvm7lj7jY6YImZgPDpub1tbAPmRZlm7xeKrmRcgktFScKMGPP6WYEUk29aVpEPwronQX35WwJ9niqoLTZD7/IZXvn/SY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747093761; c=relaxed/simple;
	bh=j7ThaJ6DoNp4f6FP5Vx08GnRwirFs4dn5fHGZ/vDP80=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D9mipgiWFAaW4my8qd1b4JLqC20SpWpseSR6Y13xvg6TD6oSIduzWqPnX7atIUrGvVneexYd6FWU0CiKFl+dCi40HrlMt60j5JO1yuqCMDwcDBn8kiHb6DO4fn//V2gi4bnM5xF5Oa/3C6ZS/2Nro6wv37ftoZTLD1cUPBQt6g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=az/3o0Zq; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="az/3o0Zq"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54CNmft92906862
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 18:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747093721;
	bh=PFrxyO8NYd8Cc14aEEJRvZuwU4+a4IQOvRHRkG3cqHA=;
	h=From:To:CC:Subject:Date;
	b=az/3o0ZqPQf6iYx2+sr6S0beipBqVm9hMymvyKLXP3qcPoe1H0beGVtQpyGdTs2gB
	 LuQWXSfZOBru9tJ58fXjFoNiPNsxhJrqnnjxuLHqsq/8KUjV1kuE5kd4wJfdNzR+IX
	 gTlu+K8Fi1+HPbyKp/SWJ6B2xgG0JhYVRcuK+zBA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54CNmfYT065211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 May 2025 18:48:41 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 18:48:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 18:48:40 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.59])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CNmbHf114132;
	Mon, 12 May 2025 18:48:37 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v3] ALSA: hda/tas2781: Fix the ld issue reported by kernel test robot
Date: Tue, 13 May 2025 07:48:33 +0800
Message-ID: <20250512234833.772-1-shenghao-ding@ti.com>
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
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
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

