Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DE61F7557
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272170; cv=none; b=k1VU7K3plb9Sclcj2YI8WDDwiOk2opFe/GROQAJcCmiF7IlNodm4t/I8iHD/4mvybnSnJZ61pvrKg7z2JiyevP0Vvv/rTm4gcrqgBjzTj3WmolY8L794JkpuyGDuzg6tunUOOzGStdiGY4GKQmPLNHFd28zf/bBwdXz9Y3+hnqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272170; c=relaxed/simple;
	bh=AjTCUuz+BkUxunMpcoHcHWR0BWaPhpL7TmZBc9bu3GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRmqkhzgnc0ExzZD6x49bl66fVOMVESCsdCCZ9CEthLZ+WGpQyc0/MjalVTWHlLwBHdZyZBoXw1f9SCwoMb0vlkPB93hwqrpnA41veJXnjQoux97W/P9VOs3fIdyVDRkmO54tcUE5H6XOII5yrz0lvhLU0iPPNKx65jaKf3gJC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjaOyEnG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjaOyEnG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dc9f3cc80so1447083f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272167; x=1739876967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pIxRugrT9zIlGotEeERPrS4hzRH4JozFA5lgU8/+aE=;
        b=PjaOyEnGdbzof9haMobn89zHHpJB89mwMpLhrYWeZCafhM9c0atggx3R78QdFVkpRe
         DV7BjLfZH7rZzno9vRZSTHC9OuwGZSovFmk21pM2GpbhYW9MiPV1S0TXCWViv6ILr51G
         DO33z7UaCZO7wnHslYzigmCshLe8dalE/pSLuh85W94q2q/+2ct0kVVZLOsJwHJYFuhu
         52gaHZKKf8lHIFC1wrAaDfewn1j4xqgvaxOz99pu1uhGcKJWhh3Kx2/eLykBj9PdziD1
         QtmICD09xTWPYCTvEv9RNlrPg1w0FN5o/YBQ7IvOgI6uk5zXV629qWfcBk6hEIWCwnlf
         BhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272167; x=1739876967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pIxRugrT9zIlGotEeERPrS4hzRH4JozFA5lgU8/+aE=;
        b=DERrcneTNO6JuWnPLoyeF8zQ71NtQ+6hkOZSq8f9nkWC+iXbXR60DdyeZlsTEAxPrE
         lfu16LMCahHG70ax80JlVq7l7fvDZsG7RZcrBY/gXtgww0syCntI5WpsXFsOIJflJ7xe
         XNegR2w2SDP95Sq224QmlluwV+slctDCSbYkDTdfv3OwcoNxBdDnz+tWjdPNZGYk7sPx
         eubAtyv6N42cbHh4l12DlbC4R/q2aVIfnIapaNoawJmqvrvtNnveVyr29mTeK7qYhxKV
         hqbqd1UKDsmn1mlE2ytIVbYK90K1bO846PKGapVrUSTwOGbZtAkWBJ89MKOA6svPfGeE
         uAGg==
X-Forwarded-Encrypted: i=1; AJvYcCU8bhGmYVPVQuagkMTJINEhHUM47oe3dcELGScvtXl3PcaasFJrGHXlKPrtg0jU0PyxyzDRjxW6eiQDeWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw04XeINu9rH/D7PBBAK7IzKrpzV1AH0w1uReVDgVkiuDEW5pwa
	Vo9OiGQlhJvCV7yRiU/Odz+HNc0kArE8TQo/7xBnj2THSAaDRwwe
X-Gm-Gg: ASbGncsasPhnJEUORMMjtmPhkzrX3It3OPygkLtrgN3kc+yyeUrIt4rUxfEfV8uy3oL
	lhRuVR04m1wr0tz4y3NoOcxCmIMtJhk+WUjeQuwxKrAz9YeGbbH+l04/4uXH3F3F8iEAs+u4gFK
	QzH44YWb38+XJLjwBOGwzTCua1dgkaiYxsYAe5EvKkbF8/TRZF+biyVWMKvrLWfxgRBLg3dbQUr
	HmPyRk3wt6Ti2Py3WSIisE/C3m6f7dsr1zo3NkjLo3s5NYTpVkvH0jUfbfYxv4X+NzXdPBBmro6
	qd0JVGMGDiLyyL5C
