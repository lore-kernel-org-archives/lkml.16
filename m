Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789382BD005
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529457; cv=none; b=uONylwiUOUDuN7mZzoxAHtKsoy1EeGHyZT6S5JmQFuC6ZpVMqXLPseXJ9aCAwsSRiZyBflY7C7LBPmU+zALNR8QaQYDRCGAMRSEK8ihPOSDpwnDDn6TAwOGAUzUI8r7Tc9nISaqdKRnCymeyhvztP8YvJ84i19j+Ct561y44naw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529457; c=relaxed/simple;
	bh=y3S+U+2h2DJbwzQKp5+x7Wemr7UdoP66AqsKzkGXz9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtgwzDW1lQnkdJZiWw+u9YFS6k/wXPqV1qSCtsI15YNIok11/+tFtgjNiDHDa0LYbq5en6+W5eu+pOghtHCAB4PYPdtFNx1yH6ng8xn98xpfR0oC3DbJHYX24IN6fZT9lnZrpyloVKcTVYkSdFPGMC5AD/CW2hgNeDtrcmXLOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BafqzH8a; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BafqzH8a"
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFAF444476;
	Thu,  3 Jul 2025 07:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751529447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbui+zYgLvZpZpjNwyeYSZBvW/EWcwkD+YwOnsrwh88=;
	b=BafqzH8aNQ0DZbQyvd64Uc8HkX/W8cQI19Aqm1iwDisNwX55yiary9cFmpbVNgWGgBQ6JL
	1P81EpnEKIKWh1DNVTHyTt/UZ89JjOyK5SK6U7EtIU9Qy+PjnyJyqaP/ZjrUk8mW9zIt8o
	hZf7KLtih6YeZKRix1dy2CV09lRWITrNbK2QxEfzxqZ7Qy7HYtwr86FXk2kIZUDabctPP2
	Btvxfy/MCg6BVJoBpXQoWIKZwUL2H8lE3A2dOfz1IbWzSgc9L3Seyi6bPzv4sOI8sOqkYq
	z5/zzgcMgPdYH+m8uoJQczudv+2J5ny58wEacTZ9dLmuo7dRk+wYaF/OrMbcvw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 03 Jul 2025 09:57:00 +0200
Subject: [PATCH v7 4/8] drm/vkms: Add support for RGB565 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-b4-new-color-formats-v7-4-15fd8fd2e15c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2212;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=y3S+U+2h2DJbwzQKp5+x7Wemr7UdoP66AqsKzkGXz9M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoZjfgSi/ZxuCgSAMffo7hkKw1IMo3O1sHetqj5
 uIWd2ePfI2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaGY34AAKCRAgrS7GWxAs
 4kXVEACbwC7owWcjQUz+oeqc3QLJPhir3zQGBxlL8ZRw/8tp5DFaxQH8tvKd1k+DlkwSyCWGFsa
 vbqniIPlUEm3TcxAJ2Aput16mP3qUdPH+bEopYbLRk6lsD5+OJSIssPHMVEDh9HuSedO7CVxLVc
 3uwuWAf2mDE9B6R9k+CUsgWp9flxeO0ZrslSlAgenbSPfoNX49AVPuO4WzZAn3D/ayMmZdNVFfc
 4EhEOMg/UGEmZuPJu2pEWbCCcB+2w1TDeeEquu4IaWcslVyEiTuPql/S9ayj8nyZrxR4ZYKx55G
 IXbYAaBoPOoEt9LyE9K6LZauwgzaWyovztakONZ/4dHYiijGNOT6NfgrbCpHNkPBMsM7BXjYlog
 Om22TSFUin7pzKVMmn3TuqbxNUrbg4zfmEt1GsyYgvVAcJ/asBi42ga1UMsT6tSQQv2TcATVyWf
 8rl4y1eJVfLxgyKL0BvzzN4egt0/S4D3t6+B8RwUS2W+Tk6BlMXIz8QSdkY3G2JN4OeRzvEfcX8
 Ztnxes5UyuIJRTYvE1Pl0CRzaAxEcOonJb05sxvHMOlZwYfhbudmCySBr7sBc7hL4VroSFGjLGT
 hBUClO+WJqLuVxw4ObTLuj3zMMBEddqHF76EzF2B0H5SXKMoyO4qh6WKuqTI46IN4rlZH2qiUK1
 HhWeJgcxvJ6fPqg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeiudehtddtgfethfduudefffduteekgeevueetudevheehieevtddttdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtp
 hhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

The format RGB565 was already supported. Add the support for:
- BGR565

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 13 +++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c   |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index c37d1aae6eac..544bb6795805 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -259,6 +259,16 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
 	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
 }
 
+static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
+{
+	struct pixel_argb_u16 out_pixel;
+
+	out_pixel = argb_u16_from_RGB565(pixel);
+	swap(out_pixel.r, out_pixel.b);
+
+	return out_pixel;
+}
+
 VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
 							    const struct conversion_matrix *matrix)
 {
@@ -451,6 +461,7 @@ READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[
 READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
+READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
 
 READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
@@ -675,6 +686,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XBGR16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
+	case DRM_FORMAT_BGR565:
+		return &BGR565_read_line;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV24:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d4c51b4486f7..6e7597ab935d 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -24,6 +24,7 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,
 	DRM_FORMAT_NV24,

-- 
2.49.0

