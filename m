Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5B1DDC1E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827407; cv=none; b=AfxiuG2TSs+cL5s/bazKzS7e+jdhkJ46WuFs2IT3gWjKexy12oSMRFOAvDuj0SaP+dB0brfRi8or05lnswwCaf+dN5Lyq9my7RzYPqrcMItjjb4HfqgDOv09o6JnZ7AiR7WyCWZJl+MVdpj6W897InFWHKsfepDpnzW/O93ZrBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827407; c=relaxed/simple;
	bh=e/mJTOaSWA2P1JapKy8sNOWJL14LCqY1jBMNxyjcl4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=R1RCfNAwTOwluEo1/cekpx5LmblSvQqtc9lZbkfNtPoM5+fcMMMaNekRWeqXYw1hmTNgQgjJJ+oVJ/RfDx28dlAchIjpmhDdS6BQHg4iJuVf3uVqaBy44CCI1+CUGG/djGzJnHwgD9oWVHhKfaT+yumCDYGf5dqe6Q/5y7Cso7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=lcKluhHs; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lcKluhHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750827405; x=1782363405;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=e/mJTOaSWA2P1JapKy8sNOWJL14LCqY1jBMNxyjcl4o=;
  b=lcKluhHsxBhXnZ8ae9c0XAHGpORG9qxm2nGh54Sb063GGA7vSm8NsPI/
   NenwnY1MWkLQz4rBlHvE1qJUbXvDkLmk/3uMKR/eqHkpCXKybTLVj5ULL
   CZxfz/d673omS3MN3dzK9p6V7lUHT2WsldEmUy850DIP/FzfjlcfKNDiX
   buir083JJjMrE1K5D4QcCyfC+pKvTeDVOhUHJevwuch7VIfX2tCXOVJXk
   RrcsZfrwwqa/hrf5Aj/O2bAv3LIMpQ0fqSuf5bCWg2dC+AUgnb5RrAR30
   umd3lnCIUQs8mJ5D6gVsQhTR+jCLNTApo5rXzZn9BXArODzWXrOulWJOF
   w==;
X-CSE-ConnectionGUID: AhZgIOJERfil50n8LIfntw==
X-CSE-MsgGUID: Ottw10F8RHGo9SV422wKFg==
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="42713913"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 21:56:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 21:56:25 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 21:56:19 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 10:26:09 +0530
Subject: [PATCH v5 1/4] drm/bridge: microchip-lvds: Remove unused drm_panel
 and redundant port node lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v5-1-624cf72b2651@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750827371; l=1861;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=e/mJTOaSWA2P1JapKy8sNOWJL14LCqY1jBMNxyjcl4o=;
 b=t1+npYydtMChl3XcRSzWZulvNLHRGo1f5cRnLqjyWS/apXPU1mSdxu508JLvCOp8TEYIak2TA
 IaaxLS0qeGBAoz+yR9lz9vIk94RFDhek0g3J+Sy/hVRu5+KBvT7ktbQ
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

Drop the unused drm_panel field from the mchp_lvds structure, and remove
the unnecessary port device node lookup, as devm_drm_of_get_bridge()
already performs the required checks internally.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 9f4ff82bc6b4..06d4169a2d8f 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -23,7 +23,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -56,7 +55,6 @@ struct mchp_lvds {
 	struct device *dev;
 	void __iomem *regs;
 	struct clk *pclk;
-	struct drm_panel *panel;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
 };
@@ -151,7 +149,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mchp_lvds *lvds;
-	struct device_node *port;
 	int ret;
 
 	if (!dev->of_node)
@@ -173,19 +170,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 		return dev_err_probe(lvds->dev, PTR_ERR(lvds->pclk),
 				"could not get pclk_lvds\n");
 
-	port = of_graph_get_remote_node(dev->of_node, 1, 0);
-	if (!port) {
-		dev_err(dev,
-			"can't find port point, please init lvds panel port!\n");
-		return -ENODEV;
-	}
-
-	lvds->panel = of_drm_find_panel(port);
-	of_node_put(port);
-
-	if (IS_ERR(lvds->panel))
-		return -EPROBE_DEFER;
-
 	lvds->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 
 	if (IS_ERR(lvds->panel_bridge))

-- 
2.43.0

