Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102AB1E47B3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199307; cv=none; b=MGAbsSzGYpnDkUYi5/CpDUAnK139IM3mgTKGuS0qxRh65AKugIqomv3yTCWbHYQJTt5JZ3RuGVgZP+xLqG5UEQuBO0Gti9EOx/A8MojqHeuiyXlVwW19GBUsyLtCoI7EefD65HIDWk/iKWo+fy71xL6NC+fTav3ob90uhBTESSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199307; c=relaxed/simple;
	bh=mOBS5OeyBSAgQy+Rydxb+9br4n93vw3TEe0ztrHLFfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tSAQcPbYzwj5aS99udoAnvCZUCNwUAUo/VcJvI+EY7MlunJfYdjgsVSSl5WwPpF/Rcvl9yjR1+w93CUwei+U2561EwWhzekAYLAeiUCtIEdSJMnVesMlGOFaCytMrBfPlZ1qlYz2ejEg528I1Ma/MkOPvABf/GN0YdShX6aK4Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MnQe2X3g; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MnQe2X3g"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6333E439E7;
	Fri,  6 Jun 2025 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749199303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPvksxlf0Hyl0GWx9oF/FuC5ulQtC/iEwpumUiyWezs=;
	b=MnQe2X3gm/AWI6pN0PHB5SuT0ajW8eUsm1oWoqS3aSuJHgHf0D+DliE9SkFDRpyq49UNGW
	8FcY1hljn/Bt7JTUt8WGGFRs9QQKMygRcja+paVHzYwIzTwCl9M+tqQWXP/391ZGXAK6tX
	8QRLP7QJ32Th3tpQ5cXnZy4eTfTID2+G1DNg8qdVT0P8vEZd3B6o6Ll3xi0j3H09GG969I
	Lpsfe1kB1DXUYrPjiQnSGPMDK/ftXJp7BcSavg7ky3dH4j2Eub+Bd/utE/z8oN78Xhg+sE
	5eYipAQD911ot/RDcZ+fMcEdTEOAIVmCrSxFWP02MWb7zyKj4k4tf5yyrTxzIg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 06 Jun 2025 10:41:19 +0200
Subject: [PATCH v9 1/3] drm/tests: bridge: convert to
 devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-drm-bridge-alloc-doc-test-v9-1-b5bf7b43ed92@bootlin.com>
References: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
In-Reply-To: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepfeejrdduiedvrdduvdefrdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefjedrudeivddruddvfedrhedvpdhhvghloheplgduledvrdduieekrddvhedvrddvfeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhumhgrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Use the new DRM bridge allocation API, which is the only supported now, for
the kunit tests.

This change is more massive than for the typical DRM bridge driver because
struct drm_bridge_init_priv currently embeds a struct drm_bridge, which is
not supported anymore. We now have to use devm_drm_bridge_alloc() to
dynamically allocate a "private driver struct", which is a bit awkward here
because there is no real bridge driver. Thus let's add a "dummy" DRM bridge
struct to represent it.

As a nice cleanup we can now move the enable_count and disable_count
members, which are counting bridge-specific events, into the new "private
driver struct" (and avoid adding new unnecessary indirections).

Also add a trivial bridge_to_dummy_bridge() function just like many drivers
do.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v9:
* rename struct dummy_drm_bridge to drm_bridge_priv (and related variables
  accordingly)
* slightly improve struct drm_bridge_priv docs
* fix typo in commit message, improve commit message

This patch was added in v8.
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 87 +++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index ff88ec2e911c9cc9a718483f09d4c764f45f991a..af1b9f9694b0091e6eaef78cb71e39327ad8c3fa 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -10,29 +10,43 @@
 
 #include <kunit/test.h>
 
+/*
+ * Mimick the typical "private" struct defined by a bridge driver, which
+ * embeds a bridge plus other fields.
+ *
+ * Having at least one member before @bridge ensures we test non-zero
+ * @bridge offset.
+ */
+struct drm_bridge_priv {
+	unsigned int enable_count;
+	unsigned int disable_count;
+	struct drm_bridge bridge;
+};
+
 struct drm_bridge_init_priv {
 	struct drm_device drm;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder encoder;
-	struct drm_bridge bridge;
+	struct drm_bridge_priv *test_bridge;
 	struct drm_connector *connector;
-	unsigned int enable_count;
-	unsigned int disable_count;
 };
 
