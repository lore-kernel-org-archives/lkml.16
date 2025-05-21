Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4721A2C1781
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860465; cv=none; b=BIcyZnACAPrQSRxfTaJDlPaMnZ83YGFJtgmlUmqD6P4GFq9QF22FhIn5FL/8652ph7obYGixtz6c6NFpkwlmYxRrfCqCuRAJlU3sndxuU9JyAHz71LDRN8uRGmnTjPyZ7AaOGqgtUEcbigJSpB9swxPRQzHRb0Gi2SX+aj/7r/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860465; c=relaxed/simple;
	bh=7fCVuftSN1aBnYJ9hYXJ+RIa/hUOPO3fR89aM9voWhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FT2gyf/u0X6WW8qTL7gRC3J/mNotD9bW1Qce3FQM33UPUs9MhyIgokhs79YpYucD9fr6FkrKV/F9pV2SwXNptOua/7Pwey39/7cDhiiVdc7md+netiD5By1J2+MRzk3bkPQEkE5JG103+DiHov5F4/6k51gwEDIf/dk9SHEot+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bHceHa0r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bHceHa0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747860463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZFnjWwVw3G9FTHb5RE01lQ8HhDpRBWEySGBEF+FoVQ=;
	b=bHceHa0r41R95IC3UoXWj8bJ5pVNPOC/ZZnZ15/Maxn2nN4cEhTQnKlLOgQAicuz0GFPHf
	PsAf2UH202Oi+5AhUoy8FnFwR3R6OfwxRj0DO4NLhyc6PuYaiT0YLujbgGNyooVZAMrE3J
	idmxut1+p5PBZb3zC0gaCHvu3zEEUcg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-363-Gsrj4wuoMHGmCvM2fLFDuA-1; Wed,
 21 May 2025 16:47:38 -0400
X-MC-Unique: Gsrj4wuoMHGmCvM2fLFDuA-1
X-Mimecast-MFC-AGG-ID: Gsrj4wuoMHGmCvM2fLFDuA_1747860456
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 744FD180036E;
	Wed, 21 May 2025 20:47:36 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 602931956066;
	Wed, 21 May 2025 20:47:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 03/12] drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem_shmem_create()
Date: Wed, 21 May 2025 16:29:10 -0400
Message-ID: <20250521204654.1610607-4-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

With gem objects in rust, the most ideal way for us to be able to handle
gem shmem object creation is to be able to handle the memory allocation of
a gem object ourselves - and then have the DRM gem shmem helpers initialize
the object we've allocated afterwards. So, let's spit out
drm_gem_shmem_init() from drm_gem_shmem_create() to allow for doing this.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 75 +++++++++++++++++---------
 include/drm/drm_gem_shmem_helper.h     |  1 +
 2 files changed, 51 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a4144e0ef67ef..f3e88fb579b52 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -48,28 +48,12 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
-static struct drm_gem_shmem_object *
-__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
-		       struct vfsmount *gemfs)
+static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem,
+				size_t size, bool private, struct vfsmount *gemfs)
 {
-	struct drm_gem_shmem_object *shmem;
-	struct drm_gem_object *obj;
+	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
 
-	size = PAGE_ALIGN(size);
-
-	if (dev->driver->gem_create_object) {
-		obj = dev->driver->gem_create_object(dev, size);
-		if (IS_ERR(obj))
-			return ERR_CAST(obj);
-		shmem = to_drm_gem_shmem_obj(obj);
-	} else {
-		shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
-		if (!shmem)
-			return ERR_PTR(-ENOMEM);
-		obj = &shmem->base;
-	}
-
 	if (!obj->funcs)
 		obj->funcs = &drm_gem_shmem_funcs;
 
@@ -81,7 +65,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
 	}
 	if (ret) {
 		drm_gem_private_object_fini(obj);
-		goto err_free;
+		return ret;
 	}
 
 	ret = drm_gem_create_mmap_offset(obj);
@@ -102,14 +86,55 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
 				     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 	}
 
-	return shmem;
-
+	return 0;
 err_release:
 	drm_gem_object_release(obj);
-err_free:
-	kfree(obj);
+	return ret;
+}
 
-	return ERR_PTR(ret);
+/**
+ * drm_gem_shmem_init - Initialize an allocated object.
+ * @dev: DRM device
+ * @obj: The allocated shmem GEM object.
+ *
+ * Returns:
+ * 0 on success, or a negative error code on failure.
+ */
+int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem, size_t size)
+{
+	return __drm_gem_shmem_init(dev, shmem, size, false, NULL);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_init);
+
+static struct drm_gem_shmem_object *
+__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
+		       struct vfsmount *gemfs)
+{
+	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_object *obj;
+	int ret = 0;
+
+	size = PAGE_ALIGN(size);
+
+	if (dev->driver->gem_create_object) {
+		obj = dev->driver->gem_create_object(dev, size);
+		if (IS_ERR(obj))
+			return ERR_CAST(obj);
+		shmem = to_drm_gem_shmem_obj(obj);
+	} else {
+		shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+		if (!shmem)
+			return ERR_PTR(-ENOMEM);
+		obj = &shmem->base;
+	}
+
+	ret = __drm_gem_shmem_init(dev, shmem, size, private, gemfs);
+	if (ret) {
+		kfree(obj);
+		return ERR_PTR(ret);
+	}
+
+	return shmem;
 }
 /**
  * drm_gem_shmem_create - Allocate an object with the given size
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index cef5a6b5a4d63..ea0785d1700a5 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -96,6 +96,7 @@ struct drm_gem_shmem_object {
 #define to_drm_gem_shmem_obj(obj) \
 	container_of(obj, struct drm_gem_shmem_object, base)
 
+int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem, size_t size);
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *dev,
 							   size_t size,
-- 
2.49.0

