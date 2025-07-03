Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31529B783
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529452; cv=none; b=UNfLa3nNMOwW7Ibf38l71DUDDMoCvxip21QqvVL8VMiIqq3x6uhZw/KfYvzuMO6HDx10mq0cApDVAebNphxQ7J/RHtOtxqmeq2SCes+9/Ew9eh8U0MClC9CANEO2E10zqlzFrqz0cmwy4W4sZP9BvOevgzGo0P/8b9+GB6qyw8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529452; c=relaxed/simple;
	bh=2Jf/qjD85M4WSRxtEpGCluMxSP6BXTGF6SPxegmrRUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRIU+ziyHfH04Bgw3FS3VmvyoZhZ3IAv8iaqM6gtkwz5lE0Alo7q3fA5uE32POyDNR1l9Aa3YDL7q+lOi2lT/qM2ofl/W6bMdqhHyZi6Ud7qpsmZnjcQ9d0H3qvUOs2okcnx4xU4xQ7R/6g0QRAMmX1245pdQJ3XQ/aTE31iRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kqA+ZFRb; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kqA+ZFRb"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4F3E44498;
	Thu,  3 Jul 2025 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751529448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xor3CjGzOLPr9kT51iYNqi58nPlYRydTENN8kwzKB+s=;
	b=kqA+ZFRbFhdl7+v9Fqmdr92KU64nUi2uYmFQ4d5Dm0AUELC/5ZKqC3A6MpCw6gkezT7ZDr
	mBoafnbCkFR7asRx8uCpIr+51fdhu4zPMGyPL9kpJIDNnqRngj87U72dExRulO4Ev6AU0V
	yRAwdHXm81mtYstAzJd6l2UJBL1OeP+WapSAhTwXhKL4r3aKS9jHc04NbXTB8XIme/kT0v
	e3wIw6zO1ma+GVXaZprNyXWzIgdvwNpSd9CKe/BB/UMs5euPh/37QKKSHxRTFpyqGzPLlB
	cDKv8mBxe9/bn9Un7pr9bYF34D+MwDO9ZW5tptbB4wYGRyuw1cy1ATw+wW4K3g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 03 Jul 2025 09:57:01 +0200
Subject: [PATCH v7 5/8] drm/vkms: Add support for RGB888 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-b4-new-color-formats-v7-5-15fd8fd2e15c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2Jf/qjD85M4WSRxtEpGCluMxSP6BXTGF6SPxegmrRUA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoZjfgKKG48v6367zrWTwGsloP2cj80JOQmpQVq
 Dnw875SqYmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaGY34AAKCRAgrS7GWxAs
 4h0KEACCIhqNAH7+RDj0/9EkGBUS6qQUkMr8rWNDStAtmHPVE5jMc2ReNdDTZJyWCOxKj3ecv/2
 MhHIIBngLYJez1gDWAP6U96SgoqPlDfOYmI65TjWZnOom+JZBBh5Rpg/xPEVgRQXNVXlg71aT9m
 g6jIqwaKa9X3v5wh0jtDjhC52kHFUghaqBtD8lnbAmXWA9hFs3nPCkVkj4gn6+nLlSvy6yxlQKA
 SQfllCiBFTUbrPku1UxsuS0CujxmfSPIpKCEe0KwchIMBDkkdySmYU+ESj3XO8/cIDpsC08oXfn
 PiNTVYcHHkoaLwOQcKQKNmdohWXQnM7Buy8x0/LcHUp/R9HydDpOWIt48odsHUmkpAJUgUOUvoi
 w10gj0ziSUpF+JAsjt/ERKcNlo8ZtLWiG1paTNpnymUlcdLWK5u7ZskwU0S2OYzdO4EaK+hLdN/
 599HQDcU51VNJGeFYTZ0h0zE1DUUP+9J8eo4SE2wfkTZxaVc/DEPCxljGwtw67HTP3BuaSi4QwF
 atS7Jhoq40PzhgGzTnXYg9jbGNKD8xk+/v3EYAwcn7B/HRaU6tKKzCaW6CujCbcVU5Vi42Hyn5j
 KkvF2HfsnCMs0HuZk7/PpmFyaQ4VD4+zvlqf3IBAVmpUBXXbv3fhgWSFG88xRLa1ozCS1Lf4Jo0
 aKXg8Dzu5wqshRA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeiudehtddtgfethfduudefffduteekgeevueetudevheehieevtddttdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtp
 hhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

Add the support for:
- RGB888
- BGR888

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 +++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 544bb6795805..f1649d9bf430 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -455,6 +455,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
+READ_LINE_ARGB8888(RGB888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(BGR888_read_line, px, 0xFF, px[0], px[1], px[2])
+
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
@@ -676,6 +679,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XRGB8888_read_line;
 	case DRM_FORMAT_XBGR8888:
 		return &XBGR8888_read_line;
+	case DRM_FORMAT_RGB888:
+		return &RGB888_read_line;
+	case DRM_FORMAT_BGR888:
+		return &BGR888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_ABGR16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 6e7597ab935d..9f34f3a18d8c 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -19,6 +19,8 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_RGBA8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_XBGR16161616,
 	DRM_FORMAT_ARGB16161616,

-- 
2.49.0

