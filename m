Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD5E25334F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015854; cv=none; b=WzgTUflZMgx0RgVARiC1LIfGYFMuAwOft3gAkDgnPz3Lc450T6ho0CZwUICgnFcGG3WNLjvMTmnR0yLFVNLoFUiQeIoG90qXdAoLsKVH7eo68J39vRTIakDrXpRzDM61bxYM1PZi2moy5ZB6068QGvxEDyMsiqOVO5Pt2J6fKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015854; c=relaxed/simple;
	bh=+2yRZixQSCiIQZetZD/H/onwj/GI2xM1iSUIHFkUhr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=c4+Rl1QVFDXnbrTvY1jrrQ5vWA+xTrILBRt1mg9Yj4naYHhO4zQad8WlHKCQCj+xiYMmuaDzZmEsSryqp6cXE8y+N+YFgp5eb4CppYIDBeDVndskhfSlglkfF3oOnBMqEpLSeQfO0etyRrqVe3I7Fj4FO+RjAbIY3bZxdtwvstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=idXtt3YN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="idXtt3YN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745015851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pgvL41QdbZrb/DItLyL8hX9WAHY/XF9TJNGkmiBOQ9k=;
	b=idXtt3YNWzbt0MEkvh/eFxmVszWWJlzQ4CIknBB2/ZG4xDbcmP+dDfchVkwFK6BOM6nXs/
	QRpEJjCb0v7ABQW3E0A9vxyCzaZ0bItSQKqTgnrr+XBmncMchtuU1Y0YuihTX3p2vxQtc3
	QYieFhu5EghKTJziyhXE0VhwOUYdTOo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-41-eG8EADjgPq2JGZadomQzNg-1; Fri,
 18 Apr 2025 18:37:27 -0400
X-MC-Unique: eG8EADjgPq2JGZadomQzNg-1
X-Mimecast-MFC-AGG-ID: eG8EADjgPq2JGZadomQzNg_1745015846
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 49E7119560A6;
	Fri, 18 Apr 2025 22:37:26 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9C4D81801770;
	Fri, 18 Apr 2025 22:37:22 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	shivankg@amd.com,
	vishal.moola@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 5/5] mm/vmalloc.c: return explicit error value in alloc_vmap_area()
Date: Sat, 19 Apr 2025 06:36:53 +0800
Message-ID: <20250418223653.243436-6-bhe@redhat.com>
In-Reply-To: <20250418223653.243436-1-bhe@redhat.com>
References: <20250418223653.243436-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
indicate if the allocation is successful or failed. That is not very clear.

Here change to return explicit error values and check them to judge if
allocation is successful.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/vmalloc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 39e043ba969b..0251402ca5b9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1698,7 +1698,7 @@ va_clip(struct rb_root *root, struct list_head *head,
 			 */
 			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
 			if (!lva)
-				return -1;
+				return -ENOMEM;
 		}
 
 		/*
@@ -1712,7 +1712,7 @@ va_clip(struct rb_root *root, struct list_head *head,
 		 */
 		va->va_start = nva_start_addr + size;
 	} else {
-		return -1;
+		return -EINVAL;
 	}
 
 	if (type != FL_FIT_TYPE) {
@@ -1741,19 +1741,19 @@ va_alloc(struct vmap_area *va,
 
 	/* Check the "vend" restriction. */
 	if (nva_start_addr + size > vend)
-		return vend;
+		return -ERANGE;
 
 	/* Update the free vmap_area. */
 	ret = va_clip(root, head, va, nva_start_addr, size);
 	if (WARN_ON_ONCE(ret))
-		return vend;
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
@@ -1778,14 +1778,13 @@ __alloc_vmap_area(struct rb_root *root, struct list_head *head,
 
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
@@ -1915,7 +1914,7 @@ node_alloc(unsigned long size, unsigned long align,
 	struct vmap_area *va;
 
 	*vn_id = 0;
-	*addr = vend;
+	*addr = -EINVAL;
 
 	/*
 	 * Fallback to a global heap if not vmalloc or there
@@ -1995,20 +1994,20 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
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
-- 
2.41.0

