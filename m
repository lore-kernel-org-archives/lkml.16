Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5931C215F4A;
	Tue,  4 Feb 2025 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688798; cv=none; b=TS/V1JeYLVaF70mDMG6L1pnHVFGue2Vl2vvUzFHGZQxnjnboyFTxB6bhrAGPoDfp1/JD4SRHnfhRXLkb21kBcO4zaRoPejfxLGU+38K2w8unxKloNdEwo7wmkm+6DQNsQIyc/sMqw+FtK6yIn87UK/pp75GdrLDUq0ZWLBmxocU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688798; c=relaxed/simple;
	bh=jcLUOxaCIEEtYg2dPxsiL+7j0rPiRN14qaxIp15uUZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=urSK3HTLQvlFhEjBDJYnbmyLAyXNyQMsblmlTgeqDlu3uSHd4HAsECa60VEoxOFXLCm2pXuXlE6lBtC8iCsNGnCqK61y1uRbSW1Lzc2hV2IZNSb8659NIkMGf/WVH4wWHQmbDRE9Ug78AxhPe7Mk2Upchml2dDAuukdKz8ouaqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QIYYFCjK; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QIYYFCjK"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37E21204A8;
	Tue,  4 Feb 2025 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738688794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPAmN8GQQ3MtZgAoXDVSu3cICi8Ni2CGeyLrhauwoVM=;
	b=QIYYFCjKamsrM6CKbnVnCsPl0jdQa6wrHMp6ehDiaebiX+Fw6BzQvEg6HDwO8sl8tm0PX4
	DNJMEjgULn/md9YKeMKBLhxeZZhCH1dbK+Ct07kJv8WQqTT0FzarxS7nvyeOtV/FLs34TB
	n9X2j9euaWgioQIuRYa1t8oovPBF0fEMdLyk3rZ4wNEVSknqMEPrVyjJyvwy9G04SZOjTF
	TQAOiRFlYAHVT8xV5koI7OkCtAfzIkfmXUH24RNCx/ivu2hrpHA8u5rKAtZNBQLaIghoV9
	CxjGh40eSzshFACIGZ3X1XfRyJ1dVV71EjExnvzKq1TK1pcBZhthkHQhT/qG/w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 04 Feb 2025 18:06:13 +0100
Subject: [PATCH v17 2/7] drm/vkms: Add range and encoding properties to the
 plane
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-yuv-v17-2-9c623880d0ac@bootlin.com>
References: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
In-Reply-To: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=WF45lruAf6shP6Cj+bTkcTh9rBc26xwl9gRJdORyc3A=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnokkT8ugOJ+OEak38cT+5J/DnMTrnNzHrMGQ93
 PoUK11mdlKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ6JJEwAKCRAgrS7GWxAs
 4h46EAC8rx9XLg+3XdGj/RqENt0ZEUqgCMH6nvqFBeZYHh2MSrb+FGZeBkqmCpFIQCWA+EtvxNk
 f5YprkoylodPRrTofTCdwTbZuucRzPf/x6OYAJRp11jmSaqqX8i2K1WgqAIzN9ocYb29YFTAHPu
 W9oVfadQnOQ+kJfc2TtsT7qVDrtVYGfPou0JKXljemH8kwXCbWWeGScx3LfYZ2kROr8rMbgD1Di
 LHXuBCjPc4Iu9GHdBwQAEdPxfZe6fCuFnPcjVcYI4uwajtySaYBPtpbwZtvSy0MaEU+6SPE9/wQ
 1y8+TC7xpFaRLfW+rFPI8eU6Zo+sVJxl0NqN62Cod7NLG9hlTFlFpVxJol4/GzR42wMcLuSlFtV
 O9j3OOzWJ1fOvgBRotxKfHeXWhhjE7ksclWTnuiV/lAC4rcAAfIiHjI6jMN0QcvILyY4n47TiS7
 0njkOe5Ie+3KBb1yRoaJfuo890PRJPK6qcWESOaMq/E1KXeoj1i65nBz3ISW+zid2xQK+RUR/jl
 pCktOb7eF+F5n+mxkQ/c3tz6KrEDHJQmV4DNpT2jBdp92R/sObBfdHzZmqZGOwPTNK4AQBzCI4d
 E8QdnH90wtRUVcE3APCIajvBiqOso30uBDvtyuXdfUHdJnQiAS+xwSCAa6cxwzMgft+OdzYNMwE
 mpytJ3+jJ+AR+Gg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehrohgurhhighhoshhiqhhuvghirhgrmhgvlhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhni
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehpvghkkhgrrdhprggrlhgrnhgvnhestgholhhlrggsohhrrgdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that the driver internally handles these quantization ranges and YUV
encoding matrices, expose the UAPI for setting them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
[Louis Chauvet: retained only relevant parts, updated the commit message]
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 6388928412f61debd88685679e8ee35072691d69..fbfbe424e558d781759c25a46e3b2b4ab082558c 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -219,5 +219,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
+	drm_plane_create_color_properties(&plane->base,
+					  BIT(DRM_COLOR_YCBCR_BT601) |
+					  BIT(DRM_COLOR_YCBCR_BT709) |
+					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  DRM_COLOR_YCBCR_BT601,
+					  DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return plane;
 }

-- 
2.48.1

