Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D052500AF;
	Mon, 10 Feb 2025 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205931; cv=none; b=rczb5x44qJfQm0rjlxXPyI6AKD4jwCaXypxjQfPr4oZYKJOckjliRNxqiiqrko+kg0Lk74IhMeUhg9hYjF8cHLnQVgAlNV0MYdL/jd5C2tZrERQgKkZXISoYYiZsidhllNPbLvphOGtWeEjmoQjodcrCRWhrP59JmrUeiDqUuYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205931; c=relaxed/simple;
	bh=omMAQSz4IVnPVo3SZFg6SS5+jk6lB4T2PXBo0/jFDbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uQeThqpkQIYMcRKCV+Eo178UTE+so7MKWmQBVDaEHw9TXq1podbKx6aan137QSLh7Z2PSh/HcajmDCcicwft6waT6q6+xDYjC//lu05HA7U0u8udaQs7NBL4m2OaOoxSCb7Y6GXHQynL/18IRKFpTdnXPSQvIaOrl/1rqBaAPtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=aYhSLJju; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="aYhSLJju"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 299D21480324;
	Mon, 10 Feb 2025 17:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OqtKWO6AWVGnj5GrWtWZfjcLIo8DHwLNh5Y4FdEE6Zw=;
	b=aYhSLJju9x0r4+ZKC6v3MTwAn/eiBiChJzvvAzJSozMeJH4miikvk2OUYNafeQwrAF/Hjk
	43VZWBgaIACuN4hDPSyuWqYQ/RLY95tezGixTu15l2lNwqKsINQaPElD00itYvCicq3KLa
	tDvpV5WJbus1ZAQO/RE893ZtO8gBLTHfEc7QSjYz6RTpNn6GeheqTkV/0n6Z77cRfMM6HB
	ixCPZX1/d5Y76zSPwYwGOefxBlqMPLohNa24MZ+3BTXSlJo7FVmEDoQaSgQa5j8GwoBchn
	cfq3Duohzgqh+2RrCP5nmK62Z2q065vMIrxqBfa7nT7Q5JPWdS5f8Uh4d7FpQg==
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
Subject: [PATCH v2 03/16] clk: at91: Use new PMC bindings
Date: Mon, 10 Feb 2025 17:44:53 +0100
Message-Id: <20250210164506.495747-4-ada@thorsis.com>
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

The bindings were split up per SoC before adding new array members for
missing clocks.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 drivers/clk/at91/sam9x60.c  | 14 ++++++-------
 drivers/clk/at91/sam9x7.c   | 22 +++++++++----------
 drivers/clk/at91/sama7d65.c | 42 ++++++++++++++++++-------------------
 drivers/clk/at91/sama7g5.c  | 28 ++++++++++++-------------
 4 files changed, 52 insertions(+), 54 deletions(-)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index db6db9e2073eb..11fe2d05fa9bb 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sam9x60-pmc.h>
 
 #include "pmc.h"
 
@@ -214,7 +214,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sam9x60_pmc = pmc_data_allocate(PMC_PLLACK + 1,
+	sam9x60_pmc = pmc_data_allocate(SAM9X60_PMC_PLLACK + 1,
 					nck(sam9x60_systemck),
 					nck(sam9x60_periphck),
 					nck(sam9x60_gck), 8);
@@ -237,10 +237,10 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x60_pmc->chws[PMC_MAIN] = hw;
+	sam9x60_pmc->chws[SAM9X60_PMC_MAIN] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
-					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
+					   "mainck", sam9x60_pmc->chws[SAM9X60_PMC_MAIN],
 					   0, &plla_characteristics,
 					   &pll_frac_layout,
 					   /*
@@ -263,7 +263,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x60_pmc->chws[PMC_PLLACK] = hw;
+	sam9x60_pmc->chws[SAM9X60_PMC_PLLACK] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
 					   "main_osc", main_osc_hw, 1,
@@ -281,7 +281,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x60_pmc->chws[PMC_UTMI] = hw;
+	sam9x60_pmc->chws[SAM9X60_PMC_UTMI] = hw;
 
 	parent_names[0] = md_slck_name;
 	parent_names[1] = "mainck";
@@ -299,7 +299,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x60_pmc->chws[PMC_MCK] = hw;
+	sam9x60_pmc->chws[SAM9X60_PMC_MCK] = hw;
 
 	parent_names[0] = "pllack_divck";
 	parent_names[1] = "upllck_divck";
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index cbb8b220f16bc..c3c12e0523c4b 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -12,7 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sam9x7-pmc.h>
 
 #include "pmc.h"
 
@@ -220,7 +220,7 @@ static const struct {
 			.t = PLL_TYPE_DIV,
 			/* This feeds CPU. It should not be disabled */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
-			.eid = PMC_PLLACK,
+			.eid = SAM9X7_PMC_PLLACK,
 			.c = &plla_characteristics,
 		},
 	},
