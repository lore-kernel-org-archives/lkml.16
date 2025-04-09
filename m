Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B1261365
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201703; cv=none; b=m6OdT75JfSll5/Jdv9I3tZ8R81AGq93fH41c4znVQ/+6hASoYR+QJtuvGj/3npGHgi5BlXZIGVbeFPTQLjDQjEY8f3U1aEKEHaD7emDJgRX7OCEUoZ35KBieACD9idCVVEq+4HCSLca2X09QDO61Mxg44/GV7hc4Fp+j8KncrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201703; c=relaxed/simple;
	bh=v1i4hDeteXRdKP8WMa0ehioVx7bibXFQCrXgef26fj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDkFkpy4ap29egM5KvznODvVosr6DilWzhIDfp2q1fJEnmWRWvDlxA0Fr7xvmZfqkZvFwpX1BvbQ16Y+rdZoGBF95gICaL2vn2HtxVm69/Rbz6oqQHyrytGVRdPAQPBabuQzhLqMvhoNgxxHajZS4/mTJYmditD95YvL/udOPX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bS1eUVvn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bS1eUVvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22F4C4CEE3;
	Wed,  9 Apr 2025 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201701;
	bh=v1i4hDeteXRdKP8WMa0ehioVx7bibXFQCrXgef26fj0=;
	h=From:To:Cc:Subject:Date:From;
	b=bS1eUVvnO+G7iLB89VFjOUqEj5aGAEbAhYkcg03k70dbEnJPb2r/5z2UbjQgrBvL+
	 esRFEHXEAtRWpRd/TM9RiRWZQa88vObE2Tk26N1GgqneLTt1jw5pOKtkh3hoE4yxkj
	 7V790Eq+BWCUJ+SXtCJ4ecOr92j8Li7KygOh4SkdbK2wL/MM1d1uIzPfl6MAymKMVS
	 nZs9svp3OWN2oCV/KnTfa1m7rXwHfm33gCjJXNYXKsWzrL53KZJE7hZFRId/nLHU6B
	 rN2hIe9Zk0J4334aI/cH5h3TOk54+uqzOoPhYe/q9YEDhamdVaeJqTIySRUL/l01be
	 ImOaIt0KZK9+Q==
From: Mike Rapoport <rppt@kernel.org>
To: x86@kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/mm: consolidate initmem_init()
Date: Wed,  9 Apr 2025 15:28:15 +0300
Message-ID: <20250409122815.420041-1-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

There are 4 wariants of initmem_init(), for 32 and 64 bits and for
CONFIG_NUMA enabled and disabled.

After commit bbeb69ce3013 ("x86/mm: Remove CONFIG_HIGHMEM64G support")
NUMA is not supported on 32 bits and arch/x86/mm/numa_32.c can be just
deleted and setup_bootmem_allocator() with completely misleading name
can be folded into initmem_init().

For 64 bits the NUMA variant calls x86_numa_init() and !NUMA variant
sets all memory to node 0. The later can be split out into inline helper
called x86_numa_init() and then both initmem_init() functions become the
same.

Split out memblock_set_node() from initmem_init() for !NUMA on 64 bit
into x86_numa_init() helper and remove arch/x86/mm/numa_*.c that only
contained initmem_init() variants for NUMA configs.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/page_32_types.h |  1 -
 arch/x86/mm/Makefile                 |  2 +-
 arch/x86/mm/init_32.c                |  7 ----
 arch/x86/mm/init_64.c                |  7 +++-
 arch/x86/mm/mm_internal.h            |  4 ++
 arch/x86/mm/numa.c                   |  3 +-
 arch/x86/mm/numa_32.c                | 61 ----------------------------
 arch/x86/mm/numa_64.c                | 13 ------
 arch/x86/mm/numa_internal.h          | 10 -----
 9 files changed, 13 insertions(+), 95 deletions(-)
 delete mode 100644 arch/x86/mm/numa_32.c
 delete mode 100644 arch/x86/mm/numa_64.c
 delete mode 100644 arch/x86/mm/numa_internal.h

diff --git a/arch/x86/include/asm/page_32_types.h b/arch/x86/include/asm/page_32_types.h
index a9b62e0e6f79..623f1e9f493e 100644
--- a/arch/x86/include/asm/page_32_types.h
+++ b/arch/x86/include/asm/page_32_types.h
@@ -73,7 +73,6 @@ extern unsigned int __VMALLOC_RESERVE;
 extern int sysctl_legacy_va_layout;
 
 extern void find_low_pfn_range(void);
-extern void setup_bootmem_allocator(void);
 
 #endif	/* !__ASSEMBLER__ */
 
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 32035d5be5a0..1e72f06b6ba5 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -52,7 +52,7 @@ obj-$(CONFIG_MMIOTRACE)		+= mmiotrace.o
 mmiotrace-y			:= kmmio.o pf_in.o mmio-mod.o
 obj-$(CONFIG_MMIOTRACE_TEST)	+= testmmiotrace.o
 
-obj-$(CONFIG_NUMA)		+= numa.o numa_$(BITS).o
+obj-$(CONFIG_NUMA)		+= numa.o
 obj-$(CONFIG_AMD_NUMA)		+= amdtopology.o
 obj-$(CONFIG_ACPI_NUMA)		+= srat.o
 
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index ad662cc4605c..d467f89191cd 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -612,7 +612,6 @@ void __init find_low_pfn_range(void)
 		highmem_pfn_init();
 }
 
