Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA06134BD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571261; cv=none; b=lA2xvVsh65ydTbrDH8/ft9k23dpDdiL3WEmJFnXe8ObsrPmgiL0JysBLGh3TJbiVyH1VmatT3XK5hTDVwnUYqIF5JXLF8M8NCJAEsw2l8Zwb8OyjKBded4ChWOsKqKmlChmIiY4+873EStgPTan7hSg/0LJ5eZyXMHtMjxds1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571261; c=relaxed/simple;
	bh=GqE7ZSl+IurkWDf218Q5nM9bvwBjz2TOPoGxH9d2N7c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NIp2B4bbkyWb7LQlaGLLAS6I5iSZhUEoNboFnIeE5EpR4cC4uUdGrOqpA2KTeplazNl2V6QtOIl2WoNtHxFNal4pLAJGdjeW8E43cqz/a2QBWl5wIdFYi3ysQMV6yzcd7N67yFvDnXg4Q9cmLbdwwcuWZQ0fxjFF9MMY9/hO7L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDED814BF;
	Tue, 10 Jun 2025 09:00:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.87.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F1F13F673;
	Tue, 10 Jun 2025 09:00:54 -0700 (PDT)
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
Subject: [PATCH v2] arm64: Enable vmalloc-huge with ptdump
Date: Tue, 10 Jun 2025 21:30:48 +0530
Message-Id: <20250610160048.11254-1-dev.jain@arm.com>
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

For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
512 times again via pmd_free_pte_page(). Note that there is no need to
move __flush_tlb_kernel_pgtable() to immediately after pud_clear(); the
only argument against this would be that we immediately require a
dsb(ishst) (present in __flush_tlb_kernel_pgtable()) after pud_clear(),
but that is not the case, since the transition is from
valid -> invalid, not vice-versa.

No issues were observed with mm-selftests. No issues were observed while
parallelly running test_vmalloc.sh and dumping the kernel pagetable through
sysfs in a loop.

v1->v2:
 - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
 - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
   the lock 512 times again via pmd_free_pte_page()

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/vmalloc.h |  6 ++---
 arch/arm64/mm/mmu.c              | 43 +++++++++++++++++++++++++++++---
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 12f534e8f3ed..e835fd437ae0 100644
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
 
 #define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8fcf59ba39db..fa98a62e4baf 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1267,7 +1267,25 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
-int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
+#ifdef CONFIG_PTDUMP_DEBUGFS
+static inline void ptdump_synchronize_lock(void)
+{
+	/* Synchronize against ptdump_walk_pgd() */
+	mmap_read_lock(&init_mm);
+}
+
+static inline void ptdump_synchronize_unlock(void)
+{
+	mmap_read_unlock(&init_mm);
+}
+#else	/* CONFIG_PTDUMP_DEBUGFS */
+
+static inline void ptdump_synchronize_lock(void)	{}
+static inline void ptdump_synchronize_unlock(void)	{}
+
+#endif	/* CONFIG_PTDUMP_DEBUGFS */
+
+static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
 {
 	pte_t *table;
 	pmd_t pmd;
@@ -1280,12 +1298,23 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 	}
 
 	table = pte_offset_kernel(pmdp, addr);
+
+	if (lock)
+		ptdump_synchronize_lock();
 	pmd_clear(pmdp);
+	if (lock)
+		ptdump_synchronize_unlock();
+
 	__flush_tlb_kernel_pgtable(addr);
 	pte_free_kernel(NULL, table);
 	return 1;
 }
 
+int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
+{
+	return __pmd_free_pte_page(pmdp, addr, true);
+}
+
 int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 {
 	pmd_t *table;
@@ -1301,14 +1330,22 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 	}
 
 	table = pmd_offset(pudp, addr);
+
+	/*
+	 * Isolate the PMD table; in case of race with ptdump, this helps
+	 * us to avoid taking the lock in __pmd_free_pte_page()
+	 */
+	ptdump_synchronize_lock();
+	pud_clear(pudp);
+	ptdump_synchronize_unlock();
+
 	pmdp = table;
 	next = addr;
 	end = addr + PUD_SIZE;
 	do {
-		pmd_free_pte_page(pmdp, next);
+		__pmd_free_pte_page(pmdp, next, false);
 	} while (pmdp++, next += PMD_SIZE, next != end);
 
-	pud_clear(pudp);
 	__flush_tlb_kernel_pgtable(addr);
 	pmd_free(NULL, table);
 	return 1;
-- 
2.30.2

