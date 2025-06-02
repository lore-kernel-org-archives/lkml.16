Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2D2C3245;
	Mon,  2 Jun 2025 01:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748829545; cv=none; b=Y3JHGjmqNGV/solXPoiksI8o+5nWYTTYjIFVnvMzSbO36upri0Iwn2I3Izt2izfRxUFOSeEEEWwm/y5f8lrYuM6ez5g3pD/yyVqiRXjPQOMMsYmJ9f1EuSJargM5VSI6Eb5KZTaweVhOA6OSfIdaHMkCSjVNirPqHcS0k97driQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748829545; c=relaxed/simple;
	bh=4ozWqUmXXrZJXnr0+vysAd7smD9Bmmy2pGqVcniyJco=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XefXgSVCKGHqIuRbx8Ay7V1+hmhktij2yKUUDM7wlVDGUIa2IkkBct05pWj4sY1y7ZRoRCIIhkUhrl+DyA7AnhQh1vPQiUvcMnnomrtJUQ4nDYHVgX8Ivq4jF3HmCrVwULIW6xth8fnUJt/60CrSX2yzW+cfijEunf6SluS1Ipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=phvpv5NJ; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="phvpv5NJ"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5521wfBE3078494;
	Sun, 1 Jun 2025 20:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748829521;
	bh=75PyF2RwwFtLYBwrQfL9HZkeuGb78OlKBRJWzyIzhFc=;
	h=From:To:CC:Subject:Date;
	b=phvpv5NJFyHCVvNm0DXbeAYZM2hG8PWck+6+8brq5bPCryD1Ec6Iz2WyYvQexHokf
	 t7XodOZQk69BFqyO06Cn9/Qqesk9gy3u3C2VqgFbo49bj2V30rpFPKBQy7U60+S+7p
	 dHlcEdZWkDP3WcU9CzdikYxrMOhdwnqiiG7dDmdo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5521we6r2623112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 1 Jun 2025 20:58:40 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 1
 Jun 2025 20:58:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 1 Jun 2025 20:58:40 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5521wYM12290387;
	Sun, 1 Jun 2025 20:58:35 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>, <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Add missed brace and hardware id re-order
Date: Mon, 2 Jun 2025 09:58:09 +0800
Message-ID: <20250602015809.20344-1-baojun.xu@ti.com>
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

This patch is do code clean and prepare for next patch,
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

