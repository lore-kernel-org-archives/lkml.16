Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019751F8AE2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272496; cv=none; b=WldCSOXpc257TyWzo4LAcphoMpWy0NPAJOK1BTXnzDy0vKL0nECG/Ju4kTXOYO6ww8wub5LdcWUT39jb9bPxh22LSFTTeYbhqYNVNeBWSDTY2/TxlCR0dlZIlkT8od9SjCioLu1m6gS3QqnzBjFbSLqhSjT/6P15S1MDkhOI0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272496; c=relaxed/simple;
	bh=qIe1n2fRd93WsJXbutKwSy4FavldfpbBCniyhgWdJok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GKkf7Q8rLSQRlw5Q/h3y5ZUz9CBZUdfcTs/D1PGuNLIQbywjyqRQAZlhqRpJFcQAnnMDFi3Hv95ihsMTykYoOjBDA83H0s+kGy0kO3qC9CPP3q/qFtGV21P8sWAiyXdsta450TAC1hPJzttAXP228WH5a4kGBnf8qJ5HoRWde5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C658E13D5;
	Tue, 11 Feb 2025 03:15:15 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA1D23F5A1;
	Tue, 11 Feb 2025 03:14:44 -0800 (PST)
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
Subject: [PATCH v2 07/17] khugepaged: Scan PTEs order-wise
Date: Tue, 11 Feb 2025 16:43:16 +0530
Message-Id: <20250211111326.14295-8-dev.jain@arm.com>
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

Scan the PTEs order-wise, using the mask of suitable orders for this VMA
derived in conjunction with sysfs THP settings. Scale down the tunables (to
be changed in subsequent patches); in case of collapse failure, we drop down
to the next order. Otherwise, we try to jump to the highest possible order
and then start a fresh scan. Note that madvise(MADV_COLLAPSE) has not been generalized.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 97 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 14 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 498cb5ad9ff1..fbfd8a78ef51 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -21,6 +21,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/dax.h>
 #include <linux/ksm.h>
+#include <linux/count_zeros.h>
 
 #include <asm/tlb.h>
 #include <asm/pgalloc.h>
@@ -1295,36 +1296,57 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 {
 	pmd_t *pmd;
 	pte_t *pte, *_pte;
-	int result = SCAN_FAIL, referenced = 0;
-	int none_or_zero = 0, shared = 0;
-	struct page *page = NULL;
 	struct folio *folio = NULL;
-	unsigned long _address;
+	int result = SCAN_FAIL;
 	spinlock_t *ptl;
-	int node = NUMA_NO_NODE, unmapped = 0;
+	unsigned int max_ptes_shared, max_ptes_none, max_ptes_swap;
+	int referenced, shared, none_or_zero, unmapped;
+	unsigned long _address, orig_address = address;
+	int node = NUMA_NO_NODE;
 	bool writable = false;
+	unsigned long orders, orig_orders;
+	int order, prev_order;
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 
+	orders = thp_vma_allowable_orders(vma, vma->vm_flags,
+			TVA_IN_PF | TVA_ENFORCE_SYSFS, THP_ORDERS_ALL_ANON);
+	orders = thp_vma_suitable_orders(vma, address, orders);
+	orig_orders = orders;
+	order = highest_order(orders);
+
+	/* MADV_COLLAPSE needs to work irrespective of sysfs setting */
+	if (!cc->is_khugepaged)
+		order = HPAGE_PMD_ORDER;
+
+scan_pte_range:
+
+	max_ptes_shared = khugepaged_max_ptes_shared >> (HPAGE_PMD_ORDER - order);
+	max_ptes_none = khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER - order);
+	max_ptes_swap = khugepaged_max_ptes_swap >> (HPAGE_PMD_ORDER - order);
+	referenced = 0, shared = 0, none_or_zero = 0, unmapped = 0;
+
+	/* Check pmd after taking mmap lock */
 	result = find_pmd_or_thp_or_none(mm, address, &pmd);
 	if (result != SCAN_SUCCEED)
 		goto out;
 
 	memset(cc->node_load, 0, sizeof(cc->node_load));
 	nodes_clear(cc->alloc_nmask);
+
 	pte = pte_offset_map_lock(mm, pmd, address, &ptl);
 	if (!pte) {
 		result = SCAN_PMD_NULL;
 		goto out;
 	}
 
