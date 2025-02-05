Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E0215F7A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738737634; cv=none; b=ZkHiKSYnKOrHEyhdHn4fsmqw1r726CnXp5gT52t2GbQsWCM5uotBpcQIBIo/fPNa0yvzXgf2F441VqaYQexBDNj5A++4PoJL4pG1hAXD0PozH83XZBOwhzjJ8gyrn/7dKX3HN+ccAeZd6e3LHHlMhbkvv+UNh8TfmsHdKnu2uQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738737634; c=relaxed/simple;
	bh=h4uoZiDaDCnjp4xbn++cw3iPpGRIxoOC4t2uGuV8Lr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gmFeoGj9xCT1WEaUgkwHBz7RVhTpPpeg3dwH9mo78IzCgelHQkPZTPc2Hq1F2xDgEhqq+7GQj5IeQq5Az/cTKEMXmLTI4TINNLi5d7GsburDmH27P2It0ybXZDABzsI9oP/PMUhdH/TDc1EMfYxwbE4M69l7mEq7scLjoafaJME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIQSSz97; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIQSSz97"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7467CC4CEE6;
	Wed,  5 Feb 2025 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738737634;
	bh=h4uoZiDaDCnjp4xbn++cw3iPpGRIxoOC4t2uGuV8Lr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TIQSSz97U8yWHdkz4Ovgfc11YSHdnxE+u8jlcx/5Bygf3DqvyTsI/dT1k1OP+tvZv
	 7ybCmiFfkz/xgIEQu+YQY4dsSY8FutA9ExDuJcLtXRbO31gAJr1fZxHqIr+Cdb3x2T
	 slPZ70SI06vxCP6nCqSAB/b+bWsuy0cmyNzW7pEjKwixws2U7njQ5I3urkmUj56bfS
	 IvXUXIEYDNvO9e4Hp8IIz4jACe9Eis1m0zEqh4EFJeSKlgPWZ7AEpYz2ZdJi7O8208
	 W0pE9d8RUIjGTpgN7lQSvcLe+yJ+VpOLxDWSO9TDXE4Vhjmuj7ajcBqrl+R9sz/kHi
	 6hXMZ4EtmLOng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61866C02199;
	Wed,  5 Feb 2025 06:40:34 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 05 Feb 2025 14:41:04 +0800
Subject: [PATCH v3 2/2] drm/bridge: it6505: add audio support to
 drm_bridge_funcs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-add-audio-codec-v3-2-26cfadb2d81f@ite.com.tw>
References: <20250205-add-audio-codec-v3-0-26cfadb2d81f@ite.com.tw>
In-Reply-To: <20250205-add-audio-codec-v3-0-26cfadb2d81f@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: treapking@chromium.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738737663; l=2998;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=ALqN5ab0u4x0omcwFuCJ35/u/+RI1mf1aEJhjK4tFQs=;
 b=oSN8pAg0gEhe90kCJmKSJhBKKMKU0FbNorw4tsyh+YfjvjrGj/tgUFTW92DavYy8DbTeqw1+8
 VkjM8QF1HRtBtw4mXS+aLQPsRrC5C4F+7z2KDJw6LVunN7+TDl/C7SW
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

For supporting audio form I2S to DP audio data sub stream.
Add hdmi_audio callbacks to drm_bridge_funcs for the HDMI codec
framework.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 4c766854de14093b80949bdb410488f504b24db8..832c4e3ff4ada31367788faed9583da676e36cf8 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3342,6 +3342,46 @@ it6505_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int it6505_bridge_hdmi_audio_startup(struct drm_connector *connector,
+					    struct drm_bridge *bridge)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = it6505->dev;
+
+	if (!it6505->powered || it6505->enable_drv_hold)
+		return -EIO;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "Audio enable");
+	it6505_enable_audio(it6505);
+
+	return 0;
+}
+
+static int it6505_bridge_hdmi_audio_prepare(struct drm_connector *connector,
+					    struct drm_bridge *bridge,
+					    struct hdmi_codec_daifmt *fmt,
+					    struct hdmi_codec_params *hparms)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	int err;
+
+	err = it6505_audio_setup_hw_params(it6505, hparms);
+	if (err < 0)
+		return err;
+
+	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								       &hparms->cea);
+}
+
+static void it6505_bridge_hdmi_audio_shutdown(struct drm_connector *connector,
+					      struct drm_bridge *bridge)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+
+	if (it6505->powered && !it6505->enable_drv_hold)
+		it6505_disable_audio(it6505);
+}
+
 static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -3358,6 +3398,9 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.hdmi_clear_infoframe = it6505_bridge_hdmi_clear_infoframe,
 	.hdmi_write_infoframe = it6505_bridge_hdmi_write_infoframe,
 	.hdmi_tmds_char_rate_valid = it6505_bridge_hdmi_tmds_char_rate_valid,
+	.hdmi_audio_startup = it6505_bridge_hdmi_audio_startup,
+	.hdmi_audio_prepare = it6505_bridge_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = it6505_bridge_hdmi_audio_shutdown,
 };
 
 static __maybe_unused int it6505_bridge_resume(struct device *dev)
@@ -3746,6 +3789,9 @@ static int it6505_i2c_probe(struct i2c_client *client)
 			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_HDMI;
 	it6505->bridge.vendor = "iTE";
 	it6505->bridge.product = "IT6505";
+	it6505->bridge.hdmi_audio_dev = dev;
+	it6505->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	it6505->bridge.hdmi_audio_dai_port = 1;
 	drm_bridge_add(&it6505->bridge);
 
 	return 0;

-- 
2.34.1


