Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FBE288CA3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626080; cv=none; b=Epui7C1jPJV0cSw+oUzLVuQmWS3HlzvLyOwiSA3ZJ0E5AYg17BvbLQHOqCB7Ch1yJ/7+WN48tak+hhrKAjppmGEjdirhHdfR1qs5IszeF66E5yCjL0sNtyu2em575iFKdgYxLOZYn288Y9HzlYa41TWURqx6WuUJRVKKY0+J808=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626080; c=relaxed/simple;
	bh=3ry3WfELp6x+Ml/xiDZ3Opjz8TMA3602TsfP6XlWpJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVMQr4TWZA0KKQ4wgTksxbBgVmZ3VEHo5jbtPVvQgY+UPbUFwjs/Cyd/xdpmuzDjrqv0xyz5XruluaOc6/t0zL2pVIWHClBzZnUFBJU+MIWbRJE08sLGoLX+SW9weJVw35Y4+TiAgNnEbRAUyAai5KfpsD0ajvD0KylzVv/D/RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ufdocidr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ufdocidr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-441ab63a415so70044005e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626076; x=1747230876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NPtwIJHLj3TQvXijdYLwA2OCGkSxKtnzx80mLMYtA0=;
        b=UfdocidrIhM7VaO/J3EFLoBkvulaI2GC1bYFHYZn3D3CqHkTBtBG1pxUAxBY7LJxUC
         IwHpaiizTtXBKV5GC+laivqXJ0cA2WdLLuA36YkYEOGnNvBFLSaWOQbm3wDFTQTEG37+
         CWvBpkE6TdQmqcVjbtzMPBXQdz72zx4PXGDxTa52Vz4aWJdYh7J6FrhGpDepZsRvDs7O
         wEBsRXemAKkTIY+umb25QtUo7Mz9Qi1KPNjjt/V2ihsy5XZHuSGzTQ0zRQqukmWZSdOh
         fuOejw5TVXSKBoXpNjxUbtBB6RffO7o8V/t3Jxb+RtV3GQpzirhDrFzUkok2E5GDuN/x
         Q/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626076; x=1747230876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NPtwIJHLj3TQvXijdYLwA2OCGkSxKtnzx80mLMYtA0=;
        b=aoSl71xrmmqPPvMViOHNMCY8j/tEXf5UnDEXioduR9PE4Yr7eDeDzBL/kTgTefJ4hm
         yHU07sMQVymPaa6gBa7KBQnnn+Gbd+na/gH4mVd1RBhuvomlGR8ApZYE8FrXCRSsNfKn
         4/t3DKvKmIlL4V8u0Xq5Nq5ELaQNColXOw6YTgWN4nHKHLg0dH9JdRBDyqMd/2iNVj64
         CBqet9FWliYZV22pO4TuB8ta2dPAruaiccpjjxBScGoWPw4eUhZZRiH7xH3rzhdMs3y0
         BQoXbYyjpUt895xikYBOoxGaKd0nsQG5KW1ztJ0XKve6IndHjcBqmkL0sYuneWQeV2fM
         ArBA==
X-Forwarded-Encrypted: i=1; AJvYcCVgM5oTgvGy8T4yjmj5pWBLtT4Yp9p+PDueDcE3T+ZCfzFOsYGeqCkXUjtn7Rm9aRLMpnDSlty3Zg39Rcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwDp9C0AANk9qaDXFJSGHkrDjRrj/h2yDIR2vOF20ZuOcqrYMS
	xqFgtLYSVXXZSNtXEwbEVbe/QQ3M1kpe/xyQ9Jc4dx+sDeokNVBF
X-Gm-Gg: ASbGncs8gTpLQ33vEps0E9lvCXHrdEouJKU/uZd3OjPbk/foUufeLlXHjpBQfdk94wn
	sJ7Z0o1wubKYZy9cTTTz3AF665WQNb1LoPp9FPNc4nyly20f0dz5diR+cZBAXvQRJ18UNPM1nFF
	jKotK8Njb4a/4yaFkpLymCABiQFdjpQTQbjG+0aMKVA1bRVK1zifZP7Mt4wxLvd+TzG1wQOBmE6
	7gFhmWyUVCnLDPLpJdF8QKHFq/YTwwW02iu73fwxfB2CdAeQTYdg+eFvKb6dnhgiTcqASNLM6o/
	BnOuSd94PNGXiLiYjBMIwcT5BlbKVfo5iQSImuAnbw==
X-Google-Smtp-Source: AGHT+IEfmPBJDkQT4D/MvLcBOELc+mm/2hp0Cx6VyNjVr+QGxE66AppcyN93pmqNQP3ScgoUD3Mr7w==
X-Received: by 2002:a05:600c:8289:b0:441:b00d:e9d1 with SMTP id 5b1f17b1804b1-441d44bbf50mr33147135e9.2.1746626076352;
        Wed, 07 May 2025 06:54:36 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 01/16] drm/vkms: Expose device creation and destruction
Date: Wed,  7 May 2025 15:54:16 +0200
Message-ID: <20250507135431.53907-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for configfs support, expose vkms_create() and
vkms_destroy().

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a24d1655f7b8..23817c7b997e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -146,7 +146,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct platform_device *pdev;
@@ -229,7 +229,7 @@ static int __init vkms_init(void)
 	return 0;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a74a7fc3a056..2ad8e3da3b7b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -223,6 +223,26 @@ struct vkms_device {
 #define to_vkms_plane_state(target)\
 	container_of(target, struct vkms_plane_state, base.base)
 
+/**
+ * vkms_create() - Create a device from a configuration
+ * @config: Config used to configure the new device
+ *
+ * A pointer to the created vkms_device is stored in @config
+ *
+ * Returns:
+ * 0 on success or an error.
+ */
+int vkms_create(struct vkms_config *config);
+
+/**
+ * vkms_destroy() - Destroy a device
+ * @config: Config from which the device was created
+ *
+ * The device is completely removed, but the @config is not freed. It can be
+ * reused or destroyed with vkms_config_destroy().
+ */
+void vkms_destroy(struct vkms_config *config);
+
 /**
  * vkms_crtc_init() - Initialize a CRTC for VKMS
  * @dev: DRM device associated with the VKMS buffer
-- 
2.49.0

