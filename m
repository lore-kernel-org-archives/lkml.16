Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF5E1D63EF;
	Thu,  6 Feb 2025 18:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865742; cv=none; b=fIronKNiootNfbTXZTMTaMNJvQo1ZgUe3RFc5g+EJTl8ja0hgT0nzqsm54VW06RhNDks1VNNr2tqrtCIF61kh7ME1T3+Jcqd23OIcRSMLxpBAQZh+neSO9TnoKZXP2PF5KMcvOakZg50r99+A4Hg5CRt7DfHfclbNPgJioU1Od4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865742; c=relaxed/simple;
	bh=JnDEUFqyj58LVSh5VwGGxEz96zn3WK1cUt9W/FDr4/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKCR/btYYs2u6011z1a5mUt4/gOIxS9//TOBmipbYjipDwJwiiDESJ3C2S2rYMPbiZ5RX3SUqZ5slbkoqoKExZCMmpfrn6hx08vIQ12uAcThGfoR4VWlvzyPL7JqcSTALrFFNq9ncw2LZfQPBNhugv20bSayL/O59TyrTnGVTtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kGjz6Kxs; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kGjz6Kxs"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16A5143297;
	Thu,  6 Feb 2025 18:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGzraMmw+fA8wevuBLQcisstrYKOBwuJV7qXecxusco=;
	b=kGjz6KxsyWT27vY60CZKrslgCFbs+dKlEkuHKWDcoVNbh0Gc7ociJPjPpnqlPIrM4ez4+w
	gbgn7+t9jYJjDI0j6E05eqGO9e2Jf9P5t7mpaEvKsyax1U4/lJDnY44sV4PeuO52dYKcEg
	FTPFvTP9NgedbG7Ln014Yqq8HhCGMgjwRH17I3xqEXk0jzNPgTgivit6ioysGy7ZFfBVAx
	nDOA9MXl7n0rp5qxk4osl+iMPrRzvG+KR8VSd6QU1O3VJgeN3YsBZJtRFEB1OQia2iYCFP
	J/ZBmJQI8dpDwMBm+iJY+ngg7UMSHXSfzkPP8eEgwUmXvoZeryT86IXSoCfwoQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:38 +0100
Subject: [PATCH v6 23/26] drm/bridge: samsung-dsim: use refcounting for the
 out_bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-23-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpedvtdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

In case the samsung-dsim is fixed and the following bridge is
hot-unplugged, we need to handle the dynamic lifetime of the following
bridge by putting the reference when disposing of it.

The devm functions used to get the next bridge reference will put it only
when this device is removed. Do it explicitly on detach and in the error
paths.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v6:
 - use new devm_drm_put[_and_clear]_bridge()

This patch was added in v5.
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bbd0a4f5a3f52b61bf48f10d6e8ca741bffa5e46..8e94f099d67bee93655129625b40d4c1af023fcc 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1732,13 +1732,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
 		ret = samsung_dsim_register_te_irq(dsi, &device->dev);
 		if (ret)
-			return ret;
+			goto err_devm_put_bridge;
 	}
 
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(dsi, device);
 		if (ret)
-			return ret;
+			goto err_devm_put_bridge;
 	}
 
 	dsi->lanes = device->lanes;
@@ -1748,6 +1748,10 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->out_bridge = out_bridge;
 
 	return 0;
+
+err_devm_put_bridge:
+	devm_drm_put_bridge(dev, out_bridge);
+	return ret;
 }
 
 static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
@@ -1764,7 +1768,7 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 
-	dsi->out_bridge = NULL;
+	devm_drm_put_and_clear_bridge(dsi->dev, &dsi->out_bridge);
 
 	if (pdata->host_ops && pdata->host_ops->detach)
 		pdata->host_ops->detach(dsi, device);

-- 
2.34.1

