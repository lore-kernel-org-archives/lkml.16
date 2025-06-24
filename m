Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAD62F3C17;
	Tue, 24 Jun 2025 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777736; cv=none; b=P6fYpMIUsfP+R4Pr+w7phyhUaNlrby2ibgvD7w5WLFxHSngCscxcJAnlpOfmAP2bWO/PRDlgytcii6a6LcSNtjJqvyREXzUAoW7IKYNm557KIhORQA0vRvJfmKueAqBOa1MUOLalJTS3JzHoBbwM30+KdyxZEIGJtxU9cNDR9CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777736; c=relaxed/simple;
	bh=XmdhpYDW+3QqRjHcegC00+obRxvH9zemgREp2uxK+Go=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BlY93V+6zILs7OvuqG8xyq4bcqI+VF4ZokJt6yKcqy9qrhqPOSl066i8kpCeUudyzpN+L8j9YXB+a1MGVJQhfGlmybz6bP5nRYjHgkPXkAz+eRAbX0fCXbqur67PTdmn+ES9382vvWgmbB5R4F/C4gOsPiVzHUYt30JpNanROc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=u3OguPGk; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="u3OguPGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777734; x=1782313734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XmdhpYDW+3QqRjHcegC00+obRxvH9zemgREp2uxK+Go=;
  b=u3OguPGkM21ePbDaRRCzChpIPrccueYz/y6tSRBqL5zO0qcOzjwaH2b7
   sJRXc0yTHQ1B6HF7jivbFqWSSOGJhPRorfC1ZxY865cWpMVFu58w7KjHD
   2zVyPehJzt72O4WWX52AhFOWS+x3V5+uAUoiojuQzRPP08aXFf8b6ev3a
   rBtnlzpwI4oDHYLmwgYsFcaJzr0+JXWBvrQhNM9+aZNinwNq2oKXo4MBu
   RMVXaCIJbMtX0oDSA7+jicz2wl3nkhez880dcYDilgnSBftNhaG3Ciq6y
   JutoDB0ZVofT6seAKy/dQzshU1UTpL+DyO7ksVejvlT+epA54O1vwvoJr
   g==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: NWLryf3aSAOkeiKqt8hB/w==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688189"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:38 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:38 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
Subject: [PATCH v2 13/32] clk: at91: clk-audio-pll: add support for parent_hw
Date: Tue, 24 Jun 2025 08:08:10 -0700
Message-ID: <c3078a1e34f77bf40777b3ba15d22d2615962cdd.1750182562.git.Ryan.Wanner@microchip.com>
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

Add support for parent_hw in audio pll clock drivers.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-audio-pll were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes as they are
going to be coalesced into one SoC specific commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-audio-pll.c | 28 ++++++++++++++++++++--------
 drivers/clk/at91/dt-compat.c     |  6 +++---
 drivers/clk/at91/pmc.h           |  6 +++---
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/at91/clk-audio-pll.c b/drivers/clk/at91/clk-audio-pll.c
index a92da64c12e1..da9b2e699dcc 100644
--- a/drivers/clk/at91/clk-audio-pll.c
+++ b/drivers/clk/at91/clk-audio-pll.c
@@ -450,7 +450,8 @@ static const struct clk_ops audio_pll_pmc_ops = {
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
-				 const char *parent_name)
+				 const char *parent_name,
+				 struct clk_parent_data *parent_data)
 {
 	struct clk_audio_frac *frac_ck;
 	struct clk_init_data init = {};
@@ -462,7 +463,10 @@ at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_frac_ops;
-	init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
@@ -480,10 +484,11 @@ at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
-				const char *parent_name)
+				const char *parent_name,
+				struct clk_parent_data *parent_data)
 {
 	struct clk_audio_pad *apad_ck;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	apad_ck = kzalloc(sizeof(*apad_ck), GFP_KERNEL);
@@ -492,7 +497,10 @@ at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_pad_ops;
-	init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		CLK_SET_RATE_PARENT;
@@ -511,10 +519,11 @@ at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
-				const char *parent_name)
+				const char *parent_name,
+				struct clk_parent_data *parent_data)
 {
 	struct clk_audio_pmc *apmc_ck;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	apmc_ck = kzalloc(sizeof(*apmc_ck), GFP_KERNEL);
@@ -523,7 +532,10 @@ at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &audio_pll_pmc_ops;
-	init.parent_names = &parent_name;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
 	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 		CLK_SET_RATE_PARENT;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 2c5faa3b1cfd..22bcaa3b28dd 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -43,7 +43,7 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name);
+	hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
@@ -69,7 +69,7 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name);
+	hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
@@ -95,7 +95,7 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name);
+	hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 0feaf8497b60..519d71652619 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -157,15 +157,15 @@ struct clk_hw *of_clk_hw_pmc_get(struct of_phandle_args *clkspec, void *data);
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_frac(struct regmap *regmap, const char *name,
-				 const char *parent_name);
+				 const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pad(struct regmap *regmap, const char *name,
-				const char *parent_name);
+				const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_register_audio_pll_pmc(struct regmap *regmap, const char *name,
-				const char *parent_name);
+				const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
-- 
2.43.0

