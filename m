Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA3B27702;
	Fri,  6 Jun 2025 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749180237; cv=none; b=XGQEFABo/U3MaCci+4NfDKkHWzskEutUGJRrFwKc7Kuv3nRtFXRRPxj3df0CXLHIMFz906hCjMGslwYiaenp876+9GzV2ADviZKrhnCGNAUoik4fEedoJ6HK/kT0HSBjWy6WvOQutBooUDB3Kj3v4khb/A2nvfCtRfDhijWVAyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749180237; c=relaxed/simple;
	bh=sLGpdd46aIf0x0Bd+reZ6pE9+zXGcrX2w9SRxcvTX1s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Elr1WPz50WRqRQMASbrrJXQ2uLGL5XUGu/z39WPG1jAk+2FLtXx/VLb2bYa8T52jLtALGsJKu3YHHy7wlz1sI4RkG2JtF2T6yJ6zTsFl1Cdc/6ZE5tsIdTtL6YRdrX2Gu6TG6YZGw6HxFnIfusY8Ru95HquLROEDp5LotWKvPSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ak1+KtQU; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ak1+KtQU"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5563Nc52055399;
	Thu, 5 Jun 2025 22:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749180218;
	bh=hvbfu7Xb/8h6s8NYSnAiaY3G5mHBgNBQxEj4ixhcIgM=;
	h=From:To:CC:Subject:Date;
	b=ak1+KtQU11FU+HjpwI/rl3iPlwTqOWcoAwmAKJKXhGMo35Sqm/sCPAZSr+9qVEdC4
	 WXw0iv9daqgCSzys3vfWLZGTGutDbaegvY3Ro0lmaQNH9nLIxcA5OQ+eY1Eaws1r7y
	 1BdTohrVK4BvGbMtnDbueTbKWA+UZAWHze82tcBE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5563NcX81369176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 22:23:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 22:23:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 22:23:37 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5563NWSr331853;
	Thu, 5 Jun 2025 22:23:33 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>, <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Add missed brace and hardware id re-order
Date: Fri, 6 Jun 2025 11:23:07 +0800
Message-ID: <20250606032308.31453-1-baojun.xu@ti.com>
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

This patch was used to do code clean and prepare for next patch,
which is relative with hardware id.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/tas2781_hda_i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index d91eed9f7..eb2295b49 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -591,8 +591,9 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 		device_name = "INT8866";
 		hda_priv->save_calibration = tas2563_save_calibration;
 		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
-	} else
+	} else {
 		return -ENODEV;
+	}
 
 	tas_hda->priv->irq = clt->irq;
 	ret = tas2781_read_acpi(tas_hda->priv, device_name);
@@ -722,8 +723,8 @@ static const struct i2c_device_id tas2781_hda_i2c_id[] = {
 };
 
 static const struct acpi_device_id tas2781_acpi_hda_match[] = {
-	{"TIAS2781", 0 },
 	{"INT8866", 0 },
+	{"TIAS2781", 0 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
-- 
2.43.0

