Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE32B24BCED;
	Mon, 10 Feb 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203236; cv=none; b=UiQEovmZVKPCLX2jGvHCFK/VuyqfapKGJOcywWT39UGu2Swl7s3Sj8b7O7PaocCbREBoiC4XShguZoYK8WfO2n5qMD+2kaQarZXY8DKdkil5BC0mVVQX2wVJLujZ5WGpEEGxUv5j814s5sxlZlb0kAWXxN07TaDgvGVSm1okBuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203236; c=relaxed/simple;
	bh=WmOyrQx2zbGj4iXjDTQFGQY/rayYa5Dxker5hffvQBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BZ3WoLXg4fs5XHnDCB5sNZwPBl4j5t6clGdXaeFV/9VAwxBJ9MujlLHeDYK/u9gSSCP7ewOhwaaBrhg4rUAyb6ds2V9WCxZjUnuR1s9I/SOQzmgK6PGemb3awc2XdSLrSRT6WvS05yCoK1/urTH+HjX+1sqCGJAqnx0IZxwGptQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=hmzD5mLK; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jPnJdWRY reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="hmzD5mLK";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jPnJdWRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739203234; x=1770739234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eQ7wsV90ZTZbBq8whAYKYY3CfgfedQ5rrh/FaK6/OBI=;
  b=hmzD5mLKDX0ec4g1Q2R1xnsHQkAj/KOaX+HIsZxNbcVf3kNoZFAe61CC
   N3KACUOl7icq5U4M4NbQ3rEm2ccWkFhKJJoYqrm6C3Ky0Fmr5o97PqrBQ
   BeTSNKkxuo/nSDwN2XKnhqEQJEOpk6seL/qvZ3ZakrOrt4vBkPYw4+a9W
   CwwxUsaGeTRuTI22Qjmb8J3mLeCL9ten5wM4vkZQE+DPjUcGZ8+euRlRN
   Ee6sIBzUiCdnt2rO7spmbdXzf4q8MKWyoah5Sc9dlzzbGRbcRmAWP8S4z
   elaR0/xQmTVGV1sywCBSpWI1XKsrdReYmJVeTzcquhHEyTZQa0byWrM9L
   A==;
X-CSE-ConnectionGUID: wUPPNZwMTgKS+CfX2ikgcg==
X-CSE-MsgGUID: ksmEptQWQkaRFisJ/Nm68Q==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41723666"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 17:00:31 +0100
X-CheckPoint: {67AA229F-B-EBA888C4-C1AC8B84}
X-MAIL-CPID: E8F7D8D262BF096E5F9B3401FCF79116_0
X-Control-Analysis: str=0001.0A006368.67AA229F.00BA,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6467616737F;
	Mon, 10 Feb 2025 17:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739203226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eQ7wsV90ZTZbBq8whAYKYY3CfgfedQ5rrh/FaK6/OBI=;
	b=jPnJdWRYowhIESTjwwMIX2UEWcpNhtWais5YdLTfi9Xcq6++VxN0lYB9H99XfDYqxOQ8hj
	UWCM30w6gFMBA+abvKrlYNFBXZWFUmeDvqzxZdggIJ7DT1Bra9iT0IsDFrPA1doyYTS2Cv
	J1e3+XuTZyAQ/cFs1jC1YYreikkooBgAbxM5sn9YLnzMHZ8FuqmADw76cTnHSaQ2NCFnji
	KUl9eDtlmyPmRvLyWs6aA6Hw1I9TLR9Ev6xt+CV2Ps4F7AnN1TdiH6y309Jstd98R2QjQA
	IMUHIF17oiFoerGdXADXNr5iyHwZN2C0XAC/5sI+HFjKopTBQqo8grdDKWPPfA==
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
Subject: [RFC PATCH 3/3] clk: imx: clk-fracn-gppll: Support dynamic rates
Date: Mon, 10 Feb 2025 17:00:11 +0100
Message-Id: <20250210160012.783446-3-alexander.stein@ew.tq-group.com>
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

