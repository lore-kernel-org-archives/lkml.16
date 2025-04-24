Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B68F510
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491988; cv=none; b=REKdUroooq298LZ9k0Jin6ypNOMv5RL3CBH6wSo8QaEewcSHf4h+WcwYBhMlmVRwfTzXLS8YzSMW1kzpZytn7K1sgesVDzFN1N0/I35HjFy8gcYFp7DWxTeZ4EMR/vwGI5mA14H17u+gS0UR2TsKh6fk0fWuz+HK12zXCsOhdlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491988; c=relaxed/simple;
	bh=FTVZ+0wQXpQAmYZWmd2t1oU8B2nFLopunbKPNqv8lBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHlkbXZY3EsFuAylnpBFe9miwZpi1+t2SgXQE78eZXGkKxD1RNOhwFKiH0TgZgJCaP1fr4+A6Y5QY8+qllzqHGf5mtEEPtLNXvEeDUNV9ZaTBRgQM2GBGrAosk6NbgRQ12LwW0O5JGuECPzC0D74W3MkuwVjqYqNIVBsmelaZYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JWqr8Wh7; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="JWqr8Wh7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=r/V7XqoJ6G3ABAqhFrYPZSJ+Oh7KOTFLRGs/+RlpRZE=; b=JWqr8Wh767TvMjoU9/4S0auRgE
	VxGbHmNwUUovjCw2+UJQRR9UTtPGN2vnnUR9kSH2W6y4odylvdPzssJxhJGKNPKSPlOOFU5Kz/DqF
	BBjhGMPBldKlEhy3BVOXHGRNCkzPMdWEcsUyAW1rIr9Yjlr9KHy5gjUGWcbdT7N73qYvkE2cqYtXt
	m6dgiPHPEKosmhtS4xdcA5lARxflSsPqVGfNWL2/YEFyKwRCF75yD5JRB0z39pyscVzof+U52TjdT
	rt8Smfh/M5y6G1atySzGsoIp6r04Y3JIWWy1N9KTa+KfAWKSWQoP87YQuTSwFmqRFZcOtioXqjPfF
	xPCwNGjA==;
Received: from 114-44-196-209.dynamic-ip.hinet.net ([114.44.196.209] helo=gavin-HP-Z840-Workstation..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u7uBx-007n4l-P0; Thu, 24 Apr 2025 12:52:30 +0200
From: Gavin Guo <gavinguo@igalia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: gshan@redhat.com,
	david@redhat.com,
	willy@infradead.org,
	ziy@nvidia.com,
	linmiaohe@huawei.com,
	hughd@google.com,
	revest@google.com,
	kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/huge_memory: Simplify the split_huge_pmd_locked function
Date: Thu, 24 Apr 2025 18:50:12 +0800
Message-ID: <20250424105012.427390-1-gavinguo@igalia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The split_huge_pmd_locked function currently performs redundant checks
for migration entries and folio validation that are already handled by
the page_vma_mapped_walk mechanism in try_to_migrate_one.

Specifically, page_vma_mapped_walk already ensures that:
- The folio is properly mapped in the given VMA area
- pmd_trans_huge, pmd_devmap, and migration entry validation are
  performed

To leverage page_vma_mapped_walk's work, moving TTU_SPLIT_HUGE_PMD
handling to the while loop checking, removing these duplicate checks
from split_huge_pmd_locked and also removing the unnecessary folio
argument since it's no longer needed for the validation.

Suggested-by: David Hildenbrand <david@redhat.com>
Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@redhat.com/
Signed-off-by: Gavin Guo <gavinguo@igalia.com>
---
 include/linux/huge_mm.h | 15 +++++++--------
 mm/huge_memory.c        | 36 ++++++++++--------------------------
 mm/memory.c             |  4 ++--
 mm/mprotect.c           |  2 +-
 mm/rmap.c               | 25 +++++++++++++++----------
 5 files changed, 35 insertions(+), 47 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index e893d546a49f..01a6d998d212 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -395,7 +395,7 @@ static inline int split_huge_page(struct page *page)
 void deferred_split_folio(struct folio *folio, bool partially_mapped);
 
 void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze, struct folio *folio);
