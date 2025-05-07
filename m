Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A39A289375
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626081; cv=none; b=tBar3RXS++Pd3oqTktW1+paKq2auERWikQcZuuizbQOsFuyHTlzKeb/jBRMWFLuRE9VFOBK7mcjAVAFKMnH5xCxeaOpsv3zS1ZdpU9jehQApw1ftgglZUFh7pLmjHJEMcnlR9yEz0rC8r8QO5PIXg+7UUfTbLHBcRmpAGQ2DC6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626081; c=relaxed/simple;
	bh=pBghrZTtWCX0vV6P6pbRcJTnj0Cysp2iVNlAzgzE9oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MfHA9ln/EQSb1Ecxf7E1N/Y4Lh4nm/QWhM6kPAKBFFuAbHAUd/y26fLyTYytkLf9cY4jPfNhG20+45Me5XdI6TZCo5Cg9Wdf2WFZhs/hoCsPoT5BgbQ9ztP8Ant8EpQERgjMWLd1pU+zOKMK4z6rbpChhr4Or6ay+bxz8uYRnK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPwz6kHV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPwz6kHV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so70044265e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626078; x=1747230878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CLDDw3iRecFGyTKD2O7T3Am46FTDBUmOiKBnmX0j90=;
        b=jPwz6kHVLf9h5mgv1+hOtmKten4CuWUS18/NdHXzGVP7gUB+euFyvzuTr59cHZ6Aj5
         EuCJxc2bT9pEzGf9U6SvfA9f+zjAI2oM8s0qv10xNDX+MnH+v8hNOuXNDATrcus5jZdL
         CXw73wbNT0SU/m16CMkoFdw21GVeQs4dTKI652+K2QSRmAryCFtir76o+y8TELVUKH3q
         AIfjBAo6h/MRz4SNXD/tAxvb+IuCvFpfVYVevE7cIqgdflf6e2EzOVqUBiRTFZHilkh3
         t1V8oMjpLZHy2P3dDlihctj6oKINIowTd4N92QQe563UDa+aynLZ8SrmOc9qmVYe9sN3
         ZR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626078; x=1747230878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CLDDw3iRecFGyTKD2O7T3Am46FTDBUmOiKBnmX0j90=;
        b=GGjHwA0CSHayKyg8gINtL7gNtAMHaWfIp/XemY6H4gIQAdqHG3BI03THBssCza71wQ
         PafB3ul+ADDWLN0ckY1RKmGbpa3xirZwfPqN+A2syxFXptcY6OTXFEdXpv9Vz2pJCsL3
         Bb/fCn4AsOOKv9z2zUnyVtBfxk0rVDe+4+5vGYwfF0MslkJJkGug7bA3Bd+CByZpQ82m
         pbcSAbmWRzF+0ZKpmuW3NPKSGoRW6RrZqdm/I+Z0i48lS1dpz+Hkf4NFRrZrCB3RcV0r
         WQF/WDoZCV0/R8f9vhxdysh9RiyfKt9t6floLYBwwPLjL+1Qvg2ohxuo0TFpmiaWQ/1c
         7vag==
X-Forwarded-Encrypted: i=1; AJvYcCW+nnB44l+OS/wHiNBZxz2U1BT3e7MCxrv06SWQIzlN4rk59JZ6Q/4DwcTTPbiwM6ausnivyWHqrgKdZgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypSxzoKvsYwZ1VzijiOwYrE993/YFt6s9Ra+uSpTK3JGgXPncH
	RvLLCnx5ALxFhRk0AP9hc6L4XdXeEpAPU8O1M1uxZ0tc3dGtPVSt
X-Gm-Gg: ASbGncuK06drGApAnMg2Yvka1PBKk/g7IJC7HeNBiKIwLeioB9rwOQdw6zpBtbnbevq
	EEF4W4GBU1OuRwDAGNebQKXgA427Imy7ZH9yLl3wDH0N3t7S+x7SwjrGHF1RJGZbApUTw0bK+eh
	FjXoOR7JlPTuRtcJ2DspVe59od7I4RvQAVsTqOKjhXIfo1mDYXJg5Hj385JoBfyJoPaTGNwhbN0
	sgt+ZRjwWXK3Q9hqxlHZL6yj4KSdXniuCROSAnCHxFr+7XtU+7sOzNreHxOT7pUArbkaq+6lVDS
	8KtT53XmalFtHJU6Bq0wreXa2kuA+O3AIAvxhcd1kg==
