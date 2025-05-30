Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2722C339
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613976; cv=none; b=n7vUdialUBzJE/xFIwYzTL9+du8TZKP+8SK52qAyN+esDix6hUVCBv3fvWG6R39084uD0x1HerduUWwgnBxXlXbG1aBSJfdnUuYAdYggTPv0l7dJrFZ2OuQjwAsWi/UQrqZs+7TU4Kbf8jKPmpz72ZF0OOOAsni331Oiy3wYV/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613976; c=relaxed/simple;
	bh=X9tW1Nq/WOxDq0ut1td6kjkE9fjcHd6YKHhQZQd/5r0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jj1OM5OURBSwuP2ygx6yUT7cnlvk7i09kD9rPJ+1H3UGjyytzjllJhCQMsqymM6d6XXoMetylErG+LJhaOK+HjyS+I1o8oURINbaa1wyHikViG86UFeTAtIySlIxkwVrF7zSotzIW8Fx9GL17KVR0XLpdpVf3hM+rnosr82Ptgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UrGFq6u2; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UrGFq6u2"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57102439F3;
	Fri, 30 May 2025 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748613967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7OhkFeAsi533Hlpt1BhpYmT2YAsZ42eaRmq0Cfyk6o=;
	b=UrGFq6u2wo8VbkiuaErVqyvWqLqwWUkmP2Bqtoi+CT5E7mL/IgILoSWSK3DrLqCAW0z7Jb
	PbdzwjU9RXpJXtXb3wpkL88LkiJ4DqEsZ/vbtZFXpYmsEparfQcbnNI0/UH0IX/OzkmTxp
	up28o5ib7v4sxOMp0h7I2mYQFWZwqE36U5uJdZLCOACaw/QENdOSBl555TFV8Q79n9qWnE
	eIIMAXB4glGlWQp3eOKAsNxRQp+lQse0X+bbW2RYt8V6vP066zOQ65yb5hrwYPM6bwEV6w
	Vd2G1Y4UzH4Adr/wfHZJARTyqV/6adlsAli+QLVX5sJI2c8klvq0IAn50aCRcw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 30 May 2025 16:05:57 +0200
Subject: [PATCH v4 2/8] drm/vkms: Add support for ARGB8888 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-b4-new-color-formats-v4-2-ef5f9f48376c@bootlin.com>
References: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
In-Reply-To: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2794;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=X9tW1Nq/WOxDq0ut1td6kjkE9fjcHd6YKHhQZQd/5r0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoObtJBOWNqwjfCst6uWtD0HeLqGJJ3aQEFAcSm
 SpxxNDTrP6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaDm7SQAKCRAgrS7GWxAs
 4uy/D/9ZwowRNesuWN/OKqBB0zvcb3UxATcXyS8yX3yA6RRTIdzj8EF1h5tIGCwnacH11FkpuJF
 V6fZoINmwTXW8DbjJAImEmWwV5TZgdkNlWPn0Lk8M8V9Lg+O4tEqeG9hcLqlhFjC0V6yO8UnOJw
 LeFWjuWAEsPMhkpnh4houUPyfYf2Cw9JUGciwyUrdpLBdas/SDTvSs17UdXSJtquT5lpYwyFjtp
 FtDikteKz8DBFRuKon0l4bwvarW48QarHkQQhtiwFOKQ0hdrp7BHwP6PDiYgq1ImeAgz3CfbdWW
 Qp96lYlcetn7uOJyWdV5WtX1Hf2TEMyib6rA4i6+8Gcz16nIiRbSj4unNaSH4EuQhB52AtINVBu
 8B8BVRjVNn/yAnTHZoht+41gyYadxhOdosy0H7RypUeDi1jEhGdGWhFHnVqndPTo8BdMXSFx/wq
 81CDZxhew1U5EZQ1kwk11er+2/9iyPLUzGmgaJoSVyYBSTmfOF/tPxXp4O1iNWB0MWZmKwNugZh
 Fk1z1A0JQEWkV1sVkNYOJSl5T63K6AAte7iWcSValZU8NrMWjBhzOMCrkjycRZrZwiDJEwI/+re
 zK6rWOekjrCG6OgzYjKTfS+WzvnaAWpONz/gpJKiVV5gAaGJtb4n3oiC/1P9BkGV1WkL/zPcaRd
 9Q3LNlDZy1UQJfw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvledvtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopegludelvddrudeikedruddrvdejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmp
 dhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

The formats XRGB8888 and ARGB8888 were already supported.
Add the support for:
- XBGR8888
- RGBX8888
- BGRX8888
- ABGR8888
- RGBA8888
- BGRA8888

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 19 +++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c   |  7 ++++++-
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index a9c624081dac..f5c52c3d10a3 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -432,9 +432,14 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
 
 
 READ_LINE_ARGB8888(XRGB8888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(XBGR8888_read_line, px, 0xFF, px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBX8888_read_line, px, 0xFF, px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRX8888_read_line, px, 0xFF, px[1], px[2], px[3])
 
 READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
@@ -644,10 +649,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
 		return &ARGB8888_read_line;
-	case DRM_FORMAT_XRGB8888:
-		return &XRGB8888_read_line;
 	case DRM_FORMAT_ABGR8888:
 		return &ABGR8888_read_line;
+	case DRM_FORMAT_BGRA8888:
+		return &BGRA8888_read_line;
+	case DRM_FORMAT_RGBA8888:
+		return &RGBA8888_read_line;
+	case DRM_FORMAT_XRGB8888:
+		return &XRGB8888_read_line;
+	case DRM_FORMAT_XBGR8888:
+		return &XBGR8888_read_line;
+	case DRM_FORMAT_RGBX8888:
+		return &RGBX8888_read_line;
+	case DRM_FORMAT_BGRX8888:
+		return &BGRX8888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e3fdd161d0f0..b7f498944c50 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -14,8 +14,13 @@
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565,

-- 
2.49.0

