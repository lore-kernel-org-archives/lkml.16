Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6B5277808
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355295; cv=none; b=aafrNiBEaiI3wRkQ9D3+DHz2x40JroPsPadDzW5fgsv43lMO7li2KFM7ZL4Tpq8BZORWc5pMztaMx7fkCMEopbV2+mvDxNMbHOh83iWMg+f+ottu0ReoWy6tHHs2kRVWG/sLGFWEquhA6C/tIY0DbCVdbkxsVdceglgp6daq2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355295; c=relaxed/simple;
	bh=peiJyurqLp3tI+dD9Pn5GKyW4tfCigbVpvCbR5h9q0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZkDOIXiKO36tR3zzSGaduBhHyvP7O+EuGdKVvi4l4VI+kevqzLdUEkME5H2xmwwNKCCS/jVrQAaZUgh5Z13+oC5I7pX3hRA67E4UU/Rd22Lk/fB1+ji85MNg/9rhGnjLSJZ/OrzDrq5nFo3bSwsWf2K0d1F3KZkiP19Ae7M3oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uJv4f-0002Ne-LQ; Tue, 27 May 2025 16:14:37 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 27 May 2025 16:14:32 +0200
Subject: [PATCH RFC 2/4] drm/panel: samsung-s6d7aa0: Drop
 MIPI_DSI_MODE_VSYNC_FLUSH flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-dsi-vsync-flush-v1-2-9b4ea4578729@pengutronix.de>
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

Drop the MIPI_DSI_MODE_VSYNC_FLUSH flag from DSI mode_flags.
It has no effect anymore.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index 93f11e2e9398782ed10c70159c25fbd5d9f4eb4c..986b3a71a17458cb60bc81338dcce1b24b3c8d85 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -244,7 +244,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
 	.init_func = s6d7aa0_lsl080al02_init,
 	.off_func = s6d7aa0_lsl080al02_off,
 	.drm_mode = &s6d7aa0_lsl080al02_mode,
-	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_NO_HFP,
 	.bus_flags = 0,
 
 	.has_backlight = false,

-- 
2.39.5

