Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86631F8AF8
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272507; cv=none; b=SHaz6+eYJJv5FDpomNhUrfY+WW2gUSNlsOnGkbIu83i9hf+6jesYSyTatBH6Xm0xwa8uUCo4w4zMYD2DJVpWeKS5ruF0450DxsWWsDV7VfzMu5JPG9FlYReqAjhhWzs+ZLoow31omSQta78ceddHL2ltvZxsgJkpxF41Aroq2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272507; c=relaxed/simple;
	bh=IubrVVftFg/kwm1NglPLF3PPOx0Z6acD3DLUCZRJm/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EqO5kNgpvO7RzKAEv3a9T7xIZR+rcQMrw4lHdsmHQT7/f3OSQofWb0ZVIfIUdOCgshZMsEnIW8Xh42u8Q5nrgN9mSq8oBvW1qGN1Kk7ny/s6J84h3VlreYoTngNWsHHSTN0kiHm2gZkyGeRduc6pIBIPZDYZysE7mj0nQDESW40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7967113D5;
	Tue, 11 Feb 2025 03:15:26 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F17C83F5A1;
	Tue, 11 Feb 2025 03:14:54 -0800 (PST)
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
Subject: [PATCH v2 08/17] khugepaged: Introduce vma_collapse_anon_folio()
Date: Tue, 11 Feb 2025 16:43:17 +0530
Message-Id: <20250211111326.14295-9-dev.jain@arm.com>
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

Similar to PMD collapse, take the write locks to stop pagetable walking.
Copy page contents, clear the PTEs, remove folio pins, and (try to) unmap the
old folios. Set the PTEs to the new folio using the set_ptes() API.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index fbfd8a78ef51..a674014b6563 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1217,6 +1217,96 @@ static int vma_collapse_anon_folio_pmd(struct mm_struct *mm, unsigned long addre
 	return result;
 }
 
+/* Similar to the PMD case except we have to batch set the PTEs */
+static int vma_collapse_anon_folio(struct mm_struct *mm, unsigned long address,
+		struct vm_area_struct *vma, struct collapse_control *cc, pmd_t *pmd,
+		struct folio *folio, int order)
+{
+	LIST_HEAD(compound_pagelist);
+	spinlock_t *pmd_ptl, *pte_ptl;
+	int result = SCAN_FAIL;
+	struct mmu_notifier_range range;
+	pmd_t _pmd;
+	pte_t *pte;
+	pte_t entry;
+	int nr_pages = folio_nr_pages(folio);
+	unsigned long haddress = address & HPAGE_PMD_MASK;
+
+	VM_BUG_ON(address & ((PAGE_SIZE << order) - 1));;
+
+	result = hugepage_vma_revalidate(mm, address, true, &vma, order, cc);
+	if (result != SCAN_SUCCEED)
+		goto out;
+	result = check_pmd_still_valid(mm, address, pmd);
+	if (result != SCAN_SUCCEED)
+		goto out;
+
+	vma_start_write(vma);
+	anon_vma_lock_write(vma->anon_vma);
+
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, haddress,
+				haddress + HPAGE_PMD_SIZE);
+	mmu_notifier_invalidate_range_start(&range);
+
+	pmd_ptl = pmd_lock(mm, pmd);
+	_pmd = pmdp_collapse_flush(vma, haddress, pmd);
+	spin_unlock(pmd_ptl);
+	mmu_notifier_invalidate_range_end(&range);
+	tlb_remove_table_sync_one();
+
+	pte = pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
+	if (pte) {
+		result = __collapse_huge_page_isolate(vma, address, pte, cc,
+						      &compound_pagelist, order);
+		spin_unlock(pte_ptl);
+	} else {
+		result = SCAN_PMD_NULL;
+	}
+
+	if (unlikely(result != SCAN_SUCCEED)) {
+		if (pte)
+			pte_unmap(pte);
+		spin_lock(pmd_ptl);
+		BUG_ON(!pmd_none(*pmd));
+		pmd_populate(mm, pmd, pmd_pgtable(_pmd));
+		spin_unlock(pmd_ptl);
+		anon_vma_unlock_write(vma->anon_vma);
+		goto out;
+	}
+
+	anon_vma_unlock_write(vma->anon_vma);
+
+	result = __collapse_huge_page_copy(pte, folio, pmd, *pmd,
+					   vma, address, pte_ptl,
+					   &compound_pagelist, order);
+	pte_unmap(pte);
+	if (unlikely(result != SCAN_SUCCEED))
+		goto out;
+
+	__folio_mark_uptodate(folio);
+	entry = mk_pte(&folio->page, vma->vm_page_prot);
+	entry = maybe_mkwrite(pte_mkdirty(entry), vma);
+
+	spin_lock(pte_ptl);
+	folio_ref_add(folio, nr_pages - 1);
+	folio_add_new_anon_rmap(folio, vma, address, RMAP_EXCLUSIVE);
+	folio_add_lru_vma(folio, vma);
+	set_ptes(mm, address, pte, entry, nr_pages);
+	spin_unlock(pte_ptl);
+	spin_lock(pmd_ptl);
+
+	/* See pmd_install() */
+	smp_wmb();
+	BUG_ON(!pmd_none(*pmd));
+	pmd_populate(mm, pmd, pmd_pgtable(_pmd));
+	update_mmu_cache_pmd(vma, haddress, pmd);
+	spin_unlock(pmd_ptl);
+
+	result = SCAN_SUCCEED;
+out:
+	return result;
+}
+
 static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 			      int referenced, int unmapped, int order,
 			      struct collapse_control *cc)
@@ -1276,6 +1366,8 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 
 	if (order == HPAGE_PMD_ORDER)
 		result = vma_collapse_anon_folio_pmd(mm, address, vma, cc, pmd, folio);
+	else
+		result = vma_collapse_anon_folio(mm, address, vma, cc, pmd, folio, order);
 
 	mmap_write_unlock(mm);
 
-- 
2.30.2

