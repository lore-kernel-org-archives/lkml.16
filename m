Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08121DE2B7
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739108489; cv=none; b=crmVlTk3QVaYQSaUbdfWMURpyxs7YOoSpEl43FtyENIXcDGJSbyC+p/O/jnb32FQTtEA4dgto2SWAUHC3sZG55BZWPLmYAiHiwt2HOEgKQHb052OmoYHSL1lM6cTq0StUGxek727A6iAt78ImbPuTwrxmVl/WzSmSCbB0sw0Ggw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739108489; c=relaxed/simple;
	bh=mpzXyzeB8MzX6qw01rpg9ImZYnr1dtKSgAZWq7ewrIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLkJMlehFTf9+yjquejSneLw7SWuvY5SaHfvu8vXlOFd2BEY13cJPvg/5SpT5NRnoskmGlr4AiCZ96/O2TpFsivuqmnBotoQnG+MFTwnTFvodI/olEubmD7CqtqwSJUSqD5RrhmaA1b160uc7AMTMGS4E/nuEC/okOFf9yc8irQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZFMFkKfA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZFMFkKfA"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5450cc1669eso82180e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 05:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739108484; x=1739713284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXvHeC1Yf2GuOiuplAspcKQmKn7+kgoDshB/4Jadi1Q=;
        b=ZFMFkKfAkoreGg2qmw6tPz1DY5y9qLlsqEJ0c5C8gdamRlxWocgs/SgxlPuAPU3T4p
         +M7peNYfETCoaZN3SotpPj02uRpIrs4lJWlMoiTrX5pRfMDfQR2RNy2xFMLLzkxnt9rD
         k4NsPBl4SlNlcvGwjqZbfyp+++KfMhdGecZMffb7zh7i6RJhDkyfs59TyDkKllLZXXZY
         tqnr+mnzzSOMxxaGB3Afs5KLVEYmF2bjVn/nu/cVETL/nHucMb54+Lvj740OaD9WSco3
         vdt5cNo2FMAeow47Odu2B2NqvuvCwrV/3phYZ6sQNHct+IBEhiD1dPKgWht4jpYvl6Hq
         0Izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739108484; x=1739713284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXvHeC1Yf2GuOiuplAspcKQmKn7+kgoDshB/4Jadi1Q=;
        b=I59uy7UKmFWayQYMItfB7J3xB2Fdj93lYiQqZgzwzMW+1hPGSCNcZkwbFBEDE632Ul
         UZn66Lk8ynH+ueP9p8ZFOYMPQmvoej9ds5yvcViSP1YoGa1wmm3PNnGbEJKWCX5ZLnTs
         1yqlgx82sydhLAtGvYGauXQ56pybsLFF0Zrko345VLVB+j4oPv2RqgKhXlwHpbcfal38
         RDN3GrH1eMY+brJElNhSewmN3FCrKCIEr8BgSInZdDoVPL3UWWfdoKPPhAKh23ffw7af
         g7qrV+qCmWNrCFWaqKQ4IBLHKnVwTZr1RYxZ8z3tCy0YWvmODqjCRV7XQPzyrzRN/WXF
         UOdw==
X-Forwarded-Encrypted: i=1; AJvYcCW/hpF0P9tjEn5bw++o5B7qCBN0XwTLcCWC/fUD3kweUEZ2/mjiutzVGbO+c/Czqdk6TeZu7gp6nLw1kPM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7L1xazOSl1yN9MmLD0HfybVurue7sK0C155fl20hVZEi9Iif
	trKya54Ji4c4kKZ0VBFTEilrbs79jzKEDqX5zWv7gvT5SAg71bEFAGMQrHizazU=
X-Gm-Gg: ASbGncu4qIxGcCqPyM6DrFmsLln6yUy02a5cxvixyd0jjysxIb0GL2av65QGES+7xCm
	FOQVYjeBCd6qva04mm+mrTyK7Kd0bTa1k9lQSu6KIQUEJvytsVfO+Fs8YR4/4zGUocPazM4EH9U
	H4criE8uJ8adg/CdB7KgSKqiasyI0HNkEsrJe79TIeWkArbqxxPMnCJBBIvGpDIfTme1BYiMvng
	ofE/rApzP9wcF0Aws10GWvmgTUAovuJ4oHUv1RKMtSv49IpEcmB/I4T/rw6YgUOr5r57EeW4c19
	kWp4VDflXUsRLI8sXnrnQZY=
X-Google-Smtp-Source: AGHT+IFfWR4dVE7Cp59mLMpuwlAs8llhkbly9sjeAkaRfVljjLw1MFuB0NCAsLP3fdi6iyWTdSlnGQ==
X-Received: by 2002:a05:6512:3288:b0:545:5d:a5c3 with SMTP id 2adb3069b0e04-545005da7eemr1795633e87.4.1739108483912;
        Sun, 09 Feb 2025 05:41:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545069b3f77sm362914e87.63.2025.02.09.05.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 05:41:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 15:41:18 +0200
