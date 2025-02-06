Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54200199254;
	Thu,  6 Feb 2025 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865702; cv=none; b=jomkgH2OjEJvWliuF+GxVhnOvZ0rD7ddWbVo9LOBZumlT+YUaZq7oeInWsAKxhYL5QbIXcbTED08JSoa8rDppoCcx6z2WiPqbCFt8/WqKh4FAQzqk6oUbztz8nJYEwcehleyiPItjWCx7/PpBzj3trti3H/jjw1J30+eB+obU0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865702; c=relaxed/simple;
	bh=slezgUBPNzKRMSemVVNLfCRaDhYjXyiJNBPbRTDaXy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pi/Q3gy8LWArJMv3blkeYvqEdQ01UBh8Ci5WyNSG4WqjZkR0hJhosHiPazFQS/KJWCkirjJ4eEEEA9RcD+4YEIBjAVk/WFIRGX5jK3kHhUg4R9MP/Y5NZH8gQQnS01ibzG01Vf4A0h3Ki5Xw9NcRAegvtYXvn6XQt76oSNs5ALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SdqACOx7; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SdqACOx7"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8304442D4;
	Thu,  6 Feb 2025 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+OPzT2FHHN3WygeM9lYiYLW3k/bXtOwVIdLFAeKE+w=;
	b=SdqACOx7FL/XXpVicJ8aL7ABDDQemT+XfNtaUoVrVg9NnehK6Gs4eq5JzVnTy1fynaprHV
	sQaobwiLKXUSUGfvTEsI6ZmIj3QcZlSrsu5FW9JGaRZEysXuio+iTI7SfrpFNgGet7U6kk
	P3D1w2a7qqTtXiIR4/H0OhZL/B97/S3pjfEjD3lGngoIEsE3iXJU9IkinXBN8Ia10EkMKu
	Gxt261q3EApHc/AV6KpkuGGT+juh+rkD/gQawW+WqoJL8MopwzKJQR4YhqXvykFQzzlicb
	Hd2P5fVREPrsTr+vgsHx5Oev0Ko/6YyVyu3BKH2/zNIt23g7a/svpXgQ1Rod0A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:23 +0100
Subject: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Adding a panel does currently not add a panel_bridge wrapping it. Usually
the panel_bridge creation happens when some other driver (e.g. the previous
bridge or the encoder) calls *_of_get_bridge() and the following element in
the pipeline is a panel.

This has some drawbacks:

 * the panel_bridge is not created in the context of the driver of the
   underlying physical device (the panel driver), but of some other driver
 * that "other driver" is not aware of whether the returned drm_bridge
   pointer is a panel_bridge created on the fly, a pre-existing
   panel_bridge or a non-panel bridge
 * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
   but the "other driver" doesn't know whether this is needed because it
   doesn't know whether it has created a panel_bridge or not

So far this approach has been working because devm and drmm ensure the
panel bridge would be dealloacted at some later point. However with the
upcoming implementation of dynamic bridge lifetime this will get more
complicated.

Correct removal of a panel_bridge might possibly be obtained by adding more
devm/drmm technology to have it freed correctly at all times. However this
would add more complexity and not help making lifetime more understandable.

Use a different approach instead: always create a panel_bridge with a
drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
wrapping it. This makes lifetime much more straightforward to understand
and to further develop on.

