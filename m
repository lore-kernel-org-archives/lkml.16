Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABED71519BF
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447203; cv=none; b=PrWV/ZYVmWitZsDes8z2B5NXqoXdsTVGu6tkqWDXvnzjh6SCiY9HAYf0wO6JUctz//xLonsBg7MgbXOea0ZvEnxvnZAaJx8V8qYFaI18GvGRQYGPoqCjDzL90xaGXITXGzEN1HO54qtA/8SaiYsM0qlovH7Pe/P+Bgoy9tFUpOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447203; c=relaxed/simple;
	bh=i2siyc5cNZp28Bm/+U+t6HAhNXnqz68ofKezvInamp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=toyI6OsV3DXHkRJGmTZU9uM0Qm2KoZQfmNKKi8AN3w2X+9LzIzrD8ruC9VCP8PsjGt20G4/k36qo/GhdF7naXsZ3psU+npBFgvlQO57JBFyufEWvT9ca9J+2gMT0W/VPOyngPfD50jqQAbmE5VUb3ORyPLcM7KP2TuKIlRc38Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HF9ErV4S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF9ErV4S"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H0sxcX014970
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTue6qDwrYubFQMk1w1EWo6BYJAZv6w0wv+khPYE838=; b=HF9ErV4S/gjbPymd
	qvweci5y7r5Fcmm7KFalbEl68BOP5fDO9t2ZHV6nhVeSGJrPT5K7/lZPZFiLYrMG
	f7GLV6yulvOyChR2i+zAqsq6ad/NH2GIt+gBFtWFY+FfFjpnhnNDig7rP8lx46U/
	IEFlvMsh3wt5byh0ehGl532e3KulWtPyed3V3J3nVW4w+ICEJM6xYHfhkiNN0+sc
	G96IDgig2VFAn+1/xw1yblU9F9Ak8VRu5CiAs+56i8amC+qmFrrP5mDWuKDZDTIy
	XetF4cWndvUAxKJL8nfYFgdF+BnGqRCeXSLBEOVc4ZAjzRH0Fv5OcSe/WMOJQfdh
	v0DPAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpkr6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:00:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8ae3c3d80so38468696d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447199; x=1748051999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTue6qDwrYubFQMk1w1EWo6BYJAZv6w0wv+khPYE838=;
        b=KHIIrJkXMBgBB4iGJ0BGyuUtMuOEnOMRE213Prse+aWaEIevs29QOA81hdeDiB9jZq
         2ew/eoiITWvMOJ1g6ZYYA5CQ450nREEAMZMG2XzwTHQLEMxrvgrtz/xXJagKSTItbu8E
         LX9lLL/vPP7I9trvItJjd1UW2ltyCa/UFM0hgfwjUtoi/2A9CVrTMUwAM1ZJXWLJOg0F
         Y26h4ly23QllRPYmOvrWg4V4eRki3nyGLojHyIocTr8jBsrz1aKJnXn6TGRqITpDWgsL
         9nns6hdkgMwT/Q4TNHmd/3iyt9G+N5EcJpkahjyh7U00eCH8VhbhSrAfyL3Lx+42ri9J
         +ikA==
X-Forwarded-Encrypted: i=1; AJvYcCXXqwUYOd16sBQkpLb7Zy0+2tnjNuQktTPuLduLrQcR67clxtqrq2NuQmUJmEqI+Oc7+UXHbA71Xk1+IOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo5TjYt7c2nBAgXus1gztzx+SsOXQzOHzYgL4wrjcWnsS9zbpa
	j949gsLBuqCJbiknVzSOXpmHF5nLw9chQMzvb0hHb8Ca8kHQcQjb4WXuZxCmwmbWzePmhQkZNgt
	8YQc7PN6WQ/bjg/h5nWRGxWPJm22CFPS99+58hYCfuoX3FtB80N3QeC57lcUkgjsIQdhgoMJGsX
	Y=
X-Gm-Gg: ASbGncvPteHBxgdG/N9KklDHer+OmTWc9RZlEKFB2sAyqWipznOv93DQbaHEnFJstqa
	Yp2V1Y6c4VgI1ijRt3t6e/4cS9et7VwgeJmvdrJJ8mBz0ljWuik/83ky11uHIjR4l98MJwVX2DE
	udNe0cUpYB5L+KT720z1ilQS2/uQn77xEQdhnPpv40sUpL/k9vyvNKah5BduReMRTBEy2d82n0W
	mrzPJXICgheycmb1DMIFBhsEpyLZmhQQHSuM/blQ8U/JNB5aQCulwtqFZLgSBSR1Jr6l4/q9AIK
	EWRTlKII2p7Cay1EeHddb4wNtjXR/YPPvX8yq6FZoKBikJcWwVCG3eVqWMnY5rryEr0DJ90Buz1
	OHRND98Q7BQ6oercRDWHnj69U
X-Received: by 2002:a05:6214:f05:b0:6ed:1545:65c3 with SMTP id 6a1803df08f44-6f8b07db221mr102928636d6.2.1747447198722;
        Fri, 16 May 2025 18:59:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtswsxir2AkXnsumiHReYiQoFeVMytjn5PXkDMFwMyII2mkUh6azr4loh9BoL3Y1eUqvgagA==
X-Received: by 2002:a05:6214:f05:b0:6ed:1545:65c3 with SMTP id 6a1803df08f44-6f8b07db221mr102928416d6.2.1747447198298;
        Fri, 16 May 2025 18:59:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:59:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:45 +0300
