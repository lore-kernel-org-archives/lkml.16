Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B623E33A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600695; cv=none; b=nrKnjLKyzQQiyxjIL1rMOfG2MIJRalh3GqjWjmyXu3TcMZBxkmOQhLqhGz1lpyBKf5SYnL5TLsG2fTxYPNsidkceHXby3cljNM5xRsP4IWMN5aoP24AcRM/mjYfAkt9pMsr4mo1xwsxJjMZC7Qi8yH5l1klAPAJPOS+43+TIhIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600695; c=relaxed/simple;
	bh=terDw8VLDSycV/I6fcyF4BbvPpfjEASKJADXJuIxv/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5LFyzRzodQA98yfB537J9+3fwOUoCnDwyrFjUPVlZ6UHI5AdkFBH9rNV+e0wbm3J5RDeOYt9rvNc3pxfvP6Voo/maZOmKOximghD/welXR0lCGd8W8iawwOdc4J5iwR31Io51XWLHkyBcjVEVee++jgHnnzR3sxQkJgydlg8FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ho2aCxgA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ho2aCxgA"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FDB82434;
	Wed,  2 Apr 2025 15:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600574;
	bh=terDw8VLDSycV/I6fcyF4BbvPpfjEASKJADXJuIxv/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ho2aCxgA2Wca4y/Fx9LV5m1CBUTqC0FR0oSA/lDRGCmWLPztwKzsQPOJj22M3kFil
	 IYprW4tjzvrcF2DR+kVKOevgomS3+CFYqqw0qkPfA/143TfoLsxKl8863mmnzEvJ9n
	 OcaX1ac63U/AVoDZaATIUXUV5fw2xY6xoLJ+RJes=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:52 +0300
Subject: [PATCH v2 10/18] drm/bridge: cdns-dsi: Fix event mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-10-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2987;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=terDw8VLDSycV/I6fcyF4BbvPpfjEASKJADXJuIxv/I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twe/tVteqeFa2Ic65dsnEnKHbgdu1Loaivie
 SSxoDo3+RmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08HgAKCRD6PaqMvJYe
 9ci7D/9OtgQL1krF/aw7wnzN0htt0P7N47K84a6EPWb7y4IMK5MQZdsqKuijjPHF6z/ClvNgiho
 /Uh3mJCxDtp18WXVfLy0TAJUKJi+4tatoj2RES+oBDmP/auadigIcKTSDlvNlUI6S5GOj64hBj/
 d04YpnuXZeHpteVxUqAm4s8Dj+g33JB7Ap2Ly2yEfa9rAJb4PNIKnaa9qxe6E7Iu8ZuspmNVh/Y
 UvgJhurgvGHO3BSZmce9Oh47/cSrMRLP4W14nbEioXRe9YebaqD8f5WC5xaIiFaM7272U5WFbt8
 15fZpF4ZkzmURY1FFy8Hq68NDl/WDQ7Ic0v2tTokcLCbp+pq7fDQSrlRoYiK+ZT/xRYdi/0AZIj
 V1+fwOK+OHvcDlfFzi/1AaixDq1jwghtIIIwVuCqunKxiuBWzOJgknZchoodaFTHC8B3k5GPy3L
 1XC2GIHNbRbShvhwwUFPNJiEiPLLZuE3lFL8XZAAn8Y66SMZdoYfaNc5GZKEc0gNAP5NiqqOwhZ
 +VZul9N6SNqO4BbaYctQboVh37y8drjWLuH0DtGp/8lbU3dgTD3AOd6iv5q4k+RWEHQVax+IH1W
 9SMnLFY2gscCgs8XoE4PfVB6ZJbS5AvkzRqtPvXhKU2G27ZyiAFO9Dlj6ke6vQx64dSnFTZrgqs
 V/6UA0/8jBLtslg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The timings calculation gets it wrong for DSI event mode, resulting in
too large hbp value. Fix the issue by taking into account the
pulse/event mode difference.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 33 ++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 62811631341b..9797e6faa29d 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -417,7 +417,8 @@
 #define DSI_OUTPUT_PORT			0
 #define DSI_INPUT_PORT(inputid)		(1 + (inputid))
 
-#define DSI_HBP_FRAME_OVERHEAD		12
+#define DSI_HBP_FRAME_PULSE_OVERHEAD	12
+#define DSI_HBP_FRAME_EVENT_OVERHEAD	16
 #define DSI_HSA_FRAME_OVERHEAD		14
 #define DSI_HFP_FRAME_OVERHEAD		6
 #define DSI_HSS_VSS_VSE_FRAME_OVERHEAD	4
@@ -503,12 +504,18 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 
 	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
 
-	dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp + (sync_pulse ? 0 : dpi_hsa),
-					 bpp, DSI_HBP_FRAME_OVERHEAD);
+	if (sync_pulse) {
+		dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp, bpp,
+						 DSI_HBP_FRAME_PULSE_OVERHEAD);
 
-	if (sync_pulse)
-		dsi_cfg->hsa =
-			dpi_to_dsi_timing(dpi_hsa, bpp, DSI_HSA_FRAME_OVERHEAD);
+		dsi_cfg->hsa = dpi_to_dsi_timing(dpi_hsa, bpp,
+						 DSI_HSA_FRAME_OVERHEAD);
+	} else {
+		dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp + dpi_hsa, bpp,
+						 DSI_HBP_FRAME_EVENT_OVERHEAD);
+
+		dsi_cfg->hsa = 0;
+	}
 
 	dsi_cfg->hact = dpi_to_dsi_timing(dpi_hact, bpp, 0);
 
@@ -532,9 +539,12 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	unsigned int dsi_hfp_ext;
 	unsigned int lanes = output->dev->lanes;
 
-	dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+		dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_PULSE_OVERHEAD;
 		dsi_htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
+	} else {
+		dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_EVENT_OVERHEAD;
+	}
 
 	dsi_htotal += dsi_cfg->hact;
 	dsi_htotal += dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
@@ -607,9 +617,12 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 		return -EINVAL;
 	}
 
-	dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+		dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_PULSE_OVERHEAD;
 		dsi_hss_hsa_hse_hbp += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
+	} else {
+		dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_EVENT_OVERHEAD;
+	}
 
 	/*
 	 * Make sure DPI(HFP) > DSI(HSS+HSA+HSE+HBP) to guarantee that the FIFO

-- 
2.43.0

