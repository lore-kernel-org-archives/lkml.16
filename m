Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43F29C34D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629144; cv=none; b=bz9D760Pk/Q8R3WtXuc7z+2TV3Ix465UfLmI3ZIoknYFZ3lmDVi79FuA9IKcWukcY6iKGKhw5sIWTuco14cmD/mglmvzR0RB+Oaqya8l0zbePUwre35JWTKz8iBnz5rY/+lfFOFFDTMGm8eG3USyYFQpOmgbRA0YMosczKTkMOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629144; c=relaxed/simple;
	bh=Vp6riUjIzDMXhg8AyDl9dAqQ+4STX4wOuNTSlWToDlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ra7q6w3hqQqW1dq4mAnc43o85ns3zroRs2Yj0oWQ9Aym8vo6D60lDFhmLSqvlZlrOSUMYEPRYJSXb4yb6vdSdhyRUyb3JDhIsPC2B/L7+2S4T201eTv4EnNFbjj5cxdt0LrykTH4XlBUJVEsY+0u7O0BBlJcXZMnWKQToCLIBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u8R5oUxA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u8R5oUxA"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDCB0502;
	Mon, 14 Apr 2025 13:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629008;
	bh=Vp6riUjIzDMXhg8AyDl9dAqQ+4STX4wOuNTSlWToDlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u8R5oUxAOj1jslmwrAWd9tLiJVUxVef6gai2AV83h0MUZLnziOMjk4o333o+yboi2
	 sjqv8S4ol/Vxn3bcGTREVGsScCLrNwsQC+FIgGlXBWVOWalBSwtGL2iZh30Na8vO9k
	 XosVRuMdSds3iVB6QZlLkEjezrsvEQttY014WIgQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:14 +0300
Subject: [PATCH v3 05/17] phy: cdns-dphy: Remove leftover code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-5-4e52551d4f07@ideasonboard.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
In-Reply-To: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2229;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Vp6riUjIzDMXhg8AyDl9dAqQ+4STX4wOuNTSlWToDlg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O193Zf7j/VU5OcrE6QZ6/+BsWaBEoUMSmr4o
 IxRY3HuK++JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfQAKCRD6PaqMvJYe
 9caeD/0bi72o7Jy2amqYxym6vqN/ptvBV/YvewmbV1spqmP85BG570h75atCXVqjqZqngHpPAV4
 a6pRaFHCUrkvjbNqF/KbifzaIB3neOWYQE7hUMX3JwycsWWDCJh+DnATzBha4K8zFljWTye81AK
 tD8hWjsptLvLkPpBkLphZvTjZ99Rf9B73pi36uLf+ZBR2ah3xvFRfnyCWwFq7zV6rx0aV3TL2yE
 72EzNrOGxUiFwsfv7iATciEvhmYgztLJ4FoRcYib4etfRxbhw41uKABEr1Du2npss4jbiDQ2fx6
 rBWdo43iqcWWfH2g3I8w/pceF38GzytZJoDbKSbOT9NJCchvtsnRDV/jjH31jAKgqfBrwz68DHL
 OV5fbGZNAAyfx2cMw1wXASrLVdaWWGuObSEAW81CwxQehScFVisdTxdOKqWzqKlsnhRbZ8OYfwC
 XJCP9y9+BAlofwM0nMuNknquQfFCNIhQznmPAQCXZpPGRAeQbqiezdxjZJJKWctDjjIuoNAF+3V
 iC6Oe/dYy2Xr1+XPklqzsfu4BAW4EPkUn79lk4bqZlbZDEdhBi0y7QBvUmRBzZCUvhlre4PbVVZ
 eyE3LoPfby7uIdFAT6lXETb8Cz1Ib63hyLMXj7cTrX5fbztzkl3uQ+LTe/USbBuUXfM0HtCK7dN
 Hxk5KWZVK/RqMXA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The code in cdns-dphy has probably been part of a DSI driver in the
past. Remove DSI defines and variables which are not used or do not
actually do anything. Also rename cdns_dsi_get_dphy_pll_cfg() to
cdns_dphy_get_pll_cfg(), i.e. drop the "dsi", as it's not relevant here.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
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

