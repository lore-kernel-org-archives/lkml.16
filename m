Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385CC15A86B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831108; cv=none; b=JdtJ79xayMK1Nh1jDxG4AsP+om8BkBXAwV/dbwFmbvVOO88EOxBI3KwrjJ2PXLBVJ9CS/Nzpi0QXTnfhqe4B8UvQiww6Cz6IYj8gThHtd3dWLH83GZnD0oszYxIENDqzY0OEkJB+mKOxQLYjii+KZRnxmTtA8U4j+g1XyQw45pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831108; c=relaxed/simple;
	bh=SNSi/uMwV++FgdgG8uEvRDD9DYGOweXb8I1Sbxv7M0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L4vbS+lLoXzth166+eGuAcbShu0QZEXQj7MWfC/sAz4gZGS33rDZUZzkCgNbfmds1u5/Yqfplfug8BSCnHyQou8EvA7qhcdVPadkGkgBZSx30DVMmge8Ng12tYNv5pPvtz79vwD6aWLAKjVjv2Oi35Curf+phCsqGkX1X6T9lkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EF671063;
	Tue, 24 Jun 2025 22:58:08 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BBB743F63F;
	Tue, 24 Jun 2025 22:58:22 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 1/3] khugepaged: Optimize __collapse_huge_page_copy_succeeded() by PTE batching
Date: Wed, 25 Jun 2025 11:28:04 +0530
Message-Id: <20250625055806.82645-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250625055806.82645-1-dev.jain@arm.com>
References: <20250625055806.82645-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use PTE batching to optimize __collapse_huge_page_copy_succeeded().

On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
Then, calling ptep_clear() for every pte will cause a TLB flush for every
contpte block. Instead, clear_full_ptes() does a
contpte_try_unfold_partial() which will flush the TLB only for the (if any)
starting and ending contpte block, if they partially overlap with the range
khugepaged is looking at.

For all arches, there should be a benefit due to batching atomic operations
on mapcounts due to folio_remove_rmap_ptes().

No issues were observed with mm-selftests.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index d45d08b521f6..3944b112d452 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -700,12 +700,15 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
 						spinlock_t *ptl,
 						struct list_head *compound_pagelist)
 {
+	unsigned long end = address + HPAGE_PMD_SIZE;
 	struct folio *src, *tmp;
-	pte_t *_pte;
 	pte_t pteval;
+	pte_t *_pte;
+	int nr_ptes;
 
-	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
-	     _pte++, address += PAGE_SIZE) {
+	for (_pte = pte; _pte < pte + HPAGE_PMD_NR; _pte += nr_ptes,
+	     address += nr_ptes * PAGE_SIZE) {
+		nr_ptes = 1;
 		pteval = ptep_get(_pte);
 		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
 			add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
@@ -719,21 +722,33 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
 				ksm_might_unmap_zero_page(vma->vm_mm, pteval);
 			}
 		} else {
+			const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+			int max_nr_ptes;
+
 			struct page *src_page = pte_page(pteval);
 
 			src = page_folio(src_page);
 			if (!folio_test_large(src))
 				release_pte_folio(src);
+
+			max_nr_ptes = (end - address) >> PAGE_SHIFT;
+			if (folio_test_large(src))
+				nr_ptes = folio_pte_batch(src, address, _pte,
+							  pteval, max_nr_ptes,
+							  flags, NULL, NULL, NULL);
+
 			/*
 			 * ptl mostly unnecessary, but preempt has to
 			 * be disabled to update the per-cpu stats
 			 * inside folio_remove_rmap_pte().
 			 */
 			spin_lock(ptl);
-			ptep_clear(vma->vm_mm, address, _pte);
-			folio_remove_rmap_pte(src, src_page, vma);
+			clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes,
+					/* full = */ false);
+			folio_remove_rmap_ptes(src, src_page, nr_ptes, vma);
 			spin_unlock(ptl);
-			free_folio_and_swap_cache(src);
+			free_swap_cache(src);
+			folio_put_refs(src, nr_ptes);
 		}
 	}
 
-- 
2.30.2

