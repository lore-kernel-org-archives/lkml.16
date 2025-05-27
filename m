Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A45B26A08C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347890; cv=none; b=qn/YacHoC0eRndS7F14eclccnjI9550tj3RCAggx+oZy8XjVZLR5Qe0jy+H8v3/lO8NCz5/de3eJ2opfFcpP7k2m22t3sn8CXTV7Xi2FWJRdj1UgpNrdarpO0nEocfQmoVIpAqO0c6V2Z4f7P2EC4sGCmx3Shs/aK5lC+qYge4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347890; c=relaxed/simple;
	bh=60Q9YGJFxkYXokTEGw8Vd2judhNXO2bs3vTtJNqz7ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P64Z8uuDZyNidRuxdywLZf1mBCgavrkfNem+/kzO29g8V6fnWCrFaDVAx0S/s4sLYC6OL9YQX1tm3UUE5lcXVv0G1kOgu9EczBNVhM5Z2GiAw6ce5LKayxhayuhtAYUJG/25sFejF0Mwg36ecgLmTPmf32EQvSd7E5s5KUnmodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZmvPCFbg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZmvPCFbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347886;
	bh=60Q9YGJFxkYXokTEGw8Vd2judhNXO2bs3vTtJNqz7ow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZmvPCFbgVH6RLKJFItoD4yCwK42ZSHp5TojE4SjO/iPH4CkRGzPI2NJvJHwI065B9
	 MFNd2B8Wmzj5VTVnYhkZYoinElbdQZJn6V3gT6DvtUhSqjWmcRqABLtRtPzyC+ZH5I
	 Cg2eU45N9wKmjjjUrm50mNTzfnTvOl+yLU+W100Ig4hEXGY4G2+VQojSlaUdSXvNOg
	 quyYw/rFGg19uf85wEkLgNDkQndth0QraCWHejF6eL4xqCv3gLWND/oVhXdbgjsjrY
	 Dp4XByf28V/p9qMCXCLs+nR4jGJcoYH74XsPicMRwd6fl7nMgO9B2jgpzfHxW+BuNv
	 P0ehoz4Y3vF8A==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id DA57317E056F;
	Tue, 27 May 2025 14:11:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:13 +0300
Subject: [PATCH v5 05/19] drm/connector: hdmi: Factor out bpc and format
 computation logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-5-74c9c4a8ac0c@collabora.com>
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

In preparation to support fallback to an alternative output format, e.g.
YUV420, when RGB cannot be used for any of the available color depths,
move the bpc try loop out of hdmi_compute_config() and, instead, make it
part of hdmi_compute_format(), while adding a new parameter to the
latter holding the output format to be checked and eventually set.

Since this helper now also changes hdmi.output_bpc in addition to
hdmi.output_format, highlight the extended functionality by renaming it
to hdmi_compute_format_bpc().

This improves code reusability and further extensibility, without
introducing any functional changes.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 60 ++++++++++++-------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 45a650b461abdfa50787a92a9d65f48c97f317a7..a9733a2e1b632e02f535c5ece64762f8ed9e4af2 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -606,45 +606,22 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
 }
 
 static int
-hdmi_compute_format(const struct drm_connector *connector,
-		    struct drm_connector_state *conn_state,
-		    const struct drm_display_mode *mode,
-		    unsigned int bpc)
-{
-	struct drm_device *dev = connector->dev;
-
-	/*
-	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
-	 * devices, for modes that only support YCbCr420.
-	 */
-	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPACE_RGB)) {
-		conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
-		return 0;
-	}
-
-	drm_dbg_kms(dev, "Failed. No Format Supported for that bpc count.\n");
-
-	return -EINVAL;
-}
-
-static int
-hdmi_compute_config(const struct drm_connector *connector,
-		    struct drm_connector_state *conn_state,
-		    const struct drm_display_mode *mode)
+hdmi_compute_format_bpc(const struct drm_connector *connector,
+			struct drm_connector_state *conn_state,
+			const struct drm_display_mode *mode,
+			unsigned int max_bpc, enum hdmi_colorspace fmt)
 {
 	struct drm_device *dev = connector->dev;
-	unsigned int max_bpc = clamp_t(unsigned int,
-				       conn_state->max_bpc,
-				       8, connector->max_bpc);
 	unsigned int bpc;
 	int ret;
 
 	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
-		ret = hdmi_compute_format(connector, conn_state, mode, bpc);
-		if (ret)
+		ret = hdmi_try_format_bpc(connector, conn_state, mode, bpc, fmt);
+		if (!ret)
 			continue;
 
 		conn_state->hdmi.output_bpc = bpc;
+		conn_state->hdmi.output_format = fmt;
 
 		drm_dbg_kms(dev,
 			    "Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
@@ -656,9 +633,32 @@ hdmi_compute_config(const struct drm_connector *connector,
 		return 0;
 	}
 
+	drm_dbg_kms(dev, "Failed. %s output format not supported for any bpc count.\n",
+		    drm_hdmi_connector_get_output_format_name(fmt));
+
 	return -EINVAL;
 }
 
+static int
+hdmi_compute_config(const struct drm_connector *connector,
+		    struct drm_connector_state *conn_state,
+		    const struct drm_display_mode *mode)
+{
+	unsigned int max_bpc = clamp_t(unsigned int,
+				       conn_state->max_bpc,
+				       8, connector->max_bpc);
+	int ret;
+
+	/*
+	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
+	 * devices, for modes that only support YCbCr420.
+	 */
+	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
+				      HDMI_COLORSPACE_RGB);
+
+	return ret;
+}
+
 static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
 				       struct drm_connector_state *conn_state)
 {

-- 
2.49.0

