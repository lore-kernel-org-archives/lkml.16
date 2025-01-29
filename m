Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1571F666B
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190578; cv=none; b=DZkRjzQM0H7UdaweWwQ5+tyjZoAUWbafjrz9mKFKFhzwPcnmjw8yfot/WiPLm4VBMlh1BuFRQyc28qP/s82vF8hgWXOghHiHVd7V/1UC1o2G+dxyK5fRwl2oLgZ72YAZxwtODaXgpN8nKTI5sY5gkgBXZaNn6PTMPVy3LEcaOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190578; c=relaxed/simple;
	bh=mj+2l4i1G3XBDhQnviHtShRy/tMInv4rlEMGBrafl7c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vCWNbVRi2da7MDbFjAwY/pcSK0jnPQMJqVJUuZ0NpHiZA6l2ByHv4rAO0oorBOn25oPHhwG8ervXR0Jq3h0VHpIYVtAET58XKbSjwW++LZ/jDriaHiC0N3YgITaKoxDcSxI4pfkcbjRg85MV8BTvkDGS5d6zZOnA25cPUif2UX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rlPJWWu3; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rlPJWWu3"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2161d5b3eb5so2659915ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190576; x=1738795376; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=St+q1DoY+42s4g4QcYXYYqTt/AeFuMkTKVQ73Ddb3Ys=;
        b=rlPJWWu3n6FCVAhoR++uebQmHGjc0z3ppJsVTsOB4qHmnhb7uln2GHADv+iEvNSJmc
         dfYzG66NnTpoJwqdj11A4fmw6gUGhQqqFOYaT0z3iEdhYYRFetjAv4CKQXlQDa+bJJxH
         igmGJTqvP6aJ3D4jePtgRwWPo89YlssEtC5lnagLoUKWO0CHgu09bFvTlYhjnWduxqE9
         HVMg7rddn1FxOPcR/CFbUUBvswxllRExL77qiNPCIX60R9UbXFAmiUxzGL0TfCKZZzOC
         OBT9v2gzseN24EUBaIwyGydhR/e6Rcjfj9zGgaD4Nuh4mhnttqT1OSWPPTZOPVe0U2cl
         UGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190576; x=1738795376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=St+q1DoY+42s4g4QcYXYYqTt/AeFuMkTKVQ73Ddb3Ys=;
        b=NkLNWjmmu4JV7WIt2CbvfABZxxB8hhHTWcTORJeyO2pHRUE/lunuTqSKwiGxkhxd6n
         Ksh0hIREd72mqb9rN3acbQXws61CetuwC8KAxegPnBtpMZjFLx9zS6aAyjfj1SNf0y3G
         ZpIRLXn0OEIw0dRPQULkRXonO70RsKdaFPqvJH4MQ6hskjxmdG50uJ9tz4i6gencqNJ3
         cTF4M6gFp5pfnkM6AplFUtSaAu1eyGFIX4LNZQtut3TAC+Km4roBlU+39r+XiDfwJlVq
         r08SZqo6kv2IodomxJzcaZ/frkC2pbrfXkw1XoAYMh5HHGMsTXD3lkBLKYguRE+l02Rf
         4vRA==
X-Forwarded-Encrypted: i=1; AJvYcCWRjkGOR9jWthGHKyY9WEEnUvOddhSi4aC/b5H9y6OIOSmqmQfccL5ebP5woh2iYQ3uw801eeFw3axBsxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgDPjWPleTcQPgzHJX89ANc7LAOsIu2zC0Ymw5V2AbQI8SJheR
	p4He7/cofzStuxD8w16JkWAv/vEK2faQmPll0qJ7O7JW+OBVcBn703K2WPeTSiX5LhKIQA==
X-Google-Smtp-Source: AGHT+IHKa9OKErOBIP4kt8mPwsrgnK1mz1JVZAjaYOuo9N5ZF7fBntLgqqGp6sxXhVo/+8TW/rd/4Vec
X-Received: from plbq8.prod.google.com ([2002:a17:903:1788:b0:216:2234:bf3e])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:298d:b0:216:3436:b87e
 with SMTP id d9443c01a7336-21dd7dff854mr91313615ad.44.1738190575742; Wed, 29
 Jan 2025 14:42:55 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:54 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-26-fvdl@google.com>
Subject: [PATCH v2 25/28] mm/cma: introduce interface for early reservations
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

It can be desirable to reserve memory in a CMA area before
it is activated, early in boot. Such reservations would
effectively be memblock allocations, but they can be
returned to the CMA area later. This functionality can
be used to allow hugetlb bootmem allocations from a
hugetlb CMA area.

