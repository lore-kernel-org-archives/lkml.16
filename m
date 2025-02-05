Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5CB13C8E2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768249; cv=none; b=mM84xvb+eWKMx15w5066IudAJZa1hxy2iGxw69S0raheZ9smD/NpyREZRNK9GGrbA1cc3fSNe/bT8m3YxLlFCe6gCpwbE3TdWTsqq6D0iNyv1pVcjsYKKAK6O1YTLHkMx07by6k5vHMK71i/0eF7y1YnIm797oUQ0JGWlE3WkG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768249; c=relaxed/simple;
	bh=k4UhMEqh2Zcc7EaPxh/zwh/SlA+GiDiVu3n75+jtOHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuYknXmDvlk2/0DPyueFhWQ8AOx48X48+0Uurz6odH2Cg8ODex8IK0M9PcE/Gq8jfKSNqlR2wyUrfGZiZJ9EgmSRId3HYFlhSbKKUnq4Deae1uUbjzZW2DV7f5aMKw1YoukbiXlSOeQznpf7CyBHnlvWqO/wPlimtICKFuEPEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D37F1063;
	Wed,  5 Feb 2025 07:11:10 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 712D43F5A1;
	Wed,  5 Feb 2025 07:10:44 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/16] arm64: hugetlb: Use ___set_ptes() and ___ptep_get_and_clear()
Date: Wed,  5 Feb 2025 15:09:47 +0000
Message-ID: <20250205151003.88959-8-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the huge_pte helpers to use the new generic ___set_ptes() and
___ptep_get_and_clear() APIs.

This provides 2 benefits; First, when page_table_check=on, hugetlb is
now properly/fully checked. Previously only the first page of a hugetlb
folio was checked. Second, instead of having to call __set_ptes(nr=1)
for each pte in a loop, the whole contiguous batch can now be set in one
go, which enables some efficiencies and cleans up the code.

One detail to note is that huge_ptep_clear_flush() was previously
calling ptep_clear_flush() for a non-contiguous pte (i.e. a pud or pmd
block mapping). This has a couple of disadvantages; first
ptep_clear_flush() calls ptep_get_and_clear() which transparently
handles contpte. Given we only call for non-contiguous ptes, it would be
safe, but a waste of effort. It's preferable to go stright to the layer
below. However, more problematic is that ptep_get_and_clear() is for
PAGE_SIZE entries so it calls page_table_check_pte_clear() and would not
clear the whole hugetlb folio. So let's stop special-casing the non-cont
case and just rely on get_clear_contig_flush() to do the right thing for
non-cont entries.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 50 ++++++++-----------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index e870d01d12ea..02afee31444e 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -166,12 +166,12 @@ static pte_t get_clear_contig(struct mm_struct *mm,
 	pte_t pte, tmp_pte;
 	bool present;
 
-	pte = __ptep_get_and_clear(mm, addr, ptep);
+	pte = ___ptep_get_and_clear(mm, ptep, pgsize);
 	present = pte_present(pte);
 	while (--ncontig) {
 		ptep++;
 		addr += pgsize;
-		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
+		tmp_pte = ___ptep_get_and_clear(mm, ptep, pgsize);
 		if (present) {
 			if (pte_dirty(tmp_pte))
 				pte = pte_mkdirty(pte);
@@ -215,7 +215,7 @@ static void clear_flush(struct mm_struct *mm,
 	unsigned long i, saddr = addr;
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		__ptep_get_and_clear(mm, addr, ptep);
+		___ptep_get_and_clear(mm, ptep, pgsize);
 
 	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
 }
@@ -226,32 +226,20 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	size_t pgsize;
 	int i;
 	int ncontig;
-	unsigned long pfn, dpfn;
-	pgprot_t hugeprot;
 
 	ncontig = num_contig_ptes(sz, &pgsize);
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
-			__set_ptes(mm, addr, ptep, pte, 1);
+			___set_ptes(mm, ptep, pte, 1, pgsize);
 		return;
 	}
 
-	if (!pte_cont(pte)) {
-		__set_ptes(mm, addr, ptep, pte, 1);
-		return;
-	}
-
-	pfn = pte_pfn(pte);
-	dpfn = pgsize >> PAGE_SHIFT;
-	hugeprot = pte_pgprot(pte);
-
 	/* Only need to "break" if transitioning valid -> valid. */
-	if (pte_valid(__ptep_get(ptep)))
+	if (pte_cont(pte) && pte_valid(__ptep_get(ptep)))
 		clear_flush(mm, addr, ptep, pgsize, ncontig);
 
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
+	___set_ptes(mm, ptep, pte, ncontig, pgsize);
 }
 
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
@@ -441,11 +429,9 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr, pte_t *ptep,
 			       pte_t pte, int dirty)
 {
-	int ncontig, i;
+	int ncontig;
 	size_t pgsize = 0;
-	unsigned long pfn = pte_pfn(pte), dpfn;
 	struct mm_struct *mm = vma->vm_mm;
-	pgprot_t hugeprot;
 	pte_t orig_pte;
 
 	VM_WARN_ON(!pte_present(pte));
@@ -454,7 +440,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
 	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	dpfn = pgsize >> PAGE_SHIFT;
 
 	if (!__cont_access_flags_changed(ptep, pte, ncontig))
 		return 0;
@@ -469,19 +454,14 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	if (pte_young(orig_pte))
 		pte = pte_mkyoung(pte);
 
-	hugeprot = pte_pgprot(pte);
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
-
+	___set_ptes(mm, ptep, pte, ncontig, pgsize);
 	return 1;
 }
 
 void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr, pte_t *ptep)
 {
-	unsigned long pfn, dpfn;
-	pgprot_t hugeprot;
-	int ncontig, i;
+	int ncontig;
 	size_t pgsize;
 	pte_t pte;
 
@@ -494,16 +474,11 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	}
 
 	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
-	dpfn = pgsize >> PAGE_SHIFT;
 
 	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
 	pte = pte_wrprotect(pte);
 
-	hugeprot = pte_pgprot(pte);
-	pfn = pte_pfn(pte);
-
-	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
-		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
+	___set_ptes(mm, ptep, pte, ncontig, pgsize);
 }
 
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
@@ -517,10 +492,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	pte = __ptep_get(ptep);
 	VM_WARN_ON(!pte_present(pte));
 
-	if (!pte_cont(pte))
-		return ptep_clear_flush(vma, addr, ptep);
-
-	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
+	ncontig = num_contig_ptes(page_size(pte_page(pte)), &pgsize);
 	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
 }
 
-- 
2.43.0

