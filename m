Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB301DB156
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498063; cv=none; b=VBvN/WD8I7MERu8hkGiNlaFVU938hd1m5rXhyShNDm1oj1JXJn9o78CFgVLRYty35xyia0NoYVaSyok1x/8XZRPb+yiE6ZsHGoZSO/jnTVB4x/inEWppsz4DXhypYLrTvulooQGQodNfZGn+Oq7fXcF2xhrosHPhmpIPjZv87Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498063; c=relaxed/simple;
	bh=vbGZOMc+V4BW3oRtVXZ0aC7nodmuYNbj76HULcIcwv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2gQV808svZDtF61Ykgn/6YYS1oK7Sa6ong9VeblAMFY4V8l0YQlggvzfE9TiD9qEKGOSDM68t2PCoFwo+J+PC+dy63zTuBa+d002g2uBuQNrv/8MnaLMf40DXrMBYvONFUkRzyrqv+8AF/MHvqiXZoDvO58QnVv7hIpeH4/5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z30m/C6S; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z30m/C6S"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-543e49a10f5so3623755e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498060; x=1739102860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLHm3bhxZ2eEkV8ibPSP711qjdIHEc+NFBEKYoktv98=;
        b=Z30m/C6SpObTWdBf0kmpbhBXkz5S0CE4gPOBaclXkwyL13Kro1ODA0ilq/Xa2LNGQe
         6DZ9HnkUX3JJn6qubXgVyVbTeCVVBuJITkIA3RA/Q76KSBXky3O2CyXt3I3DzK7295KI
         0khZv+vkV1HeoC/nG2IyMAYNLpwfxltVGQPxr55pK7k4iiOG/5Uk/HvyN7MP/5j1IkwF
         V6NPVj5orm6i+NCsMyGbg8bFIpX53B8FjdmUqhT7WI4qyLwLfoqYp54PZJ08uO2ibrxr
         oDulizEvaJL83JHoD8MNY1SrrM5viwmN2qHYRlUugyLPiujDWIto6YV0dDr5SvPgiPLy
         gpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498060; x=1739102860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLHm3bhxZ2eEkV8ibPSP711qjdIHEc+NFBEKYoktv98=;
        b=NPE1Zu+34gbrcmgdJ/Nc2tnRybQKgwwKnFinkt0Na9mfB9joIPblc+hwOuayilbkzo
         Ja1ZNxj4S8Yhnjcf/D/nRWmSKJx7jTtGkK4AOZWpFmi3rCecBTaNN7AcVlTQa4AvG0a2
         NEkoeEbvMZ+xxWMWMfXWJJgi6XNKcjEpkeCPuoP+iROR/URAWT603GkzVTQgwKjhR54Y
         sKJZd3yii6ZquaRvFer5X7dTiSGv99vI8xu1x3SQPI9vCKnce7lbAHGjhgLipa3D0i4q
         NzI7ljWcM3uL+4eoplIvcENvFeV9ROH0mDvHZrVs3rSED1bJJkwNnw4pS1RIERf+syXG
         PUaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDy/hXW9zGbchgimVbkXzqjILIthwSL7pJ+NX+qx9m3fbe0dB9n1HZM3lTv5PA0IEuTVEIgj+11MmljtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzllLZ56UAGUJrCVJObSj59gZPRLDMVvQeAmWeny2cjy7TkOD1l
	bnGsk12MSzeux6wUHW9EbWegMBd2n1F9tFT0j0QgqxkeTudSebnSDspofiG9/2w=
X-Gm-Gg: ASbGncsn+NlWociO3rC4F0EV9Xp4NnTU3TpuF9ANLTjoqA1IkQTAoX3yZNBkoFI6ixO
	KYqbAX5gJcbM8whvtKRjw0Bt6rJl8cz7gmkFrSB4b/nXlW63ECNJrqCWpMAjdunb0BWNLz1nYGz
	OPNq8gzW0wg6wDO+1yBmz1Mj9IyfeIffN2nmof2LubLrwYzdJ0r4jk0deP4KbM7mCL6WbIKH413
	A7VlFnLSZ0XMarr0mi6wBzzKT/Ha6BMPEjMZA5sgMfm77pNZTqpMrvMPyRAhrHXOTwcisvi218l
	HiOPEaQxjcGdZBqi58S78N8=
X-Google-Smtp-Source: AGHT+IHl6Juy16UapZRrVEz0ow3vlGeH9cEUDfxCBbzvk2jva6MFi/0w8KegrO8cbZD1ar970A8W/g==
X-Received: by 2002:a19:7501:0:b0:543:e409:1ff9 with SMTP id 2adb3069b0e04-543e4c3fcd7mr5502711e87.45.1738498059704;
        Sun, 02 Feb 2025 04:07:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:17 +0200
