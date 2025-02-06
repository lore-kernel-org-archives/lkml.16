Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926E71A072A;
	Thu,  6 Feb 2025 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865693; cv=none; b=kII1E1+EaDcITcLz6vhKESNdCwvET6VLqGBBr8AQvkr4dgooLsuX4zsVxMO3CxU9MddKmQgqiMKOMss9ToGrlb64Nu7TJ0Yl+PxU5JKDVTXZaHXdFj6YnARkEtmcakPawru9JxCkkCzzMcyy6itWGAFS8pLYU0abkwdKR1PRugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865693; c=relaxed/simple;
	bh=pSLJZkiL8tYJHw1SONKZ/yzYYmI7DSbkBpuCA53TGcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=um51QzO60iHqlC9/2P0bSdtOTXUc5S95YM0FTVMaI/89Q5Szi4rrm1c1BbE2UhcNQl2PfRdzc45TTBLcInu+BM1cV48/6+VSUkaqTP1bCYGxzLMAbJ7aOCNbAZHqi3so8w/LDot93CFLFDAlI4+E/ZcaRpo4gJ9GX18Z7gTl2fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KexksfEm; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KexksfEm"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C8CF44264;
	Thu,  6 Feb 2025 18:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yP620PYatjyFXh/aDySr+BDD8kR1Bb16xt407+qxPo4=;
	b=KexksfEmeiTlO2+62+R7roIyq7DiZ7ru87zBYA62jX6Zn9XbWYDS6ieujw1g1oyjev8huh
	ebXQY+XaBl1UQGziOaE/A/R0zIDExVj1DW3A4Km5EKBDlY54FEhWApjrytd4zRDHwTYJIR
	YD121I2CHo0LNrV3xaQ0Y5TfZiMZagwsW4b12gcRlBVr/YTUm/hkWYVSjl/uDzej+pPYVp
	XeJw2zVLCkmNSnsOn+gRryNmBBBwte5aQY7F6sER4PdduowkUJs2S7LNgqDKVlCjhO6fDU
	9Dwu68kgLVemO2oY7YpnXJj/q4c0bCQ4XF45/y+vDfaGSYwwntUf22nhTwMRKQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:20 +0100
Subject: [PATCH v6 05/26] drm/debugfs: add top-level 'bridges' file showing
 all added bridges
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-5-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

The global bridges_list holding all the bridges between drm_bridge_add()
and drm_bridge_remove() cannot be inspected via debugfs. Add a file showing
it.

To avoid code duplication, move the code printing a bridge info to a common
function.

Note: this change requires exporting bridge_list and the mutex protecting
it.

Also add a comment about bridge_lock to make checkpatch happy.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/drm_bridge.c   |  5 +--
 drivers/gpu/drm/drm_debugfs.c  | 70 +++++++++++++++++++++++++++++-------------
 drivers/gpu/drm/drm_drv.c      |  1 +
 drivers/gpu/drm/drm_internal.h |  9 ++++++
 4 files changed, 61 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 241a384ebce39b4a3db58c208af27960904fc662..87cebec2de806781cee22da54d666eee9bde3648 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -195,8 +195,9 @@
  * driver.
  */
 
