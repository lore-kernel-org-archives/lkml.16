Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7105127E7E8;
	Sat,  3 May 2025 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303960; cv=none; b=gZCpFEZm9Cq4JyXOMGP8RarAcY8m5p9i9CT9y8vuFpIYgNaCRXEFornIH9BcPj79rNmMZIf8Gq4qvBEC4FlxTrj1GElguCQ+luikzHZ+wQ21LUqqMKO/gHGy4rBxicjhwXCwUOUXfeg3xNgOGlVK5mdvHf+vYOXqpdr6i6awMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303960; c=relaxed/simple;
	bh=SMWTmmS0Vf+Pa5tiYE7lhkfcBGfli0fiZ1EipONTvIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7CKJoPkW/V37jkodumJDybc3AU1DRrADoSe4lb97dzmV4ULaWwxjw5zc50Yp6FP2qMkiA6Rae9K0XEo/lobspjY0IzgbSSpPG0M0IuDIk80aM7FrznOQgOOClag3aphgGkPRX7JKZOdW/1qVSRB8yQiDxeBW02EBiKhiYyw6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PrdfshL0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PrdfshL0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=aM6jJ+J/j0qSCRyoBBjpIPyis5nFHEd17Yuuz+/jXZw=; b=PrdfshL0M4GjDDbr7zkY5acfEd
	NWjCKGM0GdWYXldvzwr/SC2W3k9/wob3Pd5cQRYCdinZ+szCBb4SxKtBAg6ochqQxOLuZ2C1BamIF
	2dGpHUDAjzOuwyxgWts/crC1S+RfFqAHF8tdI0ZsbMWrYu6EhE2GQk8tgonweaF9K8ZPM/rgIx4a/
	0eBcY5ux5VpCbGozzo/LpkcL59qkXTs67OCZPfpZuuuLqgl3Tu1X7lNLrBQMzvTHCwKo6kxxHX3KB
	0yeH1mFSR0D5EV0NfO11fMuJf5oy/4oAby5hy2H2GcVVkdpzQH+0HWYvMwRY1deAaDJ7EcDcC6xIa
	Lh9jHBqg==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJQo-0001s2-UA; Sat, 03 May 2025 22:25:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] clk: rockchip: rk3036: fix implementation of usb480m clock mux
Date: Sat,  3 May 2025 22:25:30 +0200
Message-ID: <20250503202532.992033-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503202532.992033-1-heiko@sntech.de>
References: <20250503202532.992033-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Contrary to how it is implemented right now, this mux is controllable via
a bit in CRU_MUSC_CON (same bit as on rk3128 even) and allows switching
between xin24m and the 480m output of the usb2phy.

So drop the hard-coded fixed-factor clock and implement the correct mux
instead.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3036.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index d341ce0708aa..41c71bb25171 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -123,6 +123,7 @@ PNAME(mux_timer_p)		= { "xin24m", "pclk_peri_src" };
 PNAME(mux_pll_src_apll_dpll_gpll_usb480m_p)	= { "apll", "dpll", "gpll", "usb480m" };
 PNAME(mux_pll_src_dmyapll_dpll_gpll_xin24_p)   = { "dummy_apll", "dpll", "gpll", "xin24m" };
 
+PNAME(mux_usb480m_p)	= { "usb480m_phy", "xin24m" };
 PNAME(mux_mmc_src_p)	= { "apll", "dpll", "gpll", "xin24m" };
 PNAME(mux_i2s_pre_p)	= { "i2s_src", "i2s_frac", "ext_i2s", "xin12m" };
 PNAME(mux_i2s_clkout_p)	= { "i2s_pre", "xin12m" };
@@ -423,6 +424,9 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(PCLK_GPIO0, "pclk_gpio0", "pclk_peri", 0, RK2928_CLKGATE_CON(8), 9, GFLAGS),
 	GATE(PCLK_GPIO1, "pclk_gpio1", "pclk_peri", 0, RK2928_CLKGATE_CON(8), 10, GFLAGS),
 	GATE(PCLK_GPIO2, "pclk_gpio2", "pclk_peri", 0, RK2928_CLKGATE_CON(8), 11, GFLAGS),
+
+	MUX(SCLK_USB480M, "usb480m", mux_usb480m_p, CLK_SET_RATE_PARENT,
+			RK2928_MISC_CON, 15, 1, MFLAGS),
 };
 
 static const char *const rk3036_critical_clocks[] __initconst = {
@@ -438,7 +442,6 @@ static void __init rk3036_clk_init(struct device_node *np)
 	struct rockchip_clk_provider *ctx;
 	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
-	struct clk *clk;
 
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
@@ -462,11 +465,6 @@ static void __init rk3036_clk_init(struct device_node *np)
 		return;
 	}
 
-	clk = clk_register_fixed_factor(NULL, "usb480m", "xin24m", 0, 20, 1);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock usb480m: %ld\n",
-			__func__, PTR_ERR(clk));
-
 	rockchip_clk_register_plls(ctx, rk3036_pll_clks,
 				   ARRAY_SIZE(rk3036_pll_clks),
 				   RK3036_GRF_SOC_STATUS0);
-- 
2.47.2

