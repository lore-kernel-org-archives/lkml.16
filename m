Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB5F2505BF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687226; cv=none; b=l2BG6tI8ZgJm80fazyqPPJWMkZ3/4lvVHZ1M7tLWVJ1PWUUtKltEa/DtNnzZN8iKbvO2ZVPSv3oRgCP3sJaiTuBIJV99fZWNRWElNSSEGOZwpAqWP3fkX+HXaX9SuBK5+wLxxHVTJxzy+fyVSdMMehgn7n1n0Nn7yNsoRyJySjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687226; c=relaxed/simple;
	bh=nMRbYAhzi3enpxzVWvpdbPA24kzrQi4IdGrQ69iIiXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UN2TjvRQebmBt+IwT57djsekbDIR7siAH8tYahNuV/9xnbOvgPXwzm8bkCDsr4F6M/4LKX40T2LPq5wElO5rKs45lZaFkB2u3mCTZx0UTJoLsQONp7h+w4sNodNZeJEjJ/9zyeB77x0UDKtzyFRmLMpr7+ZgoOFf3Ike2ZMitOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uh8OhBy+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uh8OhBy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128E8C4CEED;
	Thu,  3 Apr 2025 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743687225;
	bh=nMRbYAhzi3enpxzVWvpdbPA24kzrQi4IdGrQ69iIiXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Uh8OhBy+yWs2hAhTylquklZOGQ/W7Y3EUaHYY7PMf1SQXvYb5xu9QoLv8M18gj+cZ
	 OfM6JLRFp/uU73pr7grNCuVElwaT4FcL4Vitexze99M9Z1/62v9U4hgpeyTRBSmoaZ
	 l4Wlj52mQ/zjpefezL43jtD95O5St4+3Rqzk/UXXJD9mNmz6BMKEue2tpki7o3IxIQ
	 xD+pephrLBVBfQzGpp5WboeElWrDEkSrbDAVSlqHCdAk0ouNOsyNWP1K7XFITsiRhr
	 iId554RZ+VEE1QLqrY2eNDsloOUw39r90iYb5zxmxB9NhhpZSYGhEzzwv3CsXTqdtE
	 Z2r1C2mtWWGaA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 03 Apr 2025 15:33:30 +0200
Subject: [PATCH v2 1/4] drm/vc4: tests: Use return instead of assert
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-drm-vc4-kunit-failures-v2-1-e09195cc8840@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3363; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nMRbYAhzi3enpxzVWvpdbPA24kzrQi4IdGrQ69iIiXs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnv+gz3h1xKWRZ2syrt7q/t/23sxZexTOxlXpOnPd/G9
 Vz8tZVHOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARN09Ghs3zp7z8kPU+6/pG
 9b1vF7OfM3Xd56h9If4D08L1T0Km5qgyMpz7nz7Tcb9b6c/Lxi0Xha0qT/iyBIYdqLt04OEVFu7
 ZjjwA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The vc4_mock_atomic_add_output() and vc4_mock_atomic_del_output() assert
that the functions they are calling didn't fail. Since some of them can
return EDEADLK, we can't properly deal with it.

Since both functions are expected to return an int, and all caller check
the return value, let's just properly propagate the errors when they
occur.

Fixes: f759f5b53f1c ("drm/vc4: tests: Introduce a mocking infrastructure")
Fixes: 76ec18dc5afa ("drm/vc4: tests: Add unit test suite for the PV muxing")
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 36 +++++++++++++++++++----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
index e70d7c3076acf168782c48301f3b3dfb9be21f22..f0ddc223c1f839e8a14f37fdcbb72e7b2c836aa1 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
@@ -73,28 +73,34 @@ int vc4_mock_atomic_add_output(struct kunit *test,
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
 	int ret;
 
 	encoder = vc4_find_encoder_by_type(drm, type);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
+	if (!encoder)
+		return -ENODEV;
 
 	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+	if (!crtc)
+		return -ENODEV;
 
 	output = encoder_to_vc4_dummy_output(encoder);
 	conn = &output->connector;
 	conn_state = drm_atomic_get_connector_state(state, conn);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+	if (IS_ERR(conn_state))
+		return PTR_ERR(conn_state);
 
 	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		return ret;
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
 
 	ret = drm_atomic_set_mode_for_crtc(crtc_state, &default_mode);
-	KUNIT_EXPECT_EQ(test, ret, 0);
+	if (ret)
+		return ret;
 
 	crtc_state->active = true;
 
 	return 0;
 }
@@ -111,28 +117,34 @@ int vc4_mock_atomic_del_output(struct kunit *test,
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
 	int ret;
 
 	encoder = vc4_find_encoder_by_type(drm, type);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder);
+	if (!encoder)
+		return -ENODEV;
 
 	crtc = vc4_find_crtc_for_encoder(test, drm, encoder);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+	if (!crtc)
+		return -ENODEV;
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
 
 	crtc_state->active = false;
 
 	ret = drm_atomic_set_mode_for_crtc(crtc_state, NULL);
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	if (ret)
+		return ret;
 
 	output = encoder_to_vc4_dummy_output(encoder);
 	conn = &output->connector;
 	conn_state = drm_atomic_get_connector_state(state, conn);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+	if (IS_ERR(conn_state))
+		return PTR_ERR(conn_state);
 
 	ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	if (ret)
+		return ret;
 
 	return 0;
 }

-- 
2.49.0

