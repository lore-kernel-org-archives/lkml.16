Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72406267B76
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841940; cv=none; b=FGfw+N41SYB54H1DmgwuYJiHu1ksJ4FFhja0fmS88T41lUYtc+8Em5Nqz95armr/VdUsaTfSCZNUPE/xiUC8O4CgmRSBPCXAWCCeURzzrQErJ0xCsx7ntzvsqAhWbbr1TYvkQaeeBgtIEjT20EQP1YZoqbvwt/Y2BPAE8ziG8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841940; c=relaxed/simple;
	bh=qJ2Iyk/6FID6si78fbokXxfAerjQ+o6WBssQf/2qflA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QZO3FvoHIcywSYg8Eh4oJ9F6N71cI8fmmHpCF/J5peRTQgjQD8Ec/g8KUJInmsnoefWrkB0aBlIgkq3hVPHrb3IIvnymIMU+YydIcl5p3GjbP/O8F1pB+6+GgA8Qytk6NWwLB3k/YEXee/VztJmYuo57eomHt6IJ3h4CLA+JRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F13D22D7;
	Mon, 28 Apr 2025 05:05:31 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DED83F66E;
	Mon, 28 Apr 2025 05:05:29 -0700 (PDT)
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
Subject: [PATCH 6/7] mm: Batch around can_change_pte_writable()
Date: Mon, 28 Apr 2025 17:34:13 +0530
Message-Id: <20250428120414.12101-7-dev.jain@arm.com>
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

In preparation for patch 7, we need to properly batch around
can_change_pte_writable(). We batch around pte_needs_soft_dirty_wp() by
the corresponding fpb flag, we batch around the page-anon exclusive check
using folio_maybe_mapped_shared(); modify_prot_start_ptes() collects the
dirty and access bits across the batch, therefore batching across
pte_dirty(): this is correct since the dirty bit on the PTE really
is just an indication that the folio got written to, so even if
the PTE is not actually dirty (but one of the PTEs in the batch is),
the wp-fault optimization can be made.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/mm.h | 4 ++--
 mm/gup.c           | 2 +-
 mm/huge_memory.c   | 4 ++--
 mm/memory.c        | 6 +++---
 mm/mprotect.c      | 9 ++++++---
 5 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5eb0d77c4438..ffa02e15863f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2710,8 +2710,8 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen);
 #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
 					    MM_CP_UFFD_WP_RESOLVE)
 
-bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
-			     pte_t pte);
+bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte, struct folio *folio, unsigned int nr);
 extern long change_protection(struct mmu_gather *tlb,
 			      struct vm_area_struct *vma, unsigned long start,
 			      unsigned long end, unsigned long cp_flags);
diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2..6a605fc5f2cb 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -614,7 +614,7 @@ static inline bool can_follow_write_common(struct page *page,
 		return false;
 
 	/*
-	 * See can_change_pte_writable(): we broke COW and could map the page
+	 * See can_change_ptes_writable(): we broke COW and could map the page
 	 * writable if we have an exclusive anonymous page ...
 	 */
 	return page && PageAnon(page) && PageAnonExclusive(page);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 28c87e0e036f..e5496c0d9e7e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2032,12 +2032,12 @@ static inline bool can_change_pmd_writable(struct vm_area_struct *vma,
 		return false;
 
 	if (!(vma->vm_flags & VM_SHARED)) {
-		/* See can_change_pte_writable(). */
+		/* See can_change_ptes_writable(). */
 		page = vm_normal_page_pmd(vma, addr, pmd);
 		return page && PageAnon(page) && PageAnonExclusive(page);
 	}
 
-	/* See can_change_pte_writable(). */
+	/* See can_change_ptes_writable(). */
 	return pmd_dirty(pmd);
 }
 
diff --git a/mm/memory.c b/mm/memory.c
index b9e8443aaa86..b1fda3de8d27 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -750,7 +750,7 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 		pte = pte_mkuffd_wp(pte);
 
 	if ((vma->vm_flags & VM_WRITE) &&
-	    can_change_pte_writable(vma, address, pte)) {
+	    can_change_ptes_writable(vma, address, pte, NULL, 1)) {
 		if (folio_test_dirty(folio))
 			pte = pte_mkdirty(pte);
 		pte = pte_mkwrite(pte, vma);
@@ -5767,7 +5767,7 @@ static void numa_rebuild_large_mapping(struct vm_fault *vmf, struct vm_area_stru
 			ptent = pte_modify(ptent, vma->vm_page_prot);
 			writable = pte_write(ptent);
 			if (!writable && pte_write_upgrade &&
-			    can_change_pte_writable(vma, addr, ptent))
+			    can_change_ptes_writable(vma, addr, ptent, NULL, 1))
 				writable = true;
 		}
 
@@ -5808,7 +5808,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	 */
 	writable = pte_write(pte);
 	if (!writable && pte_write_upgrade &&
-	    can_change_pte_writable(vma, vmf->address, pte))
+	    can_change_ptes_writable(vma, vmf->address, pte, NULL, 1))
 		writable = true;
 
 	folio = vm_normal_folio(vma, vmf->address, pte);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 33eabc995584..362fd7e5457d 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -40,8 +40,8 @@
 
 #include "internal.h"
 
-bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
-			     pte_t pte)
+bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
+			      pte_t pte, struct folio *folio, unsigned int nr)
 {
 	struct page *page;
 
@@ -67,6 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 		 * write-fault handler similarly would map them writable without
 		 * any additional checks while holding the PT lock.
 		 */
+		if (unlikely(nr != 1))
+			return !folio_maybe_mapped_shared(folio);
+
 		page = vm_normal_page(vma, addr, pte);
 		return page && PageAnon(page) && PageAnonExclusive(page);
 	}
@@ -222,7 +225,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 */
 			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
 			    !pte_write(ptent) &&
-			    can_change_pte_writable(vma, addr, ptent))
+			    can_change_ptes_writable(vma, addr, ptent, folio, 1))
 				ptent = pte_mkwrite(ptent, vma);
 
 			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
-- 
2.30.2

