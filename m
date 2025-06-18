Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22DF27F017
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233570; cv=none; b=P8faio/OlGndXP6e4A1opx6na+wxwPU5URqtfCUx24BDu21/AI6yY7gUzRIIVfgSyBe0ybwHFXFDTFXcd6UjG4mPiLsF9sW2HCw9xiatVvKzFJtVsUzhqbFAvtHklHNgYCBUTPnAhQeFsaaaopf0RXCDpRjfR0qxQHH23beu/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233570; c=relaxed/simple;
	bh=D2xsvG8c9bOH5vQrDOtq5q2AWw0Yp3V5YLfR0V/+f4E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KNxkv5V/ZQkTX/FRINOoCtrSLk62LNKtaTK39frG9EPJhHl+wn/Ej+QJVsfhAepzJKI7X3afiFOxLj40ehwqUkqvF5JDE4vKpUVRcyYJxy8gbtqBQzwFOQp9abbDZjZI+syv2w2Obj3WMxR1iDnLMVx27+u8gjTr5uDArs9BcuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wCzxNFTb; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wCzxNFTb"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55I7w7OO045975;
	Wed, 18 Jun 2025 02:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750233487;
	bh=CpArHiSJG2AiZ5RKGHjm9INHc2O3KtIyN9fu0n+I6HA=;
	h=From:To:CC:Subject:Date;
	b=wCzxNFTbTCjWOqlQpo/Soq2+ndOit7oEh5PQ6K2DNaxbz7fhTM/txAk1jYAvaEDtC
	 wCQmzRHAy6q6pj22w1kEyNBNqRURMymVLEEgwLc1oRWjLIxRpUBF1P6Q4vmAFPfCWg
	 vArXg5eKQWvG74ccX2uKOcOF9jsjg/YDN7PJhPfE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55I7w67O2727886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 02:58:06 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 02:58:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 02:58:05 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.143])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55I7w5J23114640;
	Wed, 18 Jun 2025 02:58:05 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
        <tomi.valkeinen@ideasonboard.com>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <linux-kernel@vger.kernel.org>, <j-choudhary@ti.com>
Subject: [PATCH] drm/tidss: Decouple max_pclk from tidss feats to remove clock dependency
Date: Wed, 18 Jun 2025 13:28:04 +0530
Message-ID: <20250618075804.139844-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

TIDSS hardware by itself does not have variable max_pclk for each VP.
Each VP supports a fixed maximum pixel clock. K2 devices and AM62*
devices uses "ultra-light" version where each VP supports a max of
300MHz whereas J7* devices uses TIDSS where all VP can support a
max pclk of 600MHz.
The limitation that has been modeled till now comes from the clock
(PLL can only be programmed to a particular max value). Due to this
we end up using different compatible for each SoC when the clocking
architecture changes for VPs, even when the hardware is essentially
the same.
max_pclk cannot be entirely removed since the display controller
should tell if a particular mode clock can be supported or not in crtc's
"mode_valid()" call. So remove "max_pclk_khz" from the static display
feat and add it to "tidss_device" structure which would be modified in
runtime. In mode_valid() call, check if a best frequency match for mode
clock can be found or not using "clk_round_rate()". Based on that,
propagate "max_pclk" and check max_clk again only if the requested mode
clock is greater than saved value. (As the preferred display mode is
usually the max resolution, driver ends up checking the maximum clock
the first time itself which is used in subsequent checks)
Since TIDSS display controller provides clock tolerance of 5%, we use
this while checking the max_pclk. Also, move up "dispc_pclk_diff()"
before it is called.

This will make the existing compatibles reusable.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Test log on TI's J784S4 SoC with a couple of downstream patches
to integrate DSI support on one of the video ports:
<https://gist.github.com/Jayesh2000/ad4ab87028740efa60e5eb83fb892097>

From the logs, we can see that for CLK ID 218 (DSS), we do not have to
call sci_clk_determine_rate() multiple times. So there is very little
overhead of this call even with multiple mode_valid() called during
display run.
From weston-simple-egl application, I have seen that there is no frame
drop or performance impact.

