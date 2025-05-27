Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434526A0FF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347890; cv=none; b=QWXYDeCpmMq7xl+kcHFYkWbYtA1XTwCo6n2Dk3sUPnIOoolxojuCiLKUzzhpavhnwlzHXFlWPlsbpJ6TcH5n/sf1tNgyOBDjfujHHFgjRX000uaNWGHUkAUA5d5P6d4Cq1x9NLbr1qkxxuIat5opCmjZoInHaU0oB00zy6GcuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347890; c=relaxed/simple;
	bh=V8rTl9ii8sCL9VzDqwU9C3Ust3q3I9zLhb7qtia09Sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjoRHUxPZCxAidTaF0jjPPXJMKb5J4fbQIlc+Pc/tBeQLfjVaDOGRXDgBgYMbeQBm2/Di8sHMIEXudlM+l5c/hFQoffM2YbEi5MgxTxfj+ZxtJQHgo9gsRVC18OU5Pp5vmQwfG6vV7khOdsW9kzoc2fr3wNRrOQKYA53blxmJVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EFJ/TVyM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EFJ/TVyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347887;
	bh=V8rTl9ii8sCL9VzDqwU9C3Ust3q3I9zLhb7qtia09Sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EFJ/TVyM8H/ViO+gnxF/M8OgAN0dx0CFAS/dAVNXa7v/vJQVeqUrgi5k8yzCmp47/
	 daucDwbi097rQJL1E8J4b05JgkId7MidV0v9n5OEFJfD4agobPiXjFOAN2NTfqK4vy
	 G/+73W42dpiprrpuqDbqeSMW/I28EWnaubP60huM78XvPAhPAsLpdE7cyPTKaAgl5A
	 MnInmC+lbojUtH3Xv3JTwtfCvUVCQdJwEMtK82+jNGpwfB1i+SQHyxK4JJDXSXxSAm
	 cA3eunW85FYt9FP7xVRksB8NFAQT0mUEyJsoZvEED5+zxncYxhHTEEsoX++52pwBXa
	 FB1056264bXmw==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BDF4117E09FA;
	Tue, 27 May 2025 14:11:26 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:14 +0300
Subject: [PATCH v5 06/19] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-6-74c9c4a8ac0c@collabora.com>
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

Try to make use of YUV420 when computing the best output format and
RGB cannot be supported for any of the available color depths.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a9733a2e1b632e02f535c5ece64762f8ed9e4af2..2c641add743466841cb2e777a07633dc5686ccd8 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -649,12 +649,22 @@ hdmi_compute_config(const struct drm_connector *connector,
 				       8, connector->max_bpc);
 	int ret;
 
-	/*
-	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
-	 * devices, for modes that only support YCbCr420.
-	 */
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
 				      HDMI_COLORSPACE_RGB);
+	if (ret) {
+		if (connector->ycbcr_420_allowed) {
+			ret = hdmi_compute_format_bpc(connector, conn_state,
+						      mode, max_bpc,
+						      HDMI_COLORSPACE_YUV420);
+			if (ret)
+				drm_dbg_kms(connector->dev,
+					    "YUV420 output format doesn't work.\n");
+		} else {
+			drm_dbg_kms(connector->dev,
+				    "YUV420 output format not allowed for connector.\n");
+			ret = -EINVAL;
+		}
+	}
 
 	return ret;
 }

-- 
2.49.0

