Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BAD2F1984;
	Tue, 24 Jun 2025 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777731; cv=none; b=U9SUBBcOw8GCxr3PhmXIOaqRKTPbsJEH/K34JJBRVGFWxO0VeBvnu2PSd4NAuiQxbld3TdZHFkiBYl8Lg5f4JstEsdznTdiSCIk6pZ8bVIemfKGh7K9ngFc5chKLzt1R1F/guGbab+/pqwTnCFdimwVxspr6XUTqRp4htO8tSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777731; c=relaxed/simple;
	bh=NFlza7NMXYr7yoaM4juKHHENgegAA1/AX4WT/TjqqEs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aOfzl0doZDd7qwZoP4T92Kv0OI4V5CxKGRMzScDaEY/UqUPrCVVgHPYv8QpOaFaZG1Lcbjmp44IcZ2edAgi6Vl5jzbc/hyT4YkwDP3Rs0bBY55tuyQIf9/aCmnAE/Fy7ylZV99XIhOqAt/+GqvyguPrYPOJ4kJVCfIuuTYwaWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=mzJwNzZB; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mzJwNzZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777729; x=1782313729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NFlza7NMXYr7yoaM4juKHHENgegAA1/AX4WT/TjqqEs=;
  b=mzJwNzZBzcd8CAqxFIyPsTm9EX/Kc/9SR3WlcpaA6Hak8DOloy8Xl0Xo
   0StZJeMOyKzi8qnaQ48OPedOy5ZO9AvZXy1Y26147l2fL1JRaaT2Ap2CY
   Q6tUsyR4lrCgIef/knF5QCTwxMB5dsKOQyvepjKfYjL1C2QN3YOlJW6uc
   +MgaEXoM8XEcNQUUoMi2Agcdo7v9ejrQ6/hyv/bc7joBy0iZwpLaVfd3f
   sWfXo0Qw+44fyueZNvYTv0QRRCsIkY+6kGwBdfAGyXwl054eBCO20uj76
   CKqb5zGYVEVRaqufSpi5ES93VafFbw5S9qbhzwGrXAljPhA1IUbaXBK58
   Q==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: elByiUfvT9SJiDW4RZv8kg==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688180"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:45 -0700
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
Subject: [PATCH v2 08/32] clk: at91: clk-programmable: use clk_parent_data
Date: Tue, 24 Jun 2025 08:08:05 -0700
Message-ID: <44cbeb6ac133a44e0c09da82434cda10c894a66a.1750182562.git.Ryan.Wanner@microchip.com>
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

Use struct clk_parent_data instead of struct parent_hw as this leads
to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
conversion of existing SoC specific clock drivers from parent_names to
modern clk_parent_data structures.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes those will be
added in a separate commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-programmable.c | 8 ++++----
 drivers/clk/at91/pmc.h              | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index 1195fb405503..275ca701f294 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -215,7 +215,7 @@ static const struct clk_ops programmable_ops = {
 struct clk_hw * __init
 at91_clk_register_programmable(struct regmap *regmap,
 			       const char *name, const char **parent_names,
-			       struct clk_hw **parent_hws, u8 num_parents, u8 id,
+			       struct clk_parent_data *parent_data, u8 num_parents, u8 id,
 			       const struct clk_programmable_layout *layout,
 			       u32 *mux_table)
 {
@@ -224,7 +224,7 @@ at91_clk_register_programmable(struct regmap *regmap,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (id > PROG_ID_MAX || !(parent_names || parent_hws))
+	if (id > PROG_ID_MAX || !(parent_names || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	prog = kzalloc(sizeof(*prog), GFP_KERNEL);
@@ -233,8 +233,8 @@ at91_clk_register_programmable(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &programmable_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 54d472276fc9..34036f2d0578 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -263,7 +263,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_programmable(struct regmap *regmap, const char *name,
-			       const char **parent_names, struct clk_hw **parent_hws,
+			       const char **parent_names, struct clk_parent_data *parent_data,
 			       u8 num_parents, u8 id,
 			       const struct clk_programmable_layout *layout,
 			       u32 *mux_table);
-- 
2.43.0

