Received: from mail-m32114.qiye.163.com (mail-m32114.qiye.163.com [220.197.32.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D1E22B8B2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757316; cv=none; b=JpiDceQCHUeNlo5iSnwQIcUGR4RK8EF4OSU4wSbjWKuO8wj3WF+0EyQtAamHqg6yKA+3l3J6kTE1LB28YcsVbrILR0JNAe8Zs3bN0ivcL2CBNioPuy0OCf5VQQ0HREDCm6LkdsIZk4Ls461m5VhcKc2DPbG3Kyqg9+cS9TEel40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757316; c=relaxed/simple;
	bh=+VqEnKqaZS3H9vOnzs8oitINpODNNQDHWgw+gW5pHqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i5bLBRpRhuhUeT3LXrrrR84h2+irh1V39lwisKBYCzEPaG/pjFGvNr6iKkuspJyDeo5vMfsR7L6SEaDuolTJgsRf+56pjSh5G9VkveheHhM0SOCty4Yv/q3afnN1oEzvcO8rgLYyrpE6A5UyiKk3l01jqxxInTidjXwnN5tc4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=YFHAj99l; arc=none smtp.client-ip=220.197.32.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="YFHAj99l"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a3bebbbe;
	Wed, 5 Feb 2025 18:52:57 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	heiko@sntech.de
Cc: dmitry.baryshkov@linaro.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 3/4] phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all registers
Date: Wed,  5 Feb 2025 18:51:56 +0800
Message-Id: <20250205105157.580060-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205105157.580060-1-damon.ding@rock-chips.com>
References: <20250205105157.580060-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlPSFZISE9OTE8ZT0kfQxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d5bddcd303a3kunma3bebbbe
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6Tww5GjIUPApDA00pGDg2
	Pg4wClZVSlVKTEhDTE5JTExDT09DVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNSkNMNwY+
DKIM-Signature:a=rsa-sha256;
	b=YFHAj99l/XRrrk/fFHkPAqifCWw5mHhR1wC3obDAwyMTFI/ub5GmnWxC9z5nCEI0SqozZd1USekdlLpBELZ6mICs9z2ifxnpKQVGE1y/KDrS7oZNTmD1EMmZVPeSSBRYos3GZ87dWNHY3jgT0FWJpHhpRANVxOBCdlCGrDJXkVA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=uK63oZ4i0F32jSJA2To/0D+4/gNLK+p7bUQFW8Uf4/I=;
	h=date:mime-version:subject:message-id:from;

Adding the '_MASK' suffix to all registers in order to ensures consistency
in the naming convention for register macros throughout the file.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes in v4:
- Split the older patch related to the renaming of registers into three
  different commits
---
 .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 88 +++++++++----------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 423c61b7469f..5aec854c74b5 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -50,60 +50,60 @@
 #define LCPLL_PI_EN_MASK		BIT(5)
 #define LCPLL_100M_CLK_EN_MASK		BIT(0)
 /* CMN_REG(0025) */
-#define LCPLL_PMS_IQDIV_RSTN		BIT(4)
+#define LCPLL_PMS_IQDIV_RSTN_MASK	BIT(4)
 /* CMN_REG(0028) */
-#define LCPLL_SDC_FRAC_EN		BIT(2)
-#define LCPLL_SDC_FRAC_RSTN		BIT(0)
+#define LCPLL_SDC_FRAC_EN_MASK		BIT(2)
+#define LCPLL_SDC_FRAC_RSTN_MASK	BIT(0)
 /* CMN_REG(002d) */
 #define LCPLL_SDC_N_MASK		GENMASK(3, 1)
 /* CMN_REG(002e) */
 #define LCPLL_SDC_NUMBERATOR_MASK	GENMASK(5, 0)
 /* CMN_REG(002f) */
 #define LCPLL_SDC_DENOMINATOR_MASK	GENMASK(7, 2)
-#define LCPLL_SDC_NDIV_RSTN		BIT(0)
+#define LCPLL_SDC_NDIV_RSTN_MASK	BIT(0)
 /* CMN_REG(003d) */
-#define ROPLL_LCVCO_EN			BIT(4)
+#define ROPLL_LCVCO_EN_MASK		BIT(4)
 /* CMN_REG(004e) */
-#define ROPLL_PI_EN			BIT(5)
+#define ROPLL_PI_EN_MASK		BIT(5)
 /* CMN_REG(005c) */
-#define ROPLL_PMS_IQDIV_RSTN		BIT(5)
+#define ROPLL_PMS_IQDIV_RSTN_MASK	BIT(5)
 /* CMN_REG(005e) */
 #define ROPLL_SDM_EN_MASK		BIT(6)
-#define ROPLL_SDM_FRAC_EN_RBR		BIT(3)
-#define ROPLL_SDM_FRAC_EN_HBR		BIT(2)
-#define ROPLL_SDM_FRAC_EN_HBR2		BIT(1)
-#define ROPLL_SDM_FRAC_EN_HBR3		BIT(0)
+#define ROPLL_SDC_FRAC_EN_RBR_MASK	BIT(3)
+#define ROPLL_SDC_FRAC_EN_HBR_MASK	BIT(2)
+#define ROPLL_SDC_FRAC_EN_HBR2_MASK	BIT(1)
+#define ROPLL_SDM_FRAC_EN_HBR3_MASK	BIT(0)
 /* CMN_REG(0064) */
 #define ROPLL_SDM_NUM_SIGN_RBR_MASK	BIT(3)
 /* CMN_REG(0069) */
 #define ROPLL_SDC_N_RBR_MASK		GENMASK(2, 0)
 /* CMN_REG(0074) */
-#define ROPLL_SDC_NDIV_RSTN		BIT(2)
-#define ROPLL_SSC_EN			BIT(0)
+#define ROPLL_SDC_NDIV_RSTN_MASK	BIT(2)
+#define ROPLL_SSC_EN_MASK		BIT(0)
 /* CMN_REG(0081) */
-#define OVRD_PLL_CD_CLK_EN		BIT(8)
-#define ANA_PLL_CD_HSCLK_EAST_EN	BIT(0)
+#define OVRD_PLL_CD_CLK_EN_MASK		BIT(8)
+#define ANA_PLL_CD_HSCLK_EAST_EN_MASK	BIT(0)
 /* CMN_REG(0086) */
 #define PLL_PCG_POSTDIV_SEL_MASK	GENMASK(7, 4)
 #define PLL_PCG_CLK_SEL_MASK		GENMASK(3, 1)
-#define PLL_PCG_CLK_EN			BIT(0)
+#define PLL_PCG_CLK_EN_MASK		BIT(0)
 /* CMN_REG(0087) */
-#define ANA_PLL_FRL_MODE_EN		BIT(3)
-#define ANA_PLL_TX_HS_CLK_EN		BIT(2)
+#define ANA_PLL_FRL_MODE_EN_MASK	BIT(3)
+#define ANA_PLL_TX_HS_CLK_EN_MASK	BIT(2)
 /* CMN_REG(0089) */
-#define LCPLL_ALONE_MODE		BIT(1)
+#define LCPLL_ALONE_MODE_MASK		BIT(1)
 /* CMN_REG(0097) */
-#define DIG_CLK_SEL			BIT(1)
+#define DIG_CLK_SEL_MASK		BIT(1)
 #define LCPLL_REF			BIT(1)
 #define ROPLL_REF			0
 /* CMN_REG(0099) */
-#define CMN_ROPLL_ALONE_MODE		BIT(2)
+#define CMN_ROPLL_ALONE_MODE_MASK	BIT(2)
 #define ROPLL_ALONE_MODE		BIT(2)
 /* CMN_REG(009a) */
-#define HS_SPEED_SEL			BIT(0)
+#define HS_SPEED_SEL_MASK		BIT(0)
 #define DIV_10_CLOCK			BIT(0)
 /* CMN_REG(009b) */
-#define IS_SPEED_SEL			BIT(4)
+#define LS_SPEED_SEL_MASK		BIT(4)
 #define LINK_SYMBOL_CLOCK		BIT(4)
 #define LINK_SYMBOL_CLOCK1_2		0
 
@@ -161,36 +161,36 @@
 #define SB_READY_MASK			BIT(4)
 
 /* LNTOP_REG(0200) */
-#define PROTOCOL_SEL			BIT(2)
+#define PROTOCOL_SEL_MASK		BIT(2)
 #define HDMI_MODE			BIT(2)
 #define HDMI_TMDS_FRL_SEL		BIT(1)
 /* LNTOP_REG(0206) */
-#define DATA_BUS_SEL			BIT(0)
+#define DATA_BUS_WIDTH_SEL_MASK		BIT(0)
 #define DATA_BUS_36_40			BIT(0)
 /* LNTOP_REG(0207) */
-#define LANE_EN				0xf
+#define LANE_EN_MASK			0xf
 #define ALL_LANE_EN			0xf
 
 /* LANE_REG(0312) */
-#define LN0_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN0_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN0_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN0_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN0_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN0_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN0_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN0_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 /* LANE_REG(0412) */
-#define LN1_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN1_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN1_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN1_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN1_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN1_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN1_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN1_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 /* LANE_REG(0512) */
-#define LN2_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN2_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN2_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN2_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN2_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN2_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN2_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN2_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 /* LANE_REG(0612) */
-#define LN3_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN3_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN3_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN3_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN3_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN3_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN3_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN3_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 
 #define HDMI20_MAX_RATE			600000000
 
@@ -813,8 +813,8 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_POSTDIV_SEL_MASK,
 			   FIELD_PREP(PLL_PCG_POSTDIV_SEL_MASK, cfg->pms_sdiv));
 
-	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN,
-			   PLL_PCG_CLK_EN);
+	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
+			   FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
 
 	return rk_hdptx_post_enable_pll(hdptx);
 }
-- 
2.34.1

