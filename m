Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0901F5402
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272517; cv=none; b=QmJ/MwWKAgWPmYOsELNqBUasgbxCcvO7nHRR8CYGsY6nLPSji2aPhwimjd2lrotOa63uOSCTsfmbTmVQb6gC+3r5/TsTpCOE60I2r3yI9/VqsQJbTp2Vt/3pUZNfmIfWRjtcehif8566w4rHyVUjYxsfUoFbDf5Y+U9QmxIXzi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272517; c=relaxed/simple;
	bh=xBpgNPJmcBGZi9tJuNxF+QwninsTQ5o86m9CO/ljJTI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EULk1M4qV2u+YjFsvurBl1Fc8OY1XTLgmycgQurzse6vxLk6eyWu825bk1lkn9ZA20ZZ86hWrVSTkkx9YnAXj+kfEDhu5TRkAFb02hy9Te+Jubh1OAnWeFZXbIQblxc42ifJfZoOb55MBODOaqQDPjd/tKXu/6l1oRrXzRCvyYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD31513D5;
	Tue, 11 Feb 2025 03:15:36 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 863983F5A1;
	Tue, 11 Feb 2025 03:15:05 -0800 (PST)
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
Subject: [PATCH v2 09/17] khugepaged: Define collapse policy if a larger folio is already mapped
Date: Tue, 11 Feb 2025 16:43:18 +0530
Message-Id: <20250211111326.14295-10-dev.jain@arm.com>
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

As noted in [1], khugepaged's goal must be to collapse memory to the highest aligned
order possible. Suppose khugepaged is scanning for 64K, and we have a 128K folio,
whose first 64K half is VA-PA aligned and fully mapped. In such a case, it does not make
sense to break this down into two 64K folios. On the other hand, if the first half is
not aligned, or it is partially mapped, it makes sense for khugepaged to collapse this
portion into a VA-PA aligned fully mapped 64K folio. 

[1] https://lore.kernel.org/all/aa647830-cf55-48f0-98c2-8230796e35b3@arm.com/

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a674014b6563..0d0d8f415a2e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -34,6 +34,7 @@ enum scan_result {
 	SCAN_PMD_NULL,
 	SCAN_PMD_NONE,
 	SCAN_PMD_MAPPED,
+	SCAN_PTE_MAPPED_THP,
 	SCAN_EXCEED_NONE_PTE,
 	SCAN_EXCEED_SWAP_PTE,
 	SCAN_EXCEED_SHARED_PTE,
@@ -562,6 +563,14 @@ static bool is_refcount_suitable(struct folio *folio)
 	return folio_ref_count(folio) == expected_refcount;
 }
 
+/* Assumes an embedded PFN */
+static bool is_same_folio(pte_t *first_pte, pte_t *last_pte)
+{
+	struct folio *folio1 = page_folio(pte_page(ptep_get(first_pte)));
+	struct folio *folio2 = page_folio(pte_page(ptep_get(last_pte)));
+	return folio1 == folio2;
+}
+
 static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 					unsigned long address,
 					pte_t *pte,
@@ -575,13 +584,22 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 	bool writable = false;
 	unsigned int max_ptes_shared = khugepaged_max_ptes_shared >> (HPAGE_PMD_ORDER - order);
 	unsigned int max_ptes_none = khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER - order);