@@ -242,7 +242,7 @@ static const struct {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_UTMI,
+			.eid = SAM9X7_PMC_UTMI,
 			.c = &upll_characteristics,
 		},
 	},
@@ -264,7 +264,7 @@ static const struct {
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
 			.c = &audiopll_characteristics,
-			.eid = PMC_AUDIOPMCPLL,
+			.eid = SAM9X7_PMC_AUDIOPMCPLL,
 			.t = PLL_TYPE_DIV,
 		},
 
@@ -275,7 +275,7 @@ static const struct {
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
 			.c = &audiopll_characteristics,
-			.eid = PMC_AUDIOIOPLL,
+			.eid = SAM9X7_PMC_AUDIOIOPLL,
 			.t = PLL_TYPE_DIV,
 		},
 	},
@@ -297,7 +297,7 @@ static const struct {
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
 			.c = &lvdspll_characteristics,
-			.eid = PMC_LVDSPLL,
+			.eid = SAM9X7_PMC_LVDSPLL,
 			.t = PLL_TYPE_DIV,
 		},
 	},
@@ -313,7 +313,7 @@ static const struct {
 			 */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
 			.c = &plladiv2_characteristics,
-			.eid = PMC_PLLADIV2,
+			.eid = SAM9X7_PMC_PLLADIV2,
 			.t = PLL_TYPE_DIV,
 		},
 	},
@@ -741,7 +741,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sam9x7_pmc = pmc_data_allocate(PMC_LVDSPLL + 1,
+	sam9x7_pmc = pmc_data_allocate(SAM9X7_PMC_LVDSPLL + 1,
 				       nck(sam9x7_systemck),
 				       nck(sam9x7_periphck),
 				       nck(sam9x7_gck), 8);
@@ -770,7 +770,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x7_pmc->chws[PMC_MAIN] = hw;
+	sam9x7_pmc->chws[SAM9X7_PMC_MAIN] = hw;
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < 3; j++) {
@@ -782,7 +782,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			switch (sam9x7_plls[i][j].t) {
 			case PLL_TYPE_FRAC:
 				if (!strcmp(sam9x7_plls[i][j].p, "mainck"))
-					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
+					parent_hw = sam9x7_pmc->chws[SAM9X7_PMC_MAIN];
 				else if (!strcmp(sam9x7_plls[i][j].p, "main_osc"))
 					parent_hw = main_osc_hw;
 				else
@@ -838,7 +838,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x7_pmc->chws[PMC_MCK] = hw;
+	sam9x7_pmc->chws[SAM9X7_PMC_MCK] = hw;
 
 	parent_names[0] = "plla_divpmcck";
 	parent_names[1] = "upll_divpmcck";
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index a5d40df8b2f27..024c5abee25ff 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -11,7 +11,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sama7d65-pmc.h>
 
 #include "pmc.h"
 
@@ -19,8 +19,6 @@ static DEFINE_SPINLOCK(pmc_pll_lock);
 static DEFINE_SPINLOCK(pmc_mck0_lock);
 static DEFINE_SPINLOCK(pmc_mckX_lock);
 
-#define PMC_INDEX_MAX	25
-
 /*
  * PLL clocks identifiers
  * @PLL_ID_CPU:		CPU PLL identifier
@@ -221,7 +219,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			/* This feeds CPU. It should not be disabled. */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.eid = PMC_CPUPLL,
+			.eid = SAMA7D65_PMC_CPUPLL,
 			/*
 			 * Safe div=15 should be safe even for switching b/w 1GHz and
 			 * 90MHz (frac pll might go up to 1.2GHz).
@@ -256,7 +254,7 @@ static struct sama7d65_pll {
 			 * Therefore it should not be disabled.
 			 */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
-			.eid = PMC_SYSPLL,
+			.eid = SAMA7D65_PMC_SYSPLL,
 		},
 	},
 
