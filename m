Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9F727A916
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143762; cv=none; b=NgV094mbTWY5ckMYMewopEZF9uxpDFQIxk3AKZCQZ9Ve6OvypSWuzVQQVLMpQk+kc60RGel93ehhednD+ReFekzdKf6Gt4DxZIZHcl3waicQhUnyWwDcetHPWLrU7ovSrnGlEmP8JW77rCLRI7KrqLVxt7CWZqdKJLAGmFFvtVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143762; c=relaxed/simple;
	bh=mOpT+lrla1VIMKYk0PDD8P+0Babfo/nD7siBASuBgtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WI4y7fix8meVj8mL1K2zuXDonzUBXDnZruhT2j57InLlfuwbJEhsOL2wLoZqwrnBtIQMFpvl9CepkVQ8DUzhQUbtSIVT0R5oFpwTk2zPFYzm1rJW5vhpl8u4K3q2w0GzuawH3wLApH6QyTO+o6Sk9cG00JSzC3s+9JEKQwSA7zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eyZxkkSl; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eyZxkkSl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749143758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M9NCllNipIETn5Ms9WhRG3GuOeYbw61QE2xDj2iUzqI=;
	b=eyZxkkSlw2Z0ykcnsGYqDRsPgtzUWs6gynk2GHupp3Oy60ueleeEQt7y1YVKTP6S/M1/4U
	eQvlzRKuvEGallFw8S2I04n5SnxuTvP1AQUF/f/u4THVjCA4EzzU9eeICxAwMRLM9MZoRR
	ARaZ3CCrcvIt6vWWbnChzFOx/mlhhjI=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH v13 4/4] drm/bridge: cdns-dsi: Use pre_enable/post_disable to enable/disable
Date: Thu,  5 Jun 2025 22:45:24 +0530
Message-Id: <20250605171524.27222-5-aradhya.bhatia@linux.dev>
In-Reply-To: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Aradhya Bhatia <a-bhatia1@ti.com>

The cdns-dsi controller requires that it be turned on completely before
the input DPI's source has begun streaming[0]. Not having that, allows
for a small window before cdns-dsi enable and after cdns-dsi disable
where the previous entity (in this case tidss's videoport) to continue
streaming DPI video signals. This small window where cdns-dsi is
disabled but is still receiving signals causes the input FIFO of
cdns-dsi to get corrupted. This causes the colors to shift on the output
display. The colors can either shift by one color component (R->G, G->B,
B->R), or by two color components (R->B, G->R, B->G).

Since tidss's videoport starts streaming via crtc enable hooks, we need
cdns-dsi to be up and running before that. Now that the bridges are
pre_enabled before crtc is enabled, and post_disabled after crtc is
disabled, use the pre_enable and post_disable hooks to get cdns-dsi
ready and running before the tidss videoport to get pass the color shift
issues.

[0]: See section 12.6.5.7.3 "Start-up Procedure" in J721E SoC TRM
     TRM Link: http://www.ti.com/lit/pdf/spruil1

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 64 ++++++++++---------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 7604574da666..a57ca8c3bdae 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -670,13 +670,28 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
-					   struct drm_atomic_state *state)
+static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_atomic_state *state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	u32 val;
 
+	/*
+	 * The cdns-dsi controller needs to be disabled after it's DPI source
+	 * has stopped streaming. If this is not followed, there is a brief
+	 * window before DPI source is disabled and after cdns-dsi controller
+	 * has been disabled where the DPI stream is still on, but the cdns-dsi
+	 * controller is not ready anymore to accept the incoming signals. This
+	 * is one of the reasons why a shift in pixel colors is observed on
+	 * displays that have cdns-dsi as one of the bridges.
+	 *
+	 * To mitigate this, disable this bridge from the bridge post_disable()
+	 * hook, instead of the bridge _disable() hook. The bridge post_disable()
+	 * hook gets called after the CRTC disable, where often many DPI sources
+	 * disable their streams.
+	 */
+
 	val = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
 	val &= ~(IF_VID_SELECT_MASK | IF_VID_MODE | VID_EN | HOST_EOT_GEN |
 		 DISP_EOT_GEN);
@@ -688,15 +703,6 @@ static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
 	if (dsi->platform_ops && dsi->platform_ops->disable)
 		dsi->platform_ops->disable(dsi);
 
-	pm_runtime_put(dsi->base.dev);
-}
-
-static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
-						struct drm_atomic_state *state)
-{
-	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
-	struct cdns_dsi *dsi = input_to_dsi(input);
-
 	dsi->phy_initialized = false;
 	dsi->link_initialized = false;
 	phy_power_off(dsi->dphy);
@@ -774,8 +780,8 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
 	dsi->link_initialized = true;
 }
 
-static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
-					  struct drm_atomic_state *state)
+static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_atomic_state *state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
@@ -792,6 +798,21 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	u32 tmp, reg_wakeup, div, status;
 	int nlanes;
 
+	/*
+	 * The cdns-dsi controller needs to be enabled before it's DPI source
+	 * has begun streaming. If this is not followed, there is a brief window
+	 * after DPI source enable and before cdns-dsi controller enable where
+	 * the DPI stream is on, but the cdns-dsi controller is not ready to
+	 * accept the incoming signals. This is one of the reasons why a shift
+	 * in pixel colors is observed on displays that have cdns-dsi as one of
+	 * the bridges.
+	 *
+	 * To mitigate this, enable this bridge from the bridge pre_enable()
+	 * hook, instead of the bridge _enable() hook. The bridge pre_enable()
+	 * hook gets called before the CRTC enable, where often many DPI sources
+	 * enable their streams.
+	 */
+
 	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
 		return;
 
@@ -811,8 +832,8 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mode = &crtc_state->adjusted_mode;
 	nlanes = output->dev->lanes;
 
-	cdns_dsi_hs_init(dsi);
 	cdns_dsi_init_link(dsi);
+	cdns_dsi_hs_init(dsi);
 
 	/*
 	 * Now that the DSI Link and DSI Phy are initialized,
@@ -941,19 +962,6 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	writel(tmp, dsi->regs + MCTL_MAIN_EN);
 }
 
-static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					      struct drm_atomic_state *state)
-{
-	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
-	struct cdns_dsi *dsi = input_to_dsi(input);
-
-	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
-		return;
-
-	cdns_dsi_init_link(dsi);
-	cdns_dsi_hs_init(dsi);
-}
-
 static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 					       struct drm_bridge_state *bridge_state,
 					       struct drm_crtc_state *crtc_state,
@@ -1048,9 +1056,7 @@ cdns_dsi_bridge_atomic_reset(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 	.attach = cdns_dsi_bridge_attach,
 	.mode_valid = cdns_dsi_bridge_mode_valid,
-	.atomic_disable = cdns_dsi_bridge_atomic_disable,
 	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
-	.atomic_enable = cdns_dsi_bridge_atomic_enable,
 	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
 	.atomic_check = cdns_dsi_bridge_atomic_check,
 	.atomic_reset = cdns_dsi_bridge_atomic_reset,
-- 
2.34.1

