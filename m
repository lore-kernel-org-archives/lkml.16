Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF75323C385
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600688; cv=none; b=f5fwvBg6l1ln947IdlBrQya1lPFAH5D0DZUXXz4z7H2EQLShOYJgHQ9MhHsRhKoSHO8KAaG89HILlO/Bgw1xlskJ7lEyXm/YmFJ5P1UdsjKqu6dEB7aykvFyGqAvspmEzqIP0V2dUZzK2XRW/QIIKrIfqHw9j1Oi9sMXn0OJdwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600688; c=relaxed/simple;
	bh=c1oUALt2KZgajaeiEy/9OAK/9/j14NZ5nS73HsxdZOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XerS79Y+8LJCkH7nOpIilDC+P3ATuU6ha2FbzQMeJH1Q+SIb1Oah0MbkMk/lalEUGqLtDTtcyLOah4nLEOPLrDRYtqZtzemG0uuoo9iPrvQTWM3fndy3Mdtqyci2qNjAScqYjUBqifjsXn18pUTj9RHMHVI5g+uDBwMV9+C4RV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wXmGBINm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wXmGBINm"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 861F81990;
	Wed,  2 Apr 2025 15:29:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600568;
	bh=c1oUALt2KZgajaeiEy/9OAK/9/j14NZ5nS73HsxdZOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wXmGBINmOlLXn1vTyhMmFZrXUAfsfyZtR9pUGb0w99+dJ58rFxlqXdfSyz+58BF3h
	 H018uSJwxkNFLeBm2pZkm3R6mcjrWaoUaU+gxWkMwgcGgHDF0+/8aGiR8ub/CKFaGB
	 S2D0dDF0K5AGe7ojFYzsR+sf3HN2mVWuDAl4Z++4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:47 +0300
Subject: [PATCH v2 05/18] phy: cdns-dphy: Remove leftover code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-5-4a093eaa5e27@ideasonboard.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
In-Reply-To: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=c1oUALt2KZgajaeiEy/9OAK/9/j14NZ5nS73HsxdZOA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twc8yDvZ1RQJmWUsNT9bt28ZCh+IWNxKTyfr
 JxisTgoyRGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08HAAKCRD6PaqMvJYe
 9cqHD/9RumZ2gSAlo7blCD7hh6ZrKtGOq284AvCCYaDZvrs4Mzx2hggPApHUDHtXlpnebCAF48s
 JDRfz/OAfVIR184WRUzqOPBH1VxP22ztZsJLwqGVDvA/o/IMTQfNzmIeFHArLZ5JLOH+t7o27Pt
 BlgXlBUJn6BIVrW1X9mDuYfrpLRObGkDbNo3iyQkykFD314zD91/O4YJ8Ik8RuqZeeV0bceFKr8
 k2zpHNKg4dYmODOlGEFBdCxjRxcDAIwJkyUtPvcFkgjo8J1i3pkExPTTDkqrJOIqR/qVDZGBUrQ
 WgVHoDXspczgFPTAF4uBACOXICC04RifuCSxHGZ3ET2Pszvg8Ju2KHcraEUxDIOb8HB9YZQNseq
 EUbfzuFLhe4Maj624ts32U3VifQtHflpK5VYr61NOoR2Z+Flrn4p6oM0CWIImb5gbraKDnaFbIz
 BuN8Cyw16yQ1Oa5oP3DJeRbZhGbJuYP5XjGQ4gh15Me+Ao0JrZawQ41eVaV6041pJzCCT+8oYsY
 BnzAwg/FgZ6/YdP8X1hMyqgArhoSfrNo4hKvHD4WsvagnI1ObkJYZWoDM6v8sM5ge9T2RQHPdr3
 zpItaUkyesVtWXZ3MJZRYryv8gMAMJmskOeHcEPKxOIEJ5Fncw0tFtIBwxRYfDzSlKnqPGaf9L1
 7/75V09J/IMEAUw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The code in cdns-dphy has probably been part of a DSI driver in the
past. Remove DSI defines and variables which are not used or do not
actually do anything. Also rename cdns_dsi_get_dphy_pll_cfg() to
cdns_get_dphy_pll_cfg(), i.e. drop the "dsi", as it's not relevant here.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/phy/cadence/cdns-dphy.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index f79ec4fab409..7f8b70ec10c5 100644
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
+static int cdns_get_dphy_pll_cfg(struct cdns_dphy *dphy,
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
+	ret = cdns_get_dphy_pll_cfg(dphy, cfg, opts);
 	if (ret)
 		return ret;
 

-- 
2.43.0

