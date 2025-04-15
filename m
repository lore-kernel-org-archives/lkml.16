Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570C8214A88
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684828; cv=none; b=AkCFfIb7uK15JvY4WElyWRD4EhF9u8s3Z77hoCmWKy1e2vBZzZT5QV1g9qpQsP8lWxOwn3prb2XT28nTDXBODytNs0DU0TF+2Nii0Unvq/lU6TlSEuAdKfFUjkwBf21q4vjZaD1H54MKyeYme61WRjLLwkEGoRXridEg37Q0HKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684828; c=relaxed/simple;
	bh=kRf/FD/ltZZPe2Hd0lOVAHpWrJdUO97fnrcz2lxv6/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=IIYQta3FYz1r89Vbxymm/uB0cKmSPNvnSnxkQrwkci4xT1Qvrbem0AKh6KeoBNT8MFD497UgGLcgTGeQxXQuM9jpU25NA/0nUED4PLwBFJvwAJZD+6xE2wxThdJFcF3ZRUUMMb1QSPS1hXDkfjixkgNhmscjQLlinjId3+WjpgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zr59qvX8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zr59qvX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744684825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiTd6gkzO3xlq1GH+oaUM8JNSi1IBXTiwuoOQeUrUeY=;
	b=Zr59qvX8NIKXbhpU1E4CTs3JBRXVbN0dQf4Ssh3ALIakcExw397CgBtgiFbolJCh1X6vu0
	aWjVYeicwkyqtsffnh5hod6NCEc0kYuidtq2Bshzqs8MoV6GH1L0xH3PSqTyeaDXscoWKM
	fLrAK/OMJkgyEWclZ2DxxrxJAhlWaxg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-QAQo5PuTOp6H9Q-QuYLKpw-1; Mon,
 14 Apr 2025 22:40:19 -0400
X-MC-Unique: QAQo5PuTOp6H9Q-QuYLKpw-1
X-Mimecast-MFC-AGG-ID: QAQo5PuTOp6H9Q-QuYLKpw_1744684818
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AEAC19560B3;
	Tue, 15 Apr 2025 02:40:18 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6F3B8180AF7C;
	Tue, 15 Apr 2025 02:40:15 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 5/5] mm/vmalloc.c: return explicit error value in alloc_vmap_area()
Date: Tue, 15 Apr 2025 10:39:52 +0800
Message-ID: <20250415023952.27850-6-bhe@redhat.com>
In-Reply-To: <20250415023952.27850-1-bhe@redhat.com>
References: <20250415023952.27850-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
indicate if the allocation is successful or failed. That is not very clear.

Here change to return explicit error values and check them to judge if
allocation is successful.

IS_ERR_VALUE already uses unlikely() internally

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/vmalloc.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3f38a232663b..5b21cd09b2b4 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1715,7 +1715,7 @@ va_clip(struct rb_root *root, struct list_head *head,
 			 */
 			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
 			if (!lva)
-				return -1;
+				return -ENOMEM;
 		}
 
 		/*
@@ -1729,7 +1729,7 @@ va_clip(struct rb_root *root, struct list_head *head,
 		 */
 		va->va_start = nva_start_addr + size;
 	} else {
-		return -1;
+		return -EINVAL;
 	}
 
 	if (type != FL_FIT_TYPE) {
@@ -1758,19 +1758,19 @@ va_alloc(struct vmap_area *va,
 
 	/* Check the "vend" restriction. */
 	if (nva_start_addr + size > vend)
-		return vend;
+		return -ERANGE;
 
 	/* Update the free vmap_area. */
 	ret = va_clip(root, head, va, nva_start_addr, size);
-	if (WARN_ON_ONCE(ret))
-		return vend;
+	if (ret)
+		return ret;
 
 	return nva_start_addr;
 }
 
 /*
  * Returns a start address of the newly allocated area, if success.
- * Otherwise a vend is returned that indicates failure.
+ * Otherwise an error value is returned that indicates failure.
  */
 static __always_inline unsigned long
 __alloc_vmap_area(struct rb_root *root, struct list_head *head,
@@ -1795,14 +1795,13 @@ __alloc_vmap_area(struct rb_root *root, struct list_head *head,
 
 	va = find_vmap_lowest_match(root, size, align, vstart, adjust_search_size);
 	if (unlikely(!va))
-		return vend;
+		return -ENOENT;
 
 	nva_start_addr = va_alloc(va, root, head, size, align, vstart, vend);
-	if (nva_start_addr == vend)
-		return vend;
 
 #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
-	find_vmap_lowest_match_check(root, head, size, align);
+	if (!IS_ERR_VALUE(nva_start_addr))
+		find_vmap_lowest_match_check(root, head, size, align);
 #endif
 
 	return nva_start_addr;
@@ -1932,7 +1931,7 @@ node_alloc(unsigned long size, unsigned long align,
 	struct vmap_area *va;
 
 	*vn_id = 0;
-	*addr = vend;
+	*addr = -EINVAL;
 
 	/*
 	 * Fallback to a global heap if not vmalloc or there
@@ -2012,20 +2011,20 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	}
 
 retry:
-	if (addr == vend) {
+	if (IS_ERR_VALUE(addr)) {
 		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
 		addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
 			size, align, vstart, vend);
 		spin_unlock(&free_vmap_area_lock);
 	}
 
-	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
+	trace_alloc_vmap_area(addr, size, align, vstart, vend, IS_ERR_VALUE(addr));
 
 	/*
-	 * If an allocation fails, the "vend" address is
+	 * If an allocation fails, the error value is
 	 * returned. Therefore trigger the overflow path.
 	 */
-	if (unlikely(addr == vend))
+	if (IS_ERR_VALUE(addr))
 		goto overflow;
 
 	va->va_start = addr;
@@ -4753,9 +4752,10 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 
 		ret = va_clip(&free_vmap_area_root,
 			&free_vmap_area_list, va, start, size);
-		if (WARN_ON_ONCE(unlikely(ret)))
-			/* It is a BUG(), but trigger recovery instead. */
+		if ((unlikely(ret))) {
+			WARN_ONCE(1, "%s error: errno (%d)\n", __func__, ret);
 			goto recovery;
+		}
 
 		/* Allocated area. */
 		va = vas[area];
-- 
2.41.0

