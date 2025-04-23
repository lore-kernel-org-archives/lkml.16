Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1703F263F49
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745374436; cv=pass; b=S7DmCZojQCgnaKy7WCNsEDzb0JZBfYnervW9ro1lROi/TXSDwRnZT7xbkY+webBdcXnv43tuMOgbWCADWwLHYYUBJKCUlgdDY7L0SDTu0fy3NIiJmWjA8rGoQR8M7tnetwh36SUthgbfIH2L+W2P9C65mN7J3B1AuZUmlrq+afI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745374436; c=relaxed/simple;
	bh=kCx+6WiuJD4PwOJx5wbHM0+lmi9vbWo0wKGyWP6g5rY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LsgcKVi7QlZ+vST+7az4TpKNwDvXyU3OwX7uZljY88RWYcNggmjahy0sZxnCV/JRfD82I15WQf0daCi/vke8RbF1+c8ic8iTSFv5sElOq/stY7U5zAs5yqvi3pNtGnU1UegKb/0DVk0tpnbBXN75DVPytaC2cA+l8SJu2dxK7pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=WM0+CfF4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="WM0+CfF4"
ARC-Seal: i=1; a=rsa-sha256; t=1745374378; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QRF7VRFZinndQISGfGnfP/OXA5bAPkcPL3hNQX6OPRb1cGRffePJJ9Jj3qDcvRCz5FOX6WWe4dYx5zgrMqns2Hdugsa1VxPUILxgs0YHnDxDLUICScQ/8/KFFrA2moSp958DIe6cBM5Ze0bbKyyd63gELlAQxF7EiC8yN2nNiVM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745374378; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k6xD9WlxcOB5wjZAwwzZ+SEahObCfEnbA46ihgVRKNU=; 
	b=M/hHzNiBMcvXX21kaw5fPhDFmiAIaEk1VhcpHfZSaSXP4S/DK22rN00MxG+rbzNBmMCRdsw/xW3OcNr95JvBzGconByy8T9d2Vk6OLxM94Ln3+cRSDZpYnKaWJDrzx3eM8uuwQmy9j9tdT/AwuyVoAVfDQQk+N0/vvPT2HxCf64=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745374378;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=k6xD9WlxcOB5wjZAwwzZ+SEahObCfEnbA46ihgVRKNU=;
	b=WM0+CfF4FxJbjNGzLhixdndc1qGnHniWhODZE12tbGc7z33xL2X5q6BaXFhFWy5+
	r1NJRvHWakTI1OQaKw+QN9ipe/TI6/DnJVmXEqhtFuJtjQkVU05G/3FjsMMD1xx1k9D
	DjUHrSYsia03aYW4i3TX+ao87xtsgKaKKMG7l4BY=
Received: by mx.zohomail.com with SMTPS id 174537437551130.74276877402292;
	Tue, 22 Apr 2025 19:12:55 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v10 1/4] drm/panthor: Introduce BO labeling
Date: Wed, 23 Apr 2025 03:12:31 +0100
Message-ID: <20250423021238.1639175-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250423021238.1639175-1-adrian.larumbe@collabora.com>
References: <20250423021238.1639175-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new character string Panthor BO field, and a function that allows
setting it from within the driver.

Driver takes care of freeing the string when it's replaced or no longer
needed at object destruction time, but allocating it is the responsibility
of callers.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 46 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h | 17 ++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8244a4e6c2a2..8dd7fa63f1ff 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -2,6 +2,7 @@
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 /* Copyright 2023 Collabora ltd. */
 
+#include <linux/cleanup.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -18,6 +19,14 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
 
+	/*
+	 * Label might have been allocated with kstrdup_const(),
+	 * we need to take that into account when freeing the memory
+	 */
+	kfree_const(bo->label.str);
+
+	mutex_destroy(&bo->label.lock);
+
 	drm_gem_free_mmap_offset(&bo->base.base);
 	mutex_destroy(&bo->gpuva_list_lock);
 	drm_gem_shmem_free(&bo->base);
@@ -196,6 +205,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 	obj->base.map_wc = !ptdev->coherent;
 	mutex_init(&obj->gpuva_list_lock);
 	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
+	mutex_init(&obj->label.lock);
 
 	return &obj->base.base;
 }
@@ -247,3 +257,39 @@ panthor_gem_create_with_handle(struct drm_file *file,
 
 	return ret;
 }
+
+void
+panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+	const char *old_label;
+
+	scoped_guard(mutex, &bo->label.lock) {
+		old_label = bo->label.str;
+		bo->label.str = label;
+	}
+
+	kfree_const(old_label);
+}
+
+void
+panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
+{
+	const char *str;
+
+	/* We should never attempt labelling a UM-exposed GEM object */
+	if (drm_WARN_ON(bo->obj->dev, bo->obj->handle_count > 0))
+		return;
+
+	if (!label)
+		return;
+
+	str = kstrdup_const(label, GFP_KERNEL);
+	if (!str) {
+		/* Failing to allocate memory for a label isn't a fatal condition */
+		drm_warn(bo->obj->dev, "Not enough memory to allocate BO label");
+		return;
+	}
+
+	panthor_gem_bo_set_label(bo->obj, str);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 1a363bb814f4..af0d77338860 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -46,6 +46,20 @@ struct panthor_gem_object {
 
 	/** @flags: Combination of drm_panthor_bo_flags flags. */
 	u32 flags;
+
+	/**
+	 * @label: BO tagging fields. The label can be assigned within the
+	 * driver itself or through a specific IOCTL.
+	 */
+	struct {
+		/**
+		 * @label.str: Pointer to NULL-terminated string,
+		 */
+		const char *str;
+
+		/** @lock.str: Protects access to the @label.str field. */
+		struct mutex lock;
+	} label;
 };
 
 /**
@@ -91,6 +105,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
 			       struct panthor_vm *exclusive_vm,
 			       u64 *size, u32 flags, uint32_t *handle);
 
+void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
+void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
+
 static inline u64
 panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
 {
-- 
2.48.1

