Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB01A8403;
	Thu,  6 Feb 2025 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865712; cv=none; b=aucE6wI7mnKWDfmlS0zG0V9zXHzagdunC/BQEJSBOQ6YRRP/vSg3oR4MfRNwCAhJfle9y3Ig2X95NfBuFXPAH36wwq/EY2qIJBRNu7zS/rO+VOQhirdUAMWhd3OxBzQ6dCWhL8/Z7cTV/IsAsCNMPv5MqnGWs8hhBJhNB267Xcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865712; c=relaxed/simple;
	bh=hUK7EUCd5pSJ3phtZiunKrXblXUguWhVr8p9Vm2X8Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIwM+scm1Ekvm+oH1pst3KWqn2nD+r0stYf1GizlQdTr7jaczLNLHjZTPrY2uB56k8YFNWiXvBjbFQfvDYysmzKvse5a/2syyjJQ1bRp2NKqHF5D/UUzX5ZnWQGyvvPHO/8ahQg3RlnzIRDLHI7eaUAXN9xHDkY2edwRfrmdz+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lBoVSeHl; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lBoVSeHl"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C97AF442D7;
	Thu,  6 Feb 2025 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iJmfJohMLskNWh1/d0vxg24JxdxKf1x+OOa7rjoPoQ=;
	b=lBoVSeHlKoZKgObkr/7yH+eB6a28/qBL2c815XIuOrLvGMzwIO27CvahjbLLJROTvzCE5L
	3YotwQGDyNa6viU6GczZ7FATkIvf6fxX4rgB7bhbgZ8cHCmB3uCGKyLRPxFjHQ47iqZG1I
	94jMS/fhat15/+DcEg8+cFPfIR7V8/Pn9qJXL2Ry9LWrsDHyb+kZ1nYyOgWAz468z3mAh7
	IPmWTzzP2wZVS/bJpqm7lgpZRA8eTtMJ5iPH3dfwvphiPTbt7y9pNdG3ZcVnlC3XtwybOh
	UkkZX6nQW/s8PqE2cmf9S9xN42UgSc01janAnUjiCVEiOSz5fxKe92B+Ql/XVg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:27 +0100
Subject: [PATCH v6 12/26] drm/bridge: allow bridges to be informed about
 added and removed bridges
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

In preparation for allowing bridges to be added to and removed from a DRM
card without destroying the whole card, add a new DRM bridge function
called on addition and removal of bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v6:
 - rebased fixing conflicts

Changed in v5:
 - fixed kerneldoc errors

This patch was added in v4.
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++++++++
 include/drm/drm_bridge.h     | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index b0834b8644284e5f7751cec81724af849b4180e7..1955a231378050abf1071d74a145831b425c47c5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -207,12 +207,18 @@ LIST_HEAD(bridge_list);
  */
 void drm_bridge_add(struct drm_bridge *bridge)
 {
+	struct drm_bridge *br, *tmp;
+
 	mutex_init(&bridge->hpd_mutex);
 
 	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
 		bridge->ycbcr_420_allowed = !!(bridge->supported_formats &
 					       BIT(HDMI_COLORSPACE_YUV420));
 
+	list_for_each_entry_safe(br, tmp, &bridge_list, list)
+		if (br->funcs->bridge_event_notify)
+			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_ADD, bridge);
+
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
@@ -249,10 +255,16 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
+	struct drm_bridge *br, *tmp;
+
 	mutex_lock(&bridge_lock);
 	list_del_init(&bridge->list);
 	mutex_unlock(&bridge_lock);
 
+	list_for_each_entry_safe(br, tmp, &bridge_list, list)
+		if (br->funcs->bridge_event_notify)
+			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
+
 	mutex_destroy(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1561347c4991dac6022319774510f9560c9283c3..ad7ba444a13e5ecf16f996de3742e4ac67dc21f1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -56,6 +56,11 @@ enum drm_bridge_attach_flags {
 	DRM_BRIDGE_ATTACH_NO_CONNECTOR = BIT(0),
 };
 
+enum drm_bridge_event_type {
+	DRM_EVENT_BRIDGE_ADD,
+	DRM_EVENT_BRIDGE_REMOVE,
+};
+
 /**
  * struct drm_bridge_funcs - drm_bridge control functions
  */
@@ -729,6 +734,24 @@ struct drm_bridge_funcs {
 				      struct drm_bridge *bridge,
 				      bool enable, int direction);
 
+	/**
+	 * @bridge_event_notify:
+	 *
+	 * Notify that another bridge is being added or removed.
+	 *
+	 * This callback is optional. Bridges implementing it must always
+	 * check whether the event refers to a bridge they actually need to
+	 * interact with.
+	 *
+	 * @bridge: bridge being notified
+	 * @event: event happened (add/remove bridge)
+	 * @event_bridge: the bridge mentioned by the event (i.e. the
+	 * bridge being added or removed)
+	 */
+	void (*bridge_event_notify)(struct drm_bridge *bridge,
+				    enum drm_bridge_event_type event,
+				    struct drm_bridge *event_bridge);
+
 	/**
 	 * @debugfs_init:
 	 *

-- 
2.34.1

