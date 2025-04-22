Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224F124BBFD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309927; cv=none; b=kMxELGMHzZ+nzNHijgSDM+uC8uqGby8LPQUiGmJ2W9E3ow8q+Byj0vVFO4h/s93Ml1GRM1EzPvnd0HOEkoNzvD10T4wEvhKOHEQMa3rpMUDZaDltQFqBL4B7zDYCdG0JAjavl3J4D9TiaMFWA2191OjziR9/7aTiXDG4nVIoEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309927; c=relaxed/simple;
	bh=vFNGRtKKIlmtYqKLwxd4gM4ED6A9LG6+Fx8lrJMUzGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5U32cQ7QmbfHA5bd5EsUUXT21x3DIdXPamwot5u5fKgAHgaykQdkEif/ZOz4nQqcajPxietiQbQtdlmgMvayaNkxwQJRdZ2TCCj0Irb6CL7sInFxtXz/mVlUXo1xTFCBzH3FZoOsJU2seCg6Lu9he8rxXlJwdvFDhJ4JYwQR58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1887319F0;
	Tue, 22 Apr 2025 01:18:41 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6517D3F66E;
	Tue, 22 Apr 2025 01:18:43 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/11] arm64: hugetlb: Refine tlb maintenance scope
Date: Tue, 22 Apr 2025 09:18:10 +0100
Message-ID: <20250422081822.1836315-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
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

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/hugetlb.h | 29 +++++++++++++++++++----------
 arch/arm64/mm/hugetlbpage.c      |  9 ++++++---
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 07fbf5bf85a7..2a8155c4a882 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -69,29 +69,38 @@ extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 
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
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		__flush_tlb_range(vma, start, end, PUD_SIZE, false, 1);
+		__flush_tlb_range(vma, start, end, PUD_SIZE, last_level, 1);
 		break;
 #endif
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
index 701394aa7734..087fc43381c6 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -183,8 +183,9 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
 {
 	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pgsize, ncontig);
 	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+	unsigned long end = addr + (pgsize * ncontig);
 
-	flush_tlb_range(&vma, addr, addr + (pgsize * ncontig));
+	__flush_hugetlb_tlb_range(&vma, addr, end, pgsize, true);
 	return orig_pte;
 }
 
@@ -209,7 +210,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear(mm, addr, ptep);
 
-	flush_tlb_range(&vma, saddr, addr);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
@@ -238,7 +239,9 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
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

