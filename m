Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C59307AEB;
	Tue, 24 Jun 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777771; cv=none; b=CNQ7/jTvO/1oJp0Fcd2GrchB96ajmyMf6GnGGh52XGM13KWrXO2c/zKl+AOQVZagdBEdyifxKcxpwi4vFemxpKGFeyr1rxFevsHk9X3XRwIu0czxYDFFO58H3dO3xF2ylfjYDpyAiftX5CEPceIK61M5AEV63aIpGwPCjBSmSUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777771; c=relaxed/simple;
	bh=Q36se3Fv5wrz4xwPyMEyT8KGoXdptrkCfrP0P7CE8os=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLCeoH40vymjBf/m0jCCqmm6ouGwmVhl3kmylpiOtGfb1kfzx1KvpWsYtYVn8obOZPCBbN2JASciVnANTfk3taOYfMXEkS0Q6rLNd1had0onA572rIp06al0kbkfqn+BrQ5V5DrqHpgbBRJmOjLkumJmcynbGCu8mRvmOD5I0+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=MYgENOY9; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="MYgENOY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777769; x=1782313769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q36se3Fv5wrz4xwPyMEyT8KGoXdptrkCfrP0P7CE8os=;
  b=MYgENOY9Ib8WYrteZBFONdEAbAmOPMipASCc3fgLE+K6kOVrROgV+Nug
   umnEaqDxrvr8xA3X8A8dHMeyCT+RrpdDItyFji2gdRfmcKprNVawX7Vec
   81hCsBaDVIWGnq4oQgmONL6QuBy5cVh5U1iml/3niptOxA/gPLFtYwn0R
   i/56zJJyvkb5TDLro5YyXlG+ED8UW4c7jwCpP1hDgNvp8sZygAM7LQWcs
   NzIeioE7aSoi2ZfrM0eExRLSjm/gtob1y8THBaDccFonvvk4YwoaWhXtg
   068w7w7aND+ryP0MLMpxOgAU/AlAu/o/i2MrGHFB1qvMU1GoH6VLApTtK
   A==;
X-CSE-ConnectionGUID: ticneE1VRpCt6c5L3blMOw==
X-CSE-MsgGUID: nCSw0OAMR0Gbr53mq+OqRA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="210641602"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:40 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:40 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 31/32] clk: at91: sama7g5: switch to clk_parent_data
Date: Tue, 24 Jun 2025 08:08:28 -0700
Message-ID: <5bec7266f92f426c061e4452b4a6b67f33911f2c.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750182562.git.Ryan.Wanner@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Switch SAMA7G5 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Took all the small changes for this SoC
from the clock core commits and put them into this patch as one full
commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama7g5.c | 108 ++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index bf6092fea217..954202e0e8f9 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -969,35 +969,34 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
 
 static void __init sama7g5_pmc_setup(struct device_node *np)
 {
-	const char *main_xtal_name = "main_xtal";
+	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
+	const char * const main_xtal_name = "main_xtal";
+	const char * const td_slck_name = "td_slck";
+	const char * const md_slck_name = "md_slck";
+	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
+	struct clk_parent_data parent_data[10];
 	struct pmc_data *sama7g5_pmc;
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
+	struct clk *main_xtal;
 	struct regmap *regmap;
-	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
-	struct clk_hw *td_slck_hw, *md_slck_hw;
-	static struct clk_parent_data parent_data;
-	struct clk_hw *parent_hws[10];
 	bool bypass;
 	int i, j;
 
-	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
-	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
-
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	main_xtal = of_clk_get(np, main_xtal_index);
+	if (IS_ERR(main_xtal))
 		return;
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
-		return;
+		goto put_main_xtal;
 
 	sama7g5_pmc = pmc_data_allocate(PMC_MCK1 + 1,
 					nck(sama7g5_systemck),
 					nck(sama7g5_periphck),
 					nck(sama7g5_gck), 8);
 	if (!sama7g5_pmc)
-		return;
+		goto put_main_xtal;
 
 	alloc_mem = kmalloc(sizeof(void *) *
 			    (ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck)),
@@ -1012,16 +1011,15 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	parent_data.name = main_xtal_name;
-	parent_data.fw_name = main_xtal_name;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
-						 &parent_data, bypass);
+						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
+						 bypass);
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
-	parent_hws[0] = main_rc_hw;
-	parent_hws[1] = main_osc_hw;
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
+	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
+	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -1029,7 +1027,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate = 0;
 
 			if (!sama7g5_plls[i][j].n)
 				continue;
@@ -1038,20 +1036,25 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7g5_plls[i][j].p) {
 				case SAMA7G5_PLL_PARENT_MAINCK:
-					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
+					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
+					parent_rate = clk_hw_get_rate(sama7g5_pmc->chws[PMC_MAIN]);
 					break;
 				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
+									  main_xtal_index);
+					parent_rate = clk_get_rate(main_xtal);
 					break;
 				default:
 					/* Should not happen. */
