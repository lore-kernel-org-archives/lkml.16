Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA2223D2AA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577602; cv=none; b=d7Uz7Qv5PZ8acKRU2sUZ2OHz87vhRSB9b4T0P7O9wH1G/fwLznvne0Bq+i2d1J59GFdahWR99R5TfASR+Xsc2BT/lUx7ZBHJEKpIa421ORnIbstlJYOLp69jG1A9txQ5968mbB372sYduGw6MAC+MngYl45McGXNsxgCGFlSOmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577602; c=relaxed/simple;
	bh=6Et0mOy/+uHCttdqiXwtKrdXP1Zw1vn2YXImkgiHvjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrCQg+3uEoH3yKLnO568XKnOWjjrJF21AsoFCiPoOwpjLIjQkYIdRnqvSGVHYHrpLWbMLV7IDUWok5YwkDJyO37Qv4gsJajyu3muiGnDRP9JAj2jCMHjkzdmqqprJq9TjyYkeaQ9PigFa1OZTPxojDdoMmuABzw2dxEDdLxdBrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VBdTcEnY; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VBdTcEnY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fXn9JP6wkrNEHUrtwA4wVXvkkRNmgMST2AstnsuBA3k=; b=VBdTcEnYLj1bSTbPA3/qXCxQhi
	QaPIHQxu0gzsz8OtNwZ89ScFaJOi3M59M+rxzpBPjExS2KwLL3681n4g1b6FxQBlkS6ailcotvsnm
	7Y7UJzSQxPofRMmuOncdYbQPLf8Xs58/w1w9bi3wUCYAb6aZjjYxTF239dJlou2UQCy30yAa18K5v
	3J7NFdU6wSdF6gtwpscRL/kCmZK1+9PqazBcDx4DNDib/44OE8CaxOzKoyIuROR81uQWodOhODtuQ
	rOZEzwt6Twfv7ouvIFkoFCLEDgGr859pOSkQnQnIV3k7ePwsTT2B+7yLCjEyojB9Mxd6AONKoYjbk
	BIzf8wyw==;
Received: from 114-44-196-209.dynamic-ip.hinet.net ([114.44.196.209] helo=gavin-HP-Z840-Workstation..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u8GT9-008HIu-QR; Fri, 25 Apr 2025 12:39:44 +0200
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
Subject: [PATCH v2 2/2] mm/huge_memory: Remove useless folio pointers passing
Date: Fri, 25 Apr 2025 18:38:59 +0800
Message-ID: <20250425103859.825879-3-gavinguo@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425103859.825879-1-gavinguo@igalia.com>
References: <20250425103859.825879-1-gavinguo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the previous commit "mm/huge_memory: Adjust try_to_migrate_one() and
split_huge_pmd_locked()" has simplified the logic by leveraging the
folio verification in page_vma_mapped_walk(), this patch removes the
unnecessary folio pointers passing.

Suggested-by: David Hildenbrand <david@redhat.com>
Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@redhat.com/
Link: https://lore.kernel.org/all/91599a3c-e69e-4d79-bac5-5013c96203d7@redhat.com/
Signed-off-by: Gavin Guo <gavinguo@igalia.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/huge_mm.h | 15 +++++++--------
 mm/huge_memory.c        | 16 ++++++++--------
 mm/memory.c             |  4 ++--
 mm/mprotect.c           |  2 +-
 mm/rmap.c               |  4 ++--
 5 files changed, 20 insertions(+), 21 deletions(-)

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
index 485a0ba011af..7d292693c18e 100644
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
 
@@ -3073,7 +3073,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 }
 
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze, struct folio *folio)
+			   pmd_t *pmd, bool freeze)
 {
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
 	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
@@ -3082,7 +3082,7 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 }
 
 void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze, struct folio *folio)
+		unsigned long address, bool freeze)
 {
 	spinlock_t *ptl;
 	struct mmu_notifier_range range;
@@ -3092,20 +3092,20 @@ void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -3117,7 +3117,7 @@ static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned
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
index b53a4dcaeaae..4992005885ef 100644
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
@@ -2320,7 +2320,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		if (!pvmw.pte) {
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				split_huge_pmd_locked(vma, pvmw.address,
-						      pvmw.pmd, true, NULL);
+						      pvmw.pmd, true);
 				ret = false;
 				page_vma_mapped_walk_done(&pvmw);
 				break;
-- 
2.43.0

