Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE971307AFD;
	Tue, 24 Jun 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777773; cv=none; b=Yk7vzcXo2S0QjPQwXeFQVo8uu+Omtc1t7fP/6BhuswexDdhM4ti2gWzIwyisW0YKAy1IDawa/nyZWNcJJtlQ/MKmAsW8MdPNWMsGtH1JYQbsw7F057LdTCRxaUMs0BTdVShShFYfZIPU92qgCPzGW/bO+hgBFwUEm8p1TF2R92w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777773; c=relaxed/simple;
	bh=L7YqKuTIwCYHtrw/RUpnVI94eOPAPR+812suCuUne80=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=copj252Li4tGlqMbyRjGuOEl9cJJkj51kyZgd43y6/4txW1y+8LgAlkZdoUxaUrkhpboE/WoTwrk/uBtJobvmsJJYhmxherncZyrka77h3iDfardG75ocYGcBbru569r6KUsFb/KglwE8Rx9BNGZBn6JraEcCYSY2Lbj6IpkWFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=n8QA8Bss; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="n8QA8Bss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777769; x=1782313769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L7YqKuTIwCYHtrw/RUpnVI94eOPAPR+812suCuUne80=;
  b=n8QA8BssdDmqOm5jSg3RhOAfuei0/P1QRzKczNyQvSeu0yvBBfPBAIlS
   4buJai5ZDPmtXxvfNpA7En+5xmLc7KMfXnJb6jo+Hv3PAAhNqPQW0Ciqs
   1z29AqTIwODuFfJNu5PstujXc00c9jh9HUaSvmdHX2vg2GoVY+50ANdGr
   WVucxqKqAbdC2yCH4uJNwQIfx7Z9cGEM8msFaYR4iXvbJYOev7MZuDAHr
   TkEisFs/cg05rhQfjrosN9HmTkv/ZDU0o2Jc9btxtsS0YyalGSaq/ZScn
   5dqvdLWEeBivBoKBxL0H4JTR8c8MJrnMQscHrIwq+Uptvhx9vReGNlhV/
   g==;
X-CSE-ConnectionGUID: ticneE1VRpCt6c5L3blMOw==
X-CSE-MsgGUID: USWrQUkhRoyvEBRirVuBUQ==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="210641603"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:41 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:40 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 32/32] clk: at91: sama7d65: switch to clk_parent_data
Date: Tue, 24 Jun 2025 08:08:29 -0700
Message-ID: <79fe811a4282bafeb9e30fbf42ae5cf584788eac.1750182562.git.Ryan.Wanner@microchip.com>
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Switch SAMA7D65 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama7d65.c | 113 +++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index b74813a288a8..23723587cf9a 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1089,36 +1089,34 @@ static const struct clk_pcr_layout sama7d65_pcr_layout = {
 
 static void __init sama7d65_pmc_setup(struct device_node *np)
 {
-	const char *main_xtal_name = "main_xtal";
+	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
+	const char * const main_xtal_name = "main_xtal";
+	const char * const td_slck_name = "td_slck";
+	const char * const md_slck_name = "md_slck";
+	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
+	struct clk_parent_data parent_data[10];
 	struct pmc_data *sama7d65_pmc;
-	const char *parent_names[11];
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
 
 	sama7d65_pmc = pmc_data_allocate(PMC_INDEX_MAX,
 					 nck(sama7d65_systemck),
 					 nck(sama7d65_periphck),
 					 nck(sama7d65_gck), 8);
 	if (!sama7d65_pmc)
-		return;
+		goto put_main_xtal;
 
 	alloc_mem = kmalloc(sizeof(void *) *
 			    (ARRAY_SIZE(sama7d65_mckx) + ARRAY_SIZE(sama7d65_gck)),
@@ -1133,16 +1131,15 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
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
 
@@ -1150,7 +1147,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate = 0;
 
 			if (!sama7d65_plls[i][j].n)
 				continue;
@@ -1159,20 +1156,22 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7d65_plls[i][j].p) {
 				case SAMA7D65_PLL_PARENT_MAINCK:
-					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
+					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
+					parent_rate = clk_hw_get_rate(sama7d65_pmc->chws[PMC_MAIN]);
 					break;
 				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
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
 
 				hw = sam9x60_clk_register_frac_pll(regmap,
 					&pmc_pll_lock, sama7d65_plls[i][j].n,
-					NULL, parent_hw, i,
+					parent_data, parent_rate, i,
 					sama7d65_plls[i][j].c,
 					sama7d65_plls[i][j].l,
 					sama7d65_plls[i][j].f);
@@ -1202,7 +1201,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	}
 
 	hw = at91_clk_register_master_div(regmap, "mck0", NULL,
-					  sama7d65_plls[PLL_ID_CPU][1].hw,
+					  &AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_CPU][1].hw),
 					  &mck0_layout, &mck0_characteristics,
 					  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
 	if (IS_ERR(hw))
@@ -1211,12 +1210,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	sama7d65_pmc->chws[PMC_MCK] = hw;
 	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
 		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1233,13 +1231,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			u8 pll_id = sama7d65_mckx[i].ep[j].pll_id;
 			u8 pll_compid = sama7d65_mckx[i].ep[j].pll_compid;
 
-			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
+			parent_data[3 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
 		}
-		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
-			       sama7d65_mckx[i].ep_count);
 
 		hw = at91_clk_sama7g5_register_master(regmap, sama7d65_mckx[i].n,
-						      num_parents, NULL, parent_hws,
+						      num_parents, NULL, parent_data,
 						      mux_table, &pmc_mckX_lock,
 						      sama7d65_mckx[i].id,
 						      sama7d65_mckx[i].c,
@@ -1253,29 +1249,29 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			sama7d65_pmc->chws[sama7d65_mckx[i].eid] = hw;
 	}
 
