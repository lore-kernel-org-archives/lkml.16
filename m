Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD3724BBF4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576918; cv=none; b=atusJaEgMxOyat/DJeIs+e6nlQ/c2Y6vwNXUNrMsuhv3RuclJOs5zmHH3pAXNuqreL9NMjOmRnI0Je2OkEME2kE0WjYZ7xZzDGoUDRfMP6BbrlAl+equnjZXB8hzYRnB2TFLe+LeT+h3U8QAijV4qaE7HDq9DQsjg6qSw4Ik10s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576918; c=relaxed/simple;
	bh=0uIy3tfZxCavEfHfFfDIizsIyNd8gGMaoE+U0rK5ogM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZeEyooErgABXMRlc5TAII3bKZx1ZZWOAcIlwNfwytTAesDc0j6uiWa7RcmrBKxjXckL6jpy8k24JtrvjHwX56I7Q7op7fcrXfVtSXrOJJ7eNuvtcooVszBVZn5s5ZI3XF6vCh5pMvgp1EHj2eHTj68qmRC7D5PtFlxkySOLDD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pFLq0RK1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pFLq0RK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576913;
	bh=0uIy3tfZxCavEfHfFfDIizsIyNd8gGMaoE+U0rK5ogM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pFLq0RK1PTIRDMuVnDzggdFJf3XSwkKnw2mGDAt7XBwE1pi/5bABIqFJvx7cbtfbI
	 wtxXd6DOYGInvxWmw3hQlGj+NJkSnlKpFSxCS3Bptyws7uHY/i0GKo5mm316GfAKKu
	 0ruDEqYQ5nchhANrUS23zW2jY75O/VFiTyI55FTMrDmAHAu5epWGC8FCx1UE6OFQy1
	 5cfyEtTEmd2HfhehFO/z1zvS0hD3SPX4DUw0RYbAFhKWJWCVBOafc+QL0BWTjfrx18
	 3zqcMhtSB9Z/bPT1uiA54VYVzhbNX3mbDpTyX/9cnT8jyNa2pzfeMq6+EBQx8Cwpgh
	 k5CBbYz0PWV9g==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 88C7017E36C1;
	Fri, 25 Apr 2025 12:28:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:09 +0300
Subject: [PATCH v4 18/23] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-18-5e55e2aaa3fa@collabora.com>
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

Provide tests to verify that drm_atomic_helper_connector_hdmi_check()
helper behaviour when using YUV420 output format is to always set the
limited RGB quantization range to 'limited', no matter what the value of
Broadcast RGB property is.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 93 ++++++++++++++++++++--
 1 file changed, 88 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index ae58d1f747e84f99e72624396af1f51fe498f931..6dae9a56bf1bccd39f6b79f6ad9f943538d0ad36 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -766,6 +766,92 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
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
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 mode, &ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry:
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = broadcast_rgb;
+
+	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
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
@@ -1711,11 +1797,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
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

