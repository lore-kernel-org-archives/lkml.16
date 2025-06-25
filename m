Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C9E282E1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840955; cv=none; b=ariLDlr+MRgumuI6SWNcKQUbX1890atwMyNsaEZlIHDE+oNfpL2MpkiMn6+KkQnDlHDsq+O76GGbjQL3HQY4J2PF95N6IP8D8YuLtAklIlwST7byMdO8OOInxm+1zISG1rLZUDaVbnN+GzYMKWp8wj1FHRWcavJRnoCfNNzYtFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840955; c=relaxed/simple;
	bh=1fbUCBOIDTSPzi+fNAMOf1UR1cAi0YpASJ8OGaGZJsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ule06G8Jr4pR1rh4aQQqQryZUcJohcNQ6ho0MCzyy6hi5O+9M2KY3Y/nC5r/ClQd6ZhNYm9+2oeByA2p4D70fY603urpSY5va9ih1XYqiwCQPXk4CNuSRg+c/+5YQ9X5HxWZ2jnnZ38HL00OoBoFrV3heuKnxCx8L2sGP/F4iE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=AIF4aNgO; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="AIF4aNgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750840953; x=1782376953;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=1fbUCBOIDTSPzi+fNAMOf1UR1cAi0YpASJ8OGaGZJsE=;
  b=AIF4aNgOniSShkXNU1d8Gl9jHQNI5i4t3iqcvQ4v6INSnv4UmNSbe2tc
   tL4XGDjxP1PrdruZhcXQFMhrB6TREnC70CyFq44yRgDnIVZZ3kIPtZEq3
   L/g3nNrhpI8WlmYIwNIDTu/IsAiJDU3wQ204f7EgpDKo5lCFWdfxdZr4R
   Er46++aPIfJubA/ej5D7ga7LoEWSziadFMonlnEMi5hKrpIZw0zyeTe5Q
   0QP7NBaY/Q8oq435Jt3DM+0vK1L/ldWObdd93nul98wdECoNoNHJUN/L5
   2nLC3n4g8UBobpNYdwucqnpdEnP1vFP1y8Rwxiq96fSn4AzWycOzWDEIw
   g==;
X-CSE-ConnectionGUID: OxR7T9OfQ8+KAPtVT8YaMw==
X-CSE-MsgGUID: s8HevMmiTY2IyOkQq3ADcQ==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="48274805"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2025 01:42:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Jun 2025 01:42:21 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 25 Jun 2025 01:42:15 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 14:11:55 +0530
Subject: [PATCH v6 3/3] drm/bridge: microchip-lvds: fix bus format mismatch
 with VESA displays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v6-3-7ce91f89d35a@microchip.com>
References: <20250625-microchip-lvds-v6-0-7ce91f89d35a@microchip.com>
In-Reply-To: <20250625-microchip-lvds-v6-0-7ce91f89d35a@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Sandeep Sheriker M
	<sandeep.sheriker@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750840915; l=3717;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=1fbUCBOIDTSPzi+fNAMOf1UR1cAi0YpASJ8OGaGZJsE=;
 b=w6PGvFCt8GZ3kJQ0vmoF+1I9k+4tEkk7nSVr25ES2GHj/t7T2KGB0gxORCC2tYp3JnI01Bey3
 izIKHhnt+grAesO2veBTs8PcaeV5BBaQ22xJUhPTI+89SWKeVNoFmWJ
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

The LVDS controller was hardcoded to JEIDA mapping, which leads to
distorted output on panels expecting VESA mapping.

Update the driver to dynamically select the appropriate mapping and
pixel size based on the panel's advertised media bus format. This
ensures compatibility with both JEIDA and VESA displays.

Signed-off-by: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 37 +++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 042e83494d8c..12fc442f9867 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -11,6 +11,7 @@
 #include <linux/component.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
+#include <linux/media-bus-format.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_graph.h>
 #include <linux/pinctrl/devinfo.h>
@@ -40,9 +41,11 @@
 
 /* Bitfields in LVDSC_CFGR (Configuration Register) */
 #define LVDSC_CFGR_PIXSIZE_24BITS	0
+#define LVDSC_CFGR_PIXSIZE_18BITS	BIT(0)
 #define LVDSC_CFGR_DEN_POL_HIGH		0
 #define LVDSC_CFGR_DC_UNBALANCED	0
 #define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
+#define LVDSC_CFGR_MAPPING_VESA		0
 
 /*Bitfields in LVDSC_SR */
 #define LVDSC_SR_CS	BIT(0)
@@ -74,9 +77,10 @@ static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
 	writel_relaxed(val, lvds->regs + offset);
 }
 
-static void lvds_serialiser_on(struct mchp_lvds *lvds)
+static void lvds_serialiser_on(struct mchp_lvds *lvds, u32 bus_format)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_MS);
+	u8 map, pix_size;
 
 	/* The LVDSC registers can only be written if WPEN is cleared */
 	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
@@ -91,11 +95,24 @@ static void lvds_serialiser_on(struct mchp_lvds *lvds)
 		usleep_range(1000, 2000);
 	}
 
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		map = LVDSC_CFGR_MAPPING_JEIDA;
+		pix_size = LVDSC_CFGR_PIXSIZE_18BITS;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		map = LVDSC_CFGR_MAPPING_VESA;
+		pix_size = LVDSC_CFGR_PIXSIZE_24BITS;
+		break;
+	default:
+		map = LVDSC_CFGR_MAPPING_JEIDA;
+		pix_size = LVDSC_CFGR_PIXSIZE_24BITS;
+		break;
+	}
+
 	/* Configure the LVDSC */
-	lvds_writel(lvds, LVDSC_CFGR, (LVDSC_CFGR_MAPPING_JEIDA |
-				LVDSC_CFGR_DC_UNBALANCED |
-				LVDSC_CFGR_DEN_POL_HIGH |
-				LVDSC_CFGR_PIXSIZE_24BITS));
+	lvds_writel(lvds, LVDSC_CFGR, map | LVDSC_CFGR_DC_UNBALANCED |
+		    LVDSC_CFGR_DEN_POL_HIGH | pix_size);
 
 	/* Enable the LVDS serializer */
 	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
@@ -115,6 +132,7 @@ static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+	struct drm_connector *connector;
 	int ret;
 
 	ret = clk_prepare_enable(lvds->pclk);
@@ -129,7 +147,14 @@ static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	lvds_serialiser_on(lvds);
+	/* default to jeida-24 */
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (connector && connector->display_info.num_bus_formats)
+		bus_format = connector->display_info.bus_formats[0];
+
+	lvds_serialiser_on(lvds, bus_format);
 }
 
 static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,

-- 
2.43.0

