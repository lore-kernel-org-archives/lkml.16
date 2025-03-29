Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0381D1C5F23
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743248412; cv=none; b=RXIZvqm8COZzPmuZrv1QqOR0nH0XJYAnBaWXF4pMWEkITZKoebEBe3SXKYOXmDNT6Qpvvwwo8EDCjIFdkxxylqjp10ZwFfRpqBMvM+Bpltki0zgXLO0a+FAeFrMb25hn8JI+wn5NViLUHibpFn+x/MDAdRnvc7iJlQRTDJ626s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743248412; c=relaxed/simple;
	bh=kzBL7mXloZ4ATPJ9KsUKiN1tLR5xCdeGjpryW/r4/io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BbEdJHthf+JIFi9hst51Wb9kBVfGu+TK2QLfK48OR5zgXjxgN64cWciQBFUT1I2Z523vwrO5GHR/qNy/Oj++ZvIN4V+zEVRP7+kXZU5ULuwlglhBk2st1zzgXoxGyJCrEqCNApuV6fhsZLWArt1YcJB0hW8p/4sAFI5QqDAFdL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nfEAp2UY; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nfEAp2UY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743248408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmtcsscavg4CzgqVxufE3PJb7NQFr0a6vW9lVakdTYI=;
	b=nfEAp2UYAtfXP03mIE9K7l5QMCEpLWgll+VHmKORN1askhq6TS1sTm9JKIRxkTZO+EboRV
	sXwT1yLNWN7LQrVQwl/SxJg1Ytq7XTHLOfvVLLhrqOyEBXKx++RyWH5pt/rVPaI1PIYpFN
	1yRBUUFj7QijSUEqb9XF9ijK7v1nVcc=
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
Subject: [PATCH v11 06/14] drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()
Date: Sat, 29 Mar 2025 17:09:17 +0530
Message-Id: <20250329113925.68204-7-aradhya.bhatia@linux.dev>
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

Instead of manually finding the next bridge/panel, and maintaining the
panel-bridge (in-case the next entity is a panel), switch to using the
automatically managing devm_drm_of_get_bridge() API.

Drop the drm_panel support completely from the driver while at it.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 28 ++-----------------
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  2 --
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 93c3d5f1651d..89a3f3efc522 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -955,8 +955,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	struct cdns_dsi_output *output = &dsi->output;
 	struct cdns_dsi_input *input = &dsi->input;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	struct device_node *np;
 	int ret;
 
 	/*
@@ -974,26 +972,10 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	/*
 	 * The host <-> device link might be described using an OF-graph
 	 * representation, in this case we extract the device of_node from
-	 * this representation, otherwise we use dsidev->dev.of_node which
-	 * should have been filled by the core.
+	 * this representation.
 	 */
-	np = of_graph_get_remote_node(dsi->base.dev->of_node, DSI_OUTPUT_PORT,
-				      dev->channel);
-	if (!np)
-		np = of_node_get(dev->dev.of_node);
-
-	panel = of_drm_find_panel(np);
-	if (!IS_ERR(panel)) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-	} else {
-		bridge = of_drm_find_bridge(np);
-		if (!bridge)
-			bridge = ERR_PTR(-EINVAL);
-	}
-
-	of_node_put(np);
-
+	bridge = devm_drm_of_get_bridge(dsi->base.dev, dsi->base.dev->of_node,
+					DSI_OUTPUT_PORT, dev->channel);
 	if (IS_ERR(bridge)) {
 		ret = PTR_ERR(bridge);
 		dev_err(host->dev, "failed to add DSI device %s (err = %d)",
@@ -1003,7 +985,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 
 	output->dev = dev;
 	output->bridge = bridge;
-	output->panel = panel;
 
 	/*
 	 * The DSI output has been properly configured, we can now safely
@@ -1019,12 +1000,9 @@ static int cdns_dsi_detach(struct mipi_dsi_host *host,
 			   struct mipi_dsi_device *dev)
 {
 	struct cdns_dsi *dsi = to_cdns_dsi(host);
-	struct cdns_dsi_output *output = &dsi->output;
 	struct cdns_dsi_input *input = &dsi->input;
 
 	drm_bridge_remove(&input->bridge);
-	if (output->panel)
-		drm_panel_bridge_remove(output->bridge);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
index ca7ea2da635c..5db5dbbbcaad 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
@@ -10,7 +10,6 @@
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_panel.h>
 
 #include <linux/bits.h>
 #include <linux/completion.h>
@@ -21,7 +20,6 @@ struct reset_control;
 
 struct cdns_dsi_output {
 	struct mipi_dsi_device *dev;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	union phy_configure_opts phy_opts;
 };
-- 
2.34.1

