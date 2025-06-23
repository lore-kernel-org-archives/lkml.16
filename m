Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1C8246793
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680203; cv=none; b=oYABz28Ryadw8aoCDFlGMtsYkqGzvlYmfNHcQ8kiRDRqJK1t28KK5SqT27Y7wtBzcfbbB/dyByQfOkuXwlTpPKUiomi4S9YMLasDLVwtKavJFOLD6G8lE2df81yOGLVFrNJp6Rlr+Jbxb6ynPILpfmySU07ijBPJK+chJ/c9f7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680203; c=relaxed/simple;
	bh=Kep1UgV29OPQ4w66WpWqd9vnrdD0pGwhoXX2kcCncG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXuEtjg3YoOlGcXR2mx7WP+NSKMuTTkOTuw9Bx2ecNSBEQRguMfZQjfqTEZtIU/GxpB0tZLKVF/CfAcafT1bdOsAk1PCdlAhl6RYwriinYfRGTB+RNC7mJPOZiP7gFHWPgt+obIjC9S8GOf4ClGuHh2I8poGgB8qdkeYBJQ7bXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BUzmfupd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BUzmfupd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680200;
	bh=Kep1UgV29OPQ4w66WpWqd9vnrdD0pGwhoXX2kcCncG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BUzmfupdU6G5IRchHGNXcuAebw5hxhpDacHOT/DWgyEzLViO9xtUWxUcQ+gP9b8uF
	 ndeIDVomCTwt6eJ+5DcV/s10pqt3z38Hy4XUGciZ7PVOps0f3jazLLIwHIenfzt2r/
	 rtBLwhk2HcASt+uzC36u8Iii2WbuCPFfehLLp32R5HDZgZHleS0E6cF1iiCpdTHil1
	 eH5qfPRptEesQLj7FLzqou88V6ruGw4bXvT8ld4uNnSg0MqVjQ68ZctKMRtLaTDmsV
	 12svNUv9f9nuWa40CUPMRd/dKLDIYuwDuTrPNmdj4w+taFBIMo+X6Bxptg5PEbaU0h
	 6hHD95Wu/jwnw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9107417E10D5;
	Mon, 23 Jun 2025 14:03:19 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 2/2] phy: mediatek: tphy: Cleanup and document slew calibration
Date: Mon, 23 Jun 2025 14:03:15 +0200
Message-ID: <20250623120315.109881-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
References: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While it's true that, generally, the T-PHY V3 does not support the
slew calibration process, some minor versions of it actually do,
moreover, some SoCs may not support this even though the version
of the PHY IP does.

The reference clock and rate coefficient parameters are used only
for slew calibration: move those to platform data, then document
and change the checks in hs_slew_rate_calibrate() to perform the
calibration only if:
 - EYE value was not supplied (pre-calculated calibration); and
 - Slew reference clock value is present (not zero); and
 - Slew coefficient is present (not zero).

Moreover, change the probe function to always check if both the
slew reference clock and coefficient properties are present and,
if not, assign the value from platform data (which, as reminder,
if not added means that it's zero!), instead of checking the PHY
IP version.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 45 +++++++++++++++++------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 858824b4476e..e5ce1255d735 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -210,8 +210,6 @@
 #define P2F_USB_FM_VALID	BIT(0)
 #define P2F_RG_FRCK_EN		BIT(8)
 
-#define U3P_REF_CLK		26	/* MHZ */
-#define U3P_SLEW_RATE_COEF	28
 #define U3P_SR_COEF_DIVISOR	1000
 #define U3P_FM_DET_CYCLE_CNT	1024
 
@@ -285,12 +283,16 @@ enum mtk_phy_version {
  * @sw_efuse_supported:       Switches off eFuse auto-load from PHY and applies values
  *                            read from different nvmem (usually different eFuse array)
  *                            that is pointed at in the device tree node for this PHY
+ * @slew_ref_clk_mhz:         Default reference clock (in MHz) for slew rate calibration
+ * @slew_rate_coefficient:    Coefficient for slew rate calibration
  * @version:                  PHY IP Version
  */
 struct mtk_phy_pdata {
 	bool avoid_rx_sen_degradation;
 	bool sw_pll_48m_to_26m;
 	bool sw_efuse_supported;
+	u8 slew_ref_clock_mhz;
+	u8 slew_rate_coefficient;
 	enum mtk_phy_version version;
 };
 
@@ -686,12 +688,14 @@ static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
 	int fm_out;
 	u32 tmp;
 
-	/* HW V3 doesn't support slew rate cal anymore */
-	if (tphy->pdata->version == MTK_PHY_V3)
-		return;
-
-	/* use force value */
-	if (instance->eye_src)
+	/*
+	 * If a fixed HS slew rate (EYE) value was supplied, don't run the
+	 * calibration sequence and prefer using that value instead; also,
+	 * if there is no reference clock for slew calibration or there is
+	 * no slew coefficient, this means that the slew rate calibration
+	 * sequence is not supported.
+	 */
+	if (instance->eye_src || !tphy->src_ref_clk || !tphy->src_coef)
 		return;
 
 	/* enable USB ring oscillator */
@@ -1516,12 +1520,16 @@ static const struct phy_ops mtk_tphy_ops = {
 
 static const struct mtk_phy_pdata tphy_v1_pdata = {
 	.avoid_rx_sen_degradation = false,
+	.slew_ref_clock_mhz = 26,
+	.slew_rate_coefficient = 28,
 	.version = MTK_PHY_V1,
 };
 
 static const struct mtk_phy_pdata tphy_v2_pdata = {
 	.avoid_rx_sen_degradation = false,
 	.sw_efuse_supported = true,
+	.slew_ref_clock_mhz = 26,
+	.slew_rate_coefficient = 28,
 	.version = MTK_PHY_V2,
 };
 
@@ -1532,6 +1540,8 @@ static const struct mtk_phy_pdata tphy_v3_pdata = {
 
 static const struct mtk_phy_pdata mt8173_pdata = {
 	.avoid_rx_sen_degradation = true,
+	.slew_ref_clock_mhz = 26,
+	.slew_rate_coefficient = 28,
 	.version = MTK_PHY_V1,
 };
 
@@ -1561,7 +1571,7 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	struct resource *sif_res;
 	struct mtk_tphy *tphy;
 	struct resource res;
-	int port;
+	int port, ret;
 
 	tphy = devm_kzalloc(dev, sizeof(*tphy), GFP_KERNEL);
 	if (!tphy)
@@ -1591,15 +1601,14 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (tphy->pdata->version < MTK_PHY_V3) {
-		tphy->src_ref_clk = U3P_REF_CLK;
-		tphy->src_coef = U3P_SLEW_RATE_COEF;
-		/* update parameters of slew rate calibrate if exist */
-		device_property_read_u32(dev, "mediatek,src-ref-clk-mhz",
-					 &tphy->src_ref_clk);
-		device_property_read_u32(dev, "mediatek,src-coef",
-					 &tphy->src_coef);
-	}
+	/* Optional properties for slew calibration variation */
+	ret = device_property_read_u32(dev, "mediatek,src-ref-clk-mhz", &tphy->src_ref_clk);
+	if (ret)
+		tphy->src_ref_clk = tphy->pdata->slew_ref_clock_mhz;
+
+	ret = device_property_read_u32(dev, "mediatek,src-coef", &tphy->src_coef);
+	if (ret)
+		tphy->src_coef = tphy->pdata->slew_rate_coefficient;
 
 	port = 0;
 	for_each_child_of_node_scoped(np, child_np) {
-- 
2.49.0

