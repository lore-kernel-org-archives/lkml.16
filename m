Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE1E212B14
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013678; cv=none; b=g0A7zwyxiZFv+jquLOY7BjNA4Q40+35shjtfFb4OUOage1a6WXd/Bhyxtr7UUjwkbEROLDIghldfAS1Q07VsdO12l2iSV+7uqf+lGlYBSc/XGTPPGnK8H+OjKokpYgSVGz4OBaNzgTs7hHx0b7MMTGQ37YlQN2pBDxc6TlZNBnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013678; c=relaxed/simple;
	bh=x8q2LQoaUnOBaiP5jsGvS/C96mTK7nmUfaD9bWRUJsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b01dsiH/QzuTtKuv0WUFNhh32YIx7oC7s6Sda3gbs0wFy1NHIEqV5UMewJUikarfGOtCK8LSWi2Ux7gzQyY+8Gs4nBDoWeMu/K+RACv8mgJ6HZEAU/Hx0kCO+nUfTb8oJBb00UrFQDBzyqA0FhPKG8zYNuVpOn9VRZN92Aa35iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqNSnhvK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqNSnhvK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf848528aso33323155e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013675; x=1744618475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDEi+IB29m5kaXCQs1Xh/NAR1EeJ74QIHesF2OX+9WQ=;
        b=JqNSnhvK3QkugWOS2kJ7RfBf40ujnAG44hA0+qnUiEQp/nDlzolQudHmHzHTsq8f4S
         uSaf+4SMHMVqV5pvA/ceLKFj6Ta56HFTCm354j+7vG142zevteiYc//n4Wp/PmODmRdu
         rEzD69PtNcQxM7lPtkVduUn5iUNR/BWRXCS2wTSg360e7mRpZSxokY9f9GM+h8481v3m
         KN5IPD2IMCH3zUkUYpJ2PePM43uguk7fQQTOjgTCdgLrUTOagImGNc5lMedGhJRiPB3f
         cdutp0+z7kl7T6v/9wNSDsb/NkF55O6zqFsgsJfduhD9ISh8yu2FNx/cEPrhL3LKdO15
         chYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013675; x=1744618475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDEi+IB29m5kaXCQs1Xh/NAR1EeJ74QIHesF2OX+9WQ=;
        b=lynVoV2XKemqAJh6dN5w8btN4kUyZBZO43AkyVV4aEyxeiD5QqNcrlbr4jvCLiCiDA
         ogSnjbZF12KwdAIJDEn4LE7GA8OwrnK2f9hd8QiyGY7QKnnNmHpsBDQyVjnQLcrVW8s9
         fnKgullfy83XuuVSvy7aTAgTXxKiCk9/I/bS1HJG9yI63fvyPrn68vbXbUWj1bFFtwli
         yh1Gab/N9/FMBKWBo7pc5YuvGNsobqX4UwNv/q8dWoCdCdeJsJUhtpy512J+v9Zei1XC
         2FvR9WHX50ZZlVtof9x4jsAsNyZ4g9YZlIjiFwQ61EgEdWBrQxJ3XgyRalr5kt6uU1zh
         Fh9w==
X-Forwarded-Encrypted: i=1; AJvYcCUiPVusZaNNhoH41eK6kCTs+fUmfmQ3NPUXPzuAubuKTgVZaL6TiwbYv7uFxYvRjJxkpLRWO02x2x+FrHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfZHMV3UgF3Sm2OJU0dfCSBT4b22sLcs+sOJuyc5+KIR3sNxPv
	qpBTLrfUHtjcXhGR8ZHZrS2LcZbJPd2lGyP67aEVbsGFYa7O9MNI
X-Gm-Gg: ASbGncsNbEGtfyIdltP4fVkS/QRn/KHIUjGJmhHUQbNRcidM+QfpcDh57cg6FHgR//8
	vN70i+cnzRAOLLNtXIFPOK5LANrW6jWVMefbvWRCmdOd0QNTiTMk0R4OQpDOcNVmf+55DqLEIBS
	wHbGbS9i6cH+8L8zlJOhnFdHhi/PgETehb7qpjReA0rnr0s7ppaHBGZH5QMlHbSNXgIOuW2zYbs
	5U8lgqkHCTTM9EqmNl81Sbr29IZzOP4nDRg08BdruF4qyCLKhdp0Yubav/QijSCLpfB+/md7k9Z
	FqJzb3//cmEQZgVujqKvEEESRd/6UkfIar+KMbWS4gsm
X-Google-Smtp-Source: AGHT+IHeQ6PKxLtWFAt3ZSnE3B1E9Vr4aedKoSG77fVWdG9+AIu5tdZ3hunUv2hLHfA45hJMDk73dw==
X-Received: by 2002:a05:600c:548d:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-43ee0640f37mr71172575e9.13.1744013675032;
        Mon, 07 Apr 2025 01:14:35 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:34 -0700 (PDT)
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
Subject: [PATCH v4 01/16] drm/vkms: Expose device creation and destruction
Date: Mon,  7 Apr 2025 10:14:10 +0200
Message-ID: <20250407081425.6420-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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
2.48.1

