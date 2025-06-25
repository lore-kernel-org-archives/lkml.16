Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4E92E613C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869982; cv=none; b=EGpTBrBBFWaKG83spo+EdS2IGAtPOOPEVlBTGPNbwI3YNlSmWSwz1YCaGZpv3FmT3ooO2YZ7lsBbvMIOjeg2HJCIyEEa/oCSd5e/YzXSlIjzcLGoidjYFQFZVvUKg2aWM2NzjW4NKeiOwPKGK5BEoQP8I1tnoS3mb9qOfKcnIpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869982; c=relaxed/simple;
	bh=jFPjaQyDfx3K7LORcO8ofmw1d/WW3dXz7wnA0ovIXwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKXL+MHPPXAu7VuU2LbXHOKHn23i4bOjV/AzAdWPU+ZizSLm31qjPt0ksnSkPE5viNGQRW/7sGOhmHp6Oax/AR4bwWJ/0edVxiekMm5Xei9rwVuk3WHKB/Nt9q6En32d0g3Hl6DkM1q0VlzC5wBFafT+pkMy576DrI24jpmdXiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cCbq2e80; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cCbq2e80"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8578E44385;
	Wed, 25 Jun 2025 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMrBQHofuunDvUQikxi1pZO0MydXHJ5subj9NVDlS4c=;
	b=cCbq2e80DMR9Z+uXH4CjM37FE/hy/mDf5oU/BbZDXYiBan2Uho5YheY844B00h2IGJL+4u
	tDAkt9du1EaZJiUZbJMr3q30RnWkGuibNSelEboMsXClKmilZfgmRsgWroQCZcCer+cY5T
	iT1w20j3pRReDBpbhw6wZJXrqOLbrFhnSr/jly1qaDD4OwQoPPdeEfM4izQrUSrIO/N0ch
	ayKZm5iFx7yPTpe0Cwk2Cs3Or0cCR06DA4OKvSzm5eznhvUMZDTc/4F4YiNju5L4FjPshD
	Tp2laWvscaRp4TUfBb/gYRmiA7Rt+dk/+erdF0YgZt2slKgme8x9UsLa3YGocA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:28 +0200
Subject: [PATCH 24/32] drm/mediatek: dsi: convert to the .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-24-e36bc258a7c5@bootlin.com>
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
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d7726091819c4762698b41060b3d4d8d27940238..33475a5c18c1146cd4ea40c3c6ccaba1271a6cd9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -981,15 +981,15 @@ static const struct component_ops mtk_dsi_component_ops = {
 };
 
 static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
-			       struct mipi_dsi_device *device)
+			       const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct mtk_dsi *dsi = host_to_dsi(host);
 	struct device *dev = host->dev;
 	int ret;
 
-	dsi->lanes = device->lanes;
-	dsi->format = device->format;
-	dsi->mode_flags = device->mode_flags;
+	dsi->lanes = bus_fmt->lanes;
+	dsi->format = bus_fmt->format;
+	dsi->mode_flags = bus_fmt->mode_flags;
 	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(dsi->next_bridge)) {
 		ret = PTR_ERR(dsi->next_bridge);
@@ -1184,7 +1184,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops mtk_dsi_ops = {
-	.attach = mtk_dsi_host_attach,
+	.attach_new = mtk_dsi_host_attach,
 	.detach = mtk_dsi_host_detach,
 	.transfer = mtk_dsi_host_transfer,
 };

-- 
2.49.0