+	bool all_pfns_present = true;
+	bool all_pfns_contig = true;
+	bool first_pfn_aligned = true;
+	pte_t prev_pteval;
 
 	for (_pte = pte; _pte < pte + (1UL << order);
 	     _pte++, address += PAGE_SIZE) {
 		pte_t pteval = ptep_get(_pte);
+		if (_pte == pte) {
+			if (!IS_ALIGNED(pte_pfn(pteval), (1UL << order)))
+				first_pfn_aligned = false;
+		}
 		if (pte_none(pteval) || (pte_present(pteval) &&
 				is_zero_pfn(pte_pfn(pteval)))) {
 			++none_or_zero;
+			all_pfns_present = false;
 			if (!userfaultfd_armed(vma) &&
 			    (!cc->is_khugepaged ||
 			     none_or_zero <= max_ptes_none)) {
@@ -660,6 +678,12 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 
+		if (all_pfns_contig && (pte != _pte) && !(all_pfns_present &&
+		    (pte_pfn(pteval) == pte_pfn(prev_pteval) + 1)))
+			all_pfns_contig = false;
+
+		prev_pteval = pteval;
+
 		/*
 		 * Isolate the page to avoid collapsing an hugepage
 		 * currently in use by the VM.
@@ -696,6 +720,10 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		result = SCAN_PAGE_RO;
 	} else if (unlikely(cc->is_khugepaged && !referenced)) {
 		result = SCAN_LACK_REFERENCED_PAGE;
+	} else if ((result == SCAN_SUCCEED) && (order != HPAGE_PMD_ORDER) && all_pfns_present &&
+		    all_pfns_contig && first_pfn_aligned &&
+		    is_same_folio(pte, pte + (1UL << order) - 1)) {
+		result = SCAN_PTE_MAPPED_THP;
 	} else {
 		result = SCAN_SUCCEED;
 		trace_mm_collapse_huge_page_isolate(&folio->page, none_or_zero,
@@ -1398,6 +1426,8 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 	bool writable = false;
 	unsigned long orders, orig_orders;
 	int order, prev_order;
+	bool all_pfns_present, all_pfns_contig, first_pfn_aligned;
+	pte_t prev_pteval;
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 
@@ -1417,6 +1447,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 	max_ptes_none = khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER - order);
 	max_ptes_swap = khugepaged_max_ptes_swap >> (HPAGE_PMD_ORDER - order);
 	referenced = 0, shared = 0, none_or_zero = 0, unmapped = 0;
+	all_pfns_present = true, all_pfns_contig = true, first_pfn_aligned = true;
 
 	/* Check pmd after taking mmap lock */
 	result = find_pmd_or_thp_or_none(mm, address, &pmd);
@@ -1435,8 +1466,14 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 	for (_address = address, _pte = pte; _pte < pte + (1UL << order);
 	     _pte++, _address += PAGE_SIZE) {
 		pte_t pteval = ptep_get(_pte);
+		if (_pte == pte) {
+			if (!IS_ALIGNED(pte_pfn(pteval), (1UL << order)))
+				first_pfn_aligned = false;
+		}
+
 		if (is_swap_pte(pteval)) {
 			++unmapped;
+			all_pfns_present = false;
 			if (!cc->is_khugepaged ||
 			    unmapped <= max_ptes_swap) {
 				/*
@@ -1457,6 +1494,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		}
 		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
 			++none_or_zero;
+			all_pfns_present = false;
 			if (!userfaultfd_armed(vma) &&
 			    (!cc->is_khugepaged ||
 			     none_or_zero <= max_ptes_none)) {
@@ -1546,6 +1584,17 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 			goto out_unmap;
 		}
 
+
+		/*
+		 * PFNs not contig, if either at least one PFN not present, or the previous
+		 * and this PFN are not contig
+		 */
+		if (all_pfns_contig && (pte != _pte) && !(all_pfns_present &&
+		    (pte_pfn(pteval) == pte_pfn(prev_pteval) + 1)))
+			all_pfns_contig = false;
+
+		prev_pteval = pteval;
+
 		/*
 		 * If collapse was initiated by khugepaged, check that there is
 		 * enough young pte to justify collapsing the page
@@ -1567,15 +1616,30 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 	}
 out_unmap:
 	pte_unmap_unlock(pte, ptl);
+
+	/*
+	 * We skip if the following conditions are true:
+	 * 1) All PTEs point to consecutive PFNs
+	 * 2) All PFNs belong to the same folio
+	 * 3) The PFNs are PA-aligned to the order we are scanning for
+	 */
+	if ((result == SCAN_SUCCEED) && (order != HPAGE_PMD_ORDER) && all_pfns_present &&
+	     all_pfns_contig && first_pfn_aligned &&
+	     is_same_folio(pte, pte + (1UL << order) - 1)) {
+		result = SCAN_PTE_MAPPED_THP;
+		goto decide_order;
+	}
+
 	if (result == SCAN_SUCCEED) {
 		result = collapse_huge_page(mm, address, referenced,
 					    unmapped, order, cc);
 		/* collapse_huge_page will return with the mmap_lock released */
 		*mmap_locked = false;
 		/* Skip over this range and decide order */
-		if (result == SCAN_SUCCEED)
+		if (result == SCAN_SUCCEED || result == SCAN_PTE_MAPPED_THP)
 			goto decide_order;
 	}
+
 	if (result != SCAN_SUCCEED) {
 
 		/* Go to the next order */
-- 
2.30.2

