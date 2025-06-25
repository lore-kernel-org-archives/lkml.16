Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4262FCE16
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869983; cv=none; b=l2TAL8srNatNsYIrjAg+F96tkypVleZRD1qviFaqnLCxFZXAeY6Ge5NKV8wW2RqGAGU2fARbFVqWEI/VTnFnRYhCCLSHD7NtgszmcHJ74y8RSaW+/QzNqxqmw1GkLTGVrIlkyjn4MoVhX3J/uvtaYuE4rwNxOHuSlDsya7WhFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869983; c=relaxed/simple;
	bh=7PRJH/dT13k6RVi5NSrh9Q6C4l9q9tJAoPffsopcK5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IdNMbLdEbPDg4IjvP7dnrr8CEoPJPq8722cvELzc1hwQ8pSBNTrTrwUNTvsOcSo8NrfFS2f0MA25FOWpS0XFHC9UVzL79Y7g0VwNAJktptCtbG6zM3FGuqZwlTZ7QlEz5QxNI7zTBSbutV2miVvlVPhscBlixFB6hH9OXPQSGQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OIP5dYf/; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OIP5dYf/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E96644384;
	Wed, 25 Jun 2025 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mucDypvpJQb6uuO38z8Z55M0U8UDlvuva+sDU8/tA5o=;
	b=OIP5dYf/5y3G9FULZfWtt32dq9hHIwM0W4olxVJ2JrppKfQ+rSrhZGPfQp/17MfFcL7TsG
	HE1EVBSb54FLfh43bmMIUMDkdc+mcEZFZdYMXieg0BwlWjw9JvVCYZ7DhnmvzbF14tNEc5
	PFRR6uQwERx2VWr7F6j8ch4JqDDUgd71ZALV6gPGAVmZHOjI7qwopFdHOuhcOKVLA2hQ04
	IeV5mrU64s0rsZHNIgh0IVJF4i3eMx4NMp4qxHakfpq4qYQwHQ0Lwak1eurfVLeJSaVCgq
	RGSQTXIrqkIGLk/mL1Pwztn5Ks6D+WdiQFyYOJDbG2A8xqRJa6iA3DrHb4qQUQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:29 +0200
Subject: [PATCH 25/32] drm/bridge: nwl-dsi: convert to the .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-25-e36bc258a7c5@bootlin.com>
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
 drivers/gpu/drm/bridge/nwl-dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 94356d02a7009a4d333f2df6c628d57c4bf66fdb..76bb3828a615d75161aa7910a18ed909ee9cad2d 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -344,16 +344,16 @@ static int nwl_dsi_init_interrupts(struct nwl_dsi *dsi)
 }
 
 static int nwl_dsi_host_attach(struct mipi_dsi_host *dsi_host,
-			       struct mipi_dsi_device *device)
+			       const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct nwl_dsi *dsi = container_of(dsi_host, struct nwl_dsi, dsi_host);
 
-	if (device->lanes > 4)
+	if (bus_fmt->lanes > 4)
 		return -EINVAL;
 
-	dsi->lanes = device->lanes;
-	dsi->format = device->format;
-	dsi->dsi_mode_flags = device->mode_flags;
+	dsi->lanes = bus_fmt->lanes;
+	dsi->format = bus_fmt->format;
+	dsi->dsi_mode_flags = bus_fmt->mode_flags;
 
 	return 0;
 }
@@ -620,7 +620,7 @@ static ssize_t nwl_dsi_host_transfer(struct mipi_dsi_host *dsi_host,
 }
 
 static const struct mipi_dsi_host_ops nwl_dsi_host_ops = {
-	.attach = nwl_dsi_host_attach,
+	.attach_new = nwl_dsi_host_attach,
 	.transfer = nwl_dsi_host_transfer,
 };
 

-- 
2.49.0