X-Google-Smtp-Source: AGHT+IEwVv3Fx75TQ5iAihOC7ukq0rscqGxtB4HeRaI3ouywLzCu+EqsghviNNr75GgBCiVQbdX+Og==
X-Received: by 2002:a05:600c:3483:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-441d44c36b1mr30636505e9.12.1746626077519;
        Wed, 07 May 2025 06:54:37 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:36 -0700 (PDT)
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
Subject: [PATCH v5 02/16] drm/vkms: Add and remove VKMS instances via configfs
Date: Wed,  7 May 2025 15:54:17 +0200
Message-ID: <20250507135431.53907-3-jose.exposito89@gmail.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Allow to create, enable, disable and destroy VKMS instances using
configfs.

For the moment, it is not possible to add pipeline items, so trying to
enable the device will fail printing an informative error to the log.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  32 +++++
 drivers/gpu/drm/vkms/Kconfig         |   1 +
 drivers/gpu/drm/vkms/Makefile        |   3 +-
 drivers/gpu/drm/vkms/vkms_configfs.c | 172 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h |   8 ++
 drivers/gpu/drm/vkms/vkms_drv.c      |   7 ++
 6 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ba04ac7c2167..423bdf86b5b1 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -51,6 +51,38 @@ To disable the driver, use ::
 
   sudo modprobe -r vkms
 
+Configuring With Configfs
+=========================
+
+It is possible to create and configure multiple VKMS instances via configfs.
+
+Start by mounting configfs and loading VKMS::
+
+  sudo mount -t configfs none /config
+  sudo modprobe vkms
+
+Once VKMS is loaded, ``/config/vkms`` is created automatically. Each directory
+under ``/config/vkms`` represents a VKMS instance, create a new one::
+
+  sudo mkdir /config/vkms/my-vkms
+
+By default, the instance is disabled::
+
+  cat /config/vkms/my-vkms/enabled
+  0
+
+Once you are done configuring the VKMS instance, enable it::
+
+  echo "1" | sudo tee /config/vkms/my-vkms/enabled
+
+Finally, you can remove the VKMS instance disabling it::
+
+  echo "0" | sudo tee /config/vkms/my-vkms/enabled
+
+And removing the top level directory::
+
+  sudo rmdir /config/vkms/my-vkms
+
 Testing With IGT
 ================
 
diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 3c02f928ffe6..3977bbb99f7d 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -7,6 +7,7 @@ config DRM_VKMS
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select CRC32
+	select CONFIGFS_FS
 	default n
 	help
 	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index d657865e573f..939991fc8233 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -8,7 +8,8 @@ vkms-y := \
 	vkms_composer.o \
 	vkms_writeback.o \
 	vkms_connector.o \