A new interface, cma_reserve_early is introduced. This allows
for pageblock-aligned reservations. These reservations are
skipped during the initial handoff of pages in a CMA area
to the buddy allocator. The caller is responsible for making
sure that the page structures are set up, and that the migrate
type is set correctly, as with other memblock allocations that
stick around. If the CMA area fails to activate (because it
intersects with multiple zones), the reserved memory is not
given to the buddy allocator, the caller needs to take care
of that.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/cma.c      | 83 ++++++++++++++++++++++++++++++++++++++++++++++-----
 mm/cma.h      |  8 +++++
 mm/internal.h | 16 ++++++++++
 mm/mm_init.c  |  9 ++++++
 4 files changed, 109 insertions(+), 7 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 41248dee7197..2b1e264e4e99 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -144,9 +144,10 @@ bool cma_validate_zones(struct cma *cma)
 
 static void __init cma_activate_area(struct cma *cma)
 {
-	unsigned long pfn, base_pfn;
+	unsigned long pfn, end_pfn;
 	int allocrange, r;
 	struct cma_memrange *cmr;
+	unsigned long bitmap_count, count;
 
 	for (allocrange = 0; allocrange < cma->nranges; allocrange++) {
 		cmr = &cma->ranges[allocrange];
@@ -161,8 +162,13 @@ static void __init cma_activate_area(struct cma *cma)
 
 	for (r = 0; r < cma->nranges; r++) {
 		cmr = &cma->ranges[r];
-		base_pfn = cmr->base_pfn;
-		for (pfn = base_pfn; pfn < base_pfn + cmr->count;
+		if (cmr->early_pfn != cmr->base_pfn) {
+			count = cmr->early_pfn - cmr->base_pfn;
+			bitmap_count = cma_bitmap_pages_to_bits(cma, count);
+			bitmap_set(cmr->bitmap, 0, bitmap_count);
+		}
+
+		for (pfn = cmr->early_pfn; pfn < cmr->base_pfn + cmr->count;
 		     pfn += pageblock_nr_pages)
 			init_cma_reserved_pageblock(pfn_to_page(pfn));
 	}
@@ -173,6 +179,7 @@ static void __init cma_activate_area(struct cma *cma)
 	INIT_HLIST_HEAD(&cma->mem_head);
 	spin_lock_init(&cma->mem_head_lock);
 #endif
+	set_bit(CMA_ACTIVATED, &cma->flags);
 
 	return;
 
@@ -184,9 +191,8 @@ static void __init cma_activate_area(struct cma *cma)
 	if (!test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags)) {
 		for (r = 0; r < allocrange; r++) {
 			cmr = &cma->ranges[r];
-			for (pfn = cmr->base_pfn;
-			     pfn < cmr->base_pfn + cmr->count;
-			     pfn++)
+			end_pfn = cmr->base_pfn + cmr->count;
+			for (pfn = cmr->early_pfn; pfn < end_pfn; pfn++)
 				free_reserved_page(pfn_to_page(pfn));
 		}
 	}
@@ -290,6 +296,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 		return ret;
 
 	cma->ranges[0].base_pfn = PFN_DOWN(base);
+	cma->ranges[0].early_pfn = PFN_DOWN(base);
 	cma->ranges[0].count = cma->count;
 	cma->nranges = 1;
 	cma->nid = NUMA_NO_NODE;
@@ -509,6 +516,7 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 		    nr, (u64)mlp->base, (u64)mlp->base + size);
 		cmrp = &cma->ranges[nr++];
 		cmrp->base_pfn = PHYS_PFN(mlp->base);
+		cmrp->early_pfn = cmrp->base_pfn;
 		cmrp->count = size >> PAGE_SHIFT;
 
 		sizeleft -= size;
@@ -540,7 +548,6 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 		pr_info("Reserved %lu MiB in %d range%s\n",
 			(unsigned long)total_size / SZ_1M, nr,
 			nr > 1 ? "s" : "");
-
 	return ret;
 }
 
@@ -1044,3 +1051,65 @@ bool cma_intersects(struct cma *cma, unsigned long start, unsigned long end)
 
 	return false;
 }
