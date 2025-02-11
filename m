Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7532B1F8ADF
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272548; cv=none; b=CmJerQXu2Clpq7lcTHygcXIq69jWXwqtNv+RrRbocRWBLA6sUdvlnDF00vW/YyA+LIJPl+b9NZ0Rer0kHLAAMVTcBvm6NZ+n9YbrJSD8Tkhigy11njkBVvD9iAvM7tnKxyV5YKwMOLFz/1RxbPtVgMmuQVE40UMg/5AvlDy9HEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272548; c=relaxed/simple;
	bh=4xjvZqeLUawAyQidCrnqVChWR4w8AB2ikrgHA+33gAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AKn3jPbXWhQrTfchXFu4nJB9o84+c8iXmhMs5+FdCDu3qvuAmX+0naFQeIEELTYMF/sGJ5fSERhdW5gdj7n6amxTdW2VU7Tz8fcXeXD8ZJYR5bPthmvRc+WGbQdWB4b5cVMhhcELTb8Zoq+DllZ+RhCOSxW+b8u0ur8KkhB3y2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87B9413D5;
	Tue, 11 Feb 2025 03:16:07 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1289E3F5A1;
	Tue, 11 Feb 2025 03:15:36 -0800 (PST)
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
Subject: [PATCH v2 12/17] khugepaged: Enable variable-sized VMA collapse
Date: Tue, 11 Feb 2025 16:43:21 +0530
Message-Id: <20250211111326.14295-13-dev.jain@arm.com>
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

Applications in general may have a lot of VMAs less than PMD-size. Therefore
it is essential that khugepaged is able to collapse these VMAs.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 68 +++++++++++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 37cfa7beba3d..048f990d8507 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1413,7 +1413,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 				   struct vm_area_struct *vma,
 				   unsigned long address, bool *mmap_locked,
-				   struct collapse_control *cc)
+				   unsigned long orders, struct collapse_control *cc)
 {
 	pmd_t *pmd;
 	pte_t *pte, *_pte;
@@ -1425,22 +1425,14 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 	unsigned long _address, orig_address = address;
 	int node = NUMA_NO_NODE;
 	bool writable = false;
-	unsigned long orders, orig_orders;
+	unsigned long orig_orders;
 	int order, prev_order;
 	bool all_pfns_present, all_pfns_contig, first_pfn_aligned;
 	pte_t prev_pteval;
 
-	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
-
-	orders = thp_vma_allowable_orders(vma, vma->vm_flags,
-			TVA_IN_PF | TVA_ENFORCE_SYSFS, THP_ORDERS_ALL_ANON);
-	orders = thp_vma_suitable_orders(vma, address, orders);
 	orig_orders = orders;
 	order = highest_order(orders);
-
-	/* MADV_COLLAPSE needs to work irrespective of sysfs setting */
-	if (!cc->is_khugepaged)
-		order = HPAGE_PMD_ORDER;
+	VM_BUG_ON(address & ((PAGE_SIZE << order) - 1));
 
 scan_pte_range:
 
@@ -1667,7 +1659,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 
 decide_order:
 		/* Immediately exit on exhaustion of range */
-		if (_address == orig_address + (PAGE_SIZE << HPAGE_PMD_ORDER))
+		if (_address == orig_address + (PAGE_SIZE << (highest_order(orig_orders))))
 			goto out;
 
 		/* Get highest order possible starting from address */
@@ -2636,6 +2628,9 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 	struct mm_struct *mm;
 	struct vm_area_struct *vma;
 	int progress = 0;
+	unsigned long orders;
+	int order;
+	bool is_file_vma;
 
 	VM_BUG_ON(!pages);
 	lockdep_assert_held(&khugepaged_mm_lock);
@@ -2675,19 +2670,40 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 			progress++;
 			break;
 		}
-		if (!thp_vma_allowable_orders(vma, vma->vm_flags,
-					TVA_ENFORCE_SYSFS, THP_ORDERS_ALL_ANON)) {
+		orders = thp_vma_allowable_orders(vma, vma->vm_flags,
+					TVA_ENFORCE_SYSFS, THP_ORDERS_ALL_ANON);
+		if (!orders) {
 skip:
 			progress++;
 			continue;
 		}
-		hstart = round_up(vma->vm_start, HPAGE_PMD_SIZE);
-		hend = round_down(vma->vm_end, HPAGE_PMD_SIZE);
+
+		/* We can collapse anonymous VMAs less than PMD_SIZE */
+		is_file_vma = IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma);
+		if (is_file_vma) {
+			order = HPAGE_PMD_ORDER;
+			if (!(orders & (1UL << order)))
+				goto skip;
+			hend = round_down(vma->vm_end, PAGE_SIZE << order);
+		}
+		else {
+			/* select the highest possible order for the VMA */
+			order = highest_order(orders);
+			while (orders) {
+				hend = round_down(vma->vm_end, PAGE_SIZE << order);
+				if (khugepaged_scan.address <= hend)
+					break;
+				order = next_order(&orders, order);
+			}
+		}
+		if (!orders)
+			goto skip;
 		if (khugepaged_scan.address > hend)
 			goto skip;
+		hstart = round_up(vma->vm_start, PAGE_SIZE << order);
 		if (khugepaged_scan.address < hstart)
 			khugepaged_scan.address = hstart;
-		VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
+		VM_BUG_ON(khugepaged_scan.address & ((PAGE_SIZE << order) - 1));
 
 		while (khugepaged_scan.address < hend) {
 			bool mmap_locked = true;
@@ -2697,13 +2713,9 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 				goto breakouterloop;
 
 			VM_BUG_ON(khugepaged_scan.address < hstart ||
-				  khugepaged_scan.address + HPAGE_PMD_SIZE >
+				  khugepaged_scan.address + (PAGE_SIZE << order) >
 				  hend);
-			if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
-				if (!thp_vma_allowable_order(vma, vma->vm_flags,
-				    TVA_ENFORCE_SYSFS, PMD_ORDER))
-					break;
-
+			if (is_file_vma) {
 				struct file *file = get_file(vma->vm_file);
 				pgoff_t pgoff = linear_page_index(vma,
 						khugepaged_scan.address);
@@ -2725,15 +2737,15 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 				}
 			} else {
 				*result = hpage_collapse_scan_pmd(mm, vma,
-					khugepaged_scan.address, &mmap_locked, cc);
+					khugepaged_scan.address, &mmap_locked, orders, cc);
 			}
 
 			if (*result == SCAN_SUCCEED)
 				++khugepaged_pages_collapsed;
 
 			/* move to next address */
-			khugepaged_scan.address += HPAGE_PMD_SIZE;
-			progress += HPAGE_PMD_NR;
+			khugepaged_scan.address += (PAGE_SIZE << order);
+			progress += (1UL << order);
 			if (!mmap_locked)
 				/*
 				 * We released mmap_lock so break loop.  Note
@@ -3060,7 +3072,9 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
 			fput(file);
 		} else {
 			result = hpage_collapse_scan_pmd(mm, vma, addr,
-							 &mmap_locked, cc);
+							 &mmap_locked,
+							 BIT(HPAGE_PMD_ORDER),
+							 cc);
 		}
 		if (!mmap_locked)
 			*prev = NULL;  /* Tell caller we dropped mmap_lock */
-- 
2.30.2