@@ -324,7 +322,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_BAUDPLL,
+			.eid = SAMA7D65_PMC_BAUDPLL,
 		},
 	},
 
@@ -346,7 +344,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_AUDIOPMCPLL,
+			.eid = SAMA7D65_PMC_AUDIOPMCPLL,
 		},
 
 		[PLL_COMPID_DIV1] = {
@@ -357,7 +355,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_AUDIOIOPLL,
+			.eid = SAMA7D65_PMC_AUDIOIOPLL,
 		},
 	},
 
@@ -379,7 +377,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_ETHPLL,
+			.eid = SAMA7D65_PMC_ETHPLL,
 		},
 	},
 
@@ -401,7 +399,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_LVDSPLL,
+			.eid = SAMA7D65_PMC_LVDSPLL,
 		},
 	},
 
@@ -423,7 +421,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_UTMI,
+			.eid = SAMA7D65_PMC_UTMI,
 		},
 	},
 };
@@ -466,7 +464,7 @@ static struct {
 	  .ep_mux_table = { 5, },
 	  .ep_count = 1,
 	  .ep_chg_id = INT_MIN,
-	  .eid = PMC_MCK1,
+	  .eid = SAMA7D65_PMC_MCK1,
 	  .c = 1, },
 
 	{ .n = "mck2",
@@ -483,7 +481,7 @@ static struct {
 	  .ep_mux_table = { 5, 6, },
 	  .ep_count = 2,
 	  .ep_chg_id = INT_MIN,
-	  .eid = PMC_MCK3,
+	  .eid = SAMA7D65_PMC_MCK3,
 	  .c = 1, },
 
 	{ .n = "mck4",
@@ -500,7 +498,7 @@ static struct {
 	  .ep_mux_table = { 5, },
 	  .ep_count = 1,
 	  .ep_chg_id = INT_MIN,
-	  .eid = PMC_MCK5,
+	  .eid = SAMA7D65_PMC_MCK5,
 	  .c = 1, },
 
 	{ .n = "mck6",
@@ -1116,7 +1114,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sama7d65_pmc = pmc_data_allocate(PMC_INDEX_MAX,
+	sama7d65_pmc = pmc_data_allocate(SAMA7D65_PMC_INDEX_MAX,
 					 nck(sama7d65_systemck),
 					 nck(sama7d65_periphck),
 					 nck(sama7d65_gck), 8);
@@ -1149,7 +1147,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7d65_pmc->chws[PMC_MAIN] = hw;
+	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN] = hw;
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
@@ -1162,7 +1160,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7d65_plls[i][j].p) {
 				case SAMA7D65_PLL_PARENT_MAINCK:
-					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
+					parent_hw = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
 					break;
 				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
 					parent_hw = main_xtal_hw;
@@ -1211,12 +1209,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7d65_pmc->chws[PMC_MCK] = hw;
+	sama7d65_pmc->chws[SAMA7D65_PMC_MCK0] = hw;
 	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
 		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
 		struct clk_hw *tmp_parent_hws[8];
@@ -1265,7 +1263,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
 	parent_hws[3] = sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
 	parent_hws[4] = sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
 	parent_hws[5] = sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw;
@@ -1316,8 +1314,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7d65_pmc->chws[PMC_MCK1];
+	parent_hws[2] = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
+	parent_hws[3] = sama7d65_pmc->chws[SAMA7D65_PMC_MCK1];
 	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
 		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
 		struct clk_hw *tmp_parent_hws[8];
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 8385badc1c706..7dfeec8f2232b 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -12,7 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sama7g5-pmc.h>
 
 #include "pmc.h"
 
@@ -181,7 +181,7 @@ static struct sama7g5_pll {
 			.t = PLL_TYPE_DIV,
 			/* This feeds CPU. It should not be disabled. */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.eid = PMC_CPUPLL,
+			.eid = SAMA7G5_PMC_CPUPLL,
 			/*
 			 * Safe div=15 should be safe even for switching b/w 1GHz and
 			 * 90MHz (frac pll might go up to 1.2GHz).
@@ -216,7 +216,7 @@ static struct sama7g5_pll {
 			 * Therefore it should not be disabled.
 			 */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
-			.eid = PMC_SYSPLL,
+			.eid = SAMA7G5_PMC_SYSPLL,
 		},
 	},
 
@@ -304,7 +304,7 @@ static struct sama7g5_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_AUDIOPMCPLL,
+			.eid = SAMA7G5_PMC_AUDIOPMCPLL,
 		},
 
 		[PLL_COMPID_DIV1] = {
@@ -315,7 +315,7 @@ static struct sama7g5_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_AUDIOIOPLL,
+			.eid = SAMA7G5_PMC_AUDIOIOPLL,
 		},
 	},
 