Once this patch gets in, I will send patches for AM62P and J722S DSS
support.

 drivers/gpu/drm/tidss/tidss_dispc.c | 76 ++++++++++++-----------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
 drivers/gpu/drm/tidss/tidss_drv.h   |  2 +
 3 files changed, 34 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 542c3e10e0be..5196afe200f9 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -58,10 +58,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 const struct dispc_features dispc_k2g_feats = {
 	.min_pclk_khz = 4375,
 
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 150000,
-	},
-
 	/*
 	 * XXX According TRM the RGB input buffer width up to 2560 should
 	 *     work on 3 taps, but in practice it only works up to 1280.
@@ -144,11 +140,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 };
 
 const struct dispc_features dispc_am65x_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_OLDI] = 165000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -244,11 +235,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 };
 
 const struct dispc_features dispc_j721e_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 170000,
-		[DISPC_VP_INTERNAL] = 600000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 2048,
 		.in_width_max_3tap_rgb = 4096,
@@ -315,11 +301,6 @@ const struct dispc_features dispc_j721e_feats = {
 };
 
 const struct dispc_features dispc_am625_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_INTERNAL] = 170000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -380,10 +361,6 @@ const struct dispc_features dispc_am62a7_feats = {
 	 * if the code reaches dispc_mode_valid with VP1,
 	 * it should return MODE_BAD.
 	 */
-	.max_pclk_khz = {
-		[DISPC_VP_TIED_OFF] = 0,
-		[DISPC_VP_DPI] = 165000,
-	},
 
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
@@ -441,10 +418,6 @@ const struct dispc_features dispc_am62a7_feats = {
 };
 
 const struct dispc_features dispc_am62l_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-	},
-
 	.subrev = DISPC_AM62L,
 
 	.common = "common",
@@ -1326,25 +1299,49 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
 			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
 }
 
+/*
+ * Calculate the percentage difference between the requested pixel clock rate
+ * and the effective rate resulting from calculating the clock divider value.
+ */
+static
+unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
+{
+	int r = rate / 100, rr = real_rate / 100;
+
+	return (unsigned int)(abs(((rr - r) * 100) / r));
+}
+
+static int check_max_pixel_clock(struct dispc_device *dispc,
+				 u32 hw_videoport, unsigned long clock)
+{
+	if (clock > dispc->tidss->max_pclk[hw_videoport]) {
+		unsigned long round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
+
+		if (dispc_pclk_diff(clock, round_clock) > 5)
+			return -EINVAL;
+
+		dispc->tidss->max_pclk[hw_videoport] = round_clock;
+	}
+
+	return 0;
+}
+
 enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 u32 hw_videoport,
 					 const struct drm_display_mode *mode)
 {
 	u32 hsw, hfp, hbp, vsw, vfp, vbp;
 	enum dispc_vp_bus_type bus_type;
-	int max_pclk;
 
 	bus_type = dispc->feat->vp_bus_type[hw_videoport];
 
-	max_pclk = dispc->feat->max_pclk_khz[bus_type];
-
-	if (WARN_ON(max_pclk == 0))
+	if (bus_type == DISPC_VP_TIED_OFF)
 		return MODE_BAD;
 
 	if (mode->clock < dispc->feat->min_pclk_khz)
 		return MODE_CLOCK_LOW;
 
-	if (mode->clock > max_pclk)
+	if (check_max_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
 		return MODE_CLOCK_HIGH;
 
 	if (mode->hdisplay > 4096)
@@ -1416,18 +1413,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
 	clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
 }
 
-/*
- * Calculate the percentage difference between the requested pixel clock rate
- * and the effective rate resulting from calculating the clock divider value.
- */
-static
-unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
-{
-	int r = rate / 100, rr = real_rate / 100;
-
-	return (unsigned int)(abs(((rr - r) * 100) / r));
-}
-
 long dispc_vp_round_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
 			     unsigned long rate)
 {
@@ -3073,6 +3058,9 @@ int dispc_init(struct tidss_device *tidss)
 	}
 	dev_dbg(dev, "DSS fclk %lu Hz\n", clk_get_rate(dispc->fclk));
 
+	for (i = 0; i < dispc->feat->num_vps; i++)
+		dispc->tidss->max_pclk[i] = 0;
+
 	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
 			     &dispc->memory_bandwidth_limit);
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 422b7b324a2f..940c067987a7 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -78,7 +78,6 @@ enum dispc_dss_subrevision {
 
 struct dispc_features {
 	int min_pclk_khz;
-	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
 
 	struct dispc_features_scaling scaling;
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 56a2020e20d0..675cb4fabfa0 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -22,6 +22,8 @@ struct tidss_device {
 
 	const struct dispc_features *feat;
 	struct dispc_device *dispc;
+	long max_pclk[TIDSS_MAX_PORTS];
+
 
 	unsigned int num_crtcs;
 	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
-- 
2.34.1

