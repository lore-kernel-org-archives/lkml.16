Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995612BEFEB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025322; cv=none; b=uL5IfWu0+3RWDwtxh/LscbMf9pfTU+eM+2isW45GQ/mmK6cnD9UHnfqhKZRwK1SesrCjgS7QLOr4pte7VzpRINn2klfkfF3ykOy/zY6uGYPZOZW/mZUy38TthlqQgMV4ERjpw9EJiVqitvLfMl5+eKjgzZvmkoaNavKfNnuZLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025322; c=relaxed/simple;
	bh=TfMPVbSc1Fl78vsrq1nAa4zx7OAP+sdhDhkKUzyUicM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P0fVrkVGkaluPLfGfJuuMKjXc0r6rlt7nRuwiz4irHMrP//o0DI+3/3sfdXCRkRvQ2xcycgFw+jqEn8+8p2jdfxCG2gsYf5M3KCHSbrsTfzq5pJOwE+x4NVL2LOqEkJ6aa1BMoaskqsyqMAL9cS4DlnvLGYAOMnbbZ2XhCs0RPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+ZCukOj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+ZCukOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stZwKACz8+3WmyYSkVNq9qa5rR3dAnSzYyTawu7aF9A=;
	b=O+ZCukOjrD39FHFs250RssS7wN2zr5roptqtWQqPJjjZOu/IYmJHput9+oQsbuj1MUOf8n
	omdu/Fn0eSr6GIc2Ts4RVtTTutWmL0U+CcVe/oDLobiB7tdpgO5HRIRs0E6a6NGhaNoUhG
	K//9/eODAMC2KnwJhGV33BUn4pWcZRU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-sK1C5ty4O86tIgdAtx0zIg-1; Fri, 27 Jun 2025 07:55:16 -0400
X-MC-Unique: sK1C5ty4O86tIgdAtx0zIg-1
X-Mimecast-MFC-AGG-ID: sK1C5ty4O86tIgdAtx0zIg_1751025315
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so1303465f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025315; x=1751630115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stZwKACz8+3WmyYSkVNq9qa5rR3dAnSzYyTawu7aF9A=;
        b=Z7j6GNYsHn+h36wh1rihSffhfLS2MC3lIXXSP/g0QClFjiORapZ2xHZRt+oUBuMU1f
         TU3DIkKEKlUlksP6CY+4zJNBaur+kXXencFyY2YaOScIiSFISsBpm2x1cbsASRCJJQ7/
         WRoBFu3Pq201iWuspX9QHk2Uodb1DyfvbDPjC73CwomPcuf0T1lyThPDKZMwKoeKWlW/
         5TinhDNMLlSJsnEIgg0fIt53HXVA/pw6ShcZY1NKsgecvZTkJIm3YWgMGdzy/IyAUCKz
         KXSnYc6yiFrS9ov9LXXULRCfFFH6UvVmPqeYPZosemx9eyEQ96iazfEqAMumd8mCoGCX
         NPng==
X-Gm-Message-State: AOJu0YzV5FBJCkiYRRp3cAQrqAhL75iw850k/GJMUW35x5wADGXwrXBV
	nbZhv8bTPpxE9SsN1EzkaoNyl/V575jEzvEa/fC+gSBI5Hr+4XCFzHdvFut1oXuXtPkhgAPpHva
	iFbEYIs3Y/kKrlFhS6wldFdw7KOrW3QvMRJuJQ1HxOTJ/IiCVAD4xqz+wU9XFvTB1/W6XatM57W
	hekDvosNop2115ZsBld/mva2LQaai6eAPojRebBJczORocclbH
