Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4481A5BB1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861381; cv=none; b=NXuHfM4wp5OyP6tlzGj3LSFqSIWn0d0WovXyUnAIq3AmJAWUEizwCAgjOTmrqOmXBo5VUxHQvwIk4edufMpdDsnbWjR4luArQktzkNZjXzqgIcr1dPbnlg3x0Zh0lfizKuOL/8jBgqm8W6eYLEafKK3VnCK8Ejd8vUgBmi08PXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861381; c=relaxed/simple;
	bh=+WqD3mfKunVayeN92Tq50LYIJXEHOef6CDqrWTsKbrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JlD/2bfinJR1QJ+YprtrVnaTVLR4AUOwk7WyB4WdrBPyKVnD6nG8a5xodWAAB4HAnjoOdhYYShT30f1RJYZzudyOPAiu2oaV+APE9ShXjCyXUhuO5Icfjl0Lgv6lUs4H1ba0jdwxOQjgjBNPXgq7EaqqLBWbwBo106tu30cNNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aU9Y0/ZY; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aU9Y0/ZY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C968144458;
	Thu,  6 Feb 2025 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738861377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xxiLZWLDrfDjchLRCxzgM2Xw7p+m6H71208sVWO4lIw=;
	b=aU9Y0/ZYQ9ohDTjOJseySv35+R4PFxM5jsQQSqtmr1AH46grlIBjGfDmkx0AUIziXUfz9Y
	pZ9ZlJIKYDnRnI0tQUowXMSZI4yepqC4eZzKM+XgDNWmDA+cMEx/D+OnSYlzpTxzRvluTJ
	VKTka36XkU30URQrB7GFeYsDoP4T8BqEBirahiWCJzXTPja+FSqc2KLexwwaWEcU1twyqY
	sjMGqi+HTzErLpXD4eL8h92d+JAfx7JH6RB29WEz1bVmhF9heNqeNpEpa8WKkENOT2LtlA
	JBfiXLnFv8qtWfPkvREp7QXrh9pXNhDO09Yaj9bhC0R7a34uX7zsI+4sB4Y+kw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 18:02:37 +0100
Subject: [PATCH 5/8] drm/bridge: tc358762: remove unused drm_panel.h
 include, add drm_bridge.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-drm-cleanups-v1-5-93df60faa756@bootlin.com>
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
In-Reply-To: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigr
 dhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
X-GND-Sasl: luca.ceresoli@bootlin.com

The file uses the panel_bridge APIs from drm_bridge.h, which is included
only indirectly, and uses no drm_panel APIs from drm_panel.h.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 46198af9eebbf8cced7b9b4ad628126f144c25dd..f92aff3d515a3354f7e447495adb3e18514b029a 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -20,10 +20,10 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 

-- 
2.34.1

