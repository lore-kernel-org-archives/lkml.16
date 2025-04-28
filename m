Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDE52673B7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841950; cv=none; b=FLy59Rhr9e6/giX470es5s3uigK+yep9V1UzCgQYP8Vb8Dv0PhHK44iCGXKjCa2ay45gBVoqd5yi5O6PL/RYPB6MXE/BXVFFScSXRHU3rUHyXZyO/rIQ+aBA24/Mb8P8lnpdTsdrQcV5AKv9zjrgKt/iBCLpQue6aLBqmQ7s5fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841950; c=relaxed/simple;
	bh=uhhb/WbjTvfi31f7EFPTIbVN0sxli/jwpt1FYquhYkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N4CQbOHuXT6vR+EqDsKox0Gt3WIYbduRz5V2F7sahgZ6mXRiPSf6OcZeCk8OP3UAWIw510Hrzlhka+r+MVnai+yyqGXXbq6xSKU1DJ+u2s4FFoxTVvkCrt5IS3pMQN588Q1XtMYxqKFDizfdby6S1Kx78vEL+vgkjmuILyTxcCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C17122D7;
	Mon, 28 Apr 2025 05:05:41 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 57D683F66E;
	Mon, 28 Apr 2025 05:05:38 -0700 (PDT)
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
Subject: [PATCH 7/7] mm: Optimize mprotect() through PTE-batching
Date: Mon, 28 Apr 2025 17:34:14 +0530
Message-Id: <20250428120414.12101-8-dev.jain@arm.com>
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

The common pte_present case does not require the folio. Elide the overhead of
vm_normal_folio() for the small folio case, by making an approximation:
for arm64, pte_batch_hint() is conclusive. For other arches, if the pfns
pointed to by the current and the next PTE are contiguous, check whether
a large folio is actually mapped, and only then make the batch optimization.
Reuse the folio from prot_numa case if possible. Since modify_prot_start_ptes()
gathers access/dirty bits, it lets us batch around pte_needs_flush()
(for parisc, the definition includes the access bit).

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 49 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 362fd7e5457d..d382d57bc796 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -131,7 +131,7 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
 	return false;
 }
 
-static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
+static struct folio *prot_numa_avoid_fault(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *pte, pte_t oldpte, int target_node,
 		int max_nr, int *nr)
 {
@@ -141,25 +141,37 @@ static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
 
 	/* Avoid TLB flush if possible */
 	if (pte_protnone(oldpte))
-		return true;
+		return NULL;
 
 	folio = vm_normal_folio(vma, addr, oldpte);
 	if (!folio)
-		return true;
+		return NULL;
 
 	ret = prot_numa_skip(vma, folio, target_node);
 	if (ret) {
 		if (folio_test_large(folio) && max_nr != 1)
 			*nr = folio_pte_batch(folio, addr, pte, oldpte,
 					      max_nr, flags, NULL, NULL, NULL);
-		return ret;
+		return NULL;
 	}
 	if (folio_use_access_time(folio))
 		folio_xchg_access_time(folio,
 			jiffies_to_msecs(jiffies));
-	return false;
+	return folio;
 }
 
+static bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
+{
+	pte_t *next_ptep, next_pte;
+
+	if (pte_batch_hint(ptep, pte) != 1)
+		return true;
+
+	next_ptep = ptep + 1;
+	next_pte = ptep_get(next_ptep);
+
+	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == PAGE_SIZE);
+}
 static long change_pte_range(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
@@ -190,19 +202,28 @@ static long change_pte_range(struct mmu_gather *tlb,
 		oldpte = ptep_get(pte);
 		if (pte_present(oldpte)) {
 			int max_nr = (end - addr) >> PAGE_SHIFT;
+			const fpb_t flags = FPB_IGNORE_DIRTY;
+			struct folio *folio = NULL;
 			pte_t ptent;
 
 			/*
 			 * Avoid trapping faults against the zero or KSM
 			 * pages. See similar comment in change_huge_pmd.
 			 */
-			if (prot_numa &&
-			    prot_numa_avoid_fault(vma, addr, pte,
-						  oldpte, target_node,
-							  max_nr, &nr))
+			if (prot_numa) {
+				folio = prot_numa_avoid_fault(vma, addr, pte,
+					oldpte, target_node, max_nr, &nr);
+				if (!folio)
 					continue;
+			}
 
-			oldpte = ptep_modify_prot_start(vma, addr, pte);
+			if (!folio && (max_nr != 1) && maybe_contiguous_pte_pfns(pte, oldpte)) {
+				folio = vm_normal_folio(vma, addr, oldpte);
+				if (folio_test_large(folio))
+					nr = folio_pte_batch(folio, addr, pte,
+					oldpte, max_nr, flags, NULL, NULL, NULL);
+			}
+			oldpte = modify_prot_start_ptes(vma, addr, pte, nr);
 			ptent = pte_modify(oldpte, newprot);
 
 			if (uffd_wp)
@@ -225,13 +246,13 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 */
 			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
 			    !pte_write(ptent) &&
-			    can_change_ptes_writable(vma, addr, ptent, folio, 1))
+			    can_change_ptes_writable(vma, addr, ptent, folio, nr))
 				ptent = pte_mkwrite(ptent, vma);
 
-			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
+			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr);
 			if (pte_needs_flush(oldpte, ptent))
-				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
-			pages++;
+				tlb_flush_pte_range(tlb, addr, nr * PAGE_SIZE);
+			pages += nr;
 		} else if (is_swap_pte(oldpte)) {
 			swp_entry_t entry = pte_to_swp_entry(oldpte);
 			pte_t newpte;
-- 
2.30.2

