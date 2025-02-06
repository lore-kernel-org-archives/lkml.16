Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D91A2554;
	Thu,  6 Feb 2025 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865705; cv=none; b=Ed0ErztYSNkmCLhF3tmDQnEGlQ1ejvw7bN+PWMZfc9/dvzpJJ2jSVvuccmXBUqOh8g9YiTH/X8HHdo5ofvHoCYLukME4rQDCUrset9MxgC8MpmfLdcTQ0eeb/B1rBPJj4oUi9pxH2gqIjIcN7qC+2Li7NFyWPu6xWQ3/9wwGCQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865705; c=relaxed/simple;
	bh=OM1tUJPZL7A6meTByNP/oqTW+tr3n7XZLvBwIczKgQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K95/cvIKHbTroVj6UWYrlOG9F57ab61uaHes9VYFe8L6xF2X9AhdDKOQIBYPsAECIWYbsI9Io/h4a1/9JH/YAUWnkYzIEEizZCzS/A2zMATp0jjr2zNjQzoBWgZenQgozspVFM9dyIc2fiQktoN3aKbw1EDkcUIUyvIxatG8Fis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=edUmkGGM; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="edUmkGGM"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D90DC442D7;
	Thu,  6 Feb 2025 18:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfEAnvIODb0MmG3S/Br6HR0LaSDyjKlXquR7BwTnfnk=;
	b=edUmkGGMvGYPJ7a/FimUusEEcNKQwLB8Qxmr9qnFbT6OUb1ynvPdZyYQrkPyK4sajWFfER
	1YrNGUg1lovimdcjL+4LRQOVjhFYLrAVrpy8813GsnzjanRabbWQzXScs1P8nqfVQuez6R
	vwT9S9N+9/+OGQUu2am8pLam6z+eVoq1dc44PBACppAYeSTet9FRJY804CVOeJ6B/6GiYp
	3lha6aXmJvtc7u7j9jbBTJlYu3xTfgRUZqA0l0DOKgIIwe4XMr2RFH2UdyZN41tB5fUQf5
	T3OVPdx/TZ6lRbcNF1iLGPstcX2+dpOcCGQQtOyUtTw4trgRDqWujH+gmZnDkA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:24 +0100
Subject: [PATCH v6 09/26] drm/bridge: move devm_drm_of_get_bridge and
 drmm_of_get_bridge to drm_bridge.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

devm_drm_of_get_bridge() and drmm_of_get_bridge() do not have anything to
do with struct drm_panel anymore, they just manage bridges. So move them
from bridge/panel.c to drm_bridge.c.

Move also of_drm_find_bridge_by_endpoint() which is used only by
devm_drm_of_get_bridge() and drmm_of_get_bridge().

No code changes, only move functions to a different file within the same
module and add an #include as needed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/bridge/panel.c | 102 -----------------------------------------
 drivers/gpu/drm/drm_bridge.c   | 100 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6995de605e7317dd1eb153afd475746ced764712..1230ae50b2020e7a9306cac83009dd600dd61d26 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -418,49 +418,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
 
-/**
- * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
- * @np: device tree node containing encoder output ports
- * @port: port in the device tree node
- * @endpoint: endpoint in the device tree node
- * @bridge: pointer to hold returned drm_bridge (must not be NULL)
- *
- * Given a DT node's port and endpoint number, find the connected node and
- * return the associated struct drm_bridge.
- *
- * Returns zero if successful, or one of the standard error codes if it fails.
- */
-static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
-					  int port, int endpoint,
-					  struct drm_bridge **bridge)
-{
-	int ret = -EPROBE_DEFER;
-	struct device_node *remote;
-
-	if (!bridge)
-		return -EINVAL;
-
-	/*
-	 * of_graph_get_remote_node() produces a noisy error message if port
-	 * node isn't found and the absence of the port is a legit case here,
-	 * so at first we silently check whether graph presents in the
-	 * device-tree node.
-	 */
-	if (!of_graph_is_present(np))
-		return -ENODEV;
-
-	remote = of_graph_get_remote_node(np, port, endpoint);
-	if (!remote)
-		return -ENODEV;
-
-	*bridge = of_drm_find_bridge(remote);
-	if (*bridge)
-		ret = 0;
-
-	of_node_put(remote);
-	return ret;
-}
-
 /**
  * of_drm_get_panel_orientation - look up the orientation of the panel through
  * the "rotation" binding from a device tree node
@@ -1150,62 +1107,3 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
 	return &panel_bridge->connector;
 }
 EXPORT_SYMBOL(drm_panel_bridge_connector);
-
-#ifdef CONFIG_OF
-/**
- * devm_drm_of_get_bridge - Return next bridge in the chain
- * @dev: device to tie the bridge lifetime to
- * @np: device tree node containing encoder output ports
- * @port: port in the device tree node
- * @endpoint: endpoint in the device tree node
- *
- * Given a DT node's port and endpoint number, finds the connected node
- * and returns the associated bridge if any.
- *
- * Returns a pointer to the bridge if successful, or an error pointer
- * otherwise.
- */
-struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
-					  struct device_node *np,
-					  u32 port, u32 endpoint)
-{
-	struct drm_bridge *bridge;
-	int ret;
-
-	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return bridge;
-}
-EXPORT_SYMBOL(devm_drm_of_get_bridge);
-
-/**
- * drmm_of_get_bridge - Return next bridge in the chain
- * @drm: device to tie the bridge lifetime to
- * @np: device tree node containing encoder output ports
- * @port: port in the device tree node
- * @endpoint: endpoint in the device tree node
- *
- * Given a DT node's port and endpoint number, finds the connected node
- * and returns the associated bridge if any.
- *
- * Returns a drmm managed pointer to the bridge if successful, or an error
- * pointer otherwise.
- */
-struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
-				      struct device_node *np,
-				      u32 port, u32 endpoint)
-{
-	struct drm_bridge *bridge;
-	int ret;
-
-	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return bridge;
-}
-EXPORT_SYMBOL(drmm_of_get_bridge);
-
-#endif
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 87cebec2de806781cee22da54d666eee9bde3648..2aa17fbe538b86066c4e68f0d0e8046e9ca9b965 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -25,6 +25,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
@@ -1334,6 +1335,105 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
+
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
+/**
+ * devm_drm_of_get_bridge - Return next bridge in the chain
+ * @dev: device to tie the bridge lifetime to
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ *
+ * Given a DT node's port and endpoint number, finds the connected node
+ * and returns the associated bridge if any.
+ *
+ * Returns a pointer to the bridge if successful, or an error pointer
+ * otherwise.
+ */
+struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
+					  struct device_node *np,
+					  u32 port, u32 endpoint)
+{
+	struct drm_bridge *bridge;
+	int ret;
+
+	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return bridge;
+}
+EXPORT_SYMBOL(devm_drm_of_get_bridge);
+
+/**
+ * drmm_of_get_bridge - Return next bridge in the chain
+ * @drm: device to tie the bridge lifetime to
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ *
+ * Given a DT node's port and endpoint number, finds the connected node
+ * and returns the associated bridge if any.
+ *
+ * Returns a drmm managed pointer to the bridge if successful, or an error
+ * pointer otherwise.
+ */
+struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
+				      struct device_node *np,
+				      u32 port, u32 endpoint)
+{
+	struct drm_bridge *bridge;
+	int ret;
+
+	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return bridge;
+}
+EXPORT_SYMBOL(drmm_of_get_bridge);
 #endif
 
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");

-- 
2.34.1

