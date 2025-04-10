Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071DA28FFD5;
	Thu, 10 Apr 2025 19:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314067; cv=pass; b=Atce/git7F4XFjjKu4YcKEHFwieNy3tSyQg0L2XmE6zR3JWJpcdOg7lJu/tk8UIYDIDMhoQArXxe3LxnjoywNyUVfFLwazp6R/DPGNIBIE7vQ8nTNZx2WDR1N5Q5yuWYKQnzF9knjrhvrDfo7tagQ907Po7dLMwDb1tedBC697s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314067; c=relaxed/simple;
	bh=bZwYD+Ma7a/T0kqZO784Wha0YrCnSW4IQo44QKNxPtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNSsXtEqtU5hHHY2FIPJpOrXJEXcCo84Eg+ueA//AvOgG0AGnr/UEZn6XfhcSGuV86eOs2NbHR6/wJyp06TF5R0E/x3vr/ydPL1ZXSO8qpr4Y1QP5d2jLapqJYoaqzonFAAXL+0kEdUoNBqWrxPO4qvk5pCFR9iwRHWnlly/4bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=TYuQT+Tp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="TYuQT+Tp"
ARC-Seal: i=1; a=rsa-sha256; t=1744314037; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gMvAo+bYlHQu47AlzRkKFM1znpQeQdYjVSAU8XnCH/9ybZ0wiZDYgy//Ts4dKsseBLY2zGDIuLED0nqRkoOzQY9yeGXok/qBAP344JtH4NQ9V0DqK5RHAVZH1XIV1STzyNSuXyg3YpX4llop0YHxIx0niW4Nobj13uX6fU2ur8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314037; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tZSRnNMu449fBWR5hy1GPzV2dgUEKHHqGp//q0+Mju4=; 
	b=ILED66YkTC+rul4ETmUW0RyoLVYeKzESedPvtfib4vB5BndWScm3uyY5ST3/QTQsaoaGprmiuLACeNRSnIcqSWDac6EnDNf/JPYRHD+fIYnI/Zl1H8W9e3jKTg6nl54BmvUb5KhZT9zCPfSdIaX8Pqv5VAAA1Cq18aZ8KuMq/Mc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314037;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=tZSRnNMu449fBWR5hy1GPzV2dgUEKHHqGp//q0+Mju4=;
	b=TYuQT+TpERC9ZlN70L5kh6tzDHeb/927Pt8CncSwsbZqr3LVE3V+PNP7Ygujvfq8
	9vvbCNrMNkHwWsVsAt6yWqKHAEpP6G520jjdUC8dZQJbfu63hK6hWP5tGMruKXn/rfg
	BcCEiCQF/y62EG25xBcwgtIv4Jv/TcXM3+/ettxQ=
Received: by mx.zohomail.com with SMTPS id 1744314035607236.87875458465726;
	Thu, 10 Apr 2025 12:40:35 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:39:56 +0200
Subject: [PATCH v2 04/11] clk: rockchip: add GATE_GRFs for SAI MCLKOUT to
 rk3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-4-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The Rockchip RK3576 gates the SAI MCLKOUT clocks behind some IOC GRF
writes.

Add these clock branches, and add the IOC GRF to the auxiliary GRF
hashtable.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/rockchip/clk-rk3576.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index fd3aa19725c4cb26eb94f4e2399c1d4ec1c1b97a..71e77013f72615f54ef8967a375adcba8f87495e 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -15,6 +15,7 @@
 
 #define RK3576_GRF_SOC_STATUS0		0x600
 #define RK3576_PMU0_GRF_OSC_CON6	0x18
+#define RK3576_VCCIO_IOC_MISC_CON0	0x6400
 
 enum rk3576_plls {
 	bpll, lpll, vpll, aupll, cpll, gpll, ppll,
@@ -1479,6 +1480,14 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKGATE_CON(10), 0, GFLAGS),
 	GATE(CLK_SAI0_MCLKOUT, "clk_sai0_mclkout", "mclk_sai0_8ch", 0,
 			RK3576_CLKGATE_CON(10), 1, GFLAGS),
+	GATE_GRF(CLK_SAI0_MCLKOUT_TO_IO, "mclk_sai0_to_io", "clk_sai0_mclkout",
+			0, RK3576_VCCIO_IOC_MISC_CON0, 0, GFLAGS, grf_type_ioc),
+	GATE_GRF(CLK_SAI1_MCLKOUT_TO_IO, "mclk_sai1_to_io", "clk_sai1_mclkout",
+			0, RK3576_VCCIO_IOC_MISC_CON0, 1, GFLAGS, grf_type_ioc),
+	GATE_GRF(CLK_SAI2_MCLKOUT_TO_IO, "mclk_sai2_to_io", "clk_sai2_mclkout",
+			0, RK3576_VCCIO_IOC_MISC_CON0, 2, GFLAGS, grf_type_ioc),
+	GATE_GRF(CLK_SAI3_MCLKOUT_TO_IO, "mclk_sai3_to_io", "clk_sai3_mclkout",
+			0, RK3576_VCCIO_IOC_MISC_CON0, 3, GFLAGS, grf_type_ioc),
 
 	/* sdgmac */
 	COMPOSITE_NODIV(HCLK_SDGMAC_ROOT, "hclk_sdgmac_root", mux_200m_100m_50m_24m_p, 0,
@@ -1725,7 +1734,9 @@ static void __init rk3576_clk_init(struct device_node *np)
 	struct rockchip_clk_provider *ctx;
 	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
+	struct rockchip_aux_grf *ioc_grf_e;
 	struct rockchip_aux_grf *pmu0_grf_e;
+	struct regmap *ioc_grf;
 	struct regmap *pmu0_grf;
 
 	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3576_clk_branches,
@@ -1737,6 +1748,12 @@ static void __init rk3576_clk_init(struct device_node *np)
 		return;
 	}
 
+	ioc_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3576-ioc-grf");
+	if (IS_ERR(ioc_grf)) {
+		pr_err("%s: could not get IOC GRF syscon\n", __func__);
+		return;
+	}
+
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
 		pr_err("%s: could not map cru region\n", __func__);
@@ -1757,6 +1774,14 @@ static void __init rk3576_clk_init(struct device_node *np)
 	pmu0_grf_e->type = grf_type_pmu0;
 	hash_add(ctx->aux_grf_table, &pmu0_grf_e->node, grf_type_pmu0);
 
+	ioc_grf_e = kzalloc(sizeof(*ioc_grf_e), GFP_KERNEL);
+	if (!ioc_grf_e)
+		goto err_free_pmu0;
+
+	ioc_grf_e->grf = ioc_grf;
+	ioc_grf_e->type = grf_type_ioc;
+	hash_add(ctx->aux_grf_table, &ioc_grf_e->node, grf_type_ioc);
+
 	rockchip_clk_register_plls(ctx, rk3576_pll_clks,
 				   ARRAY_SIZE(rk3576_pll_clks),
 				   RK3576_GRF_SOC_STATUS0);
@@ -1781,6 +1806,8 @@ static void __init rk3576_clk_init(struct device_node *np)
 
 	return;
 
+err_free_pmu0:
+	kfree(pmu0_grf_e);
 err_unmap:
 	iounmap(reg_base);
 	return;

-- 
2.49.0

