Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F79299957
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015578; cv=none; b=rjENYi/IyIMjRv1LnlkpNqqm3vG3QgDXlp4BrNiTZhesc1d+4ZPRVLuwdNiR2yrP4Xmuw4GbpIMh1mLq6jGsgFQGQ2SHEhUeAKh3O0mxrY0C3nKy+h/255dv09k4eHZcEHwQe/yrOM5jcA6L1KXN0QKr/UwE+UcIyhAPYPGbql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015578; c=relaxed/simple;
	bh=QFgxyFHAJEf2laxUq9BXmSxgh7oBLS7xSxpQoHg3nhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=do5Q3VOK02ks7KLlLdE9olWvcA+m5ng41pcnirtdaZVaJSQUDtWJMEhMjAIeiTVHaEhVbqP5eavPJnw82rmxkT3nmbKmnm7zGncHFUu067tx8sg4qb8s1QHmvcWjR89iURzIs9ia+vIeQWdrUWD1JKAXSBNEQqUkUyTHrmL+ZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ekVeFaP/; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ekVeFaP/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B16654395D;
	Fri, 27 Jun 2025 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YQ8d/WjZleZAjhhPje5wk6/z6NUbO/uvPr/KAPPpwLk=;
	b=ekVeFaP/27NfYOsVSqLh1kGPFQN8h5JowJEjTZiEAjc3s0Sb85hC1BIqOW/gb02/RBVggX
	owKy2pNXRZ9ygfz3HU+v5LEZW/ZerFdVMVD5O42iq7lXdDkcdxqEReZWRIo1TlDT2iDcyg
	yj4kPHDHbTspW1eU/pT202mxabVaXHIvQKe3Sk7ukoDHZzL2Cna6E6o1ON3ShQaIshJ865
	ts4uve460b+SNtWGuXgONj2T+9fld5BpdyzMS0xgdB14hiejtTzwPNepSFFowu/lLT6BWN
	2Bv6IpDECk4j3zDVrxEdqbP7rF/GWsmU7wi06OrgjisEC4BVH8aB4TDWZKmj5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 27 Jun 2025 11:12:36 +0200
Subject: [PATCH v5 5/8] drm/vkms: Add support for RGB888 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-b4-new-color-formats-v5-5-94452f119c72@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QFgxyFHAJEf2laxUq9BXmSxgh7oBLS7xSxpQoHg3nhI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXmCNrE8LTStOIfN73gnB68k0X7H9lUnyqLiX2
 n+TirrSdqWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF5gjQAKCRAgrS7GWxAs
 4qNKD/9d7X0Laq422DloJZQEcw7Nwxph8vOUWpdJNTkazqpzbMRLGGn/nltXKm6Js47C1nqmDsD
 Wur2sHjjgv9b2ZEbfaJhCOmPXpYju2J2wR4m5pb4U9YlCf6T6s5pxQ3NNtzVwr9Nn3UbJFdEfSQ
 kpEqXId4iYfS09TDObk0E4jgZDpjC+3NK39NLKoDlqFJiuk+duD0PeELGP9KrCDcw/l1jq7g6Ov
 IFBMQRukRBNgPY6W9tIvl/dFAC7+wa/+KLZ3rGUiiJJM9Ayplaa5FWgG2YYGT706bhGrqHTYwCF
 QCOGlHICwTt1lkKJGhZ0AWPcg51EXIxCtrhQ8scgm1oPqp9KIQgDIJ/bV591+px+vzzgSbPVs5l
 p14yUOMh4edKOcoADaNOSPW5zsLJEtxa7lNiQP8YASvH35m6gb7s3HVtaP3qyw1RSeBPKrmFt9V
 MGVhAD5gsAfUu2JQba9t9URklPxD5JPmgOgcuRouHNqhSj0czs56B/9gb5p0Ljj2GArcI91We9q
 nM5Lif/sor0Y8w7y990Woxgi65A5fMNlvDkI/aieB34jgvJwZbX2aAVvDlLHJrKXrTSOP1fQ+G3
 M4IYRz5LUsvdgPVxKtt6CjHA3RUZil4OTl0DUt0qVFf/jAoORxVmnvUuscqLU70RRNSzwkZ0k2I
 lbvRlMAGxi/4xPQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepshhiqhhuvghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtt
 hhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm

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
index c4c623472e04..5b50e8622521 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -449,6 +449,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
+READ_LINE_ARGB8888(RGB888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(BGR888_read_line, px, 0xFF, px[0], px[1], px[2])
+
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
@@ -670,6 +673,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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

