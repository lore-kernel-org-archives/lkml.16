Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5847D2690D1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640945; cv=none; b=cZgKcWkGq3ddhBX0RNEQMI+2X5TlVDdjkhFDbXc2b9Qwx/R7XA7y4Ew2hzpOnQdo8LYWrKClVfLpHGDADIk8FrcCQLLfX4EoHQTXPH8PhZO8rUDDJhLq7rgNTmjICCcQxiLyaC5bYYj1uuqgPm2QGbEG26+yTzIOWTpU/8jX2Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640945; c=relaxed/simple;
	bh=QQ0iSb0HwHIad4vV84x6DnjfGBqBis3g6pyoVTLcDKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=be1hg72NRpeSNIY/7dW0PEyZqx/rNsKQ6uYt65+fs6kE8HNPPCeGOF5MLLnhKMtWD+X82LOGdv1ECWqPMVOSpLGksDY31d6T3Rr5AI4RtFVxz8xjtEHh79HKKpMMOXKMEsjXGcoWcKFbEJuzgtT6fcyaEEFxg+vh6WFaOFlVOQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFEEF14BF;
	Mon, 19 May 2025 00:48:49 -0700 (PDT)
Received: from K4MQJ0H1H2.blr.arm.com (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 058463F6A8;
	Mon, 19 May 2025 00:48:55 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v3 3/5] mm: Optimize mprotect() by PTE batching
Date: Mon, 19 May 2025 13:18:22 +0530
Message-Id: <20250519074824.42909-4-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250519074824.42909-1-dev.jain@arm.com>
References: <20250519074824.42909-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use folio_pte_batch to batch process a large folio. Reuse the folio from prot_numa
case if possible. Since modify_prot_start_ptes() gathers access/dirty bits,
it lets us batch around pte_needs_flush() (for parisc, the definition includes
the access bit).
For all cases other than the PageAnonExclusive case, if the case holds true
for one pte in the batch, one can confirm that that case will hold true for
other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty and access bits
across the batch, therefore batching across pte_dirty(): this is correct since
the dirty bit on the PTE really is just an indication that the folio got written
to, so even if the PTE is not actually dirty (but one of the PTEs in the batch is),
the wp-fault optimization can be made.
The crux now is how to batch around the PageAnonExclusive case; we must check
the corresponding condition for every single page. Therefore, from the large
folio batch, we process sub batches of ptes mapping pages with the same PageAnonExclusive
condition, and process that sub batch, then determine and process the next sub batch,
and so on. Note that this does not cause any extra overhead; if suppose the size of
the folio batch is 512, then the sub batch processing in total will take 512 iterations,
which is the same as what we would have done before.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/mm.h |   7 ++-
 mm/mprotect.c      | 126 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 104 insertions(+), 29 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 43748c8f3454..7d5b96f005dc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2542,8 +2542,11 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
 #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
 					    MM_CP_UFFD_WP_RESOLVE)
 
-bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
-			     pte_t pte);
+bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte, int max_len, int *len);
+#define can_change_pte_writable(vma, addr, pte)	\
+	can_change_ptes_writable(vma, addr, pte, 1, NULL)
+
 extern long change_protection(struct mmu_gather *tlb,
 			      struct vm_area_struct *vma, unsigned long start,
 			      unsigned long end, unsigned long cp_flags);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 124612ce3d24..6cd8cdc168fa 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -40,25 +40,36 @@
 
 #include "internal.h"
 
-bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
-			     pte_t pte)
+bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte, int max_len, int *len)
 {
 	struct page *page;
+	bool temp_ret;
+	bool ret;
+	int i;
 
-	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
-		return false;
+	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE))) {
+		ret = false;
+		goto out;
+	}
 
 	/* Don't touch entries that are not even readable. */
-	if (pte_protnone(pte))
-		return false;
+	if (pte_protnone(pte)) {
+		ret = false;
+		goto out;
+	}
 
 	/* Do we need write faults for softdirty tracking? */
-	if (pte_needs_soft_dirty_wp(vma, pte))
-		return false;
+	if (pte_needs_soft_dirty_wp(vma, pte)) {
+		ret = false;
+		goto out;
+	}
 
 	/* Do we need write faults for uffd-wp tracking? */
-	if (userfaultfd_pte_wp(vma, pte))
-		return false;
+	if (userfaultfd_pte_wp(vma, pte)) {
+		ret = false;
+		goto out;
+	}
 
 	if (!(vma->vm_flags & VM_SHARED)) {
 		/*
@@ -68,7 +79,19 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 		 * any additional checks while holding the PT lock.
 		 */
 		page = vm_normal_page(vma, addr, pte);
-		return page && PageAnon(page) && PageAnonExclusive(page);
+		ret = (page && PageAnon(page) && PageAnonExclusive(page));
+		if (!len)
+			return ret;
+
+		/* Check how many consecutive pages are AnonExclusive or not */
+		for (i = 1; i < max_len; ++i) {
+			++page;
+			temp_ret = (page && PageAnon(page) && PageAnonExclusive(page));
+			if (temp_ret != ret)
+				break;
+		}
+		*len = i;
+		return ret;
 	}
 
 	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
