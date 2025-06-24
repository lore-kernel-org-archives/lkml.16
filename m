Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322312FEE1D;
	Tue, 24 Jun 2025 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777767; cv=none; b=BWBm9oysXCWHFLIFZbaneSFyGieuCYUF/OlTc4sashlxXM3jxrDd7MWmt8qIRpMewQ12iSoYPib1hNUd/tMKljGoMjYqvI0qr0EF/Yi9JWHLY0twl/gBPmsyI6Gb1q20EWJTCMpIucYREf/yw8GJ/qC552Z5/jNwjdgfTEAYI38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777767; c=relaxed/simple;
	bh=wfB5uD6gCAGNdoYI5EDNa7yZo4eCMYHdNNhDsFxYvQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dEh15AuCECkaFUD+f+g/yYNkfPvZS+KzmsO5fuZtPKR/A/tElLROD2anKp/VKq7lP8pYl/lingDWKKeRSA9wo2mj3FWoc9yREdORuQg70dGL55x3KbYTl1ZgyOCgg4qfAfK4LkDr00BfOM9VCBCQDJrwx6m3GDqOJYEzENXUGSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=T/NkOn+1; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="T/NkOn+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777764; x=1782313764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wfB5uD6gCAGNdoYI5EDNa7yZo4eCMYHdNNhDsFxYvQo=;
  b=T/NkOn+1GFLI2AV7k34+1bVnJYW/DDmUYL8yKPtP+opBi+dRU7ekC2dU
   YDZaGtQTCjckhWuPcthAEquya5Up5PlB1W7Mmlek09r9WDbahmCIeJrrD
   khQKtbAc21BRvrcFqeO9mIUL6bzyPsc5MmNeZmcRhO/NUQU+CNy5ywWSR
   0uiXzM0L1lVv9ziojLQvXJOEwUE/df9lfCwHvwTPBtzA+xP1hF46Wl7F+
   3TIBp7UMI83WDvm5FFWtKncqZgypcBjNliuKWHJeuXu4cksmn2gtP68Vz
   V/3+UOTQm9z1rAN4IiE3bW519OevLLn8npen0kUg8nh7GwnQsiDqAklxu
   w==;
X-CSE-ConnectionGUID: ticneE1VRpCt6c5L3blMOw==
X-CSE-MsgGUID: y5KC2cayRRO9o5jg7WNSvA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="210641596"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:19 -0700
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
Subject: [PATCH v2 26/32] clk: at91: at91sam9260: switch to parent_hw and parent_data
Date: Tue, 24 Jun 2025 08:08:23 -0700
Message-ID: <9d0506b03b23ce3354b8a956e5da183302ad1f31.1750182562.git.Ryan.Wanner@microchip.com>
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

Switch AT91SAM92600 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91sam9260.c | 136 +++++++++++++++++----------------
 1 file changed, 70 insertions(+), 66 deletions(-)

diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index ae6f126f204a..827ae743b657 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -9,7 +9,7 @@
 
 struct sck {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	u8 id;
 };
 
