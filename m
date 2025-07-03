Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728A2299A85
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529454; cv=none; b=G7fEu7l9JDETcIMOZ8l5BQYi8RMqhH3/Mx9M/q24OD/qKVD90NgsRePeLq+5uTdRRHBaRTNTtc47U+qQwNLAnnJneHT+gzPFHjeftAlYqU9Gfkr7oNtCcR5QyyhZcnh0ldjbvm40KYXGrgjmQL7qlSUGr914sQQUTKUKwEV68Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529454; c=relaxed/simple;
	bh=42H3WCbIUPVqNcXYaCmH0LfI1AJz/I3qKmRbMLEC9CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTMnpPWNKiBcImdAqCWve1nwN6n+D8uxdHmF4GvShm7FO4Cye8RK+mm8kMnJ1d0mAwyVHCQrv8LZxLaGkzXy2AeCWeH/3paopfpDgIJKl3ttTJ/QgbK2U2Hbp7f0rAVMzav2YmfTy77babB7K0+oDNPGFbnwvdMTPfIZyUogS+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iGUyfV/n; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iGUyfV/n"
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB4EC44470;
	Thu,  3 Jul 2025 07:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751529445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YC72D6jmas7HbuDoo2dtheGUQpMnyB3xcANLswY5f98=;
	b=iGUyfV/nsUxta62JtWshRLK5RdZz58lkBAhpMNU/bCAgPg4Zu+DOrxLCxBCARBmN+jDKzk
	SKs++PckSIkuHqWMtgxc+Uq9oqWynip6KsUoEUuA9/9fi39VUou6ZCllQTKZBoVOB/h7Yb
	3hsiD1sN8jD8frsk+Xjr1N1QRn/MEiXSHWDNq0aHU978IXmHWGtODFBnoYfVIxR/U1H4ks
	j47Dh6c/RymEIDS+pe+WFLa5soZOScMok6/r3am7lXB5BTghXkX9q2pWqFPzQZNmgR6UaF
	ctXuXDp7AIih2/b7R9OFjy/yk+SI0aYAZMPPqK/guevRR19+HGXojvJAUbViHQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 03 Jul 2025 09:56:58 +0200
Subject: [PATCH v7 2/8] drm/vkms: Add support for ARGB8888 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-b4-new-color-formats-v7-2-15fd8fd2e15c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=42H3WCbIUPVqNcXYaCmH0LfI1AJz/I3qKmRbMLEC9CA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoZjffekWgOst9vJqF478qmegCye2fa0yJNJ11B
 62v0/j4vHSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaGY33wAKCRAgrS7GWxAs
 4km+D/9kcHtS52jaPCalLxl8GAEp1aNMOLHyDLC98nbWHBe9LOqFtYNse74fprDT9dAn2KDA2hG
 42iWMBxqPPHv2FM0THPhQ/AuZWVe5XOTiHTd7hoEyS9Hh0xhkka5jzvcr0TdyepGzrAkHoLwQq3
 k2kdbieLPfcpfWOsGkaQpDkP++bZJcYijx7DApuTyxgHItKmXV9wHfFDNd4vMwf4L5l1lKxS6vq
 Mb1+g85ELUropPHCffuN2LyO721ua4dzh6vUes84T1cahLdoxFhK8ynIipcnig4lTYHqHAgdHgh
 nrKridfN53duIcGkQK4LsG71lQuNNy2Rrve0nlbkkDnNa8/GhWQdU0lVqIb6Oq15hZ3HEkLG+cY
 PvhEI4FnPbBFua+MRxwBG8xyeHx/5JkdXU45nt8pSNJfjUP+lyem5IbA4NT4BbOzHgefQWzv9rZ
 ck6mS68clMhXcoZG4OX8ZelEeEmJxRZneT5XRs4MXe1SeZO78EB+33/+zYLeLQRgYL9seDWVBFI
 1ylcnZ8yYbZRZalJVhRMKf8mHF/2GWp2vf+7vVpnDFYRtKYPZnlmAb1JrAWiC0eR8yYgH4Nurog
 IqhAVlDIY4BsxWQR9ok8owMtYMVN6rnLC8IWcpkORfXtWqXPHHuS3CL6rhc+N28FDMw052Pn41s
 GygNH0yvtj4MCKA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeiudehtddtgfethfduudefffduteekgeevueetudevheehieevtddttdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtp
 hhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

The formats XRGB8888 and ARGB8888 were already supported. Add the
support for:
- XBGR8888
- ABGR8888
- RGBA8888
- BGRA8888

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 13 +++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c   |  5 ++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 07b13481378b..b11cb2955943 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -438,9 +438,12 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
 
 
 READ_LINE_ARGB8888(XRGB8888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(XBGR8888_read_line, px, 0xFF, px[0], px[1], px[2])
 
 READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
@@ -650,10 +653,16 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e3fdd161d0f0..01fed722808b 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -14,8 +14,11 @@
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565,

-- 
2.49.0

