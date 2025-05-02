Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A05245031;
	Fri,  2 May 2025 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183859; cv=pass; b=E1SP0xAiYhjLvgd1eCBiVl4Ame4+T3tE1h9ZZSLlZR7g3fNqlfLwxQBO88ht3v/GRAEaNj2HP1aQneXNzgr8tybwx45SdPJW+obvH40aAqFDmBHyEGsTeSH612ze1vPjeTao2nkMX96CkivgIjBuqqDjIlcbICFx+6+PkVy2KfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183859; c=relaxed/simple;
	bh=dU+hgfPEwS2itaCGKHx6wQyXlgQV1jnm+iPfHOQI1j4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0SCtlGcM/JyfbWdCOqvBCZlkyH1Xec/Tn3BYRWOnBjQEkpDc3797XFz7DLRXHWEqKvI30rYvTnxc9b0mR66oatx1sGUL04+Khvx3Z8Li6vABltgJ0zYu4dcIr6t2rurAhbZ2rQgHu9R+dX7KnYcWAJxiUMFXZ/JLCze10voWGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=LD1VbD8k; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LD1VbD8k"
ARC-Seal: i=1; a=rsa-sha256; t=1746183828; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WvGsSoVHqrN+HJACVFuyfdSLUWZHdPchiZ59Ien3craywrtKkw29yy3CyH5jnidq60anKDCLK6rJ9Ipp7bE6o2UQqu+ZIXjIJazuKR4I7QGlKixZJ0lox/0zVkh78SsRVMAE3/NZcVMCd1Z1sWPXjdf2ptYWLjL0jQ/fHjqvA00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183828; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hop8oTkubTw5xWvmcx4MmwlzsXO1N7ei5yW53mT4mNk=; 
	b=VNBP9+xFRAhZ6KTZfM/Ng8Up5vaC+4t/aF3VJi/PjgE1jIMvr9nfwaGCkOXjaKnBaRyW2J6JfJctuGOSzM47Jij3FScWhoGSm7pzqepMD68QJtRyTK70S1f5Mjr5eSeVQP1ojHu6+QzvFCaGzYpp8LibeahLCyPd6hPMibWkUGg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183828;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Hop8oTkubTw5xWvmcx4MmwlzsXO1N7ei5yW53mT4mNk=;
	b=LD1VbD8kAfNPhTDJEIogyb6RpUgwd9ZCluzMYjMEvubaGWLPLgd5bvGeCkI5AzyT
	x8N98lJMghapzJ5kwkKVSqy1hQNkZlwfDL5gRQMZDpHtbPGrmjupanpk5r8piiwZjw9
	/Hb/Mb+MvL6ec2RSggefeJmW2OI2OjPi9DKLnluw=
Received: by mx.zohomail.com with SMTPS id 174618382638267.61073827582447;
	Fri, 2 May 2025 04:03:46 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:10 +0200
Subject: [PATCH v3 04/10] clk: rockchip: add GATE_GRFs for SAI MCLKOUT to
 rk3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-4-376cef19dd7c@collabora.com>
References: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
In-Reply-To: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
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
index 7a23683e18ff0d813e7b7fdc339b9539fa27bc66..1e269490ac7f6b56ed4e53a711c7d4d922b6e149 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -15,6 +15,7 @@
 
 #define RK3576_GRF_SOC_STATUS0		0x600
 #define RK3576_PMU0_GRF_OSC_CON6	0x18
+#define RK3576_VCCIO_IOC_MISC_CON0	0x6400
 
 enum rk3576_plls {
 	bpll, lpll, vpll, aupll, cpll, gpll, ppll,
@@ -1481,6 +1482,14 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
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
@@ -1727,7 +1736,9 @@ static void __init rk3576_clk_init(struct device_node *np)
 	struct rockchip_clk_provider *ctx;
 	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
+	struct rockchip_aux_grf *ioc_grf_e;
 	struct rockchip_aux_grf *pmu0_grf_e;
+	struct regmap *ioc_grf;
 	struct regmap *pmu0_grf;
 
 	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3576_clk_branches,
@@ -1739,6 +1750,12 @@ static void __init rk3576_clk_init(struct device_node *np)
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
@@ -1759,6 +1776,14 @@ static void __init rk3576_clk_init(struct device_node *np)
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
@@ -1783,6 +1808,8 @@ static void __init rk3576_clk_init(struct device_node *np)
 
 	return;
 
+err_free_pmu0:
+	kfree(pmu0_grf_e);
 err_unmap:
 	iounmap(reg_base);
 	return;

-- 
2.49.0

