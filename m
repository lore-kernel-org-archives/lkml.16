Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A62827700B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355294; cv=none; b=qwQCkSlr0RZwGi41oMzo7Y8fmWrFhvgCSTuFUCuOnwg45Xaoa47eU7Kgt+fKwZCoAdOUXBA/K/oNnRA4QhY/rTWCsiT/JjZa5MlDKxs7Hw3/BrekZmp4QNCVj9WQ65uGMwf2+jVvMiFR+zzvFkRSKGTPlGvVg51xebVcaeqUzPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355294; c=relaxed/simple;
	bh=B/XX/1sBBg1VZc8S1AwtLNwmLgDDUs2220V3EEoEvt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utKnL0DNI3MPkKE7UlKeuDtSmBCYV0b1SpArS6xFhRuC0R90bsCflyoOImFRBIePBQQAZ2Jb1u/CXaqFp28MjZSnlDJbR21Z3rBqDR+KIeWhlKnmWiwJRPQnzX7GvHeMgbDWEVrWyz3n5/cbYIjfyx3WFMnWlBBDDxOEAn6j2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uJv4f-0002Ne-JG; Tue, 27 May 2025 16:14:37 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 27 May 2025 16:14:31 +0200
Subject: [PATCH RFC 1/4] drm/bridge: samsung-dsim: Always flush display
 FIFO on vsync pulse
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-dsi-vsync-flush-v1-1-9b4ea4578729@pengutronix.de>
References: <20250527-dsi-vsync-flush-v1-0-9b4ea4578729@pengutronix.de>
In-Reply-To: <20250527-dsi-vsync-flush-v1-0-9b4ea4578729@pengutronix.de>
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
 Jessica Zhang <quic_jesszhan@quicinc.com>
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

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..f5561a702c711dcdcddfc5262b8d675f0216169e 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -898,8 +898,6 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
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

