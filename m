Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2925828A737
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240785; cv=none; b=d48ULkGQ4e8Zr8q4+yfcKFmurnoN97OoK0dnrnc0/EQX6EKvRBTBBy5qAZ/9QA40IcyG+PompjCPtvTezVGHz0A5mcdxoXgzQ8p+JOoZnyt15Oksi/nKaQ2xDITg9RLT4hgHq96WdBUUP8ueN/Q5fzMMiNNhjCLT2pLlsaBm+ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240785; c=relaxed/simple;
	bh=SYQpfUDGcUI4Fjl3I7lrF+Wp1Q4tFzZwD9sXJK2XFV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVQVOsluTw6u7PUDNS0SXCl33+PJ089cheSoWk2eEbx5ht+1V8jOqi1C3JzqE10KI2Kp1/jVR/Id2fGyjg8vKjowTTDa4aYwqbtVUdossUOO/MQotAqaHh3Aw9u238nlZzlZi+EnnIY8ySs1VZslm2CuahH50sWfjEi4pFIDhRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CvMv2RWD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CvMv2RWD"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAB1D17EB;
	Wed, 18 Jun 2025 11:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240765;
	bh=SYQpfUDGcUI4Fjl3I7lrF+Wp1Q4tFzZwD9sXJK2XFV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CvMv2RWDkGmJADN6SKWWihtOVW54n4or+EIOa53d8gkRgIhDxsqERaNrPzvcmllh7
	 6dgRbF6HjpzdXZEiDq7FNCj9JZf2iYYCwuPfCo2MzQH3eUNDc89/Gpl9h6qB8E7LX8
	 IC4BbdLC8uADXycBr9Sps2gHXSJzdH+08DE6HYgI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:08 +0300
Subject: [PATCH v4 05/17] phy: cdns-dphy: Remove leftover code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-5-862c841dbe02@ideasonboard.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SYQpfUDGcUI4Fjl3I7lrF+Wp1Q4tFzZwD9sXJK2XFV8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo3+e0RBS4Kze29yVEHMxrbIx+D1OSdIr+dA5
 cMRf0EHcnyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/gAKCRD6PaqMvJYe
 9UUND/9NRombRCIFomalMb4a0VX77dNdBckwFwdSbXbnt+iJgItXp11qEFzDji7Hgoa5Ch3lSYX
 ybMc1A5RE85MSv9QdU9SrId4ck1cqBPXBBYCYmVx3OROoEsX2jtZ122gkLe7uD4snwteKsNjVLR
 JfzBZJw4OynVvZfternW65/9UYTjRRZenNEgo192pvrZ3HszgSgDYJY0ihrLgVnTM1SjFYuWlsC
 RDYfwYPNpRsm3plEjRhVrIRF6epSy0Kz0+EeTgXwPuWurvI9IZnYtYbShiwfTx/GNeG+/6wzyY2
 JSkljoaSkQZZwKcFGY+WArNHVdHBYYcLIbGfV5dfOyOuNuhw+0wAwPZ2wXeTwKOx+jK/3vMWQII
 F8fzx8GzpLKz+1FLVvZg/L1Z0l1gHV9yGbhodztTg8lIM/ph5kGIWdPlrYc3kE6lBeDYwMXUB4V
 hpDzBW6r+bS9UW9GulM88EJtm2OolyABVtE++pVRLQbjfzxlrqVycJFcnNGiPqMMi0+Ln37ehAw
 EJGg6z1agOB6c9/bFDBQ8qm4K51W16GGZYZy3I3qy65dAtoTkCMFjXOkS/eaEwYsts+IgiMr772
 hitnLWK9h923lbPomP6P/S+FN+qIiOeiphNvW3PwcjMBoTwcynKY2yhqHt1K/KIjqJmO9GQ35G0
 zp0Hqr9eEwuRoaQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The code in cdns-dphy has probably been part of a DSI driver in the
past. Remove DSI defines and variables which are not used or do not
actually do anything. Also rename cdns_dsi_get_dphy_pll_cfg() to
cdns_dphy_get_pll_cfg(), i.e. drop the "dsi", as it's not relevant here.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/phy/cadence/cdns-dphy.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index f79ec4fab409..33a42e72362e 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -55,14 +55,6 @@
 #define DPHY_PSM_CFG_FROM_REG		BIT(0)
 #define DPHY_PSM_CLK_DIV(x)		((x) << 1)
 
-#define DSI_HBP_FRAME_OVERHEAD		12
-#define DSI_HSA_FRAME_OVERHEAD		14
-#define DSI_HFP_FRAME_OVERHEAD		6
-#define DSI_HSS_VSS_VSE_FRAME_OVERHEAD	4
-#define DSI_BLANKING_FRAME_OVERHEAD	6
-#define DSI_NULL_FRAME_OVERHEAD		6
-#define DSI_EOT_PKT_SIZE		4
-
 #define DPHY_TX_J721E_WIZ_PLL_CTRL	0xF04
 #define DPHY_TX_J721E_WIZ_STATUS	0xF08
 #define DPHY_TX_J721E_WIZ_RST_CTRL	0xF0C
@@ -117,10 +109,9 @@ static const unsigned int tx_bands[] = {
 	870, 950, 1000, 1200, 1400, 1600, 1800, 2000, 2200, 2500
 };
 
-static int cdns_dsi_get_dphy_pll_cfg(struct cdns_dphy *dphy,
-				     struct cdns_dphy_cfg *cfg,
-				     struct phy_configure_opts_mipi_dphy *opts,
-				     unsigned int *dsi_hfp_ext)
+static int cdns_dphy_get_pll_cfg(struct cdns_dphy *dphy,
+				 struct cdns_dphy_cfg *cfg,
+				 struct phy_configure_opts_mipi_dphy *opts)
 {
 	unsigned long pll_ref_hz = clk_get_rate(dphy->pll_ref_clk);
 	u64 dlane_bps;
@@ -289,15 +280,13 @@ static int cdns_dphy_config_from_opts(struct phy *phy,
 				      struct cdns_dphy_cfg *cfg)
 {
 	struct cdns_dphy *dphy = phy_get_drvdata(phy);
-	unsigned int dsi_hfp_ext = 0;
 	int ret;
 
 	ret = phy_mipi_dphy_config_validate(opts);
 	if (ret)
 		return ret;
 
-	ret = cdns_dsi_get_dphy_pll_cfg(dphy, cfg,
-					opts, &dsi_hfp_ext);
+	ret = cdns_dphy_get_pll_cfg(dphy, cfg, opts);
 	if (ret)
 		return ret;
 

-- 
2.43.0

