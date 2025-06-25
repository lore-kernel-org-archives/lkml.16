Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A2A27280E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840966; cv=none; b=O4cOS3WvCdyBEUxwObZrw+RV/WC/TiC64Pvfo7N0M2itvEJHQiNFcFHHsK69ctGeuzjRwJ2xhzrGXA5jjSoqUyGpcWcS7eiIC739PmNT1xAZ7uqhMTMFWt2UdYQ1duEjkhULh4FHOCnfGRS/IG2ppppK0eWh9i3qIpsOOjB8Elc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840966; c=relaxed/simple;
	bh=we0d2ehlIOtxp7+Yqm9uSYJ7GkQr7pFecuAnOd/6pMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=A+i58ANJGZxFLAwSFkAlo/hxE/CWp1kwazCkIZkgXyx0/SPYICXe/T6TfYPnIKHkM7eZ7qL4WqHdT2Ai1dfwYOl7c813QJkDgAMvOaSX6A1QAIhICKyzORwTUYeipJ2zkj0ec42r8hK5SVH8Whtx8XSP82YgfmhuNOGQfUjv0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Bdn4PNVf; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Bdn4PNVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750840965; x=1782376965;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=we0d2ehlIOtxp7+Yqm9uSYJ7GkQr7pFecuAnOd/6pMA=;
  b=Bdn4PNVfXDnINFy3pax7c+VqIJfZ1Q/caA/NkZLForNdf6HBUr0aI76v
   u3peAkrjRTljqHzXgFe8sSrGKw6Ck0IHJlOPTU2CSl9Q6FnA42l6Vzgyr
   fOvaS76Ne9MTQgVeS4le8GnNYYnQaeV4SwbWkNNJYvl/gdwLyCRyNkmCs
   49mf5ESfXkjLXONwLYD8AljQZ2GutfwQRawWLQUt7CRbkZoY8kiF/Sh+A
   h9xC4X/cKYeeWVV7hJc7LzKnswul5OJorBYMxZpjGZrzdnYcIAMGRRKLq
   IvpOlWnrFvZSq8XvXsfzlClEUwuhEVWHJ5ESmWbDovAyjAlhUGIlrGxcy
   w==;
X-CSE-ConnectionGUID: cBHfqEUaQkGtLTAUKVdw1g==
X-CSE-MsgGUID: DqASLBELRGqO9OruYrhDLg==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="274587525"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2025 01:42:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Jun 2025 01:42:09 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 25 Jun 2025 01:42:04 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 14:11:53 +0530
Subject: [PATCH v6 1/3] drm/bridge: microchip-lvds: Remove unused drm_panel
 and redundant port node lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v6-1-7ce91f89d35a@microchip.com>
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
 Balasubiramani" <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750840915; l=1910;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=we0d2ehlIOtxp7+Yqm9uSYJ7GkQr7pFecuAnOd/6pMA=;
 b=/NKJIWO8kD9Gt9nqsoC5LJCdw3/DA6wVT8AaU7pDDQHmjPvPK+xcZhFWoUtWT/GojIdUTkCk8
 ja/883mXLP8AK2U8jK/7s7GUWXpEyfhkUdr+2QhygFeRrTd017lh1EL
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

Drop the unused drm_panel field from the mchp_lvds structure, and remove
the unnecessary port device node lookup, as devm_drm_of_get_bridge()
already performs the required checks internally.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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