X-Google-Smtp-Source: AGHT+IHfwznOgYooE54sdnp62NB27Tm8mgqt4Q4HujPdLIkP4bQFsppMEJaJNOMzhaePFvi0XctSXw==
X-Received: by 2002:a05:6000:18ab:b0:38c:5d42:1516 with SMTP id ffacd0b85a97d-38dc935dd04mr13336108f8f.34.1739272166602;
        Tue, 11 Feb 2025 03:09:26 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:25 -0800 (PST)
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
Subject: [PATCH v2 07/15] drm/vkms: Set device name from vkms_config
Date: Tue, 11 Feb 2025 12:09:04 +0100
Message-ID: <20250211110912.15409-8-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to be able to create multiple devices, the device name needs to
be unique.

Allow to set it in the VKMS configuration.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  7 ++++++-
 drivers/gpu/drm/vkms/vkms_config.c            | 14 ++++++++++++--
 drivers/gpu/drm/vkms/vkms_config.h            | 18 +++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_drv.c               |  4 +++-
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 ++
 5 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index d8644a1e3e18..92798590051b 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -15,10 +15,15 @@ struct default_config_case {
 static void vkms_config_test_empty_config(struct kunit *test)
 {
 	struct vkms_config *config;
+	const char *dev_name = "test";
 
-	config = vkms_config_create();
+	config = vkms_config_create(dev_name);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
+	/* The dev_name string and the config have different lifetimes */
+	dev_name = NULL;
+	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
+
 	vkms_config_destroy(config);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 30ce4b23553f..11b0e539920b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -7,7 +7,7 @@
 
 #include "vkms_config.h"
 
-struct vkms_config *vkms_config_create(void)
+struct vkms_config *vkms_config_create(const char *dev_name)
 {
 	struct vkms_config *config;
 
@@ -15,6 +15,12 @@ struct vkms_config *vkms_config_create(void)
 	if (!config)
 		return ERR_PTR(-ENOMEM);
 
+	config->dev_name = kstrdup_const(dev_name, GFP_KERNEL);
+	if (!config->dev_name) {
+		kfree(config);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	return config;
 }
 
@@ -24,7 +30,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 {
 	struct vkms_config *config;
 
-	config = vkms_config_create();
+	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
 		return config;
 
@@ -37,6 +43,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 
 void vkms_config_destroy(struct vkms_config *config)
 {
+	kfree_const(config->dev_name);
 	kfree(config);
 }
 
@@ -45,7 +52,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_debugfs_entry *entry = m->private;
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+	const char *dev_name;
 
+	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
+	seq_printf(m, "dev_name=%s\n", dev_name);
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index d0868750826a..fcaa909fb2e0 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -10,12 +10,14 @@
 /**
  * struct vkms_config - General configuration for VKMS driver
  *
+ * @dev_name: Name of the device
  * @writeback: If true, a writeback buffer can be attached to the CRTC
  * @cursor: If true, a cursor plane is created in the VKMS device
  * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
+	const char *dev_name;
 	bool writeback;
 	bool cursor;
 	bool overlay;
@@ -24,12 +26,13 @@ struct vkms_config {
 
 /**
  * vkms_config_create() - Create a new VKMS configuration
+ * @dev_name: Name of the device
  *
  * Returns:
  * The new vkms_config or an error. Call vkms_config_destroy() to free the
  * returned configuration.
  */
-struct vkms_config *vkms_config_create(void);
+struct vkms_config *vkms_config_create(const char *dev_name);
 
 /**
  * vkms_config_default_create() - Create the configuration for the default device
@@ -51,6 +54,19 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
  */
 void vkms_config_destroy(struct vkms_config *config);
 
+/**
+ * vkms_config_get_device_name() - Return the name of the device
+ * @config: Configuration to get the device name from
+ *
+ * Returns:
+ * The device name. Only valid while @config is valid.
+ */
+static inline const char *
+vkms_config_get_device_name(struct vkms_config *config)
+{
+	return config->dev_name;
+}
+
 /**
  * vkms_config_register_debugfs() - Register a debugfs file to show the device's
  * configuration
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 582d5825f42b..ba977ef09b2b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -151,8 +151,10 @@ static int vkms_create(struct vkms_config *config)
 	int ret;
 	struct platform_device *pdev;
 	struct vkms_device *vkms_device;
+	const char *dev_name;
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	dev_name = vkms_config_get_device_name(config);
+	pdev = platform_device_register_simple(dev_name, -1, NULL, 0);
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index af7081c940d6..a74a7fc3a056 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -12,6 +12,8 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_writeback.h>
 
+#define DEFAULT_DEVICE_NAME "vkms"
+
 #define XRES_MIN    10
 #define YRES_MIN    10
 
-- 
2.48.1

