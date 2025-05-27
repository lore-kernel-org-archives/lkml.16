Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E775D27587F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347897; cv=none; b=LbseKqXAEcH0Ib0nrXnmxQJ1Oi3Cd91glnRQhlRnp8uQ/bquYt5mpHfzP5W2UoEJUAkTQwR/ertrKXu2HP96TyQo2N+68IMbbUxVqtzoo3zviCI7TZ5BiaNnTl8pXeu3rn/wnBkSMVXUlHosohiiUVHaGtG9vaME6pdwpvKjq4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347897; c=relaxed/simple;
	bh=YWFru4H/Eik0gnTLq2MsHqXdolUJMnLe+KhSqLrLUCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvTNpwLI1GXdNbHE78wq2H5rmfSGShFCGosvO3y9ABztZzfJcRCI/6s0PQl9JgaS1bYtQrZuEQbca1Thet2X1U27HSmwOkySqSDQ1TB5lrPrHRDAUGHPNVco25TJ/Hy1nGQaR42CnJ1PfbPPBSn8Xw5uWms3FqurqmcInGTSScs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fWbAFVEh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fWbAFVEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347894;
	bh=YWFru4H/Eik0gnTLq2MsHqXdolUJMnLe+KhSqLrLUCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fWbAFVEhceDwgM+8HFKVpbHJRqUmcpbglp8UgfSKCMqlRgDEwpUQBjGUvpelebu8T
	 LGd1kF4S79bNZmqUofw5eNsbeWGbj9qduzAi+De7lYaicDjeEPZna2GQ+qbWf0LxK6
	 DQqDTyzU197MliyAOZ+xmf/1QQQWXaUQZFiccdcdIkPVei5n0bJkloL5+qZD1U95F7
	 OIfux7vPPUBBlIL/qDfegctvEZ7TnQ0Z0V7WL6bHfmaAUTTTG7e+nkBWbmMB2p1BxL
	 jfftP1jPqTHhlsAP8Ti5MJgv29aB6gYMKfzfPleemog/H3HTUMO77+Ixgvh6KUjSzz
	 Z1SUrBOR7tISg==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 4818317E0FA8;
	Tue, 27 May 2025 14:11:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:23 +0300
Subject: [PATCH v5 15/19] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-15-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Provide tests to verify that drm_atomic_helper_connector_hdmi_check()
helper behaviour when using YUV420 output format is to always set the
limited RGB quantization range to 'limited', no matter what the value of
Broadcast RGB property is.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 108 ++++++++++++++++++++-
 1 file changed, 103 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 168fe25529e5861ebee2d8a929f912436c485c60..8015e4c469049c611f7fcc24269cd349680900c9 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -735,6 +735,107 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	drm_modeset_acquire_fini(&ctx);
 }
 
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, we will
+ * get a limited RGB Quantization Range with a YUV420 mode, no
+ * matter what the value of the Broadcast RGB property is set to.
+ */
+static void drm_test_check_broadcast_rgb_cea_mode_yuv420(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	enum drm_hdmi_broadcast_rgb broadcast_rgb;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	broadcast_rgb = *(enum drm_hdmi_broadcast_rgb *)test->param_value;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV420),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 95);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm, crtc, conn,
+						     mode, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_conn_state:
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	if (PTR_ERR(conn_state) == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = broadcast_rgb;
+
+	ret = drm_atomic_check_only(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_state;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test, conn_state->hdmi.broadcast_rgb, broadcast_rgb);
+	KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_YUV420);
+
+	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_limited_range);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static const enum drm_hdmi_broadcast_rgb check_broadcast_rgb_cea_mode_yuv420_tests[] = {
+	DRM_HDMI_BROADCAST_RGB_AUTO,
+	DRM_HDMI_BROADCAST_RGB_FULL,
+	DRM_HDMI_BROADCAST_RGB_LIMITED,
+};
+
+static void
+check_broadcast_rgb_cea_mode_yuv420_desc(const enum drm_hdmi_broadcast_rgb *broadcast_rgb,
+					 char *desc)
+{
+	sprintf(desc, "%s", drm_hdmi_connector_get_broadcast_rgb_name(*broadcast_rgb));
+}
+
+KUNIT_ARRAY_PARAM(check_broadcast_rgb_cea_mode_yuv420,
+		  check_broadcast_rgb_cea_mode_yuv420_tests,
+		  check_broadcast_rgb_cea_mode_yuv420_desc);
+
 /*
  * Test that if we change the maximum bpc property to a different value,
  * we trigger a mode change on the connector's CRTC, which will in turn
@@ -1667,11 +1768,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_full_cea_mode_vic_1),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode_vic_1),
-	/*
-	 * TODO: When we'll have YUV output support, we need to check
-	 * that the limited range is always set to limited no matter
-	 * what the value of Broadcast RGB is.
-	 */
+	KUNIT_CASE_PARAM(drm_test_check_broadcast_rgb_cea_mode_yuv420,
+			 check_broadcast_rgb_cea_mode_yuv420_gen_params),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_disable_connector),

-- 
2.49.0

