Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A823CF08
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600692; cv=none; b=dHlln5lR9EyHLTy/TbOHcp/a5VWE5e/OPN+i+n53SqwMPLo5Ha1do8zTe3DiaRlkEe1XYF6wp7JWpYYDE1sxBvTryNYDj6fZF8qcDUB5YSKjclRXoMq7H9G8MOTxHrLRqStoZF9WsOU0p7qq7d6jM5AH32vyvhd4iNcW4plSUsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600692; c=relaxed/simple;
	bh=vjRuuRXkQ3UFqYx/0yC4s/4b1wMI2nCnKESmkXL4LGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l1FXnzZMqqL5i1KqibdfBoK5WngKEx7L0JRKDomzaS85SS3Sl/vawsC/mShzQAjZNHsyDLbekU3wpoJypHnKDHrf0FOyq9CSsEMWAxK6SzvcjjQCSXab0Xz2mKZddI0IMJt6RZ8DNh/K842AgaPjSMuW9kPAcjy7e3+B84SNStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bePSgVek; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bePSgVek"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04FC21FD6;
	Wed,  2 Apr 2025 15:29:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600572;
	bh=vjRuuRXkQ3UFqYx/0yC4s/4b1wMI2nCnKESmkXL4LGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bePSgVek6aFL2lIogvgla6Mc4vD1ekSrYF6lPAnZu3rboQXtuLIpHx4aj5I61/Sqg
	 +6jWuKieT/305mi9XK6UAJIfMg/Knu3foDyCfyldVvJWiXTXnsG72ibaUjisn+bwJh
	 nnG5NeAQacxM3Ha6vaZATZSaWcQaGBfp0TrmZk/I=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:50 +0300
Subject: [PATCH v2 08/18] drm/bridge: cdns-dsi: Clean up
 cdns_dsi_mode2cfg()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-8-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vjRuuRXkQ3UFqYx/0yC4s/4b1wMI2nCnKESmkXL4LGc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twe4ruVwjDyoZFcIcdKbfQD5zYgBMS52y27F
 sAMybOt7t+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08HgAKCRD6PaqMvJYe
 9feeEACuB7Lm9N6fMlgyo92alSQDJNrXcax5yxnsjAfUFi/MHJqlyXp5se2qMeu6PfMicvbDpKU
 hUvOc7vYBwAyq7Xte8qBrDKm3chOM8zxZ2862G8k13xTMI2Fm/OBIUtJhQpdm6WaRs1KuzLwZwh
 7WPyCe3BIeaLgtJ4tKWeTW7x7rOqpBbBHG9hB41tUibQFdYlIg6lKeGOgzcGU4uHVtbY0gwjg/r
 BRHwCtI5xEQSv01UgIQ7Api4Nb+js+jJuBAjzjJkaBP3VUkVp/RSBRMpBgYGnZVVJSXCB4juIDP
 oKwnDAIpb3M7Tb3XCe6eebc20WgqlwwA4SZToB08xsNYJmjVcHZkpcYLYlSdLK+XPa+quTFWDeX
 E7V2hSkJU/gnMXCW6/+ZmFFToCT/qyYJl7Oe15A4FuJV1wNxMrTYVAwBIp96R/gmX3sqUPOoVf1
 AYLBB1xsqllBmLioXpuFPip7Pbk1XGWEfK/GEah14PIt696Y3OMGBAbpr7QvGWZa7UdcN2Cnril
 +cxqBHxXmVqx1l9FAOpzWe9h29h1SvJk4hsXSJaFRiz1er3Xb7556cYqcwFShAmF0/K6+ywCwvo
 qbGm0bIttUKVGz+Oxx/rWWUWxdxTLV5EXa3NQULWvfF84+CM4VCDGpqN0CdgHGNSqZT5zRKix88
 5BRpV64LLORGLrw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Clean up the function a bit, mainly by doing the mode_valid_check dance
once in the beginning of the function, and grouping the calculations
wrt. sync/event mode a bit better.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 48 ++++++++++++--------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 9238acf69823..0aaa1d06b21c 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -481,42 +481,38 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 			     bool mode_valid_check)
 {
 	struct cdns_dsi_output *output = &dsi->output;
-	unsigned int tmp;
-	bool sync_pulse = false;
+	u32 dpi_hsa, dpi_hbp, dpi_hfp, dpi_hact;
+	bool sync_pulse;
 	int bpp;
 
+	if (mode_valid_check) {
+		dpi_hsa = mode->hsync_end - mode->hsync_start;
+		dpi_hbp = mode->htotal - mode->hsync_end;
+		dpi_hfp = mode->hsync_start - mode->hdisplay;
+		dpi_hact = mode->hdisplay;
+	} else {
+		dpi_hsa = mode->crtc_hsync_end - mode->crtc_hsync_start;
+		dpi_hbp = mode->crtc_htotal - mode->crtc_hsync_end;
+		dpi_hfp =  mode->crtc_hsync_start - mode->crtc_hdisplay;
+		dpi_hact = mode->crtc_hdisplay;
+	}
+
 	memset(dsi_cfg, 0, sizeof(*dsi_cfg));
 
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		sync_pulse = true;
+	sync_pulse = output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 
 	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
 
-	if (mode_valid_check)
-		tmp = mode->htotal -
-		      (sync_pulse ? mode->hsync_end : mode->hsync_start);
-	else
-		tmp = mode->crtc_htotal -
-		      (sync_pulse ?
-		       mode->crtc_hsync_end : mode->crtc_hsync_start);
-
-	dsi_cfg->hbp = dpi_to_dsi_timing(tmp, bpp, DSI_HBP_FRAME_OVERHEAD);
+	dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp + (sync_pulse ? 0 : dpi_hsa),
+					 bpp, DSI_HBP_FRAME_OVERHEAD);
 
-	if (sync_pulse) {
-		if (mode_valid_check)
-			tmp = mode->hsync_end - mode->hsync_start;
-		else
-			tmp = mode->crtc_hsync_end - mode->crtc_hsync_start;
+	if (sync_pulse)
+		dsi_cfg->hsa =
+			dpi_to_dsi_timing(dpi_hsa, bpp, DSI_HSA_FRAME_OVERHEAD);
 
-		dsi_cfg->hsa = dpi_to_dsi_timing(tmp, bpp,
-						 DSI_HSA_FRAME_OVERHEAD);
-	}
+	dsi_cfg->hact = dpi_to_dsi_timing(dpi_hact, bpp, 0);
 
-	dsi_cfg->hact = dpi_to_dsi_timing(mode_valid_check ?
-					  mode->hdisplay : mode->crtc_hdisplay,
-					  bpp, 0);
-	dsi_cfg->hfp = dpi_to_dsi_timing(mode_to_dpi_hfp(mode, mode_valid_check),
-					 bpp, DSI_HFP_FRAME_OVERHEAD);
+	dsi_cfg->hfp = dpi_to_dsi_timing(dpi_hfp, bpp, DSI_HFP_FRAME_OVERHEAD);
 
 	return 0;
 }

-- 
2.43.0

