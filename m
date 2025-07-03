Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EC729DB97
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529455; cv=none; b=fug5F8tc50sckYPyIGhGj0ycniQnQGsv2ZPzNHv4lV+eG0mWsYLZ/c6NVnaVP47wiQU8J4AFn+rzx7KVvSwipf8FlYzZGmmM0gAybcf1yUSASjfwX/xcQFI96tzl1CA6vhR2zwBYC2lLvSadhYOap/2VX6CUuVK+ro05tmusoN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529455; c=relaxed/simple;
	bh=xOVnO/wAOs+8umQBv0fayAWJqQEdaAZdMdK0z7q3Ktc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gl9NQDACS8CAmdfEfDBGgtsmT63H27a598l32/N6/znIaSeW6j6A7YEO1sNYc9bl6/g0nvG6S1WY0XBmGHCDl01pi1OyrZVcg8WvuXKlS7aY050uCTsOYLLE5vl4rtb0JeD/l2LH9nDhbISWzDCiAxO7kMvsh8kbe1N/7fzKVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DPgnWdwd; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DPgnWdwd"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B514844472;
	Thu,  3 Jul 2025 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751529446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkknVkIauESu+gH93JJT1wc5lLVY2IyRlDbzwQ7xmdg=;
	b=DPgnWdwdOZ0HyO9eGA/mTXXEiiEUBVKuil3d1KCauVCVf5FUm+vN60DJ5uDr+VgCTkP6JM
	gEMpVv5s9H91QFRSFUG5kT4BsxmEEMY5XwAnplkne04Vin74q++RtVWK6BnqprZAlp8iA1
	ObHkTQTDo6pHu6P9+laCwQoZ1qHSVNOujv9awnPLT8+ptcbfz2FaVpfGrkNTAzDAseUwnc
	QMi/07FtPkUMzcAhMyAmtCtEwHv3gyQu4G3dxQnVCYLpm3aI6KhPlqXdzJ1oGyWc1jhy0W
	iN/ZndlmjuYs0rMqpptuf/sSOKhqwhfXWWmDpuglS2L4RI3mv/JQIT/pA+EcmA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 03 Jul 2025 09:56:59 +0200
Subject: [PATCH v7 3/8] drm/vkms: Add support for ARGB16161616 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-b4-new-color-formats-v7-3-15fd8fd2e15c@bootlin.com>
References: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
In-Reply-To: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
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
 bh=xOVnO/wAOs+8umQBv0fayAWJqQEdaAZdMdK0z7q3Ktc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoZjfgs94OKW8UYlG/V9pLtEtsdr8/nx9P2fcYt
 RObsscnUFGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaGY34AAKCRAgrS7GWxAs
 4tiSEACOIRx2S8voG58iBJWoULZHfZornS4FZPdVBWZb61mHFZxLgqRyEr2C7jLJ/0DIBUPuTRC
 ovBzVHIoARLY82Nx2Cw0ub3/yota5ll1dD9LvpIH5lhloK8xTOQ8YeuWe3Cj0wZO81OSmuQPLvl
 2kU/VSvzhOdsx9tC2zauLfmlzZ78U/36DdSsfH4b9Ympjk8pCYCxwTQDU44SiblGydS+GxL3DXk
 o2D5c+3gXC2MKYRHcyGJNAF/p85WpyBnFr2JO1IBCEY96FOiliGUJVUFDhtuPn1JYN/THbdQbqh
 4MycbzWFgrZfU525H6Mr/7lewL+waHi6ir6qREaP7uWpz3mzmTMV18wKCgye66OO/ECCt4aGmh7
 Lxn5IIw0XQFUYo5vs7MxL6jbJ5fgSbPhLcgafaBiPS45X0nA49cMH0LQuWFb9Ecg7LwBPsNOzVO
 a3iLjgsk2NuX19PknugdRNnFOID3cINDMYfai5Ajk4YXpFzQV2MgqTglBlDLBw9qaPa44LlFk1Z
 Lu8Kw5rhYg8ir1eTv8WwVSLc32FawxdKpe7/ON71m9FWQbsHXeexIkvLxCYv2MVXs+ufVzPFAsv
 P2hoz90+Oc2Wura6cb7PgjpGnZQ75WMHof98itwRWl1xWZ8uRLoOxdoVg/3ILH/+rC3CeBsa3x+
 Yw27h6Yw+va8kFA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeiudehtddtgfethfduudefffduteekgeevueetudevheehieevtddttdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtp
 hhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
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
index b11cb2955943..c37d1aae6eac 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -446,7 +446,9 @@ READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
+READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 
@@ -665,8 +667,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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