@@ -80,21 +103,55 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	 * FS was already notified and we can simply mark the PTE writable
 	 * just like the write-fault handler would do.
 	 */
-	return pte_dirty(pte);
+	ret = pte_dirty(pte);
+
+out:
+	/* The entire batch is guaranteed to have the same return value */
+	if (len)
+		*len = max_len;
+	return ret;
 }
 
 static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
-		pte_t pte, int max_nr_ptes)
+		pte_t pte, int max_nr_ptes, bool ignore_soft_dirty)
 {
-	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	fpb_t flags = FPB_IGNORE_DIRTY;
 
-	if (!folio_test_large(folio) || (max_nr_ptes == 1))
+	if (ignore_soft_dirty)
+		flags |= FPB_IGNORE_SOFT_DIRTY;
+
+	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
 		return 1;
 
 	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
 			       NULL, NULL, NULL);
 }
 
+/**
+ * modify_sub_batch - Identifies a sub-batch which has the same return value
+ * of can_change_pte_writable(), from within a folio batch. max_len is the
+ * max length of the possible sub-batch. sub_batch_idx is the offset from
+ * the start of the original folio batch.
+ */
+static int modify_sub_batch(struct vm_area_struct *vma, struct mmu_gather *tlb,
+		unsigned long addr, pte_t *ptep, pte_t oldpte, pte_t ptent,
+		int max_len, int sub_batch_idx)
+{
+	unsigned long new_addr = addr + sub_batch_idx * PAGE_SIZE;
+	pte_t new_oldpte = pte_advance_pfn(oldpte, sub_batch_idx);
+	pte_t new_ptent = pte_advance_pfn(ptent, sub_batch_idx);
+	pte_t *new_ptep = ptep + sub_batch_idx;
+	int len = 1;
+
+	if (can_change_ptes_writable(vma, new_addr, new_ptent, max_len, &len))
+		new_ptent = pte_mkwrite(new_ptent, vma);
+
+	modify_prot_commit_ptes(vma, new_addr, new_ptep, new_oldpte, new_ptent, len);
+	if (pte_needs_flush(new_oldpte, new_ptent))
+		tlb_flush_pte_range(tlb, new_addr, len * PAGE_SIZE);
+	return len;
+}
+
 static long change_pte_range(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
@@ -106,7 +163,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
 	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
-	int nr_ptes;
+	int sub_batch_idx, max_len, len, nr_ptes;
 
 	tlb_change_page_size(tlb, PAGE_SIZE);
 	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
@@ -121,10 +178,12 @@ static long change_pte_range(struct mmu_gather *tlb,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 	do {
+		sub_batch_idx = 0;
 		nr_ptes = 1;
 		oldpte = ptep_get(pte);
 		if (pte_present(oldpte)) {
 			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
+			struct folio *folio = NULL;
 			pte_t ptent;
 
 			/*
@@ -132,7 +191,6 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 * pages. See similar comment in change_huge_pmd.
 			 */
 			if (prot_numa) {
-				struct folio *folio;
 				int nid;
 				bool toptier;
 
@@ -180,7 +238,8 @@ static long change_pte_range(struct mmu_gather *tlb,
 				    toptier) {
 skip_batch:
 					nr_ptes = mprotect_batch(folio, addr, pte,
-								 oldpte, max_nr_ptes);
+								 oldpte, max_nr_ptes,
+								 true);
 					continue;
 				}
 				if (folio_use_access_time(folio))
@@ -188,6 +247,11 @@ static long change_pte_range(struct mmu_gather *tlb,
 						jiffies_to_msecs(jiffies));
 			}
 
+			if (!folio)
+				folio = vm_normal_folio(vma, addr, oldpte);
+
+			nr_ptes = mprotect_batch(folio, addr, pte, oldpte,
+						 max_nr_ptes, false);
 			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
 			ptent = pte_modify(oldpte, newprot);
 
@@ -209,15 +273,23 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 * example, if a PTE is already dirty and no other
 			 * COW or special handling is required.
 			 */
-			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
-			    !pte_write(ptent) &&
-			    can_change_pte_writable(vma, addr, ptent))
-				ptent = pte_mkwrite(ptent, vma);
-
-			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
-			if (pte_needs_flush(oldpte, ptent))
-				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
-			pages++;
+			if (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) {
+				max_len = nr_ptes;
+				while (sub_batch_idx < nr_ptes) {
+
+					/* Get length of sub batch */
+					len = modify_sub_batch(vma, tlb, addr, pte,
+							       oldpte, ptent, max_len,
+							       sub_batch_idx);
+					sub_batch_idx += len;
+					max_len -= len;
+				}
+			} else {
+				modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
+				if (pte_needs_flush(oldpte, ptent))
+					tlb_flush_pte_range(tlb, addr, nr_ptes * PAGE_SIZE);
+			}
+			pages += nr_ptes;
 		} else if (is_swap_pte(oldpte)) {
 			swp_entry_t entry = pte_to_swp_entry(oldpte);
 			pte_t newpte;
-- 
2.30.2

