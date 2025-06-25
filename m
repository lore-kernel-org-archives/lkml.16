Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8713C1DE2D8
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831114; cv=none; b=mHsfcNut2Dgsintg6CUhyrFWoSkAw+vQXqXEaWH1xp11PbAlyQMiDiZanf2Qs4961ugfbkSPS0zjJfLWKbcwpEAy0L50U6nIDIAoG0ZPvgHS/fSmNS/UKriEG9khbxBgMXRuGXRjcOpWWceTmBMHWOzb1iwiEm7MH/4CAwp5zdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831114; c=relaxed/simple;
	bh=egfCOXByKrWZlhfRfwjHZY6gZ+HFuN29/Y7LH9KNOpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JxaEU+OYpU10d2BWnnF+qHkRBdfQqCovtCy6zBgCiUY/wpGS5riFSLoJ1L7H9f+V/HveEM+gNJ8l4YA573ldqV/ub8ppueT/tz9r5jB2VH52yKoOugQeH4DUCd7yOpVxiS63Ikrf4EHYurYvSr0wQrp9yjeM2a0J1T99EKFOY0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBC8F1063;
	Tue, 24 Jun 2025 22:58:12 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E88A3F63F;
	Tue, 24 Jun 2025 22:58:26 -0700 (PDT)
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
Subject: [PATCH v2 2/3] khugepaged: Optimize collapse_pte_mapped_thp() for large folios by PTE batching
Date: Wed, 25 Jun 2025 11:28:05 +0530
Message-Id: <20250625055806.82645-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250625055806.82645-1-dev.jain@arm.com>
References: <20250625055806.82645-1-dev.jain@arm.com>
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
 mm/khugepaged.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 3944b112d452..4c8d33abfbd8 100644
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
@@ -1621,11 +1622,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		goto abort;
 
 	/* step 2: clear page table and adjust rmap */
-	for (i = 0, addr = haddr, pte = start_pte;
-	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
+	for (i = 0, addr = haddr, pte = start_pte; i < HPAGE_PMD_NR;
+	     i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
+	     pte += nr_batch_ptes) {
+		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
+		struct folio *mapped_folio;
 		struct page *page;
 		pte_t ptent = ptep_get(pte);
 
+		nr_batch_ptes = 1;
+
 		if (pte_none(ptent))
 			continue;
 		/*
@@ -1639,26 +1646,33 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 			goto abort;
 		}
 		page = vm_normal_page(vma, addr, ptent);
+		mapped_folio = page_folio(page);
+
 		if (folio_page(folio, i) != page)
 			goto abort;
 
+		mapped_folio = page_folio(page);
+		nr_batch_ptes = folio_pte_batch(mapped_folio, addr, pte, ptent,
+						max_nr_batch_ptes, flags,
+						NULL, NULL, NULL);
+
 		/*
 		 * Must clear entry, or a racing truncate may re-remove it.
 		 * TLB flush can be left until pmdp_collapse_flush() does it.
 		 * PTE dirty? Shmem page is already dirty; file is read-only.
 		 */
-		ptep_clear(mm, addr, pte);
-		folio_remove_rmap_pte(folio, page, vma);
-		nr_ptes++;
+		clear_full_ptes(mm, addr, pte, nr_batch_ptes, /* full = */ false);
+		folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
+		nr_mapped_ptes += nr_batch_ptes;
 	}
 
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
@@ -1691,10 +1705,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
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