With the panel_bridge always created, the functions to get a bridge
[devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
the bridge they are looking for exists already (if it can exist at all). In
turn, this is implemented based on a variant of
drm_of_find_panel_or_bridge() that only looks for panels:
of_drm_find_bridge_by_endpoint(). In the future
drm_of_find_panel_or_bridge() can be progressively removed because there
will never be a panel not exposing a bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
 include/drm/drm_panel.h        |  8 +++++
 2 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 58570ff6952ca313b3def084262c9bb3772272ef..6995de605e7317dd1eb153afd475746ced764712 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -69,6 +69,9 @@ EXPORT_SYMBOL(drm_panel_init);
  */
 void drm_panel_add(struct drm_panel *panel)
 {
+	panel->bridge = drm_panel_bridge_add(panel);
+	WARN_ON(!panel->bridge);
+
 	mutex_lock(&panel_lock);
 	list_add_tail(&panel->list, &panel_list);
 	mutex_unlock(&panel_lock);
@@ -86,6 +89,9 @@ void drm_panel_remove(struct drm_panel *panel)
 	mutex_lock(&panel_lock);
 	list_del_init(&panel->list);
 	mutex_unlock(&panel_lock);
+
+	drm_panel_bridge_remove(panel->bridge);
+	panel->bridge = NULL;
 }
 EXPORT_SYMBOL(drm_panel_remove);
 
@@ -412,6 +418,49 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
 
+/**
+ * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ * @bridge: pointer to hold returned drm_bridge (must not be NULL)
+ *
+ * Given a DT node's port and endpoint number, find the connected node and
+ * return the associated struct drm_bridge.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
+					  int port, int endpoint,
+					  struct drm_bridge **bridge)
+{
+	int ret = -EPROBE_DEFER;
+	struct device_node *remote;
+
+	if (!bridge)
+		return -EINVAL;
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	remote = of_graph_get_remote_node(np, port, endpoint);
+	if (!remote)
+		return -ENODEV;
+
+	*bridge = of_drm_find_bridge(remote);
+	if (*bridge)
+		ret = 0;
+
+	of_node_put(remote);
+	return ret;
+}
+
 /**
  * of_drm_get_panel_orientation - look up the orientation of the panel through
  * the "rotation" binding from a device tree node
@@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 {
 	struct drm_bridge **ptr, *bridge;
 
+	if (panel->bridge) {
+		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
+		return panel->bridge;
+	}
+
 	ptr = devres_alloc(devm_drm_panel_bridge_release, sizeof(*ptr),
 			   GFP_KERNEL);
 	if (!ptr)
@@ -1106,8 +1160,7 @@ EXPORT_SYMBOL(drm_panel_bridge_connector);
  * @endpoint: endpoint in the device tree node
  *
  * Given a DT node's port and endpoint number, finds the connected node
- * and returns the associated bridge if any, or creates and returns a
- * drm panel bridge instance if a panel is connected.
+ * and returns the associated bridge if any.
  *
  * Returns a pointer to the bridge if successful, or an error pointer
  * otherwise.
@@ -1117,17 +1170,12 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 					  u32 port, u32 endpoint)
 {
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	int ret;
 
-	ret = drm_of_find_panel_or_bridge(np, port, endpoint,
-					  &panel, &bridge);
+	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (panel)
-		bridge = devm_drm_panel_bridge_add(dev, panel);
-
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge);
@@ -1140,8 +1188,7 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge);
  * @endpoint: endpoint in the device tree node
  *
  * Given a DT node's port and endpoint number, finds the connected node
- * and returns the associated bridge if any, or creates and returns a
- * drm panel bridge instance if a panel is connected.
+ * and returns the associated bridge if any.
  *
  * Returns a drmm managed pointer to the bridge if successful, or an error
  * pointer otherwise.
@@ -1151,17 +1198,12 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 				      u32 port, u32 endpoint)
 {
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	int ret;
 
-	ret = drm_of_find_panel_or_bridge(np, port, endpoint,
-					  &panel, &bridge);
+	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (panel)
-		bridge = drmm_panel_bridge_add(drm, panel);
-
 	return bridge;
 }
 EXPORT_SYMBOL(drmm_of_get_bridge);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 10015891b056f816c7a992a2052b36fd26943c5b..7ace6c1389c5353c08de5ac46127e46e1de69359 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -196,6 +196,14 @@ struct drm_panel {
 	 */
 	struct device *dev;
 
+	/**
+	 * @bridge:
+	 *
+	 * Pointer to the panel bridge that allows accessing this panel as
+	 * a DRM bridge.
+	 */
+	struct drm_bridge *bridge;
+
 	/**
 	 * @backlight:
 	 *

-- 
2.34.1

