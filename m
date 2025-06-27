Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4E1DA21
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024772; cv=none; b=d0AQy5LKZdPpzCyaEaBD8LDVuvrcMfPNyYm1RqrahxASEIEZxPZpjv7HD5Fajko4V2Naa/imDQEPii6zUXODPl8Se+cPDWVxHrtIfZd57JkqCoJmQ5Q88JUcBoEijY45n1rUcdbMp7LMGw7S+Ybcx2dXk00rGUgOuRoYKvZGmXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024772; c=relaxed/simple;
	bh=s6zS0pHWcMOOiTba1t96zuUE7lsjYKkRW4PgdkGPxKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ff/wdr4dQDD1xMDuPUt4EYMac1qLMiZCVVX/MjWL6Axsa6Rg3CT/EyZCCLbK56ci3fx5JP6Qlrkh/iEKSrBbLfFpX0OeOM2TlOk4E1wX7nvehcyHoker4XOvRdb+4k6m30/9AZycPb96fMYy9+5YWxJHK+T3D9+XKYGSentTDb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uV7Wi-0004N2-Ip; Fri, 27 Jun 2025 13:45:52 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 27 Jun 2025 13:45:38 +0200
Subject: [PATCH v2 1/4] drm/bridge: samsung-dsim: Always flush display FIFO
 on vsync pulse
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-dsi-vsync-flush-v2-1-4066899a5608@pengutronix.de>
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
In-Reply-To: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Always flush the display FIFO on vsync pulse, even if not explicitly
requested by the panel via MIPI_DSI_MODE_VSYNC_FLUSH mode_flag.

The display FIFO should be empty at vsync. Flushing it at vsync pulses
helps to remove garbage that may have entered the FIFO during startup
(if synchronisation between upstream display controller and Samsung DSIM
is lacking) and that may persist in form of last frame's leftovers on
subsequent frames. Flushing the display FIFO if it is already empty
should have no effect.

This will allow to remove the MIPI_DSI_MODE_VSYNC_FLUSH flag, which is
only used by the Samsung DSIM bridge driver. Arguably this flag doesn't
belong in the panel configuration at all: flushing the display FIFO on
vsync is a workaround for issues with the integration between display
controller and DSI bridge, not a property of the DSI link between bridge
and panel. No panel actually has a requirement to receive garbage or old
frame content after vsync.

I wonder if host controller FIFO resets are mentioned by the MIPI DSI
specification at all. This patch is based on the assumption that the
MIPI_DSI_MODE_VSYNC_FLUSH flag only exists because the DSIM_MFLUSH_VS
bit happens to be located in the same register as the bits controlling
the DSI mode.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 8ec6f4e7952f1f0cc1fc977732d8e457d6eb5012..c4997795db18280903570646b0a5b2c03b666307 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -897,8 +897,6 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 		 * The user manual describes that following bits are ignored in
 		 * command mode.
 		 */
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VSYNC_FLUSH))
-			reg |= DSIM_MFLUSH_VS;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 			reg |= DSIM_SYNC_INFORM;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)

-- 
2.39.5

