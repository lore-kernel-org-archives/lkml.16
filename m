Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A967C227E99;
	Thu,  8 May 2025 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712418; cv=none; b=U0qbrUgx7kjJx6H8Bjt45JbIkSnJG6Mp7AVeXG69UjtH4cVpS0yapWIvOwLSmNb4BY7WsUUQ6Hbk62HGmA/SoLXafUIYWfcZzp23cI5Jg448JmnLnqoEHr+vRUv0UdaB/OCZNi/PrhkNnWJ6Ag1SznE+VK5W2i5sGmBkDvRy8aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712418; c=relaxed/simple;
	bh=O6gI+HoP+qVDnJDe4eGgfeLGNCSwSydkOevy2TizOcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0C1NM5wZZtSFkE32mBqiTjw+NWH2E2EliDUUSKF+woGkEYPvfXfKxJTKNTzR+ZCoMNk+9Chm9tbDExDY0tbJsk6kXQGIFHVVP7HKgRwA5nZQ0g6WnixWl8hXrvF1hwv7y55QQ3A3c4az13C0RjJpU58yEVbDQ1xQsWknY/xqJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EXk/mFVF; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="EXk/mFVF"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 10EEF261E1;
	Thu,  8 May 2025 15:53:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njnnbpseJVXz; Thu,  8 May 2025 15:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746712403; bh=O6gI+HoP+qVDnJDe4eGgfeLGNCSwSydkOevy2TizOcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EXk/mFVFBp0f9aEGhTyD4PoXA72ejWgsCjhWgULiMzHdHd2LU2XOf0I0hBMNBfZ/a
	 d10thYtQwrhRasmYrDbFa6IC2c/WZJeRQ/zFDje8znDJ2AbFA3Jpjxln0p9h+KAJhS
	 bQVrDv539Yzd68NX6V62+drZaTD0KAXcIGWSAT4kE2x5y057rXXLnLsMnpEhPUudJW
	 IoeDFWPVGZY5+9LQBjrfZqb65te8Nt8njH3Gu2eR3iujUa0d0cvR3PvFp5ibuqvOtu
	 H+8lWpGxjyRJKyVbe9nO8owfd++rBPnoFmRTR47L4IXA6ZLkPWE8m0gtsXTUmhN4fI
	 6RPPq2rqn4D/A==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] phy: rockchip: naneng-combphy: Add RK3528 support
Date: Thu,  8 May 2025 13:53:06 +0000
Message-ID: <20250508135307.14726-1-ziyao@disroot.org>
In-Reply-To: <20250508134332.14668-2-ziyao@disroot.org>
References: <20250508134332.14668-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip RK3528 integrates one naneng-combphy that is able to operate in
PCIe and USB3 mode. The control logic is similar to previous variants of
naneng-combphy but the register layout is apperantly different from the
RK3568 one.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../rockchip/phy-rockchip-naneng-combphy.c    | 180 +++++++++++++++++-
 1 file changed, 179 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 1d1c7723584b..7c92f7ac3c7f 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -20,7 +20,40 @@
 #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
 #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
 
-/* COMBO PHY REG */
+/* RK3528 COMBO PHY REG */
+#define RK3528_PHYREG6				0x18
+#define  RK3528_PHYREG6_PLL_KVCO		GENMASK(12, 10)
+#define   RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
+#define  RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
+#define   RK3528_PHYREG6_SSC_UPWARD		0
+#define   RK3528_PHYREG6_SSC_DOWNWARD		1
+#define RK3528_PHYREG40				0x100
+#define  RK3528_PHYREG40_SSC_EN			BIT(20)
+#define  RK3528_PHYREG40_SSC_CNT		GENMASK(10, 0)
+#define   RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
+#define RK3528_PHYREG42				0x108
+#define  RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
+#define   RK3528_PHYREG42_CKDRV_CLK_PLL		0
+#define   RK3528_PHYREG42_CKDRV_CLK_CKRCV	1
+#define  RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
+#define   RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
+#define  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
+#define   RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
+#define  RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
+#define   RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
+#define RK3528_PHYREG80				0x200
+#define  RK3528_PHYREG80_CTLE_EN		BIT(17)
+#define RK3528_PHYREG81				0x204
+#define  RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
+#define  RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
+#define   RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
+#define RK3528_PHYREG83				0x20c
+#define  RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
+#define   RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
+#define RK3528_PHYREG86				0x218
+#define  RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)
+
+/* RK3568 COMBO PHY REG */
 #define RK3568_PHYREG6				0x14
 #define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
 #define RK3568_PHYREG6_PLL_DIV_SHIFT		6
