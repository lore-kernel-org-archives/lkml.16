Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE69324EAAF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576920; cv=none; b=uCjmTLLEdXyCjI2TLD9lrGB/3EBhd3e6bkiiDITKZVyKtT6/H29X2ccOALMeH0WE00ffl2j1JOEe2MjQw0Se8buWtSn3Z1PME3vOBPcL1SOR49qrxK6C4GqtWOsD0kMdZLNSxFAqVNRBKROxiR+/b5iGCFk1AKrdrZPTbhjeOe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576920; c=relaxed/simple;
	bh=6sOycG3HJllYsQTPTMtDCfPR86tsMqNzg3NsMzDCa4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cls3Pf8+Kx5uTg0N4aU1GhDObYwaRvuKFiQHeovqbQNtOw2/4PO2PaEKQRw9o9C4twJpG7XdNuQ02yzMIi15Y2xKK6Nj4m5naNCo4Ho0Z1eltKQqBkjKCwn6KmLAxAmI2UFGQybk2kvrZqrAoFAyTtrhOjBlUmYkw7GFAAoVhbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aTFfgdIw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aTFfgdIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576916;
	bh=6sOycG3HJllYsQTPTMtDCfPR86tsMqNzg3NsMzDCa4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aTFfgdIw0B6upTTANSaAZ/ELtFFue9amfxLs6KNuCZOxxHVLNimiLeNtLCEkV4FsP
	 5UDFYnstKdq+DFbwTeL+SrIOgHcVq4I350t/u2JlU0c1L6IlPDgltrhGQLQIoV1XIF
	 rVc2WYeyVZhU6UIupof/40pNhigETOaN6aLPVaSPucPCBU4rGNUo+kRnAqS21wd0yt
	 dlXPpDS79WKWXW5LvDQU+X5Rlq0AH1vIOWrDT11Z5K6p5VCVk8j9HReTtcGAguF1oA
	 1WXR/GatAQVWsecb8Tn7YeqoZdQQDWjYkFRZWSJjibGGh5dyAk/jaQc7GppaSuH0Lc
	 86M/0vlD6xgEQ==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 222AA17E36BD;
	Fri, 25 Apr 2025 12:28:36 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:12 +0300
Subject: [PATCH v4 21/23] drm/tests: hdmi: Add max TMDS rate fallback tests
 for YUV420 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-21-5e55e2aaa3fa@collabora.com>
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

Provide tests to verify drm_atomic_helper_connector_hdmi_check() helper
fallback behavior when using YUV420 output format.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 146 +++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index faec7aa6fd55faae2207072b67ef3d372dc1695e..e7e55db0add5b28ba7114d45a272d98daed2513c 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1334,6 +1334,76 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_rgb(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
+/*
+ * Test that if:
+ * - We have an HDMI connector and a display supporting both RGB and YUV420
+ * - The chosen mode can be supported in YUV420 output format only
+ * - The chosen mode has a TMDS character rate higher than the display
+ *   supports in YUV420/12bpc
+ * - The chosen mode has a TMDS character rate lower than the display
+ *   supports in YUV420/10bpc.
+ *
+ * Then we will pick the latter, and the computed TMDS character rate
+ * will be equal to 1.25 * 0.5 times the mode pixel clock.
+ */
+static void drm_test_check_max_tmds_rate_bpc_fallback_yuv420(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_display_info *info;
+	struct drm_display_mode *yuv420_only_mode;
+	unsigned long long rate;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV420),
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
+	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
+	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
+
+	yuv420_only_mode = drm_kunit_display_mode_from_cea_vic(test, drm, 95);
+	KUNIT_ASSERT_NOT_NULL(test, yuv420_only_mode);
+	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_only(info, yuv420_only_mode));
+
+	rate = drm_hdmi_compute_mode_clock(yuv420_only_mode, 12, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
+
+	rate = drm_hdmi_compute_mode_clock(yuv420_only_mode, 10, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 yuv420_only_mode,
+							 &ctx);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, conn_state);
+
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 10);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_YUV420);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, yuv420_only_mode->clock * 625);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
 /*
  * Test that if:
  * - We have an HDMI connector supporting both RGB and YUV422 and up to
@@ -1407,6 +1477,80 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422(struct kunit
 	drm_modeset_acquire_fini(&ctx);
 }
 
+/*
+ * Test that if:
+ * - We have an HDMI connector supporting both RGB and YUV420 and up to
+ *   12 bpc
+ * - The chosen mode has a TMDS character rate higher than the display
+ *   supports in RGB/10bpc but lower than the display supports in
+ *   RGB/8bpc
+ * - The chosen mode has a TMDS character rate lower than the display
+ *   supports in YUV420/12bpc.
+ *
+ * Then we will prefer to keep the RGB format with a lower bpc over
+ * picking YUV420.
+ */
+static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_display_info *info;
+	struct drm_display_mode *preferred;
+	unsigned long long rate;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV420),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
+	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
+	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_also(info, preferred));
+
+	rate = drm_hdmi_compute_mode_clock(preferred, 8, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
+
+	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
+
+	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	ret = drm_kunit_helper_try_enable_crtc_connector(test, drm,
+							 crtc, conn,
+							 preferred,
+							 &ctx);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, conn_state);
+
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 8);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
 /*
  * Test that if a driver and screen supports RGB and YUV formats, and we
  * try to set the VIC 1 mode, we end up with 8bpc RGB even if we could
@@ -1804,7 +1948,9 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_disable_connector),
 	KUNIT_CASE(drm_test_check_hdmi_funcs_reject_rate),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_rgb),
+	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_yuv420),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422),
+	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_dvi),

-- 
2.49.0