X-Gm-Gg: ASbGncu/Ydsc2QGLU7lAW2Bu1wi8ZCq3fdDfNqE+ZK0gG+sOp4iK+qOEuRcdgO9Ap9b
	2SK1EE4COUq0Ll0q6To4oTPf/ddV1apNsUeZsAOsAeLy++kPl66Zg4gMfT5RG0lkyXUPxCVYAcb
	737vW/SZbE5YI0uA7nx3rCoKNEhnasa0/pJsQHpbe583OXSMjaYXAc42OJEcopMJyoEjC2MAYvT
	zHvFzmNSumJdukwvTPMNvr0SD3Uw7SDG+UB7n7xMkoxhnb9yyoFiP+/B7Y51HFN8grdEpr/XuTy
	WEkkjKx6ax+wevESmieblcEUkpmXRQ1C8dhCuEk5jiGcFiljYFiy1+OE39zztxuFr8wHDaJl6w+
	MP4xniUE=
X-Received: by 2002:a5d:6ac4:0:b0:3a5:8abe:a264 with SMTP id ffacd0b85a97d-3a917603b9dmr1823547f8f.37.1751025314965;
        Fri, 27 Jun 2025 04:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk+O+t9TXDSPfzprR1dkRhSp8WWlD2y7FYctPhL8RRYqJ8oWIk/Y5KEsOj/Dpqi4ryG2nLQA==
X-Received: by 2002:a5d:6ac4:0:b0:3a5:8abe:a264 with SMTP id ffacd0b85a97d-3a917603b9dmr1823503f8f.37.1751025314383;
        Fri, 27 Jun 2025 04:55:14 -0700 (PDT)
Received: from localhost (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538327fed8sm38347465e9.1.2025.06.27.04.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:55:13 -0700 (PDT)
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
	Harry Yoo <harry.yoo@oracle.com>
Subject: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
Date: Fri, 27 Jun 2025 13:55:07 +0200
Message-ID: <20250627115510.3273675-2-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627115510.3273675-1-david@redhat.com>
References: <20250627115510.3273675-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Honoring these PTE bits is the exception, so let's invert the meaning.

With this change, most callers don't have to pass any flags.

No functional change intended.

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
index e84217e27778d..9690c75063881 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -202,17 +202,17 @@ static inline void vma_close(struct vm_area_struct *vma)
 /* Flags for folio_pte_batch(). */
 typedef int __bitwise fpb_t;
 
-/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
-#define FPB_IGNORE_DIRTY		((__force fpb_t)BIT(0))
+/* Compare PTEs honoring the dirty bit. */
+#define FPB_HONOR_DIRTY		((__force fpb_t)BIT(0))
 
-/* Compare PTEs after pte_clear_soft_dirty(), ignoring the soft-dirty bit. */
-#define FPB_IGNORE_SOFT_DIRTY		((__force fpb_t)BIT(1))
+/* Compare PTEs honoring the soft-dirty bit. */
+#define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
 
 static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 {
-	if (flags & FPB_IGNORE_DIRTY)
+	if (!(flags & FPB_HONOR_DIRTY))
 		pte = pte_mkclean(pte);
-	if (likely(flags & FPB_IGNORE_SOFT_DIRTY))
+	if (likely(!(flags & FPB_HONOR_SOFT_DIRTY)))
 		pte = pte_clear_soft_dirty(pte);
 	return pte_wrprotect(pte_mkold(pte));
 }
@@ -236,8 +236,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  * pages of the same large folio.
  *
  * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
- * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
- * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
+ * the accessed bit, writable bit, dirty bit (unless FPB_HONOR_DIRTY is set) and
+ * soft-dirty bit (unless FPB_HONOR_SOFT_DIRTY is set).
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
index 0f9b32a20e5b7..ab2d6c1425691 100644
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
+			flags |= FPB_HONOR_DIRTY;
+		if (vma_soft_dirty_enabled(src_vma))
+			flags |= FPB_HONOR_SOFT_DIRTY;
 
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
index 3b74bb19c11dd..a29d7d29c7283 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1849,7 +1849,6 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
 static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
 			struct folio *folio, pte_t *ptep)
 {
-	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	int max_nr = folio_nr_pages(folio);
 	pte_t pte = ptep_get(ptep);
 
@@ -1860,7 +1859,7 @@ static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
 	if (pte_pfn(pte) != folio_pfn(folio))
 		return false;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
+	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
 			       NULL, NULL) == max_nr;
 }
 
-- 
2.49.0

