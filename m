Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C886F134CB;
	Fri,  9 May 2025 00:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751409; cv=none; b=LZfu9KAguxbFJ5CNuK19n8ijid8WjWX0FuDYMIWuC34iqL7Xi1ZxDrAm5UgWvu/JrbSTaUeFy2ZAeRrpYYt05yJguzV2ypMwniSJ9PxlZFHi+TekDwmuYFv48MvR3kVgFBMApxhbIuk5yJhejUrvuv3ZYP1t3aGmrlPSfVs3uME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751409; c=relaxed/simple;
	bh=3eoOV/NGXtwCafnQhCM2GGOVYlGtm2oY5dmzW5ifD5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+AtRhmdr9/Xl4sFwRcF5oDOlmtel2oFEVyaufzyvJqLZROSpv4AML3272IBDssV+FqO0O4Nlb9DCYRyet10W8Lzw63iSc0BvOLDkQP71O88ewyZ1d7chGisDrVpUn5nd7d9t5aAMIkppKlghumnkqn6j1SlCK4pRebnxjn6Pgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Vw+JoE7h; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Vw+JoE7h"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4F3052614E;
	Fri,  9 May 2025 02:43:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9uciWydNmGM; Fri,  9 May 2025 02:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746751405; bh=3eoOV/NGXtwCafnQhCM2GGOVYlGtm2oY5dmzW5ifD5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vw+JoE7hOTTBtVlktrJ5rLvTS1t/0vY3vN8oAlLrXsDwl57mOqnZB9S6rtGO3onql
	 HWvvAIkvSkLXXqA9XdLYoVqv1h/BHlsgbVrXakkEWvs7XAGcFfsKe8b/klfq27Zff6
	 HkfA/LFKS3ijlpEeBmaAyiiH9B1DZxgGciyfw3DueybINx3dRcfbsZEEdziT9gR/4U
	 bTo394d3bOIaDACGspQZ/bV3UR7oNKFBs86+uj44V1hxLd/4HJ3imJVn59sRCVV8f5
	 roFRoS44aHJ342TLBamti7KYHLIJpChdHtpjSEVdKlwWWV8MqERaR7jlvQW2jn+3ii
	 06FqIlbtNCoCw==
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
Subject: [PATCH v2 4/5] phy: rockchip: naneng-combphy: Add RK3528 support
Date: Fri,  9 May 2025 00:41:21 +0000
Message-ID: <20250509004121.36058-6-ziyao@disroot.org>
In-Reply-To: <20250509004121.36058-2-ziyao@disroot.org>
References: <20250509004121.36058-2-ziyao@disroot.org>
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
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 .../rockchip/phy-rockchip-naneng-combphy.c    | 186 +++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 1d1c7723584b..bf00a85a113b 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -20,7 +20,46 @@
 #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
 #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
 
-/* COMBO PHY REG */
+/* RK3528 COMBO PHY REG */
+#define RK3528_PHYREG6				0x18
+#define RK3528_PHYREG6_PLL_KVCO			GENMASK(12, 10)
+#define RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
+#define RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
+#define RK3528_PHYREG6_SSC_UPWARD		0
+#define RK3528_PHYREG6_SSC_DOWNWARD		1
+
+#define RK3528_PHYREG40				0x100
+#define RK3528_PHYREG40_SSC_EN			BIT(20)
+#define RK3528_PHYREG40_SSC_CNT			GENMASK(10, 0)
+#define RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
+
+#define RK3528_PHYREG42				0x108
+#define RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
+#define RK3528_PHYREG42_CKDRV_CLK_PLL		0
+#define RK3528_PHYREG42_CKDRV_CLK_CKRCV		1
+#define RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
+#define RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
+#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
+#define RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
+#define RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
+#define RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
+
+#define RK3528_PHYREG80				0x200
+#define RK3528_PHYREG80_CTLE_EN			BIT(17)
+
+#define RK3528_PHYREG81				0x204
+#define RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
+#define RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
+#define RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
+
+#define RK3528_PHYREG83				0x20c
+#define RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
+#define RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
+
+#define RK3528_PHYREG86				0x218
+#define RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)
+
+/* RK3568 COMBO PHY REG */
 #define RK3568_PHYREG6				0x14
 #define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
 #define RK3568_PHYREG6_PLL_DIV_SHIFT		6
@@ -398,6 +437,147 @@ static int rockchip_combphy_probe(struct platform_device *pdev)
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
@@ -1213,6 +1393,10 @@ static const struct rockchip_combphy_cfg rk3588_combphy_cfgs = {
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

