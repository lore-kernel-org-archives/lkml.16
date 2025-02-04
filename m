Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF40218E92
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681269; cv=none; b=siiQHaB1Aqz8Y0BWA+ae4v3yYVbPiejXgcuwuONR+xDR8wXjo75tB+duba1uuQWgbYLJPw81849F7H/TW0AXgu4mFhbUmu0lpx3jABbXx2xtMgvTlp5WFpigMkcCw7gK6SRxxOaKwfKgFrJQO6tty5FAIpUIKX1NkvN6HdPq8xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681269; c=relaxed/simple;
	bh=4I1hwBS6V8OQlBRTNWDREh1SgDidQ6XQ0E33CqOsOes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOye8nZ6088VU0qgG4xVixoCSLmgSwtv0hhIkSubhT6eb/U8B+CR7SENb/JzSi0yDYt3OFDkAk9RCMR1LHqZCAmLAVJ9RDVcuPu9JDVbRiJKVrcg/Muh9Cymm8OlRbHnpVvXO0iQ26LT5l5CLsubIML7ETeVc9NzuTrXHwFQo88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KY6Tdb0N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KY6Tdb0N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB55C4CEDF;
	Tue,  4 Feb 2025 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681269;
	bh=4I1hwBS6V8OQlBRTNWDREh1SgDidQ6XQ0E33CqOsOes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KY6Tdb0NGFg+rnbNV8UF0THZkfXjR7cStSRII5PUmBimtVTBBat1udjOFvdwbRXsM
	 /GelRKtm/g+fly5b0T4M68y6jy/+uXTllk/VwWM+/I+EdJJQTnpi2eV5Vy+KYkzz8m
	 +5fAQhFIw40GbuWCWzpj2PoMNJhURKiaE46JTsxAaoYciz0Gyy6xvq/oaGuabCcmAa
	 csy6e3Zo6xjap5l5MdNCDdyjhFnJyGFEUlvJ5u6EDflkKIlXl6j3BfstoLAaoTLGGA
	 BoBX4tCoJdmLdVdweEdB9hIMJRBlcRSuIZZoWWYJF6psVa2X1uN8CeNA1YVnSqSGfI
	 oCujiI0mUwY5w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:58:01 +0100
Subject: [PATCH v2 33/35] drm/bridge: tc358775: Switch to atomic commit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-33-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4061; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4I1hwBS6V8OQlBRTNWDREh1SgDidQ6XQ0E33CqOsOes=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL6vml071bvY8GFv8b8Or336Ce+yLMq2rdokX/TpU
 vHOZb+fdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJTItgrLOOC5xdY3DWvCaG
 vcOXzf/8svuV/KsZM1cum+047XZ4CcOsFK7Hqv8X7+fRTp34d+51YcY6ZeXzywrP/HR6a8oZ4B+
 66CRbrUzc+XnLK3t8Sy4d85vfoXiHvWRn9qEDBk/2zbU+9GQOAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tc358775 driver follows the drm_encoder->crtc pointer that is
deprecated and shouldn't be used by atomic drivers.

This was due to the fact that we did't have any other alternative to
retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
in the bridge state, so we can move to atomic callbacks and drop that
deprecated pointer usage.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 4963b25ff1b0b97d08124fdba8ef5f94c3d7f401..821363ef13729e6d932a8ab29e49f8f9cb0c714f 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -285,11 +285,12 @@ struct tc_data {
 static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
 {
 	return container_of(b, struct tc_data, bridge);
 }
 
-static void tc_bridge_pre_enable(struct drm_bridge *bridge)
+static void tc_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -308,11 +309,12 @@ static void tc_bridge_pre_enable(struct drm_bridge *bridge)
 
 	gpiod_set_value(tc->reset_gpio, 0);
 	usleep_range(10, 20);
 }
 
-static void tc_bridge_post_disable(struct drm_bridge *bridge)
+static void tc_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -367,34 +369,23 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
 	if (ret < 0)
 		dev_err(&i2c->dev, "Error %d writing to subaddress 0x%x\n",
 			ret, addr);
 }
 
-/* helper function to access bus_formats */
-static struct drm_connector *get_connector(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_connector *connector;
-
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
-		if (connector->encoder == encoder)
-			return connector;
-
-	return NULL;
-}
-
-static void tc_bridge_enable(struct drm_bridge *bridge)
+static void tc_bridge_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2;
 	u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2;
 	u32 val = 0;
 	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
 	struct drm_display_mode *mode;
-	struct drm_connector *connector = get_connector(bridge->encoder);
+	struct drm_bridge_state *bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	struct drm_connector *connector = bridge_state->connector;
 
-	mode = &bridge->encoder->crtc->state->adjusted_mode;
+	mode = &bridge_state->crtc->state->adjusted_mode;
 
 	hback_porch = mode->htotal - mode->hsync_end;
 	hsync_len  = mode->hsync_end - mode->hsync_start;
 	vback_porch = mode->vtotal - mode->vsync_end;
 	vsync_len  = mode->vsync_end - mode->vsync_start;
@@ -600,14 +591,17 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 				 &tc->bridge, flags);
 }
 
 static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.attach = tc_bridge_attach,
-	.pre_enable = tc_bridge_pre_enable,
-	.enable = tc_bridge_enable,
+	.atomic_pre_enable = tc_bridge_atomic_pre_enable,
+	.atomic_enable = tc_bridge_atomic_enable,
 	.mode_valid = tc_mode_valid,
-	.post_disable = tc_bridge_post_disable,
+	.atomic_post_disable = tc_bridge_atomic_post_disable,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 };
 
 static int tc_attach_host(struct tc_data *tc)
 {
 	struct device *dev = &tc->i2c->dev;

-- 
2.48.0

