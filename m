Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF99523D2BA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576906; cv=none; b=Ilqci8Xu2UQAYMnHc9DLQ/xwHiS0NhHES0eCLrvIiAIgd7M2FD5R1PPNwUDd9Fhk6gCMUBgXnaMOXM3H89q0xAp3aUqE6bEEKn/cdU/K/Kwik/71nqpz6Qf5nftXnemxIu9Mw888DHJxYg1DXZfG9K6jT4td9GZ+HgNiehJz8Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576906; c=relaxed/simple;
	bh=hQYEKr2zXDxP9bu34k8zWrcza/c11kUeCIqH5XVu/y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQHVlEdEmh4aqrCYQ6PC6RBleovSNQBtzoGD+J2zXsXDE3Fx4TWM2AvcRxWByqCKOqtXyKzVSGEEzmfegtU1TSdvModM9TD9uDfdmJ9BSGnhWC/tGaQ1HAgkx0pwIcIviWIgf5v5s6QN2uSlgcmKNiMU9gM/Xap+jp5i2ZeiMTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H9yDFzh5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H9yDFzh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576903;
	bh=hQYEKr2zXDxP9bu34k8zWrcza/c11kUeCIqH5XVu/y4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H9yDFzh5asVWhzjinXRaId1sFKkA1jIJldFHV34fEGDJIQj6w8MbOoaNw69Hbjn8B
	 Q33QUa3IufkXd8+diK+u+gV09GeiRFTYKgpPq4kMDL9cjekF511sAzKg5enmU69cR0
	 qgHxsfCayhrYQy89/ec+xKfr9pANUzRjGhUJFPcKcp9IVxWNdXycYisAKw3AunJwhK
	 yK3vbjTLwJEeWoP3w0ZkOcCc4M1bFi7Qcwl2mTBECCBGMKZUHee9WYY3v1mCFIX1WU
	 2D4rG7wpzXST86YraDYd2B1hHphqO2nRxt7srY6msLiMtquDT5P46X46tj3p5hDUaU
	 2LOH7+xY93ozA==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id F184D17E36C2;
	Fri, 25 Apr 2025 12:28:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:56 +0300
Subject: [PATCH v4 05/23] drm/connector: hdmi: Factor out bpc and format
 computation logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-5-5e55e2aaa3fa@collabora.com>
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
index f54eb5c594cddbd67dfacb5e06d54e9ce7851013..9e0a468073acbb2477eff1abef1c09d63620afaa 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -605,45 +605,22 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
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
@@ -655,9 +632,32 @@ hdmi_compute_config(const struct drm_connector *connector,
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

