Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9781FDA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748332283; cv=none; b=Tl9rt2pB+Po2JCvX23hnFmjMl3VDEneATATIrEdCp3B3+C53mQod4+dUmP8cQBdgWkdOV7teNwI4uu6JejRhPk9vh493izpnUPoqQ3gXNaMdnKVEMZNYcTgvNQSTTM8NJzvJEwgS1CHqli/7AdaJhpGbbDO2oQLBPEXukb1jjbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748332283; c=relaxed/simple;
	bh=vYDQyzHSKBnSWwXwBVNZsHhXumIsta3zonGSrGMYiVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sDoeIKuGERwO42KYunb3HHSLTtmaYbG9ytE0xT7H6HZrjte9x5D5bWI+LuR5FlgIiOihActuVGSWCIl/xGeQoHEyJxsRIMfYPaQv2dGZkDiGBSYyvJzkC2xDCqqmVeSYnjYUQsWtA/+pXWPe5EjKeZEs7pZtOmpugcHwDr1naMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6626E14BF;
	Tue, 27 May 2025 00:51:02 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.85.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 185893F694;
	Tue, 27 May 2025 00:51:10 -0700 (PDT)
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
Subject: [PATCH v3 2/2] mm: Optimize mremap() by PTE batching
Date: Tue, 27 May 2025 13:20:49 +0530
Message-Id: <20250527075049.60215-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250527075049.60215-1-dev.jain@arm.com>
References: <20250527075049.60215-1-dev.jain@arm.com>
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

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mremap.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 0163e02e5aa8..580b41f8d169 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -170,6 +170,24 @@ static pte_t move_soft_dirty_pte(pte_t pte)
 	return pte;
 }
 
+/* mremap a batch of PTEs mapping the same large folio */
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
@@ -177,7 +195,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
 	struct mm_struct *mm = vma->vm_mm;
 	pte_t *old_ptep, *new_ptep;
-	pte_t pte;
+	pte_t old_pte, pte;
 	pmd_t dummy_pmdval;
 	spinlock_t *old_ptl, *new_ptl;
 	bool force_flush = false;
@@ -185,6 +203,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	unsigned long new_addr = pmc->new_addr;
 	unsigned long old_end = old_addr + extent;
 	unsigned long len = old_end - old_addr;
+	int max_nr_ptes;
+	int nr_ptes;
 	int err = 0;
 
 	/*
@@ -236,12 +256,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 
-	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
-				   new_ptep++, new_addr += PAGE_SIZE) {
-		if (pte_none(ptep_get(old_ptep)))
+	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
+		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
+		nr_ptes = 1;
+		max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
+		old_pte = ptep_get(old_ptep);
+		if (pte_none(old_pte))
 			continue;
 
-		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
 		/*
 		 * If we are remapping a valid PTE, make sure
 		 * to flush TLB before we drop the PTL for the
@@ -253,8 +275,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
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
 
@@ -267,7 +293,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 				else if (is_swap_pte(pte))
 					pte = pte_swp_clear_uffd_wp(pte);
 			}
-			set_pte_at(mm, new_addr, new_ptep, pte);
+			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
 		}
 	}
 
-- 
2.30.2

