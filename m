Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316861E5B87
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272466; cv=none; b=acmgxgtUkOuL4kDOX3OBLdbSFpKddnTMh0PWPIAKuJWOAQ3tURbqDXt4rf0ftRjbt1cK6r2o4WeD0NIvCq8GzQJ1vKxEJKCtPfhK8CG4Xv6Fu/lSIBYTOWRu8neyGuunBakfWM/NA0UseSoXBBVqMdqUqvj8Mx1lY2eNTo1qloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272466; c=relaxed/simple;
	bh=rZDBMkAjRlByC8BV0StYG3t83MI1FHKY+GoDNcmZWTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=glVQvaxIv3eTDMyCMXoJiwNr/NOCO/rcUqTDZB5VrBvv0/EZvoKCluRR6qJ+TRvUj9/79ZTzgG4JEqOCu4PwdS+c+LG7AdCEGK787zx/rzMC/6vDZVNe8vNcFPYJ5RKUOlAJmeOq2kEqz63HiecIWzdRmDoVaK9rCpAXULf2T4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC9E113D5;
	Tue, 11 Feb 2025 03:14:45 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8E5383F5A1;
	Tue, 11 Feb 2025 03:14:15 -0800 (PST)
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
Subject: [PATCH v2 04/17] khugepaged: Generalize __collapse_huge_page_isolate()
Date: Tue, 11 Feb 2025 16:43:13 +0530
Message-Id: <20250211111326.14295-5-dev.jain@arm.com>
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

Scale down the scan range and the sysfs tunables (to be changed in subsequent patches)
according to the scan order, and isolate the folios.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 221823c0d95f..0ea99df115cb 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -565,15 +565,17 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 					unsigned long address,
 					pte_t *pte,
 					struct collapse_control *cc,
-					struct list_head *compound_pagelist)
+					struct list_head *compound_pagelist,
+					int order)
 {
-	struct page *page = NULL;
 	struct folio *folio = NULL;
 	pte_t *_pte;
 	int none_or_zero = 0, shared = 0, result = SCAN_FAIL, referenced = 0;
 	bool writable = false;
+	unsigned int max_ptes_shared = khugepaged_max_ptes_shared >> (HPAGE_PMD_ORDER - order);
+	unsigned int max_ptes_none = khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER - order);
 
-	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
+	for (_pte = pte; _pte < pte + (1UL << order);
 	     _pte++, address += PAGE_SIZE) {
 		pte_t pteval = ptep_get(_pte);
 		if (pte_none(pteval) || (pte_present(pteval) &&
@@ -581,7 +583,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			++none_or_zero;
 			if (!userfaultfd_armed(vma) &&
 			    (!cc->is_khugepaged ||
-			     none_or_zero <= khugepaged_max_ptes_none)) {
+			     none_or_zero <= max_ptes_none)) {
 				continue;
 			} else {
 				result = SCAN_EXCEED_NONE_PTE;
@@ -597,20 +599,19 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			result = SCAN_PTE_UFFD_WP;
 			goto out;
 		}
-		page = vm_normal_page(vma, address, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		folio = vm_normal_folio(vma, address, pteval);
+		if (unlikely(!folio) || unlikely(folio_is_zone_device(folio))) {
 			result = SCAN_PAGE_NULL;
 			goto out;
 		}
 
-		folio = page_folio(page);
 		VM_BUG_ON_FOLIO(!folio_test_anon(folio), folio);
 
 		/* See hpage_collapse_scan_pmd(). */
 		if (folio_likely_mapped_shared(folio)) {
 			++shared;
 			if (cc->is_khugepaged &&
-			    shared > khugepaged_max_ptes_shared) {
+			    shared > max_ptes_shared) {
 				result = SCAN_EXCEED_SHARED_PTE;
 				count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
 				goto out;
@@ -1201,7 +1202,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	pte = pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
 	if (pte) {
 		result = __collapse_huge_page_isolate(vma, address, pte, cc,
-						      &compound_pagelist);
+						      &compound_pagelist, HPAGE_PMD_ORDER);
 		spin_unlock(pte_ptl);
 	} else {
 		result = SCAN_PMD_NULL;
-- 
2.30.2

