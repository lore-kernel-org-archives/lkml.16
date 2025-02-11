Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C250D1F8BBF
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272486; cv=none; b=qQUq4OJv56jgtr9on6Mv7oKtTrNjxthObJfz75heuB8zM5RIfciY5f2Tv66QpkHa+BM53J53cEepMa31nFPHZOTKIzmcdkaUHfZItmyJgrinTrUsX8JdlGjIf5/7jpyayutwHdSpt0MjOzxTR25Pxi0bCMl1ZokoDhy+iSKTerI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272486; c=relaxed/simple;
	bh=QtCGg1k8AS+ss+xeR1GSZ7MyoMI5xCjGFG+b4Kji6Dg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hp25NZQMMA78LSUYaoWYGMJ8QInRd+G1Kv4gQ24AmvwP/Bv3rmMxF9TDqiBAegXIwYC24kQLRHAZHTYllDfDb0nUwsCqcGyW1sA8zAJbQ1ZVLoxqcJVewLLW6z7qIjVm+zAOJSnFckeU/BL09ZidxTyKYCib12QxBtEJmCBLELY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B5BD13D5;
	Tue, 11 Feb 2025 03:15:05 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9B1463F5A1;
	Tue, 11 Feb 2025 03:14:34 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	willy@infradead.org,
	kirill.shutemov@linux.intel.com
Cc: npache@redhat.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	vbabka@suse.cz,
	mhocko@suse.com,
	apopple@nvidia.com,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	baohua@kernel.org,
	jack@suse.cz,
	srivatsa@csail.mit.edu,
	haowenchao22@gmail.com,
	hughd@google.com,
	aneesh.kumar@kernel.org,
	yang@os.amperecomputing.com,
	peterx@redhat.com,
	ioworker0@gmail.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	jglisse@google.com,
	surenb@google.com,
	vishal.moola@gmail.com,
	zokeefe@google.com,
	zhengqi.arch@bytedance.com,
	jhubbard@nvidia.com,
	21cnbao@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 06/17] khugepaged: Abstract PMD-THP collapse
Date: Tue, 11 Feb 2025 16:43:15 +0530
Message-Id: <20250211111326.14295-7-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250211111326.14295-1-dev.jain@arm.com>
References: <20250211111326.14295-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Abstract away copying page contents, and setting the PMD, into
vma_collapse_anon_folio_pmd().

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 140 +++++++++++++++++++++++++++---------------------
 1 file changed, 78 insertions(+), 62 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 99eb1f72a508..498cb5ad9ff1 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1109,76 +1109,27 @@ static int alloc_charge_folio(struct folio **foliop, struct mm_struct *mm,
 	return SCAN_SUCCEED;
 }
 
