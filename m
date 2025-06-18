Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E439610FD
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750221193; cv=none; b=YrnXXezVRJy+rE2q71OJSPbvL2BI5fYxdStrj9Zm6whcQo1u96tB6T87jQFneQ44CrczOGWweZrIBXCdCBijFoYcRZd8ui5AgcJ47Y2KJKa4UmjZLnnGRZH3buIp4mcJ1JhMnR8SAqiRoef9z+mesgmT+78V0j6Du9NsM1FQ3Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750221193; c=relaxed/simple;
	bh=3XYEgvLrx2fs4/fZLwqyes7VHOCqIj1MAnN3kZklhwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jWy5UYLHv9i1lrAfqlxgulA1LcSCd1vp1c1MXRnFjEtjECSs1nxRaand6eAuJkrTn9p/LsL81/B2DW40aaTC4m6lbJRDwQ2a1h53NFgpNtcn0BNYMyACHDS/EkYMwmLta/rtlzl/LxBbuhoq6g6A/ZjU1rmLyqonOxjiuylIQwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=bvI0xKsG; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bvI0xKsG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750221191; x=1781757191;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=3XYEgvLrx2fs4/fZLwqyes7VHOCqIj1MAnN3kZklhwU=;
  b=bvI0xKsGi5EigQXSPGNoVM3EEwxCPTRioEYsC1nVv/LucBfHjyTcNbny
   6ozUVLt3/57B5hU/1gQJI15m0qbpiSO6MS3pCY2f6F8ipHjPTMvmwDuM9
   v7u/kOGG6qS9d0MlMiCu96vNr2Yb4D7PGYjzkzqcOFrf8KloRbV+dG7Un
   6FFb1xacbQMmILG9YBw7rJ1r+YIzF5VC7pM+P8iqrDfCKfguwtbgxxNPU
   Vvy/HGf6wKUqzQVjaIrzcoarw9vUZ4sx57CTak5r30uMEsP+g78rarpx6
   CpoYMi8xehhO2Y0tazcfev3a+BCOh7meRBOw4ybNlrMZKQ+Enc0tmOavF
   g==;
X-CSE-ConnectionGUID: 09LArsffQ+mfyqjH8UxHOA==
X-CSE-MsgGUID: IZPORRVkQYOcQq4Svk2/Aw==
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="42456777"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 21:33:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 21:32:50 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 17 Jun 2025 21:32:44 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 18 Jun 2025 10:02:42 +0530
Subject: [PATCH] drm/bridge: fix LVDS controller bus format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250618-microchip-lvds-v1-1-1eae5acd7a82@microchip.com>
X-B4-Tracking: v=1; b=H4sIAGlBUmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ML3dzM5KL85IzMAt2cspRi3SRzQ1PDFEszA0uTRCWgpoKi1LTMCrC
 B0bG1tQADmCpjYAAAAA==
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	"Sandeep Sheriker M" <sandeep.sheriker@microchip.com>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750221165; l=6120;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=wFIOy/BbQ21F+4ARZL9GilNTH/zm3W0MIAOZBTA2FNw=;
 b=zUc37lYQjydKNH2Lx3Buaqalv1DxlrVCdywIE22mvbXyZwGPlLil3Sp7OVnb0Mz5z7ZQ2mUFz
 V7L4k4SzHz4BxXG4n+zOYKBVn3rQN5q40gNSYZfJOtE4frGCbev16yr
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

From: Sandeep Sheriker M <sandeep.sheriker@microchip.com>

The current LVDS controller driver is hardcoded to map LVDS lanes to the
JEIDA format. Consequently, connecting an LVDS display that supports the
VESA format results in a distorted display due to the format mismatch.

Query the panel driver and set the appropriate format to resolve the issue.

Signed-off-by: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 108 ++++++++++++++++++++++++++++++--
 1 file changed, 102 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 9f4ff82bc6b4..5e99c01033bb 100644
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
@@ -41,9 +42,11 @@
 
 /* Bitfields in LVDSC_CFGR (Configuration Register) */
 #define LVDSC_CFGR_PIXSIZE_24BITS	0
+#define LVDSC_CFGR_PIXSIZE_18BITS	1
 #define LVDSC_CFGR_DEN_POL_HIGH		0
 #define LVDSC_CFGR_DC_UNBALANCED	0
 #define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
+#define LVDSC_CFGR_MAPPING_VESA		0
 
 /*Bitfields in LVDSC_SR */
 #define LVDSC_SR_CS	BIT(0)
