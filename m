Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD40243954
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576910; cv=none; b=Qj4afY/ZoOi0bOCU/lIQ1Hyz83RsZd2RIfGJpimnOTO7fQ+4/T+BDNnK5/8Mu8kr2+1kW8pQqM1F8y50CESmLLYNR0m6yQ/Q4/mQsNnDOUMUfmldN+t+dBRR6Kd8eHCoWOlSkR4F3cxgL5EcTXLfVuKJWJ3832vQR0f8SDaucCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576910; c=relaxed/simple;
	bh=s1W/dI7eA1aqxPpvJXOT3JsKXbf9OEDUhgfeo/iygYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QoQfOxyiuv0O9IuGs3iuN4svnV8ffjO0tOhHiOiWubFvIa1APOFO8PUfa2lD7ulqM0ORls+dBEm/TgBdcWjudxgHeOZuWAhbNbw9QktRhNej7ZIIPLP/ZH++0jnUfM7C60xOQYQgPlSp+8UtrzHVDsLmTqmalBKixpKY9qpXpo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TYNY7sVC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TYNY7sVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576906;
	bh=s1W/dI7eA1aqxPpvJXOT3JsKXbf9OEDUhgfeo/iygYY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TYNY7sVCzZ1nhT+2KNAtrTn57bSB2FE05wDGJtKeMqsDc7rr5izsYixkO+NHmvF4g
	 AY/Smlhg82R7Qfx0PBdwpXtmgSu7rGND9xMApZ0m4RxpND2CbSsjUHh5w7Xs+TEOfs
	 8RCWbNLTw6bEazyO+wVx6r/xNEtp7k7wRX0F96Ms1zdV1qG4+efNAwKqsepinl7hEQ
	 FUmYDncVLdChRw0Zo2E+RaCPB96Wjalecqkj4C+/FZ5zBuhHxgZ+Us5DmY4xNvPKCa
	 2t99nEv6qnMmnZt781Eexjpc0emArdB57zQa+bN8qnri+aFbMh328XFNmParqZ0LFm
	 MOryJPf+lls6w==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 4033917E36BB;
	Fri, 25 Apr 2025 12:28:26 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:00 +0300
Subject: [PATCH v4 09/23] drm/tests: hdmi: Replace open coded EDID setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-9-5e55e2aaa3fa@collabora.com>
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

Make use of the recently introduced macros to reduce boilerplate code
around EDID setup. This also helps dropping the redundant calls to
set_connector_edid().

No functional changes intended.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 234 ++++++++-------------
 1 file changed, 92 insertions(+), 142 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 36734639d19a3f279abc4631eb19d5c2b20ca315..921afb732797f1530d3857ea6d951c5df79d42b4 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -762,19 +762,16 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    10);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				10,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -841,19 +838,16 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    10);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				10,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -915,21 +909,18 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_dvi_1080p);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_dvi_1080p,
-				 ARRAY_SIZE(test_edid_dvi_1080p));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_FALSE(test, info->is_hdmi);
 
@@ -969,19 +960,16 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    8);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1021,19 +1009,16 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    10);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				10,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1073,19 +1058,16 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1191,19 +1173,16 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1263,21 +1242,18 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1331,20 +1307,17 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1398,19 +1371,16 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1468,21 +1438,18 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1541,19 +1508,16 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    8);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1604,21 +1568,18 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_340mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_340mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_340mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1937,28 +1898,20 @@ static void drm_test_check_mode_valid(struct kunit *test)
 static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
-	struct drm_connector *conn;
 	struct drm_display_mode *preferred;
-	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  BIT(HDMI_COLORSPACE_RGB),
-							  8,
-							  &reject_100mhz_connector_hdmi_funcs);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+					BIT(HDMI_COLORSPACE_RGB),
+					8,
+					&reject_100mhz_connector_hdmi_funcs,
+					test_edid_hdmi_1080p_rgb_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
-	conn = &priv->connector;
-
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	/*
 	 * Unlike the drm_test_check_mode_valid() here 1080p is rejected, but
 	 * 480p is allowed.
 	 */
-	preferred = find_preferred_mode(conn);
+	preferred = find_preferred_mode(&priv->connector);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
 	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
@@ -1976,12 +1929,14 @@ static void drm_test_check_mode_valid_reject(struct kunit *test)
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
 	struct drm_display_mode *preferred;
+	unsigned char no_edid[] = {};
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  BIT(HDMI_COLORSPACE_RGB),
-							  8,
-							  &reject_connector_hdmi_funcs);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+					BIT(HDMI_COLORSPACE_RGB),
+					8,
+					&reject_connector_hdmi_funcs,
+					no_edid);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -2006,20 +1961,15 @@ static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
 	struct drm_display_mode *preferred;
-	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    8);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_100mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
-
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_100mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_100mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	KUNIT_ASSERT_EQ(test, conn->display_info.max_tmds_clock, 100 * 1000);
 
 	preferred = find_preferred_mode(conn);

-- 
2.49.0