-	vkms_config.o
+	vkms_config.o \
+	vkms_configfs.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
new file mode 100644
index 000000000000..ee186952971b
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/cleanup.h>
+#include <linux/configfs.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+
+#include "vkms_drv.h"
+#include "vkms_config.h"
+#include "vkms_configfs.h"
+
+/* To avoid registering configfs more than once or unregistering on error */
+static bool is_configfs_registered;
+
+/**
+ * struct vkms_configfs_device - Configfs representation of a VKMS device
+ *
+ * @group: Top level configuration group that represents a VKMS device.
+ * Initialized when a new directory is created under "/config/vkms/"
+ * @lock: Lock used to project concurrent access to the configuration attributes
+ * @config: Protected by @lock. Configuration of the VKMS device
+ * @enabled: Protected by @lock. The device is created or destroyed when this
+ * option changes
+ */
+struct vkms_configfs_device {
+	struct config_group group;
+
+	struct mutex lock;
+	struct vkms_config *config;
+	bool enabled;
+};
+
+#define device_item_to_vkms_configfs_device(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_device, \
+		     group)
+
+static ssize_t device_enabled_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_device *dev;
+	bool enabled;
+
+	dev = device_item_to_vkms_configfs_device(item);
+
+	scoped_guard(mutex, &dev->lock)
+		enabled = dev->enabled;
+
+	return sprintf(page, "%d\n", enabled);
+}
+
+static ssize_t device_enabled_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs_device *dev;
+	bool enabled;
+	int ret = 0;
+
+	dev = device_item_to_vkms_configfs_device(item);
+
+	if (kstrtobool(page, &enabled))
+		return -EINVAL;
+
+	scoped_guard(mutex, &dev->lock) {
+		if (!dev->enabled && enabled) {
+			if (!vkms_config_is_valid(dev->config))
+				return -EINVAL;
+
+			ret = vkms_create(dev->config);
+			if (ret)
+				return ret;
+		} else if (dev->enabled && !enabled) {
+			vkms_destroy(dev->config);
+		}
+
+		dev->enabled = enabled;
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(device_, enabled);
+
+static struct configfs_attribute *device_item_attrs[] = {
+	&device_attr_enabled,
+	NULL,
+};
+
+static void device_release(struct config_item *item)
+{
+	struct vkms_configfs_device *dev;
+
+	dev = device_item_to_vkms_configfs_device(item);
+
+	if (dev->enabled)
+		vkms_destroy(dev->config);
+
+	mutex_destroy(&dev->lock);
+	vkms_config_destroy(dev->config);
+	kfree(dev);
+}
+
+static struct configfs_item_operations device_item_operations = {
+	.release	= &device_release,
+};
+
+static const struct config_item_type device_item_type = {
+	.ct_attrs	= device_item_attrs,
+	.ct_item_ops	= &device_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_device_group(struct config_group *group,
+					      const char *name)
+{
+	struct vkms_configfs_device *dev;
+
+	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
+		return ERR_PTR(-EINVAL);
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->config = vkms_config_create(name);
+	if (IS_ERR(dev->config)) {
+		kfree(dev);
+		return ERR_CAST(dev->config);
+	}
+
+	config_group_init_type_name(&dev->group, name, &device_item_type);
+	mutex_init(&dev->lock);
+
+	return &dev->group;
+}
+
+static struct configfs_group_operations device_group_ops = {
+	.make_group = &make_device_group,
+};
+
+static const struct config_item_type device_group_type = {
+	.ct_group_ops	= &device_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem vkms_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_name = "vkms",
+			.ci_type = &device_group_type,
+		},
+	},
+	.su_mutex = __MUTEX_INITIALIZER(vkms_subsys.su_mutex),
+};
+
+int vkms_configfs_register(void)
+{
+	int ret;
+
+	if (is_configfs_registered)
+		return 0;
+
+	config_group_init(&vkms_subsys.su_group);
+	ret = configfs_register_subsystem(&vkms_subsys);
+
+	is_configfs_registered = ret == 0;
+
+	return ret;
+}
+
+void vkms_configfs_unregister(void)
+{
+	if (is_configfs_registered)
+		configfs_unregister_subsystem(&vkms_subsys);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
new file mode 100644
index 000000000000..e9020b0043db
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_configfs.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#ifndef _VKMS_CONFIGFS_H_
+#define _VKMS_CONFIGFS_H_
+
+int vkms_configfs_register(void);
+void vkms_configfs_unregister(void);
+
+#endif /* _VKMS_CONFIGFS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 23817c7b997e..5bcfbcb6c0c5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -28,6 +28,7 @@
 #include <drm/drm_vblank.h>
 
 #include "vkms_config.h"
+#include "vkms_configfs.h"
 #include "vkms_drv.h"
 
 #define DRIVER_NAME	"vkms"
@@ -214,6 +215,10 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
+	ret = vkms_configfs_register();
+	if (ret)
+		return ret;
+
 	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
@@ -250,6 +255,8 @@ void vkms_destroy(struct vkms_config *config)
 
 static void __exit vkms_exit(void)
 {
+	vkms_configfs_unregister();
+
 	if (!default_config)
 		return;
 
-- 
2.49.0

