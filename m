Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC5E1DF991
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827408; cv=none; b=uWmc/TfLVQ+CUJCiG4sLQqtsdpeUvnF+QB+OUPpFVdENvsCTzALO95JzxiCBKDuzai7i8ruXL/DhzQvVkvpMfnV8P6x/Vg8dGhvcqyTSMcdCgpZ/DyC+HBD5FgllSsPulQJoGRtlbYUDT3NJi2f+bveqia5Jchd8HnQhqGOLlvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827408; c=relaxed/simple;
	bh=QE4zUYyP981F+5VE7+ZTFWVBH1tBQt/2P/4OLcHIcbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iaV9nU8ArnfY/fZvKGWv7aBqnaY8wK0Dehu69mDVBOMjhyYSm7Kyvt6xxcr9cy6oYQ3v8mEKvJLupOeslV4J4ygAfAU2zOPxX/6iiYojXiEQn3p+RFd+VbdySqIw8v5u+jw6QtC7pwdVh0ouzNz3J4kLDK0QoxquLu0Wf28lxyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=XnvptBdp; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XnvptBdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750827407; x=1782363407;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=QE4zUYyP981F+5VE7+ZTFWVBH1tBQt/2P/4OLcHIcbw=;
  b=XnvptBdpbBCfv3xrmWbav1h3zzWv9jTvM29bqeuy8PEbQObmnwlWIQWC
   UApHEx/mm9aHLGNKMex75kFaz8g7FhbQJiPJPcNGLNdzt+qAeOC7ETDv7
   FL7gtSExsvtEtf3so7U5IGQeq/ZM02v8dKyYoq+cyKtpKiRPYpS3HDEkI
   bE5P9Bmr5qP0k4hwXNjb/F2Wm7bnXVAjX+mgSJzPFbOa4yIw8jUNJS8BS
   jIKFuldPzvafjMhcS38HOCDR54TR97uxsvtnN6CfiMd88ObPgDT7fKMuP
   ixS/DxguKFO9rZEGO5ra1l+k2oEVxA6AIneKBlhsa/KtyR/8YJHwU193a
   Q==;
X-CSE-ConnectionGUID: AhZgIOJERfil50n8LIfntw==
X-CSE-MsgGUID: j+snhcXoROCfPAjH4NpPVQ==
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="42713915"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 21:56:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 21:56:37 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 21:56:32 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 10:26:11 +0530
Subject: [PATCH v5 3/4] drm/bridge: microchip-lvds: add atomic pre_enable()
 and post_disable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v5-3-624cf72b2651@microchip.com>
References: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
In-Reply-To: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750827371; l=2425;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=QE4zUYyP981F+5VE7+ZTFWVBH1tBQt/2P/4OLcHIcbw=;
 b=sQHGhpQdgAwF6+teRgSAuveZIlU9LLriIJHN6qLdE5xtUivcSM7MUiBjbL7qP4b03sWHlXvuP
 rZ8nQFzp4m2C4dfmzTTjezKPhGyZ8Ye+kkuTnDm6CSiMAwwPFJrOcke
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

pm_runtime_get_sync() and clk_prepare_enable() must be outside the atomic
context, hence move the sleepable operations accordingly.

- atomic_pre_enable() handles pm_runtime and clock preparation
- atomic_enable() enables the serializer based on panel format
- atomic_disable() turns off the serializer
- atomic_post_disable() disables clock and releases runtime PM

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index c40c8717f026..b1800f78008c 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -111,8 +111,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state)
+static void mchp_lvds_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	int ret;
@@ -128,7 +128,12 @@ static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
 		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
 		return;
 	}
+}
 
+static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	lvds_serialiser_on(lvds);
 }
 
@@ -139,6 +144,12 @@ static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
 
 	/* Turn off the serialiser */
 	lvds_writel(lvds, LVDSC_CR, 0);
+}
+
+static void mchp_lvds_atomic_post_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 
 	pm_runtime_put(lvds->dev);
 	clk_disable_unprepare(lvds->pclk);
@@ -146,8 +157,10 @@ static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
 	.attach = mchp_lvds_attach,
+	.atomic_pre_enable = mchp_lvds_atomic_pre_enable,
 	.atomic_enable = mchp_lvds_atomic_enable,
 	.atomic_disable = mchp_lvds_atomic_disable,
+	.atomic_post_disable = mchp_lvds_atomic_post_disable,
 };
 
 static int mchp_lvds_probe(struct platform_device *pdev)

-- 
2.43.0

