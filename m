Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267681DA2FD
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498057; cv=none; b=HQ++ds9zNMX+zF4TbQMQVR7ruC/+aCp+cANL+mmbQ8DmX6meDMXa+uc+g0H/aliZG+AJDkHPRYO7FNI4h5uRI8jIgptjawiesNs1YiPT2S8IfTWaY8m3gR0SIJ7KyMn9+9gwAdsZJRWQ6FmtK6EG0qq//i3G9Y5ijY+OIt1RSJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498057; c=relaxed/simple;
	bh=0Zce2MHZUThwasIdDT6Yj7aAuEOuVKLQ5WS8bTZxlU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IYq5WWZTwwQbzbVpzuGnZmpokMNyConD9pAQWa9QfqHMRm7SGmNHvM8QsxmyLRp3SRhtPOgHMiTL9Ts5uKh58gh6iL102dRs5V8CjQfEQS4ZBbBH1TL2UHeNjf/v4vIm1GWwjjQQ6Gb/52cXgpKsfaVcUDJqkE+qROj0bUsbQ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m+hqhDPu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m+hqhDPu"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5439a6179a7so3637936e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498053; x=1739102853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsVgp1pNTXgcNWpTze5zyA6a1PWwEI2e/0X9lqFORpw=;
        b=m+hqhDPuZWdioman27KAkiNUJC66T0/xhmMPif218GsmpgFFJgwRzPyAcftbCgs0b5
         6RgMO9IPTaUH2hsfUI7Vb1lpudXcFESgCtSzB86/knZYE8Ufj42ET3PWHb8huWuRkhTO
         CoAts29SbExe1bMcsWvzx2qt3rXILVDMB17PtlUWYW0J6oM6sQUcIrX9WCqzebzNYfFh
         cWwh1kuohOXJnV+Z3a4AiQM4SUUAns3QIWObWBnO4GbswqVCwHcFNhERLqI9lVofj8LZ
         uo5VhtXr8QvLRWC5/1Z2kfpVlJL8zQpj2GqB9oAPdJmpkCtYBM9fe0nZqXs7WEsgs7V1
         K33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498053; x=1739102853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsVgp1pNTXgcNWpTze5zyA6a1PWwEI2e/0X9lqFORpw=;
        b=LiFNwZLlQw3YAiV7X6y8roEfr/0bSbZRSDLp6DoAhwPo1PX9iNFn6Omvb08wtcjeW/
         rGUqgX7TiaRN83C75aYyVJ7gi9IY0/r2K3Hcxdg0AzGF+g6eUtPc59DnATt2QAHG/gWv
         8my5bCROf7kZSVfV+LGeRw9oJa6TNJaf3ur0TmKZ0rMRXWRV4P57gp3PGIqXAnB5Sxzj
         /7enLiVgnQSf6Fc1QAjl9HL9+NcAmPlT/y0PBFV+ydsU/pLbyOBnxuHhg0cHx3CQO+QV
         xbOEIZxKGNzXKfdnIHHZElh80eCUm4FkAi7jikBUzEQzMOKl5ahXAESfiVDYSS0O+5zf
         eGLA==
X-Forwarded-Encrypted: i=1; AJvYcCWyNeTt7n4UhPuYuasmAxFkcdG0gQjLLubMyb/EEY/nDIslMoZ6nVm1CpoesI7txZymt4lh3du65Yv5pDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYzrcIE5TGxONdFTGU9YYKB+gTsDfIsbCvxNoRZLL33TlqdbN
	iD+C4T4MJz44NP2jMXeucEIBzkckPx3W74F+u4X9avZhBCqwmqNg+mS23JTY4BA=
X-Gm-Gg: ASbGncvvESCGyIO1pkDWBBX8k+VyBwX6tCJd8dSazkXfFSZDVmlMmJxUokIQKR/QRVL
	GIHC2FdocB/wOS6LacYYjk+kqAjYE88bgKJ+O2vqmehvZESHErfKNuHPxmJYZg4aPiL+H6SFNnO
	NC1VpVNp4MC09bl3ZOnfZnV5bKTRURcdajzBPA/b5sTkfJy+hE0KRbbPM8fRmnskHPeYLkqG9VU
	gVMtgszDpgw12S1fqkDh8HPgGyOzeIGUqO0sPIUAa318MIzGIgwZVLZ6sfGd+xufOUqHvUUDsaa
	F2akMGZiH/ZUrHWR6wCo1Mg=
