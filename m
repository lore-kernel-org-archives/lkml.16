Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129E2F3C26;
	Tue, 24 Jun 2025 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777736; cv=none; b=KdYYKYwDQjUP1pApCxw8qJ6CMzIGiht573522tpmSEWty7PZwZN6mfz96AIeXWf/z/u3hFB6VwW/FilTzBbIX6C6NCp4iwPoMbljStGtCwQc0QPp8mDA8VqIfSJBGALkK3aXom0uQQ0AHQ7BYajH8geY8vu/Bvh22lpo0aQ5geM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777736; c=relaxed/simple;
	bh=ewK93IZBE5AdW/boaGsKbjjZ+eEA2xMxJ1F5syBIWcM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G7e9lT9ND9BANpyJPjDczeJXIPTr5ozLnWFnDxY3sX5DJLY7T6DbNm4VFDiEvHTKSP4iEOwr2xk9/o879XEElEFbGmhALx1u/wMrBxTrBrp6HLNLldPeEC9gz7HX8nJ8MWuJUCRLi4IUDbwwVXs2SaSMpkp2N2OlT6hKDgeGJI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=KJ2VTkxP; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KJ2VTkxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777734; x=1782313734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ewK93IZBE5AdW/boaGsKbjjZ+eEA2xMxJ1F5syBIWcM=;
  b=KJ2VTkxPROhjeUFQh0jpo8dNlY7IILETWrKHSKuL1Sss98P5u5jS2E4F
   BmJx3K8K2LwUpcpyO1IIPisec/96MWH1uNIMG5HfW+OIEEM7u9RQbNZI9
   yfPdh+CQJiTafl63v3yYF1Usa9cCUKSFI79quTizE0Xafy9miO7wYAK/a
   HkV4T4YeB/kSKiz+TcmPh64+Isj0ZGdvrkP+Z5j6PRdEY97pX95FZEUjy
   GFdez2QpChlixgO1AT4gBylePWkBK/+xvzQesrIHlUilLLIX5N992VdsT
   EG3Aj6R5UoR/SxbRP1roxNSQWbMMRkLRh4KGghNr3IO0BaBs0hvNwcuWl
   Q==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: JmQSy8bSSGanE8uo8FA/cA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688191"
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
Subject: [PATCH v2 14/32] clk: at91: clk-plldiv: add support for parent_hw
Date: Tue, 24 Jun 2025 08:08:11 -0700
Message-ID: <b235fe4435a124cf29b9fb8ada9a81523c0cd161.1750182562.git.Ryan.Wanner@microchip.com>
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

Add support for parent_hw in plldiv clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-plldiv were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes as they are
going to be coalesced into one SoC specific commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-plldiv.c | 11 +++++++----
 drivers/clk/at91/dt-compat.c  |  2 +-
 drivers/clk/at91/pmc.h        |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/clk-plldiv.c b/drivers/clk/at91/clk-plldiv.c
index ba3a1839a96d..c5d0c6e27397 100644
--- a/drivers/clk/at91/clk-plldiv.c
+++ b/drivers/clk/at91/clk-plldiv.c
@@ -72,11 +72,11 @@ static const struct clk_ops plldiv_ops = {
 
 struct clk_hw * __init
 at91_clk_register_plldiv(struct regmap *regmap, const char *name,
-			 const char *parent_name)
+			 const char *parent_name, struct clk_parent_data *parent_data)
 {
 	struct clk_plldiv *plldiv;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	plldiv = kzalloc(sizeof(*plldiv), GFP_KERNEL);
@@ -85,8 +85,11 @@ at91_clk_register_plldiv(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &plldiv_ops;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
+	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
 	plldiv->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 22bcaa3b28dd..3285e3110b58 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -724,7 +724,7 @@ of_at91sam9x5_clk_plldiv_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91_clk_register_plldiv(regmap, name, parent_name);
+	hw = at91_clk_register_plldiv(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 519d71652619..df2deb134a8d 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -243,7 +243,7 @@ at91_clk_register_pll(struct regmap *regmap, const char *name,
 		      const struct clk_pll_characteristics *characteristics);
 struct clk_hw * __init
 at91_clk_register_plldiv(struct regmap *regmap, const char *name,
-			 const char *parent_name);
+			 const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
-- 
2.43.0

