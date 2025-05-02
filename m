Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1ED22E3E7
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196905; cv=none; b=cKnrbwLP/lAt9RBEAFvuuVVdTiqAEIrf5cnhMpNTmJoWhTjVmGbROkh8wvPGVVUE478MeKUoTc4atl5xg7q0NwPlghmRkd2h3PBeWNEsefJhOzu9Z/M9g1klZ0NFtokfOMk/1tPKHJWP035Qgb2X6RYdmM4pysUdRbw7ca1iSlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196905; c=relaxed/simple;
	bh=wRB06aWUoFvAIFh3EUqSrQRuVJ/cLk6D3jb7XLHptyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M9vqUy+hRHs0QiZ9rZE5T/kO3j01XjHnt+IXal0wMCiRj+nhVvDFjaOVC4tFOmW2aAS4Dqy1M3SjfAmhLvwJz/LKBqpR5YRnORLT7ZlW5uCPDHNnwuLS/lFxHpXUyl9DxW8+fPpoG5G8Q2bICHu5cqne+EKTNVxiRDTWAJ3aXSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=ugPaCDoV; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="ugPaCDoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746196893; x=1746456093;
	bh=YDD7Tfq+Eps0vHG8CPXWTHstEOqGuUomGTuL/oqz3gg=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector:List-Unsubscribe:
	 List-Unsubscribe-Post;
	b=ugPaCDoVgHFH3HzWcMshlaKoJ7cw8LKJP2X9gUNgOYvaYYcTLsxC2l2St9Pca0Cqg
	 MUAkiaotgAeTC2ms8toGFOj0p4JPRWnHUWcobcuUm+BoIWUwr5+rUJwqoPyyfCob00
	 x9o2HDqdk78G60a6bCHNLJGWpcHy9DeTqgd6QSnkJHaPk6MXI/pL82AEhGjXYuXpdv
	 itXPkpfU36W6uAuK2XkyyFg4vXzIhkE12GRYstDlfWqYC1UTj4v0u+1VzyhOBI/Me/
	 Vrni1miQldHeFTvCvd/RhApD+Lmh5e2tb7Tw6mypNAWP2dwLUIS/GuUmyypBLmJ3yX
	 i8XtgywrgqJAg==
X-Pm-Submission-Id: 4ZptsN41Wpz44t
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 02 May 2025 16:41:23 +0200
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Support LVDS Channel B on
 SN65DSI84
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-sn65dsi83-channel-swap-v1-1-0738be9b27ab@geanix.com>
X-B4-Tracking: v=1; b=H4sIAJLZFGgC/x2MWwqAIBAArxL73YJlD+kq0YfYWgth4UIF4d2zP
 odh5gGhyCQwFA9EOll4DxmqsgC32rAQ8pwZalW3qtEKJXTtLGw0fj7QhnLZA32vrXe9sY4M5Pi
 I5Pn+x+OU0gsnyAbcaAAAAA==
X-Change-ID: 20250430-sn65dsi83-channel-swap-f73afc78ace8
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746196887; l=4020;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=wRB06aWUoFvAIFh3EUqSrQRuVJ/cLk6D3jb7XLHptyw=;
 b=7mkJ8UT8OcCUPjIWeQWMYEH1+nqQXdvjrJmouF3Z+2OVeDnuc6S5zD2j5TnfrFFdil3lcYv92
 xJUbQz1W/2BAbkKaM5SjwauRHM+RB1RBOvy+Qk1wEQCN2daCc8Rbo94
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

This adds support for using SN65DSI84 in single-link mode with output to
LVDS Channel B.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 95563aa1b450d549be8cacbe58c45f07b93595e5..e5785447c804eeced24f80c2b8b90283623c86a9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -11,6 +11,8 @@
  *   = 1x Single-link DSI ~ 2x Single-link or 1x Dual-link LVDS
  *   - Supported
  *   - Dual-link LVDS mode tested
+ *   - Single-link to LVDS Channel A tested.
+ *   - Single-link to LVDS Channel B tested.
  *   - 2x Single-link LVDS mode unsupported
  *     (should be easy to add by someone who has the HW)
  * - SN65DSI85
@@ -158,7 +160,7 @@ struct sn65dsi83 {
 	struct gpio_desc		*enable_gpio;
 	struct regulator		*vcc;
 	bool				lvds_dual_link;
-	bool				lvds_dual_link_even_odd_swap;
+	bool				lvds_channel_swap;
 	int				lvds_vod_swing_conf[2];
 	int				lvds_term_conf[2];
 	int				irq;
@@ -587,7 +589,7 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 			REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_A]) |
 			REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_B]));
 	regmap_write(ctx->regmap, REG_LVDS_LANE,
-		     (ctx->lvds_dual_link_even_odd_swap ?
+		     (ctx->lvds_channel_swap ?
 		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
 		     (ctx->lvds_term_conf[CHANNEL_A] ?
 			  REG_LVDS_LANE_CHA_LVDS_TERM : 0) |
@@ -834,6 +836,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 {
 	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
+	u32 panel_port = 2;
 	int ret;
 
 	ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_A);
@@ -845,29 +848,38 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 		return ret;
 
 	ctx->lvds_dual_link = false;
-	ctx->lvds_dual_link_even_odd_swap = false;
+	ctx->lvds_channel_swap = false;
 	if (model != MODEL_SN65DSI83) {
-		struct device_node *port2, *port3;
+		struct device_node *port0, *port1, *port2, *port3;
 		int dual_link;
 
+		port0 = of_graph_get_port_by_id(dev->of_node, 0);
+		port1 = of_graph_get_port_by_id(dev->of_node, 1);
 		port2 = of_graph_get_port_by_id(dev->of_node, 2);
 		port3 = of_graph_get_port_by_id(dev->of_node, 3);
 		dual_link = drm_of_lvds_get_dual_link_pixel_order(port2, port3);
-		of_node_put(port2);
-		of_node_put(port3);
 
 		if (dual_link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) {
-			ctx->lvds_dual_link = true;
 			/* Odd pixels to LVDS Channel A, even pixels to B */
-			ctx->lvds_dual_link_even_odd_swap = false;
-		} else if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
 			ctx->lvds_dual_link = true;
+		} else if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
 			/* Even pixels to LVDS Channel A, odd pixels to B */
-			ctx->lvds_dual_link_even_odd_swap = true;
+			ctx->lvds_dual_link = true;
+			ctx->lvds_channel_swap = true;
+		} else if (port0 && !port1 && port2 && !port3) {
+			/* DSI Channel A to LVDS Channel A */
+		} else if (port0 && !port1 && !port2 && port3) {
+			/* DSI Channel A to LVDS Channel B */
+			ctx->lvds_channel_swap = true;
+			panel_port = 3;
 		}
+		of_node_put(port0);
+		of_node_put(port1);
+		of_node_put(port2);
+		of_node_put(port3);
 	}
 
-	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, panel_port, 0);
 	if (IS_ERR(panel_bridge))
 		return dev_err_probe(dev, PTR_ERR(panel_bridge), "Failed to get panel bridge\n");
 

---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250430-sn65dsi83-channel-swap-f73afc78ace8

Best regards,
-- 
Esben Haabendal <esben@geanix.com>

