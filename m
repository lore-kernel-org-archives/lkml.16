Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70F24BD0E;
	Mon, 10 Feb 2025 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203230; cv=none; b=gKBpl/lPNWQl3rAZnf7aH7co7LjTZYGzKBT2zjZIe+1/ZYo9o39LwoZ6NBSfwFkB3dqaMXc02Ow/07TpQT5CX3hgrmklvmLkiV9V5ssGdCwpuApBagYklwrKRnvR/Ab2cJWnc5FWvvDds6mLC35YJUkD203bIqs5XLL/hNVyVA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203230; c=relaxed/simple;
	bh=tQwnWjXakU4FhLJZxL5UozDh6cXB5o8GNeuPhlrPqIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lX84nNf3EjfWzN8L9pg7mjCC0C2dMr42rbXghwYb6/xib3UsdfRWJtXbX5bjiwqofieHo6AMTkpop3HgNbo/Y4XPdWLTwlxKWI4plQBEolS9x86C7enoemWV3JEoWwWNMyXUV66Utyd7YP0O1TdPkUs1PuPbozHCpGCbgndI+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Lka6XTnC; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qEnx/Gh/ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Lka6XTnC";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qEnx/Gh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739203226; x=1770739226;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bOMbba0A1eJVbzvPVV/zSeVjS+2bYN5BuJsAKJgZbqQ=;
  b=Lka6XTnCmQeHFf2BlpNZmKYRXr47EL5tuapb9MrCrTxNSBGdMwfLRYnv
   1h9KIzpGM2wlhst4leD80FS4XsacUPEs5vXqwUUr4JzgK0sLMTXDi3M6W
   agdgAI9p62X5ScWoPtnz7xTSMDmogGyZBArGDcRDDsky3MxHFpigv1jHb
   IrSYaPGJFec7SJoH2aekpMoAsX9XJ2Adw69ByUHqeKoYeN0zsnVSa6rt4
   VOJxXv4vXGcwtvIn6tO7TYvOAnlLDF2B7a7a2PIZYFQ9k0y67xbZWb2J5
   4/Ei+Vy9lwRw3PDRhy0GMmUSZucs/VSXDS4BSjpvY9PNsvHzguDr/DDnU
   w==;
X-CSE-ConnectionGUID: 3yDWKte7RaiwtEJDQl2RIw==
X-CSE-MsgGUID: 2qOTWrZIQbygIG189aMiXA==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41723662"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 17:00:20 +0100
X-CheckPoint: {67AA2294-B-6E0A4539-DBC44C3A}
X-MAIL-CPID: 6A27F41018F237B18955565C9E442D6C_1
X-Control-Analysis: str=0001.0A006366.67AA2298.0035,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16F441615E5;
	Mon, 10 Feb 2025 17:00:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739203216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bOMbba0A1eJVbzvPVV/zSeVjS+2bYN5BuJsAKJgZbqQ=;
	b=qEnx/Gh/VTeWQNQT5jNkge6mW56hxuqyWi90pTqAu2L+2k0WZuqRoraM4Xqd13ckuUnFcE
	yrS5gm6sT3Y9HViD6HDMUXKqH0hgOC7Zt4aBWgLXtZjSH5P8InGYdWe/PtO86hWyscLs6+
	aHa60xhRFBZW0z5gFSj9YOecjP6Utb1Zfk8+Nk5r2G2Ak6M5xz6blbFvM3ihrrb5gbhiZo
	alLfxRtrsvBUjWRgaT0MaGjArx0SbT9w+IEJMIfNDuvxmMoyx2bcbPQuLc7uc95X27lwWS
	B4EJ8mgxeizhB2AcQoUp1wqnTfonFEuKZXdPcXo+N3b/PgPOTjwxm0G6CAyYwA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] clk: imx: clk-fracn-gppll: Do not access num/denom register for integer PLL
Date: Mon, 10 Feb 2025 17:00:09 +0100
Message-Id: <20250210160012.783446-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Similar to clk_fracn_gppll_set_rate(), do not access the numerator and
denominator register for integer PLL. Set MFD/MFN to 0 instead, so the
table lookup will match.
See i.MX93 RM section 74.5.2.1 (PLL memory map) for ARMPLL, addresses
0x40 and 0x50 are not listed/reserved.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 85771afd4698a..3aef548110e25 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -154,17 +154,24 @@ static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned lon
 {
 	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
 	const struct imx_fracn_gppll_rate_table *rate_table = pll->rate_table;
-	u32 pll_numerator, pll_denominator, pll_div;
+	u32 pll_div;
 	u32 mfi, mfn, mfd, rdiv, odiv;
 	u64 fvco = parent_rate;
 	long rate = 0;
 	int i;
 
-	pll_numerator = readl_relaxed(pll->base + PLL_NUMERATOR);
-	mfn = FIELD_GET(PLL_MFN_MASK, pll_numerator);
+	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
+		u32 pll_numerator, pll_denominator;
+
+		pll_numerator = readl_relaxed(pll->base + PLL_NUMERATOR);
+		mfn = FIELD_GET(PLL_MFN_MASK, pll_numerator);
 
-	pll_denominator = readl_relaxed(pll->base + PLL_DENOMINATOR);
-	mfd = FIELD_GET(PLL_MFD_MASK, pll_denominator);
+		pll_denominator = readl_relaxed(pll->base + PLL_DENOMINATOR);
+		mfd = FIELD_GET(PLL_MFD_MASK, pll_denominator);
+	} else {
+		mfd = 0;
+		mfn = 0;
+	}
 
 	pll_div = readl_relaxed(pll->base + PLL_DIV);
 	mfi = FIELD_GET(PLL_MFI_MASK, pll_div);
-- 
2.34.1

