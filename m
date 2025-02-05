Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6214D1DDC16
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768263; cv=none; b=QKEtsmL5utzA+4hhCQihcYAlhbitBgpB50jxse4gQNw5JeO+y9SJXQ6Drwzfmcu0J9f18zUgENPWRWQgo/9wRUmNuTkVee+e1Ro/qPUG/k5VB4K5Mwrcu4w/MtA7QJYgq3VyoVbpVySAoLFI9IEawTSXBYWLriuh8TN4C9d0sIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768263; c=relaxed/simple;
	bh=4HaEif7VAgw7qFBNCqe75y3ls+QYvgNm1pLd1XNDZsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8eI6j5rnQt7v3LAmgafxxeJjaYAgd2KCRk0dCzo6JHaVIji+diamHCgowuBfCcWXnZ7OIDI3hAU4uspxqW9sLu2rOeMe5+XY5eVKYppNOC/QaW3W700O2xO2Q08gS40t++XGnZzoOdTr0GdkrTDJ1RZRmayYvmNF1TR4YtL2i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88D461C01;
	Wed,  5 Feb 2025 07:11:24 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CE293F5A1;
	Wed,  5 Feb 2025 07:10:58 -0800 (PST)
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
Subject: [PATCH v1 12/16] arm64/mm: Support huge pte-mapped pages in vmap
Date: Wed,  5 Feb 2025 15:09:52 +0000
Message-ID: <20250205151003.88959-13-ryan.roberts@arm.com>
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

Implement the required arch functions to enable use of contpte in the
vmap when VM_ALLOW_HUGE_VMAP is specified. This speeds up vmap
operations due to only having to issue a DSB and ISB per contpte block
instead of per pte. But it also means that the TLB pressure reduces due
to only needing a single TLB entry for the whole contpte block.

Since vmap uses set_huge_pte_at() to set the contpte, that API is now
used for kernel mappings for the first time. Although in the vmap case
we never expect it to be called to modify a valid mapping so
clear_flush() should never be called, it's still wise to make it robust
for the kernel case, so amend the tlb flush function if the mm is for
kernel space.

Tested with vmalloc performance selftests:

  # kself/mm/test_vmalloc.sh \
	run_test_mask=1
	test_repeat_count=5
	nr_pages=256
	test_loop_count=100000
	use_huge=1

Duration reduced from 1274243 usec to 1083553 usec on Apple M2 for 15%
reduction in time taken.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 40 ++++++++++++++++++++++++++++++++
 arch/arm64/mm/hugetlbpage.c      |  5 +++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 38fafffe699f..fbdeb40f3857 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,6 +23,46 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
 }
 
+#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
+static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
+						unsigned long end, u64 pfn,
+						unsigned int max_page_shift)
+{
+	if (max_page_shift < CONT_PTE_SHIFT)
+		return PAGE_SIZE;
+
+	if (end - addr < CONT_PTE_SIZE)
+		return PAGE_SIZE;
+
+	if (!IS_ALIGNED(addr, CONT_PTE_SIZE))
+		return PAGE_SIZE;
+
+	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
+		return PAGE_SIZE;
+
+	return CONT_PTE_SIZE;
+}
+
+#define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
+static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long addr,
+							   pte_t *ptep)
+{
+	/*
+	 * The caller handles alignment so it's sufficient just to check
+	 * PTE_CONT.
+	 */
+	return pte_valid_cont(__ptep_get(ptep)) ? CONT_PTE_SIZE : PAGE_SIZE;
+}
+
+#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
+static inline int arch_vmap_pte_supported_shift(unsigned long size)
+{
+	if (size >= CONT_PTE_SIZE)
+		return CONT_PTE_SHIFT;
+
+	return PAGE_SHIFT;
+}
+
 #endif
 
 #define arch_vmap_pgprot_tagged arch_vmap_pgprot_tagged
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 02afee31444e..a74e43101dad 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -217,7 +217,10 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		___ptep_get_and_clear(mm, ptep, pgsize);
 
-	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
+	if (mm == &init_mm)
+		flush_tlb_kernel_range(saddr, addr);
+	else
+		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.43.0

