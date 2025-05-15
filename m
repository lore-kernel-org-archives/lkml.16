Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626F12580D0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330635; cv=none; b=UzHfBLbO5L/rI0xipjhBeA2Z+ARKxJJUQKktgjRHkNdYN+3J8dWwuUfCX4GIQ+64sawtsAawphk0R4e8abYmuEtVJ7dUj442Fjgpro9Dmf4Ev+aoxTEdtSYyBKbzEeyrbwh58qlIlOndoEdMAS906+WyI5kDi2wDj3LldPEqOLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330635; c=relaxed/simple;
	bh=lqowOTx858wgAs1bOG64PxB+nvwv1g6TqF0L09rvAp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oXtPsw/RwoKxn9c70qZt/nYTV9aSjq0XSxe2S+Hm++MpfcVBq7keq7MmTuE5FbjYXJmJ6b8MwpFZAr3LSF7a7OTW/l17aoRYzUnnFFLHjViFLLbpt8LrI8xZ9J4aGA/mvYI0TOT4pCDRrvpTnsVZn9VgsP9VYtPWUKAhGVExeUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uFcVk-0008Ry-Jo; Thu, 15 May 2025 19:36:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	alexander.stein@ew.tq-group.com
Cc: kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 1/2] drm/bridge: fsl-ldb: make use of dev_err_probe
Date: Thu, 15 May 2025 19:36:42 +0200
Message-Id: <20250515173643.2140748-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250515173643.2140748-1-m.felsch@pengutronix.de>
References: <20250515173643.2140748-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Make use of dev_err_probe() to easily spot issues via the debugfs or
kernel log. No functional changes.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changelog:
v2:
 - add Laurent's r-b
 - add Alexander's r-b

 drivers/gpu/drm/bridge/fsl-ldb.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0fc8a14fd800..6916cdb15372 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -312,11 +312,13 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 
 	fsl_ldb->clk = devm_clk_get(dev, "ldb");
 	if (IS_ERR(fsl_ldb->clk))
-		return PTR_ERR(fsl_ldb->clk);
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->clk),
+				     "Failed to get ldb clk\n");
 
 	fsl_ldb->regmap = syscon_node_to_regmap(dev->of_node->parent);
 	if (IS_ERR(fsl_ldb->regmap))
-		return PTR_ERR(fsl_ldb->regmap);
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->regmap),
+				     "Failed to get regmap\n");
 
 	/* Locate the remote ports and the panel node */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
@@ -339,12 +341,12 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	panel = of_drm_find_panel(panel_node);
 	of_node_put(panel_node);
 	if (IS_ERR(panel))
-		return PTR_ERR(panel);
+		return dev_err_probe(dev, PTR_ERR(panel), "drm panel not found\n");
 
 	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
 	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
+				     "drm panel-bridge add failed\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;
@@ -360,10 +362,9 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 					     "Error getting dual link configuration\n");
 
 		/* Only DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS is supported */
-		if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
-			dev_err(dev, "LVDS channel pixel swap not supported.\n");
-			return -EINVAL;
-		}
+		if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS)
+			return dev_err_probe(dev, -EINVAL,
+					     "LVDS channel pixel swap not supported.\n");
 	}
 
 	platform_set_drvdata(pdev, fsl_ldb);
-- 
2.39.5

