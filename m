Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2232620371B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512339; cv=none; b=rgOC8nNyre0FUCy+r7GLSmMTDtFvb64Jzg/Bgvfihzk9oth2fLCknzf6KVhmEhRB8jnvU6CVk5bOLpCBG2rDEK7HNl2h4Dl2T5GvpFyaspFJ8nY+Iq93pOSYIRrUpKToyFLmKIiuGbAda3bbfdETvJdgIfxe6B174DuCF52csNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512339; c=relaxed/simple;
	bh=wTp6xQDqIlx7EHt+MrZ6M1ijSjBcxbudgReH1AQ0UUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CW+WLa2XanKqJS9VOCyLygvWJcZxnzBrbEaKN2+uTxqwxjsI8JZxoYPwiuXd7Qy18Mq5vShq/xI2gJFL8vWIEaxGDCxrI2pnEu9htM9u8o08NB5RBWYnWzcgz4tiXm+roMpGiPwfz+MmliHBMXz+aHDsy4BWqzr8+t3IBqe6Mg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TbUyIjNq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TbUyIjNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743512337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4TyWLMM7H6aXWlkkKdABqYzULjG/pMP6bPbfcdsccY=;
	b=TbUyIjNqZBd+v/tyFvSbLa6x2005JnAnQNzrgDKsovXG4+/CNAvzC1ALVtCl6Dkv2lVFbi
	E0GiVu2PA65iaxysASDBe9Af3hOdai2ikKOJV2HoBDbwYhfiva0n7hEuAGMTQXGIAvPqIX
	Mcr9khroY25nv2ZztCAds2Erafdx62s=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-H1Nvd6YqNKacleIYUVl8Gg-1; Tue,
 01 Apr 2025 08:58:54 -0400
X-MC-Unique: H1Nvd6YqNKacleIYUVl8Gg-1
X-Mimecast-MFC-AGG-ID: H1Nvd6YqNKacleIYUVl8Gg_1743512333
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3154D1801A1A;
	Tue,  1 Apr 2025 12:58:53 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.32.206])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6521D1956094;
	Tue,  1 Apr 2025 12:58:49 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v6 4/8] drm/i915/gem: Add i915_gem_object_panic_map()
Date: Tue,  1 Apr 2025 14:51:10 +0200
Message-ID: <20250401125818.333033-5-jfalempe@redhat.com>
In-Reply-To: <20250401125818.333033-1-jfalempe@redhat.com>
References: <20250401125818.333033-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Prepare the work for drm_panic support. This is used to map the
current framebuffer, so the CPU can overwrite it with the panic
message.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v5:
 * Use iosys_map for intel_bo_panic_map().

 drivers/gpu/drm/i915/display/intel_bo.c    |  5 ++++
 drivers/gpu/drm/i915/display/intel_bo.h    |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 29 ++++++++++++++++++++++
 drivers/gpu/drm/xe/display/intel_bo.c      | 10 ++++++++
 5 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
index fbd16d7b58d9..ac904e9ec7d5 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_bo.c
@@ -57,3 +57,8 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 {
 	i915_debugfs_describe_obj(m, to_intel_bo(obj));
 }
+
+void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	i915_gem_object_panic_map(to_intel_bo(obj), map);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
index ea7a2253aaa5..5b6c63d99786 100644
--- a/drivers/gpu/drm/i915/display/intel_bo.h
+++ b/drivers/gpu/drm/i915/display/intel_bo.h
@@ -23,5 +23,6 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
 						   struct intel_frontbuffer *front);
 
 void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
+void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map);
 
 #endif /* __INTEL_BO__ */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index a5f34542135c..b16092707ea5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -692,6 +692,8 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
 int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
 int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
 
+void i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map);
+
 /**
  * i915_gem_object_pin_map - return a contiguous mapping of the entire object
  * @obj: the object to map into kernel address space
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 8780aa243105..718bea6474d7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -355,6 +355,35 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 	return vaddr ?: ERR_PTR(-ENOMEM);
 }
 
+/* Map the current framebuffer for CPU access. Called from panic handler, so no
+ * need to pin or cleanup.
+ */
+void i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map)
+{
+	enum i915_map_type has_type;
+	void *ptr;
+
+	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
+
+
+	if (!ptr) {
+		if (i915_gem_object_has_struct_page(obj))
+			ptr = i915_gem_object_map_page(obj, I915_MAP_WB);
+		else
+			ptr = i915_gem_object_map_pfn(obj, I915_MAP_WB);
+
+		if (IS_ERR(ptr))
+			return;
+
+		obj->mm.mapping = page_pack_bits(ptr, I915_MAP_WB);
+	}
+
+	if (i915_gem_object_has_iomem(obj))
+		iosys_map_set_vaddr_iomem(map, (void __iomem *) ptr);
+	else
+		iosys_map_set_vaddr(map, ptr);
+}
+
 /* get, pin, and map the pages of the object into kernel space */
 void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 			      enum i915_map_type type)
diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 27437c22bd70..c68166a64336 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -59,3 +59,13 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
 {
 	/* FIXME */
 }
+
+void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+	int ret;
+
+	ret = ttm_bo_vmap(&bo->ttm, map);
+	if (ret)
+		iosys_map_clear(map);
+}
-- 
2.49.0

