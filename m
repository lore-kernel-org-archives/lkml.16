Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFB24BD15;
	Mon, 10 Feb 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203231; cv=none; b=rXwNqHCFnJKi2WgAURUuhC7t+9H2TVwxYqe47rgEnjncvyZZKOOZWdvxlxyVRU3fI4fA13TxZSdz9vAmmiffyjaEgTd5FUT1wTMZlWuCoqwTheoH2v1hIlQaEAbPFj3vJ0ffNo9x9tCL3YaYNgBmyJo6R2FYPvKZsKiOuK6+uMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203231; c=relaxed/simple;
	bh=S7WCCKn1OYpTJTr+0F5iFJ2o0NBwptWevzmCfT/sCwU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H7L7tBL8iAPjj7TXXTuhhqkIq4hu9D4A5PGynmUV8+FpjaZQEz8E/IlDF/fsKAjO48UxIL4hESWt1x4wv8ADxXl/608kcwpq3gCNMZyrC1RMSAAVnuUsVk3SnQEa2lKiQ7z5p7BWrYQqCbdh1naA3ckzPWPVySqqOQFdV8CW4wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=a7q8Ycyo; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MJEPmEx0 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="a7q8Ycyo";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MJEPmEx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739203228; x=1770739228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oJRfGne+1TV9ashFe4VvW6fRk2CL7nzeA1eVvRlpELA=;
  b=a7q8Ycyo37MgbH2uFZeKSn1xJzwqdS5RDPdMrotM2ur1+It1LFSNYUB+
   iBC7EQ3vkeij224pfkUlZZuEpbM82tWl69m4JxYKymag/kF3wX7wf14XX
   wOHyws8qakcEDx1DN0EEiuNH2ebmrDNvJj4m+pVffICfm6Py5rNM08tA8
   Zr8gMJNRDHuwezLR62N5hJ07Vz3ebi42Bw//0BAkep04mk/rwFNvOnU33
   mJ0IfnF4I8rVpHGIHF7P4kU5m+A4wqcYPqx3lk2IzFGNX+YPhTiwqQ1oL
   aMUTpCwT4KniqaF98zzwGu8UDUmolUC4n49EAbJleCrUF0SyvieW0/hap
   w==;
X-CSE-ConnectionGUID: 7bi8+9SGRBGJDm5SGNlRTQ==
X-CSE-MsgGUID: VOKpVHugRuC/h3BGDRYaeg==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41723664"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 17:00:25 +0100
X-CheckPoint: {67AA2299-15-28232521-C0C2250B}
X-MAIL-CPID: C697A590134ACF1114AF175211420857_4
X-Control-Analysis: str=0001.0A006366.67AA2299.00E4,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E899B168250;
	Mon, 10 Feb 2025 17:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739203221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oJRfGne+1TV9ashFe4VvW6fRk2CL7nzeA1eVvRlpELA=;
	b=MJEPmEx0leaC3HMJHT8d+3y3TIJ+bqMiLiiuFGMoZk7/fn8RQsGuH8CcNycwyIpJQJib5G
	IfWedpQhjt8/b+W9LCQ3897/sQk9v2lv4XN5uUjlmV/ZxZRxZgqjgp/mcr2OljSqbAbrPf
	FILMW8YgU8Wmf20mpMxEZK3vMFgcFFlhUD8fvdn0C69T2UnOeKMeyzKbtdK9zES5U+0LPS
	aFvESH24NWQT3ETJP5xQPYcxMsKQd1Ym9mUmf6xFBYLeFmuamlvhJMqXFtVWSVnxQKRipZ
	W9Ep5oYoNbT4NvXu42fSJp2pOeL1WEgT0TKmaTwwyJWF5IcchWuuUvHRNCNlIw==
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
Subject: [RFC PATCH 2/3] clk: imx: clk-fracn-gppll: Refactor clk_fracn_gppll_calc_rate
Date: Mon, 10 Feb 2025 17:00:10 +0100
Message-Id: <20250210160012.783446-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210160012.783446-1-alexander.stein@ew.tq-group.com>
References: <20250210160012.783446-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Move the frequency calculation into its dedicated function for multiple
usage. No functional change.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 54 ++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 3aef548110e25..a7d57fbe93196 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -150,35 +150,15 @@ static long clk_fracn_gppll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return rate_table[pll->rate_count - 1].rate;
 }
 
-static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+static long clk_fracn_gppll_calc_rate(struct clk_fracn_gppll *pll, u32 mfn,
+				      u32 mfd, u32 mfi, u32 rdiv, u32 odiv,
+				      unsigned long parent_rate)
 {
-	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
 	const struct imx_fracn_gppll_rate_table *rate_table = pll->rate_table;
-	u32 pll_div;
-	u32 mfi, mfn, mfd, rdiv, odiv;
 	u64 fvco = parent_rate;
 	long rate = 0;
 	int i;
 
-	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
-		u32 pll_numerator, pll_denominator;
-
-		pll_numerator = readl_relaxed(pll->base + PLL_NUMERATOR);
-		mfn = FIELD_GET(PLL_MFN_MASK, pll_numerator);
-
-		pll_denominator = readl_relaxed(pll->base + PLL_DENOMINATOR);
-		mfd = FIELD_GET(PLL_MFD_MASK, pll_denominator);
-	} else {
-		mfd = 0;
-		mfn = 0;
-	}
-
-	pll_div = readl_relaxed(pll->base + PLL_DIV);
-	mfi = FIELD_GET(PLL_MFI_MASK, pll_div);
-
-	rdiv = FIELD_GET(PLL_RDIV_MASK, pll_div);
-	odiv = FIELD_GET(PLL_ODIV_MASK, pll_div);
-
 	/*
 	 * Sometimes, the recalculated rate has deviation due to
 	 * the frac part. So find the accurate pll rate from the table
@@ -222,6 +202,34 @@ static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned lon
 	return (unsigned long)fvco;
 }
 
+static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
+	u32 pll_div;
+	u32 mfi, mfn, mfd, rdiv, odiv;
+
+	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
+		u32 pll_numerator, pll_denominator;
+
+		pll_numerator = readl_relaxed(pll->base + PLL_NUMERATOR);
+		mfn = FIELD_GET(PLL_MFN_MASK, pll_numerator);
+
+		pll_denominator = readl_relaxed(pll->base + PLL_DENOMINATOR);
+		mfd = FIELD_GET(PLL_MFD_MASK, pll_denominator);
+	} else {
+		mfd = 0;
+		mfn = 0;
+	}
+
+	pll_div = readl_relaxed(pll->base + PLL_DIV);
+	mfi = FIELD_GET(PLL_MFI_MASK, pll_div);
+
+	rdiv = FIELD_GET(PLL_RDIV_MASK, pll_div);
+	odiv = FIELD_GET(PLL_ODIV_MASK, pll_div);
+
+	return clk_fracn_gppll_calc_rate(pll, mfn, mfd, mfi, rdiv, odiv, parent_rate);
+}
+
 static int clk_fracn_gppll_wait_lock(struct clk_fracn_gppll *pll)
 {
 	u32 val;
-- 
2.34.1