-static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
-			      int referenced, int unmapped,
-			      struct collapse_control *cc)
+static int vma_collapse_anon_folio_pmd(struct mm_struct *mm, unsigned long address,
+		struct vm_area_struct *vma, struct collapse_control *cc, pmd_t *pmd,
+		struct folio *folio)
 {
 	LIST_HEAD(compound_pagelist);
-	pmd_t *pmd, _pmd;
-	pte_t *pte;
 	pgtable_t pgtable;
-	struct folio *folio;
 	spinlock_t *pmd_ptl, *pte_ptl;
 	int result = SCAN_FAIL;
-	struct vm_area_struct *vma;
 	struct mmu_notifier_range range;
+	pmd_t _pmd;
+	pte_t *pte;
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 
-	/*
-	 * Before allocating the hugepage, release the mmap_lock read lock.
-	 * The allocation can take potentially a long time if it involves
-	 * sync compaction, and we do not need to hold the mmap_lock during
-	 * that. We will recheck the vma after taking it again in write mode.
-	 */
-	mmap_read_unlock(mm);
-
-	result = alloc_charge_folio(&folio, mm, HPAGE_PMD_ORDER, cc);
-	if (result != SCAN_SUCCEED)
-		goto out_nolock;
-
-	mmap_read_lock(mm);
-	result = hugepage_vma_revalidate(mm, address, true, &vma, HPAGE_PMD_ORDER, cc);
-	if (result != SCAN_SUCCEED) {
-		mmap_read_unlock(mm);
-		goto out_nolock;
-	}
-
-	result = find_pmd_or_thp_or_none(mm, address, &pmd);
-	if (result != SCAN_SUCCEED) {
-		mmap_read_unlock(mm);
-		goto out_nolock;
-	}
-
-	if (unmapped) {
-		/*
-		 * __collapse_huge_page_swapin will return with mmap_lock
-		 * released when it fails. So we jump out_nolock directly in
-		 * that case.  Continuing to collapse causes inconsistency.
-		 */
-		result = __collapse_huge_page_swapin(mm, vma, address, pmd,
-						     referenced, HPAGE_PMD_ORDER);
-		if (result != SCAN_SUCCEED)
-			goto out_nolock;
-	}
-
-	mmap_read_unlock(mm);
-	/*
-	 * Prevent all access to pagetables with the exception of
-	 * gup_fast later handled by the ptep_clear_flush and the VM
-	 * handled by the anon_vma lock + PG_lock.
-	 *
-	 * UFFDIO_MOVE is prevented to race as well thanks to the
-	 * mmap_lock.
-	 */
-	mmap_write_lock(mm);
 	result = hugepage_vma_revalidate(mm, address, true, &vma, HPAGE_PMD_ORDER, cc);
 	if (result != SCAN_SUCCEED)
-		goto out_up_write;
+		goto out;
 	/* check if the pmd is still valid */
 	result = check_pmd_still_valid(mm, address, pmd);
 	if (result != SCAN_SUCCEED)
-		goto out_up_write;
+		goto out;
 
 	vma_start_write(vma);
 	anon_vma_lock_write(vma->anon_vma);
@@ -1223,7 +1174,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 		pmd_populate(mm, pmd, pmd_pgtable(_pmd));
 		spin_unlock(pmd_ptl);
 		anon_vma_unlock_write(vma->anon_vma);
-		goto out_up_write;
+		goto out;
 	}
 
 	/*
@@ -1237,7 +1188,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 					   &compound_pagelist, HPAGE_PMD_ORDER);
 	pte_unmap(pte);
 	if (unlikely(result != SCAN_SUCCEED))
-		goto out_up_write;
+		goto out;
 
 	/*
 	 * The smp_wmb() inside __folio_mark_uptodate() ensures the
@@ -1260,11 +1211,76 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	deferred_split_folio(folio, false);
 	spin_unlock(pmd_ptl);
 
-	folio = NULL;
-
 	result = SCAN_SUCCEED;
-out_up_write:
+out:
+	return result;
+}
+
+static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
+			      int referenced, int unmapped, int order,
+			      struct collapse_control *cc)
+{
+	struct vm_area_struct *vma;
+	int result = SCAN_FAIL;
+	struct folio *folio;
+	pmd_t *pmd;
+
+	/*
+	 * Before allocating the hugepage, release the mmap_lock read lock.
+	 * The allocation can take potentially a long time if it involves
+	 * sync compaction, and we do not need to hold the mmap_lock during
+	 * that. We will recheck the vma after taking it again in write mode.
+	 */
+	mmap_read_unlock(mm);
+
+	result = alloc_charge_folio(&folio, mm, order, cc);
+	if (result != SCAN_SUCCEED)
+		goto out_nolock;
+
+	mmap_read_lock(mm);
+	result = hugepage_vma_revalidate(mm, address, true, &vma, order, cc);
+	if (result != SCAN_SUCCEED) {
+		mmap_read_unlock(mm);
+		goto out_nolock;
+	}
+
+	result = find_pmd_or_thp_or_none(mm, address, &pmd);
+	if (result != SCAN_SUCCEED) {
+		mmap_read_unlock(mm);
+		goto out_nolock;
+	}
+
+	if (unmapped) {
+		/*
+		 * __collapse_huge_page_swapin will return with mmap_lock
+		 * released when it fails. So we jump out_nolock directly in
+		 * that case.  Continuing to collapse causes inconsistency.
+		 */
+		result = __collapse_huge_page_swapin(mm, vma, address, pmd,
+						     referenced, order);
+		if (result != SCAN_SUCCEED)
+			goto out_nolock;
+	}
+
+	mmap_read_unlock(mm);
+	/*
+	 * Prevent all access to pagetables with the exception of
+	 * gup_fast later handled by the ptep_clear_flush and the VM
+	 * handled by the anon_vma lock + PG_lock.
+	 *
+	 * UFFDIO_MOVE is prevented to race as well thanks to the
+	 * mmap_lock.
+	 */
+	mmap_write_lock(mm);
+
+	if (order == HPAGE_PMD_ORDER)
+		result = vma_collapse_anon_folio_pmd(mm, address, vma, cc, pmd, folio);
+
 	mmap_write_unlock(mm);
+
+	if (result == SCAN_SUCCEED)
+		folio = NULL;
+
 out_nolock:
 	if (folio)
 		folio_put(folio);
@@ -1440,7 +1456,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 	pte_unmap_unlock(pte, ptl);
 	if (result == SCAN_SUCCEED) {
 		result = collapse_huge_page(mm, address, referenced,
-					    unmapped, cc);
+					    unmapped, HPAGE_PMD_ORDER, cc);
 		/* collapse_huge_page will return with the mmap_lock released */
 		*mmap_locked = false;
 	}
-- 
2.30.2

