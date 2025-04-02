Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0023C8D6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600691; cv=none; b=cMThqh8j7q3GmbJSOGq4w5ZroyNxI1FEI+TOb1J/PMx4E2IHbM/hZc83FcbhjRcIKRRc9PZy+0uBG6mI8LBpp7c+J7J9S+oFmFJXtzShdbmb1GEzfZQcqQLx6w08JPppvacJwPOVHBhZXc2yvKEwW5mV8tdjTIcn+OdSC7w/6n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600691; c=relaxed/simple;
	bh=S8uUUDEaNeicbiSY8YvRq9DMlAGVbKYKCtdKJ0sZaN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6XWRA6WzVeDgUVSmha5+ESHpi8r59Rsxd4tobuuAlOG1ooz8kbwXN18eRikIAgIWLZfWmySpNPEUoUCdQu/IDQl7Y8ULM3xIdrvMrHynBg9vvyKZNl+uOOltTX+d7gNOa28EZqoH1uCg+lyGNjnLvpfSsHdgyrAEhG2mFbJYVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TbQrJStT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TbQrJStT"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0A2E19E1;
	Wed,  2 Apr 2025 15:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600570;
	bh=S8uUUDEaNeicbiSY8YvRq9DMlAGVbKYKCtdKJ0sZaN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TbQrJStTAPF/eX2uVj21oQLUiAQSdSbuRTR8bEbdfA1mEtwLCjQNHwn9xj/cNFzqg
	 bRrN/9IxkjOov7R65sbDIpt1ExDvfOSYFub3T8h0VHPPjShL+SrFUAoyv5IyYTUT1f
	 qB/8V5uw8CvyXOxrbIzWhj0QWZPElZn9/571LhF8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:49 +0300
Subject: [PATCH v2 07/18] drm/bridge: cdns-dsi: Fail if HS rate changed
 when validating PHY config
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-7-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=S8uUUDEaNeicbiSY8YvRq9DMlAGVbKYKCtdKJ0sZaN8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twd0AEPulojI4YQTGxGlw6WhL0s6oojtNNCo
 xGjiLne1PSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08HQAKCRD6PaqMvJYe
 9YEcD/0bgooVvLCuu3FLtqeH3YC4ZA8SY/8y8p73Uq7oomgpTBroT3IKCHwFz5CGjRwFwKyvKWU
 49YHzXWtvHKvaG5zkLT4/DBlXEshXP6ss5n2mSE6cUres/zdcuLKUw34XI23inbILk5hQ9STkFA
 ydYNpT/3gwzcfi8YEL99Z1YnkcBNDNTbEhugwFiZin620DQyVS75prnbIpKtoV8w5ZWP0Qil7WC
 IEfpDvajZ9YgClKsudDokHQQbYdfYKPE32S/O1uESrHiC0hukSDENMiCovaMsUfgZVEV35Qlkdk
 g36FPQQuQTBb57Q6rENl62mfPACfkA470gD5eMCLWE/KfwDk/ztpblrh8/VbII1VRZH029ybkOf
 cbe+JBhQO03GlaI3XY7h+xGu2uEEhm3yVr4JrQCQueKk1dDMF9GVMqNKR2vFUqIj/RfAHc4FeLh
 fFttc4ylimhxsqb14tzONvAZViku9y05/6Z/2947F3shnrzBz2dFk611s5ClKK4aTujvexVjz3d
 ltQIzcJzOSYQp8tkfb/iOe9kh78TVN0H9gZer9Sw5VWfZ3Dt4SVfjhMhkQS3aLFHFtAdNx5c6Yo
 RywJDjX0/pfoIinfbZeLodLfe6cVHrqDdvbZjJaowgpPnuxG5E+T8IedpBrRBjis/o4LdsVOA4K
 oGfwJfwi+7y+85w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The phy_validate() can change the HS clock rate we passed to it in the
PHY config, depending on what the HW can actually do. The driver just
ignores this at the moment, but if the actual HS clock rate is different
than the requested one, the pipeline will fail as all the DSI timing
calculations will be incorrect.

There are ways to improve DSI operation for various clock rates, but for
now, just add a check to see if the rate changed, and return an error if
that happens.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 53322407c1b0..9238acf69823 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -580,6 +580,7 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	unsigned long dsi_hss_hsa_hse_hbp;
 	unsigned int nlanes = output->dev->lanes;
 	int mode_clock = (mode_valid_check ? mode->clock : mode->crtc_clock);
+	unsigned long req_hs_clk_rate;
 	int ret;
 
 	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg, mode_valid_check);
@@ -596,10 +597,20 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	if (ret)
 		return ret;
 
+	req_hs_clk_rate = output->phy_opts.mipi_dphy.hs_clk_rate;
 	ret = phy_validate(dsi->dphy, PHY_MODE_MIPI_DPHY, 0, &output->phy_opts);
 	if (ret)
 		return ret;
 
+	if (req_hs_clk_rate != output->phy_opts.mipi_dphy.hs_clk_rate) {
+		dev_err(&dsi->dphy->dev,
+			"validation changed hs_clk_rate from %lu to %lu, diff %lu\n",
+			req_hs_clk_rate, output->phy_opts.mipi_dphy.hs_clk_rate,
+			output->phy_opts.mipi_dphy.hs_clk_rate -
+				req_hs_clk_rate);
+		return -EINVAL;
+	}
+
 	dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
 	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 		dsi_hss_hsa_hse_hbp += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;

-- 
2.43.0