@@ -24,7 +24,7 @@ struct at91sam926x_data {
 	const struct clk_pll_layout *pllb_layout;
 	const struct clk_pll_characteristics *pllb_characteristics;
 	const struct clk_master_characteristics *mck_characteristics;
-	const struct sck *sck;
+	struct sck *sck;
 	const struct pck *pck;
 	u8 num_sck;
 	u8 num_pck;
@@ -72,11 +72,11 @@ static const struct clk_pll_characteristics sam9260_pllb_characteristics = {
 	.out = sam9260_pllb_out,
 };
 
-static const struct sck at91sam9260_systemck[] = {
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
+static struct sck at91sam9260_systemck[] = {
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
 };
 
 static const struct pck at91sam9260_periphck[] = {
@@ -213,15 +213,15 @@ static const struct clk_pll_characteristics sam9261_pllb_characteristics = {
 	.out = sam9261_pllb_out,
 };
 
-static const struct sck at91sam9261_systemck[] = {
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-	{ .n = "pck2",  .p = "prog2",    .id = 10 },
-	{ .n = "pck3",  .p = "prog3",    .id = 11 },
-	{ .n = "hclk0", .p = "masterck_div", .id = 16 },
-	{ .n = "hclk1", .p = "masterck_div", .id = 17 },
+static struct sck at91sam9261_systemck[] = {
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
+	{ .n = "pck2",  .id = 10 },
+	{ .n = "pck3",  .id = 11 },
+	{ .n = "hclk0", .id = 16 },
+	{ .n = "hclk1", .id = 17 },
 };
 
 static const struct pck at91sam9261_periphck[] = {
@@ -277,13 +277,13 @@ static const struct clk_pll_characteristics sam9263_pll_characteristics = {
 	.out = sam9260_plla_out,
 };
 
-static const struct sck at91sam9263_systemck[] = {
-	{ .n = "uhpck", .p = "usbck",    .id = 6 },
-	{ .n = "udpck", .p = "usbck",    .id = 7 },
-	{ .n = "pck0",  .p = "prog0",    .id = 8 },
-	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-	{ .n = "pck2",  .p = "prog2",    .id = 10 },
-	{ .n = "pck3",  .p = "prog3",    .id = 11 },
+static struct sck at91sam9263_systemck[] = {
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
+	{ .n = "pck2",  .id = 10 },
+	{ .n = "pck3",  .id = 11 },
 };
 
 static const struct pck at91sam9263_periphck[] = {
@@ -329,26 +329,15 @@ static struct at91sam926x_data at91sam9263_data = {
 static void __init at91sam926x_pmc_setup(struct device_node *np,
 					 struct at91sam926x_data *data)
 {
-	const char *slowxtal_name, *mainxtal_name;
+	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
+	u8 slow_clk_index = 0, main_xtal_index = 1;
+	struct clk_parent_data parent_data[4];
 	struct pmc_data *at91sam9260_pmc;
 	u32 usb_div[] = { 1, 2, 4, 0 };
-	const char *parent_names[6];
-	const char *slck_name;
+	struct clk_hw *usbck_hw, *hw;
 	struct regmap *regmap;
-	struct clk_hw *hw;
-	int i;
 	bool bypass;
-
-	i = of_property_match_string(np, "clock-names", "slow_xtal");
-	if (i < 0)
-		return;
-
-	slowxtal_name = of_clk_get_parent_name(np, i);
-
-	i = of_property_match_string(np, "clock-names", "main_xtal");
-	if (i < 0)
-		return;
-	mainxtal_name = of_clk_get_parent_name(np, i);
+	int i;
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -363,12 +352,13 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
+	hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+					&AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
 					bypass);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_rm9200_main(regmap, "mainck", "main_osc", NULL);
+	hw = at91_clk_register_rm9200_main(regmap, "mainck", NULL, &AT91_CLK_PD_HW(hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
@@ -382,20 +372,17 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 		if (IS_ERR(hw))
 			goto err_free;
 
-		parent_names[0] = "slow_rc_osc";
-		parent_names[1] = "slow_xtal";
-		hw = at91_clk_register_sam9260_slow(regmap, "slck",
-						    parent_names, 2);
+		parent_data[0] = AT91_CLK_PD_HW(hw);
+		parent_data[1] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
+		hw = at91_clk_register_sam9260_slow(regmap, "slck", NULL, parent_data, 2);
 		if (IS_ERR(hw))
 			goto err_free;
 
 		at91sam9260_pmc->chws[PMC_SLOW] = hw;
-		slck_name = "slck";
-	} else {
-		slck_name = slowxtal_name;
 	}
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL,
+				   &AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MAIN]), 0,
 				   data->plla_layout,
 				   data->plla_characteristics);
 	if (IS_ERR(hw))
@@ -403,7 +390,8 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	at91sam9260_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_pll(regmap, "pllbck", "mainck", 1,
+	hw = at91_clk_register_pll(regmap, "pllbck", NULL,
+				   &AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MAIN]), 1,
 				   data->pllb_layout,
 				   data->pllb_characteristics);
 	if (IS_ERR(hw))
@@ -411,12 +399,12 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	at91sam9260_pmc->chws[PMC_PLLBCK] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack";
-	parent_names[3] = "pllbck";
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLACK]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_data,
 					   &at91rm9200_master_layout,
 					   data->mck_characteristics,
 					   &at91sam9260_mck_lock);
@@ -424,7 +412,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+					  NULL, &AT91_CLK_PD_HW(hw),
 					  &at91rm9200_master_layout,
 					  data->mck_characteristics,
 					  &at91sam9260_mck_lock,
@@ -434,21 +422,23 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	at91sam9260_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91rm9200_clk_register_usb(regmap, "usbck", "pllbck", NULL, usb_div);
-	if (IS_ERR(hw))
+	usbck_hw = at91rm9200_clk_register_usb(regmap, "usbck", NULL,
+					       &AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLBCK]),
+					       usb_div);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "pllack";
-	parent_names[3] = "pllbck";
+	parent_data[0] = AT91_CLK_PD_NAME(slow_clk_name, slow_clk_index);
+	parent_data[1] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MAIN]);
+	parent_data[2] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_PLLBCK]);
 	for (i = 0; i < data->num_progck; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 4, i,
+						    NULL, parent_data, 4, i,
 						    &at91rm9200_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -457,9 +447,22 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 		at91sam9260_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	data->sck[0].parent_hw = usbck_hw;
+	data->sck[1].parent_hw = usbck_hw;
+	data->sck[2].parent_hw = at91sam9260_pmc->pchws[0];
+	data->sck[3].parent_hw = at91sam9260_pmc->pchws[1];
+	if (data->num_sck == 6) {
+		data->sck[4].parent_hw = at91sam9260_pmc->pchws[2];
+		data->sck[5].parent_hw = at91sam9260_pmc->pchws[3];
+	}
+	if (data->num_sck == 8) {
+		data->sck[6].parent_hw = at91sam9260_pmc->chws[PMC_MCK];
+		data->sck[7].parent_hw = at91sam9260_pmc->chws[PMC_MCK];
+	}
 	for (i = 0; i < data->num_sck; i++) {
-		hw = at91_clk_register_system(regmap, data->sck[i].n,
-					      data->sck[i].p, NULL,
+		hw = at91_clk_register_system(regmap, data->sck[i].n, NULL,
+					      &AT91_CLK_PD_HW(data->sck[i].parent_hw),
 					      data->sck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
@@ -470,7 +473,8 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	for (i = 0; i < data->num_pck; i++) {
 		hw = at91_clk_register_peripheral(regmap,
 						  data->pck[i].n,
-						  "masterck_div", NULL,
+						  NULL,
+						  &AT91_CLK_PD_HW(at91sam9260_pmc->chws[PMC_MCK]),
 						  data->pck[i].id);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.43.0

