Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2F533993;
	Sat,  5 Jul 2025 02:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751684065; cv=none; b=qlBvvuEKP8gu6JwZNOOrhYMFx9nsHk4hhzzMW5nquBq55wqRXVOAh6EGncWfxFKLYJ0K8/swp+uWYBkkSjVRL0de/qFqx+tPbCf6li5wJFSWCj8DljFyiqnfjCZTYxKQh5t3vWS7JpKMSMWJo2pZ/VAb0vzOj+YWT9s+jfmzhcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751684065; c=relaxed/simple;
	bh=fuV+f3p68eVNJtrMd5iPj26dCWv88/YV5dLdtehWBsI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gL0yupLDy1uDdsa+aQR2TdZlm3BmrNR7BasWSPoGf8/Sqa3KiKv5QqzFx6HxaN302mvr9ZaKXlZhA5WOP3oAOGF56chjzyajY7zpRBbuA2MjzU/xKWQ14uieML9QiDy6iazjWAlPxNtGgTMDRRSqnp6PcGStvBBNuq3Az6INPss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=H/N106NL; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="H/N106NL"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5652s4M23947785;
	Fri, 4 Jul 2025 21:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751684044;
	bh=b8BA+LiOkFB87eg4JOa5d7p9svdb3m3qLq/OtPj0Dy4=;
	h=From:To:CC:Subject:Date;
	b=H/N106NL3BEderp8KVLUEH7m77o5gBT6uolPYrLPna2CF0AZ2Bikv/QXThYDjk6Mv
	 qpYgowVOY/XfgjSdaUFnzHYqCC0XuJI4hf6BN0eWAnATV2jseVoNFuQ/I7dCIURj71
	 p3H6r9o35iggsqY20/c8ebY/GO8Q/cIfgxRaOr5U=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5652s3mB3984965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 21:54:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 21:54:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 21:54:03 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5652rvIb3841032;
	Fri, 4 Jul 2025 21:53:58 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>, <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Add bus name in device name check
Date: Sat, 5 Jul 2025 10:53:33 +0800
Message-ID: <20250705025333.24346-1-baojun.xu@ti.com>
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

Fixes: b2904df0a347 ("ALSA: hda/tas2781: Add compatible for hardware id TIAS2781 and TXNW2781")

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index b9cdbca951e4..530c2266ab3b 100644
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