The fracn gppll PLL so far only supports rates from a rate table passed
during initialization. Calculating PLL settings dynamically helps audio
applications to get their desired rates, so support for this is added
in this patch.

The strategy to get to the PLL setting for a rate is:

- The rate table is searched for suitable rates, so for standard rates the
  same settings are used as without this patch
- Then try to only adjust mfn, on fractional PLLs only, which specifies
  the fractional part of the PLL. This setting can be changed without
  glitches on the output and is therefore preferred
- As a last resort the best settings are calculated dynamically

Implementation is inspired by commit b09c68dc57c9d ("clk: imx: pll14xx:
Support dynamic rates")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is the first time I'm touching PLL code, I might be missing things
or not being aware of important aspects when it comes to PLL.
Thus this is a RFC

 drivers/clk/imx/clk-fracn-gppll.c | 203 ++++++++++++++++++++++++++----
 1 file changed, 181 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index a7d57fbe93196..68c5b4a95efbe 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -25,6 +25,12 @@
 
 #define PLL_NUMERATOR		0x40
 #define PLL_MFN_MASK		GENMASK(31, 2)
+#define PLL_MFI_MIN		0x2
+#define PLL_MFI_MAX		0x1ff
+#define PLL_MFN_MIN		0x0
+#define PLL_MFN_MAX		0x3fffffff
+#define PLL_MFD_MIN		0x1
+#define PLL_MFD_MAX		0x3fffffff
 
 #define PLL_DENOMINATOR		0x50
 #define PLL_MFD_MASK		GENMASK(29, 0)
@@ -134,21 +140,6 @@ imx_get_pll_settings(struct clk_fracn_gppll *pll, unsigned long rate)
 	return NULL;
 }
 
