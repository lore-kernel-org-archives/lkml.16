Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4031D2163A8;
	Tue,  4 Feb 2025 17:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688801; cv=none; b=EriLdUDpRmW+vmuZ0eJbgPisXhIOcXUNTjCrkV0W/RSUELhuIgrINquPsAu+gd6BaE0+pcm405UhiCgJFriPB+E9/XeFGTY38DIani1ZFMqTkaXAfRgbDBNKzO+lAE+r4mSyZrVGVZLhntKof3sxFf0oaHpVuHOQMY+MiXR9EKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688801; c=relaxed/simple;
	bh=b9ZKvWTMLH2pYM6W6wEY+mfsMMy4RKlJ6gwgcF34UR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/M5d2Bdaxbsw2D9/9iLFM6hagQEd0AkR7fvlwDJ1GySaW0HQZa9XtIWRZDe+sKJKwNlmlMkLlub3ri1bqD2CxB/DjcnCrGTw/jOy+vXbudp+iZ4IRMmdSC+NY98YBULICcVz5T84TcVzBIL0RHOtOV/xL6+v3yQUxBfGB+1cyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AZKc8AXb; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AZKc8AXb"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAD66204B2;
	Tue,  4 Feb 2025 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738688797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPAqPmjbCcHhHjQH2AuZoszEfCmP6ldda6N/C5rtCJM=;
	b=AZKc8AXbLLCoXwXv8gNk+ScmFJNN6Megi5S/KU3kbI9rT2wx2bGvclim0h5I+AB4xE4Zid
	RRNg+uYZ9DhekdxLcv6H9xqWwJI/N2jcoBuFZHPt1GEbzJ2bfZKXrbu+yJh6+8/MCNnI7+
	aM+tV5LeG05QUKf5BuGu7PkSqX24H2XgHzNt9I8i7OX8vl8GbhYeF7lb43vCuLMtuQc9lh
	KBn77k9XT9B5BoNT2rLWRZaQGnMRyvtul89Hj6C9l+WGqbCd/MOBgnkWpnFWkCOz8irWPU
	XLxvHF+IeBrAgZhJUdqqM2OzcTjPh/636eAObWDOaz1vz35xUlIj4TpjvKf2sQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 04 Feb 2025 18:06:15 +0100
Subject: [PATCH v17 4/7] drm: Export symbols to use in tests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-yuv-v17-4-9c623880d0ac@bootlin.com>
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
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=b9ZKvWTMLH2pYM6W6wEY+mfsMMy4RKlJ6gwgcF34UR0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnokkUROSPi6QYkJNcGQyqtdAdIJ4muWPeNmmFv
 3Aig2EhPoOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ6JJFAAKCRAgrS7GWxAs
 4teCEAC/BSG25Nt3Pl+eMe6u0KBf6vvXIi28QeV/jdSUb4BagWe85YURdrYo3UpR28EljTv6q6v
 VskIdYK6tXCq/TwQs9OHxAZ0S8dLueI7C82W9yLl8NGfNzHm3nK2/TU9qD7rCzFeYF20SDwYVJ9
 +T8QCXQOiNYbEWstvOxaeFFV6UtujQuiXCRW4ZWfphaEh7kiDkcQyuIwLXAy7Yih7DyMsdAx2p2
 9LW/K5Iq8WZ7+yj4cicak86x673lfZ3zQfcEvXOLptDw5H0zVjwxEf2M0r8UaC99wp7rbiHZR0i
 /hD+UEcliDx4k9WkIrY5MI/UtwevktJpnv2JwFFsx7ozIKDyY+YQ4NhqnnAJbuLP1Vm2zY3Nis2
 52efL2l/VQjz+ecrNq5IJbk1lmzwY+mMEaFItI5mzWo1VOgFwXCuxQneLhY38sc143AqZFAvALJ
 kQbyMPRvd1Bpv5MzGPmzw5y+JN3Ah/VG/1T14yGHY1n6yEgdgt2JHNle6jIK1v6oWsku50BEuL5
 1KCaMRQpLg/52ZMvgY9kFGyeb8jAzYyxn1TIdnKt+1Eqbp4kp9X3M9kEHqyPaTrZG5D7XqRDUwZ
 ke9CNMtBWBGG5UI8CWxvVd9ZfcgSwHoq4f4UAyVlUXLPvT5TtFNsGYZHPG5yF4NDA479MW+JxIK
 /877zX/D2EfiJPg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeiudehtddtgfethfduudefffduteekgeevueetudevheehieevtddttdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehrohgurhhighhoshhiqhhuvghirhgrmhgvlhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhni
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehpvghkkhgrrdhprggrlhgrnhgvnheshhgrlhhonhhiihhtthihrdhfih
X-GND-Sasl: louis.chauvet@bootlin.com

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..b73a998352d175a26c69e0878da28a6288cfc8b7 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -28,6 +28,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
+#include <kunit/visibility.h>
 
 #include "drm_crtc_internal.h"
 
@@ -494,6 +495,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +511,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.48.1

