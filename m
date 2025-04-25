Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6224C068
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576918; cv=none; b=I4eL23abbH0nwjabvQMxSbX0AUC6k5bb4qKt8Sfcme2Ci2qldvw4eVzVyIHG9p8p2qMWhlJx3WIffM2NYRw/y1wHXUEL4N5vEAaOHNv4nKWQvaGipBvhGfoi0GStYwDj0M6fg53Y+N3gy+7Y+q+W2aSbIZvwWwxVQm4YNTOdsJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576918; c=relaxed/simple;
	bh=Ru4SuCX08vOXduZ4SmjSPm6UxW9W5DJ2U+xBG6H0qIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwOTpiBGPq49H6ORNa4cmxrkh2jetupXw5zaqr/l4mNQHpJnmzerUulZQX0Zc5mRRZxBi5K8uWp9Hclfv876gG/3YfvCwyukdbBVb1lD++ax7qoZFGehE5nhJMr3TLaAQopmweAv6nRLipsJrj5El3vZK4YdpSFu1gfdCeIelT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WjO2TnLy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WjO2TnLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576914;
	bh=Ru4SuCX08vOXduZ4SmjSPm6UxW9W5DJ2U+xBG6H0qIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WjO2TnLyaOutpa406wZXjWnScLFIwzKhD15gW5RaI7m3rjwK5+7YGoS+l6RRzBFs0
	 twafr1lwnq1c0oVQfF7xOaYSP9wbkbEHoAPXKs3DP5jSOcjjZX3/qlYKJdDsV9OTfP
	 ws8+VT8xUrKQWiy/uLigMxkTcsWW/vJoeSy4/llxgeiXoRaMxc3b8zZpyV85KuHovS
	 ITOyx4aQ3Wj7Qob2Dw62cM/cyUZtWikDcmYmKKc5W2JUqy+cxr0i7wDpPmUo34W0fo
	 8pIRGwtSQ5vm5lzUmPFlMWcRKOk+LTYjMvzzHWkbGM80rMdfs7k7yamLpBJkTBnbfK
	 0bSrC6JnXFnAw==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6828B17E362C;
	Fri, 25 Apr 2025 12:28:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:10 +0300
Subject: [PATCH v4 19/23] drm/tests: hdmi: Rename max TMDS rate fallback
 tests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-19-5e55e2aaa3fa@collabora.com>
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

In preparation to extend the max TMDS rate fallback tests for covering
YUV420 output, update the rather generic function names
drm_test_check_max_tmds_rate_{bpc|format}_fallback() to properly
indicate the intended test cases.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 6dae9a56bf1bccd39f6b79f6ad9f943538d0ad36..faec7aa6fd55faae2207072b67ef3d372dc1695e 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1278,7 +1278,7 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
  * Then we will pick the latter, and the computed TMDS character rate
  * will be equal to 1.25 times the mode pixel clock.
  */
-static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
+static void drm_test_check_max_tmds_rate_bpc_fallback_rgb(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_modeset_acquire_ctx ctx;
@@ -1347,7 +1347,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
  * Then we will prefer to keep the RGB format with a lower bpc over
  * picking YUV422.
  */
-static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
+static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_modeset_acquire_ctx ctx;
@@ -1803,8 +1803,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_disable_connector),
 	KUNIT_CASE(drm_test_check_hdmi_funcs_reject_rate),
-	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback),
-	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback),
+	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_rgb),
+	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_dvi),

-- 
2.49.0

