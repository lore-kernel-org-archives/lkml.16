Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7172522DA0D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613979; cv=none; b=SmvL15ge8+DUTDJ1/1lX/R7vnE/P0zFD/8REVDu1paea6xU6LX95vHZtKvUFP4qmxES3hrzpPKGvNWTPtZtKZE+7Rdo02aectqgSblvwq3PQ0NPQrW8xD7dK5m7tYfVRElPYKmRFJ01AKW8kBBQE/ZzadNAGE6ODSvKqrWI58M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613979; c=relaxed/simple;
	bh=eXBtymdZBmmph4XGkJGEhjCUqi4R77dLZzWV0zQDb4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biW9pvBfIlmhjnH78zpqelOwgKiHsjHKtnSkFIjouNGLi5+OgSh3C9H7uYsQEOCkYNHdY+TQAmN8WPGL0TlPhz3j9L9nDfNY7O9MHdDXLlocG/tKM3Mr3v+ttF7hwIn6+4yTMTl3gRAASfQBy3iATtOIQVr3zCbmx7kGuMhhG8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EbVCam1m; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EbVCam1m"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D389439F6;
	Fri, 30 May 2025 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748613970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mizF4EJot6tOI/N/bC+Jexu6RfVj9AE7hPimb3haMY=;
	b=EbVCam1mWYQ76glBdzya1f99cenUwbneVhkoJarqOAKN/ojdn7GOqONq2x8Y40S3Yig90U
	/4DaqaX5hk1ti7iNAfq2RiQnbZqdz0Yqdnfu/S51XdgMLWSaVehyavT8z9oKp4RUiQPiu7
	DLAxg23b4JIXOVvykrqGjT0FjnVRs9/3pDbcKb+fEJm6Fwkzjpbn638m3sGWYyGvGlp2f7
	E4jTODheEX2DHOcAasKBIW4Hl/GLUIuIdKdf5bpnl/Sgj7kjp78j1jNz5oNenrcfS2zLD7
	3PxTib6ypzV6SrJ/VW8qT1bp24jGp78Ied2OfFM2XeWbQJ/XMhnKHwPHqCdigQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 30 May 2025 16:06:00 +0200
Subject: [PATCH v4 5/8] drm/vkms: Add support for RGB888 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-b4-new-color-formats-v4-5-ef5f9f48376c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eXBtymdZBmmph4XGkJGEhjCUqi4R77dLZzWV0zQDb4M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoObtKcHoghUZKBC8imcaP0RFGzZD4US9EBSUHu
 uWrthcBlmaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaDm7SgAKCRAgrS7GWxAs
 4lopD/9pbIeVG4yZ5Tlgy/lq4NjOr3thATVpMU5Vl77iqjivOAzSU7ZXfl5YRRxeiDjbsr75VCy
 ndZgQN93q3MPKXtzTieYjzHX30e+gT9KAFm2rvq8ejlGavw6ajtBmr2PFFfzosqBf/tArWnWfVC
 SNWaRwFM4Cr9ZwTqTUVhLFxMzL189LQj0XZ75tvOHj97mhM+bo2qBW1bqpfh6BlOP7Yg1NQY/xq
 FwlK2hd7I+xruxEg1bltF9CYJFMY8phZzgmJY0kU5A9pJ/GMTNF7SRWzZRKoE5uYOS1Nzrkqu7F
 Y6kAfkhQeJ0egiijcz93vsWupv1IGHBqXKIquLpqLfhMzReUqQGIricdU0YN0p3XLgcD5xh4G55
 xMCLmUfEW4xzqk0J32XNyFSI90Zrhi2D+oJ10V+mEj85BHR/ryQiF9zKOsYR3us9yXGnsqLMCnZ
 hh6hzGjJAMLiYnde5fHRD9zoLQb5gUdetRQxFITI4moAaZ6xUF0asReZCQeCzb7bd7uuWOxuKkO
 1wl119BxJliHqTIUwqQuJgszCAUyTmLLYXJ1gA/Acq/0hse1mvUN5Kea6rVWJTo0uLMWvo17jTK
 A+fjI3QRy1aOgg+CmIdCxkOYS4O+YmtI3O2gvplTJBpIJA119ztBWLJC+vjUZcTKdCaloipgjZl
 q227Tq6QjnMFeOg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvledvtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopegludelvddrudeikedruddrvdejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmp
 dhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

Add the support for:
- RGB888
- BGR888

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 +++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 2c5cc8d3a14c..5106441f916b 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -461,6 +461,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
+READ_LINE_ARGB8888(RGB888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(BGR888_read_line, px, 0xFF, px[0], px[1], px[2])
+
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
@@ -686,6 +689,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &RGBX8888_read_line;
 	case DRM_FORMAT_BGRX8888:
 		return &BGRX8888_read_line;
+	case DRM_FORMAT_RGB888:
+		return RGB888_read_line;
+	case DRM_FORMAT_BGR888:
+		return BGR888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_ABGR16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d3783a8f84c2..e82b60fcda4b 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -21,6 +21,8 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_RGBX8888,
 	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_XBGR16161616,
 	DRM_FORMAT_ARGB16161616,

-- 
2.49.0

