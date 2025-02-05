Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F89718D649
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768240; cv=none; b=O+zOxkAy8N+lQHPSlDThDvbXUuXC4Ci21y+VsgzS1PkgUq1oaRGdsWJM9+cwu5gPkbFV7V0+L8BorHW4jh3zeI7TwVBF/VRpw8O3n3+JuR4/XI+nm4SfoBawFs8R7UyYbTWNxJeUoFlkngwO+vlHQqujglr79igliCTmLehnVoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768240; c=relaxed/simple;
	bh=nG0dEu8OskEFWpJvNUYYdqhbCpLn3sLULzDXgSAaafw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWmJ2/8OBYKWZyZ0ljm9BgrWYeAdbHpEZ4F85WsK8r3AySb9qf+kj+OpsKFOpCkoXZPBAt9ZS0tUDtKDAhwIIlmVDQNCwdhwWV8GT/2rXA4PKJVvzYROTc5SdekHBVtmEbkCXb8cKuRc01K4cnoQVuDZ7AkErHGMuqR2AFU4k4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DD511515;
	Wed,  5 Feb 2025 07:11:02 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11E403F5A1;
	Wed,  5 Feb 2025 07:10:35 -0800 (PST)
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
Subject: [PATCH v1 04/16] arm64: hugetlb: Refine tlb maintenance scope
Date: Wed,  5 Feb 2025 15:09:44 +0000
Message-ID: <20250205151003.88959-5-ryan.roberts@arm.com>
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

When operating on contiguous blocks of ptes (or pmds) for some hugetlb
sizes, we must honour break-before-make requirements and clear down the
block to invalid state in the pgtable then invalidate the relevant tlb
entries before making the pgtable entries valid again.

However, the tlb maintenance is currently always done assuming the worst
case stride (PAGE_SIZE), last_level (false) and tlb_level
(TLBI_TTL_UNKNOWN). We can do much better with the hinting; In reality,
we know the stride from the huge_pte pgsize, we are always operating
only on the last level, and we always know the tlb_level, again based on
pgsize. So let's start providing these hints.

Additionally, avoid tlb maintenace in set_huge_pte_at().
Break-before-make is only required if we are transitioning the
contiguous pte block from valid -> valid. So let's elide the
clear-and-flush ("break") if the pte range was previously invalid.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/hugetlb.h | 29 +++++++++++++++++++----------
 arch/arm64/mm/hugetlbpage.c      |  9 ++++++---
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 8ab9542d2d22..c38f2944c20d 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -69,27 +69,36 @@ extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 
 #include <asm-generic/hugetlb.h>
 
-#define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
-static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
-					   unsigned long start,
-					   unsigned long end)
+static inline void __flush_hugetlb_tlb_range(struct vm_area_struct *vma,
+					     unsigned long start,
+					     unsigned long end,
+					     unsigned long stride,
+					     bool last_level)
 {
-	unsigned long stride = huge_page_size(hstate_vma(vma));
-
 	switch (stride) {
 	case PUD_SIZE:
-		__flush_tlb_range(vma, start, end, PUD_SIZE, false, 1);
+		__flush_tlb_range(vma, start, end, PUD_SIZE, last_level, 1);
 		break;
 	case CONT_PMD_SIZE:
 	case PMD_SIZE:
-		__flush_tlb_range(vma, start, end, PMD_SIZE, false, 2);
+		__flush_tlb_range(vma, start, end, PMD_SIZE, last_level, 2);
 		break;
 	case CONT_PTE_SIZE:
-		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 3);
+		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, 3);
 		break;
 	default:
-		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, TLBI_TTL_UNKNOWN);
+		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, TLBI_TTL_UNKNOWN);
 	}
 }
 
+#define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
+static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
+					   unsigned long start,
+					   unsigned long end)
+{
+	unsigned long stride = huge_page_size(hstate_vma(vma));
+
+	__flush_hugetlb_tlb_range(vma, start, end, stride, false);
+}
+
 #endif /* __ASM_HUGETLB_H */
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 328eec4bfe55..e870d01d12ea 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -190,8 +190,9 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
 {
 	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pgsize, ncontig);
 	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+	unsigned long end = addr + (pgsize * ncontig);
 
-	flush_tlb_range(&vma, addr, addr + (pgsize * ncontig));
+	__flush_hugetlb_tlb_range(&vma, addr, end, pgsize, true);
 	return orig_pte;
 }
 
@@ -216,7 +217,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear(mm, addr, ptep);
 
-	flush_tlb_range(&vma, saddr, addr);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
@@ -245,7 +246,9 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	dpfn = pgsize >> PAGE_SHIFT;
 	hugeprot = pte_pgprot(pte);
 
-	clear_flush(mm, addr, ptep, pgsize, ncontig);
+	/* Only need to "break" if transitioning valid -> valid. */
+	if (pte_valid(__ptep_get(ptep)))
+		clear_flush(mm, addr, ptep, pgsize, ncontig);
 
 	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
 		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
-- 
2.43.0

