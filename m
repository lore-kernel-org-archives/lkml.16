Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720E4299AB5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015581; cv=none; b=rC8O+rS7Rodiy3A/lXLjsAeloaLb4HD8yFEBQpZWBgG6eUbaF6HHscx9e1w/8QLVsE8m4QrmDNLq+RKTZ3IBNZoTbtkNKF0dktImODvXg444KEhE3I5vY8+O5BFp8jEF4BPPKJEHf0pp8XJ9FyGcIapfv753aFZkFCUGXreVlZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015581; c=relaxed/simple;
	bh=QiFonQJxOo/bY8I4l1uZqGA1dfJimNI0BRwu51L77sY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVc9fs0P7DxnKIb178A5dDLpHF0tytAOGMByIhxFM+Wwk1LOUa+yMlr1bnnf6b9Wr+pg0tz4kR15J+T+YtR3XVdc7BMbcowR8VdSkxjKNs9MV8D/sNByRSQ1Z1X+/crEnvj7CPKRIlwmZz0xaDY7vSWznEj8ZTHNIJVFf+j27nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jgOZsmYN; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jgOZsmYN"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1FD8438CA;
	Fri, 27 Jun 2025 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QLPLv18xzapWnsWKvbOSYbL5/1PSNGa2oiksuVxBiWQ=;
	b=jgOZsmYN9wE0bv05ZB95RFLGnVvDK4Th3jT8To9s296CffHs/YBqfqos4BeLp6V6JkiGJW
	OOYefHzfvZ/LhYHPS5UvgBqb2NsNG4eE867Ad1919CrdABrlrGzXnVGHz9BwSWpADokwUq
	lkgmZ0zcmqC0Kn9g//lChZxf9GpUEwPKC2BTj/4aTQo3HS2CgeapNQCvKDtb65y8t0WD4C
	5QZIA6m3R0Y0i6NM2OpTpQe6U82Skm09eKSe71lDnj/z/AY5LazuOI9jSPP3O7qKW64Q5e
	v0Ys+hpiMqs3uwS3e+bktgNg3f8Xuv7XDCYkda6E6Ww+OSB23nPi5Tm0tZ/EMw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 27 Jun 2025 11:12:39 +0200
Subject: [PATCH v5 8/8] drm/vkms: Add P01* formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-b4-new-color-formats-v5-8-94452f119c72@bootlin.com>
References: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QiFonQJxOo/bY8I4l1uZqGA1dfJimNI0BRwu51L77sY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXmCO4AsbQgnO0+C5ntekkA+T0tNHKys9CbiCi
 3sHI+W4O0mJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF5gjgAKCRAgrS7GWxAs
 4j4/EACJ1Lg6duJHRyc7JjcwUU2CB9xxf73FJ54bMV7SpE4NyG4NFDPQJr2vVKCHMxzGqunhdnw
 7ckd8g3Pl2jVMK/gvgG0von7zHdj39O5/TZ7ZXw41YTnmNKCUQ+FoxjLH2oZYgf5iLf+ntngpdF
 GrTmpoi11Be2FC7SV49S22HuY31rnzavpisdzeZ18IQuIsVmD194mf9zqGdC7xEXDEpIDVcpSiB
 VYZ3DJ84/0/363ZETV1UzVj2LRdaWwpfs7BV4tQ66+Gnn1Heb3fK4FpGkW3yFtimZ42gU5ijdA7
 FeGWpey3KckrGts7l5gpUkYxne5hTTC3d/VnS5WV9+anjoymI5zanvR86b78GJQquhAa3vlk468
 02BZcQrgyBHJTcxnsU+Tnfh2IOTcIYpQqzzCIth/0GNvkz0LygM6oX9bGsQS0izub23oef26ZCV
 9NACSlp2rrP8MDh8KQY7APxIAYSaMeSy3sW1oO7nmNi3S9JIOz0MeUWSmdzBirjcmy+NTUqVID4
 5hZ4C3xM+jzt7JV3skHyVxDXMDtDfZrFDfFwd46wT7kd4msiZukzhNz0XrPNILrWuPCMQ9D5ws8
 8+66Pn+j6RillADKM5CoQtoSYAhG7yPIjh4wALKizdnpjwYWhSfi+mimlAlQ6W/QqQqslXDXVWZ
 O+DG4uCv2/qfwUw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepshhiqhhuvghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtt
 hhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm

The formats NV 12/16/24/21/61/42 were already supported.
Add support for:
- P010
- P012
- P016

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 ++++++-
 drivers/gpu/drm/vkms/vkms_plane.c   | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index b18d67436e1d..e540218fdcad 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -522,7 +522,8 @@ static void function_name(const struct vkms_plane_state *plane, int x_start,			\
 
 READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
 			 y[0] * 257, uv[0] * 257, uv[1] * 257)
-
+READ_LINE_YUV_SEMIPLANAR(YUV161616_semiplanar_read_line, y, uv, u16, u16, argb_u16_from_yuv161616,
+			 y[0], uv[0], uv[1])
 /*
  * This callback can be used for YUV format where each color component is
  * stored in a different plane (often called planar formats). It will
@@ -719,6 +720,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_NV42:
 		return &YUV888_semiplanar_read_line;
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
+		return &YUV161616_semiplanar_read_line;
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
 	case DRM_FORMAT_YUV444:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 9f34f3a18d8c..e592e47a5736 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -39,6 +39,9 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
 	DRM_FORMAT_YVU444,
+	DRM_FORMAT_P010,
+	DRM_FORMAT_P012,
+	DRM_FORMAT_P016,
 	DRM_FORMAT_R1,
 	DRM_FORMAT_R2,
 	DRM_FORMAT_R4,

-- 
2.49.0

