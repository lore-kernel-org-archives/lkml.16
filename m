Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A11DE891
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867919; cv=none; b=K58SLZSfvkfnBiabnvGp8Td0ScLqC/x3FmJBeKrZw9k2NNykYWbjpnZSv3NMeF9mtG5dkDIQ+9cV5wZw8sVRikgF/Vr/aYY5AsuBdVv5ZYjqcK4DFYZHlCTpm2NH/kSRZDiX0RWtXHnaMp0X6MfEHv2HEOL63cGEB99LqqHxQ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867919; c=relaxed/simple;
	bh=D84483NlqV10bmFK5GBS+2bbvCjzLXYijg3lhqp9c80=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JIvrbYSx9G0T1sVmILTGGrqR0ELvDEzmtuoDPbKU8JjOVngK9shMIh+RlBeJpWvSasf5SjsvZS1kNwabk+td7LXcHzTAz6tie4zJjOQ/Tge5Tszef/djWo3Az7R2NN2lcls8OxUPAWE6TnE1cls85k80SvhH1x+WX95ZiwZxK8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VVp1kCih; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VVp1kCih"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f9c02f54f2so2487215a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867917; x=1739472717; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Os2cqKctxCUcRS8FYnguBqsdmbx6qbrypyMDT5BCAmU=;
        b=VVp1kCih/33NfGc9NvoHBgP34y9/V09lG9sQWBdJDoBhqBh5m6l4WB/ZtarFkTfp+2
         bggaHXXgeWA+s57SWoJtlkrmFaSlBKoyBWuacFZWdV2Qb43XotqT8tgItEHWDyAr9XMj
         Iks98uGz11oPlHoIlR+1VVCPlfOUQRek31xHd0V3N2FMf97SXLvjTUGksZHSnOkedliC
         6bKV9j8AGdBEz+7069V/CeDG9TjcEGHKanOWKv0g3PQpcRfMRtCsyZS1YxMfRxXpByqd
         6ym+VjtUrndeiTQXXPTZgdx99Q0VNwNYvDRC+ghcAPkz7r4LAlgk51LYax7th8OnCaQP
         QoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867917; x=1739472717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Os2cqKctxCUcRS8FYnguBqsdmbx6qbrypyMDT5BCAmU=;
        b=niKpG9nI7qxVR2F2GesMt1gC0jvP+XKPfzUsJmcCyzgHErxpPfwBoAkRsjbb4rbgEn
         UwVCiY3a9qv44M2oFuJGVVNZWhe2Iz8w4DyL0CWqNg6IteRYG0Gke5krhOf/dvUHMjjH
         nTiWj48LJe2pssRI3RQ64lMjFMS3+bXzQeYU8xRFPDFpI8I3FnK4xNVpGCwN8F7M/GTW
         S0sn/bKIxQjusPRpjLG+4AeBwwZyGuKkQWgKxPREh8ngcMrB129ONrJNjWqOQDd9X5ov
         Wc5fUI5ECjNVCJhmNrRlrIX8kGKeLZAfcm7QcQhcS1aUbGSElao2uUpj5uczkqahogOr
         RORQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5wBSxgeELWCw7ZpLAPicyHjMwXl40fJbLzCkWmMuTI5qeto9RD6HUNsNGWIbNpoKZ4U3AtE5mx1QB8fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTzq2H0BSG+CM5YSOL9dLr2yLiVvyGuo8WnGPCOJczGyDGrqCE
	G25xwhY6Tza91IQWmO8oppZcqlxoqDXvP/FKSYZIUhGF+I0tKv3zCnkxsYxg+2t6PQ8GuQ==
X-Google-Smtp-Source: AGHT+IHVX/1oNg+jUxgfnaihB0fSHJ3u8Hg2NHEhvkhZ5xKtCbM1RyTOrbuLCZ62fn2ArYVFlFmi+NRu
X-Received: from pfmb20.prod.google.com ([2002:a05:6a00:1154:b0:730:4a3b:49ca])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:420b:b0:725:e499:5b8a
 with SMTP id d2e1a72fcca58-7305d505b69mr532061b3a.15.1738867917188; Thu, 06
 Feb 2025 10:51:57 -0800 (PST)
Date: Thu,  6 Feb 2025 18:51:05 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-26-fvdl@google.com>
Subject: [PATCH v3 25/28] mm/cma: introduce interface for early reservations
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
index 4388d941d381..34a4df29af72 100644
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
 
@@ -1034,3 +1041,65 @@ bool cma_intersects(struct cma *cma, unsigned long start, unsigned long end)
 
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
2.48.1.502.g6dc24dfdaf-goog