+
+/*
+ * Very basic function to reserve memory from a CMA area that has not
+ * yet been activated. This is expected to be called early, when the
+ * system is single-threaded, so there is no locking. The alignment
+ * checking is restrictive - only pageblock-aligned areas
+ * (CMA_MIN_ALIGNMENT_BYTES) may be reserved through this function.
+ * This keeps things simple, and is enough for the current use case.
+ *
+ * The CMA bitmaps have not yet been allocated, so just start
+ * reserving from the bottom up, using a PFN to keep track
+ * of what has been reserved. Unreserving is not possible.
+ *
+ * The caller is responsible for initializing the page structures
+ * in the area properly, since this just points to memblock-allocated
+ * memory. The caller should subsequently use init_cma_pageblock to
+ * set the migrate type and CMA stats  the pageblocks that were reserved.
+ *
+ * If the CMA area fails to activate later, memory obtained through
+ * this interface is not handed to the page allocator, this is
+ * the responsibility of the caller (e.g. like normal memblock-allocated
+ * memory).
+ */
+void __init *cma_reserve_early(struct cma *cma, unsigned long size)
+{
+	int r;
+	struct cma_memrange *cmr;
+	unsigned long available;
+	void *ret = NULL;
+
+	if (!cma || !cma->count)
+		return NULL;
+	/*
+	 * Can only be called early in init.
+	 */
+	if (test_bit(CMA_ACTIVATED, &cma->flags))
+		return NULL;
+
+	if (!IS_ALIGNED(size, CMA_MIN_ALIGNMENT_BYTES))
+		return NULL;
+
+	if (!IS_ALIGNED(size, (PAGE_SIZE << cma->order_per_bit)))
+		return NULL;
+
+	size >>= PAGE_SHIFT;
+
+	if (size > cma->available_count)
+		return NULL;
+
+	for (r = 0; r < cma->nranges; r++) {
+		cmr = &cma->ranges[r];
+		available = cmr->count - (cmr->early_pfn - cmr->base_pfn);
+		if (size <= available) {
+			ret = phys_to_virt(PFN_PHYS(cmr->early_pfn));
+			cmr->early_pfn += size;
+			cma->available_count -= size;
+			return ret;
+		}
+	}
+
+	return ret;
+}
diff --git a/mm/cma.h b/mm/cma.h
index bddc84b3cd96..df7fc623b7a6 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -16,9 +16,16 @@ struct cma_kobject {
  * and the total amount of memory requested, while smaller than the total
  * amount of memory available, is large enough that it doesn't fit in a
  * single physical memory range because of memory holes.
+ *
+ * Fields:
+ *   @base_pfn: physical address of range
+ *   @early_pfn: first PFN not reserved through cma_reserve_early
+ *   @count: size of range
+ *   @bitmap: bitmap of allocated (1 << order_per_bit)-sized chunks.
  */
 struct cma_memrange {
 	unsigned long base_pfn;
+	unsigned long early_pfn;
 	unsigned long count;
 	unsigned long *bitmap;
 #ifdef CONFIG_CMA_DEBUGFS
@@ -58,6 +65,7 @@ enum cma_flags {
 	CMA_RESERVE_PAGES_ON_ERROR,
 	CMA_ZONES_VALID,
 	CMA_ZONES_INVALID,
+	CMA_ACTIVATED,
 };
 
 extern struct cma cma_areas[MAX_CMA_AREAS];
diff --git a/mm/internal.h b/mm/internal.h
index 63fda9bb9426..8318c8e6e589 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -848,6 +848,22 @@ void init_cma_reserved_pageblock(struct page *page);
 
 #endif /* CONFIG_COMPACTION || CONFIG_CMA */
 
+struct cma;
+
+#ifdef CONFIG_CMA
+void *cma_reserve_early(struct cma *cma, unsigned long size);
+void init_cma_pageblock(struct page *page);
+#else
+static inline void *cma_reserve_early(struct cma *cma, unsigned long size)
+{
+	return NULL;
+}
+static inline void init_cma_pageblock(struct page *page)
+{
+}
+#endif
+
+
 int find_suitable_fallback(struct free_area *area, unsigned int order,
 			int migratetype, bool only_stealable, bool *can_steal);
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index f7d5b4fe1ae9..f31260fd393e 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2263,6 +2263,15 @@ void __init init_cma_reserved_pageblock(struct page *page)
 	adjust_managed_page_count(page, pageblock_nr_pages);
 	page_zone(page)->cma_pages += pageblock_nr_pages;
 }
+/*
+ * Similar to above, but only set the migrate type and stats.
+ */
+void __init init_cma_pageblock(struct page *page)
+{
+	set_pageblock_migratetype(page, MIGRATE_CMA);
+	adjust_managed_page_count(page, pageblock_nr_pages);
+	page_zone(page)->cma_pages += pageblock_nr_pages;
+}
 #endif
 
 void set_zone_contiguous(struct zone *zone)
-- 
2.48.1.262.g85cc9f2d1e-goog

