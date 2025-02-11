Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7467A1FAC49
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272167; cv=none; b=PgoR7MpWfbr5KmLakWu0Fb54UrPcSk/1vz1RK1EueuMW+g/+1FYGai2QnNSBnc30nC9EJX8ZifFCGxhwi5dw4BiGfxiGziDeAkfTl78beGTpnsAMTbjiR+FjM8BlehfRLKCSwFmOuomdn90M4GeCpkuMoy+Swhvv9sJMOA6Uqak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272167; c=relaxed/simple;
	bh=YhwCZuO2MCiL2PquS+S4QqiD0mec7G+FOwsHL/tWxdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lPyBtkRcv74A7zqm+pY2CsqUEf13xClneOwLyi4YWZc5wl/RJzQyoHR4/fBgtLaXwYc6XzmthPqW+rx7kJIQ8GTrr/VDMErMKDFA97M9VQGp/mRV24j/UG4oDBi5pXFd+pmuJPgkGUGciqD0Tx0RE7AIdm5klYC0Ohn191ZSKGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzrKtD/F; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzrKtD/F"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso2092402f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272164; x=1739876964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8lum8pBLYhiQh7v0U0rbZpEXVJRkT5bnyUgOR4qD6o=;
        b=lzrKtD/F69rhgDNq+s8oXX1HefdEV2BZjPM8F9Cq/u7Eq8grl3sztfjCj2TUK2EZqM
         ahvK7nTqwldHgxgeaMksvKNQ4NVV3MusmD+wIeMHWyTXWO6cQPoqVItxb1J1HyR7PEAy
         A04VlaB6lWVzWg5Bn9PV0+illkQHpKMwD8xBvFv3/XrDagVBnlxr3PuB4kWlhJ1U4lwe
         XmYS/qquKxfRePe7N19o7VEsQdvKo5oOMQQlnmJDxsywfKNjK9hG6J4kIW5uXYt4Gwf/
         OBhZhjQo9T65SsC/xfbzuVqnFrbtEaC+omwohJX5uAkC9TQ/fQlRP7PQfp/fFGMu/b96
         x/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272164; x=1739876964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8lum8pBLYhiQh7v0U0rbZpEXVJRkT5bnyUgOR4qD6o=;
        b=FebCNacaXhmotlhZhu4DypI5ogXKec0g+VRjlXpJwQIXzFYYE/O7S6t0ECZQGaFMzi
         k6I105lIW2cjMa5LgpZZEhnxPWqOcjdqWX8yWjiKVSBH+TA2YoXXcOKgE8VOfHkesjNm
         wy9AcD1XEtrLyl6M2Fbz0hGc1kOMBH5cFXwc0ic5XPqcxM1UVs3PFGhUJvL2mcahZqQ8
         tX0QIP0u/Gq1qf2+P0cYiGxTEpop1PZ2baALx4TcbaZw82g9n6Y4LyNNWa2DRSCgSDZs
         Apak03oMvv2YF/crX2BZS/NfDPNzUyrAmzkyJXwoAh8uTkNXtVvdcL660YORIes2nn8e
         9mxw==
X-Forwarded-Encrypted: i=1; AJvYcCWcxUPgLTiN6qC2ABYG8/NV+6/rk7jy8xXNs3CIt1VVb1tbsfzHHTzxSoKZgMR4YFxKRx3LB7Box/mCTCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4KBGlqMgVG/P2jsWydVhC5cE8GV27pw+W+PfyVPOU3BVGJ4E2
	JN1yf5LOWxH1kt59a3Sfgvhr0l0Sb74HdbQAbMeH81wvblv05FuJAHpHJJfg
X-Gm-Gg: ASbGncuCYNx4qHIFdbLOAePwKqQ2teYT+hpRgxdxG2GuZ2izbyX5TACD6RrisuusfnL
	LNdilURORjBKmG3PrbuOsuSC046U9Nkd+GpwvLsDMt45UK9nTULd+49kdEH/fihMYzytmJlIT7o
	2l18nLZ4xdibp2KKIyoKmucXX6KmwnZ0vMdzoOOUGd3GJr90nezjScjK7wGTsMMHNbe7s+vN89C
	JZgC+9gpiT6FHDQ3C4SH0Tze3NayFtIE85pPCoet5QipG/ml4WHyyWsQCEXRZmcxwCoeaMOy/w2
	KdGTn7IPaLkCkvZY
X-Google-Smtp-Source: AGHT+IEKnWUo5eUZtrzRBT+jHHy0k5gsRkTO/HlKIycGcSYkywT85kSZQR1n34vGrpV/GF0O9mtKGg==
X-Received: by 2002:a5d:6d87:0:b0:38d:d93b:5899 with SMTP id ffacd0b85a97d-38dd93b5a82mr8411507f8f.21.1739272163582;
        Tue, 11 Feb 2025 03:09:23 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:22 -0800 (PST)
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
Subject: [PATCH v2 05/15] drm/vkms: Extract vkms_config header
Date: Tue, 11 Feb 2025 12:09:02 +0100
Message-ID: <20250211110912.15409-6-jose.exposito89@gmail.com>
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

Creating a new vkms_config structure will be more complex once we
start adding more options.

Extract the vkms_config structure to its own header and source files
and add functions to create and delete a vkms_config and to initialize
debugfs.

