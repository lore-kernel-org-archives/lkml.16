Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7ED1F4E4F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272589; cv=none; b=HJBWNjXXc1xb4yzumc+Sf83rXzfwOznkaUo2r4m2/1Ih5qwqMTOA8jwk89J+dHesXTadBBqnbdfla3p7wzBw4mHa0gOMHKVwz18sgmNTz5CM1Y3givfF+3L/GIetW55JeYTWcuNx9tsa4pqC7r9P87rWcGB3okbEt5rzdZVX/y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272589; c=relaxed/simple;
	bh=EVppT31Lvruvr7LyntwxcS6OyoxM2LuHdbYOcEQZts4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Swr+zS/srVe64wsNR9Gb0LYtjad9C/vw1eTWTTbgAGXWoQ6n28de18IiR7GyeAFIBEjV++KSnR0XXUPDDIfBkmRlQlnMnsrv0IPaJ7P9x1PaApbxb9jvnTeIZ8WCBntSkusx3r7bjqZdU0syi9r9zPCglFSDUcOectoEq5dfxsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C70313D5;
	Tue, 11 Feb 2025 03:16:49 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D52D43F5A1;
	Tue, 11 Feb 2025 03:16:17 -0800 (PST)
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
Subject: [PATCH v2 16/17] khugepaged: Implement strict policy for mTHP collapse
Date: Tue, 11 Feb 2025 16:43:25 +0530
Message-Id: <20250211111326.14295-17-dev.jain@arm.com>
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

As noted in the discussion thread ending at [1], avoid the creep problem by
collapsing to mTHPs only if max_ptes_none is zero or 511. Along with this,
make mTHP collapse conditions stricter by removing scaling of max_ptes_shared
and max_ptes_swap, and consider collapse only if there are no shared or
swap PTEs in the range.

[1] https://lore.kernel.org/all/8114d47b-b383-4d6e-ab65-a0e88b99c873@arm.com/

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index d2bb008b95e7..b589f889bb5a 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -417,6 +417,17 @@ static inline int hpage_collapse_test_exit_or_disable(struct mm_struct *mm)
 
 static bool thp_enabled(void)
 {
+	bool anon_pmd_enabled = (test_bit(PMD_ORDER, &huge_anon_orders_always) ||
+				 test_bit(PMD_ORDER, &huge_anon_orders_madvise) ||
+			         (test_bit(PMD_ORDER, &huge_anon_orders_inherit) &&
+			         hugepage_global_enabled()));
+
+	/*
+	 * If PMD_ORDER is ineligible for collapse, check if mTHP collapse policy is obeyed;
+	 * see Documentation/admin-guide/transhuge.rst
+	 */
+	bool anon_collapse_mthp = (khugepaged_max_ptes_none == 0 ||
+			      khugepaged_max_ptes_none == HPAGE_PMD_NR - 1);
 	/*
 	 * We cover the anon, shmem and the file-backed case here; file-backed
 	 * hugepages, when configured in, are determined by the global control.
@@ -427,8 +438,9 @@ static bool thp_enabled(void)
 	if (IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) &&
 	    hugepage_global_enabled())
 		return true;
-	if (huge_anon_orders_always || huge_anon_orders_madvise ||
-	    (huge_anon_orders_inherit && hugepage_global_enabled()))
+	if ((huge_anon_orders_always || huge_anon_orders_madvise ||
+	    (huge_anon_orders_inherit && hugepage_global_enabled())) &&
+	    (anon_pmd_enabled || anon_collapse_mthp))
 		return true;
 	if (IS_ENABLED(CONFIG_SHMEM) && shmem_hpage_pmd_enabled())
 		return true;
@@ -578,13 +590,16 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 	pte_t *_pte;
 	int none_or_zero = 0, shared = 0, result = SCAN_FAIL, referenced = 0;
 	bool writable = false;
-	unsigned int max_ptes_shared = khugepaged_max_ptes_shared >> (HPAGE_PMD_ORDER - order);
+	unsigned int max_ptes_shared = khugepaged_max_ptes_shared;
 	unsigned int max_ptes_none = khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER - order);
 	bool all_pfns_present = true;
 	bool all_pfns_contig = true;
 	bool first_pfn_aligned = true;
 	pte_t prev_pteval;
 
+	if (order != HPAGE_PMD_ORDER)
+		max_ptes_shared = 0;
+
 	for (_pte = pte; _pte < pte + (1UL << order);
 	     _pte++, address += PAGE_SIZE) {
 		pte_t pteval = ptep_get(_pte);
@@ -1453,11 +1468,16 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 	order = highest_order(orders);
 	VM_BUG_ON(address & ((PAGE_SIZE << order) - 1));
 
+	max_ptes_none = khugepaged_max_ptes_none;
+	max_ptes_shared = khugepaged_max_ptes_shared;
+	max_ptes_swap = khugepaged_max_ptes_swap;
+
 scan_pte_range:
 
-	max_ptes_shared = khugepaged_max_ptes_shared >> (HPAGE_PMD_ORDER - order);
+	if (order != HPAGE_PMD_ORDER)
+		max_ptes_shared = max_ptes_swap = 0;
+
 	max_ptes_none = khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER - order);
-	max_ptes_swap = khugepaged_max_ptes_swap >> (HPAGE_PMD_ORDER - order);
 	referenced = 0, shared = 0, none_or_zero = 0, unmapped = 0;
 	all_pfns_present = true, all_pfns_contig = true, first_pfn_aligned = true;
 
@@ -2651,6 +2671,11 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 	int order;
 	bool is_file_vma;
 	int prev_progress = 0;
+	bool collapse_mthp = true;
+
+	/* Avoid the creep problem; see Documentation/admin-guide/transhuge.rst */
+	if (khugepaged_max_ptes_none && khugepaged_max_ptes_none != HPAGE_PMD_NR - 1)
+		collapse_mthp = false;
 
 	VM_BUG_ON(!pages);
 	lockdep_assert_held(&khugepaged_mm_lock);
@@ -2710,6 +2735,8 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 			/* select the highest possible order for the VMA */
 			order = highest_order(orders);
 			while (orders) {
+				if (order != HPAGE_PMD_ORDER && !collapse_mthp)
+					goto skip;
 				hend = round_down(vma->vm_end, PAGE_SIZE << order);
 				if (khugepaged_scan.address <= hend)
 					break;
-- 
2.30.2

