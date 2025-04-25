Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6B250BED
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576921; cv=none; b=A90Z8NO9+uLUWba1hUyGW1zSkSf71L+E/l0a6VGp2UBPIX0vDx61lMXXXzrZPeOndYvzGNbVBtV0P3nvIlPDOCh5Os6hkb9BK8UfbKknTzPxmJ2hq4JeLEQ5yNybkSidVrXkXVEoZ5JUisJZGpK97KlXJOKzqGnusuFAoX4xZxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576921; c=relaxed/simple;
	bh=ZVU2WaW7uifp+B3XQuRHQ86jvGOQE7Eh05ee1wZHt4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYIJry9JaLJ2gPrRySs+h89uzas+HTlF1nPOMVXI1toymEmASbvU6gga0I7md7UJTeMiVqoKWxShclnZ72erOgBwobM5K+dLWSvpmbpbsftirKg4r6JFyam4yrEDEUJ8MB4dNGsAGkNqK3/LX80AiaO5zej1GhLcW4jyYGxwKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f+e72Eop; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f+e72Eop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576917;
	bh=ZVU2WaW7uifp+B3XQuRHQ86jvGOQE7Eh05ee1wZHt4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f+e72Eopswe+gMTjkIiWfIHOa2LC6wmhBmYu6K1Zg4VabA7uzyQe3tl/PCBcoMA8W
	 kabw07n4ZFeG2d4wO7fqrU54v7Hs0hHRUdf2l0lS+GbK0QACA86kxXXyA4LjAzV+tv
	 q69JqcXfnB9pWp/2PZXhTkg220NSj80jNeOHqiYynW/jmfWlRXYDzAoFud89db5yJO
	 901IvKfg71jP1DTeihitRm14Zg4ayr0suoygrdlhEim6XKaDmNoaX3vTy4jWAOdz2P
	 3FUYq2oglZlrZcyL9psUv1AYMCu2stPKuukFutFHLbmYzwvX8tLgHa/MnVqzzf2265
	 EQgFtXvX+xpJQ==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 0188A17E36C2;
	Fri, 25 Apr 2025 12:28:36 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:13 +0300
Subject: [PATCH v4 22/23] drm/tests: hdmi: Add test for unsuccessful
 fallback to YUV420
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-22-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Provide test to verify a mandatory fallback to YUV420 output cannot
succeed when driver doesn't advertise YUV420 support.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index e7e55db0add5b28ba7114d45a272d98daed2513c..d79084cfb516b69c4244098c0767d604ad02f2c3 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1551,6 +1551,77 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420(struct kunit
 	drm_modeset_acquire_fini(&ctx);
 }
 
+/*
+ * Test that if a driver supports only RGB, but the chosen mode can be
+ * supported by the screen only in YUV420 output format, we end up with
+ * unsuccessful fallback attempts.
+ */
+static void drm_test_check_driver_unsupported_fallback_yuv420(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_info *info;
+	struct drm_display_mode *preferred, *yuv420_only_mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_FALSE(test, conn->ycbcr_420_allowed);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_FALSE(test, drm_mode_is_420_also(info, preferred));
+
+	yuv420_only_mode = drm_kunit_display_mode_from_cea_vic(test, drm, 95);
+	KUNIT_ASSERT_NOT_NULL(test, yuv420_only_mode);
+	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_only(info, yuv420_only_mode));
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred, &ctx);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, conn_state);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry:
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, yuv420_only_mode);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
+	KUNIT_ASSERT_LT(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
 /*
  * Test that if a driver and screen supports RGB and YUV formats, and we
  * try to set the VIC 1 mode, we end up with 8bpc RGB even if we could
@@ -1951,6 +2022,7 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_yuv420),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420),
+	KUNIT_CASE(drm_test_check_driver_unsupported_fallback_yuv420),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_dvi),

-- 
2.49.0