-#ifndef CONFIG_NUMA
 void __init initmem_init(void)
 {
 #ifdef CONFIG_HIGHMEM
@@ -633,12 +632,6 @@ void __init initmem_init(void)
 	printk(KERN_NOTICE "%ldMB LOWMEM available.\n",
 			pages_to_mb(max_low_pfn));
 
-	setup_bootmem_allocator();
-}
-#endif /* !CONFIG_NUMA */
-
-void __init setup_bootmem_allocator(void)
-{
 	printk(KERN_INFO "  mapped low ram: 0 - %08lx\n",
 		 max_pfn_mapped<<PAGE_SHIFT);
 	printk(KERN_INFO "  low ram: 0 - %08lx\n", max_low_pfn<<PAGE_SHIFT);
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 7c4f6f591f2b..b7655396f4e0 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -805,12 +805,17 @@ kernel_physical_mapping_change(unsigned long paddr_start,
 }
 
 #ifndef CONFIG_NUMA
-void __init initmem_init(void)
+static inline void x86_numa_init(void)
 {
 	memblock_set_node(0, PHYS_ADDR_MAX, &memblock.memory, 0);
 }
 #endif
 
+void __init initmem_init(void)
+{
+	x86_numa_init();
+}
+
 void __init paging_init(void)
 {
 	sparse_init();
diff --git a/arch/x86/mm/mm_internal.h b/arch/x86/mm/mm_internal.h
index 3f37b5c80bb3..097aadc250f7 100644
--- a/arch/x86/mm/mm_internal.h
+++ b/arch/x86/mm/mm_internal.h
@@ -25,4 +25,8 @@ void update_cache_mode_entry(unsigned entry, enum page_cache_mode cache);
 
 extern unsigned long tlb_single_page_flush_ceiling;
 
+#ifdef CONFIG_NUMA
+void __init x86_numa_init(void);
+#endif
+
 #endif	/* __X86_MM_INTERNAL_H */
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 64e5cdb2460a..4bf04be29355 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -19,8 +19,9 @@
 #include <asm/proto.h>
 #include <asm/dma.h>
 #include <asm/amd_nb.h>
+#include <asm/numa.h>
 
-#include "numa_internal.h"
+#include "mm_internal.h"
 
 int numa_off;
 
diff --git a/arch/x86/mm/numa_32.c b/arch/x86/mm/numa_32.c
deleted file mode 100644
index 65fda406e6f2..000000000000
--- a/arch/x86/mm/numa_32.c
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * Written by: Patricia Gaughen <gone@us.ibm.com>, IBM Corporation
- * August 2002: added remote node KVA remap - Martin J. Bligh 
- *
- * Copyright (C) 2002, IBM Corp.
- *
- * All rights reserved.          
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
- * NON INFRINGEMENT.  See the GNU General Public License for more
- * details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-#include <linux/memblock.h>
-#include <linux/init.h>
-#include <linux/vmalloc.h>
-#include <asm/pgtable_areas.h>
-
-#include "numa_internal.h"
-
-extern unsigned long highend_pfn, highstart_pfn;
-
-void __init initmem_init(void)
-{
-	x86_numa_init();
-
-#ifdef CONFIG_HIGHMEM
-	highstart_pfn = highend_pfn = max_pfn;
-	if (max_pfn > max_low_pfn)
-		highstart_pfn = max_low_pfn;
-	printk(KERN_NOTICE "%ldMB HIGHMEM available.\n",
-	       pages_to_mb(highend_pfn - highstart_pfn));
-	high_memory = (void *) __va(highstart_pfn * PAGE_SIZE - 1) + 1;
-#else
-	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE - 1) + 1;
-#endif
-	printk(KERN_NOTICE "%ldMB LOWMEM available.\n",
-			pages_to_mb(max_low_pfn));
-	printk(KERN_DEBUG "max_low_pfn = %lx, highstart_pfn = %lx\n",
-			max_low_pfn, highstart_pfn);
-
-	printk(KERN_DEBUG "Low memory ends at vaddr %08lx\n",
-			(ulong) pfn_to_kaddr(max_low_pfn));
-
-	printk(KERN_DEBUG "High memory starts at vaddr %08lx\n",
-			(ulong) pfn_to_kaddr(highstart_pfn));
-
-	__vmalloc_start_set = true;
-	setup_bootmem_allocator();
-}
diff --git a/arch/x86/mm/numa_64.c b/arch/x86/mm/numa_64.c
deleted file mode 100644
index 59d80160fa5a..000000000000
--- a/arch/x86/mm/numa_64.c
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Generic VM initialization for x86-64 NUMA setups.
- * Copyright 2002,2003 Andi Kleen, SuSE Labs.
- */
-#include <linux/memblock.h>
-
-#include "numa_internal.h"
-
-void __init initmem_init(void)
-{
-	x86_numa_init();
-}
diff --git a/arch/x86/mm/numa_internal.h b/arch/x86/mm/numa_internal.h
deleted file mode 100644
index 11e1ff370c10..000000000000
--- a/arch/x86/mm/numa_internal.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __X86_MM_NUMA_INTERNAL_H
-#define __X86_MM_NUMA_INTERNAL_H
-
-#include <linux/types.h>
-#include <asm/numa.h>
-
-void __init x86_numa_init(void);
-
-#endif	/* __X86_MM_NUMA_INTERNAL_H */

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.47.2

