Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B4F1A3A80;
	Thu,  6 Feb 2025 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865707; cv=none; b=LRzp5eDnTnbwVk/b0Nh2OJ1pQfTNYpHvX5CCyw/nvzO9/Tu1BWdrZTARUCKHpHzt7IvQaRgwx6AhKrBwqUSrCj020/6FxJdZNV6Qz1Rz/+beV17g/SsSZzvS/mvfPn0RyjkSuZpRK8uhYaSAdxiyVivvwM8CAkBeA6NncCCRgPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865707; c=relaxed/simple;
	bh=UFeo3zXfTZtQafX6OvGxyFrg+kuwL7Dng3fJ9+9LXS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ov0QFSVgfTVgvSVVrMUxzkzUiVg4OILeDKT3EoQ8GywQSONf2JDh1UdpXVePviuu7OpFh8hyimC8dyNONNSdVfiYldN2K2b17Ak+7Q+Y5/WQDH0xFonIbZmgmfHHxvYgQf6ok3Jx/Libor2eJmvjflPWwf4GyHN6+PGpxpcSFn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VZfRnZJN; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VZfRnZJN"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A883743297;
	Thu,  6 Feb 2025 18:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3BUqEtfCEh3q+AMxh9LslActlP7bwrUqRLfwXX1jD/I=;
	b=VZfRnZJNdlAHyGR7Y5JUB+4Zs1FeePP7fAQWkoeWfCu2x/H34TMAIfz0AMwTC9ykMNM7mR
	9kMl0ajWjarJu7PMb1NamwCsLBAlIOouA5yd39/YtPfgRuzWmR7XtD31N+TsazT3qrjGZy
	qMjwBWMd/uiKO0Wh91+kHdpMy+1alr4FDE8RaL+UXBrbNygoFfZaOv9+IX+tw5B30mFcB6
	ehGRkPZM960fD3+h2eKCGmtZs25jLDLj/DAu1Kw5/jbF4RwDLzK0m+Tivuu2zYk9112bXC
	2Eil9YKnOK1v4GxWgRr/AA40F3GH2G6f3kJVmvWBY/uC1LAcoYkqlQE0hhDYWw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:25 +0100
Subject: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
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

devm_drm_of_get_bridge(), which is based on graph links, is the recommended
function to get a pointer to the following bridge.

This is valid even for panels, for which the recommended device tree
description is via graph links and not (or not only) panel subnodes of a
panel controller (e.g. "dsi@1234" controller node with a "panel@0"
subnode).

However there are drivers supporting the panel subnode description in
addition to the graph links. For those drivers add a _by_node variant that
takes the node of the target node.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  8 ++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 2aa17fbe538b86066c4e68f0d0e8046e9ca9b965..b0834b8644284e5f7751cec81724af849b4180e7 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1407,6 +1407,36 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge);
 
+/**
+ * devm_drm_of_get_bridge_by_node - Return bridge for a given OF node
+ * @dev: device to tie the bridge lifetime to
+ * @bridge_node: device node of the remote bridge
+ *
+ * Given a bridge DT node, returns the associated bridge if any. This
+ * should be used in addition to devm_drm_of_get_bridge() when the regular
+ * graph link search is not enough, e.g. for drivers that need to support
+ * panels described only as subnodes.
+ *
+ * RETURNS:
+ * A pointer to the bridge if successful, or an error pointer otherwise.
+ */
+struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
+						  struct device_node *bridge_node)
+{
+	struct drm_bridge *bridge;
+	int ret;
+
+	if (!bridge_node)
+		return ERR_PTR(-EINVAL);
+
+	bridge = of_drm_find_bridge(bridge_node);
+	if (!bridge)
+		return ERR_PTR(-ENODEV);
+
+	return bridge;
+}
+EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
+
 /**
  * drmm_of_get_bridge - Return next bridge in the chain
  * @drm: device to tie the bridge lifetime to
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..1561347c4991dac6022319774510f9560c9283c3 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1088,6 +1088,8 @@ static inline int drm_panel_bridge_set_orientation(struct drm_connector *connect
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
 struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
 					  u32 port, u32 endpoint);
+struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
+						  struct device_node *bridge_node);
 struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
 					  u32 port, u32 endpoint);
 #else
@@ -1099,6 +1101,12 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
+								struct device_node *bridge_node)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 						     struct device_node *node,
 						     u32 port,

-- 
2.34.1

