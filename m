Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A26F245038
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576911; cv=none; b=d3LWI8Iogkv0YxjjB0Vv3D3eNHs0U+apk3cH0OVORDz7cBlXmHMzRWMRF5i0CbJyk2BsY5YGbbP42GMOTV/7AVtQ7fWEKt+fKvy8Y/qupj1zNKmS5mxtL02GNog5OFeG7VPf+n3M2CarBe6eVhea/KL8Nhqg/Yhl3OVbfQVFhwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576911; c=relaxed/simple;
	bh=7+YGBQ+4NGRCaWlLRr/l01wupW6JJX5shiIuSOf1qXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/2inI6obMpB+YalcaBDWRofmnxCYIO5NukPEY4hAFpsPMS6RFJxhNgNA2brJqJwOlWBM3dx+qIVkMFcswxuishdcYDVKw1eD9Vv/fkB46EdFWsDzf6TfIeOQBxv7kuU3fxMqGc3HH8Z5vpSIJv8H0Pa9Bvy/g4g9j4ErTVwVek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R0xOYF7t; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R0xOYF7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576908;
	bh=7+YGBQ+4NGRCaWlLRr/l01wupW6JJX5shiIuSOf1qXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R0xOYF7tG8pzEE6Z0IP/SCUDLQzffOjrQGcgptsppWZBopIJth4E8de6eh604uVPX
	 eSYG1iYkUuNwnI+9ND+BH2sEPcTTki9DDhChClOX4upD2I+DZz9T7O0zNfnf/LvoSI
	 GNetDh645VtJDg9ux8yUXrw2dvoYSzgEcvmMvZ7OJKXjQ2BvxtuhRITFnLHJEojxf7
	 azRwV3hUZJ4nSnjUTgT0F2hqKVgKHJLsnBLEwXsgZfv2Qd3bsE/gY60aHfqrxRC/X8
	 B+vEx+m1vmBiWDXu0uBWKeXcupgXuC6XNbwP3pnuN0PiFU7FlvhQJMLAyAQWySQP0M
	 xsFOdrUqijggQ==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id ED1F217E36C1;
	Fri, 25 Apr 2025 12:28:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:02 +0300
Subject: [PATCH v4 11/23] drm/tests: hdmi: Setup ycbcr_420_allowed before
 initializing connector
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-11-5e55e2aaa3fa@collabora.com>
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

Initializing HDMI connector via drmm_connector_hdmi_init() requires its
->ycbcr_420_allowed flag to be adjusted according to the supported
formats passed as function argument, prior to the actual invocation.

In order to allow providing test coverage for YUV420 modes, ensure the
flag is properly setup.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 6b4000aea2f2eff373c803d95c3304281c879176..323863a24a498d220f9fb73081abfbb00575c370 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -183,6 +183,8 @@ __connector_hdmi_init(struct kunit *test,
 	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
 
 	conn = &priv->connector;
+	conn->ycbcr_420_allowed = !!(formats & BIT(HDMI_COLORSPACE_YUV420));
+
 	ret = drmm_connector_hdmi_init(drm, conn,
 				       "Vendor", "Product",
 				       &dummy_connector_funcs,

-- 
2.49.0

