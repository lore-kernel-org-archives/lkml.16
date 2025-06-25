Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819B2FA639
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869977; cv=none; b=AmfkxpBVn78mKMG1COvXPc0hUKseH0qLVKx00D/w6BSIZp7nX9bQ63f8gLQ76vx9JcCq+1tu9OvNQNjPezBeKQnBIrbOQ2hAwuOZ3H3gFW8DXVlXfsB/ci5DM5x5QvOYeol41gEw2GXMEgRfdO24de5/UTGV+rT7QHarHJGvbiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869977; c=relaxed/simple;
	bh=nA1zWVM/YtAm+NPi1x9Ld7toUFuwhoCZ8Ye1fcHcqo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKyW8AXGU6IO9xy8kOQzBVuCHzYDkJaGf/w48AJ6fdsteZ+IZiVj6NcZpoO0p3ra5OcYmBGu50fmHWvuhEN0S7Dpu8AWg/40yL1YSuXy+NRLFaIBsWDRidah/TQ/pwA4HYt7e0qXYNVpmrpPYSFDj4AAmkhQ5GnYTZVBrLRuXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O56iL9dA; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O56iL9dA"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B83E044386;
	Wed, 25 Jun 2025 16:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4IDqZBo2l355tzElODGXZ/VGni71FImSIpCMtPQkh8=;
	b=O56iL9dAGRzlmWsbYSbLELfADRegEMmtIrXUAzy+XYoHRmgmmX0se94FHlPTXJ+uNNAnKL
	73vm2774ER0F51TG5bj05k+ZseqkXwtOo9v5xiUzbfrgvd48anVc7lxTwQiZdVQKQQnm+q
	lz03Wpa/0/36dHSplSlHBo5V24CjSEWc2agKcaNXFYl1Fe6v+0uSKM2nju9sS2WUIpWgus
	2RASSpw5M3v2Qr/B9Pe63ciXnDCWrFi1GZdyumoTbGl/5oYRGBlZhS6svuDgq7L+H9WJxk
	wFOFyjhFnCaq62qqyC1kvcl2hwpLIQFSgYzFfxsjU34MzeJ5ALtTBToAafO2sA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:25 +0200
Subject: [PATCH 21/32] drm/rcar-du: dsi: convert to the .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-21-e36bc258a7c5@bootlin.com>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepudejnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This op does not pass any pointer to the DSI device, so the DSI host driver
cannot store it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 1af4c73f7a887712aef8c8176b0d0338d9ca9727..e46f194a15aaa9ba7dc22362e59561fe4f17721b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -898,16 +898,16 @@ static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
  */
 
 static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
-				     struct mipi_dsi_device *device)
+				     const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
 	int ret;
 
-	if (device->lanes > dsi->num_data_lanes)
+	if (bus_fmt->lanes > dsi->num_data_lanes)
 		return -EINVAL;
 
-	dsi->lanes = device->lanes;
-	dsi->format = device->format;
+	dsi->lanes = bus_fmt->lanes;
+	dsi->format = bus_fmt->format;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
 						  1, 0);
@@ -935,7 +935,7 @@ static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops rcar_mipi_dsi_host_ops = {
-	.attach = rcar_mipi_dsi_host_attach,
+	.attach_new = rcar_mipi_dsi_host_attach,
 	.detach = rcar_mipi_dsi_host_detach,
 };
 

-- 
2.49.0