@@ -58,6 +61,7 @@ struct mchp_lvds {
 	struct clk *pclk;
 	struct drm_panel *panel;
 	struct drm_bridge bridge;
+	struct drm_connector connector;
 	struct drm_bridge *panel_bridge;
 };
 
@@ -66,6 +70,11 @@ static inline struct mchp_lvds *bridge_to_lvds(struct drm_bridge *bridge)
 	return container_of(bridge, struct mchp_lvds, bridge);
 }
 
+static inline struct mchp_lvds *drm_connector_to_mchp_lvds(struct drm_connector *connector)
+{
+	return container_of(connector, struct mchp_lvds, connector);
+}
+
 static inline u32 lvds_readl(struct mchp_lvds *lvds, u32 offset)
 {
 	return readl_relaxed(lvds->regs + offset);
@@ -79,6 +88,11 @@ static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
 static void lvds_serialiser_on(struct mchp_lvds *lvds)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_MS);
+	struct drm_connector *connector = &lvds->connector;
+
+	/* default to jeida-24 */
+	u32 bus_formats = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	u8 map, pix_size;
 
 	/* The LVDSC registers can only be written if WPEN is cleared */
 	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
@@ -93,24 +107,106 @@ static void lvds_serialiser_on(struct mchp_lvds *lvds)
 		usleep_range(1000, 2000);
 	}
 
+	if (connector && connector->display_info.num_bus_formats)
+		bus_formats = connector->display_info.bus_formats[0];
+
 	/* Configure the LVDSC */
-	lvds_writel(lvds, LVDSC_CFGR, (LVDSC_CFGR_MAPPING_JEIDA |
-				LVDSC_CFGR_DC_UNBALANCED |
-				LVDSC_CFGR_DEN_POL_HIGH |
-				LVDSC_CFGR_PIXSIZE_24BITS));
+	switch (bus_formats) {
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
+	lvds_writel(lvds, LVDSC_CFGR, (map | LVDSC_CFGR_DC_UNBALANCED |
+		    LVDSC_CFGR_DEN_POL_HIGH | pix_size));
 
 	/* Enable the LVDS serializer */
 	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
 }
 
+static int mchp_lvds_connector_get_modes(struct drm_connector *connector)
+{
+	struct mchp_lvds *lvds = drm_connector_to_mchp_lvds(connector);
+
+	return drm_panel_get_modes(lvds->panel, connector);
+}
+
+static const struct drm_connector_helper_funcs mchp_lvds_connector_helper_funcs = {
+	.get_modes = mchp_lvds_connector_get_modes,
+};
+
+static const struct drm_connector_funcs panel_bridge_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
 static int mchp_lvds_attach(struct drm_bridge *bridge,
 			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+	struct drm_connector *connector = &lvds->connector;
+	int ret;
+
+	ret = drm_bridge_attach(encoder, lvds->panel_bridge,
+				bridge, flags);
+
+	if (ret < 0)
+		return ret;
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
+	if (!encoder) {
+		dev_err(lvds->dev, "Missing encoder\n");
+		return -ENODEV;
+	}
+
+	drm_connector_helper_add(connector,
+				 &mchp_lvds_connector_helper_funcs);
+
+	ret = drm_connector_init(bridge->dev, connector,
+				 &panel_bridge_connector_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
+	if (ret) {
+		dev_err(lvds->dev, "Failed to initialize connector %d\n", ret);
+		return ret;
+	}
 
-	return drm_bridge_attach(encoder, lvds->panel_bridge,
-				 bridge, flags);
+	drm_panel_bridge_set_orientation(connector, bridge);
+
+	ret = drm_connector_attach_encoder(&lvds->connector, encoder);
+	if (ret) {
+		dev_err(lvds->dev, "Failed to attach connector to encoder %d\n", ret);
+		drm_connector_cleanup(connector);
+		return ret;
+	}
+
+	if (bridge->dev->registered) {
+		if (connector->funcs->reset)
+			connector->funcs->reset(connector);
+
+		ret = drm_connector_register(connector);
+		if (ret) {
+			dev_err(lvds->dev, "Failed to attach connector to register %d\n", ret);
+			drm_connector_cleanup(connector);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static void mchp_lvds_enable(struct drm_bridge *bridge)

---
base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
change-id: 20250618-microchip-lvds-b7151d96094a

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

