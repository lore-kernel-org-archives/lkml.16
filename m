Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98432274FEB
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347896; cv=none; b=K3fBtK81HSD+Nu6M5jzom1eIKSICck5qhOu3u7uJH+IqptJhAMGU6PNQteBw97nAtfa0olvT96JL2LvBMFU8jrGEn3LoielKhq+ttxF0glKQNeeMf0nY8H6SY3Qf5hCeZ253t3Ox9JNbsoMhy0gftG9LSplZQv+Hy0HfiLcs8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347896; c=relaxed/simple;
	bh=Uajc0TXmqgnkuOfOebILUOgudIxuBQ++KVKDQhgvIZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXipkTGiPPPrecH1GHt/qgJHOjiqD003iYc9QY8lPlZe/pFoT+ETqKE6hoamEkuwuqvWtaPmwb45YgGRWcuY6ta0ZiRzgbUp8ArbnMGcaLwSxUZII7WsfPS5dAHCkwwJ4uaoG8lAz7PynzzeZN25r/M5HziQmbKAFt79ZYJtQTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fdUyCAyA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fdUyCAyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347892;
	bh=Uajc0TXmqgnkuOfOebILUOgudIxuBQ++KVKDQhgvIZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fdUyCAyA106iWEXOWQuxRKieSa39mtgXBdv1QkOjECxLWZD1WopF4QQIwubhuvrEl
	 ehIDLkzCsHnsaboZAeHe2/7+kJymBaTcVU8mIEbNSWMmEVO3N/ehRkvMRNbDtlTxEG
	 VYE1aUie+EPVggayDKyHUSA4gYLYVLIXHtWGj4psJ/qt1r/LceISjMeDVmTM0SzA2+
	 aMeLry/lakEipH1cG3uPUs2KKGcMGWMUka9GnOvStW9r3AzC82xUWmNU7wTaNNUiWg
	 jdwU2FW3zmDLPf6ze6Hn5ab6ep/+Ow69/UOb1ieBKRlc2c1zhmTGhjRZ5nGoAep4cj
	 0caSYLVHvaz3g==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 9809B17E37D6;
	Tue, 27 May 2025 14:11:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:21 +0300
Subject: [PATCH v5 13/19] drm/tests: hdmi: Switch to
 drm_atomic_get_new_connector_state() where possible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-13-74c9c4a8ac0c@collabora.com>
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

Replace the calls to drm_atomic_get_connector_state() with
drm_atomic_get_new_connector_state() for cases which do not require
allocating the connector state, e.g. after drm_atomic_check_only() when
the intent is to only read the new connector state.

The rational is to avoid the need to handle the potential EDEADLK error
returned by the former helper, which would require restarting the entire
atomic sequence.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index e3e2878d29ea5bfe107a5098d0cbf2653af0bc9b..168fe25529e5861ebee2d8a929f912436c485c60 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -416,7 +416,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_limited_range);
@@ -476,7 +476,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_limited_range);
@@ -535,7 +535,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -597,7 +597,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -660,7 +660,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,
@@ -722,7 +722,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	conn_state = drm_atomic_get_connector_state(state, conn);
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
 	KUNIT_ASSERT_EQ(test,

-- 
2.49.0