Subject: [PATCH v2 1/3] drm/display: bridge-connector: add DisplayPort
 bridges
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dp-hdmi-audio-v2-1-16db6ebf22ff@linaro.org>
References: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
In-Reply-To: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5826;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mpzXyzeB8MzX6qw01rpg9ImZYnr1dtKSgAZWq7ewrIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqLB/MpuXYwXU8Xj/Lh0xVwrD3W64fefaVBNlZ
 JNVGPX71heJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6iwfwAKCRCLPIo+Aiko
 1ecxB/47Oce9OKy+1aFzInu1wh5qqasUXCpnLE4Z8APX+W3GlNn8p7bwQe1P3yNVdCndtot1S4s
 3TuLj2naiOr0bEZekqzjOocybKNuztrAZAaYpQJ87HbDhyF0rXQ7F9PpipsyVqD6fPhJMGd9jZi
 4A1FR0fMJuXTccfi3sKI44hcFTGIEqOkIrtPCq7xXs7PULA6H7adC/ezkC9WqVmtmDhU968w66M
 EGzmUlqS3sfBOtfmSpKbwS02w2uYW3iNYUS4jD5ntqZXpkCFr7C2M83xsrwp8wbTOWS+4l4pyl8
 PCkkfg4j6GgsgIKp806ySbNov4JdUMj9oZ4wLgK6q5gOv15j
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

DRM HDMI Codec framework is useful not only for the HDMI bridges, but
also for the DisplayPort bridges. Add new DRM_BRIDGE_OP_DisplayPort
define in order to distinguish DP bridges. Create HDMI codec device
automatically for DP bridges which have declared audio support.

Note, unlike HDMI devices, which already have a framework to handle HPD
notifications in a standard way, DP drivers don't (yet?) have such a
framework. As such it is necessary to manually call
drm_connector_hdmi_audio_plugged_notify(). This requirement hopefully
can be lifted later on, if/when DRM framework gets better DisplayPort
ports support in the core layer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 66 ++++++++++++++++++++------
 include/drm/drm_bridge.h                       | 14 +++++-
 2 files changed, 65 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..5e031395b801f9a1371dcb4ac09f3da23e4615dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -98,6 +98,13 @@ struct drm_bridge_connector {
 	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
 	 */
 	struct drm_bridge *bridge_hdmi;
+	/**
+	 * @bridge_dp:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP_DisplayPort).
+	 */
+	struct drm_bridge *bridge_dp;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -496,6 +503,25 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
 	.mute_stream = drm_bridge_connector_audio_mute_stream,
 };
 
+static int drm_bridge_connector_hdmi_audio_init(struct drm_connector *connector,
+						struct drm_bridge *bridge)
+{
+	if (!bridge->hdmi_audio_max_i2s_playback_channels &&
+	    !bridge->hdmi_audio_spdif_playback)
+		return 0;
+
+	if (!bridge->funcs->hdmi_audio_prepare ||
+	    !bridge->funcs->hdmi_audio_shutdown)
+		return -EINVAL;
+
+	return drm_connector_hdmi_audio_init(connector,
+					     bridge->hdmi_audio_dev,
+					     &drm_bridge_connector_hdmi_audio_funcs,
+					     bridge->hdmi_audio_max_i2s_playback_channels,
+					     bridge->hdmi_audio_spdif_playback,
+					     bridge->hdmi_audio_dai_port);
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -564,6 +590,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EINVAL);
 			if (!bridge->funcs->hdmi_write_infoframe ||
 			    !bridge->funcs->hdmi_clear_infoframe)
 				return ERR_PTR(-EINVAL);
@@ -576,6 +604,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				max_bpc = bridge->max_bpc;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_DisplayPort) {
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EBUSY);
+			if (bridge_connector->bridge_hdmi)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_dp = bridge;
+
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -612,21 +650,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (ret)
 			return ERR_PTR(ret);
 
-		if (bridge->hdmi_audio_max_i2s_playback_channels ||
-		    bridge->hdmi_audio_spdif_playback) {
-			if (!bridge->funcs->hdmi_audio_prepare ||
-			    !bridge->funcs->hdmi_audio_shutdown)
-				return ERR_PTR(-EINVAL);
+		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
+		if (ret)
+			return ERR_PTR(ret);
+	} else if (bridge_connector->bridge_dp) {
+		bridge = bridge_connector->bridge_dp;
 
-			ret = drm_connector_hdmi_audio_init(connector,
-							    bridge->hdmi_audio_dev,
-							    &drm_bridge_connector_hdmi_audio_funcs,
-							    bridge->hdmi_audio_max_i2s_playback_channels,
-							    bridge->hdmi_audio_spdif_playback,
-							    bridge->hdmi_audio_dai_port);
-			if (ret)
-				return ERR_PTR(ret);
-		}
+		ret = drmm_connector_init(drm, connector,
+					  &drm_bridge_connector_funcs,
+					  connector_type, ddc);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
+		if (ret)
+			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..40f37444426b1b8ded25da9ba9e2963f18ad6267 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -811,9 +811,21 @@ enum drm_bridge_ops {
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
-	 * drivers.
+	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
+	 * chain is also not allowed.
 	 */
 	DRM_BRIDGE_OP_HDMI = BIT(4),
+	/**
+	 * @DRM_BRIDGE_OP_DisplayPort: The bridge provides DisplayPort connector
+	 * operations. Currently this is limited to the optional HDMI codec
+	 * support.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
+	 * chain is also not allowed.
+	 */
+	DRM_BRIDGE_OP_DisplayPort = BIT(5),
 };
 
 /**

-- 
2.39.5