-static long clk_fracn_gppll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
-{
-	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
-	const struct imx_fracn_gppll_rate_table *rate_table = pll->rate_table;
-	int i;
-
-	/* Assuming rate_table is in descending order */
-	for (i = 0; i < pll->rate_count; i++)
-		if (rate >= rate_table[i].rate)
-			return rate_table[i].rate;
-
-	/* return minimum supported value */
-	return rate_table[pll->rate_count - 1].rate;
-}
 
 static long clk_fracn_gppll_calc_rate(struct clk_fracn_gppll *pll, u32 mfn,
 				      u32 mfd, u32 mfi, u32 rdiv, u32 odiv,
@@ -202,6 +193,174 @@ static long clk_fracn_gppll_calc_rate(struct clk_fracn_gppll *pll, u32 mfn,
 	return (unsigned long)fvco;
 }
 
+static u32 clk_fracn_gppll_calc_mfi(int rdiv, unsigned long fvco,
+				    unsigned long fref)
+{
+	u32 mfi;
+
+	/* fvco = fref / rdiv * mfi */
+	mfi = DIV_ROUND_CLOSEST(fvco * rdiv, fref);
+	return clamp_t(u32, mfi, PLL_MFI_MIN, PLL_MFI_MAX);
+}
+
+static long clk_fracn_gppll_calc_mfn(int mfd, int mfi, int odiv, int rdiv,
+				     unsigned long rate, unsigned long prate)
+{
+	unsigned long tmp;
+	long mfn;
+
+	/* calc mfn = ((rate * odiv * rdiv / prate) - mfi) * mfd */
+	tmp = rate * odiv * rdiv - (mfi * prate);
+	mfn = DIV_ROUND_CLOSEST(tmp * mfd, prate);
+	return clamp_t(long, mfn, PLL_MFN_MIN, PLL_MFN_MAX);
+}
+
+static void clk_fracn_gppll_calc_settings(struct clk_fracn_gppll *pll, unsigned long rate,
+					  unsigned long prate, struct imx_fracn_gppll_rate_table *t)
+{
+	u32 pll_denominator, pll_numerator, pll_div;
+	u32 mfi, mfn, mfd, rdiv, odiv;
+	long fout, rate_min, rate_max, dist, best = LONG_MAX;
+	const struct imx_fracn_gppll_rate_table *tt;
+
+	/*
+	 * PLL constrains:
+	 *
+	 * a) 1 <= MFN <= 0x3fffffff (fractional only)
+	 * b) 1 <= MFD <= 0x3fffffff (fractional only)
+	 * c) 2 <= MFI <= 0x1ff
+	 * d) 1 <= RDIV <= 7
+	 * e) 2 <= ODIV <= 255
+	 * f) -2 <= MFN/MFD <= 2
+	 * g) 20MHz <= (Fref / rdiv) <= 40MHz
+	 * h) 2.5GHz <= Fvco <= 5Ghz
+	 *
+	 * Fvco = (Fref / rdiv) * (MFI + MFN / MFD)
+	 * Fout = Fvco / odiv
+	 */
+
+	/* First try if we can get the desired rate from one of the static entries */
+	tt = imx_get_pll_settings(pll, rate);
+	if (tt) {
+		pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
+			 clk_hw_get_name(&pll->hw), prate, rate);
+		t->rate = tt->rate;
+		t->mfi = tt->mfi;
+		t->mfn = tt->mfn;
+		t->mfd = tt->mfd;
+		t->rdiv = tt->rdiv;
+		t->odiv = tt->odiv;
+		return;
+	}
+
+	/* glitch free MFN adjustment only for fractional PLL */
+	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
+		pll_numerator = readl_relaxed(pll->base + PLL_NUMERATOR);
+
+		pll_denominator = readl_relaxed(pll->base + PLL_DENOMINATOR);
+		mfd = FIELD_GET(PLL_MFD_MASK, pll_denominator);
+
+		pll_div = readl_relaxed(pll->base + PLL_DIV);
+		mfi = FIELD_GET(PLL_MFI_MASK, pll_div);
+		rdiv = FIELD_GET(PLL_RDIV_MASK, pll_div);
+		odiv = FIELD_GET(PLL_ODIV_MASK, pll_div);
+
+		/* Then see if we can get the desired rate by only adjusting MFN (glitch free) */
+		rate_min = clk_fracn_gppll_calc_rate(pll, PLL_MFN_MIN, mfd, mfi, rdiv, odiv, prate);
+		rate_max = clk_fracn_gppll_calc_rate(pll, PLL_MFN_MAX, mfd, mfi, rdiv, odiv, prate);
+
+		if (rate >= rate_min && rate <= rate_max) {
+			mfn = clk_fracn_gppll_calc_mfn(mfd, mfi, odiv, rdiv, rate, prate);
+			pr_debug("%s: in=%ld, want=%ld Only adjust mfn %ld -> %d\n",
+				 clk_hw_get_name(&pll->hw), prate, rate,
+				 FIELD_GET(PLL_MFN_MASK, pll_numerator), mfn);
+			fout = clk_fracn_gppll_calc_rate(pll, mfn, mfd, mfi, rdiv, odiv, prate);
+			t->rate = (unsigned int)fout;
+			t->mfi = mfi;
+			t->mfn = mfn;
+			t->mfd = mfd;
+			t->rdiv = rdiv;
+			t->odiv = odiv;
+			return;
+		}
+	}
+
+	/* Finally calculate best values */
+	for (rdiv = 1; rdiv <= 7; rdiv++) {
+		if ((prate / rdiv) < 20000000)
+			continue;
+		if ((prate / rdiv) > 40000000)
+			continue;
+
+		for (odiv = 2; odiv <= 255; odiv++) {
+			mfi = clk_fracn_gppll_calc_mfi(rdiv, rate * odiv, prate);
+			mfd = 1;
+			mfn = 0;
+
+			/* Try integer PLL part only first */
+			fout = clk_fracn_gppll_calc_rate(pll, mfn, mfd, mfi, rdiv, odiv, prate);
+			if (fout * odiv < 2500000000UL)
+				continue;
+			if (fout * odiv > 5000000000UL)
+				continue;
+
+			if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
+				if (!dist) {
+					/* Disable fractional part upon exact match */
+					mfd = 1;
+					mfn = 0;
+				} else {
+					mfd = 100;
+					mfd = clamp(mfd, PLL_MFD_MIN, PLL_MFN_MAX);
+
+					mfn = clk_fracn_gppll_calc_mfn(mfd, mfi, odiv, rdiv, rate, prate);
+					if ((mfn / mfd) > 2)
+						continue;
+
+					fout = clk_fracn_gppll_calc_rate(pll, mfn, mfd, mfi, rdiv, odiv, prate);
+					if (fout * odiv < 2500000000)
+						continue;
+					if (fout * odiv > 5000000000)
+						continue;
+				}
+			} else {
+				mfd = 0;
+				mfn = 0;
+			}
+
+			/* best match */
+			dist = abs((long)rate - (long)fout);
+			if (dist < best) {
+				best = dist;
+				t->rate = (unsigned int)fout;
+				t->mfi = mfi;
+				t->mfn = mfn;
+				t->mfd = mfd;
+				t->rdiv = rdiv;
+				t->odiv = odiv;
+
+				if (!dist)
+					goto found;
+			}
+		}
+	}
+found:
+	pr_debug("%s: in=%lu, want=%lu got=%u (mfi=%u mfn=%u mfd=%u rdiv=%u odiv=%u)\n",
+		 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->mfi, t->mfn, t->mfd,
+		 t->rdiv, t->odiv);
+}
+
+static long clk_fracn_gppll_round_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long *prate)
+{
+	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
+	struct imx_fracn_gppll_rate_table t;
+
+	clk_fracn_gppll_calc_settings(pll, rate, *prate, &t);
+
+	return t.rate;
+}
+
 static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
