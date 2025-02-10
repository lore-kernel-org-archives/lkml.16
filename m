Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74DC24061F;
	Mon, 10 Feb 2025 16:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205940; cv=none; b=mj7CsAaUXzyDy6nDae/ne2dduO/pxBpHTPZKQvUWp1CflbrsT5P6eXDOBgiBKy4AjADCBIIPgq6HnyFlbx3kKE9//MlWJCpeLKxKbIoJc1piO1mmWEsKApfk++X8YQwi9SK+ZI4t/rFeYFwTvwoGjXKGM5epCP3tILUKmtW+/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205940; c=relaxed/simple;
	bh=Ib+aRuOZ1DzzF4UQ00U+Y9SNM1ucCEeo0DE0zobw5yw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sX9+kSf2sRLBJ58VkUf6QTcTHef8kDuT1kynCj+DVtcA5iVGEji7JMcZjlX3UFaEGpLcFL+0byQFDRcFtXI3IjITktgcpa4oHfeOXQGnbAIjv7gdTCkXbbBw+svF3lbFHTW7g0tvekZk5hSHQS3kHg1K+glF8vLmg4s7Xnu+xLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=jy8TyQca; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="jy8TyQca"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D213148026A;
	Mon, 10 Feb 2025 17:45:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIGNu3f6Vyqk5hPI7JVYcMMOBwHkl3SRqCUKCqsPTxc=;
	b=jy8TyQcaMaIs3amJmcfBQvMtkXeLEkYb+iVEDCz891gac0gUP0LwaayyaAGFgmN0RmKCQE
	zqlD8enJnFxj5IZ8ZgOyQt9fcZ7DagtMziMGiTih3QzyX/k1Ef95jD/lGzoNudB82dSnag
	NETKvuD06HeeR0+C3RZDpgup/rcH1sRcAMThRgq7hAIJCQ/5GejIvDqeRjWFEbvcqbuGGU
	F4ztBAq9+b5o4O3Q2rkrA2akfl668wHirYaGgMjpZwkL4ah/2eMnXGlj6+9MQQu3uhHO5s
	SISq36BQTK2+t2bqhNolkAPfVtSwDX/Z20QRUvi3pEvjBPHts7mzruFb7JNWaQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 05/16] clk: at91: Allow enabling main_rc_osc through DT
Date: Mon, 10 Feb 2025 17:44:55 +0100
Message-Id: <20250210164506.495747-6-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

SAM9X60 Datasheet (DS60001579G) Section "23.4 Product Dependencies"
says:

    "The OTPC is clocked through the Power Management Controller (PMC).
    The user must power on the main RC oscillator and enable the
    peripheral clock of the OTPC prior to reading or writing the OTP
    memory."

The code for enabling/disabling that clock is already present, it was
just not possible to hook into DT anymore, after at91 clk devicetree
binding rework back in 2018 for kernel v4.19.

Do it for all controllers with an OTPC controller, where the main rc
oscillator is required for proper operation.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - split out dt-bindings changes into separate patch
    - extend to drivers for other SoCs providing the OTPC

 drivers/clk/at91/sam9x60.c  | 1 +
 drivers/clk/at91/sam9x7.c   | 1 +
 drivers/clk/at91/sama7d65.c | 1 +
 drivers/clk/at91/sama7g5.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index 11fe2d05fa9bb..58a5b6c4473da 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -225,6 +225,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 					   50000000);
 	if (IS_ERR(hw))
 		goto err_free;
+	sam9x60_pmc->chws[SAM9X60_PMC_MAIN_RC] = hw;
 
 	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index c3c12e0523c4b..8a2955d1f67c6 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -758,6 +758,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 					   50000000);
 	if (IS_ERR(hw))
 		goto err_free;
+	sam9x7_pmc->chws[SAM9X7_PMC_MAIN_RC] = hw;
 
 	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 024c5abee25ff..eaddb154c4381 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1131,6 +1131,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 						   50000000);
 	if (IS_ERR(main_rc_hw))
 		goto err_free;
+	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] = hw;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 7dfeec8f2232b..e6d5739371a76 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1012,6 +1012,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 						   50000000);
 	if (IS_ERR(main_rc_hw))
 		goto err_free;
+	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] = hw;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-- 
2.39.5