-	parent_names[0] = "syspll_divpmcck";
-	parent_names[1] = "usbpll_divpmcck";
-	parent_names[2] = "main_osc";
-	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
+	parent_data[0] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
+	parent_data[1] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_USB][PLL_COMPID_DIV0].hw);
+	parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
+	hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
-	parent_hws[4] = sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
-	parent_hws[7] = sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
-	parent_hws[8] = sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
+	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw);
+	parent_data[7] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
+	parent_data[8] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw);
 
 	for (i = 0; i < 8; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
-		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
+		hw = at91_clk_register_programmable(regmap, name, NULL, parent_data,
 						    9, i,
 						    &programmable_layout,
 						    sama7d65_prog_mux_table);
@@ -1287,7 +1283,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
-					      sama7d65_systemck[i].p, NULL,
+					      NULL, &AT91_CLK_PD_HW(sama7d65_pmc->pchws[i]),
 					      sama7d65_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
@@ -1300,7 +1296,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 							 &sama7d65_pcr_layout,
 							 sama7d65_periphck[i].n,
 							 NULL,
-							 sama7d65_mckx[sama7d65_periphck[i].p].hw,
+							 &AT91_CLK_PD_HW(sama7d65_mckx[sama7d65_periphck[i].p].hw),
 							 sama7d65_periphck[i].id,
 							 &sama7d65_periphck[i].r,
 							 sama7d65_periphck[i].chgp ? 0 :
@@ -1311,13 +1307,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 		sama7d65_pmc->phws[sama7d65_periphck[i].id] = hw;
 	}
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7d65_pmc->chws[PMC_MCK1];
+	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
+	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);
+	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MCK1]);
 	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
 		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
-		struct clk_hw *tmp_parent_hws[8];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -1334,15 +1329,13 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
 			u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
 
-			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
+			parent_data[4 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
 		}
-		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
-			       sama7d65_gck[i].pp_count);
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sama7d65_pcr_layout,
 						 sama7d65_gck[i].n, NULL,
-						 parent_hws, mux_table,
+						 parent_data, mux_table,
 						 num_parents,
 						 sama7d65_gck[i].id,
 						 &sama7d65_gck[i].r,
@@ -1356,7 +1349,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7d65_pmc);
 	kfree(alloc_mem);
 
-	return;
+	goto put_main_xtal;
 
 err_free:
 	if (alloc_mem) {
@@ -1366,6 +1359,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	}
 
 	kfree(sama7d65_pmc);
+put_main_xtal:
+	clk_put(main_xtal);
 }
 
 /* Some clks are used for a clocksource */
-- 
2.43.0

