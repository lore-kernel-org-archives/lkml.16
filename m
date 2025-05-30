Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951D022CBD8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613977; cv=none; b=KFPdyId7LKjVtA6uPA8+62nmHXo0i00g6vBfjN81i9QB9njWEfUKqHDexXZ2FidrRiPLR2o8JlrwPV9ih9S636DIFqIfVC/cSGdDYqCzpvt8R8S4245b7Eq4OPNAa9C1XJIELtzgAaymTjBEI92WaHEH7MoGgrVxtpRfnHP0BAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613977; c=relaxed/simple;
	bh=jtHmoiwTPmZuIL2jSvu3AJXloTGW3+2UlSnZwUtxIBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMLMUgp+csn3qVSold3oZ0aImAYqUsG0DChCiq4EXQs1rmOSaVazLuWwnRTGqovBpWLMgctxovYARmRReJCsXIdsXgXiU1/yzv2VdGk4ZOdyeDymqATE1yQRpn2XBhVtzClzW/NK0ST38FKWZFu2kO8H0bOPPj9fgrSXJc5JV6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SbfzqzxW; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SbfzqzxW"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A476439FA;
	Fri, 30 May 2025 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748613973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6lqui55pZ9AYWwkfwRGPE8/7IKSp8N27CxFxg1YheTA=;
	b=SbfzqzxWLzZnSG+wT+J/qvXyE32PiLx6DsAyVxbRBry6uULwkKavBpeB3PIZWQS8AUqJ/Q
	SZevyKnlwgfPxVFO+Imxq8yKBg6mYPSWd0Tl4jWCo3Whaeja+1FYRPGJxHTojSVJljBdnQ
	f/k/TJdzyp3yMYPch2SpJz6vQhtK4+Tyt/BwHof05fnRFCk0CyVpFgWa7aDTI21t/MBfwv
	0h2wWGtz9xMsPYLaH0nMD+9FLB8Mso2QhCBq2f6O0j5564XOUPWEpVnAJEiT/Lnt31hwnJ
	hFjxWtB/IZZO1dVqCaZY2lBs/RUAFEIaRA3nO7bB1t/8aRUbZ285dpoPwsxtnQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 30 May 2025 16:06:03 +0200
Subject: [PATCH v4 8/8] drm/vkms: Add P01* formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-b4-new-color-formats-v4-8-ef5f9f48376c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jtHmoiwTPmZuIL2jSvu3AJXloTGW3+2UlSnZwUtxIBs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoObtLiqjIf9jWTnS5g1JXbzYnKyVHdddAbF//c
 xh8g2iobAyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaDm7SwAKCRAgrS7GWxAs
 4l+LEACu+f0bLR+geM3D4YEJKbcIPCAg9g1yzMIn+FISAR9SO7N2oKEu13dGnq53+dnW5Q6veKZ
 c/xouwQYG6AZCCjMpZveFIXx2IJjU1DEto0vWoaITouHBbvtYEyoO9urzZtsMAS2+t+KaN8DxFf
 EcuIRNFJzEIBh26XDE+VAz9c9i4U93FVcm8TKvmn8l46DkXLrE1uR3bWwFGTSFbnRXpQEht4DEN
 LTpFB+cxijEls9yxjFLI4w/12gGAwMDODmOheiAxt2Gjiqr1xv19x7QIZPMbHmtPLjgwCAsoEQi
 CRE5kMc8xf4fwRG6QN6GpEGSecoDEy1xTO5pzQuacrXILY80Uaqhvbs8j7DtaZ5Hr09DZlbBrbj
 yvPCpKSgmTJwuWbdoL/vaw4F0byU/i/oGafuhoYHMF5wCOd/UzK+3A/lGJTefZ2pqG8oHVZ9YJX
 7E2j3yCOLAnTkPt51r+9jhBgk/mvcS3sH4I6wwQmV4a98Yoeqk/p8ZIIrXY33SxDVT0VA7DDt+T
 vnrObdV4AC/0ltpNMB5IpL285TxeuvNM04Oiw+fmHvsHkL+3plnPyC2ZpSAsoMRsgqqMcH8puVa
 ioGjqCCalltNnZeoRanc/A4ZUyzsWBumHIXOBxUzbrHiu73LdxDSIto5Izb8Il2qwcqPP/c3v12
 8QFe5d7qM1rwEaw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvledvtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopegludelvddrudeikedruddrvdejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmp
 dhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

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
index 8ecd75d063f4..171ef4d8f19d 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -534,7 +534,8 @@ static void function_name(const struct vkms_plane_state *plane, int x_start,			\
 
 READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
 			 y[0] * 257, uv[0] * 257, uv[1] * 257)
-
+READ_LINE_YUV_SEMIPLANAR(YUV161616_semiplanar_read_line, y, uv, u16, u16, argb_u16_from_yuv161616,
+			 y[0], uv[0], uv[1])
 /*
  * This callback can be used for YUV format where each color component is
  * stored in a different plane (often called planar formats). It will
@@ -735,6 +736,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
index e82b60fcda4b..4ab0fab4dd09 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -41,6 +41,9 @@ static const u32 vkms_formats[] = {
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

