Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EFD1FC100
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768271; cv=none; b=uSiqlsP2vHQOqHs1xUAGRL1l/PTeUbzSDvw3dsPXzy1qq0XnFUqWZz/ua98517va7nMBXctL6XYGP6EAt2DkEAFzumxFdEkHsa3qdLfxi2o+ft70z5dkkOlcn058ZLJLAV7wxiemacBPWkd5SlhG5NLRL8xNGEH4LPLu3XHnHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768271; c=relaxed/simple;
	bh=s1eTDNUU5OiX4B1NHUPhtxhYTlSG8CyE+yB06tL5EVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgqammmLu65qo89PDZsF00NGeQVtQFQAE8znh7CCGvjSEGi/V5w9qTmdOfDNv0TqSmsY0cz+OGNsuEBgh7dG39//F2g6ZWTbDK6ilvPEmzahOXXcJFI4ORCYkarw4Klqshw2C5bJENPB3tgeuY1VGz8oMaWOUF8jDKWnay7QB04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12D691515;
	Wed,  5 Feb 2025 07:11:33 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA6533F5A1;
	Wed,  5 Feb 2025 07:11:06 -0800 (PST)
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
Subject: [PATCH v1 15/16] mm: Generalize arch_sync_kernel_mappings()
Date: Wed,  5 Feb 2025 15:09:55 +0000
Message-ID: <20250205151003.88959-16-ryan.roberts@arm.com>
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

arch_sync_kernel_mappings() is an optional hook for arches to allow them
to synchonize certain levels of the kernel pgtables after modification.
But arm64 could benefit from a hook similar to this, paired with a call
prior to starting the batch of modifications.

So let's introduce arch_update_kernel_mappings_begin() and
arch_update_kernel_mappings_end(). Both have a default implementation
which can be overridden by the arch code. The default for the former is
a nop, and the default for the latter is to call
arch_sync_kernel_mappings(), so the latter replaces previous
arch_sync_kernel_mappings() callsites. So by default, the resulting
behaviour is unchanged.

To avoid include hell, the pgtbl_mod_mask type and it's associated
macros are moved to their own header.

In a future patch, arm64 will opt-in to overriding both functions.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/pgtable.h         | 24 +----------------
 include/linux/pgtable_modmask.h | 32 ++++++++++++++++++++++
 include/linux/vmalloc.h         | 47 +++++++++++++++++++++++++++++++++
 mm/memory.c                     |  5 ++--
 mm/vmalloc.c                    | 15 ++++++-----
 5 files changed, 92 insertions(+), 31 deletions(-)
 create mode 100644 include/linux/pgtable_modmask.h

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 94d267d02372..7f70786a73b3 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -4,6 +4,7 @@
 
 #include <linux/pfn.h>
 #include <asm/pgtable.h>
+#include <linux/pgtable_modmask.h>
 
 #define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
 #define PUD_ORDER	(PUD_SHIFT - PAGE_SHIFT)
@@ -1786,29 +1787,6 @@ static inline bool arch_has_pfn_modify_check(void)
 # define PAGE_KERNEL_EXEC PAGE_KERNEL
 #endif
 
-/*
- * Page Table Modification bits for pgtbl_mod_mask.
- *
- * These are used by the p?d_alloc_track*() set of functions an in the generic
- * vmalloc/ioremap code to track at which page-table levels entries have been
- * modified. Based on that the code can better decide when vmalloc and ioremap
- * mapping changes need to be synchronized to other page-tables in the system.
- */
-#define		__PGTBL_PGD_MODIFIED	0
-#define		__PGTBL_P4D_MODIFIED	1
-#define		__PGTBL_PUD_MODIFIED	2
-#define		__PGTBL_PMD_MODIFIED	3
-#define		__PGTBL_PTE_MODIFIED	4
-
-#define		PGTBL_PGD_MODIFIED	BIT(__PGTBL_PGD_MODIFIED)
-#define		PGTBL_P4D_MODIFIED	BIT(__PGTBL_P4D_MODIFIED)
-#define		PGTBL_PUD_MODIFIED	BIT(__PGTBL_PUD_MODIFIED)
-#define		PGTBL_PMD_MODIFIED	BIT(__PGTBL_PMD_MODIFIED)
-#define		PGTBL_PTE_MODIFIED	BIT(__PGTBL_PTE_MODIFIED)
-
-/* Page-Table Modification Mask */
-typedef unsigned int pgtbl_mod_mask;
-
 #endif /* !__ASSEMBLY__ */
 
 #if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)
diff --git a/include/linux/pgtable_modmask.h b/include/linux/pgtable_modmask.h
new file mode 100644
index 000000000000..5a21b1bb8df3
--- /dev/null
+++ b/include/linux/pgtable_modmask.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_PGTABLE_MODMASK_H
+#define _LINUX_PGTABLE_MODMASK_H
+
+#ifndef __ASSEMBLY__
+
+/*
+ * Page Table Modification bits for pgtbl_mod_mask.
+ *
+ * These are used by the p?d_alloc_track*() set of functions an in the generic
+ * vmalloc/ioremap code to track at which page-table levels entries have been
+ * modified. Based on that the code can better decide when vmalloc and ioremap
+ * mapping changes need to be synchronized to other page-tables in the system.
+ */
+#define		__PGTBL_PGD_MODIFIED	0
+#define		__PGTBL_P4D_MODIFIED	1
+#define		__PGTBL_PUD_MODIFIED	2
+#define		__PGTBL_PMD_MODIFIED	3
+#define		__PGTBL_PTE_MODIFIED	4
+
+#define		PGTBL_PGD_MODIFIED	BIT(__PGTBL_PGD_MODIFIED)
+#define		PGTBL_P4D_MODIFIED	BIT(__PGTBL_P4D_MODIFIED)
+#define		PGTBL_PUD_MODIFIED	BIT(__PGTBL_PUD_MODIFIED)
+#define		PGTBL_PMD_MODIFIED	BIT(__PGTBL_PMD_MODIFIED)
+#define		PGTBL_PTE_MODIFIED	BIT(__PGTBL_PTE_MODIFIED)
+
+/* Page-Table Modification Mask */
+typedef unsigned int pgtbl_mod_mask;
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _LINUX_PGTABLE_MODMASK_H */
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 16dd4cba64f2..cb5d8f1965a1 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -11,6 +11,7 @@
 #include <asm/page.h>		/* pgprot_t */
 #include <linux/rbtree.h>
 #include <linux/overflow.h>
