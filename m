Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8C2F4311
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869964; cv=none; b=eLSFg0BV14khDpo4Q0tg8p0pTQ9qarY6jYe7w5c6g7Lb3mfZGEawY6w+ITZtb6rCzvNwB4S14Vugjr+jRn3x7/ZoCz0alSCwzcGyvm+xCPqwHrgXr5KQOqjihXKbpA25oeGILwt2IME8Iw+IRBuLdAopQ/B8RThvnmeWKCsmzsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869964; c=relaxed/simple;
	bh=jMJ4mUyUrsowAfMq/H9veTuhU9ys3TaVVx/l6nqA9aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHKyE/Y+84UoNTWHYNQXBktjj/l8xi8CYeJipr+1ydAOt3z4wE30ZJ+0Lb9FZE1AftVRL/OB+YAKjW7BXthGxFQQCXBQts1MskwDVTmmD+XAVYxAFp85IHuK3zpRxb1gxbS75bodaVIqcRBNjKZYe3mfBE2jOG0CD+KDfLNWFoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QuxfdDHq; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QuxfdDHq"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAB394437D;
	Wed, 25 Jun 2025 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3a1Rzdc1h479uhkmsSChL9Bs/Oz8Co/C/4PMlEqNa3g=;
	b=QuxfdDHqgPHRizJVH+3oQCXlpbMy5eywPhI4Ozl0lF2js/0GOMfrMlciMa9NtNXRr+Z7q4
	xKrFtXj2Ag38H5ZlAEBRb4xEwj2bgrO6sxsu8+UtJMqPCKiTA/nwJFcJPJn1AadfkfNpbi
	rLq3koLgDr8H37S0vvYMOAIAsG9Po5vPVlh9+NFgxiTP3wR7VrvF/f9kabpvxhkfAnn0r3
	oXPaYfeZithCwipFBKdm9GAELB2719Fo1q/cK0JnMpgL2dS6DMIuQQNUqz1oOK9L4k/uVq
	ryeSwMfcroju3yYq8torzkFLB/Tfo97r5NlbMxXtNyDvXzwrXV5SOHo1BdVuGw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:17 +0200
Subject: [PATCH 13/32] drm/mipi-dsi: move format define above
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-13-e36bc258a7c5@bootlin.com>
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

In preparation for adding a new struct using them, but visible to the
struct mipi_dsi_host_ops declaration, move them above such declaration.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_mipi_dsi.h | 76 +++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..e42483fd022fed4dfc9e5ef180117c3dd37a3b51 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -64,6 +64,44 @@ struct mipi_dsi_packet {
 int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
 			   const struct mipi_dsi_msg *msg);
 
+/* DSI mode flags */
+
+/* video mode */
+#define MIPI_DSI_MODE_VIDEO		BIT(0)
+/* video burst mode */
+#define MIPI_DSI_MODE_VIDEO_BURST	BIT(1)
+/* video pulse mode */
+#define MIPI_DSI_MODE_VIDEO_SYNC_PULSE	BIT(2)
+/* enable auto vertical count mode */
+#define MIPI_DSI_MODE_VIDEO_AUTO_VERT	BIT(3)
+/* enable hsync-end packets in vsync-pulse and v-porch area */
+#define MIPI_DSI_MODE_VIDEO_HSE		BIT(4)
+/* disable hfront-porch area */
+#define MIPI_DSI_MODE_VIDEO_NO_HFP	BIT(5)
+/* disable hback-porch area */
+#define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
+/* disable hsync-active area */
+#define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
+/* flush display FIFO on vsync pulse */
+#define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
+/* disable EoT packets in HS mode */
+#define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
+/* device supports non-continuous clock behavior (DSI spec 5.6.1) */
+#define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
+/* transmit data in low power */
+#define MIPI_DSI_MODE_LPM		BIT(11)
+/* transmit data ending at the same time for all lanes within one hsync */
+#define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
+
+enum mipi_dsi_pixel_format {
+	MIPI_DSI_FMT_RGB888,
+	MIPI_DSI_FMT_RGB666,
+	MIPI_DSI_FMT_RGB666_PACKED,
+	MIPI_DSI_FMT_RGB565,
+};
+
+#define DSI_DEV_NAME_SIZE		20
+
 /**
  * struct mipi_dsi_host_ops - DSI bus operations
  * @attach: attach DSI device to DSI host
@@ -112,44 +150,6 @@ int mipi_dsi_host_register(struct mipi_dsi_host *host);
 void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
 struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
 
-/* DSI mode flags */
-
-/* video mode */
-#define MIPI_DSI_MODE_VIDEO		BIT(0)
-/* video burst mode */
-#define MIPI_DSI_MODE_VIDEO_BURST	BIT(1)
-/* video pulse mode */
-#define MIPI_DSI_MODE_VIDEO_SYNC_PULSE	BIT(2)
-/* enable auto vertical count mode */
-#define MIPI_DSI_MODE_VIDEO_AUTO_VERT	BIT(3)
-/* enable hsync-end packets in vsync-pulse and v-porch area */
-#define MIPI_DSI_MODE_VIDEO_HSE		BIT(4)
-/* disable hfront-porch area */
-#define MIPI_DSI_MODE_VIDEO_NO_HFP	BIT(5)
-/* disable hback-porch area */
-#define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
-/* disable hsync-active area */
-#define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
-/* flush display FIFO on vsync pulse */
-#define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
-/* disable EoT packets in HS mode */
-#define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
-/* device supports non-continuous clock behavior (DSI spec 5.6.1) */
-#define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
-/* transmit data in low power */
-#define MIPI_DSI_MODE_LPM		BIT(11)
-/* transmit data ending at the same time for all lanes within one hsync */
-#define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
-
-enum mipi_dsi_pixel_format {
-	MIPI_DSI_FMT_RGB888,
-	MIPI_DSI_FMT_RGB666,
-	MIPI_DSI_FMT_RGB666_PACKED,
-	MIPI_DSI_FMT_RGB565,
-};
-
-#define DSI_DEV_NAME_SIZE		20
-
 /**
  * struct mipi_dsi_device_info - template for creating a mipi_dsi_device
  * @type: DSI peripheral chip type

-- 
2.49.0

