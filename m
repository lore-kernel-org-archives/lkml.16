Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32713DB9F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746590050; cv=none; b=u0jytvGnvne5w9rQCyO2jA4mjiLkk24HZgY0gnOHFrGBu0+TwSr9K+9oKe+aNmcLC4Sffgv9cpMrCIBMkrcTZFxNb73Op0Q7DsRsPnRHbN92PEUMOuFhicoki84fspQY+lEUYfBXjoQGWjKDaR/GGXFmIp0o1ue7rg3qvLagGeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746590050; c=relaxed/simple;
	bh=7dS5lYObTEVmZf37ycsRbV2E8tM6Fxv+RgF7gXK2W+0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ORty/gHG7GBHWZkT28Ah7SlYLUeEPRtOJgxTtTPMH4sEGxOwiLkftTkLxUrgA4cGvTJ7fXQGyYNuB+k2LNeFiKz0R5S6VZpDPoY7YgQ2rzeURlDze3b52270prekNg5TBx7MVRijH/OQkQenV5jfqsSXITsK5SVFCkuwRk9LnBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=JSjL9xcB; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="JSjL9xcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746589921;
	bh=Tj5P6TtcgSVDpS1T+ZWu4nBhzWiNoYxJkl3RNDQY6IA=;
	h=From:To:Subject:Date:Message-Id;
	b=JSjL9xcBTzArVKvZfz75ST+8A2OWbyvOtG5xctwdWt95x7AeswffKSLU+GBDk4SWT
	 L9DtVDr1np32Yi6IGKyTnkMT2VfXDnAK4eTSluA0F+6Dd+RwZpp4AVmBPthXpR41Ra
	 qszYMJo/SBDGuzXCmmMuDUL4oHNV2hmJRWafOLFU=
X-QQ-mid: esmtpgz14t1746589918t6bb1e88a
X-QQ-Originating-IP: BKJhp3IJF7PmAJk32cxPsmEjd1tieTKgIMel2vtjp74=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 May 2025 11:51:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3187435413464874817
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH] drm/rockchip: cdn-dp: Convert to drm bridge
Date: Wed,  7 May 2025 11:51:48 +0800
Message-Id: <20250507035148.415-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NmqJZuAG/aVT3e4IyfyH6sQf+kOF1RqoPxnOLbZ/FbeYnzA++0K6Yz+y
	ZMGkggNxXkVieidacbuQXTgLveWhSxBO44LsAgOPTRiFWxrduLRELm0qfTpyGnRiAJhCMF9
	YRSxrvMFFd9CygX7zVsHWP4sV/Gz6hjyCoZGkt3sbb4dFYLTJ9Qsqs7EgRBlHIf1i13hO6z
	axB5UX+c6FC3V9ATahVSKDVb8KJgNpszmFZBmu5gW9sEIH0d7W8vaidKhx272dJ6F+Eyblb
	Ru7+cyVO302MghNpMnhyTJaGzwZ4L4WMrhsSIqcNr7PcUxhdYPlldwlEvFRqLvTDykpvbGj
	boJpmLnyYLdfZgm5SGqw0UNQ8ccV3BTA8ag793yUXBiEZLvCHjeaIkRkcPwZkV69G9/PcfD
	MPpgHLUBiYLFyF874GscyIIziJg9+0rAL0PixaL5UCNJrYP9EnO+Be5qz1aMIZy9qkFFzi0
	bZsnRUCVOIycWVklA9uGDXR99K1MSCoOuC8rS1Xat/HQw4mpwXwIdQrT/bZNjyvGx6BSkz7
	s5FwbiKkmqD+ur3Ox7GYbCzkIQhAwFQypsAGqQtYzxm23s/rZTS5+uUIWDyR0l3wBif1kaN
	jmCapqoogD1U8CAcL/lM1xC+VZxmOOcVTxLOsE1MYBm+Ya19+oHTY+QirJLkEhbytl6YNOE
	eF3Z6CV+8nYik+zltLguU8oqYHCParN2gL3/OYb5e6zAzjjhYzxK6dYdwZMZPQyHDUMFTy6
	RFInqnj/9qOPD7HLLqUwoL8U+uJhWlGGcGNUKAO/6qNYSP8LTeCvC+74Rw2V6qs0p/SzpcQ
	0ulKxmLRunY2DKfGwY5n/B7ZyGgPv8O+qpeWs6ehWWLW4HN0ZuDsQZSjsDkl4Rhrs9Nl0Gj
	wa4H5XCk6SVMMhU0Ob0k4eI6m0b1IhsOdUYNqRiwmShjBp+gpbCY9WviHcAFAFKlht8O3IP
	2IsQfs6hEaqR0jmYFaCq8tXTztPQhsdLmvt6o+WgTAA06ATV+Py8OxIUwurqcq8lQ+Y4iFG
	sy0k2uy6lpq3qJH5V9oXYXIqm2hAtkY6h6iGqJMw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Convert it to drm bridge driver, it will be convenient for us to
