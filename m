Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F252F433F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869967; cv=none; b=InpNvraH9aGGnv8zw7FK4BJ2L241hDWkDSvDp2zOc0OYrYFH9bffaJG7LCjGqdzUqk7WGjKs1dZrQy3bOUMebdjCK6jYM/HV1BmBpM/QkTQjSSh9TL/sM3WDhv+I9vbofE5ERyJraeQep1FAAOrmrXmRUErbWctcIhAOerVpAUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869967; c=relaxed/simple;
	bh=ULYeCS04I3I36SsNgzIgs4VbxrC4O8nKPYlPqpeaQDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QE1wzdS6S8uFTqm6L7HRVeGplkmn/48BXi8lLLh03u1J/XTqHtEdm+p07+p7V17mvdr0E+uSRtBGKmTUAHwUFfQLZF+MwX9ChB5VlKKcnY2XIT3hoX6Z2aETlw68nik34W9Xj37JvD8LooeaA09M15FyM7ju1+mQddzayolk8EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lpjhaatR; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lpjhaatR"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 289BA4437E;
	Wed, 25 Jun 2025 16:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RapiHX1G4Bjd+Upr/H93BZHIVUclRV6sDrg9rC1DVIU=;
	b=lpjhaatR+1CcLH3pEw3HBbYEXu3V6HMrrhXD58kYoY0G7NM9QbsQXXlp1rwB8TbzyaBxvS
	Vu0eZ6Xje12AwVQzTCCn68D0HaoJHd/Gm1J3zIi1Yr1AhbZ7U0n4u3NmrHvFdp3mC3Ide2
	b5pON6NQn+yAYDXmr8zaTZNWol4wCy92tg3V99ZN7No9mkQgpDfWQlL0JsZv2Mh9DtgIHD
	+07hLHlWTP8wvwozLwpiIOnYA2Exj0sN99kUGHf33S28225emdrzx6I+vzcZHjjyrezHn6
	pyAHTl7ld+6y2bRv+RP9cZsinPEGwGxm0MWH/KGpILfjlC/BL8Uvy8zeXi6L3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:19 +0200
Subject: [PATCH 15/32] drm: adp: mipi: convert to the .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-15-e36bc258a7c5@bootlin.com>
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

This op does not pass any pointer to the DSI device, so the DSI host driver
cannot store it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/adp/adp-mipi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp-mipi.c b/drivers/gpu/drm/adp/adp-mipi.c
index cba7d32150a98d78d07a25b1822dec6bf2f08f65..088b13ed0c89ce5e1fd3f4e57fa842fb2f31f257 100644
--- a/drivers/gpu/drm/adp/adp-mipi.c
+++ b/drivers/gpu/drm/adp/adp-mipi.c
@@ -171,7 +171,7 @@ static const struct component_ops adp_dsi_component_ops = {
 };
 
 static int adp_dsi_host_attach(struct mipi_dsi_host *host,
-			       struct mipi_dsi_device *dev)
+			       const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct adp_mipi_drv_private *adp = mipi_to_adp(host);
 	struct drm_bridge *next;
@@ -207,7 +207,7 @@ static int adp_dsi_host_detach(struct mipi_dsi_host *host,
 
 static const struct mipi_dsi_host_ops adp_dsi_host_ops = {
 	.transfer = adp_dsi_host_transfer,
-	.attach = adp_dsi_host_attach,
+	.attach_new = adp_dsi_host_attach,
 	.detach = adp_dsi_host_detach,
 };
 

-- 
2.49.0

