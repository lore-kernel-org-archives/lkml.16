Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98720C038
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261515; cv=none; b=IDIkXq7wIAZ9f6VOBebDrJ6hMVPvSL0BYfm23l67JMlvtQGqIHVy0fusNK37I0QN93s7EOozPh2FPwQqontfRk6UQbs/r+uRM0GXp7kNJIInUhxuehxfz8amtdOLbSRKV608i2TtNsgjx5D5m5kLjhQdTysiBPvqccoOts8pJJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261515; c=relaxed/simple;
	bh=5JilTWXiKwJ5gQhF3e8XWzywYESI05l3lpKlDFyYWtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FUP36ImlnQGmZVfoCMh0xp6oprL7UxDASkdfdXiL3n3dQR/7oF89N/LbjSmt59kEmGpQN9I9Jpo31+EFMCy6l60vaIuqKnkHNmmVzsnVCUFqR0iekHXl8hEMeRh0pLjLm/NOPp39CGdD4/606fhR2jO8cLPG2LNeAiZXgPHuXrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uFKX5-0007tY-Rx; Thu, 15 May 2025 00:24:59 +0200
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
Subject: [PATCH 1/3] drm/bridge: fsl-ldb: make use of driver_private
Date: Thu, 15 May 2025 00:24:51 +0200
Message-Id: <20250514222453.440915-2-m.felsch@pengutronix.de>
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

Make use of the drm_bridge::driver_private data instead of
container_of() wrapper.

No functional changes.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0fc8a14fd800..fa29f2bf4031 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -99,11 +99,6 @@ static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
 	return (fsl_ldb->ch0_enabled && fsl_ldb->ch1_enabled);
 }
 
-static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
-{
-	return container_of(bridge, struct fsl_ldb, bridge);
-}
-
 static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
 {
 	if (fsl_ldb_is_dual(fsl_ldb))
@@ -115,7 +110,7 @@ static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
 static int fsl_ldb_attach(struct drm_bridge *bridge,
 			  enum drm_bridge_attach_flags flags)
 {
-	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	struct fsl_ldb *fsl_ldb = bridge->driver_private;
 
 	return drm_bridge_attach(bridge->encoder, fsl_ldb->panel_bridge,
 				 bridge, flags);
@@ -124,7 +119,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
-	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	struct fsl_ldb *fsl_ldb = bridge->driver_private;
 	struct drm_atomic_state *state = old_bridge_state->base.state;
 	const struct drm_bridge_state *bridge_state;
 	const struct drm_crtc_state *crtc_state;
@@ -226,7 +221,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 				   struct drm_bridge_state *old_bridge_state)
 {
-	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	struct fsl_ldb *fsl_ldb = bridge->driver_private;
 
 	/* Stop channel(s). */
 	if (fsl_ldb->devdata->lvds_en_bit)
@@ -270,7 +265,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_info *info,
 		   const struct drm_display_mode *mode)
 {
-	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	struct fsl_ldb *fsl_ldb = bridge->driver_private;
 
 	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
 		return MODE_CLOCK_HIGH;
@@ -309,6 +304,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	fsl_ldb->dev = &pdev->dev;
 	fsl_ldb->bridge.funcs = &funcs;
 	fsl_ldb->bridge.of_node = dev->of_node;
+	fsl_ldb->bridge.driver_private = fsl_ldb;
 
 	fsl_ldb->clk = devm_clk_get(dev, "ldb");
 	if (IS_ERR(fsl_ldb->clk))
-- 
2.39.5

