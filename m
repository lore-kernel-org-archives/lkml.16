Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9516622CBD0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613977; cv=none; b=XrZ1KhBrkwQ3+GsgDTXDieUYbsidGyYR+ZpR0PXP21bPg9d+4fUujF0q/hUFLPa4ZS3NqP06Fr9e9Dw/Ps+KpPJzUlNkPbrcw+PzmJUvnKqDiL/u9OFyvnx+zWvrKzqGpucBe57qruoVESXogTiPwSAUA7nUVi9aNCHOpDdD1vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613977; c=relaxed/simple;
	bh=alEgJO1auXDPb/eQe3F+31ZKTYG0+IOBt/5vLzk4GKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lxWU13IetXfvdV2PBgWFJy+K2dEXReEYZecg9AYRCC/evLkA7EOtenZqkSitdJblMqgh18IG3ETHm7A05DwAPstrMMB7VQl6pm2oW1Aq1zZB4wvoUnvfg4iH4aF2vy5tIdBD/65lth6Ralrkhwanyt1a4NDNG+hW/TLpk3SnD+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L+o1ZKVK; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L+o1ZKVK"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 479DB439CC;
	Fri, 30 May 2025 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748613968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6XUdoJW21j69AoTOKy/V43D/kGkdmeo0JjSNkYTs5o=;
	b=L+o1ZKVKhzZeTZgP4C99XspHY5Qdliqz4EGmk5or8yLrzt9FMMAUBYcxRwrqAb3GVI48sj
	por06Fln/viQ771AfuUmK8qILJRhtlNyCBGL8WMd0QQU0NGPipep9qp/QxcZRrqaiWgUvK
	owOxJCq1AGfgmGp0TefOkAPQ1tUMPtHCLSaiyDFm7NTi+jws6B5MePMIZLXC3CN+wmPauP
	1lxOTDinYxuPAKOawieIHgBUip9TLS3jdV3RW1VRJhNlsB4bDsitjc+8OPYhx9LtOtyHQX
	LhhHytEuaYgN+XTqC6Q9Stg0LSECPCS+mBwEcJZn3W6Gj3FSZgANbpgzAieQ3g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 30 May 2025 16:05:58 +0200
Subject: [PATCH v4 3/8] drm/vkms: Add support for ARGB16161616 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-b4-new-color-formats-v4-3-ef5f9f48376c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=alEgJO1auXDPb/eQe3F+31ZKTYG0+IOBt/5vLzk4GKc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoObtJWk6Yq1snTY03I0PWifRdVJPfA8x1igzA8
 zm9HF+/XMeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaDm7SQAKCRAgrS7GWxAs
 4tFTD/9kxu10OckvfKK0qekZgvSJ4wVrcluJ3jjRYce2gXVGoS8wVNN2ci6GDT737o/vBpgeRvg
 ztQKigj9FdbqKuPtA2CTJnD/uU1KicKtO7ugHRt2b7xeHRUmfN1TbwQrV5Hr7azxSyeDhopdaPy
 4Ny7HJj87PY5UIof32ic9iA8OmZfrPr6zFgT/ngnN/R/7sBSC1lanbdo2lVuukl7dYSZ7AcnSZf
 +tc8QfqMnblGfzmgTHWbt/2vrQHReMxRH5gKvFox6ggVor85kQNLT0bqKvmxK6WJoWMheTMR5IV
 9skAperp8EH3rQLiafL1bp4Tx72sgrrUksP5IzYAfNTsGX7JFt9Ee47l/7TXLMsBoJ3MrkyYYTW
 +yL3HcOBK4nmnU4An40/HdjPU5TrGfF3povvN3N55KeOHMFRIDh6Qjifn2E2Dsk2qzRb4oPnjWw
 vFTVtSgobPJ6dXLm78LoMiZO+IpeRafsfqXoyHqGSldm5lhj8tmEKe8UD4Vry/3NPIcGUQgMFWl
 lJikCZ7O5tWSIlyflTnNgtb6nxJ0CqKeE7oj5V201YCtz9B8KQlb7adlaQHgw0ThVI8syO3LgLO
 6P7Ep9ih+M/9RFOvnZu3VpSgQZ2EiXW7eP73tv89yNdLBui400K2pkuxJZO925N//T12zvyBrXV
 //EF8tOxZ/ylxmQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvledvtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopegludelvddrudeikedruddrvdejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmp
 dhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

The formats XRGB16161616 and ARGB16161616 were already supported.
Add the support for:
- ABGR16161616
- XBGR16161616

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index f5c52c3d10a3..95771bff5202 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -442,7 +442,9 @@ READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
+READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 
@@ -665,8 +667,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &BGRX8888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
+	case DRM_FORMAT_ABGR16161616:
+		return &ABGR16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
 		return &XRGB16161616_read_line;
+	case DRM_FORMAT_XBGR16161616:
+		return &XBGR16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
 	case DRM_FORMAT_NV12:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index b7f498944c50..505847ec8508 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -22,7 +22,9 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_RGBX8888,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_XBGR16161616,
 	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,

-- 
2.49.0

