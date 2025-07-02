Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6ED2571BD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453378; cv=none; b=eM2hL3C2o0ipw4faphaUFLmTvr63xqpHefN1kFA69e8FpJYEJzyMuWg65YAr7FyEmZTs5KGxngkF7eGu62karJ+c5CpQtMqETPIlPgJM6i0ZjbDZiahGX7UulMWg10EN1a6QiK48orjfJC+l1M1/8qcXBVzDDSehkEy+PH+gbe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453378; c=relaxed/simple;
	bh=EB1ODOYm0doluo9SmRJUpo62bm3CObYhBVAFw5pWSRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyVsANu1Z1Y/EngH0cfuGB9nyXnWVBkv6Wgs69sgRZqTim5WbbKQ5HOEuG4r5DASCioWIEg3zQDB3Pu7UT43EsLIhmwznDzDdTUKdt+O4wPSuELVCPneOAZbV6p5u8Upb4xpe3dZjavRDxfmpDg4yM2jN6a/nkF/s8Hz7ywDsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YHPsLoFw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YHPsLoFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751453375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/J+W0F15YhPX18Zq/VlVVl9dXxQqgtke2+o/p/5jgRs=;
	b=YHPsLoFwRqg5/FZRTqmKEQhc+ZygMKwoRZ1IX0mhIXWGSFGrDl40fldGw2jRAa6pLppd5+
	6EunFqHHtz0iIWeMU+S7uiktVm38hioq6QTxHky5DBgQIEsJtDEityQYekJyGyqtmxinYW
	jO0bn9nse48SbhkdeQ5+X7HatPlkcwk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-TTb8MWACPn6W3DiVRtmCNQ-1; Wed, 02 Jul 2025 06:49:33 -0400
X-MC-Unique: TTb8MWACPn6W3DiVRtmCNQ-1
X-Mimecast-MFC-AGG-ID: TTb8MWACPn6W3DiVRtmCNQ_1751453372
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso33580395e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453371; x=1752058171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J+W0F15YhPX18Zq/VlVVl9dXxQqgtke2+o/p/5jgRs=;
        b=aULxQQ0iHTpiOUocEezEQHQdr5WEt64wmikfhMagMmGKeWWhoyJ5jtIBd3uvK//Tur
         3JpsHZr220BfkSCUdSl8/7wA+OvwzITEIeWgNvKdHPPHCTwGDZDGd+7xlpvtnKA9oXnD
         nRvUWrSHqYvOME2qqUjezThuyiNt7vdM37uKxuIDm9Xbok1K7l3Jal3TmxXMm+g0WkTY
         8N1SS2vkL1Q4xVwZYa7tdRo15yDa3U8wt5ZUA9gIGRV+gIqieUUPH9X/1ftd+MC449fu
         SgQmXgT9mi6NIk4rfHhT35GOkGxghwcX5XG5dkzRaJQfaEGjIquZpta/VbqGj+XcWdAk
         /rYw==
X-Gm-Message-State: AOJu0YwYOrISEg6gov64POhVFxDFfqG4Gs4JBqAfyvhIonRr2jzfyk8N
	s7uumDYt+bvkeJOI7LeK34/0tBzzMXFhXMOkeRuPSM6NNt9hdZPkvnbX6Bw0IpCdsJD9eczgIk7
	98qGudXXvYdySrJJ8VkViKSVJ58ia/bUPh5w88CHmngK6GQRlf+f5M4ppagutBUUY8yWCmWy39a
	GwcbdstqSWSKrNvtKZZ9q2YmYvGnk/RMKtDdj+QwtJ4U9THexx
X-Gm-Gg: ASbGncssHaYc8GQKyC14jhYp/ms73bR/FIkrvhVebNC3LH/kra78Do7RMlYErZ8ATLp
	4G/iLkkh643CPzqJAl7QK4nfz06yde0bvs9rar4RiEz+2Swa31IktYNUSjfqP/Yfu4caREf7vke
	YO4AyQY9oZUOeQc6ynIkwIhkvyrGMG4qEHnjteCfZWD2OM0FhQEDdTCYYZzdC4ECSTeuq30Byuk
	F38eN1iK/HnJT06c0pzmsj+gzaNI4M2HH5DP9GuQi7G/dgaSyvuFm6vCOimSDeomSyjZF05LjAd
	mp+i1yaEg6VnSSEW
