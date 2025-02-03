Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDB420ADDF;
	Mon,  3 Feb 2025 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599379; cv=none; b=PLz78V9Wz6hX0rDbFrO4N7p4EP31SdufuqOeSMukhPjzd2MIeQqTg+v/azQ/F4/Tk/oJu8+DdGZMpTXSHhfyw1RAIw47AW/mmapFGnyGVCExhJRJsL7Adn7k/pYamMlTfyG2XsjAQtwrvrv/US8T2PnnNAjqQ4DaJuPiZLV63XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599379; c=relaxed/simple;
	bh=asBk/Nh4HCaOWSrCJ+WvYDyEM2K5ZU9+gGTYfkKmS5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urRxinP1hjffDfLxpI7rZ132P0GqurEm77czUQrSaPFRzm4XQRutGF69kO26Cc9ibZ204UL2PgRSTArYWHsmguQst17deyQQIuv80dB9d9QvEn03FZ+I8fu4hBdP4Pq8jFsurN1bvN0sO7uQp/VhduVVLy7/OAgyL4YrF7880+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PLv8ugY1; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PLv8ugY1"
Received: by mail.gandi.net (Postfix) with ESMTPA id F2E9844292;
	Mon,  3 Feb 2025 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738599374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LmwX/1Q1RNDl1aoU1BI0wydrMi9PXMOL1skPCsvzrM8=;
	b=PLv8ugY1SVyiSl27A/DJL1gzKKC6xFXa4dP9xqGetlX9i3OAPMPHWYViMLQnDt6KYC+FRc
	/lq2aE+3bmD3D6b6ojWXS/gHx4N99Sxks7CBHASB/JYP0nZmOO7ipL+lqZ8+tfb9svban8
	mxuBE0TcenRS3Bbm9snNwB9emekj6eER+blOAG1D/mT8ggC+fFwwWyV1GiQyNVKcMJa3Rc
	d3rjeBoKa0F1DAz/pvjOeL3W/Px7xpl0Ep6GBOeWUdHbybWPErTiChS8Lgkvk5QWQqNN8m
	WBgpKsV8SbJbXWkSlEj04yRGKVoWdra1VV2xHiqfbRSZ0ELmjFYVptns29jPLA==
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v5 2/4] drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()
Date: Mon,  3 Feb 2025 17:16:04 +0100
Message-ID: <20250203161607.223731-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250203161607.223731-1-herve.codina@bootlin.com>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtr
 dhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

drm_atomic_helper_reset_crtc() allows to reset the CRTC active outputs.

This resets all active components available between the CRTC and
connectors.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
 include/drm/drm_atomic_helper.h     |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a50..0a636c398578 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3362,6 +3362,47 @@ int drm_atomic_helper_disable_all(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_disable_all);
 
+/**
+ * drm_atomic_helper_reset_crtc - reset the active outputs of a CRTC
+ * @crtc: DRM CRTC
+ * @ctx: lock acquisition context
+ *
+ * Reset the active outputs by indicating that connectors have changed.
+ * This implies a reset of all active components available between the CRTC and
+ * connectors.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_atomic_helper_reset_crtc(struct drm_crtc *crtc,
+				 struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	state = drm_atomic_state_alloc(crtc->dev);
+	if (!state)
+		return -ENOMEM;
+
+	state->acquire_ctx = ctx;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
+		goto out;
+	}
+
+	crtc_state->connectors_changed = true;
+
+	ret = drm_atomic_commit(state);
+out:
+	drm_atomic_state_put(state);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_reset_crtc);
+
 /**
  * drm_atomic_helper_shutdown - shutdown all CRTC
  * @dev: DRM device
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 9aa0a05aa072..53382fe93537 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -139,6 +139,8 @@ int drm_atomic_helper_set_config(struct drm_mode_set *set,
 
 int drm_atomic_helper_disable_all(struct drm_device *dev,
 				  struct drm_modeset_acquire_ctx *ctx);
+int drm_atomic_helper_reset_crtc(struct drm_crtc *crtc,
+				 struct drm_modeset_acquire_ctx *ctx);
 void drm_atomic_helper_shutdown(struct drm_device *dev);
 struct drm_atomic_state *
 drm_atomic_helper_duplicate_state(struct drm_device *dev,
-- 
2.47.1

