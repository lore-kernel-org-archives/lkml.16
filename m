Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A98262FE8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841900; cv=none; b=Cgs1/DAFQPivqKImY+8KKpk+zdV2KzbB+XhXs61YNKOGFpiRz0jE3432aNJN70pPrNphSnfFs60PwYSxAuWiD+CEhZTa9r58BNZcjwwx1xVm2vn6UY+c4Gr6dED8UJsUTD17P5WkL0PaFRQl8FioUrJqK9HWamePEMMVtYJgmmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841900; c=relaxed/simple;
	bh=DP6gVzoEmQon6hJY+7rCTVMiPVhGyiqEGrn7/DcB4LA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lt40GmOYoJUWpd+mThy1TT7hts21PfRj6/YcV0VSrytmNPgfsirAPHEGlNlyrooWHFMw8tE/JyM8CG57JwDo1az7n6ouNDvvG/lnlrMaPPELyOrXGDYckAq0MX5aPe2iwl9QPmrHrDvOiyFDykQgKsNN+uOFyBmTJKLTPzAPito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B16941762;
	Mon, 28 Apr 2025 05:04:51 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 939A63F7BD;
	Mon, 28 Apr 2025 05:04:48 -0700 (PDT)
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
	namit@vmware.com,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 2/7] mm: Optimize mprotect() by batch-skipping PTEs
Date: Mon, 28 Apr 2025 17:34:09 +0530
Message-Id: <20250428120414.12101-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250428120414.12101-1-dev.jain@arm.com>
References: <20250428120414.12101-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of prot_numa, there are various cases in which we can skip to the
next iteration. Since the skip condition is based on the folio and not
the PTEs, we can skip a PTE batch.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 8d635c7fc81f..33eabc995584 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -91,6 +91,9 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
 	bool toptier;
 	int nid;
 
+	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
+		return true;
+
 	/* Also skip shared copy-on-write pages */
 	if (is_cow_mapping(vma->vm_flags) &&
 	    (folio_maybe_dma_pinned(folio) ||
@@ -126,8 +129,10 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
 }
 
 static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
-		unsigned long addr, pte_t oldpte, int target_node)
+		unsigned long addr, pte_t *pte, pte_t oldpte, int target_node,
+		int max_nr, int *nr)
 {
+	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	struct folio *folio;
 	int ret;
 
@@ -136,12 +141,16 @@ static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
 		return true;
 
 	folio = vm_normal_folio(vma, addr, oldpte);
-	if (!folio || folio_is_zone_device(folio) ||
-	    folio_test_ksm(folio))
+	if (!folio)
 		return true;
+
 	ret = prot_numa_skip(vma, folio, target_node);
-	if (ret)
+	if (ret) {
+		if (folio_test_large(folio) && max_nr != 1)
+			*nr = folio_pte_batch(folio, addr, pte, oldpte,
+					      max_nr, flags, NULL, NULL, NULL);
 		return ret;
+	}
 	if (folio_use_access_time(folio))
 		folio_xchg_access_time(folio,
 			jiffies_to_msecs(jiffies));
@@ -159,6 +168,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
 	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
+	int nr;
 
 	tlb_change_page_size(tlb, PAGE_SIZE);
 	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
@@ -173,8 +183,10 @@ static long change_pte_range(struct mmu_gather *tlb,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 	do {
+		nr = 1;
 		oldpte = ptep_get(pte);
 		if (pte_present(oldpte)) {
+			int max_nr = (end - addr) >> PAGE_SHIFT;
 			pte_t ptent;
 
 			/*
@@ -182,8 +194,9 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 * pages. See similar comment in change_huge_pmd.
 			 */
 			if (prot_numa &&
-			    prot_numa_avoid_fault(vma, addr,
-						  oldpte, target_node))
+			    prot_numa_avoid_fault(vma, addr, pte,
+						  oldpte, target_node,
+							  max_nr, &nr))
 					continue;
 
 			oldpte = ptep_modify_prot_start(vma, addr, pte);
@@ -300,7 +313,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 				pages++;
 			}
 		}
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+	} while (pte += nr, addr += nr * PAGE_SIZE, addr != end);
 	arch_leave_lazy_mmu_mode();
 	pte_unmap_unlock(pte - 1, ptl);
 
-- 
2.30.2