Refactor, no functional changes.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile                 |  3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 13 +++++
 drivers/gpu/drm/vkms/vkms_config.c            | 47 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 47 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c               | 34 +++-----------
 drivers/gpu/drm/vkms/vkms_drv.h               | 15 +-----
 drivers/gpu/drm/vkms/vkms_output.c            |  1 +
 7 files changed, 118 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 45ef4b89379e..9bf6b8f94daf 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -7,7 +7,8 @@ vkms-y := \
 	vkms_crtc.o \
 	vkms_composer.o \
 	vkms_writeback.o \
-	vkms_connector.o
+	vkms_connector.o \
+	vkms_config.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
 obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 1177e62e19cb..a7060504f3dc 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -2,9 +2,22 @@
 
 #include <kunit/test.h>
 
+#include "../vkms_config.h"
+
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
+static void vkms_config_test_empty_config(struct kunit *test)
+{
+	struct vkms_config *config;
+
+	config = vkms_config_create();
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
+	KUNIT_CASE(vkms_config_test_empty_config),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
new file mode 100644
index 000000000000..152b2ecd6aef
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/slab.h>
+
+#include <drm/drm_print.h>
+#include <drm/drm_debugfs.h>
+
+#include "vkms_config.h"
+
+struct vkms_config *vkms_config_create(void)
+{
+	struct vkms_config *config;
+
+	config = kzalloc(sizeof(*config), GFP_KERNEL);
+	if (!config)
+		return ERR_PTR(-ENOMEM);
+
+	return config;
+}
+
+void vkms_config_destroy(struct vkms_config *config)
+{
+	kfree(config);
+}
+
+static int vkms_config_show(struct seq_file *m, void *data)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+
+	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
+	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
+	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+
+	return 0;
+}
+
+static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
+	{ "vkms_config", vkms_config_show, 0 },
+};
+
+void vkms_config_register_debugfs(struct vkms_device *vkms_device)
+{
+	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
+			      ARRAY_SIZE(vkms_config_debugfs_list));
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
new file mode 100644
index 000000000000..ced10f56a812
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_CONFIG_H_
+#define _VKMS_CONFIG_H_
+
+#include <linux/types.h>
+
+#include "vkms_drv.h"
+
+/**
+ * struct vkms_config - General configuration for VKMS driver
+ *
+ * @writeback: If true, a writeback buffer can be attached to the CRTC
+ * @cursor: If true, a cursor plane is created in the VKMS device
+ * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
+ * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
+ */
+struct vkms_config {
+	bool writeback;
+	bool cursor;
+	bool overlay;
+	struct vkms_device *dev;
+};
+
+/**
+ * vkms_config_create() - Create a new VKMS configuration
+ *
+ * Returns:
+ * The new vkms_config or an error. Call vkms_config_destroy() to free the
+ * returned configuration.
+ */
+struct vkms_config *vkms_config_create(void);
+
+/**
+ * vkms_config_destroy() - Free a VKMS configuration
+ * @config: vkms_config to free
+ */
+void vkms_config_destroy(struct vkms_config *config);
+
+/**
+ * vkms_config_register_debugfs() - Register a debugfs file to show the device's
+ * configuration
+ * @vkms_device: Device to register
+ */
+void vkms_config_register_debugfs(struct vkms_device *vkms_device);
+
+#endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index b6de91134a22..37de0658e6ee 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -27,11 +27,9 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vblank.h>
 
+#include "vkms_config.h"
 #include "vkms_drv.h"
 
-#include <drm/drm_print.h>
-#include <drm/drm_debugfs.h>
-
 #define DRIVER_NAME	"vkms"
 #define DRIVER_DESC	"Virtual Kernel Mode Setting"
 #define DRIVER_MAJOR	1
@@ -81,23 +79,6 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-static int vkms_config_show(struct seq_file *m, void *data)
-{
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
-
-	return 0;
-}
-
-static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
-	{ "vkms_config", vkms_config_show, 0 },
-};
-
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
 	.fops			= &vkms_driver_fops,
@@ -208,8 +189,7 @@ static int vkms_create(struct vkms_config *config)
 	if (ret)
 		goto out_devres;
 
-	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
-			      ARRAY_SIZE(vkms_config_debugfs_list));
+	vkms_config_register_debugfs(vkms_device);
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
@@ -231,9 +211,9 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
-	config = kmalloc(sizeof(*config), GFP_KERNEL);
-	if (!config)
-		return -ENOMEM;
+	config = vkms_config_create();
+	if (IS_ERR(config))
+		return PTR_ERR(config);
 
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
@@ -241,7 +221,7 @@ static int __init vkms_init(void)
 
 	ret = vkms_create(config);
 	if (ret) {
-		kfree(config);
+		vkms_config_destroy(config);
 		return ret;
 	}
 
@@ -275,7 +255,7 @@ static void __exit vkms_exit(void)
 		return;
 
 	vkms_destroy(default_config);
-	kfree(default_config);
+	vkms_config_destroy(default_config);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index abbb652be2b5..af7081c940d6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -189,20 +189,7 @@ struct vkms_output {
 	spinlock_t composer_lock;
 };
 
-/**
- * struct vkms_config - General configuration for VKMS driver
- *
- * @writeback: If true, a writeback buffer can be attached to the CRTC
- * @cursor: If true, a cursor plane is created in the VKMS device
- * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
- * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
- */
-struct vkms_config {
-	bool writeback;
-	bool cursor;
-	bool overlay;
-	struct vkms_device *dev;
-};
+struct vkms_config;
 
 /**
  * struct vkms_device - Description of a VKMS device
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 4b5abe159add..068a7f87ecec 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "vkms_config.h"
 #include "vkms_connector.h"
 #include "vkms_drv.h"
 #include <drm/drm_managed.h>
-- 
2.48.1