+#include <linux/pgtable_modmask.h>
 
 #include <asm/vmalloc.h>
 
@@ -213,6 +214,26 @@ extern int remap_vmalloc_range(struct vm_area_struct *vma, void *addr,
 int vmap_pages_range(unsigned long addr, unsigned long end, pgprot_t prot,
 		     struct page **pages, unsigned int page_shift);
 
+#ifndef arch_update_kernel_mappings_begin
+/**
+ * arch_update_kernel_mappings_begin - A batch of kernel pgtable mappings are
+ * about to be updated.
+ * @start: Virtual address of start of range to be updated.
+ * @end: Virtual address of end of range to be updated.
+ *
+ * An optional hook to allow architecture code to prepare for a batch of kernel
+ * pgtable mapping updates. An architecture may use this to enter a lazy mode
+ * where some operations can be deferred until the end of the batch.
+ *
+ * Context: Called in task context and may be preemptible.
+ */
+static inline void arch_update_kernel_mappings_begin(unsigned long start,
+						     unsigned long end)
+{
+}
+#endif
+
+#ifndef arch_update_kernel_mappings_end
 /*
  * Architectures can set this mask to a combination of PGTBL_P?D_MODIFIED values
  * and let generic vmalloc and ioremap code know when arch_sync_kernel_mappings()
@@ -229,6 +250,32 @@ int vmap_pages_range(unsigned long addr, unsigned long end, pgprot_t prot,
  */
 void arch_sync_kernel_mappings(unsigned long start, unsigned long end);
 
+/**
+ * arch_update_kernel_mappings_end - A batch of kernel pgtable mappings have
+ * been updated.
+ * @start: Virtual address of start of range that was updated.
+ * @end: Virtual address of end of range that was updated.
+ *
+ * An optional hook to inform architecture code that a batch update is complete.
+ * This balances a previous call to arch_update_kernel_mappings_begin().
+ *
+ * An architecture may override this for any purpose, such as exiting a lazy
+ * mode previously entered with arch_update_kernel_mappings_begin() or syncing
+ * kernel mappings to a secondary pgtable. The default implementation calls an
+ * arch-provided arch_sync_kernel_mappings() if any arch-defined pgtable level
+ * was updated.
+ *
+ * Context: Called in task context and may be preemptible.
+ */
+static inline void arch_update_kernel_mappings_end(unsigned long start,
+						   unsigned long end,
+						   pgtbl_mod_mask mask)
+{
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+		arch_sync_kernel_mappings(start, end);
+}
+#endif
+
 /*
  *	Lowlevel-APIs (not for driver use!)
  */
diff --git a/mm/memory.c b/mm/memory.c
index a15f7dd500ea..f80930bc19f6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3035,6 +3035,8 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
 	if (WARN_ON(addr >= end))
 		return -EINVAL;
 
+	arch_update_kernel_mappings_begin(start, end);
+
 	pgd = pgd_offset(mm, addr);
 	do {
 		next = pgd_addr_end(addr, end);
@@ -3055,8 +3057,7 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
 			break;
 	} while (pgd++, addr = next, addr != end);
 
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
-		arch_sync_kernel_mappings(start, start + size);
+	arch_update_kernel_mappings_end(start, end, mask);
 
 	return err;
 }
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 50fd44439875..c5c51d86ef78 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -312,10 +312,10 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 	pgtbl_mod_mask mask = 0;
 	int err;
 
+	arch_update_kernel_mappings_begin(addr, end);
 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
 				 ioremap_max_page_shift, &mask);
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
-		arch_sync_kernel_mappings(addr, end);
+	arch_update_kernel_mappings_end(addr, end, mask);
 
 	flush_cache_vmap(addr, end);
 	if (!err)
@@ -463,6 +463,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 	pgtbl_mod_mask mask = 0;
 
 	BUG_ON(addr >= end);
+
+	arch_update_kernel_mappings_begin(start, end);
+
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
@@ -473,8 +476,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 		vunmap_p4d_range(pgd, addr, next, &mask);
 	} while (pgd++, addr = next, addr != end);
 
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
-		arch_sync_kernel_mappings(start, end);
+	arch_update_kernel_mappings_end(start, end, mask);
 }
 
 void vunmap_range_noflush(unsigned long start, unsigned long end)
@@ -625,6 +627,8 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 	WARN_ON(page_shift < PAGE_SHIFT);
 
+	arch_update_kernel_mappings_begin(start, end);
+
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
 			page_shift == PAGE_SHIFT) {
 		err = vmap_small_pages_range_noflush(addr, end, prot, pages,
@@ -642,8 +646,7 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		}
 	}
 
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
-		arch_sync_kernel_mappings(start, end);
+	arch_update_kernel_mappings_end(start, end, mask);
 
 	return err;
 }
-- 
2.43.0

