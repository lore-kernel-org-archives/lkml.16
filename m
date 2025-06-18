Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945D92E3AFD
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240797; cv=none; b=jrIZIRlD9URlQNwhAYN6zCRWMF3U0GKpYXKD75fK3VIP1cqDvmByjeOIGA6oAAVC22q/GYCTiLXFq2yh6Q+Ewug71czw3jWWYxRJYCdsJTpLhYjAHHAnHtuVLiOGdNsl0kCDiz0rjJj4uywfLvOW2Y4tN0w4B/64GPRvESv+2Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240797; c=relaxed/simple;
	bh=nOIk7nVK0gYGQHYfnFn+wepDOT+LG8Fpmo2vGsvo32Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQlX2MLUyBqMaCIplxytEkz7c9ErqGCKOwDhdDjlI+PwK01hOntnyVVIKCt8YlYISML1NOMTWx1CLNvikmz0DJLq3yNSidKrwifuxYBXq7zausE7WsZw45IfAuvOsBft7A1SEfPzygkoPtck1yy5goPOi4q7uWQGC4X2aoo3Yi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EpU1yAMP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EpU1yAMP"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79B6B5278;
	Wed, 18 Jun 2025 11:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240773;
	bh=nOIk7nVK0gYGQHYfnFn+wepDOT+LG8Fpmo2vGsvo32Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EpU1yAMPNLkNLJ6x8vjdJ8jtvjyV+En7JfsCRyqX1gZ248V3ysZuvghrIiBQwyfK0
	 KIvofryA8kxAElGDgNMQeWOib9yDN0+mvzdVdtkMrZrjnLw4YCeWrGJcjZv80uO1W2
	 CdUAsOOYmkC6UfqewNtTEXjjsYi1ph+ivhYPiPtM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:14 +0300
Subject: [PATCH v4 11/17] drm/bridge: cdns-dsi: Drop
 cdns_dsi_adjust_phy_config()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-11-862c841dbe02@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3979;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nOIk7nVK0gYGQHYfnFn+wepDOT+LG8Fpmo2vGsvo32Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo4Azi1FzGS5kuKlatY6+5w+Ff8BaSgyy6KKe
 9HlGyPbsJSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKOAAAKCRD6PaqMvJYe
 9U1dEACuVvO6hwjUGQePXtDyET3qfUTLzhf6GaexsOVTYP6R1oF1MdzccG6WAsgkQPpKZCeM5oz
 k3aoxDcty40HL9DV6UcpMkjZjBtek5YBnvW6u3Msd8CxPSIsprj+HR7BTN3mqKKWrRR3RkyMmgP
 t8AOdHYg2af97+cXxBpKtWKLGaIVmvx0RVTe5f8IS8BP4rf2cu9h0Y/Z/qgWc/PdSzOaH8pk4LZ
 0ACs73Qmx57MTziyfnGp6L4UMwOg/J3RHEcQbssvyHq24y574n1Rie0Cr3Rvat/CoEupgiloWMW
 8Qi6q8PMzko9bWsNnZxgMgZFltfw77ixLcusgmdJ5Kn3atFLS9SvcOPAnAHjWPHR4Rj50CDxk8V
 fNxayXsXuGQRV2X/WMounnoGZNGLlqeQwHg9s4nDp1IqEl2Fx8hlaMmUhCIZI7WnEmsgnhAtEkb
 LnlWSt+9c+MACdAW6AM/139yy+ufsAbeZpq/+0InpR52uRja27l+FxuL+17TjRPATad1rEowq9X
 A3yuYKOjLY7DXmElFW1n1pMi4+TOQUHgiRfRt/fUlFmKZI5fttVRt4Jp1b/t6DwVyQxo7dwwsGV
 4v4rDZAVsb7eQviSRwJBisrjhzFdGPDAiMi/Jh71lv8RKee8Wp59COxLwcPjKk9l9MlcfCrS8dD
 kd1JjyvT1lbtp6g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

cdns_dsi_adjust_phy_config() is called from cdns_dsi_check_conf(), which
is called from .atomic_check(). It checks the DSI htotal and adjusts it
to align on the DSI lane boundary by changing hfp and then recalculating
htotal and HS clock rate.

This has a few problems.

First is the fact that the whole thing is not needed: we do not need to
align on the lane boundary. The whole frame is sent in HS mode, and it
is fine if the line's last byte clock tick fills, say, only 2 of the 4
lanes. The next line will just continue from there. Assuming the
DSI timing values have been calculated to match the incoming DPI stream,
and the HS clock is compatible with the DPI pixel clock, the "uneven"
DSI lines will even out when multiple lines are being sent.

But we could do the align, aligning is not a problem as such. However,
adding more bytes to the hfp, as the function currently does, makes the
DSI line time longer, so the function then adjusts the HS clock rate.
This is where things fail: we don't know what rates we can get from the
HS clock, and at least in TI K3 SoC case the rates are quite coarsely
grained. Thus small adjustment to hfp will lead to a big change in HS
clock rate, and things break down.

We could do a loop here, adjusting hfp, adjusting clock, checking clock
rate, adjusting hfp again, etc., but considering that the whole
adjustment shouldn't be needed at all, it's easier to just remove the
function.

Something like this function should be added back later, when adding
burst mode support, but that's a bigger change and I don't think this
function would help that work in any way.

Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 45 --------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 7103878df1e7..f7d7d277367e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -508,47 +508,6 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 	return 0;
 }
 
-static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
-			      struct cdns_dsi_cfg *dsi_cfg,
-			      struct phy_configure_opts_mipi_dphy *phy_cfg,
-			      const struct drm_display_mode *mode)
-{
-	struct cdns_dsi_output *output = &dsi->output;
-	unsigned long long dlane_bps;
-	unsigned long adj_dsi_htotal;
-	unsigned long dsi_htotal;
-	unsigned long dpi_hz;
-	unsigned int dsi_hfp_ext;
-	unsigned int lanes = output->dev->lanes;
-
-	dsi_htotal = dsi_cfg->htotal;
-
-	/*
-	 * Make sure DSI htotal is aligned on a lane boundary when calculating
-	 * the expected data rate. This is done by extending HFP in case of
-	 * misalignment.
-	 */
-	adj_dsi_htotal = dsi_htotal;
-	if (dsi_htotal % lanes)
-		adj_dsi_htotal += lanes - (dsi_htotal % lanes);
-
-	dpi_hz = mode->clock * 1000;
-	dlane_bps = (unsigned long long)dpi_hz * adj_dsi_htotal;
-
-	/* data rate in bytes/sec is not an integer, refuse the mode. */
-	if (do_div(dlane_bps, lanes * mode->htotal))
-		return -EINVAL;
-
-	/* data rate was in bytes/sec, convert to bits/sec. */
-	phy_cfg->hs_clk_rate = dlane_bps * 8;
-
-	dsi_hfp_ext = adj_dsi_htotal - dsi_htotal;
-	dsi_cfg->hfp += dsi_hfp_ext;
-	dsi_cfg->htotal = dsi_htotal + dsi_hfp_ext;
-
-	return 0;
-}
-
 static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 			       const struct drm_display_mode *mode,
 			       struct cdns_dsi_cfg *dsi_cfg)
@@ -568,10 +527,6 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	if (ret)
 		return ret;
 
-	ret = cdns_dsi_adjust_phy_config(dsi, dsi_cfg, phy_cfg, mode);
-	if (ret)
-		return ret;
-
 	ret = phy_validate(dsi->dphy, PHY_MODE_MIPI_DPHY, 0, &output->phy_opts);
 	if (ret)
 		return ret;

-- 
2.43.0

