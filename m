Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D6926463A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097676; cv=none; b=HoRHKBAyoCNH75GcwghGV+/1e3nsJGjXG+r8rymoT5AM/DKFaHubp47l16xA8t9lvzHd/pHiG/g1CssUKXU5tJHeEk9lb4BpGU0sl1dwk48jcPE71+k1TmnIu0suGrqM0POtnlss6sfqdosn1WMFz68+qFS9+N3nG2Bc/ZQQPqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097676; c=relaxed/simple;
	bh=ghSfrPXI2nSYR1VXeWBWO2imBz8Oggxn/25Nh3fSTVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDp5zN7DTnP4OcDwgUSxAMRVXnqkG2xA6drRnE+YenSJNBd4Wb8L0As2BHeq5o3gZsicn8JPDhnV6j8bYxBTSo203dLe4AwSkf9I3LIIJEHrK8gMJ8jIIpZ0Pic7uFaD5SOL52dI1OQtVkZXP5MqVOxLqYU4e425080azdNIxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbCrWC8O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbCrWC8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286A6C4CEEA;
	Tue,  8 Apr 2025 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744097675;
	bh=ghSfrPXI2nSYR1VXeWBWO2imBz8Oggxn/25Nh3fSTVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kbCrWC8Owu23aMKrSZAaT70K6soBdil82f2Kxo6ZxkQ/fK/fmBy5jtbJK+PlL88wD
	 OiRVTF2wbM/j35kg3DqQTABxamJjCKIOEC9gt+cuci3/6C2PghOtDZziMkDEfgezVG
	 jPgnLJ4uH/lOET8DVrQWYJfcOOdYF4LNf0uiSSYwAOXQrJZVUZyCLVOL8im4ZOPqOj
	 npCC5W3EnqlyzdlN1cmdlyNtCy2Oz1ZRE0ClIG4Pv8zvIM8AQLlUqXcPHxoh6Wg/pV
	 ffgE3+sw63LQ7GNLp4ZDvJ7JMtMmb0DaAxzYh3R/hfWwoh8ZnR5OJAbYazk7a/X/FR
	 6vdl9xpvJpw6w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:11 +0200
Subject: [PATCH 5/7] drm/tests: modes: Fix drm_display_mode memory leak
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-5-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3907; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ghSfrPXI2nSYR1VXeWBWO2imBz8Oggxn/25Nh3fSTVo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLlbavc39oB+hkVtpymzvM3ERwwtJqbD5cr2TJm2T2
 nxgft6EjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEykQ4Thn3ZL5JqMHCYjTz+e
 NYf7buY9WH3dPDtFON7Xdbbkstv54gx/eP+dutTgofEowF5m7sY9+2S2RwmeXRDHpPhhvaVO/xZ
 PTgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_analog_tv_mode() and its variants return a drm_display_mode that
needs to be destroyed later one. The drm_modes_analog_tv tests never
do however, which leads to a memory leak.

Let's make sure it's freed.

Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: 4fcd238560ee ("drm/modes: Add a function to generate analog display modes")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_modes_test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 6ed51f99e133c96db7c1deafea9be1c00eebe7a1..7ba646d87856f52f99b0f9bcfed0c31d848c798d 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -38,17 +38,21 @@ static int drm_test_modes_init(struct kunit *test)
 
 static void drm_test_modes_analog_tv_ntsc_480i(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv = test->priv;
 	struct drm_display_mode *mode;
+	int ret;
 
 	mode = drm_analog_tv_mode(priv->drm,
 				  DRM_MODE_TV_MODE_NTSC,
 				  13500 * HZ_PER_KHZ, 720, 480,
 				  true);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
+	ret = drm_kunit_add_mode_destroy_action(test, mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 60);
 	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
 
 	/* BT.601 defines hsync_start at 736 for 480i */
 	KUNIT_EXPECT_EQ(test, mode->hsync_start, 736);
@@ -68,34 +72,45 @@ static void drm_test_modes_analog_tv_ntsc_480i(struct kunit *test)
 
 static void drm_test_modes_analog_tv_ntsc_480i_inlined(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv = test->priv;
 	struct drm_display_mode *expected, *mode;
+	int ret;
 
 	expected = drm_analog_tv_mode(priv->drm,
 				      DRM_MODE_TV_MODE_NTSC,
 				      13500 * HZ_PER_KHZ, 720, 480,
 				      true);
 	KUNIT_ASSERT_NOT_NULL(test, expected);
 
+	ret = drm_kunit_add_mode_destroy_action(test, expected);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	mode = drm_mode_analog_ntsc_480i(priv->drm);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
+	ret = drm_kunit_add_mode_destroy_action(test, mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));
 }
 
 static void drm_test_modes_analog_tv_pal_576i(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv = test->priv;
 	struct drm_display_mode *mode;
+	int ret;
 
 	mode = drm_analog_tv_mode(priv->drm,
 				  DRM_MODE_TV_MODE_PAL,
 				  13500 * HZ_PER_KHZ, 720, 576,
 				  true);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
+	ret = drm_kunit_add_mode_destroy_action(test, mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 50);
 	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
 
 	/* BT.601 defines hsync_start at 732 for 576i */
 	KUNIT_EXPECT_EQ(test, mode->hsync_start, 732);
@@ -115,20 +130,27 @@ static void drm_test_modes_analog_tv_pal_576i(struct kunit *test)
 
 static void drm_test_modes_analog_tv_pal_576i_inlined(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv = test->priv;
 	struct drm_display_mode *expected, *mode;
+	int ret;
 
 	expected = drm_analog_tv_mode(priv->drm,
 				      DRM_MODE_TV_MODE_PAL,
 				      13500 * HZ_PER_KHZ, 720, 576,
 				      true);
 	KUNIT_ASSERT_NOT_NULL(test, expected);
 
+	ret = drm_kunit_add_mode_destroy_action(test, expected);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	mode = drm_mode_analog_pal_576i(priv->drm);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
+	ret = drm_kunit_add_mode_destroy_action(test, mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));
 }
 
 static void drm_test_modes_analog_tv_mono_576i(struct kunit *test)
 {

-- 
2.49.0