migrate the connector part to the display driver later.

Tested with RK3399 EVB IND board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 163 +++++++++++++------------
 drivers/gpu/drm/rockchip/cdn-dp-core.h |   5 +-
 2 files changed, 86 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 292c31de18f1..bc70dae8ff72 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -25,9 +25,9 @@
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
 
-static inline struct cdn_dp_device *connector_to_dp(struct drm_connector *connector)
+static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
 {
-	return container_of(connector, struct cdn_dp_device, connector);
+	return container_of(bridge, struct cdn_dp_device, bridge);
 }
 
 static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
@@ -231,9 +231,9 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 }
 
 static enum drm_connector_status
-cdn_dp_connector_detect(struct drm_connector *connector, bool force)
+cdn_dp_bridge_detect(struct drm_bridge *bridge)
 {
-	struct cdn_dp_device *dp = connector_to_dp(connector);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
 	mutex_lock(&dp->lock);
@@ -244,41 +244,26 @@ cdn_dp_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
-static void cdn_dp_connector_destroy(struct drm_connector *connector)
+static const struct drm_edid *
+cdn_dp_connector_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
 {
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
-static const struct drm_connector_funcs cdn_dp_atomic_connector_funcs = {
-	.detect = cdn_dp_connector_detect,
-	.destroy = cdn_dp_connector_destroy,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int cdn_dp_connector_get_modes(struct drm_connector *connector)
-{
-	struct cdn_dp_device *dp = connector_to_dp(connector);
-	int ret = 0;
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	const struct drm_edid *drm_edid;
 
 	mutex_lock(&dp->lock);
-
-	ret = drm_edid_connector_add_modes(connector);
-
+	drm_edid = drm_edid_read_custom(dp->connector,
+					cdn_dp_get_edid_block, dp);
 	mutex_unlock(&dp->lock);
 
-	return ret;
+	return drm_edid;
 }
 
 static enum drm_mode_status
-cdn_dp_connector_mode_valid(struct drm_connector *connector,
-			    const struct drm_display_mode *mode)
+cdn_dp_bridge_mode_valid(struct drm_bridge *bridge,
+			 const struct drm_display_info *display_info,
+			 const struct drm_display_mode *mode)
 {
-	struct cdn_dp_device *dp = connector_to_dp(connector);
-	struct drm_display_info *display_info = &dp->connector.display_info;
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	u32 requested, actual, rate, sink_max, source_max = 0;
 	u8 lanes, bpc;
 
@@ -323,11 +308,6 @@ cdn_dp_connector_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
-static struct drm_connector_helper_funcs cdn_dp_connector_helper_funcs = {
-	.get_modes = cdn_dp_connector_get_modes,
-	.mode_valid = cdn_dp_connector_mode_valid,
-};
-
 static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
 {
 	int ret;
@@ -360,7 +340,7 @@ static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
 
 static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 {
-	const struct drm_display_info *info = &dp->connector.display_info;
+	const struct drm_display_info *info = &dp->connector->display_info;
 	int ret;
 
 	if (!cdn_dp_check_sink_connection(dp))
@@ -374,9 +354,9 @@ static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 	}
 
 	drm_edid_free(dp->drm_edid);
-	dp->drm_edid = drm_edid_read_custom(&dp->connector,
+	dp->drm_edid = drm_edid_read_custom(dp->connector,
 					    cdn_dp_get_edid_block, dp);
-	drm_edid_connector_update(&dp->connector, dp->drm_edid);
+	drm_edid_connector_update(dp->connector, dp->drm_edid);
 
 	dp->sink_has_audio = info->has_audio;
 
@@ -416,11 +396,11 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 		goto err_power_on;
 	}
 
-	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
-				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "get property failed\n");
-		goto err_power_on;
+		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
+					EXTCON_PROP_USB_TYPEC_POLARITY, &property);
+		if (ret) {
+			DRM_DEV_ERROR(dp->dev, "get property failed\n");
+			goto err_power_on;
 	}
 
 	port->lanes = cdn_dp_get_port_lanes(port);
@@ -551,7 +531,7 @@ static void cdn_dp_encoder_mode_set(struct drm_encoder *encoder,
 				    struct drm_display_mode *adjusted)
 {
 	struct cdn_dp_device *dp = encoder_to_dp(encoder);
-	struct drm_display_info *display_info = &dp->connector.display_info;
+	struct drm_display_info *display_info = &dp->connector->display_info;
 	struct video_info *video = &dp->video_info;
 
 	switch (display_info->bpc) {
@@ -599,12 +579,12 @@ static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
 		dp->plugged_cb(dp->codec_dev, plugged);
 }
 
-static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
+static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
-	struct cdn_dp_device *dp = encoder_to_dp(encoder);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	int ret, val;
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
+	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp->encoder.encoder);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
 		return;
@@ -625,7 +605,7 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 
 	ret = cdn_dp_enable(dp);
 	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Failed to enable encoder %d\n",
+		DRM_DEV_ERROR(dp->dev, "Failed to enable bridge %d\n",
 			      ret);
 		goto out;
 	}
@@ -661,9 +641,9 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 	mutex_unlock(&dp->lock);
 }
 
-static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
+static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
-	struct cdn_dp_device *dp = encoder_to_dp(encoder);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -672,7 +652,7 @@ static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
 	if (dp->active) {
 		ret = cdn_dp_disable(dp);
 		if (ret) {
-			DRM_DEV_ERROR(dp->dev, "Failed to disable encoder %d\n",
+			DRM_DEV_ERROR(dp->dev, "Failed to disable bridge %d\n",
 				      ret);
 		}
 	}
@@ -703,13 +683,31 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static void cdn_dp_hpd_notify(struct drm_bridge *bridge,
+			   enum drm_connector_status status)
+{
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+
+	schedule_work(&dp->event_work);
+}
+
 static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
 	.mode_set = cdn_dp_encoder_mode_set,
-	.enable = cdn_dp_encoder_enable,
-	.disable = cdn_dp_encoder_disable,
 	.atomic_check = cdn_dp_encoder_atomic_check,
 };
 
+static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.detect = cdn_dp_bridge_detect,
+	.edid_read = cdn_dp_connector_edid_read,
+	.atomic_enable = cdn_dp_bridge_atomic_enable,
+	.atomic_disable = cdn_dp_bridge_atomic_disable,
+	.mode_valid = cdn_dp_bridge_mode_valid,
+	.hpd_notify = cdn_dp_hpd_notify,
+};
+
 static int cdn_dp_parse_dt(struct cdn_dp_device *dp)
 {
 	struct device *dev = dp->dev;
@@ -859,7 +857,7 @@ static int cdn_dp_audio_get_eld(struct device *dev, void *data,
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 
-	memcpy(buf, dp->connector.eld, min(sizeof(dp->connector.eld), len));
+	memcpy(buf, dp->connector->eld, min(sizeof(dp->connector->eld), len));
 
 	return 0;
 }
@@ -1006,7 +1004,6 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 out:
 	mutex_unlock(&dp->lock);
-	drm_connector_helper_hpd_irq_event(&dp->connector);
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,
@@ -1030,7 +1027,6 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 	struct drm_encoder *encoder;
-	struct drm_connector *connector;
 	struct cdn_dp_port *port;
 	struct drm_device *drm_dev = data;
 	int ret, i;
@@ -1053,6 +1049,15 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 							     dev->of_node);
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
+	/*
+	 * If we failed to find the CRTC(s) which this encoder is
+	 * supposed to be connected to, it's because the CRTC has
+	 * not been registered yet. Defer probing, and hope that
+	 * the required CRTC is added later.
+	 */
+	if (encoder->possible_crtcs == 0)
+		return -EPROBE_DEFER;
+
 	ret = drm_simple_encoder_init(drm_dev, encoder,
 				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
@@ -1062,26 +1067,31 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
 
-	connector = &dp->connector;
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-	connector->dpms = DRM_MODE_DPMS_OFF;
+	dp->bridge.driver_private = dp;
+	dp->bridge.funcs = &cdn_dp_bridge_funcs;
+	dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
+			   DRM_BRIDGE_OP_EDID |
+			   DRM_BRIDGE_OP_HPD;
+	dp->bridge.of_node = dp->dev->of_node;
+	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
-	ret = drm_connector_init(drm_dev, connector,
-				 &cdn_dp_atomic_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		DRM_ERROR("failed to initialize connector with drm\n");
-		goto err_free_encoder;
-	}
+	ret = devm_drm_bridge_add(dev, &dp->bridge);
+	if (ret)
+		return ret;
 
-	drm_connector_helper_add(connector, &cdn_dp_connector_helper_funcs);
+	ret = drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
 
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		DRM_ERROR("failed to attach connector and encoder\n");
-		goto err_free_connector;
+	dp->connector = drm_bridge_connector_init(drm_dev, encoder);
+	if (IS_ERR(dp->connector)) {
+		ret = PTR_ERR(dp->connector);
+		dev_err(dp->dev, "failed to init bridge connector: %d\n", ret);
+		return ret;
 	}
 
+	drm_connector_attach_encoder(dp->connector, encoder);
+
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
@@ -1092,7 +1102,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 		if (ret) {
 			DRM_DEV_ERROR(dev,
 				      "register EXTCON_DISP_DP notifier err\n");
-			goto err_free_connector;
+			return ret;
 		}
 	}
 
@@ -1101,24 +1111,15 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	schedule_work(&dp->event_work);
 
 	return 0;
-
-err_free_connector:
-	drm_connector_cleanup(connector);
-err_free_encoder:
-	drm_encoder_cleanup(encoder);
-	return ret;
 }
 
 static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dp->encoder.encoder;
-	struct drm_connector *connector = &dp->connector;
 
 	cancel_work_sync(&dp->event_work);
-	cdn_dp_encoder_disable(encoder);
 	encoder->funcs->destroy(encoder);
-	connector->funcs->destroy(connector);
 
 	pm_runtime_disable(dev);
 	if (dp->fw_loaded)
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index 17498f576ce7..d2778f7a5b31 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -8,6 +8,8 @@
 #define _CDN_DP_CORE_H
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <sound/hdmi-codec.h>
@@ -65,7 +67,8 @@ struct cdn_dp_port {
 struct cdn_dp_device {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct drm_connector connector;
+	struct drm_bridge bridge;
+	struct drm_connector *connector;
 	struct rockchip_encoder encoder;
 	struct drm_display_mode mode;
 	struct platform_device *audio_pdev;
-- 
2.49.0

