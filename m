Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B3136E;
	Thu,  3 Jul 2025 00:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751501549; cv=none; b=eMTuwoYhfT2izJR3Ig1nHhL+8xnLsXsR3Je7TZwPLONRp5LuUJfoD90HZLIDbdaIyFPQ1EMHhOydHR16hg6wXRoA08DnKTwZRT9H8Kc7cIo7fXKYHdUaY3OylZ2Rvyrd/HOgRK8k++Ff3yCYRwynP1Rp9Zkya8/GAg2j3IJulUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751501549; c=relaxed/simple;
	bh=xcaAV4fgHILHGbeXPuCYVyWzm4CjE9OTYgdu4iXec/w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kikfwI6En0nAv4EnwDkpB9cOlGSDtE3mUq7JmZmtsiAE0kJezsPAhJk9cKMdBPPVtOyD38eajXH960QEHyVsC7DZwRVnLvQuM92j+fZvIqaS/Ji9GltavXGlGDqSU+TA9Jjgy0YFrbjBF4biQ8i58d9ErC9lDgv3uK8PjocJvsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ACBwzBDs; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ACBwzBDs"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56306flX4061309;
	Wed, 2 Jul 2025 19:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751501201;
	bh=zTShQvNmYJsUbdqrutBggdEFTR1g+rS+ikJtmUsfF60=;
	h=From:To:CC:Subject:Date;
	b=ACBwzBDsLK/nxNfHEcv2fQdi6OiJJjVzof6WNTafSjEVQbZZT+NrcM4HEgrE9dVoh
	 +9qg0wgtKESB4XyZkGOM63Whp++YJtDaBKx6NYLHglvEENV8mqXtG70Yf4BOQRHqfu
	 2w7ta5irKRaR0FCNQ5UiqM/NnFUdN6vEWmAln1FU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56306fCv1313797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 2 Jul 2025 19:06:41 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 19:06:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 19:06:41 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56306ZSx4057921;
	Wed, 2 Jul 2025 19:06:36 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>, <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Add bus name in device name check
Date: Thu, 3 Jul 2025 08:06:08 +0800
Message-ID: <20250703000608.20815-1-baojun.xu@ti.com>
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

Device name start from bus name, as we use strstarts()
to do compare, need add it for TXNW2781 device.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index b9cdbca95..530c2266a 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -588,7 +588,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 		hda_priv->save_calibration = tas2781_save_calibration;
 		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
 	} else if (strstarts(dev_name(&clt->dev),
-			     "TXNW2781:00-tas2781-hda.0")) {
+			     "i2c-TXNW2781:00-tas2781-hda.0")) {
 		device_name = "TXNW2781";
 		hda_priv->save_calibration = tas2781_save_calibration;
 		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
-- 
2.43.0

