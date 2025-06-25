Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999661DF258
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827448; cv=none; b=o87IWVus4VxRnou7jvkzh1Spdp9pBS/xn7wsPfYaHPwQTYhEA77DSr4ozE4eqIKEqnFzf6MdrdOPfYREZNkSIpyhCRcOLatYt94ZIWnfVf2H7v8slxhwboy210zVpaSbCZwx/ERtVwOSW8oCHGLt4D/9746qVceNXze4Bi3p0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827448; c=relaxed/simple;
	bh=XPdN3yNq+4xxWHJZCxZu1TvKWFL4HUSh9KffafY4s5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WrjTdWyNP6MuxivUSE3KqjA2b/PVg9cutV78a8pSeXu/0302A7pByR5yfrVpokLvvPSyu47Vzz72fZJcHswXNdb8g7bueX/5QkZB7jj3EQperrg/fRrOH4n/nW8pgzdNH5J+dUeXAriZu4XT54EUGHiMIoeaSAM7OEbgIfofQXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=bUFO8EZt; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bUFO8EZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750827447; x=1782363447;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=XPdN3yNq+4xxWHJZCxZu1TvKWFL4HUSh9KffafY4s5Y=;
  b=bUFO8EZt3vxmKvZlS78QjPP7f+cAIwJhW9V8cFvIBEWimzR5pyiKBiNK
   d+4AecwLp7foiVpK2BI33hI/tkRITiqMKNuPR00+Ya0kzCL8C0244wTn7
   6+limbLbWnK37mocP4SfNaGB6NXco2yFJSdbBDODrhg5XW5/zKXnd1dMg
   t6FL+35BzmJfrko81lBcbWS48EJuOWjRJLHrczCsWL7rRM2RbkZ7vCn0i
   UG5MKSAUfPi6qQ8lsC9AbdMsMefqCiE1izJnoxitLqbj/y0tZ7o1F75WC
   102wo6EvYbGzmvg+e/uOOg2KnIV+iafbNXn9S/qbChHPy28S4s/sE7s1O
   g==;
X-CSE-ConnectionGUID: jYBE4b/ASy6iyFZ+Igzsag==
X-CSE-MsgGUID: H7rUAa5tTeKVlxovsg4p1w==
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="43190402"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 21:57:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 21:56:44 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 21:56:38 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 10:26:12 +0530
Subject: [PATCH v5 4/4] drm/bridge: microchip-lvds: fix bus format mismatch
 with VESA displays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v5-4-624cf72b2651@microchip.com>
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
 Balasubiramani" <dharma.b@microchip.com>, Sandeep Sheriker M
	<sandeep.sheriker@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750827371; l=3511;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=XPdN3yNq+4xxWHJZCxZu1TvKWFL4HUSh9KffafY4s5Y=;
 b=Kd/PKU2kq2u+h6bfBPW48z/fB9KPLwGHGAtZUwzVWHuwI2Y+7FZpeSjWMcqHg77TRCJ/54cny
 PAPvOsXD9h0Dsz6E8J+XP6slZt7jhO8JijdinWAIqlU6Spa2DohOst2
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

The LVDS controller was hardcoded to JEIDA mapping, which leads to
distorted output on panels expecting VESA mapping.

Update the driver to dynamically select the appropriate mapping and
pixel size based on the panel's advertised media bus format. This
ensures compatibility with both JEIDA and VESA displays.

Signed-off-by: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 38 +++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index b1800f78008c..29d18ec00883 100644
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
@@ -134,7 +151,16 @@ static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
-	lvds_serialiser_on(lvds);
+	struct drm_connector *connector;
+
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

