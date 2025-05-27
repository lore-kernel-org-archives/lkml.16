Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07142749DB
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347895; cv=none; b=dhqUZTLXz0KUKeBNCSyZ8wVu8o744Eu6mxDEhS7HuHEkf8JEnh+Cl8z2seM7GlyyntlAoO0ikN2M1L5W8pR9tHMbCInJacpSFyMb/xconzcTLH+4YYOsF2AwWSM4GBtDFEVqlGDSQxyTi2u1kFBWLD0BoVxgjTVdaDVZbylOxpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347895; c=relaxed/simple;
	bh=q9WzOnxUTPg/Zdl2c63Tbt+DCpbXd/HVonjfgjlirC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=soHtt9qKUcNoSqYte1CfjsiCBi8UmYGSTNEpOPOvwFK2VTMhEUoxIX0JqMzQdauSVQP9Y0UGtzkiHdmZ6bgJcO5Ddtvh4Moc7W3wKQEvRWK2yXkluVojQp/c7GfL6Q7H6a2K+NCTQhu/audwCbnlNI6G3FchqKT7gRIxdAq8z0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HCfS26OV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HCfS26OV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347891;
	bh=q9WzOnxUTPg/Zdl2c63Tbt+DCpbXd/HVonjfgjlirC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HCfS26OVMTU0wAKANDLsMt9kRoP8+VFbq8f50t8xbUIxjhjRBlNC9Fpvxzd2+kKjy
	 mOI3K9hKksP7/9leOiJbxOemaXY6+1aVrTZyzEJVKdKHfHbZmtvEJ8w5H3D/7f3G70
	 XjDIqpniRJpbA56IwMUOFDMuD0mMyf9SBfFy5jrT2NhrcDe+dGyF35Ca7Y73E14NwW
	 V6IONDg8QT3xFdDyoo4Hpa+meyqcnVG1hMtbUbauUzuLvCu0fI1qo1GP68N9GfyWHC
	 u1puA11cXvb3JRgyQAMF3P1o9mDhK5dCKE26P3BfbzMo2x/a3ZCBBapX6YQbfSzLBj
	 iSh6/cc/aJqbw==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id B9FA017E37D0;
	Tue, 27 May 2025 14:11:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:20 +0300
Subject: [PATCH v5 12/19] drm/tests: hdmi: Setup ycbcr_420_allowed before
 initializing connector
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-12-74c9c4a8ac0c@collabora.com>
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
index 64037110bcaa9713999d77a254fc9377170a41bb..e3e2878d29ea5bfe107a5098d0cbf2653af0bc9b 100644
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

