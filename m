Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF3726AC3
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261516; cv=none; b=TSzGQwDlQk/WiU8k7EBAorekxIB9y1M84G9csBukqErRxgbGU6QL/gXBfx9VeRUswuf1FvYw793N4lakZZXTfDRoQjETF/TylWrPqro5FIolsjGsCa/L6DS+HYwkjGlZZ2X9EfEFrmggnP6/RAvQih55fVJAoHrYXeyEzsvTmqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261516; c=relaxed/simple;
	bh=0mhDVq8PmqKlmu4csYwz3TvRjSxaKgBaOMs+q2+IyDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ld9z0r7AxDeFIPEDXEeCiy8KT47662XDCf7l21g7rRwpOInVlBL5ih6JiuUweAvQlIOihpOvvFaAeAOmJ9Rju4fri6oY9lO0QxOkKkENV68wMzOr0JLZ9irMD9Agy2MsH7egoF+9bldRbANiCGzUn6U9JqqmDS/85uLktQV7WlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uFKX6-0007tY-75; Thu, 15 May 2025 00:25:00 +0200
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
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 3/3] drm/bridge: fsl-ldb: simplify device_node error handling
Date: Thu, 15 May 2025 00:24:53 +0200
Message-Id: <20250514222453.440915-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250514222453.440915-1-m.felsch@pengutronix.de>
References: <20250514222453.440915-1-m.felsch@pengutronix.de>
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

Make use of __free(device_node) to simplify the of_node_put() error
handling paths. No functional changes.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index e0a229c91953..cea9ddaa5e01 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -287,8 +287,9 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
-	struct device_node *remote1, *remote2;
+	struct device_node *panel_node __free(device_node) = NULL;
+	struct device_node *remote1 __free(device_node) = NULL;
+	struct device_node *remote2 __free(device_node) = NULL;
 	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
@@ -321,21 +322,16 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
-	of_node_put(remote1);
-	of_node_put(remote2);
+	panel_node = remote1 ? remote1 : remote2;
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
 		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
 	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
 	if (IS_ERR(panel))
 		return dev_err_probe(dev, PTR_ERR(panel), "drm panel not found\n");
 
@@ -345,14 +341,12 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 				     "drm panel-bridge add failed\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
-		struct device_node *port1, *port2;
+		struct device_node *port1 __free(device_node) =
+			of_graph_get_port_by_id(dev->of_node, 1);
+		struct device_node *port2 __free(device_node) =
+			of_graph_get_port_by_id(dev->of_node, 2);
 
-		port1 = of_graph_get_port_by_id(dev->of_node, 1);
-		port2 = of_graph_get_port_by_id(dev->of_node, 2);
 		dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
-		of_node_put(port1);
-		of_node_put(port2);
-
 		if (dual_link < 0)
 			return dev_err_probe(dev, dual_link,
 					     "Error getting dual link configuration\n");
-- 
2.39.5

