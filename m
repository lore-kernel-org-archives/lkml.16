Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE0920ADE0;
	Mon,  3 Feb 2025 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599379; cv=none; b=N3/5VOtJgmzpxsp2aUMYOPZH6j8I5TPXqnwrRLwwZKZ232yqb9BrY6TNxB4xHdxK2kxORXC5e0u9YUBgfE1j1pIIv4kuEaWyfmHkT3qlJoBk3Mq/vDIznG5FFjdpdn8O2fxMnO9vOSIKpppYc1hPy4CQA6IwScy7uP5sS8Xovpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599379; c=relaxed/simple;
	bh=A7M4MlyTG/pbgcXyCURDsgs5urbNERBl8GYhfGvdTt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXERZqg6RWV8ZbgteCRqoWIKgIsIV9eWA/W8Ok7v/C3zCW7lxge69kREXI0t7TyyghDUZr660H3opW3sKOcDaVq0pTGlMLRGf9LFBDJukiZmovt7WzQ246oYwACaefvkjtU99gzasnp3NRexOj94D4hDGaNBEHJI+KArSZOHQjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X76xY31H; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X76xY31H"
Received: by mail.gandi.net (Postfix) with ESMTPA id 41EAF4429F;
	Mon,  3 Feb 2025 16:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738599375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bhfccr6+eFBXNyn1O43G354wuCTcGUlppHJnEDmkHso=;
	b=X76xY31HHggBEHzovzDJiK12vDwckSBR8MBE1FFIu35jObRDip5Tpjv7nnA64syqjyTvS7
	7SqUI6I8bHde0kqrmUcbz4sC5j5aZ/b5hQa0pkAcUZhm9jCz2wID8NOzaO7OOLfwSDZ1LH
	pHjvojUSGOgEQEalHVEygmqxxNu+gH5pDRqbuZTN88IN440xi+ESGn18nuA+Y6m6tSDM+g
	CFeX4qhLCZVEc4oVFa1r0pqe/8hNzfFQ22wvxy8xIqjqbjRqF4mxGCVJXUVbkmEbyCLXEH
	3Ep2XHKZ5IN2Z2se2ZjcfKrHcgE1g1DpwzhID8bcy6vIXJ9Ss3WgFxSA2bvLRQ==
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
Subject: [PATCH v5 3/4] drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
Date: Mon,  3 Feb 2025 17:16:05 +0100
Message-ID: <20250203161607.223731-4-herve.codina@bootlin.com>
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

The current code uses a the reset_pipe() local function to reset the
CRTC outputs.

drm_atomic_helper_reset_crtc() has been introduced recently and it
performs exact same operations.

In order to avoid code duplication, use the new helper instead of the
local function.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 30 +-----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 47d9ada98430..e878eddc9c3f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -270,34 +270,6 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
-static int reset_pipe(struct drm_crtc *crtc,
-			struct drm_modeset_acquire_ctx *ctx)
-{
-	struct drm_atomic_state *state;
-	struct drm_crtc_state *crtc_state;
-	int ret;
-
-	state = drm_atomic_state_alloc(crtc->dev);
-	if (!state)
-		return -ENOMEM;
-
-	state->acquire_ctx = ctx;
-
-	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	if (IS_ERR(crtc_state)) {
-		ret = PTR_ERR(crtc_state);
-		goto out;
-	}
-
-	crtc_state->connectors_changed = true;
-
-	ret = drm_atomic_commit(state);
-out:
-	drm_atomic_state_put(state);
-
-	return ret;
-}
-
 static int vc4_hdmi_reset_link(struct drm_connector *connector,
 			       struct drm_modeset_acquire_ctx *ctx)
 {
@@ -376,7 +348,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 	 * would be perfectly happy if were to just reconfigure
 	 * the SCDC settings on the fly.
 	 */
-	return reset_pipe(crtc, ctx);
+	return drm_atomic_helper_reset_crtc(crtc, ctx);
 }
 
 static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
-- 
2.47.1

