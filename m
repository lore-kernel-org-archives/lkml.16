Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2698A24167C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744581; cv=pass; b=WwlaA5Ob5vxdo1b7gnZN/2BK60XtidqHKpZYGsFMYxoyGKkoxcqPYT0HniUKS8Yo+h8gaJCOd/mNgOyKct4Sm+qQR/dPbacBTcJMYqa/Vne4GKJdxOShYDSBGaxiUGc08spLH34qcRcSRlBplvzeRZi4NJgEuV3Y/Mug8DOnTbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744581; c=relaxed/simple;
	bh=F+unrvRxm3yRrVYh1REpVOgcmd/h+yunKU9v4yE0slQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UAuVqkYiuxF2mRUim7/t1Cnw5p7bC+/KiM10CrgHLKvhotgvinEg0ixVOTrWUQRxoWCpZ/0/nA9260tanBAdeuhCqH9ctkdfnw+uE5XLRPPLU+kgEPFZuOFTC4dgfKKgGVUGY+HndWDy8vLLCxAzP3YwCdnBN2XhFnfvg9cmAo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=NRJkx/+i; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NRJkx/+i"
ARC-Seal: i=1; a=rsa-sha256; t=1744744557; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NRfm9OsZZyuTpQ3fjWewo9fLCO6Xoh3QfkfmAqoWKisPLyFN5X3gUSBufIK7qnMPXDYN9t5SspomsZQj2YD9zJK8O/1/HfkKPx5nExyntHUAxxokGxZZuA6+nkQ7VPrAwhY+A6oaftXkuIssLQo9BtgL67htGBC3BEou+21d6/Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744744557; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o1Odhjmv1xZl4WhHWu12K3wsfRjR4/ExtOqaiJLzGuY=; 
	b=AkV+z4tzkVuJK2xH20kzrnSI5M0A6s961CcrLMj66YtUgAZ2CUMpbmIiTwY8KFT/Tgosi4njzBcU1sLcEfkZEx/4jqS7zPCuCi2ZyQTXhj2JpLfg+LAz19JMmNFyhUUWF9lBwUKxeHJFUiIZLfqyE0sGXSVtQFOQlzqqPhuVu5Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744744557;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=o1Odhjmv1xZl4WhHWu12K3wsfRjR4/ExtOqaiJLzGuY=;
	b=NRJkx/+itaPg9NpHkXtd5QLcnNoajRxjXr2MPpHiQVwMzLAOtZmBi00TjyS/96uE
	yoihhv5GnwnYJAX4UOWnPUs78l3nkb0HNQ2UvD9zC2XiADj2/LWFvm95afknWbCQru9
	MTpBIDvjOTACEzPmbzA4FU9A7ht3hVddIE9uoy4U=
Received: by mx.zohomail.com with SMTPS id 1744744554627828.0642471664818;
	Tue, 15 Apr 2025 12:15:54 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Date: Tue, 15 Apr 2025 20:15:31 +0100
Message-ID: <20250415191539.55258-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415191539.55258-1-adrian.larumbe@collabora.com>
References: <20250415191539.55258-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow UM to label a BO for which it possesses a DRM handle.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 64 ++++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h |  2 +
 include/uapi/drm/panthor_drm.h        | 20 +++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e32073..7660627cafa1 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1331,6 +1331,66 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+static int panthor_ioctl_bo_set_label(struct drm_device *ddev, void *data,
+				  struct drm_file *file)
+{
+	struct drm_panthor_bo_set_label *args = data;
+	struct drm_gem_object *obj;
+	char *label_tmp = NULL;
+	long label_len = 0;
+	const char *label;
+	int ret = 0;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	if (args->label) {
+		label_tmp = kmalloc(PANTHOR_BO_LABEL_MAXLEN, GFP_KERNEL);
+		if (!label_tmp) {
+			ret = -ENOMEM;
+			goto err_put_obj;
+		}
+
+		label_len = strncpy_from_user(label_tmp, u64_to_user_ptr(args->label),
+					      PANTHOR_BO_LABEL_MAXLEN);
+		if (label_len < 0) {
+			ret = label_len;
+			goto err_free_tmp;
+		}
+	}
+
+	if (label_len == PANTHOR_BO_LABEL_MAXLEN) {
+		ret = -E2BIG;
+		goto err_free_tmp;
+	}
+
+	/*
+	 * We treat passing a label of length 0 and passing a NULL label
+	 * differently, because even though they might seem conceptually
+	 * similar, future uses of the BO label might expect a different
+	 * behaviour in each case.
+	 */
+	if (label_tmp) {
+		label = kstrdup(label_tmp, GFP_KERNEL);
+		if (!label) {
+			ret = -ENOMEM;
+			goto err_free_tmp;
+		}
+	} else {
+		label = NULL;
+	}
+
+	panthor_gem_bo_set_label(obj, label);
+
+err_free_tmp:
+	kfree(label_tmp);
+err_put_obj:
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1400,6 +1460,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1509,6 +1570,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
+ * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1522,7 +1584,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 3,
+	.minor = 4,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index af0d77338860..983cc8ca264e 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -13,6 +13,8 @@
 
 struct panthor_vm;
 
+#define PANTHOR_BO_LABEL_MAXLEN	4096
+
 /**
  * struct panthor_gem_object - Driver specific GEM object.
  */
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 97e2c4510e69..226965673db5 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
+
+	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
+	DRM_PANTHOR_BO_SET_LABEL,
 };
 
 /**
@@ -977,6 +980,21 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTHOR_BO_SET_LABEL
+ */
+struct drm_panthor_bo_set_label {
+	/** @handle: Handle of the buffer object to label. */
+	__u32 handle;
+
+	/**
+	 * @label: User pointer to a NUL-terminated string
+	 *
+	 * Length cannot be greater than 4096
+	 */
+	__u64 label;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1019,6 +1037,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
 	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+	DRM_IOCTL_PANTHOR_BO_SET_LABEL =
+		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
 };
 
 #if defined(__cplusplus)
-- 
2.48.1