@@ -379,7 +379,7 @@ static struct {
 	  .ep_mux_table = { 5, },
 	  .ep_count = 1,
 	  .ep_chg_id = INT_MIN,
-	  .eid = PMC_MCK1,
+	  .eid = SAMA7G5_PMC_MCK1,
 	  .c = 1, },
 
 	{ .n = "mck2",
@@ -995,7 +995,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sama7g5_pmc = pmc_data_allocate(PMC_MCK1 + 1,
+	sama7g5_pmc = pmc_data_allocate(SAMA7G5_PMC_MCK1 + 1,
 					nck(sama7g5_systemck),
 					nck(sama7g5_periphck),
 					nck(sama7g5_gck), 8);
@@ -1028,7 +1028,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7g5_pmc->chws[PMC_MAIN] = hw;
+	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN] = hw;
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
@@ -1041,7 +1041,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7g5_plls[i][j].p) {
 				case SAMA7G5_PLL_PARENT_MAINCK:
-					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
+					parent_hw = sama7g5_pmc->chws[SAMA7G5_PMC_MAIN];
 					break;
 				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
 					parent_hw = main_xtal_hw;
@@ -1090,11 +1090,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[PMC_MCK] = hw;
+	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[SAMA7G5_PMC_MCK0] = hw;
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7g5_pmc->chws[SAMA7G5_PMC_MAIN];
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7g5_mckx); i++) {
 		u8 num_parents = 3 + sama7g5_mckx[i].ep_count;
 		struct clk_hw *tmp_parent_hws[8];
@@ -1136,11 +1136,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7g5_pmc->chws[PMC_UTMI] = hw;
+	sama7g5_pmc->chws[SAMA7G5_PMC_UTMI] = hw;
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7g5_pmc->chws[SAMA7G5_PMC_MAIN];
 	parent_hws[3] = sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
 	parent_hws[4] = sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
 	parent_hws[5] = sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw;
@@ -1190,7 +1190,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7g5_pmc->chws[SAMA7G5_PMC_MAIN];
 	for (i = 0; i < ARRAY_SIZE(sama7g5_gck); i++) {
 		u8 num_parents = 3 + sama7g5_gck[i].pp_count;
 		struct clk_hw *tmp_parent_hws[8];
-- 
2.39.5

