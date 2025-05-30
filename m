Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961BA22D785
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613978; cv=none; b=UCWMb54n4KAeJYFqqNjOCtc44M8KT6r9iVfX/z264P0gq8lQ+B7f+APEA+PWgMxDhd3n3JEohowx1eQzVv70bDCxHPpjgeMx5iCtKLX259hdA5Kf3bjN1ExmgNjvE53x5B3YE+rrUPgSz8LxJPimvacPTWJz93OAxzHBf/3eEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613978; c=relaxed/simple;
	bh=TBuh9ZMG4MWQ+iRBbMkDA9zk5+YZbn2S6VU4rvl7JzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjC7uxF5Yz395ZcrNm9AUQKpzjQ9Ep96EtWvamMupJsGfhRlodljIzW8IsYaBpiN1qfS+Ptbm/b1+rhHqsokVI1G4+q6DaUYn6SnYbIK6gCSWaNJzTuqhHSLJzrJQrhnt67BW1+7tP3yb1Lda/TUGwM6TiJUuZpyQrCDUnj/Veo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OhTsdqXI; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OhTsdqXI"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46867439F8;
	Fri, 30 May 2025 14:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748613969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f8aGcYGnRNbebyyqAlnrNJp7mwlnM9lBvyk7DGfzRYo=;
	b=OhTsdqXI9onut4nCcJfm4vWU9kJKCH9LZiff+tacx2D3hSkQqS/7O3fWB3wBFy/pi6KZ5f
	JqlPIvqCrn+gO5f5T4/TgCM6ZKzz/B8cmO1XZASOVpZiDZYS66/4tu80kmBtiCVCnXRJw0
	/5C8V6w8cQ7x7f604QxefFdRJpR09WpXmGpj65TCD5PpPquvyztV0Ktx7LPcNPcMoa7V80
	kDfTUIaYhFTmrStct4iWZrYZtEf316OgFqwZw75Vr2ThEov3BJQSKbnhUY37BevVE5VkYz
	klaqAdIMh2VrLxxlyhypT7eFSE6781ttSUrSN109P3aMCwykxIxZSjZUjseNQQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 30 May 2025 16:05:59 +0200
Subject: [PATCH v4 4/8] drm/vkms: Add support for RGB565 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-b4-new-color-formats-v4-4-ef5f9f48376c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=TBuh9ZMG4MWQ+iRBbMkDA9zk5+YZbn2S6VU4rvl7JzI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoObtJvGiumfX1R9hi8NmmGm5Z6sy2a11/CoIrj
 g+9sZrbVDyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaDm7SQAKCRAgrS7GWxAs
 4orwD/sGGDrb27hex5TWEEn89dVmfD0voFSbQ6KyYlusiQCvHE3/0ckEimRgCJPg74/vYCkP5Mm
 ibVBP1ipZvsRm956od4GrPQodDOspIWHZLtxrWuIG2UzQK+QCvwui2ggrsjlFLX/ilCqlbZnEQN
 Q/xAKfmVKcWQEt4J/iuZorUboLKdi3S+yV3HTonvcW1dAdX+GNEkKIxeMfOQj5nn09fTPJm2hEw
 knhcPbOvtOfBwnM9MkCPwEoku5VwKUE60ScyfqkA1UJahHRvp2mQUxMkbuPKeQjmWsqfsAI916S
 5RcidFgCgOnP3gS5UhUmI7oCPDDw7i+lus3LcizYm2QKc3J3zrCODbrRi16aJDNuAW6nTGggS4/
 13NhviSRo0YxcchQy10XQcU9h0dFuws9rQaUzwIWyzP9pxMZfZKHxMeV8OPTGV6qyQ2qH4o0Kkd
 JfztUpWBJQ1iSsAU/0PEyKKzc2oIpjrnV6jAPFJOu3M+vhChpEflcX82fDM3eX0rSVv3uBXmfdV
 XOFRM9r6Nbdw5XHXiZywHgfwExN3rvqJzomFmytTAohLli2mKgm6Xf+yDmHqgTIvwErO6UWgYeh
 BpwzNgHY8XhIVDXijdaeyXgSEJboVyXCSQHA881hwAN8yu+be2lLv9YQpBHJWSrdiqlfFtwuTzA
 RuHQga/Ba+6UnqA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvledvtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopegludelvddrudeikedruddrvdejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmp
 dhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

The format RGB565 was already supported. Add the support for:
- BGR565

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c   |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 95771bff5202..2c5cc8d3a14c 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -259,6 +259,26 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
 	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
 }
 
+static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
+{
+	struct pixel_argb_u16 out_pixel;
+
+	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
+	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
+
+	u16 rgb_565 = le16_to_cpu(*pixel);
+	s64 fp_b = drm_int2fixp((rgb_565 >> 11) & 0x1f);
+	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
+	s64 fp_r = drm_int2fixp(rgb_565 & 0x1f);
+
+	out_pixel.a = (u16)0xffff;
+	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
+	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
+	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
+
+	return out_pixel;
+}
+
 VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
 							    const struct conversion_matrix *matrix)
 {
@@ -447,6 +467,7 @@ READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[
 READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
+READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
 
 READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
@@ -675,6 +696,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XBGR16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
+	case DRM_FORMAT_BGR565:
+		return &BGR565_read_line;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV24:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 505847ec8508..d3783a8f84c2 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -26,6 +26,7 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,
 	DRM_FORMAT_NV24,

-- 
2.49.0