-					parent_hw = NULL;
 					break;
 				}
 
+				if (!parent_rate)
+					return;
+
 				hw = sam9x60_clk_register_frac_pll(regmap,
 					&pmc_pll_lock, sama7g5_plls[i][j].n,
-					NULL, parent_hw, i,
+					parent_data, parent_rate, i,
 					sama7g5_plls[i][j].c,
 					sama7g5_plls[i][j].l,
 					sama7g5_plls[i][j].f);
@@ -1081,7 +1084,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	}
 
 	hw = at91_clk_register_master_div(regmap, "mck0", NULL,
-					  sama7g5_plls[PLL_ID_CPU][1].hw,
+					  &AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_CPU][1].hw),
 					  &mck0_layout, &mck0_characteristics,
 					  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
 	if (IS_ERR(hw))
@@ -1089,12 +1092,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[PMC_MCK] = hw;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7g5_mckx); i++) {
 		u8 num_parents = 3 + sama7g5_mckx[i].ep_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1109,13 +1111,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			u8 pll_id = sama7g5_mckx[i].ep[j].pll_id;
 			u8 pll_compid = sama7g5_mckx[i].ep[j].pll_compid;
 
-			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
+			parent_data[3 + j] = AT91_CLK_PD_HW(sama7g5_plls[pll_id][pll_compid].hw);
 		}
-		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
-			       sama7g5_mckx[i].ep_count);
 
 		hw = at91_clk_sama7g5_register_master(regmap, sama7g5_mckx[i].n,
-				   num_parents, NULL, parent_hws, mux_table,
+				   num_parents, NULL, parent_data, mux_table,
 				   &pmc_mckX_lock, sama7g5_mckx[i].id,
 				   sama7g5_mckx[i].c,
 				   sama7g5_mckx[i].ep_chg_id);
@@ -1129,27 +1129,28 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			sama7g5_pmc->chws[sama7g5_mckx[i].eid] = hw;
 	}
 
-	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL, main_xtal_hw);
+	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL,
+					    &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama7g5_pmc->chws[PMC_UTMI] = hw;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
-	parent_hws[4] = sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
-	parent_hws[7] = sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
-	parent_hws[8] = sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
+	parent_data[4] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw);
+	parent_data[7] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
+	parent_data[8] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw);
 	for (i = 0; i < 8; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
-		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
+		hw = at91_clk_register_programmable(regmap, name, NULL, parent_data,
 						    9, i,
 						    &programmable_layout,
 						    sama7g5_prog_mux_table);
@@ -1161,7 +1162,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < ARRAY_SIZE(sama7g5_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama7g5_systemck[i].n,
-					      NULL, sama7g5_pmc->pchws[i],
+					      NULL, &AT91_CLK_PD_HW(sama7g5_pmc->pchws[i]),
 					      sama7g5_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
@@ -1174,7 +1175,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 						&sama7g5_pcr_layout,
 						sama7g5_periphck[i].n,
 						NULL,
-						sama7g5_mckx[sama7g5_periphck[i].p].hw,
+						&AT91_CLK_PD_HW(sama7g5_mckx[sama7g5_periphck[i].p].hw),
 						sama7g5_periphck[i].id,
 						&sama7g5_periphck[i].r,
 						sama7g5_periphck[i].chgp ? 0 :
@@ -1185,12 +1186,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 		sama7g5_pmc->phws[sama7g5_periphck[i].id] = hw;
 	}
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
 	for (i = 0; i < ARRAY_SIZE(sama7g5_gck); i++) {
 		u8 num_parents = 3 + sama7g5_gck[i].pp_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1205,15 +1205,13 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			u8 pll_id = sama7g5_gck[i].pp[j].pll_id;
 			u8 pll_compid = sama7g5_gck[i].pp[j].pll_compid;
 
-			tmp_parent_hws[j] = sama7g5_plls[pll_id][pll_compid].hw;
+			parent_data[3 + j] = AT91_CLK_PD_HW(sama7g5_plls[pll_id][pll_compid].hw);
 		}
-		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
-			       sama7g5_gck[i].pp_count);
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sama7g5_pcr_layout,
 						 sama7g5_gck[i].n, NULL,
-						 parent_hws, mux_table,
+						 parent_data, mux_table,
 						 num_parents,
 						 sama7g5_gck[i].id,
 						 &sama7g5_gck[i].r,
@@ -1227,7 +1225,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7g5_pmc);
 
-	return;
+	goto put_main_xtal;
 
 err_free:
 	if (alloc_mem) {
@@ -1237,6 +1235,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	}
 
 	kfree(sama7g5_pmc);
+put_main_xtal:
+	clk_put(main_xtal);
 }
 
 /* Some clks are used for a clocksource */
-- 
2.43.0