@@ -398,6 +431,147 @@ static int rockchip_combphy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
+{
+	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
+	unsigned long rate;
+	u32 val;
+
+	/* Set SSC downward spread spectrum */
+	val = FIELD_PREP(RK3528_PHYREG6_SSC_DIR, RK3528_PHYREG6_SSC_DOWNWARD);
+	rockchip_combphy_updatel(priv, RK3528_PHYREG6_SSC_DIR, val, RK3528_PHYREG6);
+
+	switch (priv->type) {
+	case PHY_TYPE_PCIE:
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_pcie, true);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_pcie, true);
+		break;
+	case PHY_TYPE_USB3:
+		/* Enable adaptive CTLE for USB3.0 Rx */
+		rockchip_combphy_updatel(priv, RK3528_PHYREG80_CTLE_EN, RK3528_PHYREG80_CTLE_EN,
+					 RK3528_PHYREG80);
+
+		/* Set slow slew rate control for PI */
+		val = FIELD_PREP(RK3528_PHYREG81_SLEW_RATE_CTRL,
+				 RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW);
+		rockchip_combphy_updatel(priv, RK3528_PHYREG81_SLEW_RATE_CTRL, val,
+					 RK3528_PHYREG81);
+
+		/* Set CDR phase path with 2x gain */
+		rockchip_combphy_updatel(priv, RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X,
+					 RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X, RK3528_PHYREG81);
+
+		/* Set Rx squelch input filler bandwidth */
+		val = FIELD_PREP(RK3528_PHYREG83_RX_SQUELCH, RK3528_PHYREG83_RX_SQUELCH_VALUE);
+		rockchip_combphy_updatel(priv, RK3528_PHYREG83_RX_SQUELCH, val, RK3528_PHYREG83);
+
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, false);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, false);
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->usb_mode_set, true);
+		break;
+	default:
+		dev_err(priv->dev, "incompatible PHY type\n");
+		return -EINVAL;
+	}
+
+	rate = clk_get_rate(priv->refclk);
+
+	switch (rate) {
+	case REF_CLOCK_24MHz:
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_24m, true);
+		if (priv->type == PHY_TYPE_USB3) {
+			/* Set ssc_cnt[10:0]=00101111101 & 31.5KHz */
+			val = FIELD_PREP(RK3528_PHYREG40_SSC_CNT, RK3528_PHYREG40_SSC_CNT_VALUE);
+			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_CNT, val,
+						 RK3528_PHYREG40);
+		} else if (priv->type == PHY_TYPE_PCIE) {
+			/* tx_trim[14]=1, Enable the counting clock of the rterm detect */
+			rockchip_combphy_updatel(priv, RK3528_PHYREG86_RTERM_DET_CLK_EN,
+						 RK3528_PHYREG86_RTERM_DET_CLK_EN, RK3528_PHYREG86);
+		}
+		break;
+	case REF_CLOCK_100MHz:
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
+		if (priv->type == PHY_TYPE_PCIE) {
+			/* PLL KVCO tuning fine */
+			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
+			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
+						 RK3528_PHYREG6);
+
+			/* su_trim[6:4]=111, [10:7]=1001, [2:0]=000, swing 650mv */
+			writel(0x570804f0, priv->mmio + RK3528_PHYREG42);
+		}
+		break;
+	default:
+		dev_err(priv->dev, "Unsupported rate: %lu\n", rate);
+		return -EINVAL;
+	}
+
+	if (device_property_read_bool(priv->dev, "rockchip,ext-refclk")) {
+		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
+
+		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_100MHz) {
+			val = FIELD_PREP(RK3528_PHYREG42_CKDRV_CLK_SEL,
+					 RK3528_PHYREG42_CKDRV_CLK_CKRCV);
+			val |= FIELD_PREP(RK3528_PHYREG42_PLL_LPF_R1_ADJ,
+					  RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE);
+			val |= FIELD_PREP(RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ,
+					  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE);
+			val |= FIELD_PREP(RK3528_PHYREG42_PLL_KVCO_ADJ,
+					  RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE);
+			rockchip_combphy_updatel(priv,
+						 RK3528_PHYREG42_CKDRV_CLK_SEL		|
+						 RK3528_PHYREG42_PLL_LPF_R1_ADJ		|
+						 RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	|
+						 RK3528_PHYREG42_PLL_KVCO_ADJ,
+						 val, RK3528_PHYREG42);
+
+			val = FIELD_PREP(RK3528_PHYREG6_PLL_KVCO, RK3528_PHYREG6_PLL_KVCO_VALUE);
+			rockchip_combphy_updatel(priv, RK3528_PHYREG6_PLL_KVCO, val,
+						 RK3528_PHYREG6);
+		}
+	}
+
+	if (priv->type == PHY_TYPE_PCIE) {
+		if (device_property_read_bool(priv->dev, "rockchip,enable-ssc"))
+			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
+						 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
+	}
+
+	return 0;
+}
+
+static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
+	/* pipe-phy-grf */
+	.pcie_mode_set		= { 0x0000, 5, 0, 0x00, 0x11 },
+	.usb_mode_set		= { 0x0000, 5, 0, 0x00, 0x04 },
+	.pipe_rxterm_set	= { 0x0000, 12, 12, 0x00, 0x01 },
+	.pipe_txelec_set	= { 0x0004, 1, 1, 0x00, 0x01 },
+	.pipe_txcomp_set	= { 0x0004, 4, 4, 0x00, 0x01 },
+	.pipe_clk_24m		= { 0x0004, 14, 13, 0x00, 0x00 },
+	.pipe_clk_100m		= { 0x0004, 14, 13, 0x00, 0x02 },
+	.pipe_rxterm_sel	= { 0x0008, 8, 8, 0x00, 0x01 },
+	.pipe_txelec_sel	= { 0x0008, 12, 12, 0x00, 0x01 },
+	.pipe_txcomp_sel	= { 0x0008, 15, 15, 0x00, 0x01 },
+	.pipe_clk_ext		= { 0x000c, 9, 8, 0x02, 0x01 },
+	.pipe_phy_status	= { 0x0034, 6, 6, 0x01, 0x00 },
+	.con0_for_pcie		= { 0x0000, 15, 0, 0x00, 0x110 },
+	.con1_for_pcie		= { 0x0004, 15, 0, 0x00, 0x00 },
+	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
+	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
+};
+
+static const struct rockchip_combphy_cfg rk3528_combphy_cfgs = {
+	.num_phys	= 1,
+	.phy_ids	= {
+		0xffdc0000,
+	},
+	.grfcfg		= &rk3528_combphy_grfcfgs,
+	.combphy_cfg	= rk3528_combphy_cfg,
+};
+
 static int rk3562_combphy_cfg(struct rockchip_combphy_priv *priv)
 {
 	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
@@ -1213,6 +1387,10 @@ static const struct rockchip_combphy_cfg rk3588_combphy_cfgs = {
 };
 
 static const struct of_device_id rockchip_combphy_of_match[] = {
+	{
+		.compatible = "rockchip,rk3528-naneng-combphy",
+		.data = &rk3528_combphy_cfgs,
+	},
 	{
 		.compatible = "rockchip,rk3562-naneng-combphy",
 		.data = &rk3562_combphy_cfgs,
-- 
2.49.0