-static DEFINE_MUTEX(bridge_lock);
-static LIST_HEAD(bridge_list);
+/* Protect bridge_list */
+DEFINE_MUTEX(bridge_lock);
+LIST_HEAD(bridge_list);
 
 /**
  * drm_bridge_add - add the given bridge to the global bridge list
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b2178864c7ee12db9aa1f562e106b2f604439f8..7424d5237e7615d63de6bba572ee6050da6709d0 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -740,6 +740,30 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	crtc->debugfs_entry = NULL;
 }
 
+static void bridge_print(struct drm_printer *p, struct drm_bridge *bridge, unsigned int idx)
+{
+	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
+	drm_printf(p, "\ttype: [%d] %s\n",
+		   bridge->type,
+		   drm_get_connector_type_name(bridge->type));
+
+	if (bridge->of_node)
+		drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
+
+	drm_printf(p, "\tops: [0x%x]", bridge->ops);
+	if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+		drm_puts(p, " detect");
+	if (bridge->ops & DRM_BRIDGE_OP_EDID)
+		drm_puts(p, " edid");
+	if (bridge->ops & DRM_BRIDGE_OP_HPD)
+		drm_puts(p, " hpd");
+	if (bridge->ops & DRM_BRIDGE_OP_MODES)
+		drm_puts(p, " modes");
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
+		drm_puts(p, " hdmi");
+	drm_puts(p, "\n");
+}
+
 static int bridges_show(struct seq_file *m, void *data)
 {
 	struct drm_encoder *encoder = m->private;
@@ -747,28 +771,8 @@ static int bridges_show(struct seq_file *m, void *data)
 	struct drm_bridge *bridge;
 	unsigned int idx = 0;
 
-	drm_for_each_bridge_in_chain(encoder, bridge) {
-		drm_printf(&p, "bridge[%u]: %ps\n", idx++, bridge->funcs);
-		drm_printf(&p, "\ttype: [%d] %s\n",
-			   bridge->type,
-			   drm_get_connector_type_name(bridge->type));
-
-		if (bridge->of_node)
-			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
-
-		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
-		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
-			drm_puts(&p, " detect");
-		if (bridge->ops & DRM_BRIDGE_OP_EDID)
-			drm_puts(&p, " edid");
-		if (bridge->ops & DRM_BRIDGE_OP_HPD)
-			drm_puts(&p, " hpd");
-		if (bridge->ops & DRM_BRIDGE_OP_MODES)
-			drm_puts(&p, " modes");
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
-			drm_puts(&p, " hdmi");
-		drm_puts(&p, "\n");
-	}
+	drm_for_each_bridge_in_chain(encoder, bridge)
+		bridge_print(&p, bridge, idx++);
 
 	return 0;
 }
@@ -802,3 +806,25 @@ void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
 	debugfs_remove_recursive(encoder->debugfs_entry);
 	encoder->debugfs_entry = NULL;
 }
+
+static int allbridges_show(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_bridge *bridge;
+	unsigned int idx = 0;
+
+	mutex_lock(&bridge_lock);
+
+	list_for_each_entry(bridge, &bridge_list, list)
+		bridge_print(&p, bridge, idx++);
+
+	mutex_unlock(&bridge_lock);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(allbridges);
+
+void drm_debugfs_global_add(struct dentry *root)
+{
+	debugfs_create_file("bridges", 0444, root, NULL, &allbridges_fops);
+}
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3cf440eee8a2ab3de134d925db8f1d2ce68062b7..9b6d7bd16ba409b6a9155a9fecbec6bfdd5ea0c2 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1120,6 +1120,7 @@ static int __init drm_core_init(void)
 	}
 
 	drm_debugfs_root = debugfs_create_dir("dri", NULL);
+	drm_debugfs_global_add(drm_debugfs_root);
 
 	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..b6e875d4b25faae6bb0bb952c3c12bd4819698ec 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -48,6 +48,10 @@ struct drm_prime_file_private;
 struct drm_printer;
 struct drm_vblank_crtc;
 
+// for drm_debugfs.c
+extern struct mutex bridge_lock;
+extern struct list_head bridge_list;
+
 /* drm_client_event.c */
 #if defined(CONFIG_DRM_CLIENT)
 void drm_client_debugfs_init(struct drm_device *dev);
@@ -196,6 +200,7 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
 void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
 void drm_debugfs_encoder_add(struct drm_encoder *encoder);
 void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
+void drm_debugfs_global_add(struct dentry *drm_debugfs_root);
 #else
 static inline void drm_debugfs_dev_fini(struct drm_device *dev)
 {
@@ -241,6 +246,10 @@ static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
 {
 }
 
+static inline void drm_debugfs_global_add(struct dentry *drm_debugfs_root)
+{
+}
+
 #endif
 
 drm_ioctl_t drm_version;

-- 
2.34.1

