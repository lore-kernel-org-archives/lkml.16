Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0034A202C3A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262182; cv=none; b=rUkI7gEbjkNE5gDPP9/FYtbXA86wXEZKXKvpyeDJCwNJjq96JtfyYU/x3mkogYfMAgc8OBu0D1InyGtfTaudYcohcxjLVodh54ExIo13T6nzGAgmYNChqRAgFgy3z3aBDnSgagP1UgRU6n1patBSY5bzEzp6LU1VfCa1spxBFGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262182; c=relaxed/simple;
	bh=fzL/uED/j5WREY6u/ivzNwA+l21oV1O13GY5Hklawi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fmJGc1JOAy7HOTHkgqAG+tQACkbTw/9Gr3hKV9PzqgO6r8Hkko8oVLoM9vZ5A50HrvH2wrw90tn3eArNzwWpyfhTjA8BofpzF0Ij3NgQu/rjBkFFdvhsiJKhI1V+Xlnkt7sjp1qYdZKpDJiYnjm05IZtdi5C56gbvD+gvguojrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86630113E;
	Wed, 18 Jun 2025 08:55:58 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.88.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DACDD3F66E;
	Wed, 18 Jun 2025 08:56:14 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH] khugepaged: Optimize collapse_pte_mapped_thp() for large folios by PTE batching
Date: Wed, 18 Jun 2025 21:26:08 +0530
Message-Id: <20250618155608.18580-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use PTE batching to optimize collapse_pte_mapped_thp().

On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
Then, calling ptep_clear() for every pte will cause a TLB flush for every
contpte block. Instead, clear_full_ptes() does a
contpte_try_unfold_partial() which will flush the TLB only for the (if any)
starting and ending contpte block, if they partially overlap with the range
khugepaged is looking at.

For all arches, there should be a benefit due to batching atomic operations
on mapcounts due to folio_remove_rmap_ptes().

Note that we do not need to make a change to the check
"if (folio_page(folio, i) != page)"; if i'th page of the folio is equal
to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
pages of the folio will be equal to the corresponding pages of our
batch mapping consecutive pages.

No issues were observed with mm-selftests.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---

This is rebased on:
https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/
If there will be a v2 of either version I'll send them together.

 mm/khugepaged.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 649ccb2670f8..7d37058eda5b 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
 int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 			    bool install_pmd)
 {
+	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
 	struct mmu_notifier_range range;
 	bool notified = false;
 	unsigned long haddr = addr & HPAGE_PMD_MASK;
+	unsigned long end = haddr + HPAGE_PMD_SIZE;
 	struct vm_area_struct *vma = vma_lookup(mm, haddr);
 	struct folio *folio;
 	pte_t *start_pte, *pte;
 	pmd_t *pmd, pgt_pmd;
 	spinlock_t *pml = NULL, *ptl;
-	int nr_ptes = 0, result = SCAN_FAIL;
 	int i;
 
 	mmap_assert_locked(mm);
@@ -1620,12 +1621,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
 		goto abort;
 
+	i = 0, addr = haddr, pte = start_pte;
 	/* step 2: clear page table and adjust rmap */
-	for (i = 0, addr = haddr, pte = start_pte;
-	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
+	do {
+		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
+		struct folio *this_folio;
 		struct page *page;
 		pte_t ptent = ptep_get(pte);
 
+		nr_batch_ptes = 1;
+
 		if (pte_none(ptent))
 			continue;
 		/*
@@ -1639,6 +1645,11 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 			goto abort;
 		}
 		page = vm_normal_page(vma, addr, ptent);
+		this_folio = page_folio(page);
+		if (folio_test_large(this_folio) && max_nr_batch_ptes != 1)
+			nr_batch_ptes = folio_pte_batch(this_folio, addr, pte, ptent,
+					max_nr_batch_ptes, flags, NULL, NULL, NULL);
+
 		if (folio_page(folio, i) != page)
 			goto abort;
 
@@ -1647,18 +1658,19 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		 * TLB flush can be left until pmdp_collapse_flush() does it.
 		 * PTE dirty? Shmem page is already dirty; file is read-only.
 		 */
-		ptep_clear(mm, addr, pte);
-		folio_remove_rmap_pte(folio, page, vma);
-		nr_ptes++;
-	}
+		clear_full_ptes(mm, addr, pte, nr_batch_ptes, false);
+		folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
+		nr_mapped_ptes += nr_batch_ptes;
+	} while (i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
+		 pte += nr_batch_ptes, i < HPAGE_PMD_NR);
 
 	if (!pml)
 		spin_unlock(ptl);
 
 	/* step 3: set proper refcount and mm_counters. */
-	if (nr_ptes) {
-		folio_ref_sub(folio, nr_ptes);
-		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
+	if (nr_mapped_ptes) {
+		folio_ref_sub(folio, nr_mapped_ptes);
+		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
 	}
 
 	/* step 4: remove empty page table */
@@ -1691,10 +1703,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 			: SCAN_SUCCEED;
 	goto drop_folio;
 abort:
-	if (nr_ptes) {
+	if (nr_mapped_ptes) {
 		flush_tlb_mm(mm);
-		folio_ref_sub(folio, nr_ptes);
-		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
+		folio_ref_sub(folio, nr_mapped_ptes);
+		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
 	}
 unlock:
 	if (start_pte)
-- 
2.30.2