+static struct drm_bridge_priv *bridge_to_priv(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct drm_bridge_priv, bridge);
+}
+
 static void drm_test_bridge_enable(struct drm_bridge *bridge)
 {
-	struct drm_bridge_init_priv *priv =
-		container_of(bridge, struct drm_bridge_init_priv, bridge);
+	struct drm_bridge_priv *priv = bridge_to_priv(bridge);
 
 	priv->enable_count++;
 }
 
 static void drm_test_bridge_disable(struct drm_bridge *bridge)
 {
-	struct drm_bridge_init_priv *priv =
-		container_of(bridge, struct drm_bridge_init_priv, bridge);
+	struct drm_bridge_priv *priv = bridge_to_priv(bridge);
 
 	priv->disable_count++;
 }
@@ -45,8 +59,7 @@ static const struct drm_bridge_funcs drm_test_bridge_legacy_funcs = {
 static void drm_test_bridge_atomic_enable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *state)
 {
-	struct drm_bridge_init_priv *priv =
-		container_of(bridge, struct drm_bridge_init_priv, bridge);
+	struct drm_bridge_priv *priv = bridge_to_priv(bridge);
 
 	priv->enable_count++;
 }
@@ -54,8 +67,7 @@ static void drm_test_bridge_atomic_enable(struct drm_bridge *bridge,
 static void drm_test_bridge_atomic_disable(struct drm_bridge *bridge,
 					   struct drm_atomic_state *state)
 {
-	struct drm_bridge_init_priv *priv =
-		container_of(bridge, struct drm_bridge_init_priv, bridge);
+	struct drm_bridge_priv *priv = bridge_to_priv(bridge);
 
 	priv->disable_count++;
 }
@@ -102,6 +114,10 @@ drm_test_bridge_init(struct kunit *test, const struct drm_bridge_funcs *funcs)
 	if (IS_ERR(priv))
 		return ERR_CAST(priv);
 
+	priv->test_bridge = devm_drm_bridge_alloc(dev, struct drm_bridge_priv, bridge, funcs);
+	if (IS_ERR(priv->test_bridge))
+		return ERR_CAST(priv->test_bridge);
+
 	drm = &priv->drm;
 	priv->plane = drm_kunit_helper_create_primary_plane(test, drm,
 							    NULL,
@@ -125,9 +141,8 @@ drm_test_bridge_init(struct kunit *test, const struct drm_bridge_funcs *funcs)
 
 	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
 
-	bridge = &priv->bridge;
+	bridge = &priv->test_bridge->bridge;
 	bridge->type = DRM_MODE_CONNECTOR_VIRTUAL;
-	bridge->funcs = funcs;
 
 	ret = drm_kunit_bridge_add(test, bridge);
 	if (ret)
@@ -173,7 +188,7 @@ static void drm_test_drm_bridge_get_current_state_atomic(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 retry_commit:
-	bridge = &priv->bridge;
+	bridge = &priv->test_bridge->bridge;
 	bridge_state = drm_atomic_get_bridge_state(state, bridge);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bridge_state);
 
@@ -228,7 +243,7 @@ static void drm_test_drm_bridge_get_current_state_legacy(struct kunit *test)
 	 * locking. The function would return NULL in all cases anyway,
 	 * so we don't really have any concurrency to worry about.
 	 */
-	bridge = &priv->bridge;
+	bridge = &priv->test_bridge->bridge;
 	KUNIT_EXPECT_NULL(test, drm_bridge_get_current_state(bridge));
 }
 
@@ -253,7 +268,7 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomic(struct kunit *test)
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_bridge_init_priv *priv;
 	struct drm_display_mode *mode;
-	struct drm_bridge *bridge;
+	struct drm_bridge_priv *bridge_priv;
 	int ret;
 
 	priv = drm_test_bridge_init(test, &drm_test_bridge_atomic_funcs);
@@ -279,14 +294,14 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomic(struct kunit *test)
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
-	bridge = &priv->bridge;
-	KUNIT_ASSERT_EQ(test, priv->enable_count, 1);
-	KUNIT_ASSERT_EQ(test, priv->disable_count, 0);
+	bridge_priv = priv->test_bridge;
+	KUNIT_ASSERT_EQ(test, bridge_priv->enable_count, 1);
+	KUNIT_ASSERT_EQ(test, bridge_priv->disable_count, 0);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 retry_reset:
-	ret = drm_bridge_helper_reset_crtc(bridge, &ctx);
+	ret = drm_bridge_helper_reset_crtc(&bridge_priv->bridge, &ctx);
 	if (ret == -EDEADLK) {
 		drm_modeset_backoff(&ctx);
 		goto retry_reset;
@@ -296,8 +311,8 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomic(struct kunit *test)
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
-	KUNIT_EXPECT_EQ(test, priv->enable_count, 2);
-	KUNIT_EXPECT_EQ(test, priv->disable_count, 1);
+	KUNIT_EXPECT_EQ(test, bridge_priv->enable_count, 2);
+	KUNIT_EXPECT_EQ(test, bridge_priv->disable_count, 1);
 }
 
 /*
@@ -309,7 +324,7 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomic_disabled(struct kunit *
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_bridge_init_priv *priv;
 	struct drm_display_mode *mode;
-	struct drm_bridge *bridge;
+	struct drm_bridge_priv *bridge_priv;
 	int ret;
 
 	priv = drm_test_bridge_init(test, &drm_test_bridge_atomic_funcs);
@@ -318,14 +333,14 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomic_disabled(struct kunit *
 	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
 
-	bridge = &priv->bridge;
-	KUNIT_ASSERT_EQ(test, priv->enable_count, 0);
-	KUNIT_ASSERT_EQ(test, priv->disable_count, 0);
+	bridge_priv = priv->test_bridge;
+	KUNIT_ASSERT_EQ(test, bridge_priv->enable_count, 0);
+	KUNIT_ASSERT_EQ(test, bridge_priv->disable_count, 0);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 retry_reset:
-	ret = drm_bridge_helper_reset_crtc(bridge, &ctx);
+	ret = drm_bridge_helper_reset_crtc(&bridge_priv->bridge, &ctx);
 	if (ret == -EDEADLK) {
 		drm_modeset_backoff(&ctx);
 		goto retry_reset;
@@ -335,8 +350,8 @@ static void drm_test_drm_bridge_helper_reset_crtc_atomic_disabled(struct kunit *
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
-	KUNIT_EXPECT_EQ(test, priv->enable_count, 0);
-	KUNIT_EXPECT_EQ(test, priv->disable_count, 0);
+	KUNIT_EXPECT_EQ(test, bridge_priv->enable_count, 0);
+	KUNIT_EXPECT_EQ(test, bridge_priv->disable_count, 0);
 }
 
 /*
@@ -348,7 +363,7 @@ static void drm_test_drm_bridge_helper_reset_crtc_legacy(struct kunit *test)
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_bridge_init_priv *priv;
 	struct drm_display_mode *mode;
-	struct drm_bridge *bridge;
+	struct drm_bridge_priv *bridge_priv;
 	int ret;
 
 	priv = drm_test_bridge_init(test, &drm_test_bridge_legacy_funcs);
@@ -374,14 +389,14 @@ static void drm_test_drm_bridge_helper_reset_crtc_legacy(struct kunit *test)
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
-	bridge = &priv->bridge;
-	KUNIT_ASSERT_EQ(test, priv->enable_count, 1);
-	KUNIT_ASSERT_EQ(test, priv->disable_count, 0);
+	bridge_priv = priv->test_bridge;
+	KUNIT_ASSERT_EQ(test, bridge_priv->enable_count, 1);
+	KUNIT_ASSERT_EQ(test, bridge_priv->disable_count, 0);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 retry_reset:
-	ret = drm_bridge_helper_reset_crtc(bridge, &ctx);
+	ret = drm_bridge_helper_reset_crtc(&bridge_priv->bridge, &ctx);
 	if (ret == -EDEADLK) {
 		drm_modeset_backoff(&ctx);
 		goto retry_reset;
@@ -391,8 +406,8 @@ static void drm_test_drm_bridge_helper_reset_crtc_legacy(struct kunit *test)
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
-	KUNIT_EXPECT_EQ(test, priv->enable_count, 2);
-	KUNIT_EXPECT_EQ(test, priv->disable_count, 1);
+	KUNIT_EXPECT_EQ(test, bridge_priv->enable_count, 2);
+	KUNIT_EXPECT_EQ(test, bridge_priv->disable_count, 1);
 }
 
 static struct kunit_case drm_bridge_helper_reset_crtc_tests[] = {

-- 
2.49.0

