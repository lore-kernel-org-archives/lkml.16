Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D252550CA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076258; cv=none; b=cZkDMgA/95geGY4BxvSiSkt8H6b+Tt/4ZtSG5cF004yJIB0KScG7IVKWCqe7806k/24TB3oqA4CvXqZvN266jp7CcuguNhWzGEXDYT6PbiW2l6oEOVQe2Y/IdYYvApZjWdD1KCdG8VmwtF+/6ZbL6TUANP6YYpJwze/jtdj6naw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076258; c=relaxed/simple;
	bh=07SGEegEOLT14D1Ss5txatO+XbuvwpYYsciHG41omUw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VhGQ9tpRxMvDRSi3a6vnTxkFQpja42lYyJhNJoKhOBApKY08gX4bdmOX7rINi8fNfcC46iElkdE+qn43XBuu5DQSH7GjulL9vMQ4Sij06mfq79KZsKgVjm2rUE6K/WIA4WBGm737kc43vvtQ0J3zXGWYYbeZ976akW7krn9iZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rMgxsB8g; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rMgxsB8g"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54CIvSK42098516
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747076248;
	bh=Azf6t9lF8YGj1nwYXP2uxYqJhH+jrHZ4tidk+Nnije8=;
	h=From:To:CC:Subject:Date;
	b=rMgxsB8gc8siM/0VHDiLFaMXxJCH6JnMt6D/TOsWZ8TsGALb6T4aAtAnlcz6u72tH
	 wrarc5dM5s4TruJXZyh3cFvgmjk1YhBkv8jlz6g/ZsZxcCotgZ+GAnPABu6hqQGLVA
	 zwEzb+GuJG3RsbRXX+g0guWa/H7gmvE9EUOXiyxE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54CIvSsQ018055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 May 2025 13:57:28 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 13:57:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 13:57:28 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CIvSZA072749;
	Mon, 12 May 2025 13:57:28 -0500
From: Nishanth Menon <nm@ti.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>
Subject: [PATCH] regulator: gpio: Use dev_err_probe
Date: Mon, 12 May 2025 13:57:27 -0500
Message-ID: <20250512185727.2907411-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

During probe the gpio driver may not yet be available. Use
dev_err_probe to provide just the pertinent log.

Since dev_err_probe takes care of reporting the error value,
drop the redundant ret variable while at it.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Testing based on next-20250512 (includes additional patch) on AM62a7-sk
Before: https://gist.github.com/nmenon/be94f21e83b4260ad3f89e1ae8f0d188#file-before-L851
After: https://gist.github.com/nmenon/be94f21e83b4260ad3f89e1ae8f0d188#file-after-L806

 drivers/regulator/gpio-regulator.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/gpio-regulator.c b/drivers/regulator/gpio-regulator.c
index 65927fa2ef16..75bd53445ba7 100644
--- a/drivers/regulator/gpio-regulator.c
+++ b/drivers/regulator/gpio-regulator.c
@@ -240,7 +240,7 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 	struct regulator_config cfg = { };
 	struct regulator_dev *rdev;
 	enum gpiod_flags gflags;
-	int ptr, ret, state, i;
+	int ptr, state, i;
 
 	drvdata = devm_kzalloc(dev, sizeof(struct gpio_regulator_data),
 			       GFP_KERNEL);
@@ -345,11 +345,9 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 		return PTR_ERR(cfg.ena_gpiod);
 
 	rdev = devm_regulator_register(dev, &drvdata->desc, &cfg);
-	if (IS_ERR(rdev)) {
-		ret = PTR_ERR(rdev);
-		dev_err(dev, "Failed to register regulator: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rdev))
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				     "Failed to register regulator\n");
 
 	platform_set_drvdata(pdev, drvdata);
 
-- 
2.47.0

