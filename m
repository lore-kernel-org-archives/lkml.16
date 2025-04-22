Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE272571BC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309944; cv=none; b=VkLpzX2V1Wuz5NhOnJKB+qLg0Grr7n5lGvEcidqx8n/ff9QX/o2XoKZQAR7065Z9y/V8bVKsI8ZTLVgW2sjxs3zIXOJF8UKEDvdUpb0BDFfsQxkuQpsI1uodmeWREnr5mo+ERHpqbFGBZR+C8+B841ELW3Gpd/oYLlorBNwsXVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309944; c=relaxed/simple;
	bh=+p/mnV2DQV1p9Z1OJQB+OJfrf5JgQAwxSMZ6nSzRZNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1MsV5kUGriTts3F1FsR+F4480h+hV7eKakepg91P3M8tSTfSBdXlHUqY9ehTfpTH1IaHY1rY92fgNMCPcGt+kTT/x1RiEy5lbHLLkjihUQo15XIxzUeZoqx8BZPWVepemUPqghNDhQ8L3PHcuYRW2p58YeqyeBaKdf3ivY+iFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 436561EDB;
	Tue, 22 Apr 2025 01:18:58 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BBBF3F66E;
	Tue, 22 Apr 2025 01:19:00 -0700 (PDT)
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
Subject: [PATCH v4 10/11] mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes
Date: Tue, 22 Apr 2025 09:18:18 +0100
Message-ID: <20250422081822.1836315-11-ryan.roberts@arm.com>
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

Wrap vmalloc's pte table manipulation loops with
arch_enter_lazy_mmu_mode() / arch_leave_lazy_mmu_mode(). This provides
the arch code with the opportunity to optimize the pte manipulations.

Note that vmap_pfn() already uses lazy mmu mode since it delegates to
apply_to_page_range() which enters lazy mmu mode for both user and
kernel mappings.

These hooks will shortly be used by arm64 to improve vmalloc
performance.

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/vmalloc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index fe2e2cc8da94..24430160b37f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -104,6 +104,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte = pte_alloc_kernel_track(pmd, addr, mask);
 	if (!pte)
 		return -ENOMEM;
+
+	arch_enter_lazy_mmu_mode();
+
 	do {
 		if (unlikely(!pte_none(ptep_get(pte)))) {
 			if (pfn_valid(pfn)) {
@@ -127,6 +130,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
 		pfn++;
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+
+	arch_leave_lazy_mmu_mode();
 	*mask |= PGTBL_PTE_MODIFIED;
 	return 0;
 }
@@ -354,6 +359,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	unsigned long size = PAGE_SIZE;
 
 	pte = pte_offset_kernel(pmd, addr);
+	arch_enter_lazy_mmu_mode();
+
 	do {
 #ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_unmap_size(addr, pte);
@@ -370,6 +377,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			ptent = ptep_get_and_clear(&init_mm, addr, pte);
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
+
+	arch_leave_lazy_mmu_mode();
 	*mask |= PGTBL_PTE_MODIFIED;
 }
 
@@ -515,6 +524,9 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	pte = pte_alloc_kernel_track(pmd, addr, mask);
 	if (!pte)
 		return -ENOMEM;
+
+	arch_enter_lazy_mmu_mode();
+
 	do {
 		struct page *page = pages[*nr];
 
@@ -528,6 +540,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
 		(*nr)++;
 	} while (pte++, addr += PAGE_SIZE, addr != end);
+
+	arch_leave_lazy_mmu_mode();
 	*mask |= PGTBL_PTE_MODIFIED;
 	return 0;
 }
-- 
2.43.0

