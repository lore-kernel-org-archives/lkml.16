Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494FD2E613A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869962; cv=none; b=Fqe29A3KB3HW8fhZHXYwEcklI4ftFHtMnulAApo9yVEmghUtawwxJ0Q0LbqKLcaA4Uv+VVvj5Kwj0V6NbtrODRXzWHxt2x4/ssLPYaC9JWKj4TwGon1K/de+RxP/vybnAwM6vZKQ7cfUqNZKMpsfQ1ht+BGJmwNiqL4Z+SJJQZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869962; c=relaxed/simple;
	bh=pN2yU2bpvzRy6uO9lzUhoPxsDxY2SFM62r5DrfPst+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bk/apcPSMOFD25Be6Mh8sBtad6uRb6TUlV+a1ygc1R0/lIXkYPgmL1F1p6mC3SUz1Sq0QkJsVHtY3wCmlaifeDb86Bx55qUFucXjViMeWfCJlDNHiVDlq4YGQgNpHNv5lJ8myqQKpSl8ccX6muK7iBFQEtJWtfyjdz6FyKQfC+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kSaLkQWi; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kSaLkQWi"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32E864437E;
	Wed, 25 Jun 2025 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7k6satfrxz16BIUnmlwWCoWUpPsP83DstQRr2M9+JZY=;
	b=kSaLkQWiEEVWZbmy5sZtkrBUCtduymNwNpwUvmXRUI8glZq0Z63csutFNLMz5WCrNnpRXd
	xpkUWSdt+7Ujr+/5Y+nyoCbGA7bpoP1ijR0FPP672moosCv0YA5jCgcbNg7nj4nTJpBL8N
	PO1PMuSA12Jbq9rTZxIaUvqgyzbyV8QOMwtJ5LreDlM/S27XTOWoqmjH4YBiQT00efiUMB
	kMBLgXBkzEVFUH8aporhqcp369f2ogLpkVqZjvTLSno7FLGUuaIkjvNdQl+hDjGEGGBDJc
	djvN4ae1+ywZvcBC/7B66fnLrwRLFZ6Tjf1GEOTx337jYL7enraAdlHLVnS3Ew==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:15 +0200
Subject: [PATCH 11/32] drm/bridge: synopsys/dsi2: remove DSI device pointer
 from private callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-11-e36bc258a7c5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

The callbacks in struct dw_mipi_dsi2_host_ops have a struct mipi_dsi_device
pointer to the device, which is unused. Remove it as a step towards
avoiding DSI host drivers to hold a pointer to the DSI device.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c   | 4 ++--
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 6 ++----
 include/drm/bridge/dw_mipi_dsi2.h                | 6 ++----
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index 5926a3a05d79ff42f56adb4d09c7378191493ba1..a994dfc1c0d2f6bbcab615c645d4dff7b90a756f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -538,7 +538,7 @@ static int dw_mipi_dsi2_host_attach(struct mipi_dsi_host *host,
 	drm_bridge_add(&dsi2->bridge);
 
 	if (pdata->host_ops && pdata->host_ops->attach) {
-		ret = pdata->host_ops->attach(pdata->priv_data, device);
+		ret = pdata->host_ops->attach(pdata->priv_data);
 		if (ret < 0)
 			return ret;
 	}
@@ -554,7 +554,7 @@ static int dw_mipi_dsi2_host_detach(struct mipi_dsi_host *host,
 	int ret;
 
 	if (pdata->host_ops && pdata->host_ops->detach) {
-		ret = pdata->host_ops->detach(pdata->priv_data, device);
+		ret = pdata->host_ops->detach(pdata->priv_data);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
index cdd490778756f67be69a5c4319b30520c42cdec8..998cbeb78d15562090910df5a25b3ca9cc60d33a 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
@@ -335,8 +335,7 @@ static const struct component_ops dw_mipi_dsi2_rockchip_ops = {
 	.unbind	= dw_mipi_dsi2_rockchip_unbind,
 };
 
-static int dw_mipi_dsi2_rockchip_host_attach(void *priv_data,
-					     struct mipi_dsi_device *device)
+static int dw_mipi_dsi2_rockchip_host_attach(void *priv_data)
 {
 	struct dw_mipi_dsi2_rockchip *dsi2 = priv_data;
 	int ret;
@@ -348,8 +347,7 @@ static int dw_mipi_dsi2_rockchip_host_attach(void *priv_data,
 	return 0;
 }
 
-static int dw_mipi_dsi2_rockchip_host_detach(void *priv_data,
-					     struct mipi_dsi_device *device)
+static int dw_mipi_dsi2_rockchip_host_detach(void *priv_data)
 {
 	struct dw_mipi_dsi2_rockchip *dsi2 = priv_data;
 
diff --git a/include/drm/bridge/dw_mipi_dsi2.h b/include/drm/bridge/dw_mipi_dsi2.h
index c18c49379247cd5df31a1b014524347b4d92a0a5..0117fe218ea79a30353b2a5949164aa88b18a2b7 100644
--- a/include/drm/bridge/dw_mipi_dsi2.h
+++ b/include/drm/bridge/dw_mipi_dsi2.h
@@ -54,10 +54,8 @@ struct dw_mipi_dsi2_phy_ops {
 };
 
 struct dw_mipi_dsi2_host_ops {
-	int (*attach)(void *priv_data,
-		      struct mipi_dsi_device *dsi);
-	int (*detach)(void *priv_data,
-		      struct mipi_dsi_device *dsi);
+	int (*attach)(void *priv_data);
+	int (*detach)(void *priv_data);
 };
 
 struct dw_mipi_dsi2_plat_data {

-- 
2.49.0

