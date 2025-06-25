Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748E2DAFDE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869951; cv=none; b=pwtRNpPPbC7Sa7sNfpYIYo4H//ql/m4BHXY8sLxLH1ZU2duM5VjwblfjiMErxOuplv6k1BwkPkNzyR6xvuYZkYhvETpYRxFloOF5BhC0YFd/fIqBeKz5svuovdTQU6IOslbMH9cRGif4mTsrsbe2LxY25J4+DwpwY4wAQiea/Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869951; c=relaxed/simple;
	bh=XvvtwVhxl/S/8zjO2QIM6Pe5v0m8Gsdgpgw+ehH4z3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5QEVNFKiG+DyvBdN9XjRFNAevzDbYzNppzbyXiQy1bdiAOyGIivvTCszLM2WOqtqcFM+jFuaMfMHj77P1H6SdgVHAUHTiSt49l75f37StaoCD93KDdNSy5ihoiJ+daiDYTXiLqv78fKUVnv3W7q1/wgmt4SWMtUxJXnGvJtRzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eFZD6zre; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eFZD6zre"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40FF14438E;
	Wed, 25 Jun 2025 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bV4eUxYdn3V7cpvk+JiImboxMK9at8bqkGIbGkErBX4=;
	b=eFZD6zrefLIO7wH0PDmlXy0yaERJbiir6FNuLD0WjEapxWfQpNgLa/AoYGSpfg6127/TyD
	R/1NhkIeBhVf/7HGrtYcEyM3y7ZOiyN5tCVcbxnq0CwmhHuM2r7ReyoWNLOD5FPlJpuKgp
	Jomw50ejrEgllXCegfqoLMwu3IQLdy2q2xwgmkahMhiaekgxFT1nqpZ3KGWnHPVo48NQQ6
	PzqAPqR5al4d2t6f1JZFluQs2mtcji3GEH4XSjeSI4KKflO7DUykXQruZlBviZCmldVjCR
	Ov7OIWIqG33mAp+9i8SJ5gP7YOH3VRDRZNLIpZ0QXMLeUcuYKXq9vwgP62A/xg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:09 +0200
Subject: [PATCH 05/32] drm/mipi-dsi: log DSI device attach and detach
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-5-e36bc258a7c5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvhdpr
 hgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Some MIPI DSI host drivers log a line on attach success, failure, or
attempt. These log lines are inconsistent and sparse across
drivers. Moreover most of them use the "info" logging level, but drivers
should be mostly or totally silent when successful.

Add logging in the DSI core, so that it is consistent across drivers and
not redundant. Log for both attach success and failure, and while there
also log on detach. Print the main format parameters on each line (lanes,
bpp and mode flags). Finally, use "debug" logging level (except for the
"error" logging level in case of failure).

Later commits will remove the now-redundant logging in individual drivers.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 82d4f9c1de5fbc60f32d0b0baf41e1bd2991ebe4..f16f70c70c87988a95f959d0b8b18a6941dd2808 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -383,11 +383,19 @@ int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 		return dev_err_probe(&dsi->dev, -EINVAL, "Incorrect lanes number\n");
 
 	ret = ops->attach(dsi->host, dsi);
-	if (ret)
+	if (ret) {
+		dev_err(dsi->host->dev,
+			"Failed to attach %s device (lanes:%d bpp:%d mode-flags:0x%lx) (%d)\n",
+			dsi->name, dsi->lanes, mipi_dsi_pixel_format_to_bpp(dsi->format),
+			dsi->mode_flags, ret);
 		return ret;
+	}
 
 	dsi->attached = true;
 
+	dev_dbg(dsi->host->dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
+		dsi->name, dsi->lanes, mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->mode_flags);
+
 	return 0;
 }
 EXPORT_SYMBOL(mipi_dsi_attach);
@@ -406,6 +414,10 @@ int mipi_dsi_detach(struct mipi_dsi_device *dsi)
 	if (!ops || !ops->detach)
 		return -ENOSYS;
 
+	dev_dbg(dsi->host->dev, "Detaching %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
+		dsi->name, dsi->lanes, mipi_dsi_pixel_format_to_bpp(dsi->format),
+		dsi->mode_flags);
+
 	dsi->attached = false;
 
 	return ops->detach(dsi->host, dsi);

-- 
2.49.0

