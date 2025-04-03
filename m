Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAE22528FC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687231; cv=none; b=IsoaeBhT9SlzYgTV6bP0PAZT3Ix4gnAIuXhThSBVZT83QyHeC1Pcomui6SECvLO7rUkvqZYXBMbzGEMRTW61ve+Hfi8SrcYpXDUhDX/QNizVfj6qQf8j3My9yXp60RSAZQr1LRm/4pf7g90apfQL22roiKcrfqD3FApg2rGoNl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687231; c=relaxed/simple;
	bh=DcYcHvtr2QSHPcXF1G+Z6ruyDYsfnPIybNswZ8mMbsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khf7TueydvuSpL3aQr2zfu0a7rF9rzu3E/AL8XeW9t0J2pq0viY+PDvauZ2YrSmtmnLXsXgUa4YllMMj35JaX+MYhLvfPLjYP7KcnCtrjqLQWal1WVNR+ehhMjiIuHSqXxuLpWxVv61OFwLtNcNzJC3cuVjf7I3d/2hMNfgwNR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oneAda3h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oneAda3h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FC7C4CEE5;
	Thu,  3 Apr 2025 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743687231;
	bh=DcYcHvtr2QSHPcXF1G+Z6ruyDYsfnPIybNswZ8mMbsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oneAda3hrpHCbR3hQcJoUoLiraCqoA2k1eXrpWSg8z0VpKMOs9mgOiUSN//yC0iJR
	 nUc7CYJZ5Ml+U458aN41pFYDEP2oych7gIOSBHN7W+bUsg9pF6Y5bqtDqT0MY4AHnG
	 vxRUMwAuiINwWkm+k6WKCdA21OF5eWIdt8ueyekqAvYQimK8NsuLrIPFP3tnK75Io+
	 g7r41jb/yNtKAEuhMX9opPC6tignNyhABywJMQxrfL1UmyiY6w55OtkZia7zInZB8L
	 YyAwvrUDiN+h1wX82o+bUMH3KWLcY1BTk8ikMn7Do7VzQB6c885xQm31yGa6vidfCf
	 mRrBBpDdaBenw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 03 Apr 2025 15:33:32 +0200
Subject: [PATCH v2 3/4] drm/vc4: tests: Stop allocating the state in test
 init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-drm-vc4-kunit-failures-v2-3-e09195cc8840@kernel.org>
References: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
In-Reply-To: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4608; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DcYcHvtr2QSHPcXF1G+Z6ruyDYsfnPIybNswZ8mMbsg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnv+owCH/LxLOXXZjQy+PTOm/9n63Kz3w+n7N9y9GuCC
 M8e8W1ZHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhI2kmGf9adDbtqOB0d5H8c
 y2zWe1ShcWNP7r7Qwxe1Kj7Mcly06wwjQ9tZltMpJzSYqlbkHHB4s/St9T91ZpNp25ZrnJp9+MQ
 MZ14A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The vc4-pv-muxing-combinations and vc5-pv-muxing-combinations test
suites use a common test init function which, in part, allocates the
drm atomic state the test will use.

That allocation relies on  drm_kunit_helper_atomic_state_alloc(), and
thus requires a struct drm_modeset_acquire_ctx. This context will then
be stored in the allocated state->acquire_ctx field.

However, the context is local to the test init function, and is cleared
as soon as drm_kunit_helper_atomic_state_alloc() is done. We thus end up
with an dangling pointer to a cleared context in state->acquire_ctx for
our test to consumes.

We should really allocate the context and the state in the test
functions, so we can also control when we're done with it.

Fixes: 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 41 +++++++++++++++++---------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index 992e8f5c5c6ea8d92338a8fe739fa1115ff85338..52c04ef33206bf4f9e21e3c8b7cea932824a67fa 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -18,11 +18,10 @@
 
 #include "vc4_mock.h"
 
 struct pv_muxing_priv {
 	struct vc4_dev *vc4;
-	struct drm_atomic_state *state;
 };
 
 static bool check_fifo_conflict(struct kunit *test,
 				const struct drm_atomic_state *state)
 {
@@ -675,14 +674,23 @@ KUNIT_ARRAY_PARAM(vc5_test_pv_muxing_invalid,
 
 static void drm_vc4_test_pv_muxing(struct kunit *test)
 {
 	const struct pv_muxing_param *params = test->param_value;
 	const struct pv_muxing_priv *priv = test->priv;
-	struct drm_atomic_state *state = priv->state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_device *drm;
+	struct vc4_dev *vc4;
 	unsigned int i;
 	int ret;
 
+	drm_modeset_acquire_init(&ctx, 0);
+
+	vc4 = priv->vc4;
+	drm = &vc4->base;
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 	for (i = 0; i < params->nencoders; i++) {
 		enum vc4_encoder_type enc_type = params->encoders[i];
 
 		ret = vc4_mock_atomic_add_output(test, state, enc_type);
 		KUNIT_ASSERT_EQ(test, ret, 0);
@@ -698,56 +706,61 @@ static void drm_vc4_test_pv_muxing(struct kunit *test)
 		enum vc4_encoder_type enc_type = params->encoders[i];
 
 		KUNIT_EXPECT_TRUE(test, check_channel_for_encoder(test, state, enc_type,
 								  params->check_fn));
 	}
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
 }
 
 static void drm_vc4_test_pv_muxing_invalid(struct kunit *test)
 {
 	const struct pv_muxing_param *params = test->param_value;
 	const struct pv_muxing_priv *priv = test->priv;
-	struct drm_atomic_state *state = priv->state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_device *drm;
+	struct vc4_dev *vc4;
 	unsigned int i;
 	int ret;
 
+	drm_modeset_acquire_init(&ctx, 0);
+
+	vc4 = priv->vc4;
+	drm = &vc4->base;
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
 	for (i = 0; i < params->nencoders; i++) {
 		enum vc4_encoder_type enc_type = params->encoders[i];
 
 		ret = vc4_mock_atomic_add_output(test, state, enc_type);
 		KUNIT_ASSERT_EQ(test, ret, 0);
 	}
 
 	ret = drm_atomic_check_only(state);
 	KUNIT_EXPECT_LT(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
 }
 
 static int vc4_pv_muxing_test_init(struct kunit *test)
 {
 	const struct pv_muxing_param *params = test->param_value;
-	struct drm_modeset_acquire_ctx ctx;
 	struct pv_muxing_priv *priv;
-	struct drm_device *drm;
 	struct vc4_dev *vc4;
 
 	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 	test->priv = priv;
 
 	vc4 = params->mock_fn(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
 	priv->vc4 = vc4;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	drm = &vc4->base;
-	priv->state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->state);
-
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
-
 	return 0;
 }
 
 static struct kunit_case vc4_pv_muxing_tests[] = {
 	KUNIT_CASE_PARAM(drm_vc4_test_pv_muxing,

-- 
2.49.0

