Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DE3324F19
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.204.156.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615838; cv=none; b=rogFfZbIj5nDTPmWlmvaM9OxfEcy68emJRMMCImZ7hl1km1u7dJvRi3gN/lEaS5JQf2dUBdjk2YOLVEQuVcX1WTka5iBJzw+7KeEK8WNQDGhb1+7361nCDP5zG6Sd1RfT4gYqxpiJOG5YVVuUzpt4JT4u8+K0nV+DqzVdS31C+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615838; c=relaxed/simple;
	bh=0UJYm4GvYPCrYgUTkCfesbvqtmU5aAKR9BrMZW1o2gM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ba+UIfFoZL3vPnRNBKKBrWF8LDd4ob8ddlzCMkDYavhzlf3bo32dGPPXqd90freryNeVxZKj10manROVH5ydMltb219uWxAzmSvS3urJ8SwusDn1qiJo7HDAvgd6+jOeUL/d6LqfMHAdI0MFoaZmxl2N2zquPltcgWbG8AbPF9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com; arc=none smtp.client-ip=165.204.156.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 5647uVLF1550159;
	Fri, 4 Jul 2025 13:26:31 +0530
Received: (from sunil@localhost)
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 5647uVQ01550158;
	Fri, 4 Jul 2025 13:26:31 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
        tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
        linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v10 1/4] drm: move drm based debugfs funcs to drm_debugfs.c
Date: Fri,  4 Jul 2025 13:25:45 +0530
Message-Id: <20250704075548.1549849-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704075548.1549849-1-sunil.khatri@amd.com>
References: <20250704075548.1549849-1-sunil.khatri@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Requirement is to create per client-id based directories to
hold key debugging information and for that access to
root debugfs dentry is need which is not in one place
and that information cannot be stored in drm_device.

Move the debugfs functionality from drm_drv.c and drm_accel.c
to drm_debugfs.c This enables debugfs root node reference
directly drm_debugfs.c and hence enable to create per client-id
directory.

v8: Create drm_accel dentry only if it's config is enabled (Jeff, Hugo)
v8: Merge drm_drv and drm_accel debugfs patches (Koenig, Christian)

v10: Since we moved drm_debugfs_root, hence to handle drm bridge
debugfs add a new function which call drm_bridge_debugfs_params where
drm_debugfs_root is accessible.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/accel/drm_accel.c      | 16 ---------------
 drivers/gpu/drm/drm_debugfs.c  | 37 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/drm_drv.c      | 16 +++++----------
 drivers/gpu/drm/drm_internal.h |  6 ++----
 include/drm/drm_accel.h        |  5 -----
 include/drm/drm_drv.h          | 19 +++++++++++++++--
 6 files changed, 55 insertions(+), 44 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index aa826033b0ce..ca3357acd127 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -20,8 +20,6 @@
 
 DEFINE_XARRAY_ALLOC(accel_minors_xa);
 
-static struct dentry *accel_debugfs_root;
-
 static const struct device_type accel_sysfs_device_minor = {
 	.name = "accel_minor"
 };
@@ -73,17 +71,6 @@ static const struct drm_info_list accel_debugfs_list[] = {
 };
 #define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
 
-/**
- * accel_debugfs_init() - Initialize debugfs for device
- * @dev: Pointer to the device instance.
- *
- * This function creates a root directory for the device in debugfs.
- */
-void accel_debugfs_init(struct drm_device *dev)
-{
-	drm_debugfs_dev_init(dev, accel_debugfs_root);
-}
-
 /**
  * accel_debugfs_register() - Register debugfs for device
  * @dev: Pointer to the device instance.
@@ -194,7 +181,6 @@ static const struct file_operations accel_stub_fops = {
 void accel_core_exit(void)
 {
 	unregister_chrdev(ACCEL_MAJOR, "accel");
-	debugfs_remove(accel_debugfs_root);
 	accel_sysfs_destroy();
 	WARN_ON(!xa_empty(&accel_minors_xa));
 }
@@ -209,8 +195,6 @@ int __init accel_core_init(void)
 		goto error;
 	}
 
-	accel_debugfs_root = debugfs_create_dir("accel", NULL);
-
 	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
 	if (ret < 0)
 		DRM_ERROR("Cannot register ACCEL major: %d\n", ret);
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index abceb28b23fc..a084d16a3cb4 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -44,6 +44,9 @@
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
+static struct dentry *accel_debugfs_root;
+static struct dentry *drm_debugfs_root;
+
 /***************************************************
  * Initialization, etc.
  **************************************************/
@@ -287,16 +290,39 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 }
 EXPORT_SYMBOL(drm_debugfs_remove_files);
 
+void drm_debugfs_bridge_params(void)
+{
+	drm_bridge_debugfs_params(drm_debugfs_root);
+}
+
+void drm_debugfs_init_root(void)
+{
+	drm_debugfs_root = debugfs_create_dir("dri", NULL);
+#if IS_ENABLED(CONFIG_DRM_ACCEL)
+	accel_debugfs_root = debugfs_create_dir("accel", NULL);
+#endif
+}
+
+void drm_debugfs_remove_root(void)
+{
+#if IS_ENABLED(CONFIG_DRM_ACCEL)
+	debugfs_remove(accel_debugfs_root);
+#endif
+	debugfs_remove(drm_debugfs_root);
+}
+
 /**
  * drm_debugfs_dev_init - create debugfs directory for the device
  * @dev: the device which we want to create the directory for
- * @root: the parent directory depending on the device type
  *
  * Creates the debugfs directory for the device under the given root directory.
  */
