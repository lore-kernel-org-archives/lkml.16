Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2827423F422
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600700; cv=none; b=KvOTlCNRVDQf0e89X4YK7dnoTQl5eLYdvmEJVLT0eX9V93sVgM/ca5UddRcEBY28rctdcdQwmLNHnL7jo+cSsFzxdum/BCWAraPMpqqPHJu36QMEZzPlZknHwFba9+R+SWbyW3koM7rMz+1JCF6316CU0qsBRETo8Q25xRO9XfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600700; c=relaxed/simple;
	bh=NRiwCTHabbz+p81RY4GkrUeFRgzVyalNNk+RjRNcX5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MLpZd6QCqOtWTfvWwrs6kt5lelYnAY2nvn2E7HWJnKGzKolaRLwdUl1fKYV4wJ3rayHvof3zlOALBJcK94hNlUKp3T2+M1qN3LQT0nYAEitcfa0G9XKewNPoVMJJC3XLWSluK7r6XV+VqagAzzg3WtJsB3vxp+7bwxz5SwI6ZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R1/1KBEx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R1/1KBEx"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC2ED2462;
	Wed,  2 Apr 2025 15:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600577;
	bh=NRiwCTHabbz+p81RY4GkrUeFRgzVyalNNk+RjRNcX5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R1/1KBExfXLQe7uYnRhUvVpwZ+6WqqfR911hFWDEsBUCpjWJThhB4tgINO8soYh+a
	 PWOlEM5yeGFgsWDWQcxsM9xOejA4m7yTQ2JeohXkRxCOpbWaBimDai6YdRza/S/q15
	 u79JPCyG7NtIXZxUQ0jhQRoLq1tv23Mzqp6FIyKM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:55 +0300
Subject: [PATCH v2 13/18] drm/bridge: cdns-dsi: Do not use crtc_* values
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-13-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3185;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=NRiwCTHabbz+p81RY4GkrUeFRgzVyalNNk+RjRNcX5o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7TwgEslEJvR9Rc4ug3uU1XdfqYhOfdiaYk1nK
 v92vYpcJQGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08IAAKCRD6PaqMvJYe
 9dWUD/9ATKuRhrpAf5dk5R+z7ZUL3tLNU0Wz7KDGDLopcmgFyARqJwBE8pSz7MkS61+QZHM1rzK
 NL6V46R64DfI+o4NrGiCkFbc895Y4E8c4ycvQCYoDSsfW0qtzP7eNdnPys7NKy2KNgtG35daKSt
 MRIz+ZRzGe7nkfTFXa9ansPgtUQzEbXeokS33MrjKQDfkxwixFGqsLwOUBYUqTZQY9n66oXimIJ
 mFtusdSOJjrBb/jjmsS92crz2AzxUlFNwPqTmsuJv6ShWK8SWjdl0cxQGO+Aki7gNfh5JiC3E17
 A/uSf1J/ODbH56U3CZ/9T0gElZh04t36our6aAS1EKZj/LxmU1k0y/sC/ZdE7h0NGKU+J99GzPT
 LFjx1PoAfj0hQbmT5uu/rh/yATkZHif9Ix5slv69LPEnfVOvx3Enne2sJX9b6ZAedgYb0PyZ+/Y
 sMef89w3/Ax6m1eCNvNQ9Ieu7SWv999/Uku99PINMBHouCnQsn0+hu5DzNG7qClAbmXFEXDivRj
 tEN5+dSjXc10GQPu2BURm64p1pzxcRUkI2hT3porcs9WJatofIcOExJMxTpp3ty8zx1uB4V9fXS
 C/fM/giH9iGBa4d3nYUXeKqKT1/94sZb0lOyRokUOjML1KNpshtJkVjsSMJOq/Ehud7ir/74B6i
 3p4sfe9y0bgLSAw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver uses crtc_* fields from the mode. While I think in the
enable-path this would be correct, I do not think it's correct in the
check phase, as the crtc hasn't had a chance to update the crtc_* fields
yet.

Overall, my understanding is that the crtc_* fields are relevant only in
cases where we have things like interlace or double pixel mode, where we
have a logical and real timings. We never use those with DSI, so the
crtc_* fields should just always match the normal values.

So, drop the use of crtc_* values.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index cf783680b1b4..220213f5cb09 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -476,10 +476,10 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 	bool sync_pulse;
 	int bpp;
 
-	dpi_hsa = mode->crtc_hsync_end - mode->crtc_hsync_start;
-	dpi_hbp = mode->crtc_htotal - mode->crtc_hsync_end;
-	dpi_hfp =  mode->crtc_hsync_start - mode->crtc_hdisplay;
-	dpi_hact = mode->crtc_hdisplay;
+	dpi_hsa = mode->hsync_end - mode->hsync_start;
+	dpi_hbp = mode->htotal - mode->hsync_end;
+	dpi_hfp =  mode->hsync_start - mode->hdisplay;
+	dpi_hact = mode->hdisplay;
 
 	memset(dsi_cfg, 0, sizeof(*dsi_cfg));
 
@@ -540,11 +540,11 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	if (dsi_htotal % lanes)
 		adj_dsi_htotal += lanes - (dsi_htotal % lanes);
 
-	dpi_hz = mode->crtc_clock * 1000;
+	dpi_hz = mode->clock * 1000;
 	dlane_bps = (unsigned long long)dpi_hz * adj_dsi_htotal;
 
 	/* data rate in bytes/sec is not an integer, refuse the mode. */
-	dpi_htotal = mode->crtc_htotal;
+	dpi_htotal = mode->htotal;
 	if (do_div(dlane_bps, lanes * dpi_htotal))
 		return -EINVAL;
 
@@ -572,7 +572,7 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	if (ret)
 		return ret;
 
-	ret = phy_mipi_dphy_get_default_config(mode->crtc_clock * 1000,
+	ret = phy_mipi_dphy_get_default_config(mode->clock * 1000,
 					       mipi_dsi_pixel_format_to_bpp(output->dev->format),
 					       nlanes, phy_cfg);
 	if (ret)
@@ -822,11 +822,11 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	writel(HFP_LEN(dsi_cfg.hfp) | HACT_LEN(dsi_cfg.hact),
 	       dsi->regs + VID_HSIZE2);
 
-	writel(VBP_LEN(mode->crtc_vtotal - mode->crtc_vsync_end - 1) |
-	       VFP_LEN(mode->crtc_vsync_start - mode->crtc_vdisplay) |
-	       VSA_LEN(mode->crtc_vsync_end - mode->crtc_vsync_start + 1),
+	writel(VBP_LEN(mode->vtotal - mode->vsync_end - 1) |
+	       VFP_LEN(mode->vsync_start - mode->vdisplay) |
+	       VSA_LEN(mode->vsync_end - mode->vsync_start + 1),
 	       dsi->regs + VID_VSIZE1);
-	writel(mode->crtc_vdisplay, dsi->regs + VID_VSIZE2);
+	writel(mode->vdisplay, dsi->regs + VID_VSIZE2);
 
 	tmp = dsi_cfg.htotal -
 	      (dsi_cfg.hsa + DSI_BLANKING_FRAME_OVERHEAD +

-- 
2.43.0

