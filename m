Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1923F248176
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576915; cv=none; b=Z482OAkhoZJdf0RHR8SBNXvuVD1guvDzJ+r1VqMGlDEQsBkdyUApBEiPdSR863G5YYdHJm8YpTyq+VK8BuUpINzwFIl10ghXKzl/OYZ4gOO+aa3TPoljKuoQuhio3ke++LISp0Y2+6fetdtmtLebS5bhQ7uHHtd/XH+i11cXMZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576915; c=relaxed/simple;
	bh=qyPtVfazjoB+F5C0m0PCSMh+PJe6TqwKkztm++nr1ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUcF2upYNJPTikeWJ84ATFukQYv1RInG4aBrFNWcVP6wfLo7QdyYFWfeFGIafjI9VSMbgPMheTFP5PN2O4TmaE0uEN8J8YnfLF5s/j3p2Py9LSfSWFe4TM+C28yIpsiLH6yKJEmoUBNVpByWMLRmcZHwUHWqPxa6qV8STKwOWeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QY0LwTfD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QY0LwTfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576911;
	bh=qyPtVfazjoB+F5C0m0PCSMh+PJe6TqwKkztm++nr1ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QY0LwTfDJwdJF0V7AIx3E+WM5/eFLHXzzyXSM5TCji/ooC2CGCmRpqUMVNqHR/+Iz
	 pplEMVoa+EWdjQ40jrAi8w1MudsM/lE18uEdTW3BELK7Pm2ds5O6uDwjYpl0T2wjE/
	 nzVTuvgddK3NXA56wd4VemVDR1F2RlvKWEtFNboSsRA/uso0AiyIxEX19MZ1hiWYiM
	 rQ9jRLwrm0W1BOPTHyPK+nYnA3P/9L1JTTspGM/wGpXiUi/zC+TiuTjrBqVQHtb8Y5
	 WIcy83ihdf1V8v9ZKUBeXWaIhykfBmlI1c/tt/SKhq+OpqqB7q0ZM90Z0SauuxbFKM
	 YlaSygBKlNk4Q==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 30A5217E36BB;
	Fri, 25 Apr 2025 12:28:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:06 +0300
Subject: [PATCH v4 15/23] drm/tests: hdmi: Restart atomic sequence on
 EDEADLK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-15-5e55e2aaa3fa@collabora.com>
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

Make use of the newly introduced drm_kunit_atomic_restart_on_deadlock()
helper to handle EDEADLK errors throughout all test cases.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c8bb131d63ea6d0c9e166c8d9ba5e403118cd9f1..8c795eeb1090b50993c1907a9fc5bb72baa556e1 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -276,7 +276,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
@@ -289,6 +291,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 			new_conn_state->hdmi.broadcast_rgb);
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
@@ -345,7 +348,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
@@ -354,6 +359,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	new_conn_state->hdmi.broadcast_rgb = old_conn_state->hdmi.broadcast_rgb;
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
@@ -416,7 +422,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -424,6 +432,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 			DRM_HDMI_BROADCAST_RGB_AUTO);
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = drm_atomic_get_connector_state(state, conn);
@@ -475,7 +484,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -483,6 +494,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 			DRM_HDMI_BROADCAST_RGB_AUTO);
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = drm_atomic_get_connector_state(state, conn);
@@ -536,12 +548,15 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = drm_atomic_get_connector_state(state, conn);
@@ -597,12 +612,15 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = drm_atomic_get_connector_state(state, conn);
@@ -660,12 +678,15 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = drm_atomic_get_connector_state(state, conn);
@@ -721,12 +742,15 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = drm_atomic_get_connector_state(state, conn);
@@ -785,7 +809,9 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
@@ -798,6 +824,7 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 			new_conn_state->max_requested_bpc);
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
@@ -861,7 +888,9 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
@@ -872,6 +901,7 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 			old_conn_state->hdmi.output_bpc);
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
@@ -1136,12 +1166,15 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
 
 	crtc_state->connectors_changed = true;
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_EXPECT_LT(test, ret, 0);
 
 	drm_modeset_drop_locks(&ctx);
@@ -1646,7 +1679,9 @@ static void drm_test_check_disable_connector(struct kunit *test)
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
+retry:
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
 
 	crtc_state->active = false;
@@ -1654,12 +1689,15 @@ static void drm_test_check_disable_connector(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = drm_atomic_get_connector_state(state, conn);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	ret = drm_atomic_check_only(state);
+	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	drm_modeset_drop_locks(&ctx);

-- 
2.49.0

