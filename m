Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F7C1DE884
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593231; cv=none; b=IFB5f1HfG/y1vg66grdOh1lMn++u1Bd1zZ9sUgX1wJOQElNKbL9V52KlT9G5NS04aJftXB03Q2QEpyFNLXzIacgwKVLHtjZwRuZ3HTvH7HJmtcM9oKCRGo7pfirNGilTd5vfeL38E2UIaokWHokFtcEvaxkajyGuwmkX21NFYaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593231; c=relaxed/simple;
	bh=cb9ZM8+asV8O9lyMUSgIdJT/Pxowzq9mQ6RFl/e6SGo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F1XtEFF5aYZgfGSgOGQdsTbVdyEf/1h83o/VNorlFNPpgVygQjzKzCquxipsSsVgcsYYhSvqtZe0CKDyljrQMhHKSW8UOl0ZsDIRmJFOcrz7IZuvR4KjOEMhBMLjQQHbUkxrevDPr63MHNk1cBCEl0GLJMyuNYxXsPujATrHOw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57A0516F8;
	Fri, 30 May 2025 01:20:12 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D82D3F694;
	Fri, 30 May 2025 01:20:24 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com,
	kevin.brodsky@arm.com,
	yangyicong@hisilicon.com,
	joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH] arm64: Enable vmalloc-huge with ptdump
Date: Fri, 30 May 2025 13:50:21 +0530
Message-Id: <20250530082021.18182-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm64 disables vmalloc-huge when kernel page table dumping is enabled,
because an intermediate table may be removed, potentially causing the
ptdump code to dereference an invalid address. We want to be able to
analyze block vs page mappings for kernel mappings with ptdump, so to
enable vmalloc-huge with ptdump, synchronize between page table removal in
pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
use mmap_read_lock and not write lock because we don't need to synchronize
between two different vm_structs; two vmalloc objects running this same
code path will point to different page tables, hence there is no race. 

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 6 ++----
 arch/arm64/mm/mmu.c              | 7 +++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 38fafffe699f..28b7173d8693 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
 	/*
 	 * SW table walks can't handle removal of intermediate entries.
 	 */
-	return pud_sect_supported() &&
-	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
+	return pud_sect_supported();
 }
 
 #define arch_vmap_pmd_supported arch_vmap_pmd_supported
 static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 {
-	/* See arch_vmap_pud_supported() */
-	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
+	return true;
 }
 
 #endif
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ea6695d53fb9..798cebd9e147 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 	}
 
 	table = pte_offset_kernel(pmdp, addr);
+
+	/* Synchronize against ptdump_walk_pgd() */
+	mmap_read_lock(&init_mm);
 	pmd_clear(pmdp);
+	mmap_read_unlock(&init_mm);
 	__flush_tlb_kernel_pgtable(addr);
 	pte_free_kernel(NULL, table);
 	return 1;
@@ -1289,7 +1293,10 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 		pmd_free_pte_page(pmdp, next);
 	} while (pmdp++, next += PMD_SIZE, next != end);
 
+	/* Synchronize against ptdump_walk_pgd() */
+	mmap_read_lock(&init_mm);
 	pud_clear(pudp);
+	mmap_read_unlock(&init_mm);
 	__flush_tlb_kernel_pgtable(addr);
 	pmd_free(NULL, table);
 	return 1;
-- 
2.30.2