X-Received: by 2002:a05:600c:c176:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-454a41609efmr20817315e9.13.1751453371424;
        Wed, 02 Jul 2025 03:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPxIF24NU0cgA7LgQoEvYVTqVBLrm0QWneoTQ4N5UtqQayGKXh6ikNCsFoGZpvs78Obi1muw==
X-Received: by 2002:a05:600c:c176:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-454a41609efmr20816655e9.13.1751453370775;
        Wed, 02 Jul 2025 03:49:30 -0700 (PDT)
Received: from localhost ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52ebcsm15430008f8f.46.2025.07.02.03.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:49:30 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Lance Yang <ioworker0@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v2 1/4] mm: convert FPB_IGNORE_* into FPB_RESPECT_*
Date: Wed,  2 Jul 2025 12:49:23 +0200
Message-ID: <20250702104926.212243-2-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702104926.212243-1-david@redhat.com>
References: <20250702104926.212243-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Respecting these PTE bits is the exception, so let's invert the meaning.

With this change, most callers don't have to pass any flags. This is
a preparation for splitting folio_pte_batch() into a non-inlined
variant that doesn't consume any flags.

Long-term, we want folio_pte_batch() to probably ignore most common
PTE bits (e.g., write/dirty/young/soft-dirty) that are not relevant for
most page table walkers: uffd-wp and protnone might be bits to consider in
the future. Only walkers that care about them can opt-in to respect them.

No functional change intended.

Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h  | 16 ++++++++--------
 mm/madvise.c   |  3 +--
 mm/memory.c    | 11 +++++------
 mm/mempolicy.c |  4 +---
 mm/mlock.c     |  3 +--
 mm/mremap.c    |  3 +--
 mm/rmap.c      |  3 +--
 7 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index e84217e27778d..170d55b6851ff 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -202,17 +202,17 @@ static inline void vma_close(struct vm_area_struct *vma)
 /* Flags for folio_pte_batch(). */
 typedef int __bitwise fpb_t;
 
-/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
-#define FPB_IGNORE_DIRTY		((__force fpb_t)BIT(0))
+/* Compare PTEs respecting the dirty bit. */
+#define FPB_RESPECT_DIRTY		((__force fpb_t)BIT(0))
 
-/* Compare PTEs after pte_clear_soft_dirty(), ignoring the soft-dirty bit. */
-#define FPB_IGNORE_SOFT_DIRTY		((__force fpb_t)BIT(1))
+/* Compare PTEs respecting the soft-dirty bit. */
+#define FPB_RESPECT_SOFT_DIRTY		((__force fpb_t)BIT(1))
 
 static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 {
-	if (flags & FPB_IGNORE_DIRTY)
+	if (!(flags & FPB_RESPECT_DIRTY))
 		pte = pte_mkclean(pte);
-	if (likely(flags & FPB_IGNORE_SOFT_DIRTY))
+	if (likely(!(flags & FPB_RESPECT_SOFT_DIRTY)))
 		pte = pte_clear_soft_dirty(pte);
 	return pte_wrprotect(pte_mkold(pte));
 }
@@ -236,8 +236,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  * pages of the same large folio.
  *
  * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
- * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
- * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
+ * the accessed bit, writable bit, dirty bit (unless FPB_RESPECT_DIRTY is set)
+ * and soft-dirty bit (unless FPB_RESPECT_SOFT_DIRTY is set).
  *
  * start_ptep must map any page of the folio. max_nr must be at least one and
  * must be limited by the caller so scanning cannot exceed a single page table.
diff --git a/mm/madvise.c b/mm/madvise.c
index e61e32b2cd91f..661bb743d2216 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -347,10 +347,9 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 					  pte_t pte, bool *any_young,
 					  bool *any_dirty)
 {
-	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	int max_nr = (end - addr) / PAGE_SIZE;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
+	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
 			       any_young, any_dirty);
 }
 
diff --git a/mm/memory.c b/mm/memory.c
index 0f9b32a20e5b7..0a47583ca9937 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -990,10 +990,10 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 	 * by keeping the batching logic separate.
 	 */
 	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