Subject: [PATCH v4 10/12] drm/display: bridge-connector: handle CEC
 adapters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-10-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vbGZOMc+V4BW3oRtVXZ0aC7nodmuYNbj76HULcIcwv0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/wfFeNKR9HpOseH3T/CD9wYWtVlkJ8lUjdy
 s9RyWPJUxaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f8AAKCRCLPIo+Aiko
 1X2AB/0SVy4DyopVw0b+xWrutXdBBkch9Iif/NmsivL4qQ2XNcULYty7QsSWuuS9chP6ZtPb+Kp
 yHT3+u//Fdgo1wzKzLLLV1RdC0tMLMN56O2+2cyRY0h4lZE259MTQdedCpzNlxfN46XEmAMDJiF
 9GOI+JE3iLWHIDSygrHeFXQICC7Y/h02jOMKIJIsdrQshwm/3Yx80pY7PnQNz8AIfp0hFH2GwGq
 aH10pd3Wr1qxj0BnPlo6os5gjZUplbA+G+e/SA5b9A8Oe4uu7MMMB8irsJAcXhmbQJFqyGJwaIl
 dvswfLh1EUtbbKfQEjKyagsC3GfgiHvKgMPlURVt0ZYNCiGH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Implement necessary glue code to let DRM bridge drivers to implement CEC
adapters support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 93 ++++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 21 ++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 9f234bc647d5c0880d4c42aea130074b7fa54573..5b77fd59d79abddd419e611a7868b001857ccb37 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -9,6 +9,8 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 
+#include <media/cec.h>
+
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
@@ -497,6 +499,82 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
 	.mute_stream = drm_bridge_connector_audio_mute_stream,
 };
 
+static int drm_bridge_connector_hdmi_cec_enable(struct drm_connector *connector, bool enable)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	return bridge->funcs->hdmi_cec_enable(bridge, enable);
+}
+
+static int drm_bridge_connector_hdmi_cec_log_addr(struct drm_connector *connector, u8 logical_addr)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	return bridge->funcs->hdmi_cec_log_addr(bridge, logical_addr);
+}
+
+static int drm_bridge_connector_hdmi_cec_transmit(struct drm_connector *connector,
+						  u8 attempts,
+						  u32 signal_free_time,
+						  struct cec_msg *msg)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	return bridge->funcs->hdmi_cec_transmit(bridge, attempts,
+						signal_free_time,
+						msg);
+}
+
+static int drm_bridge_connector_hdmi_cec_init(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	drm_bridge_cec_data_set(bridge, connector);
+
+	if (!bridge->funcs->hdmi_cec_init)
+		return 0;
+
+	return bridge->funcs->hdmi_cec_init(connector, bridge);
+}
+
+static void drm_bridge_connector_hdmi_cec_unregister(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	drm_bridge_cec_data_set(bridge, NULL);
+
+	drm_connector_hdmi_cec_unregister(connector);
+}
+
+static const struct drm_connector_hdmi_cec_adapter_ops drm_bridge_connector_hdmi_cec_ops = {
+	.base.unregister = drm_bridge_connector_hdmi_cec_unregister,
+	.init = drm_bridge_connector_hdmi_cec_init,
+	.enable = drm_bridge_connector_hdmi_cec_enable,
+	.log_addr = drm_bridge_connector_hdmi_cec_log_addr,
+	.transmit = drm_bridge_connector_hdmi_cec_transmit,
+};
+
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -633,6 +711,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			if (ret)
 				return ERR_PTR(ret);
 		}
+
+		if (bridge->hdmi_cec_adapter_name) {
+			if (!bridge->funcs->hdmi_cec_enable ||
+			    !bridge->funcs->hdmi_cec_log_addr ||
+			    !bridge->funcs->hdmi_cec_transmit)
+				return ERR_PTR(-EINVAL);
+
+			ret = drm_connector_hdmi_cec_register(connector,
+							      &drm_bridge_connector_hdmi_cec_ops,
+							      bridge->hdmi_cec_adapter_name,
+							      bridge->hdmi_cec_available_las,
+							      bridge->hdmi_dev);
+			if (ret)
+				return ERR_PTR(ret);
+		}
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index df1d72c7e176c75585283684acc2ef2ffb2f8bff..b55e80a57758e8b652eac0cd01cb245a04e221f5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -32,6 +32,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 
+struct cec_msg;
 struct device_node;
 
 struct drm_bridge;
@@ -729,6 +730,16 @@ struct drm_bridge_funcs {
 				      struct drm_bridge *bridge,
 				      bool enable, int direction);
 
+	int (*hdmi_cec_init)(struct drm_connector *connector,
+			     struct drm_bridge *bridge);
+
+	int (*hdmi_cec_enable)(struct drm_bridge *bridge, bool enable);
+
+	int (*hdmi_cec_log_addr)(struct drm_bridge *bridge, u8 logical_addr);
+
+	int (*hdmi_cec_transmit)(struct drm_bridge *bridge, u8 attempts,
+				 u32 signal_free_time, struct cec_msg *msg);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -924,6 +935,16 @@ struct drm_bridge {
 	 */
 	bool hdmi_cec_notifier;
 
+	/**
+	 * @hdmi_cec_adapter_name: the name of the adapter to register
+	 */
+	const char *hdmi_cec_adapter_name;
+
+	/**
+	 * @hdmi_cec_available_las: number of logical addresses, CEC_MAX_LOG_ADDRS if unset
+	 */
+	u8 hdmi_cec_available_las;
+
 	/** private: */
 	/**
 	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.

-- 
2.39.5

