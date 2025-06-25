Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B1A2FBFE3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869978; cv=none; b=ZdgAA/d//zRjAMZdtHnpIR60mB/fD1mcf8XrNpahTn4tu4+Q/H8jonruAJ7k11aElHjTTE7r2Qi6wo6VyRR7ShWn2kCqnKwCGdVUfY0y4RQCJ5qMEq5QYmJI0VZNwb6s7z2lY8+gz0UdwsS2kcf12wkYqSEjigPxYmC4P9a6j+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869978; c=relaxed/simple;
	bh=OpYt6E/hbN4bGMAxASt1t1qYM6tzjEATKSuDpkA4Lb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDmieZgqY/Umw/JRSOVeP2vdPqw8Fq9j2eAOo/LmryHawZVSIRVQRpAKaoD91N9NM6Y5RkHkuwWF2zHb58h5rOjz25lne70hne1akFLRxQlejwLwD7LWean3A+TEqEsNkFVjU6LsmUk/wg0U2s+RLIMccA99PwO1d1yDfTZ98io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bp2YaUqp; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bp2YaUqp"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55D5A4437D;
	Wed, 25 Jun 2025 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2DgotHDRY1XfhgzndMELOLgB59sfvOiTaLxF7FKBHs=;
	b=bp2YaUqp2D3r55E/tkkaCKc9BT5GcfiMX3qVk8vQ6pldtV74OvEUf4W8pKewkQcHw6EsZB
	oVuIUEDXfaynmbvlhGotEoQ4k7l7D2Jd6VrRvdnnK3yW0yCVzuIFpA5fNXtIRjhBmP3DxD
	snWf13vTrrtjgY9wHpQijhkGAD7JDEQjTWraHRZTI+KRugT1esJNz9S4VCSbuSaS+s0dcC
	kuHWmFIoIpPNjd9BXho0RSRqLjwVwapnJyeH/0E6ya4bBK8mNjdBnJMkpwylfNRzln3QZl
	TbdoG5bl7ViyJJG3vDGUhN7RLU01d7T310VUfbEPIuSHBex+HgrVUFXgxwFtoA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:26 +0200
Subject: [PATCH 22/32] drm: renesas: rz-du: rzg2l_mipi_dsi: convert to the
 .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-22-e36bc258a7c5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepvddunecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This op does not pass any pointer to the DSI device, so the DSI host driver
cannot store it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f87337c3cbb54559e9e8d416cbe801647f4a7688..33bd2d20be9c3f8d0c43b67d21e0e86566b48ab3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -689,19 +689,19 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops = {
  */
 
 static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
-				      struct mipi_dsi_device *device)
+				      const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
 	int ret;
 
-	if (device->lanes > dsi->num_data_lanes) {
+	if (bus_fmt->lanes > dsi->num_data_lanes) {
 		dev_err(dsi->dev,
 			"Number of lines of device (%u) exceeds host (%u)\n",
-			device->lanes, dsi->num_data_lanes);
+			bus_fmt->lanes, dsi->num_data_lanes);
 		return -EINVAL;
 	}
 
-	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
+	switch (mipi_dsi_pixel_format_to_bpp(bus_fmt->format)) {
 	case 24:
 		break;
 	case 18:
@@ -714,13 +714,13 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 		}
 		break;
 	default:
-		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
+		dev_err(dsi->dev, "Unsupported format 0x%04x\n", bus_fmt->format);
 		return -EINVAL;
 	}
 
-	dsi->lanes = device->lanes;
-	dsi->format = device->format;
-	dsi->mode_flags = device->mode_flags;
+	dsi->lanes = bus_fmt->lanes;
+	dsi->format = bus_fmt->format;
+	dsi->mode_flags = bus_fmt->mode_flags;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
 						  1, 0);
@@ -904,7 +904,7 @@ static ssize_t rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops = {
-	.attach = rzg2l_mipi_dsi_host_attach,
+	.attach_new = rzg2l_mipi_dsi_host_attach,
 	.detach = rzg2l_mipi_dsi_host_detach,
 	.transfer = rzg2l_mipi_dsi_host_transfer,
 };

-- 
2.49.0

