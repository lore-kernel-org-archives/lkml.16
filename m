Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8271D54FA
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743248428; cv=none; b=uV3+NbFyia3s2k/IFWpO7dELcIlzG4McwRnVDCkAI95tLMrgXGqM9fnkyDSRR4jOriVwnfZL5SWhtyhEPErBKrps7vqtb4XsTtVjRo9PRri/+YsbdvHYhLn07mxauSo7EZYjjicvTwGVAdpeIfvgQ0P70LLwwcpXB6lxiivvbdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743248428; c=relaxed/simple;
	bh=JUV5VFnimVlbNX4xusyf8KmUUVcs3c8Rwcdjk3yT04M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YPKonAtn0/yAoUf+H4l1/VnxTB3Fb0XOBseskuY1JKV7VIx+wJYUHM4reZ7XnRQqXXPV5iEbd7/GBiu5+yvriwBfrauJneFlgENXOjeSYmKdA55y8WoIe+M6dxoSIPTQoDzujEIawtggqWrNtC1XOzzrhcrvCBRQzak2pDSM3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kyYqHjrt; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kyYqHjrt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743248425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxgtUtrtqq/8AD0qz+LAbN2burWE3n45NhMYcO+xhOw=;
	b=kyYqHjrt03pO2hGVnodsxc253clonURpEVvle7hDYZxWzrVFD7OfRy1cANfnFRMMPL6CR8
	pIH8s45w4Rx/84NS7i7IaLZB1AzqQMDs8rTvX+Q9QOGRIUb0NSfoWYN8O/e0u1tS09O1lS
	6R8X66pSYsBgJRzxf/mQrysTZVIv2kk=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Dominik Haller <d.haller@phytec.de>,
	DRI Development List <dri-devel@lists.freedesktop.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v11 09/14] drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()
Date: Sat, 29 Mar 2025 17:09:20 +0530
Message-Id: <20250329113925.68204-10-aradhya.bhatia@linux.dev>
In-Reply-To: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
References: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Aradhya Bhatia <a-bhatia1@ti.com>

At present, the DSI mode configuration check happens during the
_atomic_enable() phase, which is not really the best place for this.
Moreover, if the mode is not valid, the driver gives a warning and
continues the hardware configuration.

Move the DSI mode configuration check to _atomic_check() instead, which
can properly report back any invalid mode, before the _enable phase even
begins.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 93 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index c333b5c025d9..b022dd6e6b6e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -425,6 +425,17 @@
 #define DSI_NULL_FRAME_OVERHEAD		6
 #define DSI_EOT_PKT_SIZE		4
 
+struct cdns_dsi_bridge_state {
+	struct drm_bridge_state base;
+	struct cdns_dsi_cfg dsi_cfg;
+};
+
+static inline struct cdns_dsi_bridge_state *
+to_cdns_dsi_bridge_state(struct drm_bridge_state *bridge_state)
+{
+	return container_of(bridge_state, struct cdns_dsi_bridge_state, base);
+}
+
 static inline struct cdns_dsi *input_to_dsi(struct cdns_dsi_input *input)
 {
 	return container_of(input, struct cdns_dsi, input);
@@ -771,6 +782,8 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct cdns_dsi_output *output = &dsi->output;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
+	struct cdns_dsi_bridge_state *dsi_state;
+	struct drm_bridge_state *new_bridge_state;
 	struct drm_display_mode *mode;
 	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
 	struct drm_connector *connector;
@@ -782,6 +795,13 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
 		return;
 
+	new_bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (WARN_ON(!new_bridge_state))
+		return;
+
+	dsi_state = to_cdns_dsi_bridge_state(new_bridge_state);
+	dsi_cfg = dsi_state->dsi_cfg;
+
 	if (dsi->platform_ops && dsi->platform_ops->enable)
 		dsi->platform_ops->enable(dsi);
 
@@ -791,8 +811,6 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mode = &crtc_state->adjusted_mode;
 	nlanes = output->dev->lanes;
 
-	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));
-
 	cdns_dsi_hs_init(dsi);
 	cdns_dsi_init_link(dsi);
 
@@ -963,6 +981,70 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
+	struct cdns_dsi *dsi = input_to_dsi(input);
+	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
+	const struct drm_display_mode *mode = &crtc_state->mode;
+	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
+
+	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
+}
+
+static struct drm_bridge_state *
+cdns_dsi_bridge_atomic_duplicate_state(struct drm_bridge *bridge)
+{
+	struct cdns_dsi_bridge_state *dsi_state, *old_dsi_state;
+	struct drm_bridge_state *bridge_state;
+
+	if (WARN_ON(!bridge->base.state))
+		return NULL;
+
+	bridge_state = drm_priv_to_bridge_state(bridge->base.state);
+	old_dsi_state = to_cdns_dsi_bridge_state(bridge_state);
+
+	dsi_state = kzalloc(sizeof(*dsi_state), GFP_KERNEL);
+	if (!dsi_state)
+		return NULL;
+
+	__drm_atomic_helper_bridge_duplicate_state(bridge, &dsi_state->base);
+
+	memcpy(&dsi_state->dsi_cfg, &old_dsi_state->dsi_cfg,
+	       sizeof(dsi_state->dsi_cfg));
+
+	return &dsi_state->base;
+}
+
+static void
+cdns_dsi_bridge_atomic_destroy_state(struct drm_bridge *bridge,
+				     struct drm_bridge_state *state)
+{
+	struct cdns_dsi_bridge_state *dsi_state;
+
+	dsi_state = to_cdns_dsi_bridge_state(state);
+
+	kfree(dsi_state);
+}
+
+static struct drm_bridge_state *
+cdns_dsi_bridge_atomic_reset(struct drm_bridge *bridge)
+{
+	struct cdns_dsi_bridge_state *dsi_state;
+
+	dsi_state = kzalloc(sizeof(*dsi_state), GFP_KERNEL);
+	if (!dsi_state)
+		return NULL;
+
+	memset(dsi_state, 0, sizeof(*dsi_state));
+	dsi_state->base.bridge = bridge;
+
+	return &dsi_state->base;
+}
+
 static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 	.attach = cdns_dsi_bridge_attach,
 	.mode_valid = cdns_dsi_bridge_mode_valid,
@@ -970,9 +1052,10 @@ static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
 	.atomic_enable = cdns_dsi_bridge_atomic_enable,
 	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
-	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_check = cdns_dsi_bridge_atomic_check,
+	.atomic_reset = cdns_dsi_bridge_atomic_reset,
+	.atomic_duplicate_state = cdns_dsi_bridge_atomic_duplicate_state,
+	.atomic_destroy_state = cdns_dsi_bridge_atomic_destroy_state,
 	.atomic_get_input_bus_fmts = cdns_dsi_bridge_get_input_bus_fmts,
 };
 
-- 
2.34.1

