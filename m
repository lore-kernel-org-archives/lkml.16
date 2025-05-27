Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E4275864
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355731; cv=none; b=J+DfVfd/GRoTNji87RBCmuzdUe6FYbLK1sQtTsVm5D5T1C0prcU1Ewlcl9O7M8O7v5TmYS/T5BS26R7SyxtkQdkjqOdBfqipOJIWmhSe4UEArYi0LizVRrxYMrDYU9hZxQAQcbUk+Fo6U15g5ZleRrXseU0Wum+GvRgUND6q+Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355731; c=relaxed/simple;
	bh=Spt9rmFVuUSVrZwGg2CbBOduRTvfvOdyEp+fTnns0Mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imtFE+NbfqYagp5GqD5yItfT2TmlD6NXPILXNbNN+hGN4RoIuADPmCvWwirX3/GmU0iqfuR6Fcdw0aa3rhwySeMug+e4r7MLE73YR4O4DHSJFDhVyl8jUPKnCYAx1hqNKN4AmAV95smiohD4EShrbfVeAPwBtc8n/+aUX0ls+Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uJvBp-00048s-5N; Tue, 27 May 2025 16:22:01 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 27 May 2025 16:21:47 +0200
Subject: [PATCH 1/2] drm/bridge: samsung-dsim: use while loop in
 samsung_dsim_transfer_start
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-samsung-dsim-v1-1-5be520d84fbb@pengutronix.de>
References: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
In-Reply-To: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Turn the open-coded goto-again construct into a while loop, to make
samsung_dsim_transfer_start() a bit shorter and easier to read.

Hold the spinlock when looping back around and avoid the duplicated
list_empty() check.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 51 +++++++++++++++--------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..1dfc9710bee5134e0e0114ce52f673c21564b11b 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1235,43 +1235,34 @@ static void samsung_dsim_transfer_start(struct samsung_dsim *dsi)
 {
 	unsigned long flags;
 	struct samsung_dsim_transfer *xfer;
-	bool start = false;
 
-again:
 	spin_lock_irqsave(&dsi->transfer_lock, flags);
 
-	if (list_empty(&dsi->transfer_list)) {
+	while (!list_empty(&dsi->transfer_list)) {
+		xfer = list_first_entry(&dsi->transfer_list,
+					struct samsung_dsim_transfer, list);
+
 		spin_unlock_irqrestore(&dsi->transfer_lock, flags);
-		return;
+
+		if (xfer->packet.payload_length &&
+		    xfer->tx_done == xfer->packet.payload_length)
+			/* waiting for RX */
+			return;
+
+		samsung_dsim_send_to_fifo(dsi, xfer);
+
+		if (xfer->packet.payload_length || xfer->rx_len)
+			return;
+
+		xfer->result = 0;
+		complete(&xfer->completed);
+
+		spin_lock_irqsave(&dsi->transfer_lock, flags);
+
+		list_del_init(&xfer->list);
 	}
 
-	xfer = list_first_entry(&dsi->transfer_list,
-				struct samsung_dsim_transfer, list);
-
 	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
-
-	if (xfer->packet.payload_length &&
-	    xfer->tx_done == xfer->packet.payload_length)
-		/* waiting for RX */
-		return;
-
-	samsung_dsim_send_to_fifo(dsi, xfer);
-
-	if (xfer->packet.payload_length || xfer->rx_len)
-		return;
-
-	xfer->result = 0;
-	complete(&xfer->completed);
-
-	spin_lock_irqsave(&dsi->transfer_lock, flags);
-
-	list_del_init(&xfer->list);
-	start = !list_empty(&dsi->transfer_list);
-
-	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
-
-	if (start)
-		goto again;
 }
 
 static bool samsung_dsim_transfer_finish(struct samsung_dsim *dsi)

-- 
2.39.5

