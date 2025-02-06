Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07E41ACECB;
	Thu,  6 Feb 2025 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865723; cv=none; b=i+/lS7VeeKxL+fJaw2mzik7RRffISeACaRnJgFeLMhwTOwaStRhRlPkI8f8q5kUqSo/qkySFIhQVx7E/YuE9lxLw7pVZtoady83whNZsdO01xw3eXvLxwH1cBrpDKYeFfJ2Wn99sRDRiVIvvtcg9IQhhCW/t+CM24jW+nSJPMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865723; c=relaxed/simple;
	bh=4GEUpfHjpFcdrkqNc6rL0I3RTugewS6+gNfaaQmQFkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogQ5h2XEXNJB59lkdRd7MyBcIgpLYPqEpR8nHqWY+lQ6uEgi1eJ0STqStqkPt8OPkD83UzcdeVOHi2WlL8RKF4g5oXlYfNprRGFLmEpEBjk4XQnwzYRz4QKLjJLQdWBvzfWKVz5J2XJHCynumoeDI2nRzM8W5pC3UY2q5UETqUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ci/80IxI; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ci/80IxI"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1C3E442BE;
	Thu,  6 Feb 2025 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Zj5Q6s/d5EIW0olggTNshWUfmVTZl2kWagfZZCInD8=;
	b=Ci/80IxI6xaxgZEI9U0V+ciUsKC54BM2vX/S4qsWvnckQ4TMQHgkiSjYgp/rLGNy19FQSv
	wXoKmbKfXzoK7M3NR3ijymyhxQfTh/aiCouM9zvmW5Imry/VQsRll6DM/g86V/dSf9eAG7
	6kzZpU78pcQLEcLSU81zYB2/R4vJZU9x4hJ8a5wkbQ84KYWckv/berR7Q+0DWtYHrEGnD+
	h5X9DLbk9xzKZsnooaz2o1JV5Yy/HnPD0rlb75mfRWDlmURJCBX8oJNJYwfV2pi6DQPnDn
	BdYjk5uLv0Jnpr39h0XL12xe6P5ZkVOD79kOGCVwlOOowPupSEzhWEDopmFp8w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:31 +0100
Subject: [PATCH v6 16/26] drm/bridge: increment refcount in
 of_drm_find_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-16-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpedufeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

of_drm_find_bridge() returns a pointer to a bridge, so it has to get a
reference and the caller will be in charge of putting it.

Callers of of_drm_find_bridge() are:

 1. drm_of_panel_bridge_remove()
 2. of_drm_find_bridge_by_endpoint()
 3. drm_of_find_panel_or_bridge()
 4. various DRM drivers

Add the corresponding drm_bridge_put() call for 1 and propagate
documentation to 2 and 3.

Other callers (4) are to be adapted in following commits.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/bridge/panel.c | 3 +++
 drivers/gpu/drm/drm_bridge.c   | 7 +++++++
 include/drm/drm_of.h           | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 1230ae50b2020e7a9306cac83009dd600dd61d26..3c0e22e61c1092de1571d800ac440aad7b5c86bc 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -363,6 +363,9 @@ EXPORT_SYMBOL(of_drm_find_panel);
  * return either the associated struct drm_panel or drm_bridge device. Either
  * @panel or @bridge must not be NULL.
  *
+ * If a bridge is returned in @bridge, the bridge refcount is
+ * incremented. Use drm_bridge_put() when done with the bridge.
+ *
  * This function is deprecated and should not be used in new drivers. Use
  * devm_drm_of_get_bridge() instead.
  *
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 497ec06dfcb05ab5dee8ea5e8f1eafb9c2807612..fca860d582f86b35c9172b27be20060de086e38f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1396,6 +1396,9 @@ EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
  *
  * @np: device node
  *
+ * On return the bridge refcount is incremented (if the bridge is
+ * refcounted). Use drm_bridge_put() when done with the bridge.
+ *
  * RETURNS:
  * drm_bridge control struct on success, NULL on failure
  */
@@ -1407,6 +1410,7 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 
 	list_for_each_entry(bridge, &bridge_list, list) {
 		if (bridge->of_node == np) {
+			drm_bridge_get(bridge);
 			mutex_unlock(&bridge_lock);
 			return bridge;
 		}
@@ -1427,6 +1431,9 @@ EXPORT_SYMBOL(of_drm_find_bridge);
  * Given a DT node's port and endpoint number, find the connected node and
  * return the associated struct drm_bridge.
  *
+ * On success the returned @bridge refcount is incremented. Use
+ * drm_bridge_put() when done with the bridge.
+ *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */
 static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 7f0256dae3f13de1d4109e9265d66684ef2a08ee..948672c27d2eb3034b2519e0bba0fcb52d5c697b 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -172,6 +172,7 @@ static inline int drm_of_panel_bridge_remove(const struct device_node *np,
 
 	bridge = of_drm_find_bridge(remote);
 	drm_panel_bridge_remove(bridge);
+	drm_bridge_put(bridge);
 
 	return 0;
 #else

-- 
2.34.1

