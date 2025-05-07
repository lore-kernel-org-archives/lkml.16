Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0958E1A316C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597810; cv=none; b=bbtNL6afBHNyBuS3Lvmvw+m1I3p+vj7MWkqwseKGOwKSLMCF93i1aj4A+sy7S7Y0cJ+x3LPJgbTPJcHNhQOAl/FRHg7y4XBLMpbP9TAqlSB8Eb3e5++O0niYFMXDtWcOoS8jDrNYVjAj47VW0308ZskoU09s/fBDzONukmaTWpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597810; c=relaxed/simple;
	bh=u+Wtc8I/lspFBJQPJMQh9NEsnKks0/lo09lDX5vO5qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vEk9UPoLZ3AeqLLw1cXvWsqnRskJBMd7o8H2Noc+0CJtyzt2mcCjDJ4D5GNntwFK/b7hDi1V4tCxQPpcXlDJS3HmqsJFU3+FPuNAo7NB8lbux/5WXqyW1HYe5NatBPNNnbfw+kzX+X7Q22Ln191hyFUKxUdL5T5M0Ww7D8DlCxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EB481EDB;
	Tue,  6 May 2025 23:03:18 -0700 (PDT)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.43.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA3EF3F5A1;
	Tue,  6 May 2025 23:03:20 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	pfalcato@suse.de,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	mingo@kernel.org,
	libang.li@antgroup.com,
	maobibo@loongson.cn,
	zhengqi.arch@bytedance.com,
	baohua@kernel.org,
	anshuman.khandual@arm.com,
	willy@infradead.org,
	ioworker0@gmail.com,
	yang@os.amperecomputing.com,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	hughd@google.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
Date: Wed,  7 May 2025 11:32:56 +0530
Message-Id: <20250507060256.78278-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250507060256.78278-1-dev.jain@arm.com>
References: <20250507060256.78278-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To use PTE batching, we want to determine whether the folio mapped by
the PTE is large, thus requiring the use of vm_normal_folio(). We want
to avoid the cost of vm_normal_folio() if the code path doesn't already
require the folio. For arm64, pte_batch_hint() does the job. To generalize
this hint, add a helper which will determine whether two consecutive PTEs
point to consecutive PFNs, in which case there is a high probability that
the underlying folio is large.
Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
are painted with the contig bit, then ptep_get() will iterate through all 16
entries to collect a/d bits. Hence this optimization will result in a 16x
reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
will eventually call contpte_try_unfold() on every contig block, thus
flushing the TLB for the complete large folio range. Instead, use
get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
do them on the starting and ending contig block.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
 mm/mremap.c             | 37 ++++++++++++++++++++++++++++++-------
 2 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c92..38dab1f562ed 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
 }
 #endif
 
+/**
+ * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
+ * to a large folio.
+ * @ptep: Pointer to the page table entry.
+ * @pte: The page table entry.
+ *
+ * This helper is invoked when the caller wants to batch over a set of ptes
+ * mapping a large folio, but the concerned code path does not already have
+ * the folio. We want to avoid the cost of vm_normal_folio() only to find that
+ * the underlying folio was small; i.e keep the small folio case as fast as
+ * possible.
+ *
+ * The caller must ensure that ptep + 1 exists.
+ */
+static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
+{
+	pte_t *next_ptep, next_pte;
+
+	if (pte_batch_hint(ptep, pte) != 1)
+		return true;
+
+	next_ptep = ptep + 1;
+	next_pte = ptep_get(next_ptep);
+	if (!pte_present(next_pte))
+		return false;
+
+	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == 1);
+}
+
 #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
diff --git a/mm/mremap.c b/mm/mremap.c
index 0163e02e5aa8..9c88a276bec4 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
 	return pte;
 }
 
+/* mremap a batch of PTEs mapping the same large folio */
+static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
+		pte_t *ptep, pte_t pte, int max_nr)
+{
+	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	struct folio *folio;
+	int nr = 1;
+
+	if ((max_nr != 1) && maybe_contiguous_pte_pfns(ptep, pte)) {
+		folio = vm_normal_folio(vma, addr, pte);
+		if (folio && folio_test_large(folio))
+			nr = folio_pte_batch(folio, addr, ptep, pte, max_nr,
+					     flags, NULL, NULL, NULL);
+	}
+	return nr;
+}
+
 static int move_ptes(struct pagetable_move_control *pmc,
 		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
 {
@@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
 	struct mm_struct *mm = vma->vm_mm;
 	pte_t *old_ptep, *new_ptep;
-	pte_t pte;
+	pte_t old_pte, pte;
 	pmd_t dummy_pmdval;
 	spinlock_t *old_ptl, *new_ptl;
 	bool force_flush = false;
@@ -186,6 +203,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	unsigned long old_end = old_addr + extent;
 	unsigned long len = old_end - old_addr;
 	int err = 0;
+	int max_nr;
 
 	/*
 	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
@@ -236,12 +254,13 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 
-	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
-				   new_ptep++, new_addr += PAGE_SIZE) {
-		if (pte_none(ptep_get(old_ptep)))
+	for (int nr = 1; old_addr < old_end; old_ptep += nr, old_addr += nr * PAGE_SIZE,
+				   new_ptep += nr, new_addr += nr * PAGE_SIZE) {
+		max_nr = (old_end - old_addr) >> PAGE_SHIFT;
+		old_pte = ptep_get(old_ptep);
+		if (pte_none(old_pte))
 			continue;
 
-		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
 		/*
 		 * If we are remapping a valid PTE, make sure
 		 * to flush TLB before we drop the PTL for the
@@ -253,8 +272,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		 * the TLB entry for the old mapping has been
 		 * flushed.
 		 */
-		if (pte_present(pte))
+		if (pte_present(old_pte)) {
+			nr = mremap_folio_pte_batch(vma, old_addr, old_ptep,
+						    old_pte, max_nr);
 			force_flush = true;
+		}
+		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);
 		pte = move_pte(pte, old_addr, new_addr);
 		pte = move_soft_dirty_pte(pte);
 
@@ -267,7 +290,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 				else if (is_swap_pte(pte))
 					pte = pte_swp_clear_uffd_wp(pte);
 			}
-			set_pte_at(mm, new_addr, new_ptep, pte);
+			set_ptes(mm, new_addr, new_ptep, pte, nr);
 		}
 	}
 
-- 
2.30.2

