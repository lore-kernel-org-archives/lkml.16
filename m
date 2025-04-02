Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61242417D3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600708; cv=none; b=ANE/RZ/axZzUkjtFT3WYEafzX6fCXjaCdJ7ipZgbU2uSjJQmOTDJfRHgbuQYyiNeX9BazAKAgOJ+klZxz+6YNQKNoehqzmLlqEOhAjXhSvYf/67KcaTyh5KoXgNJILHEPCaz61I1Shwpia/wuLj61xnE8gZb+wVtsKyY6saimbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600708; c=relaxed/simple;
	bh=QpPNCE/E/KWQolKtCOFkofej8djB0ueW3MJ0KSDshcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N9usYtsv3JhehPYScXSoFJnEGBKWWE2FR62G2D0rG39mxxdoxP6f43yNcEfvwMJS0t2pUPjacBTmEd3728nFJOTh77eRGpNd1yxV/C1eq393GecWfXgCJ5eFDGrJZSyfNUgBNSuXkOqIBwqbezYRiOHgSmfTn3AmwW0Qan4s1ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fc/RSj74; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fc/RSj74"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B86A51990;
	Wed,  2 Apr 2025 15:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600583;
	bh=QpPNCE/E/KWQolKtCOFkofej8djB0ueW3MJ0KSDshcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fc/RSj74kn2Z3On0haOJO3gvM7cC5TQZ0nxONkvQACRv5I4s04Pa4FdtVks8ZZShg
	 w1KfwoWjAjSWz1WOkE1wzHfhSbuvtrmNrdICdrHW4sg6Mp7kK1JSR9Fm9OWCEZrxJF
	 ezYHtgZ4QK7wLpjxjoP932DiMQ7Ks4yhkbfkzwLg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:31:00 +0300
Subject: [PATCH v2 18/18] drm/bridge: cdns-dsi: Don't fail on
 MIPI_DSI_MODE_VIDEO_BURST
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-18-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=QpPNCE/E/KWQolKtCOFkofej8djB0ueW3MJ0KSDshcA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twh5vAfBQ7KP6xDJ0AYdDCj4qpAPSm4xNsLM
 sdkiIAenmuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08IQAKCRD6PaqMvJYe
 9e0wD/4hTNNGZmT2+7Ef56h6RsvSyeVqQ+ZHg1Afvpmc5Agd9Ul2FJExtTibZ7yjgpO0xllrw2s
 xmTLn7BTXFcXGpmFBM9LIyDBLIz72HGGy1emB5sufTZUtHeqhivMgNMGpESREKbfQ+CBmUyOWkZ
 LaGocgPaO+VQAMW3LCbUEJFVOXt977Xv49fwvVHwmD4Rnx2TzOXAjgPtDbfBtZnDSHgqAsQ5E4s
 zdiwL+NmawGYTkIBUWnOgobGyDZbpJ2IHhZx4pPc5a/udzbpOIPvjFk9lRvpgBs3FOLo4yJcEkm
 14QE+44dS9dwQbZgYnAqgvK/cCyRb3YnhusF9e4YZ5Etds0IgbPutzVyIWZwdxtqHPfCFXUOCgp
 MbxbJpgRF24qM3P08HviR680vB6bezdW05fMdESs8IKqXOziq7tcOzu6WMawyZx3tkQzGjz43q+
 BXWQ6oZdc+Y244AphNtyB4HJSkHSnXd9L9it7o+an+Xnsfw/ZfXC2zycU6UjqDBYPEcBnlbngLM
 VBlhoNhtCijeUibdL2g1Fx+6W21YO5ZsdjTqjz6gRwxY6MLG3aWsvvS1jfDo75CYMQ1YKLZLltS
 ZLjBLR8SJvrZA4m0bakJz3UQ4P71JElxhrJSadd5tL3XEs/FWKcYVRNFZesYjhIbEVS+Snr0Oxd
 04a9Tf/+FQoLsfw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

While the cdns-dsi does not support DSI burst mode, the burst mode is
essentially DSI event mode with more versatile clocking and timings.
Thus cdns-dsi doesn't need to fail if the DSI peripheral driver requests
MIPI_DSI_MODE_VIDEO_BURST.

In my particular use case, this allows the use of ti-sn65dsi83 driver.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 0bb55584cb44..4b77a203b608 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1057,10 +1057,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	if (output->dev)
 		return -EBUSY;
 
-	/* We do not support burst mode yet. */
-	if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
-		return -ENOTSUPP;
-
 	/*
 	 * The host <-> device link might be described using an OF-graph
 	 * representation, in this case we extract the device of_node from

-- 
2.43.0

