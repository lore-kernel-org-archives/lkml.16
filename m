Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB12F4A16
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869969; cv=none; b=IioZ5b/Fz1la8DtNRJh6BkG5QvPhHCcIJn5P8BvfcTKScog5emeqWqoBopDhwfHAqVigLuJPLz8Dy1vFlJwTfQKKpgV1TsWNc7gnr2rhqqCPK3CnNDdL8zivqT7Qv2wNGwk+rnzui/pRcyHNCYR6d2cKF0EgyLpV0QBW9a3ESTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869969; c=relaxed/simple;
	bh=29QwLJPQEfyXeCARTMIHpuSbFGrf3VdQMm7GJwbpV38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGa2MEWp5qG1IfXJTVvM3HKryz+6xuUtbnjGcArAdHsWuMcEIZQ93boFCyPha11zaJP5UWmI63ez4uOfFN0vGB1RG1RDU6KQNTH/1tDvOzzk9zoXiZAVzQETO6Ay0e4nBbq+5iK7r489eWl9fzOvne/moSee8J71Rq9DLFeJikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EbEdcrFI; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EbEdcrFI"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5AAF44384;
	Wed, 25 Jun 2025 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PsrR39dnSay/bYX2ILAGqiV/+GvzCd1Kb61Zzt+atQ0=;
	b=EbEdcrFIAPZL+Lj2VMmDgZG7DtWFNnPsRVA3ANeBHNdqVzZz68TMiNP1TTH9DY05ppWFso
	RdrQD30S8E2VlLwREz3cqRTtq7F3n6J8VUQ7p/r2LEOne3EPamG7WOkBn7WsmqLRsZoAWH
	KA95dZYDViw/iNQ9wBw3xSOWeiMcUziS1vvH5yW5eE1oTFAKD2CdUDdgASOP5LAJ6bjYvX
	ztdq9wBAKEfsNrO1fqL1hWazbcuHyr2HKcMsYLe11mJE6ZxMEzYPiSMNZ0AUlYptmxqa0W
	v2KhnQ+10z6+NY/5hS+06SQyg8XDhgD295uAUrQ2ptepWIQD9GF4H3/lNKsWFA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:20 +0200
Subject: [PATCH 16/32] drm/kmb: dsi: convert to the .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-16-e36bc258a7c5@bootlin.com>
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
 drivers/gpu/drm/kmb/kmb_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index faf38ca9e44c38068dad78d80529a77eb0203bd9..5163fd48db142f3cb87e3ee864480c49cb443abb 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -197,7 +197,7 @@ static ssize_t kmb_dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static int kmb_dsi_host_attach(struct mipi_dsi_host *host,
-			       struct mipi_dsi_device *dev)
+			       const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	return 0;
 }
@@ -209,7 +209,7 @@ static int kmb_dsi_host_detach(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops kmb_dsi_host_ops = {
-	.attach = kmb_dsi_host_attach,
+	.attach_new = kmb_dsi_host_attach,
 	.detach = kmb_dsi_host_detach,
 	.transfer = kmb_dsi_host_transfer,
 };

-- 
2.49.0