Subject: [PATCH v6 09/10] drm/display: bridge-connector: handle CEC
 adapters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-9-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6377;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i2siyc5cNZp28Bm/+U+t6HAhNXnqz68ofKezvInamp4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2M7qOLRG+W3LW+MxgS8jnsazA2dFRHMflnQ
 ZzCzXxJHtiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftjAAKCRCLPIo+Aiko
 1U1mB/4uhxDIOc4OBops3pK6MT/S5ECQTQQ+Jzn7GQV/sgWUjXkWZGG6m3aG0939SUscvi/0oiM
 Wnd9bOnKrGyB+7TzLckK+1nE2l7ezBOuKtnJ58mMqlTol8D0VbVVvWzOj0W0k8HaWuD9kzWdJzH
 Nb59u+N3GyCkqo+4sXOLBInzkEMGZCMaYxFlcV2+llVR+X63mw7RQHO4YOabWtfvxNCbZsLv9S+
 zl8SpxgBYzEzKKs3IhJsO2XQF3z0TEhwwN5TndnuOlc+tczb9AUbaUfHnha4KfRG0QSq4UEIP4b
 fj9ozsbfLBtBckqTz/o+vw438NGXrDHkts+k7DpVAHdd24nZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: C8nGIL8RDwwtOM8BOUeW4PqDEimSsZ-L
X-Proofpoint-ORIG-GUID: C8nGIL8RDwwtOM8BOUeW4PqDEimSsZ-L
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6827eda0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=d0TFWrSkjAMFaLnAG04A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX2ySuJz1ku1Fs
 WhjB6LKSJ+Yq7EyCGBoSEX0Bog2TjicKbIEcQTPMQSWpu2jkpzjHxts6lxVvY+Kb9/uzaSZK19h
 QqznkcLS6a/IRAnMcS4I1teTeixJGG/kbVDMFmlrT6f3Rl0CyjHC0/iAf35qcFhU2G48Dtoi/iR
 VNvpZJjIbop3JJE8F99/cQtt7HqUhayMZr+dCLTCirUFsAJwU7kROCr0NkzmIAX2f6MLKB05wPy
 Tm6eIGM5bGzFBwVtQfcp4NQf42Pxp0BXZrRH+E+YmykHe5pC36JcUmfPPrZ+DkgchXgPySzjIje
 MmavNka3zKg7FSUO+7ucXx3Ke5k7o5DRqCosadlc4aQMXwcJMRORL+f9ZtdZ2SknGLK4WsbU6De
 x9pdrzYnG0zJhnHBN+Gbi4jKUqVxgaxIbz1D150aCXNTweFoJbw5gPQpre3FFVI7tcYdzS5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170017

Implement necessary glue code to let DRM bridge drivers to implement CEC
adapters support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 83 ++++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 26 ++++++++
 3 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 6376ea01ec3093a72de25064e31223d2c9868ed7..df09cf9a8ca19ea894d6f2fad68c0b191e81e3d0 100644
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
index 0377dcd691a871643710d667248b05f8eb9e84d6..3d3607a24189f433e11da98caa0d327a3d3bc29c 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -554,6 +554,66 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
 	.mute_stream = drm_bridge_connector_audio_mute_stream,
 };
 
+static int drm_bridge_connector_hdmi_cec_enable(struct drm_connector *connector, bool enable)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi_cec;
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
+	bridge = bridge_connector->bridge_hdmi_cec;
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
+	bridge = bridge_connector->bridge_hdmi_cec;
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
+	bridge = bridge_connector->bridge_hdmi_cec;
+
+	if (!bridge->funcs->hdmi_cec_init)
+		return 0;
+
+	return bridge->funcs->hdmi_cec_init(connector, bridge);
+}
+
+static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_funcs = {
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
@@ -677,6 +737,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_hdmi_cec = bridge;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
+			if (bridge_connector->bridge_hdmi_cec)
+				return ERR_PTR(-EBUSY);
+
+			bridge_connector->bridge_hdmi_cec = bridge;
+
+			if (!bridge->funcs->hdmi_cec_enable ||
+			    !bridge->funcs->hdmi_cec_log_addr ||
+			    !bridge->funcs->hdmi_cec_transmit)
+				return ERR_PTR(-EINVAL);
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -748,6 +820,17 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
+	if (bridge_connector->bridge_hdmi_cec &&
+	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
+		ret = drmm_connector_hdmi_cec_register(connector,
+						       &drm_bridge_connector_hdmi_cec_funcs,
+						       bridge->hdmi_cec_adapter_name,
+						       bridge->hdmi_cec_available_las,
+						       bridge->hdmi_cec_dev);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
 	if (bridge_connector->bridge_hpd)
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0e5f6a007d536215bd50e11846433290c2060b9c..cc9f7df38102e3c43913b35312f0ed5c4d8a7bd0 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -32,6 +32,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 
+struct cec_msg;
 struct device_node;
 
 struct drm_bridge;
@@ -737,6 +738,16 @@ struct drm_bridge_funcs {
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
 	 * @dp_audio_startup:
 	 *
@@ -912,6 +923,11 @@ enum drm_bridge_ops {
 	 * to be present.
 	 */
 	DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER = BIT(7),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER: The bridge requires CEC notifier
+	 * to be present.
+	 */
+	DRM_BRIDGE_OP_HDMI_CEC_ADAPTER = BIT(8),
 };
 
 /**
@@ -1048,6 +1064,16 @@ struct drm_bridge {
 	 */
 	int hdmi_audio_dai_port;
 
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

