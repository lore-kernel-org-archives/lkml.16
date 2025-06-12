Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB93D221FD0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716082; cv=none; b=gEMS1MQa95OuEMqJsc1p1ssIZGhwpG4+DlKeW1c9hwYNjIhn3X4ol49yRD7MLR1FKdxZMOZx14Q9jok7Cl9I7PfO4IdyQk+lxFKWBU+2keLdLo5VV4roks50Px6PmZxGs6kLcFInqWwF2ZHDajYfTOXF3vABg5rVdB8i/aynAic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716082; c=relaxed/simple;
	bh=0oOg7210SFzStA4/3TI35O9uENr9EgDOkuPXXpfuFSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUCgGAetd0OLG7IzE2dcXKM0Afs9iSXw9bjTaHsLaSH1JPA++xdTw6NRJj45m7Qvl9XkSRFG3APtaWeYKcbQ3yfhq6NkZBj6py6ke9tQcFIzdoTvssTUlUDuMdSOzmQH6cqpKcovFNOUX/LdIp+cB/iJC2/e6jpHdyms8MVD/LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i7n/sPa/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i7n/sPa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749716079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=op6yZi8gjaz8CYcR0tRXeH7WdigIv+3VKO+jEmvCYd0=;
	b=i7n/sPa/M3PFzUtASLKvGxmlc9p4A1VrsJ5frQeCp0AekV0zmUqDrN77Fx47VofV5RRsuc
	4mTmdzXqhlBQazIU71+p6qjPIUKJSP+XqKAagwTpUiGwvIHM9JpBPp6zZi2Xt+XqdaCjxq
	wTDESIa61cevItkmuz45kSi2x7oV7Vo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-UF7EwL89PXG_GZHw_z2lsQ-1; Thu,
 12 Jun 2025 04:14:33 -0400
X-MC-Unique: UF7EwL89PXG_GZHw_z2lsQ-1
X-Mimecast-MFC-AGG-ID: UF7EwL89PXG_GZHw_z2lsQ_1749716071
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28569195608E;
	Thu, 12 Jun 2025 08:14:31 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.28])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C465195609D;
	Thu, 12 Jun 2025 08:14:25 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v9 4/9] drm/ttm: Add ttm_bo_kmap_try_from_panic()
Date: Thu, 12 Jun 2025 10:01:01 +0200
Message-ID: <20250612081344.225200-5-jfalempe@redhat.com>
In-Reply-To: <20250612081344.225200-1-jfalempe@redhat.com>
References: <20250612081344.225200-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

If the ttm bo is backed by pages, then it's possible to safely kmap
one page at a time, using kmap_try_from_panic().
Unfortunately there is no way to do the same with ioremap, so it
only supports the kmap case.
This is needed for proper drm_panic support with xe driver.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v8:
 * Added in v8

v9:
 * Fix comment in ttm_bo_kmap_try_from_panic(), this can *only* be called
   from the panic handler (Christian König)

 drivers/gpu/drm/ttm/ttm_bo_util.c | 27 +++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo.h          |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 15cab9bda17f..6912e6dfda25 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -377,6 +377,33 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 	return (!map->virtual) ? -ENOMEM : 0;
 }
 
+/**
+ *
+ * ttm_bo_kmap_try_from_panic
+ *
+ * @bo: The buffer object
+ * @page: The page to map
+ *
+ * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
+ * This should only be called from the panic handler, if you make sure the bo
+ * is the one being displayed, so is properly allocated, and protected.
+ *
+ * Returns the vaddr, that you can use to write to the bo, and that you should
+ * pass to kunmap_local() when you're done with this page, or NULL if the bo
+ * is in iomem.
+ */
+void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
+{
+	if (page + 1 > PFN_UP(bo->resource->size))
+		return NULL;
+
+	if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
+		return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
+
+	return NULL;
+}
+EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
+
 /**
  * ttm_bo_kmap
  *
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index cf027558b6db..8c0ce3fa077f 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -429,6 +429,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
 		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
 void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
+void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page);
 int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
-- 
2.49.0

