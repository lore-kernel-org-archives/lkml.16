Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6139A23AE84
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576904; cv=none; b=kUPEitg2A76LZNBiL96wqBt/fipc8F9fXDPAfoXb8P5+9869C8RD/dKP71lg0NjedeLgypfr9kU8ufAgGUfDJaJ2+apcsF6w9fxrFoklfzYtYnLFoTMAmh4BrskskgnO3Z/MYAR9hq7yAFEF0pN7dgMDZjNZxjGLXUWjTLA5vrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576904; c=relaxed/simple;
	bh=hDK8q5L8c2jNpElW4zgOcFPPJjn+VRZ7mQuf0zc2rAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJASREYdXhmNmE/scvw+D7fjiwBXK7RvJVTW76i/JaDP/uO3pkUMywEg4eie0OBzPLGRB/LzaRBVCbkrOeVLx9JlN0IKPVPaPdQFQSOcsOISwehzWoLX13MNuCyKcKCgtkqlJP34LNpipS9ogU72ThWa5Zyccz+/cjY7REyDitg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jjnBbSXV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jjnBbSXV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576900;
	bh=hDK8q5L8c2jNpElW4zgOcFPPJjn+VRZ7mQuf0zc2rAA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jjnBbSXVImcY3mqQSVL78JWDQ7lD3DeSQDP8LDNyR2yRwgwluDFuiZDgWUCw1X4Gf
	 PEI2rEsHDyIF4asAgcdUVc3nVlbTUKIClHiaHjtDkuQncDs7M3bkLhU8HFl4lD51ql
	 2hMiRgkGFI0F99smXsS9q2r/RFwlHUzsHG1k5yBNzxjBQocBTqA5ipYuyT4TVm1CpA
	 dR6Hlr3gK02PjYjWD6JGR3dLRaRz8Z3F76MNKxe5XEfGipGWiyClmp2Ryf0l4rEPGO
	 9y9mlKF/oLD/1B2VWyxOY8ZUUJhaITwdkjK7mlCJveJAXFcuCHv7cNiCBJV1McBedb
	 aVrqbN4oyfOjQ==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 8051417E36BB;
	Fri, 25 Apr 2025 12:28:20 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:53 +0300
Subject: [PATCH v4 02/23] drm/connector: hdmi: Add support for YUV420
 format verification
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-2-5e55e2aaa3fa@collabora.com>
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

Provide the necessary constraints verification in
sink_supports_format_bpc() in order to support handling of YUV420
output format.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 39 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 45b154c8abb2cc731bf4be472e58815cf47463d4..eb284032ea794838f333ce639243540fca91dbdb 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -3,6 +3,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_modes.h>
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_audio_helper.h>
@@ -407,6 +408,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return false;
 	}
 
+	if (drm_mode_is_420_only(info, mode) && format != HDMI_COLORSPACE_YUV420) {
+		drm_dbg_kms(dev, "Mode can be only supported in YUV420 format.\n");
+		return false;
+	}
+
 	switch (format) {
 	case HDMI_COLORSPACE_RGB:
 		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
@@ -437,9 +443,36 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return true;
 
 	case HDMI_COLORSPACE_YUV420:
-		/* TODO: YUV420 is unsupported at the moment. */
-		drm_dbg_kms(dev, "YUV420 format isn't supported yet.\n");
-		return false;
+		drm_dbg_kms(dev, "YUV420 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR420)) {
+			drm_dbg_kms(dev, "Sink doesn't support YUV420.\n");
+			return false;
+		}
+
+		if (!drm_mode_is_420(info, mode)) {
+			drm_dbg_kms(dev, "Mode cannot be supported in YUV420 format.\n");
+			return false;
+		}
+
+		if (bpc == 10 && !(info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30)) {
+			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36)) {
+			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		if (bpc == 16 && !(info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48)) {
+			drm_dbg_kms(dev, "16 BPC but sink doesn't support Deep Color 48.\n");
+			return false;
+		}
+
+		drm_dbg_kms(dev, "YUV420 format supported in that configuration.\n");
+
+		return true;
 
 	case HDMI_COLORSPACE_YUV422:
 		drm_dbg_kms(dev, "YUV422 format, checking the constraints.\n");

-- 
2.49.0