+		unsigned long address, bool freeze);
 
 #define split_huge_pmd(__vma, __pmd, __address)				\
 	do {								\
@@ -403,12 +403,11 @@ void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 		if (is_swap_pmd(*____pmd) || pmd_trans_huge(*____pmd)	\
 					|| pmd_devmap(*____pmd))	\
 			__split_huge_pmd(__vma, __pmd, __address,	\
-						false, NULL);		\
+					 false);			\
 	}  while (0)
 
-
 void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
-		bool freeze, struct folio *folio);
+		bool freeze);
 
 void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
 		unsigned long address);
@@ -503,7 +502,7 @@ static inline bool thp_migration_supported(void)
 }
 
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze, struct folio *folio);
+			   pmd_t *pmd, bool freeze);
 bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 			   pmd_t *pmdp, struct folio *folio);
 
@@ -578,12 +577,12 @@ static inline void deferred_split_folio(struct folio *folio, bool partially_mapp
 	do { } while (0)
 
 static inline void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze, struct folio *folio) {}
+		unsigned long address, bool freeze) {}
 static inline void split_huge_pmd_address(struct vm_area_struct *vma,
-		unsigned long address, bool freeze, struct folio *folio) {}
+		unsigned long address, bool freeze) {}
 static inline void split_huge_pmd_locked(struct vm_area_struct *vma,
 					 unsigned long address, pmd_t *pmd,
-					 bool freeze, struct folio *folio) {}
+					 bool freeze) {}
 
 static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
 					 unsigned long addr, pmd_t *pmdp,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 47d76d03ce30..f7721800f4da 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1786,7 +1786,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		pte_free(dst_mm, pgtable);
 		spin_unlock(src_ptl);
 		spin_unlock(dst_ptl);
-		__split_huge_pmd(src_vma, src_pmd, addr, false, NULL);
+		__split_huge_pmd(src_vma, src_pmd, addr, false);
 		return -EAGAIN;
 	}
 	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
@@ -2008,7 +2008,7 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
 	folio_unlock(folio);
 	spin_unlock(vmf->ptl);
 fallback:
-	__split_huge_pmd(vma, vmf->pmd, vmf->address, false, NULL);
+	__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
 	return VM_FAULT_FALLBACK;
 }
 
@@ -3073,33 +3073,17 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 }
 
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze, struct folio *folio)
+			   pmd_t *pmd, bool freeze)
 {
-	bool pmd_migration = is_pmd_migration_entry(*pmd);
-
-	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
-	VM_BUG_ON(freeze && !folio);
-
-	/*
-	 * When the caller requests to set up a migration entry, we
-	 * require a folio to check the PMD against. Otherwise, there
-	 * is a risk of replacing the wrong folio.
-	 */
-	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) || pmd_migration) {
-		/*
-		 * Do not apply pmd_folio() to a migration entry; and folio lock
-		 * guarantees that it must be of the wrong folio anyway.
-		 */
-		if (folio && (pmd_migration || folio != pmd_folio(*pmd)))
-			return;
+	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
+	    is_pmd_migration_entry(*pmd)) {
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
 	}
 }
 
 void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze, struct folio *folio)
+		unsigned long address, bool freeze)
 {
 	spinlock_t *ptl;
 	struct mmu_notifier_range range;
@@ -3109,20 +3093,20 @@ void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 				(address & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 	ptl = pmd_lock(vma->vm_mm, pmd);
-	split_huge_pmd_locked(vma, range.start, pmd, freeze, folio);
+	split_huge_pmd_locked(vma, range.start, pmd, freeze);
 	spin_unlock(ptl);
 	mmu_notifier_invalidate_range_end(&range);
 }
 
 void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
-		bool freeze, struct folio *folio)
+		bool freeze)
 {
 	pmd_t *pmd = mm_find_pmd(vma->vm_mm, address);
 
 	if (!pmd)
 		return;
 
-	__split_huge_pmd(vma, pmd, address, freeze, folio);
+	__split_huge_pmd(vma, pmd, address, freeze);
 }
 
 static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned long address)
