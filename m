Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A54B2F9495
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869974; cv=none; b=bHqkRKHbcbe6LayzniQB8wM4CPpp7YVnIBEmCDEFZfxZfkaHGRjNEdq4FDuXqdONDUOdN6b6nyZOWseEOJPYKG1dXwRpGieVwkCfCnDUUBSyhkqyW0oUACH/mbt38FoldnQSsNNuQmUu0qSsd8oXiaWWy2e/NBJKlOM8YfNRpPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869974; c=relaxed/simple;
	bh=wYc60NFj4g2zP6MvGQoUNqoMMaFhnzbd9SraVFhkDlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXxF4Dd2iBtV0e8qJslCrk5gbeecs30IlPRPMvXSwHeAWCWU6l2k7h5yURT8kGZdsNwothMveZV2opcXCS43Crva4D41G46FRny30t6hLvsNHU2sDnrfvfvV/tOdX31AUpfqkkIEk06+HSoX1vzcOI1ercrcdvuJhfbVmf+Jguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yh8aHn7U; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yh8aHn7U"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EF344437E;
	Wed, 25 Jun 2025 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSpNICiPIrVxNcE/EBx6YPkgN+Io+GAGKDXfjVdIzTw=;
	b=Yh8aHn7UTR0w2AKVeuenUucHMs9py0hE9Z+YejQqC+oZKOBheJsTjDeaTItXH6VUCBOQeh
	xzuE1du+9z4WJN5F3yJ3K6k4l+hZeEphnuhc5XRGtoF/lDh5fWCBtlGLRXAu7fdC+D8B33
	5KUddUKE/3+IJ2aRmHbP/LjYKCF2AwpR6MEoEtin32ffZHx9hh/tu4w19hLjbDHq/LxmAe
	2uRyT3Skj9ZA5a/1TjbTSs4WhA1GsqAUcdICT5ZckGKSagXrYkl0B7nlE/60Kg34YSnZvI
	Ll//9DxhVqvQi/Zo+Xox69sL27z9UArD5no/aQAjJeHW3dDLkIWBrXy4/8xPNw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:23 +0200
Subject: [PATCH 19/32] drm/bridge: synopsys/dsi2: convert to the
 .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-19-e36bc258a7c5@bootlin.com>
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
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index a994dfc1c0d2f6bbcab615c645d4dff7b90a756f..760b7920592506268f137dce5dafb14771440cdb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -510,23 +510,23 @@ dw_mipi_dsi2_work_mode(struct dw_mipi_dsi2 *dsi2, u32 mode)
 }
 
 static int dw_mipi_dsi2_host_attach(struct mipi_dsi_host *host,
-				    struct mipi_dsi_device *device)
+				    const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct dw_mipi_dsi2 *dsi2 = host_to_dsi2(host);
 	const struct dw_mipi_dsi2_plat_data *pdata = dsi2->plat_data;
 	struct drm_bridge *bridge;
 	int ret;
 
-	if (device->lanes > dsi2->plat_data->max_data_lanes) {
+	if (bus_fmt->lanes > dsi2->plat_data->max_data_lanes) {
 		dev_err(dsi2->dev, "the number of data lanes(%u) is too many\n",
-			device->lanes);
+			bus_fmt->lanes);
 		return -EINVAL;
 	}
 
-	dsi2->lanes = device->lanes;
-	dsi2->channel = device->channel;
-	dsi2->format = device->format;
-	dsi2->mode_flags = device->mode_flags;
+	dsi2->lanes = bus_fmt->lanes;
+	dsi2->channel = bus_fmt->channel;
+	dsi2->format = bus_fmt->format;
+	dsi2->mode_flags = bus_fmt->mode_flags;
 
 	bridge = devm_drm_of_get_bridge(dsi2->dev, dsi2->dev->of_node, 1, 0);
 	if (IS_ERR(bridge))
@@ -687,7 +687,7 @@ static ssize_t dw_mipi_dsi2_host_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops dw_mipi_dsi2_host_ops = {
-	.attach = dw_mipi_dsi2_host_attach,
+	.attach_new = dw_mipi_dsi2_host_attach,
 	.detach = dw_mipi_dsi2_host_detach,
 	.transfer = dw_mipi_dsi2_host_transfer,
 };

-- 
2.49.0

