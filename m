Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9E411712
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527471; cv=none; b=ndJayDQIUgrfnvN1WGoUUcTicDfne+m6wYh3OZc+SBUyzGMa8HokE+bjj6e+s1pcf6zMs3qWQl+whJQc4Nzqk2WJT3wgydEELzM/6qAmItNzJbXVzB+e3EMJKtW8ZCZUURrAZpa51EBZKaNztFRx8bJovQIuqJp0l1M0FNsmuI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527471; c=relaxed/simple;
	bh=K33aBlSZM2s8aovcnzMuvaa9PJqADPD9Al72bAky4+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k9sDrew52vWyUH3B2C+GjYJfDCC5mSkIOPI0HSrb1D3hqRQwIFFHL0/m72EuEthszZge2iRo6BQBwLo+w2X7cOtd7qwJn/3I1u75jOXVLe6fk9Vxp2vB9zNnR0E3ivCTYqMtXtbvJcyQKKERIQQw2kz8cMXPr+/QtW6G/263fH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ED402680;
	Mon,  9 Jun 2025 20:50:50 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D4493F59E;
	Mon,  9 Jun 2025 20:51:02 -0700 (PDT)
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
Subject: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
Date: Tue, 10 Jun 2025 09:20:43 +0530
Message-Id: <20250610035043.75448-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250610035043.75448-1-dev.jain@arm.com>
References: <20250610035043.75448-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
are painted with the contig bit, then ptep_get() will iterate through all 16
entries to collect a/d bits. Hence this optimization will result in a 16x
reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
will eventually call contpte_try_unfold() on every contig block, thus
flushing the TLB for the complete large folio range. Instead, use
get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
do them on the starting and ending contig block.

For split folios, there will be no pte batching; nr_ptes will be 1. For
pagetable splitting, the ptes will still point to the same large folio;
for arm64, this results in the optimization described above, and for other
arches (including the general case), a minor improvement is expected due to
a reduction in the number of function calls.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mremap.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 180b12225368..18b215521ada 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
 	return pte;
 }
 
+static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
+		pte_t *ptep, pte_t pte, int max_nr)
+{
+	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	struct folio *folio;
+
+	if (max_nr == 1)
+		return 1;
+
+	folio = vm_normal_folio(vma, addr, pte);
+	if (!folio || !folio_test_large(folio))
+		return 1;
+
+	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
+			       NULL, NULL);
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
@@ -185,6 +202,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	unsigned long new_addr = pmc->new_addr;
 	unsigned long old_end = old_addr + extent;
 	unsigned long len = old_end - old_addr;
+	int max_nr_ptes;
+	int nr_ptes;
 	int err = 0;
 
 	/*
@@ -236,14 +255,16 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 
-	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
-				   new_ptep++, new_addr += PAGE_SIZE) {
+	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
+		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
 		VM_WARN_ON_ONCE(!pte_none(*new_ptep));
 
-		if (pte_none(ptep_get(old_ptep)))
+		nr_ptes = 1;
+		max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
+		old_pte = ptep_get(old_ptep);
+		if (pte_none(old_pte))
 			continue;
 
-		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
 		/*
 		 * If we are remapping a valid PTE, make sure
 		 * to flush TLB before we drop the PTL for the
@@ -255,8 +276,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		 * the TLB entry for the old mapping has been
 		 * flushed.
 		 */
-		if (pte_present(pte))
+		if (pte_present(old_pte)) {
+			nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
+							 old_pte, max_nr_ptes);
 			force_flush = true;
+		}
+		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
 		pte = move_pte(pte, old_addr, new_addr);
 		pte = move_soft_dirty_pte(pte);
 
@@ -269,7 +294,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 				else if (is_swap_pte(pte))
 					pte = pte_swp_clear_uffd_wp(pte);
 			}
-			set_pte_at(mm, new_addr, new_ptep, pte);
+			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
 		}
 	}
 
-- 
2.30.2

