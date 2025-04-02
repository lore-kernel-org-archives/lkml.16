Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163C23F413
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600702; cv=none; b=R3UTHeeqxNml6GjXgxgQy7LA+IXjlQafnyxy+pMnx+woWjLbDyYMCy1j67s7JLlp+73anMxWr1NvG82hIkEN4cxHmFethl9NRuTaVLSGnkgY+MVYYNr5Kjvh4TAG3OQevmYvx9l+h53Q3txxt1cCjTx8ZN8p6Os212h4Wvknb/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600702; c=relaxed/simple;
	bh=IIDKgphBR8Z+MRb90fam19Jh4edh+nhVkDzVKuQW/rY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdM7Hs2z2q6lsJxKXfGFBoH3U7QAIgI7a5mvV1qC0jT/6AOLK+dCyd5pfQRzsMxy0Q2IOU8VvM/QWsNwkUxeRP6t8R5UvLiXxSlNYFEX1Yz7AiQNhISVTOO7j5pe3QPMBnNg5ixWDUcvVUsBMH5kwitC5TvkGEN4QWg/9F+ARw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ewM5tG4L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ewM5tG4L"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0252D25EC;
	Wed,  2 Apr 2025 15:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600579;
	bh=IIDKgphBR8Z+MRb90fam19Jh4edh+nhVkDzVKuQW/rY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ewM5tG4L4CyDBKjLkSnh7Rr31MZz7fmacUoHMQMziVAXkIX7yD4ZQ3F3N6n2wdbv/
	 HzBWmdmMDQX4K8btkW357qlv0EAC8avTWIiuEe+GPkZzs6wkWK/efBrhmIbzC16QJd
	 yumSuguNH+GOaHJSTfiUiF4x9yycs/yfPj50xyts=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:56 +0300
Subject: [PATCH v2 14/18] drm/bridge: cdns-dsi: Use videomode internally
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-14-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4546;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=IIDKgphBR8Z+MRb90fam19Jh4edh+nhVkDzVKuQW/rY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7TwgE/Bvc7519Sav63c0+qQ9diO63TzZq0FQt
 bfZL9SrcD2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08IAAKCRD6PaqMvJYe
 9VncD/9A2IAiZBtLzbDk1nuBNFg+G5KREDNLS8B4zuMU3PYMZaXqSsVkC7XtLfeNq7K7sqyUFWJ
 TOAu0B5cX6KqWqSMjJMk2O40xrNBfoC8X9LSwk0dWekEvYkgk0MEhk4bx0aPrV90XQh5hWSc7ou
 nn17eQTJm+++ctGVPCQ2CEyoRnA5yxyuXUDKWV+wM+lE7kEL6sQXrfN66aUHV0HEwKgbVM9kQIk
 YK1KXS/Ing/hhEn5jwAeq1AzInP6wNvu6UOMjz1qYKoRWobkYw4ccAPK6+X47PTq1L6mVw1oBgs
 9CRLlRS/jhzzURio7IedIGL9oW8U9EihYeYo3ao8IKygZDQH288xX3qLDLVWLypVcktZvmIiMDA
 zX273jVH+BrLsooaYPk5fGLMVOCNEWjtlvPpcQSL7IBjZKgKM0Gv7fa6Q5cCSx47tTcrY3TOoYQ
 v5atM+ropp+FV9Q4MV8Onvw3hur+38pdZB+ZNzb471C8dWlsGmnS/tKbBkIH8CfkuH02nVNXAnw
 F4P882pDYymsmLJlp7C8ND3GaRFXNmSJZ34rlpoxjfP7zwXDGP9O7F3b8xTmIELWjalqC4Pi99p
 KJZs7q9fY092WkvCOtBMdb2vqDeDzPYhSjj/siufqhqs1ZAVbphJU7BHmUA6j+Q8khTD/IExsPH
 XBrm62/72WB7nMg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The drm_display_mode is a bit difficult one to use (we need hfp, hbp,
... instead of hsync_start, hsync_end, ...) and understand (when to use
crtc_* fields).

