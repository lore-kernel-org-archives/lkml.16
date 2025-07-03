Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2082429CB48
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529454; cv=none; b=dvK8yU7J3wRVJNfPOOxvFLHCmc1CnKdF9yNKey5e+1N/DOjzsfgX0XweANXBpp+1+w2P3+ktNnpJNqqTq14TKxEcdg+7/3Wf1rzE2WqYvN2/B5IyIiBEx6s6bjftrxtHW3vWRtT8okiwooQ63V5CDdx3iULggbODvGuNomld4Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529454; c=relaxed/simple;
	bh=uQQHQYQIw4RBCW8Vz94HnWCi8QMQdtxZuBnFdJ9YykE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQGh8fD+O4dmt0MJXNO4RxF0GMpjuEiQAA0UfUp2u8u3sP4P6myL/O2DP4St4c0kDP1jCMjmklQT+Jjd6eGyKe443+LVHrbMlGGYwM9JnJs+Xv42MgjcaNE4KfCPQGPbEYRg4EHpHx65ug0T9F7YqvnhCppyHfdjhNn5xAvUQWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T89C8O6X; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T89C8O6X"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95B4144475;
	Thu,  3 Jul 2025 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751529451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vQA45G32qMp9GLNf8KAtKTtoKGWXKQZw0z0jKrghQ0=;
	b=T89C8O6X5Dh0tJCvHg8ZXvT7N0G6bvxh9xFPZgOh0rA08EVWzS/lF0URpfxLWJOsrahZ0n
	t6mrJXsUCQtZmUra28M0EmMIRSAKEg9BBSI+rBbWluCyNjon0BMYH9oL4fwQUkMlKHralg
	7DKQPlYGw4Y436vHqRF0m+BJplOuu1pjmp0coqNXGdHAiSA9rfSukcrJxyCUx9zmLfAU7P
	pkisBU96aEJDdy1wh1Y5EUT+AaDgz0YvdjDHTyLH0KoTObAdIYf6Ta+RL5pE0cVERvMUFw
	vp0lPQdzQdi8yznArEPHflbGz3LgLKTtflzaIw/CFdIgj51XOF38s/tFV53JwQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 03 Jul 2025 09:57:04 +0200
Subject: [PATCH v7 8/8] drm/vkms: Add P01* formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-b4-new-color-formats-v7-8-15fd8fd2e15c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=uQQHQYQIw4RBCW8Vz94HnWCi8QMQdtxZuBnFdJ9YykE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoZjfhEhvNHyvro+IbgXwjjFAE1jhw7tyg9GgXl
 X++oCrFRjiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaGY34QAKCRAgrS7GWxAs
 4lLvEADIcoG1wEQJH1/wjswnyMbxpsFo/hyuC3ml4ZpvrFnNsPp5NgkbUSqhbTa5G9rf4Y6uN1O
 puvavazQr8UU5IKJ+pnqWQ/OBfrR2E/g52MxMa0CnL7IRx+NcaBTr2amQ3ktakar9WVcbURnNVa
 4Q+sdIoE9ilDt2bp3mVbtuGaoDRkIhbXRifN5e7bp9DXXCLqtqCzD4DP/UwlGLFx3j5JjC8kA+E
 nB0JRE0obLVVHxTYuUij+sWnQmqIIkP4LrEvZ5g4/kMGFgo+keBx+BmVXBlRqDgKKDw5B8s6jJV
 kZkxYjoEjFrh/v9+9+BrOY/B/h4KFTcvk046yQCAFbObFH05U331ev7aeEKaUIE33mxGHoE1/Rh
 FNTBHcqg3ISZQFpcy23ZjamcF/KsSQHsdhU8FGYuGaX63n62wUhvX3VU6ppAYRs0ORiLtmIlrXR
 Bd/rzm4EuVY0OP2Mb0Vf/RT25r+ZrONB1j6OYgLj/E0VgcDHizAvc3gdyyQzxVJZrhar+F9VGHJ
 3oNa1G88rYi0LdPSjfUNE4d15Evmk8lp4hvnS0DM7tjkKS+SqzlhVwsHv252cW4W9AJh3O1ETwz
 H1S67/s5L1nqhn/bdFo8HBJyiTi0GfinXkz+5EWUYrhoPo7HpwP/NxNEwMsMImSWdKjp5HgzyYZ
 pYNQyOqEk6Xnsow==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeiudehtddtgfethfduudefffduteekgeevueetudevheehieevtddttdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtp
 hhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com

The formats NV 12/16/24/21/61/42 were already supported.
Add support for:
- P010
- P012
- P016

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 ++++++-
 drivers/gpu/drm/vkms/vkms_plane.c   | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 639b1c7ca43e..dfb8e13cba87 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -528,7 +528,8 @@ static void function_name(const struct vkms_plane_state *plane, int x_start,			\
 
 READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
 			 y[0] * 257, uv[0] * 257, uv[1] * 257)
-
+READ_LINE_YUV_SEMIPLANAR(YUV161616_semiplanar_read_line, y, uv, u16, u16, argb_u16_from_yuv161616,
+			 y[0], uv[0], uv[1])
 /*
  * This callback can be used for YUV format where each color component is
  * stored in a different plane (often called planar formats). It will
@@ -725,6 +726,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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

