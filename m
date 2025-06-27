Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4F8266EE7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 22:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751064335; cv=none; b=Qy7NF++HiirI4RVW7Rlr4KOovKMYw+trAweXYUm5c604RP2L/ChzSy+xI7tGQ8ySztXQxsPATZYXyl4i0Zo1E55WLEhoTNIVTbxDJxvHDvjp4pjxR7tBum3D7rEY0vL+ZhhI0vpIeaJFR9OGcL8IXiWQt+7d3+3w6wuN4iVyMYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751064335; c=relaxed/simple;
	bh=eek1CthCd1RvO7Qs2r4Pe4gz/Q4+jCBePgrtnVHKvNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RPycSoFUArI4yvxLyE+AuCnjcayDShOyKre0cMpIFLpaM5DxO7uWVWX43yrv+GnNZDCIOzWjSAiNER8o4QFbhaaSqhCaqPHftuHm5Dq3Mw8uQ/egK6/SYx16h3RHmUSSP6i7tgK/JYdMoRqa/sir96uy7V/9S0fumezUUdbDIKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MH5KqBfc; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MH5KqBfc"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 852CC43ACE;
	Fri, 27 Jun 2025 22:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751064326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vr0T2pNUq0SPCwrqPVAq1LbhS4QqKuEpfagCHD6VWH8=;
	b=MH5KqBfckc0MkhvBwntAvU+TP0K9vEcIhRjVzOaiPx/X0HBRIHWOoK+QxJrVoTpM/MInyO
	hfgN/2vEqFkMsmq+OB+KvYXkoYr87mX7z39BxsDbJuRaIPey5Fgjn5T9fFvcYmJV0Pl0C4
	y5gruayQq4KaE24FkZqlQGUYnu1/ZZrEHBTCR54kTDjhU86bi/cwzYCZQWH3wbNpwdRf5F
	N4CDl3H5XgjRq8VteNc43KpejBii2zYuJE0DObs+zLSczKUTDeg5i2pJ/ZdVnrr7Ktj6GB
	dvvF6H1EmRt0UHarRHcGE3jj+1u54o3HPXXNJ5BNIkq/wPunjPLluElZBn1txg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 28 Jun 2025 00:45:17 +0200
Subject: [PATCH v6 3/8] drm/vkms: Add support for ARGB16161616 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250628-b4-new-color-formats-v6-3-2125b193f91a@bootlin.com>
References: <20250628-b4-new-color-formats-v6-0-2125b193f91a@bootlin.com>
In-Reply-To: <20250628-b4-new-color-formats-v6-0-2125b193f91a@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eek1CthCd1RvO7Qs2r4Pe4gz/Q4+jCBePgrtnVHKvNE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXx7+3wErRNdfVFU23ynpVlDjnWphyQfAV3ibB
 dqnmOz7epKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF8e/gAKCRAgrS7GWxAs
 4npuD/45Tn6SRR/zMLF/C5+/vqBfqz3S6NOkUclA2Ge2HMn83NXWtp17/tHgARI+UfA54IyqoPs
 H2tsPIgaXqNzkQZSqZp3G9fJQsH5J8jhm5oV38VP6mafDuelZG3mHL6e8PQnq25cR9sDJhqYg8O
 Z728iIRJXwtxdEly/cPlNklB7pdKr+l+rILJldVs23C97FUEstIminB13Cg7AAZ9i8ibXZ4iJEY
 xm/U10f1exQDwKHFLSUCd1IQpTjdhxW4Y7XTHbsJgwJepvB+dac+xdZsS7HBcwMvIxvWCk3mF67
 TRgTzDak4//yI617cYWnuavQh8pxMtNzLof8Cg3J8uvkLDgwc2DihXkImhvT8pJnSI21UwN8d2K
 jb3Yg0bG5/WMfHqD5Jy6amRizZpSuiz7UDE2ywuaH6+9jsRPk6Tfcd/XG2cyMPqhegvjatp3N6I
 LdvFWMUqIgHVp8plvpiTAUhMMj6pB8ZUaR7JbSARLczW85PntLKM4c9ZkBtB4Z6FlFA4H2iRIGa
 Zte0JfFV+fedKyzFyKTpoDB5AhOY18OgxjuRG+m4K2GWuQw+oqCtYJ7D7owLyJGy4Eyi6DLOdGQ
 QHBf4WdkxP7Pm5+14XcwD4ZLKQfXYSjdJXpaVHEBlA+CYxF/nnc41wUcUBK8JKMU8+zJxc92lZk
 H2iTzHh4kgcSeIg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehpdhhvghloheplgduledvrdduieekrddurddvjegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnphgruhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepshhiqhhuvghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopehsihhmohhnrgdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvght
X-GND-Sasl: louis.chauvet@bootlin.com

The formats XRGB16161616 and ARGB16161616 were already supported.
Add the support for:
- ABGR16161616
- XBGR16161616

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 231b327e86b3..44547f56e4b2 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -440,7 +440,9 @@ READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
+READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 
@@ -659,8 +661,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XBGR8888_read_line;
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
index 01fed722808b..d4c51b4486f7 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -20,7 +20,9 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_XBGR16161616,
 	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,

-- 
2.49.0

