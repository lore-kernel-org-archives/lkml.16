Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B712A20D4EE;
	Mon,  7 Apr 2025 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043654; cv=none; b=BfvqpXI30V4noA+czgeA2GEMcI7Q7BU5tGaexJHg4zw8VOdksagIf815m81WHakOI2ClgoIp8EXUEvxi/j5n5oCIcQTKDKbhahrImSTqcwTerlVL/LtywJXDFqr+1bZPZ6PHmWnoZClHUxPdnaml835mr/6vB5sY3Ly+3GCQgus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043654; c=relaxed/simple;
	bh=dyaLNe+v+VR4r+EBOlsgK7a1g25zkXO9JHxa/rJMmoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bz5nACmLur2mz+v091WpIhDL5kejHvpISv6L7bP3du/dFbb9Cn5mC06VqnWiv4C2TBqVHvbu65N7InDT961dZqJ+cDBVIk51DYhPihSenWlCVjtyVDOTzUJVsMUWLZWmfzkw8zQjSyx0zeSezhrZoaftQuqoIGQirhplfL0Bc6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AyOZgjiK; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AyOZgjiK"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7AAF20579;
	Mon,  7 Apr 2025 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744043651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FsMOy7QRYRved35PCqQuHrlR3pOYMkBV4GzXKflkZTo=;
	b=AyOZgjiKxPkYfk6DG/FW6H/Di8ZUYWAokF3yYnkHRRWslbgAJNtQj+DZ9o7ZGGvnsWqSw7
	Mp1epUZ4psulceBqDV6dde9bBxTYn6p7j4mnDFBpUZIBQ9qoa/gfP1M9Rnv9mvwEIgJqT6
	i9pxyLrOUD2RX1tOJuOcxUmH88x7AV6R2umo2deLb8n6mN7V5K0QRywOqcGsXzhZSBHS50
	VjaX+StzFYzNS5NSFQHjTDUNEJVv07tETB+W2eigUlidZD5urp1O7cC9zTqFo3PF4XoTIT
	QKq8GzUyBOfiNPWoIHryQjHwEJfGtmjw/0gq9ZloTy0ffQbxVd+RrBQaYQuVug==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 18:34:01 +0200
Subject: [PATCH v2 3/3] drm/panel: simple: add Tianma P0700WXF1MBAA panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-tianma-p0700wxf1mbaa-v2-3-ede8c5a3f538@bootlin.com>
References: <20250407-tianma-p0700wxf1mbaa-v2-0-ede8c5a3f538@bootlin.com>
In-Reply-To: <20250407-tianma-p0700wxf1mbaa-v2-0-ede8c5a3f538@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlr
 dgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhesrhgrvhhnsghorhhgrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Add the Tianma P0700WXF1MBAA 7" 1280x800 LVDS RGB TFT LCD panel.

Reuse the timings of the TM070JDHG34-00 as they are identical, even though
they are described differently by the datasheet as noted in the
comment. Power up/down timing are slightly different, so add a new struct
panel_desc for that.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3496ed3e62056938ccc0ed2389ea46eed8d17ea2..0bc20547fc3b3b7164e7f5743d30332c479414b5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4418,10 +4418,10 @@ static const struct panel_desc tianma_tm070jvhg33 = {
 };
 
 /*
- * The datasheet computes total blanking as back porch + front porch, not
- * including sync pulse width. This is for both H and V. To make the total
- * blanking and period correct, subtract the pulse width from the front
- * porch.
+ * The TM070JDHG34-00 datasheet computes total blanking as back porch +
+ * front porch, not including sync pulse width. This is for both H and
+ * V. To make the total blanking and period correct, subtract the pulse
+ * width from the front porch.
  *
  * This works well for the Min and Typ values, but for Max values the sync
  * pulse width is higher than back porch + front porch, so work around that
@@ -4430,6 +4430,10 @@ static const struct panel_desc tianma_tm070jvhg33 = {
  *
  * Exact datasheet values are added as a comment where they differ from the
  * ones implemented for the above reason.
+ *
+ * The P0700WXF1MBAA datasheet is even less detailed, only listing period
+ * and total blanking time, however the resulting values are the same as
+ * the TM070JDHG34-00.
  */
 static const struct display_timing tianma_tm070jdhg34_00_timing = {
 	.pixelclock = { 68400000, 71900000, 78100000 },
@@ -4462,6 +4466,24 @@ static const struct panel_desc tianma_tm070jdhg34_00 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct panel_desc tianma_p0700wxf1mbaa = {
+	.timings = &tianma_tm070jdhg34_00_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 150, /* 149.76 */
+		.height = 94, /* 93.60 */
+	},
+	.delay = {
+		.prepare = 18,		/* Tr + Tp1 */
+		.enable = 152,		/* Tp2 + Tp5 */
+		.disable = 152,		/* Tp6 + Tp4 */
+		.unprepare = 120,	/* Tp3 */
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing tianma_tm070rvhg71_timing = {
 	.pixelclock = { 27700000, 29200000, 39600000 },
 	.hactive = { 800, 800, 800 },
@@ -5247,6 +5269,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "tfc,s9700rtwv43tr-01b",
 		.data = &tfc_s9700rtwv43tr_01b,
+	}, {
+		.compatible = "tianma,p0700wxf1mbaa",
+		.data = &tianma_p0700wxf1mbaa,
 	}, {
 		.compatible = "tianma,tm070jdhg30",
 		.data = &tianma_tm070jdhg30,

-- 
2.49.0