@@ -3134,7 +3118,7 @@ static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned
 	if (!IS_ALIGNED(address, HPAGE_PMD_SIZE) &&
 	    range_in_vma(vma, ALIGN_DOWN(address, HPAGE_PMD_SIZE),
 			 ALIGN(address, HPAGE_PMD_SIZE)))
-		split_huge_pmd_address(vma, address, false, NULL);
+		split_huge_pmd_address(vma, address, false);
 }
 
 void vma_adjust_trans_huge(struct vm_area_struct *vma,
diff --git a/mm/memory.c b/mm/memory.c
index ba3ea0a82f7f..4f85167baff9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1799,7 +1799,7 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
 		next = pmd_addr_end(addr, end);
 		if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd)) {
 			if (next - addr != HPAGE_PMD_SIZE)
-				__split_huge_pmd(vma, pmd, addr, false, NULL);
+				__split_huge_pmd(vma, pmd, addr, false);
 			else if (zap_huge_pmd(tlb, vma, pmd, addr)) {
 				addr = next;
 				continue;
@@ -5892,7 +5892,7 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
 
 split:
 	/* COW or write-notify handled on pte level: split pmd. */
-	__split_huge_pmd(vma, vmf->pmd, vmf->address, false, NULL);
+	__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
 
 	return VM_FAULT_FALLBACK;
 }
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 62c1f7945741..88608d0dc2c2 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -379,7 +379,7 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 		if (is_swap_pmd(_pmd) || pmd_trans_huge(_pmd) || pmd_devmap(_pmd)) {
 			if ((next - addr != HPAGE_PMD_SIZE) ||
 			    pgtable_split_needed(vma, cp_flags)) {
-				__split_huge_pmd(vma, pmd, addr, false, NULL);
+				__split_huge_pmd(vma, pmd, addr, false);
 				/*
 				 * For file-backed, the pmd could have been
 				 * cleared; make sure pmd populated if
diff --git a/mm/rmap.c b/mm/rmap.c
index 67bb273dfb80..507dc13add61 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1944,7 +1944,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 * restart so we can process the PTE-mapped THP.
 				 */
 				split_huge_pmd_locked(vma, pvmw.address,
-						      pvmw.pmd, false, folio);
+						      pvmw.pmd, false);
 				flags &= ~TTU_SPLIT_HUGE_PMD;
 				page_vma_mapped_walk_restart(&pvmw);
 				continue;
@@ -2291,13 +2291,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	if (flags & TTU_SYNC)
 		pvmw.flags = PVMW_SYNC;
 
-	/*
-	 * unmap_page() in mm/huge_memory.c is the only user of migration with
-	 * TTU_SPLIT_HUGE_PMD and it wants to freeze.
-	 */
-	if (flags & TTU_SPLIT_HUGE_PMD)
-		split_huge_pmd_address(vma, address, true, folio);
-
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
 	 * For hugetlb, it could be much worse if we need to do pud
@@ -2323,9 +2316,21 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	mmu_notifier_invalidate_range_start(&range);
 
 	while (page_vma_mapped_walk(&pvmw)) {
-#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
+			/*
+			 * unmap_folio() in mm/huge_memory.c is the only user of
+			 * migration with TTU_SPLIT_HUGE_PMD and it wants to
+			 * freeze.
+			 */
+			if (flags & TTU_SPLIT_HUGE_PMD) {
+				split_huge_pmd_locked(vma, pvmw.address,
+						      pvmw.pmd, true);
+				ret = false;
+				page_vma_mapped_walk_done(&pvmw);
+				break;
+			}
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 			subpage = folio_page(folio,
 				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
@@ -2337,8 +2342,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				break;
 			}
 			continue;
-		}
 #endif
+		}
 
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);

base-commit: a79be02bba5c31f967885c7f3bf3a756d77d11d9
prerequisite-patch-id: 9c9c975b11ad0f73acd863049b4f1732caa04e53
-- 
2.43.0

