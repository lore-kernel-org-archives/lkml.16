Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91DA1AA795;
	Thu,  6 Feb 2025 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865726; cv=none; b=Yc4/087RY8sqJluoSo5Nr4Y6xYpgfX31AGV3lmLfioRHS4m2iv+v3p2xupqLvJu1GyDv3B+pCBblaoH5KLhz2O4rzt2clXJ8cQmZSi3nXm+x+B3Gf8vLjhdjz8A0Vcmhk0ErAptHHqJ4IyMHD19woXZBaV3MfxyR58ZyqEHu0qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865726; c=relaxed/simple;
	bh=OLwLGPztmoUVU0I8Hp9vUrXHoA31rn/BIBA2qSlO36M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFtJnWdY2OcoFd651g7MvRu3zjfka4s7pPsP1LvOapCF9yZWH7ugWBbG/evxm0twY7SinctocvONi1swvRHX1ziNaUhIOiDovYoLg2OSggRP/OpUaNO+2nAs4VtO6CkeeALUWgpLDU4Cc9W519k14i8an2BJF2AQSJXwLRTYaBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dcwocTIP; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dcwocTIP"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A325442D4;
	Thu,  6 Feb 2025 18:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGZLluwkDCjp1kHB/F87oV4x0FXPfwe2Z3Cbt+cBMY0=;
	b=dcwocTIPbXtLHpayEIyBz/uxIiTZQEiHi4KaM+Mz28d/scIiEZQyjWjQzRu+kIuOEhJn71
	wvsmE0NLkbQdkXP7O8e0ZEyLviqni70ms1O4TQdIRajiqg6SA/yjtWM58Kea4YGeiqUa7R
	owoU7X6AwiXhIk2zLrVLEozHTKUOXKXbpkdJV+NRNmRLvoW2WR36iTU2FAthzcO1z02Gz9
	GXaQs1qoQswQj2h8a7KjfDzv+ZjL/7vGHtqsH47s1/gHCth/jX0+kBLr0n4oG+MV4GOq3E
	LMP7xMdYbBRaJ/loMAzukV/i6J4Gorer6VYYwaDMTvuI70lmfY5xTfPL8+N3TA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:32 +0100
Subject: [PATCH v6 17/26] drm/bridge: add devm_drm_put_bridge() and
 devm_drm_put_and_clear_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-17-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeduheenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Bridges obtained via devm_drm_of_get_bridge() will be put when the
requesting device is removed. However drivers which obtained them may need
to put the obtained reference way before being destroyed, especially in
case of hot-unplug of the bridge they hold a reference to.

Add devm_drm_put_bridge() to manually release a devm-obtained bridge.

Also add a macro to additionally clear the pointer in a safe way.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/drm_bridge.c | 36 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index fca860d582f86b35c9172b27be20060de086e38f..92ce40adfaa59a278a972ac862bebee06970ff83 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1548,6 +1548,42 @@ struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
 
+/**
+ * devm_drm_put_bridge - Release a bridge reference obtained via devm
+ * @dev: device that got the bridge via devm
+ * @bridge: pointer to a struct drm_bridge obtained via devm
+ *
+ * Same as drm_bridge_put() for bridge pointers obtained via devm functions
+ * such as devm_drm_of_get_bridge().
+ *
+ * See also devm_drm_put_and_clear_bridge() which is more handy in many
+ * cases.
+ */
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge)
+{
+	devm_release_action(dev, devm_drm_bridge_put_void, bridge);
+}
+EXPORT_SYMBOL(devm_drm_put_bridge);
+
+/**
+ * devm_drm_put_and_clear_bridge - Given a bridge pointer obained via devm,
+ *                                 clear the pointer then put the bridge
+ *
+ * @dev: device that got the bridge via devm
+ * @bridge_pp: pointer to pointer to a struct drm_bridge obtained via devm
+ *
+ * Same as drm_bridge_put_and_clear() for bridge pointers obtained via devm
+ * functions such as devm_drm_of_get_bridge().
+ */
+void devm_drm_put_and_clear_bridge(struct device *dev, struct drm_bridge **bridge_pp)
+{
+	struct drm_bridge *bridge = *bridge_pp;
+
+	*bridge_pp = NULL;
+	devm_drm_put_bridge(dev, bridge);
+}
+EXPORT_SYMBOL(devm_drm_put_and_clear_bridge);
+
 static void drmm_bridge_put_void(struct drm_device *drm, void *ptr)
 {
 	struct drm_bridge *bridge = ptr;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 43cef0f6ccd36034f64ad2babfebea62db1d9e43..b6b76161a3c6bb2a4df4b3331bc152a560823fd7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1230,6 +1230,8 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node
 					  u32 port, u32 endpoint);
 struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
 						  struct device_node *bridge_node);
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge);
+void devm_drm_put_and_clear_bridge(struct device *dev, struct drm_bridge **bridge_pp);
 struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
 					  u32 port, u32 endpoint);
 #else
@@ -1247,6 +1249,10 @@ static inline struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *d
 	return ERR_PTR(-ENODEV);
 }
 
+static inline void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge) {}
+static inline void devm_drm_put_and_clear_bridge(struct device *dev,
+						 struct drm_bridge **bridge_pp) {}
+
 static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 						     struct device_node *node,
 						     u32 port,

-- 
2.34.1