-		if (src_vma->vm_flags & VM_SHARED)
-			flags |= FPB_IGNORE_DIRTY;
-		if (!vma_soft_dirty_enabled(src_vma))
-			flags |= FPB_IGNORE_SOFT_DIRTY;
+		if (!(src_vma->vm_flags & VM_SHARED))
+			flags |= FPB_RESPECT_DIRTY;
+		if (vma_soft_dirty_enabled(src_vma))
+			flags |= FPB_RESPECT_SOFT_DIRTY;
 
 		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags,
 				     &any_writable, NULL, NULL);
@@ -1535,7 +1535,6 @@ static inline int zap_present_ptes(struct mmu_gather *tlb,
 		struct zap_details *details, int *rss, bool *force_flush,
 		bool *force_break, bool *any_skipped)
 {
-	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	struct mm_struct *mm = tlb->mm;
 	struct folio *folio;
 	struct page *page;
@@ -1565,7 +1564,7 @@ static inline int zap_present_ptes(struct mmu_gather *tlb,
 	 * by keeping the batching logic separate.
 	 */
 	if (unlikely(folio_test_large(folio) && max_nr != 1)) {
-		nr = folio_pte_batch(folio, addr, pte, ptent, max_nr, fpb_flags,
+		nr = folio_pte_batch(folio, addr, pte, ptent, max_nr, 0,
 				     NULL, NULL, NULL);
 
 		zap_present_folio_ptes(tlb, vma, folio, page, pte, ptent, nr,
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 1ff7b2174eb77..2a25eedc3b1c0 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -675,7 +675,6 @@ static void queue_folios_pmd(pmd_t *pmd, struct mm_walk *walk)
 static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 			unsigned long end, struct mm_walk *walk)
 {
-	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	struct vm_area_struct *vma = walk->vma;
 	struct folio *folio;
 	struct queue_pages *qp = walk->private;
@@ -713,8 +712,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 			continue;
 		if (folio_test_large(folio) && max_nr != 1)
 			nr = folio_pte_batch(folio, addr, pte, ptent,
-					     max_nr, fpb_flags,
-					     NULL, NULL, NULL);
+					     max_nr, 0, NULL, NULL, NULL);
 		/*
 		 * vm_normal_folio() filters out zero pages, but there might
 		 * still be reserved folios to skip, perhaps in a VDSO.
diff --git a/mm/mlock.c b/mm/mlock.c
index 3cb72b579ffd3..2238cdc5eb1c1 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -307,14 +307,13 @@ void munlock_folio(struct folio *folio)
 static inline unsigned int folio_mlock_step(struct folio *folio,
 		pte_t *pte, unsigned long addr, unsigned long end)
 {
-	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	unsigned int count = (end - addr) >> PAGE_SHIFT;
 	pte_t ptent = ptep_get(pte);
 
 	if (!folio_test_large(folio))
 		return 1;
 
-	return folio_pte_batch(folio, addr, pte, ptent, count, fpb_flags, NULL,
+	return folio_pte_batch(folio, addr, pte, ptent, count, 0, NULL,
 			       NULL, NULL);
 }
 
diff --git a/mm/mremap.c b/mm/mremap.c
index 36585041c760d..d4d3ffc931502 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -173,7 +173,6 @@ static pte_t move_soft_dirty_pte(pte_t pte)
 static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
 		pte_t *ptep, pte_t pte, int max_nr)
 {
-	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	struct folio *folio;
 
 	if (max_nr == 1)
@@ -183,7 +182,7 @@ static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr
 	if (!folio || !folio_test_large(folio))
 		return 1;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
+	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
 			       NULL, NULL);
 }
 
diff --git a/mm/rmap.c b/mm/rmap.c
index 34311f654d0c2..98ed3e49e8bbe 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1849,7 +1849,6 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 			struct page_vma_mapped_walk *pvmw,
 			enum ttu_flags flags, pte_t pte)
 {
-	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	unsigned long end_addr, addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
 	unsigned int max_nr;
@@ -1869,7 +1868,7 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 	if (pte_unused(pte))
 		return 1;
 
-	return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+	return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, 0,
 			       NULL, NULL, NULL);
 }
 
-- 
2.49.0

