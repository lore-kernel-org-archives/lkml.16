Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD14248886
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576915; cv=none; b=HNq7wl+MmbJoCqorupYFVn7iLYkypHg7TphgnxvJcL4MkAn0j4w0uXiUZQssuV+D7bp/R7ZpSOihznPtVyydG+OXJ3APzZDzyfmXBk/PHa14ogHedw0Gn+jxox2rvsvqO5+OCuye6olELZZzxa20KuVuHeLGSkAll+FXGlEtm4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576915; c=relaxed/simple;
	bh=Q/vtEtALpfzyMl4YZahsTKUN+/4Q4JCgBzlv5eoE6Bc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GUrAb5CoONqNhek5FUoCSvD+nLdpas2cpdNU8swQaTUR9dPvsPGk49ruFeXNcwfhw6BWxkPjc6/2EFNURW+ba4fzPYN5mNhaA5fKj7FJvgVAtdMPzriX2nVBTSNCp8TVKMKRghJnnImdP8sU6QlFsd5Pxl2gQdcsfiAN4AB2tYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J0T31Tpy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J0T31Tpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576912;
	bh=Q/vtEtALpfzyMl4YZahsTKUN+/4Q4JCgBzlv5eoE6Bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J0T31Tpyw9DgNrmeYtmmEkZW70GmfTBew8Muk5+7vAHwYD4xIX/qha2BrxUo7hTi/
	 2r3yMKod3SCOMfaNtPQ76EUpyu2I7ez6LNO/iVfPC0Bg5e5Ypwp4eZcn4pzI59NYiR
	 89MPGuWdJ65rDL0xuvtxJT3gBvxNq11iP+wHQ9ZU9BFBb88w26UeQPEgbp+fcSf5vq
	 rLlDoA0w9Qqw0ysDhalTclnClFYy2dxiqt3j2rLf0CXDcSgUXgfGVtOaIvLStWuCPK
	 xSIDJJs/d0Qzqw8iMI0zuUnzcpQPlZvHQkh5l4wf04Egvpl4Zwborg90gQbG3iYIzG
	 Ksj/ZLW/Ic+LQ==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id EE56717E36BD;
	Fri, 25 Apr 2025 12:28:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:07 +0300
Subject: [PATCH v4 16/23] drm/tests: hdmi: Switch to
 drm_atomic_get_new_connector_state() where possible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-16-5e55e2aaa3fa@collabora.com>
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

Replace the calls to drm_atomic_get_connector_state() with
drm_atomic_get_new_connector_state() for cases which do not require
allocating the connector state, e.g. after drm_atomic_check_only() when
the intent is to only read the new connector state.

The rational is to avoid the need to handle the potential EDEADLK error
returned by the former helper, which would require restarting the entire
atomic sequence.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8c795eeb1090b50993c1907a9fc5bb72baa556e1..ae58d1f747e84f99e72624396af1f51fe498f931 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -435,7 +435,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_limited_range);
@@ -497,7 +497,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_limited_range);
@@ -559,7 +559,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -623,7 +623,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -689,7 +689,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -753,7 +753,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	drm_kunit_atomic_restart_on_deadlock(ret, state, &ctx, retry);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,

-- 
2.49.0

