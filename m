Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBAA29E112;
	Tue, 24 Jun 2025 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777781; cv=none; b=dEYcgcUli/ULrjXYxzFBfw0I4lzsugAHBxLR0Dn4Fshik+S+89oNKP97r73c25zsnBcFquG6md189YJ8DQbLlSIyoeEb5Jpu24ygoexbk9sQWlHXsspb28k2jsqJVcAvIX7uunsizpwoKIksWKX5bmt9WL6fIwxu20ZH5+rW/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777781; c=relaxed/simple;
	bh=4m0mSB0qMTXb2csR88OxbItjA7gFCwW1bRUmBS2WlCg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2Evq0hkF51Q0mSF/OEELH1FgpHp5akoqdjed29BvunfwYPjXe8Wk8H93xQ3xKeS7BgxmtLEzqZ1nrZp7PwbeqVzII+DH8nbDajtQieUdDu15rGbsJBjC289gwBYiqPiEGRUF7TaICKE48TT9L5ROFy70RpWf+mdSoodeZuEgoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=D9Un/pWk; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="D9Un/pWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777779; x=1782313779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4m0mSB0qMTXb2csR88OxbItjA7gFCwW1bRUmBS2WlCg=;
  b=D9Un/pWkr7C7H1Q6MCQ718Patp9bRxLumbprbR5IoufpvsScExiS/nwn
   MyEjDKlCCv2RyKhCaPEnxh4BzabRZkiFPwWecYx/URE8WpHk35chl1lQd
   8d2KCax98Qbsm74YMoMCkHejbzOblheGyuVa3q7hetLzU8UbZc5JiK+Rs
   iqgOw1wZsj/Q/YDmVzn8+Lv45pp/li2tFN2Q3gv4dL0PRiHLBtoHPqYTz
   XCdU5BsThG6jimihXsT5za3uHAfCGMDoijDuF3DflOkQafjhReqQmTEYl
   P86BmqHFA1iKve1gBB9K9pGnVXpfmRJSaOGhhK88yzHAOZlBEDKXU8Nie
   g==;
X-CSE-ConnectionGUID: aaR+vTR6QzCaLHJjoz8HzA==
X-CSE-MsgGUID: KA0Z3Rr4SrCGEgboNrq4RA==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="43755112"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:09:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
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
Subject: [PATCH v2 15/32] clk: at91: clk-h32mx: add support for parent_hw
Date: Tue, 24 Jun 2025 08:08:12 -0700
Message-ID: <5e9bfd1ee862b83410cc6579e47cb291ee6aeaf7.1750182562.git.Ryan.Wanner@microchip.com>
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

Add support for parent_hw in h32mx clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-h32mx were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Remove SoC specific changes as they are
going to be coalesced into one SoC specific commit.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-h32mx.c | 11 +++++++----
 drivers/clk/at91/dt-compat.c |  2 +-
 drivers/clk/at91/pmc.h       |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
index 1e6c12eeda10..4b709f9bd831 100644
--- a/drivers/clk/at91/clk-h32mx.c
+++ b/drivers/clk/at91/clk-h32mx.c
@@ -83,10 +83,10 @@ static const struct clk_ops h32mx_ops = {
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name)
+			const char *parent_name, struct clk_parent_data *parent_data)
 {
 	struct clk_sama5d4_h32mx *h32mxclk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	h32mxclk = kzalloc(sizeof(*h32mxclk), GFP_KERNEL);
@@ -95,8 +95,11 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &h32mx_ops;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = &parent_name;
+	init.num_parents = 1;
 	init.flags = CLK_SET_RATE_GATE;
 
 	h32mxclk->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 3285e3110b58..ccdeba3a1130 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -201,7 +201,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	hw = at91_clk_register_h32mx(regmap, name, parent_name);
+	hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
 	if (IS_ERR(hw))
 		return;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index df2deb134a8d..fe42700df6db 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -177,7 +177,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_h32mx(struct regmap *regmap, const char *name,
-			const char *parent_name);
+			const char *parent_name, struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
-- 
2.43.0

