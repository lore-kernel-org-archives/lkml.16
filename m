Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F992472A2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576913; cv=none; b=EJBRWPETcstemR6PxOQG+46k3WZ9Xy9t2swbxgR10mAiycNdABlqr4YuQFOw49n4h4+5XjbkpwiqOgIQwjntLWhU76DHl1ytPDEJpLxQakIBZU0Bdgmcv4x93/Bksyd98dLokneno1QjGzIC5okUmTuutB+zCEpndvdUxtjzMNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576913; c=relaxed/simple;
	bh=4bCuo8I0N9kkClNNsRhMoODRyFWJSCvgIJ70e4FtooE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dcWMkj3hw8guHaWtNcyXlMfHFMMHhp/NvZkjS8KGsbAAHJLed0fYnP1gRhO7hQ7H72u08BDh8LIDx0UkO13zxSUcJUJYgCQUV6n4sxp+CSMIkcwp8ykGwtLvOMd8ET8pfKX87ZXfyKmMvz1Nzbznqch7RPyke2VDJ5NmgJd/U4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g7WDcY9c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g7WDcY9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576910;
	bh=4bCuo8I0N9kkClNNsRhMoODRyFWJSCvgIJ70e4FtooE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g7WDcY9cT4O8ok2yvNfhnyNv14PzrfhHHjoxmGkq3xVxIl5BE+AQJpQAV0wdxB0HA
	 zxwEvuR4wruJWGdOnHS7xcAYoa3cUtOeDqPithtMylR1Tzk1tf/XSGcrBNHQTXhQdf
	 ysiFs2bS+hP2I65Hqxa8Wcdh7kEfOQtN+I0Z+DyGk2whl9QGsaQlhZZMvc/QcGVU+6
	 Torph6RqIeO3wsbLizJNTQR1ru/6hlg++1D8BgAISy5knQQR1NepY4qqqnS9csr0bn
	 MaQCqZvQpN2pMbVQYoHtRNm1tHXoWNUrBdosKadA6JamSpSObzQZ3fKq/StlQIlvtX
	 kieUvcjhM6wZQ==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 61F5917E362C;
	Fri, 25 Apr 2025 12:28:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:05 +0300
Subject: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-14-5e55e2aaa3fa@collabora.com>
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

In preparation to improve error handling throughout all test cases,
introduce a macro to check for EDEADLK and automate the restart of the
atomic sequence.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c8969ee6518954ab4496d3a4398f428bf4104a36..c8bb131d63ea6d0c9e166c8d9ba5e403118cd9f1 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -224,6 +224,16 @@ drm_kunit_helper_connector_hdmi_init(struct kunit *test,
 				test_edid_hdmi_1080p_rgb_max_200mhz);
 }
 
+#define drm_kunit_atomic_restart_on_deadlock(ret, state, ctx, start) do {	\
+	if (ret == -EDEADLK) {							\
+		if (state)							\
+			drm_atomic_state_clear(state);				\
+		ret = drm_modeset_backoff(ctx);					\
+		if (!ret)							\
+			goto start;						\
+	}									\
+} while (0)
+
 /*
  * Test that if we change the RGB quantization property to a different
  * value, we trigger a mode change on the connector's CRTC, which will

-- 
2.49.0

