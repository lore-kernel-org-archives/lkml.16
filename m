Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F852882BB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751702356; cv=none; b=SpjqWv3aQa+RCawBnk7N1YqSdUTHEx1FZpd9dFwm2nSGMQbe7OOy9m+1zTdHF1gy7RgZefc4q88u1hWbzK2uNom8dTJ84vOgZRXPBVLknbi+miQIq9aOGCu+VR7oysLXsAoIWDSX/U5Fh6VbQBNUDTdbH5M6XRAEw0RmD2GW/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751702356; c=relaxed/simple;
	bh=h9v37jljCA0ib1CfR4iqZbShQDv4h/VyGAM5aro00zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMpp2NUtjdG2Pw4aTs5yEwhvViG1LNTutIk0dA7o9UItpFccypNkokumoLOxmExHJne3ekz8ZF4lF3LhwVBmIqmOb52ZQ4p7A3ku8eJMdUbrEAhMvW2DE7Tteh+VJD16HY1/pWlBgmJnytya1n3vSAnPTZWGWj4HdBR7XV4iss0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Pv8lPdtF; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Pv8lPdtF"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XxmRuIndJIhD3XxmhuGNRn; Sat, 05 Jul 2025 09:58:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751702291;
	bh=ymp49jbWiE0sb0rtDA2Bf3+TdOfMZccaF4NGaAZI7g0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Pv8lPdtFO/HLkku4zbqo5vsdjjiVkYEypsLY034eX+kOwi8s7CV05A6wsVUGcjVr5
	 /XgVqGudzG+bAvTlvS04u55iBIuikF+/1dyaTOVD+mPgx47mZc/hJr/BlfS3mD0JrP
	 YqB87VqfCAyC0EEWZArT5Cerxkmd1sBu2mwGnaz9g0w6Iyqzq5ELBLVSLJO/xaOpsk
	 lq4jfEoLMSWtip5oO4fwzgsoURsZ5qfKyX0elx5uHCuhTtXFGQcy4I6SHTlxO0o1Y/
	 6H6L+3Nc7wN3k0X8gtHdravTOBJnR+ZjuFgyPqOxcXx2SB4HXS0Ey9HPyYP8pkPcjc
	 SAC24zDzsA67g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Jul 2025 09:58:11 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: vigneshr@ti.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	andi.shyti@kernel.org,
	miaoqinglang@huawei.com,
	grygorii.strashko@ti.com,
	wsa@kernel.org,
	Jean Delvare <khali@linux-fr.org>,
	Komal Shah <komal_shah802003@yahoo.com>,
	Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe()
Date: Sat,  5 Jul 2025 09:57:37 +0200
Message-ID: <565311abf9bafd7291ca82bcecb48c1fac1e727b.1751701715.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
References: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_i2c_init() can fail. Handle this error in omap_i2c_probe().

Fixes: 010d442c4a29 ("i2c: New bus driver for TI OMAP boards")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/i2c/busses/i2c-omap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 8b01df3cc8e9..485313d872e5 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1472,7 +1472,11 @@ omap_i2c_probe(struct platform_device *pdev)
 	}
 
 	/* reset ASAP, clearing any IRQs */
-	omap_i2c_init(omap);
+	r = omap_i2c_init(omap);
+	if (r) {
+		dev_err(omap->dev, "failure to initialize i2c: %d\n", r);
+		goto err_mux_state_deselect;
+	}
 
 	if (omap->rev < OMAP_I2C_OMAP1_REV_2)
 		r = devm_request_irq(&pdev->dev, omap->irq, omap_i2c_omap1_isr,
@@ -1515,6 +1519,7 @@ omap_i2c_probe(struct platform_device *pdev)
 
 err_unuse_clocks:
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
+err_mux_state_deselect:
 	if (omap->mux_state)
 		mux_state_deselect(omap->mux_state);
 err_put_pm:
-- 
2.50.0

