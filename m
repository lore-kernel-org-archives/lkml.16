Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B61721322B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750915535; cv=none; b=swV5OznGa6vwNisM+2Jsb63c4FOKRaP+AHftNJizFK+tAehvQUw6EJiHoiE3Og8fV9VpQVkEOsRWIBmwcIX67X2qCoMNdg7bh1YOIG1tvug4AX7qlUBA7uHqgiMvIS7HTs/gsfgRuPf/6x7lFEJhF2Dxup1fVExaC7AskLSXnVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750915535; c=relaxed/simple;
	bh=YrIrD3TMNX8nBIaDfu6uR7ILTI56JLDkyVOVI3PWQVY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=csFAp165L2pX+QJX5jI1JBKqMBkuyAzJpCrs8YjlGiDefv8FQ02nuL+0pUZX+6PmlbB9Hd0SY7YISk59SkfXAix9pChqlk2Nq1kR5iaQVSfmUjXfGihVfsFEoDKNCOsD/ZNOIJ97FW5BWUr1hPy9Fr81CT3RcJO+aGooI0jgOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F2601063;
	Wed, 25 Jun 2025 22:25:14 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36B753F63F;
	Wed, 25 Jun 2025 22:25:27 -0700 (PDT)
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
Subject: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
Date: Thu, 26 Jun 2025 10:55:24 +0530
Message-Id: <20250626052524.332-1-dev.jain@arm.com>
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
512 times again via pmd_free_pte_page().

We implement the locking mechanism using static keys, since the chance
of a race is very small. Observe that the synchronization is needed
to avoid the following race:

CPU1							CPU2
						take reference of PMD table
pud_clear()
pte_free_kernel()
						walk freed PMD table

and similar race between pmd_free_pte_page and ptdump_walk_pgd.

Therefore, there are two cases: if ptdump sees the cleared PUD, then
we are safe. If not, then the patched-in read and write locks help us
avoid the race.

To implement the mechanism, we need the static key access from mmu.c and
ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
target in the Makefile, therefore we cannot initialize the key there, as
is being done, for example, in the static key implementation of
hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
the jump_label mechanism. Declare the key there and define the key to false
in mmu.c.

No issues were observed with mm-selftests. No issues were observed while
parallelly running test_vmalloc.sh and dumping the kernel pagetable through
sysfs in a loop.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
v3->v4:
 - Lock-unlock immediately
 - Simplify includes

v2->v3:
 - Use static key mechanism

v1->v2:
 - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
 - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
   the lock 512 times again via pmd_free_pte_page()

 arch/arm64/include/asm/ptdump.h |  2 ++
 arch/arm64/mm/mmu.c             | 44 ++++++++++++++++++++++++++++++---
 arch/arm64/mm/ptdump.c          |  5 +++-
 3 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index fded5358641f..5b331f2a7be1 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -7,6 +7,8 @@
 
 #include <linux/ptdump.h>
 
+DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
+
 #ifdef CONFIG_PTDUMP
 
 #include <linux/mm_types.h>
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 00ab1d648db6..9d3be249047c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -46,6 +46,8 @@
 #define NO_CONT_MAPPINGS	BIT(1)
 #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
 
+DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
+
 enum pgtable_type {
 	TABLE_PTE,
 	TABLE_PMD,
@@ -1267,7 +1269,7 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
-int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
+static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
 {
 	pte_t *table;
 	pmd_t pmd;
@@ -1279,13 +1281,24 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 		return 1;
 	}
 
+	/* See comment in pud_free_pmd_page for static key logic */
 	table = pte_offset_kernel(pmdp, addr);
 	pmd_clear(pmdp);
 	__flush_tlb_kernel_pgtable(addr);
+	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
+		mmap_read_lock(&init_mm);
+		mmap_read_unlock(&init_mm);
+	}
+
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
@@ -1301,16 +1314,39 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 	}
 
 	table = pmd_offset(pudp, addr);
+	/*
+	 * Isolate the PMD table; in case of race with ptdump, this helps
+	 * us to avoid taking the lock in __pmd_free_pte_page().
+	 *
+	 * Static key logic:
+	 *
+	 * Case 1: If ptdump does static_branch_enable(), and after that we
+	 * execute the if block, then this patches in the read lock, ptdump has
+	 * the write lock patched in, therefore ptdump will never read from
+	 * a potentially freed PMD table.
+	 *
+	 * Case 2: If the if block starts executing before ptdump's
+	 * static_branch_enable(), then no locking synchronization
+	 * will be done. However, pud_clear() + the dsb() in
+	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
+	 * empty PUD. Thus, it will never walk over a potentially freed
+	 * PMD table.
+	 */
+	pud_clear(pudp);
+	__flush_tlb_kernel_pgtable(addr);
+	if (static_branch_unlikely(&ptdump_lock_key)) {
+		mmap_read_lock(&init_mm);
+		mmap_read_unlock(&init_mm);
+	}
+
 	pmdp = table;
 	next = addr;
 	end = addr + PUD_SIZE;
 	do {
 		if (pmd_present(pmdp_get(pmdp)))
-			pmd_free_pte_page(pmdp, next);
+			__pmd_free_pte_page(pmdp, next, false);
 	} while (pmdp++, next += PMD_SIZE, next != end);
 
-	pud_clear(pudp);
-	__flush_tlb_kernel_pgtable(addr);
 	pmd_free(NULL, table);
 	return 1;
 }
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 421a5de806c6..41c9ea61813b 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -25,7 +25,6 @@
 #include <asm/pgtable-hwdef.h>
 #include <asm/ptdump.h>
 
-
 #define pt_dump_seq_printf(m, fmt, args...)	\
 ({						\
 	if (m)					\
@@ -311,7 +310,9 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
 		}
 	};
 
+	static_branch_enable(&ptdump_lock_key);
 	ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
+	static_branch_disable(&ptdump_lock_key);
 }
 
 static void __init ptdump_initialize(void)
@@ -353,7 +354,9 @@ bool ptdump_check_wx(void)
 		}
 	};
 
+	static_branch_enable(&ptdump_lock_key);
 	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
+	static_branch_disable(&ptdump_lock_key);
 
 	if (st.wx_pages || st.uxn_pages) {
 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",
-- 
2.30.2