To simplify the code, use struct videomode internally which cleans up
the code. If in the future we want to use crtc_* fields in some code
patchs, that can be easily achieved by creating a videomode from the
crtc_* fields, and no change to the functions that do the work is
needed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 31 +++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 220213f5cb09..1a30e2f7d402 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -9,6 +9,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_probe_helper.h>
 #include <video/mipi_display.h>
+#include <video/videomode.h>
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
@@ -468,7 +469,7 @@ static unsigned int dpi_to_dsi_timing(unsigned int dpi_timing,
 }
 
 static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
-			     const struct drm_display_mode *mode,
+			     const struct videomode *vm,
 			     struct cdns_dsi_cfg *dsi_cfg)
 {
 	struct cdns_dsi_output *output = &dsi->output;
@@ -476,10 +477,10 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 	bool sync_pulse;
 	int bpp;
 
-	dpi_hsa = mode->hsync_end - mode->hsync_start;
-	dpi_hbp = mode->htotal - mode->hsync_end;
-	dpi_hfp =  mode->hsync_start - mode->hdisplay;
-	dpi_hact = mode->hdisplay;
+	dpi_hsa = vm->hsync_len;
+	dpi_hbp = vm->hback_porch;
+	dpi_hfp = vm->hfront_porch;
+	dpi_hact = vm->hactive;
 
 	memset(dsi_cfg, 0, sizeof(*dsi_cfg));
 
@@ -510,7 +511,7 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 			      struct cdns_dsi_cfg *dsi_cfg,
 			      struct phy_configure_opts_mipi_dphy *phy_cfg,
-			      const struct drm_display_mode *mode)
+			      const struct videomode *vm)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	unsigned long long dlane_bps;
@@ -540,11 +541,12 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	if (dsi_htotal % lanes)
 		adj_dsi_htotal += lanes - (dsi_htotal % lanes);
 
-	dpi_hz = mode->clock * 1000;
+	dpi_hz = vm->pixelclock;
 	dlane_bps = (unsigned long long)dpi_hz * adj_dsi_htotal;
 
 	/* data rate in bytes/sec is not an integer, refuse the mode. */
-	dpi_htotal = mode->htotal;
+	dpi_htotal = vm->hactive + vm->hfront_porch + vm->hback_porch +
+		     vm->hsync_len;
 	if (do_div(dlane_bps, lanes * dpi_htotal))
 		return -EINVAL;
 
@@ -559,7 +561,7 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 }
 
 static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
-			       const struct drm_display_mode *mode,
+			       const struct videomode *vm,
 			       struct cdns_dsi_cfg *dsi_cfg)
 {
 	struct cdns_dsi_output *output = &dsi->output;
@@ -568,17 +570,17 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	unsigned long req_hs_clk_rate;
 	int ret;
 
-	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg);
+	ret = cdns_dsi_mode2cfg(dsi, vm, dsi_cfg);
 	if (ret)
 		return ret;
 
-	ret = phy_mipi_dphy_get_default_config(mode->clock * 1000,
+	ret = phy_mipi_dphy_get_default_config(vm->pixelclock,
 					       mipi_dsi_pixel_format_to_bpp(output->dev->format),
 					       nlanes, phy_cfg);
 	if (ret)
 		return ret;
 
-	ret = cdns_dsi_adjust_phy_config(dsi, dsi_cfg, phy_cfg, mode);
+	ret = cdns_dsi_adjust_phy_config(dsi, dsi_cfg, phy_cfg, vm);
 	if (ret)
 		return ret;
 
@@ -975,12 +977,15 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode = &crtc_state->mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
 	struct drm_display_mode *adjusted_crtc_mode = &crtc_state->adjusted_mode;
+	struct videomode vm;
 
 	/* cdns-dsi requires negative syncs */
 	adjusted_crtc_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	adjusted_crtc_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
 
-	return cdns_dsi_check_conf(dsi, mode, dsi_cfg);
+	drm_display_mode_to_videomode(mode, &vm);
+
+	return cdns_dsi_check_conf(dsi, &vm, dsi_cfg);
 }
 
 static struct drm_bridge_state *

-- 
2.43.0

