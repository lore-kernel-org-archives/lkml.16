Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5BA27602C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355293; cv=none; b=mOlrhA8YpodcSz3VSf+Olz4iqRyLnGLSk2ECmudhmvmBXYH/UCeEkh7FaKa6e4iOOWH2HRRhf8dYEo9oJ/EKw4CnzGwgIuhfn9ahT8SDxgRo4UI0eL2NCwNI8oa8d3YRpgYMDak+fgCQToTYvL/ZNumfEdr76zJOU0hRpWAyoWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355293; c=relaxed/simple;
	bh=KMl1KC7Db42hpXmXH1RgdBzgy+eRoovV4TcmHv0IoBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQEtGezwkDIxY/bOhGt19rZm23UmzH7E/XE3Bz6SR/1s4QSs2BRBVwrVaXBA2Tf1Mc8w/oul3x5LIciF6tSiWLvJh+9548aW1nknfAft53MydXWNNpEhV03ymmTkWF6J7lJNrFTRERdgYGECiHTzwDcxIxuoP/u61dasbGIfIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uJv4f-0002Ne-QK; Tue, 27 May 2025 16:14:37 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 27 May 2025 16:14:34 +0200
Subject: [PATCH RFC 4/4] drm/mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-dsi-vsync-flush-v1-4-9b4ea4578729@pengutronix.de>
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

Drop the unused MIPI_DSI_MODE_VSYNC_FLUSH flag. Whether or not a display
FIFO flush on vsync is required to avoid sending garbage to the panel is
not a property of the DSI link, but of the integration between display
controller and DSI host bridge.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 include/drm/drm_mipi_dsi.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..369b0d8830c3d14a4fc1e8e38d5fa55f04ca143e 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -130,8 +130,6 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
 #define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
 /* disable hsync-active area */
 #define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
-/* flush display FIFO on vsync pulse */
-#define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
 /* disable EoT packets in HS mode */
 #define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
 /* device supports non-continuous clock behavior (DSI spec 5.6.1) */

-- 
2.39.5