-void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
+void drm_debugfs_dev_init(struct drm_device *dev)
 {
-	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
+	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
+		dev->debugfs_root = debugfs_create_dir(dev->unique, accel_debugfs_root);
+	else
+		dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
 }
 
 /**
@@ -323,14 +349,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
 		drm_atomic_debugfs_init(dev);
 }
 
-int drm_debugfs_register(struct drm_minor *minor, int minor_id,
-			 struct dentry *root)
+int drm_debugfs_register(struct drm_minor *minor, int minor_id)
 {
 	struct drm_device *dev = minor->dev;
 	char name[64];
 
 	sprintf(name, "%d", minor_id);
-	minor->debugfs_symlink = debugfs_create_symlink(name, root,
+	minor->debugfs_symlink = debugfs_create_symlink(name, drm_debugfs_root,
 							dev->unique);
 
 	/* TODO: Only for compatibility with drivers */
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 02556363e918..cdd591b11488 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -72,8 +72,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
  */
 static bool drm_core_init_complete;
 
-static struct dentry *drm_debugfs_root;
-
 DEFINE_STATIC_SRCU(drm_unplug_srcu);
 
 /*
@@ -186,8 +184,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 		return 0;
 
 	if (minor->type != DRM_MINOR_ACCEL) {
-		ret = drm_debugfs_register(minor, minor->index,
-					   drm_debugfs_root);
+		ret = drm_debugfs_register(minor, minor->index);
 		if (ret) {
 			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
 			goto err_debugfs;
@@ -787,10 +784,7 @@ static int drm_dev_init(struct drm_device *dev,
 		goto err;
 	}
 
-	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
-		accel_debugfs_init(dev);
-	else
-		drm_debugfs_dev_init(dev, drm_debugfs_root);
+	drm_debugfs_dev_init(dev);
 
 	return 0;
 
@@ -1230,7 +1224,7 @@ static void drm_core_exit(void)
 	drm_panic_exit();
 	accel_core_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
-	debugfs_remove(drm_debugfs_root);
+	drm_debugfs_remove_root();
 	drm_sysfs_destroy();
 	WARN_ON(!xa_empty(&drm_minors_xa));
 	drm_connector_ida_destroy();
@@ -1249,8 +1243,8 @@ static int __init drm_core_init(void)
 		goto error;
 	}
 
-	drm_debugfs_root = debugfs_create_dir("dri", NULL);
-	drm_bridge_debugfs_params(drm_debugfs_root);
+	drm_debugfs_init_root();
+	drm_debugfs_bridge_params();
 
 	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 442eb31351dd..9078504e789c 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -182,8 +182,7 @@ void drm_gem_vunmap_locked(struct drm_gem_object *obj, struct iosys_map *map);
 #if defined(CONFIG_DEBUG_FS)
 void drm_debugfs_dev_fini(struct drm_device *dev);
 void drm_debugfs_dev_register(struct drm_device *dev);
-int drm_debugfs_register(struct drm_minor *minor, int minor_id,
-			 struct dentry *root);
+int drm_debugfs_register(struct drm_minor *minor, int minor_id);
 void drm_debugfs_unregister(struct drm_minor *minor);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
@@ -201,8 +200,7 @@ static inline void drm_debugfs_dev_register(struct drm_device *dev)
 {
 }
 
-static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
-				       struct dentry *root)
+static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id)
 {
 	return 0;
 }
diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index 038ccb02f9a3..20a665ec6f16 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -58,7 +58,6 @@ void accel_core_exit(void);
 int accel_core_init(void);
 void accel_set_device_instance_params(struct device *kdev, int index);
 int accel_open(struct inode *inode, struct file *filp);
-void accel_debugfs_init(struct drm_device *dev);
 void accel_debugfs_register(struct drm_device *dev);
 
 #else
@@ -77,10 +76,6 @@ static inline void accel_set_device_instance_params(struct device *kdev, int ind
 {
 }
 
-static inline void accel_debugfs_init(struct drm_device *dev)
-{
-}
-
 static inline void accel_debugfs_register(struct drm_device *dev)
 {
 }
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 3f76a32d6b84..42fc085f986d 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -572,9 +572,24 @@ static inline bool drm_firmware_drivers_only(void)
 }
 
 #if defined(CONFIG_DEBUG_FS)
-void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
+void drm_debugfs_dev_init(struct drm_device *dev);
+void drm_debugfs_init_root(void);
+void drm_debugfs_remove_root(void);
+void drm_debugfs_bridge_params(void);
 #else
-static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
+static inline void drm_debugfs_dev_init(struct drm_device *dev)
+{
+}
+
+static inline void drm_debugfs_init_root(void)
+{
+}
+
+static inline void drm_debugfs_remove_root(void)
+{
+}
+
+static inline void drm_debugfs_bridge_params(void)
 {
 }
 #endif
-- 
2.34.1

