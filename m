Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AB2BE7A5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629149; cv=none; b=WP/EyC6nyCpcpERVh+wQf+JNUmoBiZDDt2K+sxG5Kjptw+Wr9imW1E/hO5eE+K/6nupWwUWa4hwC95gjB69a1QhQpdEz69SwaFXqhV05FisJGw+N2WTC6TKtqrooOLW38H+JhUdQ+RHGehThzxi4KgNoQu6OzhnfYzXJx7bM3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629149; c=relaxed/simple;
	bh=r2d2HB7/bIbl8ir7v45yLuBpRydPumEUWn8w+vZt7oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIVhJ09NIszh0oMsy+0DQrNwFJ7kS6bqNwivjBN6cI8HQk3ybWip89HJJqCdrhpoBu0ndlCndQMVnoBfIZumIeE+HdPpxnzMkf7VeUNlpbZ6jalaGJp3WUymiTpH3BpwZ8SpvdJPh1dyER0lhaed2aoyOY86F6fAsL0PhRmg1cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U5dRjQ66; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U5dRjQ66"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F1171995;
	Mon, 14 Apr 2025 13:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629012;
	bh=r2d2HB7/bIbl8ir7v45yLuBpRydPumEUWn8w+vZt7oE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U5dRjQ66Lq1/hkWT7FkeWTApkyoG56AWun/wVZZuTe6Em9Skptg1EXLDWZrrQP5Lh
	 g+zEPO7qZtY+jERvTjLCwTMrJU0NCSKIlBZChgxlGxr0ZqiqYZPFOwHZRZuBoXqt1U
	 T9zEb3jIzkRPhGBKK8FH9RSvoeWlTzMlfMVOxpIw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:17 +0300
Subject: [PATCH v3 08/17] drm/bridge: cdns-dsi: Remove broken fifo emptying
 check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-8-4e52551d4f07@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=r2d2HB7/bIbl8ir7v45yLuBpRydPumEUWn8w+vZt7oE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O1+dkbnt0hWdDmW1bZOk/SLwgABLeodN1zMT
 YScC+tVZw+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfgAKCRD6PaqMvJYe
 9f12D/0RvaGn/98qfrgGpDan09/UwnbQurUIFMYSbMQ6wuP9bBCmygmG3sEkO68lKyepmfrvqxE
 QYitozEFhIxhg2krvsIAjNAtEU6E/A+1V7STcf04oY3dUS+/xvCIqS+s4fuCt4WMRLkWtkdFkid
 h1yrGnvwdu1JZnHvfJfZzra0HxCO3DSDej73BSbxj7A3sa6edJ4FYBnPBXyZKPm2W8K6ykf7iw3
 VsR4W3wKEfrwcZtJPnnDB57RHoL3a0zPpHZfNg3fxXmz8h1iIg/cCAHWL3stefDSabS07L2ezEz
 iqRc95CY6soSMDgWgXjGcdNUzhozdib/1eBTsYkg5ScU3bNasBReTBD+/EuLLal5+3bnPCCOc9t
 PEUWE1UZJ0uu6KJ+44uTjVEry43T3V9GGSLJc4ZDinWeW6F1D76x69EgHqHB7OXG275wGRQMNQM
 0cFtIpkm3cJWLUHxNB9MxXZNtOT/aiM+v7LVM5IwUoD5EoiRaRdy8H1fijod8BLM+QJ5Qy/8VIv
 5ZIe0cL6aGiUkYg1Pb8j11U2W3PZG6L6NoYsWgmwJKTm5GhyWgR1eRj0fde218IgGzGMS4SzLLN
 4gMTE9izOlTRr37tQ5acLTTz5eaxQFWY5ZNYN7sjPKGWIVzI5CTi+k9YUclqQvCBQAWXPtKzdiG
 ytGws2lLV0tRL+g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver checks if "DPI(HFP) > DSI(HSS+HSA+HSE+HBP)", and rejects the
mode if not.

However, testing shows that this doesn't hold at all. I can set the hfp
to very small values, with no errors. The feedback from the HW team also
was that the check is not right, although it's not clear if there's a
way to validate the FIFO emptying.

The check rejects quite a lot of modes, apparently for no good reason,
so drop the check.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index d521ddb8bf75..bb8ac7161abf 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -553,7 +553,6 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
-	unsigned long dsi_hss_hsa_hse_hbp;
 	unsigned int nlanes = output->dev->lanes;
 	int ret;
 
@@ -575,20 +574,6 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	if (ret)
 		return ret;
 
-	dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		dsi_hss_hsa_hse_hbp += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
-
-	/*
-	 * Make sure DPI(HFP) > DSI(HSS+HSA+HSE+HBP) to guarantee that the FIFO
-	 * is empty before we start a receiving a new line on the DPI
-	 * interface.
-	 */
-	if ((u64)phy_cfg->hs_clk_rate *
-	    (mode->hsync_start - mode->hdisplay) * nlanes <
-	    (u64)dsi_hss_hsa_hse_hbp * mode->clock  * 1000)
-		return -EINVAL;
-
 	return 0;
 }
 

-- 
2.43.0

