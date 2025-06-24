Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43712F270B;
	Tue, 24 Jun 2025 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777734; cv=none; b=NLKr24xrn1oIjrHdHLLDBo+rbUhOFWMHEKWDEqVx1Orf/pecsIrlcw/ldkoEQcjVcyacdqCWZbXIOwT9nXOG3mIx1qCOWT5QM8JSei531jZG12cF9iuS2QGtbvW6EgHBbdjecGyDi0mTdGs21lz8X11BtmJclegXjmTpoVtZ8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777734; c=relaxed/simple;
	bh=OGpUdaWgmzLt78/5e1PIEn4p0QRFG77KwlZ6mGggQxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMcEC6PbWZ8NhFIvh3HxLmfKLG1gEMkjIO564+xZyK/g0uLdFLaxD43eSDVWX8g+VFfCOw0WX7bozT7L9LW9lRkQ8ZxMr/jkjjhkfw2UWOykU+KutKij9vnkDtx2AdsQdGkwnFgLs2+k35hRyAmNlKxF1EgbeVrVfOipJCDUgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=qHQVvrYW; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="qHQVvrYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777731; x=1782313731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OGpUdaWgmzLt78/5e1PIEn4p0QRFG77KwlZ6mGggQxQ=;
  b=qHQVvrYWrWQtSaYCWZFmcl72mJZXJd4raPGV/G0UrLGMI4F1J7cGSzt7
   KnuGZOVTF3wGz2HDQ//QueVhYmwKi5+yXz0B/wb7gGW0SO/Mmm+o3PVGs
   uRBZln4WCJSrn9jKJQFtxZrHSfZYqlK0lAiU7C6Eqmo1MVM52aorNyibS
   j+sKDmAncgvsU04Zgt4vhYxY9RIUBm5RdrUR2Gvnon9BKoJS+t/wsqI9c
   HHS4pJTpvh3VmHMJhQDfAR6A8B41nRA5mEYLsU8aozTTZHXoRVV9oS2Qx
   ID7NHuvsodzjIw4JGRN0bOuMG+Vb/BWGe2Ub2dQ3F2q8uFtK15PRK0iA2
   g==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: 3qyNMxbBR3ehMCe8tC6DDQ==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688185"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:37 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:37 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 10/32] clk: at91: clk-usb: add support for clk_parent_data
Date: Tue, 24 Jun 2025 08:08:07 -0700
Message-ID: <ed90e8cc84777f6d44fbc0454919e440e090122a.1750182562.git.Ryan.Wanner@microchip.com>
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

Add support for clk_parent_data in usb clock driver.

All the SoC based drivers that rely on clk-usb were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91rm9200.c  |  2 +-
 drivers/clk/at91/at91sam9260.c |  2 +-
 drivers/clk/at91/at91sam9g45.c |  2 +-
 drivers/clk/at91/at91sam9n12.c |  2 +-
 drivers/clk/at91/at91sam9x5.c  |  2 +-
 drivers/clk/at91/clk-usb.c     | 41 ++++++++++++++++++++++------------
 drivers/clk/at91/dt-compat.c   |  6 ++---
 drivers/clk/at91/pmc.h         | 11 +++++----
 drivers/clk/at91/sam9x60.c     |  2 +-
 drivers/clk/at91/sama5d2.c     |  2 +-
 drivers/clk/at91/sama5d3.c     |  2 +-
 drivers/clk/at91/sama5d4.c     |  2 +-
 12 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index 3f19e737ae4d..e5a034f208d8 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -157,7 +157,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 
 	at91rm9200_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91rm9200_clk_register_usb(regmap, "usbck", "pllbck", usb_div);
+	hw = at91rm9200_clk_register_usb(regmap, "usbck", "pllbck", NULL, usb_div);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index 0799a13060ea..ae6f126f204a 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -434,7 +434,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 
 	at91sam9260_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91rm9200_clk_register_usb(regmap, "usbck", "pllbck", usb_div);
+	hw = at91rm9200_clk_register_usb(regmap, "usbck", "pllbck", NULL, usb_div);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index f45a7b80f7d8..684d2bcb36e8 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -176,7 +176,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, 2);
+	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
index 751786184ae2..9fc20b177b13 100644
--- a/drivers/clk/at91/at91sam9n12.c
+++ b/drivers/clk/at91/at91sam9n12.c
@@ -201,7 +201,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 
 	at91sam9n12_pmc->chws[PMC_MCK] = hw;
 