@@ -242,11 +401,11 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
 				    unsigned long prate)
 {
 	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
-	const struct imx_fracn_gppll_rate_table *rate;
+	struct imx_fracn_gppll_rate_table rate;
 	u32 tmp, pll_div, ana_mfn;
 	int ret;
 
-	rate = imx_get_pll_settings(pll, drate);
+	clk_fracn_gppll_calc_settings(pll, drate, prate, &rate);
 
 	/* Hardware control select disable. PLL is control by register */
 	tmp = readl_relaxed(pll->base + PLL_CTRL);
@@ -266,13 +425,13 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp &= ~CLKMUX_BYPASS;
 	writel_relaxed(tmp, pll->base + PLL_CTRL);
 
-	pll_div = FIELD_PREP(PLL_RDIV_MASK, rate->rdiv) | rate->odiv |
-		FIELD_PREP(PLL_MFI_MASK, rate->mfi);
+	pll_div = FIELD_PREP(PLL_RDIV_MASK, rate.rdiv) | rate.odiv |
+		FIELD_PREP(PLL_MFI_MASK, rate.mfi);
 	writel_relaxed(pll_div, pll->base + PLL_DIV);
 	readl(pll->base + PLL_DIV);
 	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
-		writel_relaxed(rate->mfd, pll->base + PLL_DENOMINATOR);
-		writel_relaxed(FIELD_PREP(PLL_MFN_MASK, rate->mfn), pll->base + PLL_NUMERATOR);
+		writel_relaxed(rate.mfd, pll->base + PLL_DENOMINATOR);
+		writel_relaxed(FIELD_PREP(PLL_MFN_MASK, rate.mfn), pll->base + PLL_NUMERATOR);
 		readl(pll->base + PLL_NUMERATOR);
 	}
 
@@ -296,7 +455,7 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
 	ana_mfn = readl_relaxed(pll->base + PLL_STATUS);
 	ana_mfn = FIELD_GET(PLL_MFN_MASK, ana_mfn);
 
-	WARN(ana_mfn != rate->mfn, "ana_mfn != rate->mfn\n");
+	WARN(ana_mfn != rate.mfn, "ana_mfn != rate->mfn\n");
 
 	return 0;
 }
-- 
2.34.1