X-Google-Smtp-Source: AGHT+IH7oEk4SHP2d+vsxmLK49lixNRWAPfIkqrNwkwhCJ0IBozqe3pGshBvPVntmxxiEl5p0wn0jw==
X-Received: by 2002:a05:6512:33cf:b0:542:986b:de08 with SMTP id 2adb3069b0e04-543f0f3ef1bmr2840275e87.26.1738498053262;
        Sun, 02 Feb 2025 04:07:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:14 +0200
Subject: [PATCH v4 07/12] drm/display: bridge-connector: hook in CEC
 notifier support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-7-a71620a54d50@linaro.org>
References: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
In-Reply-To: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4248;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0Zce2MHZUThwasIdDT6Yj7aAuEOuVKLQ5WS8bTZxlU4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/v2814W6wzHi9b9UxiJ3usIcbsVCSnxz9Io
 6eJUmccRcWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7wAKCRCLPIo+Aiko
 1VlnB/41c1gxQJ0w6maHBjQWwKZYqsk4UYRS7Tf/wuIhPJ91XlzjsXZxKE63cJvrEyg+PWD6Isd
 +6Ut7nn26cOjhLkWUOgySHH2iwufdpSt4BObRsC+j8+o4PNj/i5ArOtR1Uu3EGU3qPH+VQg4CfK
 HV+t5WonR+tif/VvS43aMlj8Twl2OYzRfe4Rcr9JOnS0FiedLnDQL9pFrVBgSkv5ingRl7DtL/k
 mmjBUE4KK6InYMt+gL52cRBF1FMyZpHbFfgpUfMBsZFlEMyDa9L2ornVn79lNlTknSEuhy8dLY+
 kJf380Tx5seBhxkjnd0vpOM2Y5K99HDYfJkYLdljb2zIeQPc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Allow HDMI DRM bridges to create CEC notifier. Physical address is
handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
being called from .detect() path.

The drm_bridge.hdmi_audio_dev field is renamed to hdmi_dev to facilitate
that it specifies just the HDMI device, common to both audio and CEC
implementations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 11 ++++++++++-
 include/drm/drm_bridge.h                       |  9 +++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index e650cd83fc8d880012edb8a85c69b2f1d378f64c..41156aee5d9f1ecd7bd3f0aeb866487325063c11 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1138,7 +1138,7 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
-	lt9611->bridge.hdmi_audio_dev = dev;
+	lt9611->bridge.hdmi_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;
 
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 3b8fc8f99a3d89741d863749c52167beaf7be2e6..adc4e2f48a20f6702f2b4729d1e720a5f27647f6 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -17,6 +17,7 @@ if DRM_DISPLAY_HELPER
 config DRM_BRIDGE_CONNECTOR
 	bool
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
+	select DRM_DISPLAY_HDMI_CEC_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 0397e62f9cbc93321caeae99982f5e3c66d308c5..9f234bc647d5c0880d4c42aea130074b7fa54573 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -20,6 +20,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -616,7 +617,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				return ERR_PTR(-EINVAL);
 
 			ret = drm_connector_hdmi_audio_init(connector,
-							    bridge->hdmi_audio_dev,
+							    bridge->hdmi_dev,
 							    &drm_bridge_connector_hdmi_audio_funcs,
 							    bridge->hdmi_audio_max_i2s_playback_channels,
 							    bridge->hdmi_audio_spdif_playback,
@@ -624,6 +625,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			if (ret)
 				return ERR_PTR(ret);
 		}
+
+		if (bridge->hdmi_cec_notifier) {
+			ret = drm_connector_hdmi_cec_notifier_register(connector,
+								       NULL,
+								       bridge->hdmi_dev);
+			if (ret)
+				return ERR_PTR(ret);
+		}
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..1f1670e3c6aac39b8b891b0d5e7e91254eb0d3a1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -914,9 +914,9 @@ struct drm_bridge {
 	unsigned int max_bpc;
 
 	/**
-	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec
+	 * @hdmi_dev: device to be used as a parent for the HDMI Codec
 	 */
-	struct device *hdmi_audio_dev;
+	struct device *hdmi_dev;
 
 	/**
 	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
@@ -933,6 +933,11 @@ struct drm_bridge {
 	 * @hdmi_audio_dai_port: sound DAI port, -1 if it is not enabled
 	 */
 	int hdmi_audio_dai_port;
+
+	/**
+	 * @hdmi_cec_notifier: use this bridge to register a CEC notifier
+	 */
+	bool hdmi_cec_notifier;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

