Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C81E50B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763252; cv=pass; b=EX8hZCGoUtiQ7zmiMbJGXiMKh5GPGbhjAFs/ECTVS2VQkxX31Ck7gBQOfQkvcKzcFQ9hki04bp3mcBNjtCh0X+J38hrZH6NLwBCFRMKL3LBFOVT5rZSs710zz7CnXquBSnq2JYqolat3zk7jeHR//G7ZW3AeyBrYD+Yh+yOntT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763252; c=relaxed/simple;
	bh=qFYkpMXESOJRVTwAvthEdh7DizFjBItX2l1IPn2HrPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qw0gYJnfTGkE8S9laqIIUJLgmiGtAxrngcfocJiD++ErkmoJl5e4c4QO/67vZqFGFcoFLbWD/eTKIXa5ObUTmOUlBmYKLAWTt6yAFV9tpwA0NT6EwRocweSL+bMszSPLd4pa3UbKqE3Eoxq8S/3G66zGbAwPx6XLIMhlcx5ZytQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=lVt69gPW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="lVt69gPW"
ARC-Seal: i=1; a=rsa-sha256; t=1747763235; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dRXDaQL3xgdiX1+uMTwgEMNHV5khskUVke9wjCX7svF6gfp3mgX7MimiAPA/460qA5HT/ozlVN07G22w9bw0a63f9XqA6Hb6v6l2T01iWofJmkwx7O2opCa6wgJNM9mVYv8nghPTsXCpT3CHULy0RxUAucrC1JXx4NOVwJex5eM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747763235; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2YVKibvM4pn/SlfK6+8/+mmpmflhWvyld6RbzTSuKec=; 
	b=hLVfo9Ox+AUmnrIIE9Uiq+apX+6R5baEZPWsbOdNJx4lhpqzDMkz9rVduMkcntqW41dtHcfk3OroGfXL5z+X4cHDaAxTF62zSe/5BovA3KFnolJ0UATiQgEbrO6XNMPtnD+dfOFoEyOC+9jVWbZ3nISFg2KBhFIkcD1ThGF5kxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747763235;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2YVKibvM4pn/SlfK6+8/+mmpmflhWvyld6RbzTSuKec=;
	b=lVt69gPWVsHS/eRvt6e8J7B2oI3PL97nCcCGdf7o40pLfAFnf7zgAGHZbX12JvW3
	ugQGXY0W/culZ71ZkXbO92o09iqEBSqggV7blLGicsLN9p+G/c7A3QQtVmw1klNeuSd
	jPfNAoerV9CbHfCJ84toXB46/M/fE5ygZkAloAH4=
Received: by mx.zohomail.com with SMTPS id 174776323356269.87814931864023;
	Tue, 20 May 2025 10:47:13 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Rob Herring <robh@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 1/5] drm/panfrost: Add BO labelling to Panfrost
Date: Tue, 20 May 2025 18:43:58 +0100
Message-ID: <20250520174634.353267-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250520174634.353267-1-adrian.larumbe@collabora.com>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Functions for labelling UM-exposed an internal BOs are provided. An
example of the latter would be the Perfcnt sample buffer.

This commit is done in preparation of a following one that will allow
UM to set BO labels through a new ioctl().

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 42 +++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h | 17 ++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 963f04ba2de6..4c5be7ccc9cc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/dma-buf.h>
@@ -35,6 +36,9 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 	 */
 	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
 
+	kfree_const(bo->label.str);
+	mutex_destroy(&bo->label.lock);
+
 	if (bo->sgts) {
 		int i;
 		int n_sgt = bo->base.base.size / SZ_2M;
@@ -260,6 +264,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 	mutex_init(&obj->mappings.lock);
 	obj->base.base.funcs = &panfrost_gem_funcs;
 	obj->base.map_wc = !pfdev->coherent;
+	mutex_init(&obj->label.lock);
 
 	return &obj->base.base;
 }
@@ -302,3 +307,40 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
 
 	return obj;
 }
+
+void
+panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
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
+panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	const char *str;
+
+	/* We should never attempt labelling a UM-exposed GEM object */
+	if (drm_WARN_ON(bo->base.base.dev, bo->base.base.handle_count > 0))
+		return;
+
+	if (!label)
+		return;
+
+	str = kstrdup_const(label, GFP_KERNEL);
+	if (!str) {
+		/* Failing to allocate memory for a label isn't a fatal condition */
+		drm_warn(bo->base.base.dev, "Not enough memory to allocate BO label");
+		return;
+	}
+
+	panfrost_gem_set_label(obj, str);
+}
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 7516b7ecf7fe..6c187b9b66fc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -41,6 +41,20 @@ struct panfrost_gem_object {
 	 */
 	size_t heap_rss_size;
 
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
+
 	bool noexec		:1;
 	bool is_heap		:1;
 };
@@ -89,4 +103,7 @@ void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
 int panfrost_gem_shrinker_init(struct drm_device *dev);
 void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
 
+void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
+void panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label);
+
 #endif /* __PANFROST_GEM_H__ */

base-commit: 9ff4fdf4f44b69237c0afc1d3a8dac916ce66f3e
-- 
2.48.1

