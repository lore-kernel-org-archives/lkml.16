Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4982E4247
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869966; cv=none; b=hfVwizRbs9ScdS2T0OeFppmCxw/zZnQWJxSfyKpiNawGhlhZgzrGegH1k3zi+a8Yhvxy97wR1A5KZXVPN6C8c7Q4E/VaIy0KgL2exYHt6wXdwn+xUjmtKVbUOwAFr6xQrqgwzImS/3DxjF6iXaWHIjO1FNjJfbDGDCLfuQD2g48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869966; c=relaxed/simple;
	bh=pZ7/U3CMBQAhoYM5ErP5YgHoZj+0wKpHwQ9KkKEP44U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yz7yypuG3WH+51rDv5+T58p8tF+1y6WKPH3LA/hfgonSlFu5p7UI2TZInz3XynPIWTKr8yVqyxZU06K3W+rTjgDLfidviQSfi8uTf2QHW3BTEsLbH7yR/QWi8+Yfb0i9+iIWacKbAcTQMUZeDBen/LBdBflom3btejLl+slR3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZPLukC9c; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZPLukC9c"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90EF644385;
	Wed, 25 Jun 2025 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7aMIIvPoDM01vNfoZ9eCSObJWzHVDzuQexaFjoN/uOA=;
	b=ZPLukC9cJ3MtogNKfJ/bLJlzzhv4HI9mIMhMGRf9oPNVbnH54AuMjg75kvgXXkWkBa+kLy
	0R0dZKUceEcdrBPC91I3I2GfLyb0IlSdzHNfrtKfEcSTj7a/99BBp0DlhcMhJ542Sue6PQ
	nyU3ULccG5UI1lMPn5Kp9f0Leclh7TohfY1Xtun3O2bt8gexorNF5J7vKgyj9NsFSVLgib
	WcKSprlKy89gwGAcS48coU04A86ETURM1h3IJxxihQ2CtaECp7e1VVxFUm1PJGhvWGOjke
	tM31McOhul4OpHJH+D9uvKB5x6JoMXMn2W7zy0erRhGwO6Ssj73IXVo4wB3qaQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:18 +0200
Subject: [PATCH 14/32] drm/mipi-dsi: add .attach_new to mipi_dsi_host_ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-14-e36bc258a7c5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepudefnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

In preparation to avoid DSI host drivers to take any pointer to struct
mipi_dsi_device, add a new host op which does not take such pointer. The
old op can be removed once all users are converted to the new one.

The .attach_new op takes the DSI device format values, (part of) which are
needed by most DSI host drivers. It passes a temporary struct, in order to
ensure host drivers copy the values they need and not keep a pointer.

The struct with the data (struct mipi_dsi_bus_fmt) is a subset of struct
mipi_dsi_device. After all host drivers are converted, struct
mipi_dsi_device can be modified to hold a struct mipi_dsi_bus_fmt instead
of individual fields.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 21 +++++++++++++++++++--
 include/drm/drm_mipi_dsi.h     | 29 ++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index f16f70c70c87988a95f959d0b8b18a6941dd2808..f45425f777f6bed6ac5f261b0097455c52ab7d9e 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -367,6 +367,18 @@ void mipi_dsi_host_unregister(struct mipi_dsi_host *host)
 }
 EXPORT_SYMBOL(mipi_dsi_host_unregister);
 
+static void mipi_dsi_dev_copy_bus_fmt(struct mipi_dsi_bus_fmt *fmt,
+				      const struct mipi_dsi_device *dsi_dev)
+{
+	fmt->channel	= dsi_dev->channel;
+	fmt->lanes	= dsi_dev->lanes;
+	fmt->format	= dsi_dev->format;
+	fmt->mode_flags	= dsi_dev->mode_flags;
+	fmt->hs_rate	= dsi_dev->hs_rate;
+	fmt->lp_rate	= dsi_dev->lp_rate;
+	fmt->dsc	= dsi_dev->dsc;
+}
+
 /**
  * mipi_dsi_attach - attach a DSI device to its DSI host
  * @dsi: DSI peripheral
@@ -374,15 +386,20 @@ EXPORT_SYMBOL(mipi_dsi_host_unregister);
 int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 {
 	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
+	struct mipi_dsi_bus_fmt bus_fmt;
 	int ret;
 
-	if (!ops || !ops->attach)
+	if (!ops || !(ops->attach_new || ops->attach))
 		return -ENOSYS;
 
 	if (dsi->lanes < 1)
 		return dev_err_probe(&dsi->dev, -EINVAL, "Incorrect lanes number\n");
 
-	ret = ops->attach(dsi->host, dsi);
+	mipi_dsi_dev_copy_bus_fmt(&bus_fmt, dsi);
+
+	ret = ops->attach_new ?
+		ops->attach_new(dsi->host, &bus_fmt) :
+		ops->attach(dsi->host, dsi);
 	if (ret) {
 		dev_err(dsi->host->dev,
 			"Failed to attach %s device (lanes:%d bpp:%d mode-flags:0x%lx) (%d)\n",
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index e42483fd022fed4dfc9e5ef180117c3dd37a3b51..5d5f3dca1ec1a654378ccca15f3f15a5ce957518 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -102,9 +102,34 @@ enum mipi_dsi_pixel_format {
 
 #define DSI_DEV_NAME_SIZE		20
 
+/**
+ * struct mipi_dsi_bus_fmt - format required by a DSI peripheral device
+ * @channel: virtual channel assigned to the peripheral
+ * @format: pixel format for video mode
+ * @lanes: number of active data lanes
+ * @mode_flags: DSI operation mode related flags
+ * @hs_rate: maximum lane frequency for high speed mode in hertz, this should
+ * be set to the real limits of the hardware, zero is only accepted for
+ * legacy drivers
+ * @lp_rate: maximum lane frequency for low power mode in hertz, this should
+ * be set to the real limits of the hardware, zero is only accepted for
+ * legacy drivers
+ * @dsc: panel/bridge DSC pps payload to be sent
+ */
+struct mipi_dsi_bus_fmt {
+	unsigned int channel;
+	unsigned int lanes;
+	enum mipi_dsi_pixel_format format;
+	unsigned long mode_flags;
+	unsigned long hs_rate;
+	unsigned long lp_rate;
+	struct drm_dsc_config *dsc;
+};
+
 /**
  * struct mipi_dsi_host_ops - DSI bus operations
- * @attach: attach DSI device to DSI host
+ * @attach_new: attach DSI device to DSI host; either @attach_new or @attach is mandatory
+ * @attach: deprecated version of @attach_new
  * @detach: detach DSI device from DSI host
  * @transfer: transmit a DSI packet
  *
@@ -126,6 +151,8 @@ enum mipi_dsi_pixel_format {
  * properly enabled.
  */
 struct mipi_dsi_host_ops {
+	int (*attach_new)(struct mipi_dsi_host *host,
+			  const struct mipi_dsi_bus_fmt *bus_fmt);
 	int (*attach)(struct mipi_dsi_host *host,
 		      struct mipi_dsi_device *dsi);
 	int (*detach)(struct mipi_dsi_host *host,

-- 
2.49.0