-	for (_address = address, _pte = pte; _pte < pte + HPAGE_PMD_NR;
+	for (_address = address, _pte = pte; _pte < pte + (1UL << order);
 	     _pte++, _address += PAGE_SIZE) {
 		pte_t pteval = ptep_get(_pte);
 		if (is_swap_pte(pteval)) {
 			++unmapped;
 			if (!cc->is_khugepaged ||
-			    unmapped <= khugepaged_max_ptes_swap) {
+			    unmapped <= max_ptes_swap) {
 				/*
 				 * Always be strict with uffd-wp
 				 * enabled swap entries.  Please see
@@ -1345,7 +1367,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 			++none_or_zero;
 			if (!userfaultfd_armed(vma) &&
 			    (!cc->is_khugepaged ||
-			     none_or_zero <= khugepaged_max_ptes_none)) {
+			     none_or_zero <= max_ptes_none)) {
 				continue;
 			} else {
 				result = SCAN_EXCEED_NONE_PTE;
@@ -1369,12 +1391,11 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		if (pte_write(pteval))
 			writable = true;
 
-		page = vm_normal_page(vma, _address, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		folio = vm_normal_folio(vma, _address, pteval);
+		if (unlikely(!folio) || unlikely(folio_is_zone_device(folio))) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
 		}
-		folio = page_folio(page);
 
 		if (!folio_test_anon(folio)) {
 			result = SCAN_PAGE_ANON;
@@ -1390,7 +1411,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		if (folio_likely_mapped_shared(folio)) {
 			++shared;
 			if (cc->is_khugepaged &&
-			    shared > khugepaged_max_ptes_shared) {
+			    shared > max_ptes_shared) {
 				result = SCAN_EXCEED_SHARED_PTE;
 				count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
 				goto out_unmap;
@@ -1447,7 +1468,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		result = SCAN_PAGE_RO;
 	} else if (cc->is_khugepaged &&
 		   (!referenced ||
-		    (unmapped && referenced < HPAGE_PMD_NR / 2))) {
+		    (unmapped && referenced < (1UL << order) / 2))) {
 		result = SCAN_LACK_REFERENCED_PAGE;
 	} else {
 		result = SCAN_SUCCEED;
@@ -1456,10 +1477,58 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 	pte_unmap_unlock(pte, ptl);
 	if (result == SCAN_SUCCEED) {
 		result = collapse_huge_page(mm, address, referenced,
-					    unmapped, HPAGE_PMD_ORDER, cc);
+					    unmapped, order, cc);
 		/* collapse_huge_page will return with the mmap_lock released */
 		*mmap_locked = false;
+		/* Skip over this range and decide order */
+		if (result == SCAN_SUCCEED)
+			goto decide_order;
+	}
+	if (result != SCAN_SUCCEED) {
+
+		/* Go to the next order */
+		prev_order = order;
+		order = next_order(&orders, order);
+		if (order < 2) {
+			/* Skip over this range, and decide order */
+			_address = address + (PAGE_SIZE << prev_order);
+			_pte = pte + (1UL << prev_order);
+			goto decide_order;
+		}
+		goto maybe_mmap_lock;
 	}
+
+decide_order:
+		/* Immediately exit on exhaustion of range */
+		if (_address == orig_address + (PAGE_SIZE << HPAGE_PMD_ORDER))
+			goto out;
+
+		/* Get highest order possible starting from address */
+		order = count_trailing_zeros(_address >> PAGE_SHIFT);
+
+		orders = orig_orders & ((1UL << (order + 1)) - 1);
+		if (!(orders & (1UL << order)))
+			order = next_order(&orders, order);
+
+		/* This should never happen, since we are on an aligned address */
+		BUG_ON(cc->is_khugepaged && order < 2);
+
+		address = _address;
+		pte = _pte;
+
+maybe_mmap_lock:
+		if (!(*mmap_locked)) {
+			mmap_read_lock(mm);
+			*mmap_locked = true;
+			/* Validate VMA after retaking mmap_lock */
+			result = hugepage_vma_revalidate(mm, address, true, &vma,
+							 order, cc);
+			if (result != SCAN_SUCCEED) {
+				mmap_read_unlock(mm);
+				goto out;
+			}
+		}
+		goto scan_pte_range;
 out:
 	trace_mm_khugepaged_scan_pmd(mm, &folio->page, writable, referenced,
 				     none_or_zero, result, unmapped);
-- 
2.30.2