-	hw = at91sam9n12_clk_register_usb(regmap, "usbck", "pllbck");
+	hw = at91sam9n12_clk_register_usb(regmap, "usbck", "pllbck", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 3b801d12fac0..5728cfb9036f 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -222,7 +222,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, 2);
+	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
index b0696a928aa9..b2503fad4543 100644
--- a/drivers/clk/at91/clk-usb.c
+++ b/drivers/clk/at91/clk-usb.c
@@ -221,12 +221,12 @@ static const struct clk_ops at91sam9n12_usb_ops = {
 
 static struct clk_hw * __init
 _at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
-			     const char **parent_names, u8 num_parents,
-			     u32 usbs_mask)
+			     const char **parent_names, struct clk_parent_data *parent_data,
+			     u8 num_parents, u32 usbs_mask)
 {
 	struct at91sam9x5_clk_usb *usb;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
@@ -235,7 +235,10 @@ _at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &at91sam9x5_usb_ops;
-	init.parent_names = parent_names;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = parent_names;
 	init.num_parents = num_parents;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		     CLK_SET_RATE_PARENT;
@@ -257,27 +260,30 @@ _at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
-			    const char **parent_names, u8 num_parents)
+			    const char **parent_names, struct clk_parent_data *parent_data,
+			    u8 num_parents)
 {
 	return _at91sam9x5_clk_register_usb(regmap, name, parent_names,
-					    num_parents, SAM9X5_USBS_MASK);
+					    parent_data, num_parents, SAM9X5_USBS_MASK);
 }
 
 struct clk_hw * __init
 sam9x60_clk_register_usb(struct regmap *regmap, const char *name,
-			 const char **parent_names, u8 num_parents)
+			 const char **parent_names, struct clk_parent_data *parent_data,
+			 u8 num_parents)
 {
 	return _at91sam9x5_clk_register_usb(regmap, name, parent_names,
-					    num_parents, SAM9X60_USBS_MASK);
+					    parent_data, num_parents,
+					    SAM9X60_USBS_MASK);
 }
 
 struct clk_hw * __init
 at91sam9n12_clk_register_usb(struct regmap *regmap, const char *name,
-			     const char *parent_name)
+			     const char *parent_name, struct clk_parent_data *parent_data)
 {
 	struct at91sam9x5_clk_usb *usb;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
@@ -286,7 +292,10 @@ at91sam9n12_clk_register_usb(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &at91sam9n12_usb_ops;
-	init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT;
 
@@ -390,11 +399,12 @@ static const struct clk_ops at91rm9200_usb_ops = {
 
 struct clk_hw * __init
 at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
-			    const char *parent_name, const u32 *divisors)
+			    const char *parent_name, struct clk_parent_data *parent_data,
+			    const u32 *divisors)
 {
 	struct at91rm9200_clk_usb *usb;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
@@ -403,7 +413,10 @@ at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &at91rm9200_usb_ops;
-	init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_PARENT;
 
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index f5a5f9ba7634..7883198f6a98 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -946,7 +946,7 @@ static void __init of_at91sam9x5_clk_usb_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91sam9x5_clk_register_usb(regmap, name, parent_names,
+	hw = at91sam9x5_clk_register_usb(regmap, name, parent_names, NULL,
 					 num_parents);
 	if (IS_ERR(hw))
 		return;
@@ -976,7 +976,7 @@ static void __init of_at91sam9n12_clk_usb_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91sam9n12_clk_register_usb(regmap, name, parent_name);
+	hw = at91sam9n12_clk_register_usb(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
@@ -1009,7 +1009,7 @@ static void __init of_at91rm9200_clk_usb_setup(struct device_node *np)
 	of_node_put(parent_np);
 	if (IS_ERR(regmap))
 		return;
-	hw = at91rm9200_clk_register_usb(regmap, name, parent_name, divisors);
+	hw = at91rm9200_clk_register_usb(regmap, name, parent_name, NULL, divisors);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 0646775dfb1d..c66ee44255d7 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -285,16 +285,19 @@ at91_clk_register_system(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
-			    const char **parent_names, u8 num_parents);
+			    const char **parent_names, struct clk_parent_data *parent_data,
+			    u8 num_parents);
 struct clk_hw * __init
 at91sam9n12_clk_register_usb(struct regmap *regmap, const char *name,
-			     const char *parent_name);
+			     const char *parent_name, struct clk_parent_data *parent_data);
 struct clk_hw * __init
 sam9x60_clk_register_usb(struct regmap *regmap, const char *name,
-			 const char **parent_names, u8 num_parents);
+			 const char **parent_names, struct clk_parent_data *parent_data,
+			 u8 num_parents);
 struct clk_hw * __init
 at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
-			    const char *parent_name, const u32 *divisors);
+			    const char *parent_name, struct clk_parent_data *parent_data,
+			    const u32 *divisors);
 
 struct clk_hw * __init
 at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index db6db9e2073e..d959b30e1352 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -304,7 +304,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	parent_names[0] = "pllack_divck";
 	parent_names[1] = "upllck_divck";
 	parent_names[2] = "main_osc";
-	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
+	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, NULL, 3);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index c16594fce90c..8bbc34e22cda 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -284,7 +284,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, 2);
+	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 522ce6031446..05d0cdd22bc4 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -201,7 +201,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, 2);
+	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 160c0bddb6a3..da84b4cef827 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -222,7 +222,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, 2);
+	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.43.0

