Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8AD2E2EF6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869973; cv=none; b=iYtEB6GUQS4g2U0vp4ORCm4Kfzyuro0DMzhiG0yzIqMMdBOXi2dDVelp88FLpYRYDIhj5LXKLtQP0wEWxsv2y8KA1PKsNzV9PgU5NdHhnU5AXIdEQTFrTErHMxnulPnWe442lT1Wzd8UqZDzWGr3I4urKoPbFyrgeroKEh3Oapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869973; c=relaxed/simple;
	bh=udWCr3YVQdhMp9njrb1WIThRZsLvv3KWjntoHcDJp5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jRKHbh1lfFZ0Bf9diyYM/KGFqDRbH4v0vzQ3Grv3AUUD3T4sDORfocLW3ragMeVcokH+fxEzzY3uO2UoaTmWtMQ44B2tBJ833cWLLQ+MhZOj8o2IOxbI5khC5J85N59Gb94GrgSfMO7VigJoYJxDXc2Kl4tMalqF9SNsrY8bHeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fGhyVc/Y; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fGhyVc/Y"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0A5B44385;
	Wed, 25 Jun 2025 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K7BjIHdpe9xdJpYsc/he/n8ZYsi+eBpyWaFSz5f52UI=;
	b=fGhyVc/Y1EYH//aBo8mPKKzt0HyM+lTp65vMaVccDBtXJ2AXl+h9JP5Rlj47fNr+7PBT4P
	UHg7NwZ/z0MsKrWwvYgNHvSDjBccBPEu93mW3ff6aobY++C0vEtI/j7JGeZW4GTduI2ju0
	KP71rr7oUVjy9C9dxVDxNWvc1jgFOG8VAkHBej0N6SRzAAKmrU0Y3GZnl5YI0MBpJRrTnJ
	XxJc3ayTtbTNy9/g1CE7s2IPi712HqjJUkzJXZ8+jWlMqFgWAn//63G6vG6mH9hRLmGqRk
	V/jydfTrcDOX018uOgvSUSnnJB35ym6HlR6r1ZZzbGr83F5eDnYpzdZiLOtqNg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:22 +0200
Subject: [PATCH 18/32] drm/hisilicon/kirin: convert to the .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-18-e36bc258a7c5@bootlin.com>
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
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 1a5b97abae86a187c751b4b579d7c22f206e4c90..f299958d7be6207dfe6e0e0e2bbc7b38ffe865ed 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -722,20 +722,20 @@ static int dw_drm_encoder_init(struct device *dev,
 
 static const struct component_ops dsi_ops;
 static int dsi_host_attach(struct mipi_dsi_host *host,
-			   struct mipi_dsi_device *mdsi)
+			   const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct dw_dsi *dsi = host_to_dsi(host);
 	struct device *dev = host->dev;
 	int ret;
 
-	if (mdsi->lanes > 4) {
+	if (bus_fmt->lanes > 4) {
 		DRM_ERROR("dsi device params invalid\n");
 		return -EINVAL;
 	}
 
-	dsi->lanes = mdsi->lanes;
-	dsi->format = mdsi->format;
-	dsi->mode_flags = mdsi->mode_flags;
+	dsi->lanes = bus_fmt->lanes;
+	dsi->format = bus_fmt->format;
+	dsi->mode_flags = bus_fmt->mode_flags;
 
 	ret = component_add(dev, &dsi_ops);
 	if (ret)
@@ -755,7 +755,7 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops dsi_host_ops = {
-	.attach = dsi_host_attach,
+	.attach_new = dsi_host_attach,
 	.detach = dsi_host_detach,
 };
 

-- 
2.49.0

