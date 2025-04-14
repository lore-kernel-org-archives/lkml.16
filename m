Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AAA2BEC23
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629152; cv=none; b=dwgPz0UbQeWoLoFu5Um5N1HM+rHt/eCiu8lcMCbaZqTE/7OJ7iVdkqeGhS+bFecXgmspts9bS81yy+aHdStXI22pZqxsWMpcoBWHhsgTbNam5R2+H/q8mjGCFqtyUKoS6LF8cTQuLS3sDRDY93DPatw5xMPS08aJ5/RUP7MYARc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629152; c=relaxed/simple;
	bh=R1XPiSomlIO4vu4bVz8DbFGpvqP9IARB4z1KL47RG+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0xDwauWyg299Dj7IBTNEGpGc91EOn0Q5wv2+tSMAF7qlXMUOVdoYBlM2/Xqrs5O7dg4wwBIHNSoRTn+5zqM4VAVuIBrbYOlGfaFv156wczVJ3oJRrUIqxBzz+Z0wiz0ejZnhm7N+x/LZo/qJHPopacEV9d8RuqG4FRGX1XEzpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XyS7poA6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XyS7poA6"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C88242447;
	Mon, 14 Apr 2025 13:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629014;
	bh=R1XPiSomlIO4vu4bVz8DbFGpvqP9IARB4z1KL47RG+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XyS7poA63d4rQUlWmGTqL8dfgs0jdH/C2kKq9dD/nNJExE1Fgias+JvxLRy0WHyeC
	 3nhSWiiQvJ+GlKgG4p5u0rbk4HHTLWSvj8RP3v/s9yjumdMfbjsEmClz/R5UbaU1xN
	 R6tgY23MibySGXiK1AvV+JHsddw7K9PvUzvUjQ3w=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:19 +0300
Subject: [PATCH v3 10/17] drm/bridge: cdns-dsi: Update htotal in
 cdns_dsi_mode2cfg()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-10-4e52551d4f07@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=R1XPiSomlIO4vu4bVz8DbFGpvqP9IARB4z1KL47RG+c=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O1/9KEsI6Wtv/Qh6GwsKFCqn6PTH1ExO4ABg
 nSayMKzmVCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfwAKCRD6PaqMvJYe
 9QDnD/9GwQyrYZSRahjQ3ujF5k18LxofK9zxibQB5qX90ar7xkrh5xHrFVIyV4/UK3Kmsyj9gMK
 9cfCmgG6JUoGS9qCWEbhWJSWhk5nDZBrvBsX2MFFFYNhOw3r/M54WQZFlgA+a3qAK5TylwRmiO6
 40Xt7uXqdOjfoUQdwHx8ozFRw2rY1sY/xh0KjGANMEoRREuWinm127dMIlS/dj1mfykjKRJZtEr
 9jN1RyBfLLoCXMq1RVjmPB0CXexHVejUavYQDl2m9Yx8AGsOeINReyxtgEBK1OsxJK/oUqrH+ep
 1lRfUSt0clBcfqKEjtAyqt3W4ItpQz5qZsGNe9FChBB2frFPhadWEP8DvI6OaS0ohCLSMYxpqo/
 k6nRBcdq7S3rswoVCJ14PrSucTgyGPsVfmV//Kb8OpZd4VyvciBVvJKotFs/Cn47raBAnTkTx/i
 dbzQ+TVOsG6pybWFSDwxo5OT1NF3Ab6UlWv2vg6aa962wyMkw/M4hb/GLYeI0u573FspG9BQnUN
 Qm+GXMCUhCPV0P9tanqrWY3BlAYa6Cq58XHeYcMc7KIFxzpnjvzCzMkrchV5xaG1+cjTNGnHpqU
 7VkfB4ZvD10BkPNu15+Hb+ZJGhSY8ksm1XCzFImnV1NTzyzQPkfYMTQnK1S8BvPFbPIP1rXUsc+
 6GAIqtSstnz1iyQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

cdns_dsi_mode2cfg() calculates the dsi timings, but for some reason
doesn't set the htotal based on those timings. It is set only later, in
cdns_dsi_adjust_phy_config().

As cdns_dsi_mode2cfg() is the logical place to calculate it, let's move
it there. Especially as the following patch will remove
cdns_dsi_adjust_phy_config().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 4759fd6f79b0..fc034a9624a5 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -498,6 +498,13 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 	dsi_cfg->hfp = dpi_to_dsi_timing(mode->hsync_start - mode->hdisplay,
 					 bpp, DSI_HFP_FRAME_OVERHEAD);
 
+	dsi_cfg->htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
+	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+		dsi_cfg->htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
+
+	dsi_cfg->htotal += dsi_cfg->hact;
+	dsi_cfg->htotal += dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
+
 	return 0;
 }
 
@@ -514,12 +521,7 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	unsigned int dsi_hfp_ext;
 	unsigned int lanes = output->dev->lanes;
 
-	dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		dsi_htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
-
-	dsi_htotal += dsi_cfg->hact;
-	dsi_htotal += dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
+	dsi_htotal = dsi_cfg->htotal;
 
 	/*
 	 * Make sure DSI htotal is aligned on a lane boundary when calculating

-- 
2.43.0

