Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5C215F7E;
	Tue,  4 Feb 2025 17:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690508; cv=none; b=LG8gxg9syT65UYrHtmeDY0c51I7gver0+eqgcYd2rmtr2FgZytU3Sg5ChXFMkk5U+LVzJNlW51qSVFDJjDFo1MP+NqlVpgsT6OZj48lSTAo9d/r7EUugnCTrlxOgrSAjnXWV37QgOHfmkS8VYfzvIqvPRqWE+/D1YaGXnes8IwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690508; c=relaxed/simple;
	bh=aHGhpjph+eDn968NL6XwKtEp1WbZxR8Rwtm1kIwOPTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TtyVm/kHC9sw1c5yXqJuCkq2PXvZrH1je9IJnNpe3BlKQps4YLVaqBQUSy4JJzb/QIYq2HCN2f3GyugH/4eMjdM0ilzQ1bDBawoPjKSHJ59SguBzhwGxq7b4QtWSLildCuO+Wbg63tIo3dug2oEkemp3DkKr4ccNlyKcGmdIlF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rufk0rAb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rufk0rAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690506; x=1770226506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aHGhpjph+eDn968NL6XwKtEp1WbZxR8Rwtm1kIwOPTc=;
  b=Rufk0rAbWg2sNISQsQphLLXIzm50vQe2J5XKJ47wS9ocHJVCOz1dc2RV
   a3p30EuwmX6PAv9QhFiy+tNnjk2MF+gZs8I6dvJvnX/j0GESFppww3LAj
   s+l68OXJW4LrJXyMpA/5lG0vz70+lxlgNJ7jP1oXOPhAaNOb6FDwfhu+h
   TJPxPOQSC1Bsw3IWCvkNCfi4n00u/a758N6LyOqOmcTd8QS659Yz+IBBY
   gwa40HkYNni2MxC4OiQyjXhjFgDAzW0Y6VtvKIy9B89jOWPRPZHrgOoMc
   ygTZcJNK/CapE0pJod+by0Wtg02AiGo+iBg8NBxdGKnYtbSHElAutvgEK
   g==;
X-CSE-ConnectionGUID: 901WlPTFRd++68aeK17uAQ==
X-CSE-MsgGUID: EjlGCcXJTMGhoGoz6n6qFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930393"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930393"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:35:04 -0800
X-CSE-ConnectionGUID: eBbq5MWaSZONJhS+dGPi8A==
X-CSE-MsgGUID: mjasgO5WTcSBmxRL24BE0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866217"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:34:49 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 02/15] kasan: Tag checking with dense tag-based mode
Date: Tue,  4 Feb 2025 18:33:43 +0100
Message-ID: <8f790bb7e166c1ea2e5003318149eb1d7aba3596.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In KASAN's tag-based mode (arm64) when a memory access occurs, the tag
stored in the top 8 bits of the pointer is compared with tags saved in
the region of the shadow memory that maps to memory the pointer points
to. If any of the tags in the shadow memory region do not match the one
stored in the pointer an error report is generated.

With the introduction of the dense mode, tags won't necessarily occupy
whole bytes of shadow memory if the previously allocated memory wasn't
aligned to 32 bytes - which is the coverage of one shadow byte.

Add an alternative implementation of kasan_check_range() that performs
special checks on first and last bytes of shadow memory ranges if the
originally allocated memory wasn't aligned to 32 bytes.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 include/linux/kasan.h     | 47 +++++++++++++++-------
 mm/kasan/Makefile         |  3 ++
 mm/kasan/dense.c          | 83 +++++++++++++++++++++++++++++++++++++++
 mm/kasan/kasan.h          |  2 +-
 mm/kasan/report.c         |  2 +-
 mm/kasan/report_sw_tags.c | 12 ++----
 mm/kasan/sw_tags.c        |  8 ++++
 7 files changed, 133 insertions(+), 24 deletions(-)
 create mode 100644 mm/kasan/dense.c

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index ea0f5acd875b..5a3e9bec21c2 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -33,6 +33,20 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
 
 #include <linux/pgtable.h>
 
+#ifndef kasan_mem_to_shadow
+static inline void *kasan_mem_to_shadow(const void *addr)
+{
+	void *scaled;
+
+	if (IS_ENABLED(CONFIG_KASAN_GENERIC))
+		scaled = (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT);
+	else
+		scaled = (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIFT);
+
+	return KASAN_SHADOW_OFFSET + scaled;
+}
+#endif
+
 /* Software KASAN implementations use shadow memory. */
 
 #ifdef CONFIG_KASAN_SW_TAGS_DENSE
@@ -53,6 +67,25 @@ static inline u8 kasan_dense_tag(u8 tag)
 
 #define KASAN_GRANULE_SIZE	(1UL << KASAN_GRANULE_SHIFT)
 
+#ifdef CONFIG_KASAN_SW_TAGS_DENSE
+static inline u8 kasan_get_shadow_tag(const void *ptr)
+{
+	u8 shadow_byte = *(u8 *)kasan_mem_to_shadow(ptr);
+	unsigned long addr = (unsigned long)ptr;
+	int shift;
+
+	shift = !!(addr & KASAN_GRANULE_SIZE) * KASAN_TAG_WIDTH;
+	shadow_byte >>= shift;
+
+	return shadow_byte & KASAN_TAG_KERNEL;
+}
+#else
+static inline u8 kasan_get_shadow_tag(const void *addr)
+{
+	return (*(u8 *)kasan_mem_to_shadow(addr));
+}
+#endif
+
 #ifdef CONFIG_KASAN_SW_TAGS
 /* This matches KASAN_TAG_INVALID. */
 #define KASAN_SHADOW_INIT 0xFE
@@ -73,20 +106,6 @@ extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
 int kasan_populate_early_shadow(const void *shadow_start,
 				const void *shadow_end);
 
-#ifndef kasan_mem_to_shadow
-static inline void *kasan_mem_to_shadow(const void *addr)
-{
-	void *scaled;
-
-	if (IS_ENABLED(CONFIG_KASAN_GENERIC))
-		scaled = (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT);
-	else
-		scaled = (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIFT);
-
-	return KASAN_SHADOW_OFFSET + scaled;
-}
-#endif
-
 int kasan_add_zero_shadow(void *start, unsigned long size);
 void kasan_remove_zero_shadow(void *start, unsigned long size);
 
diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
index b88543e5c0cc..3a460abd4c18 100644
--- a/mm/kasan/Makefile
+++ b/mm/kasan/Makefile
@@ -5,6 +5,7 @@ KCOV_INSTRUMENT := n
 
 # Disable ftrace to avoid recursion.
 CFLAGS_REMOVE_common.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_dense.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_generic.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_init.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_quarantine.o = $(CC_FLAGS_FTRACE)
@@ -24,6 +25,7 @@ CC_FLAGS_KASAN_RUNTIME += -fno-stack-protector
 CC_FLAGS_KASAN_RUNTIME += -DDISABLE_BRANCH_PROFILING
 
 CFLAGS_common.o := $(CC_FLAGS_KASAN_RUNTIME)
+CFLAGS_dense.o := $(CC_FLAGS_KASAN_RUNTIME)
 CFLAGS_generic.o := $(CC_FLAGS_KASAN_RUNTIME)
 CFLAGS_init.o := $(CC_FLAGS_KASAN_RUNTIME)
 CFLAGS_quarantine.o := $(CC_FLAGS_KASAN_RUNTIME)
@@ -49,6 +51,7 @@ RUSTFLAGS_kasan_test_rust.o := $(RUSTFLAGS_KASAN)
 CFLAGS_kasan_test_module.o := $(CFLAGS_KASAN_TEST)
 
 obj-y := common.o report.o
+obj-$(CONFIG_KASAN_SW_TAGS_DENSE) += dense.o
 obj-$(CONFIG_KASAN_GENERIC) += init.o generic.o report_generic.o shadow.o quarantine.o
 obj-$(CONFIG_KASAN_HW_TAGS) += hw_tags.o report_hw_tags.o tags.o report_tags.o
 obj-$(CONFIG_KASAN_SW_TAGS) += init.o report_sw_tags.o shadow.o sw_tags.o tags.o report_tags.o
diff --git a/mm/kasan/dense.c b/mm/kasan/dense.c
new file mode 100644
index 000000000000..306bbbfdce29
--- /dev/null
+++ b/mm/kasan/dense.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "kasan.h"
+
+static __always_inline bool kasan_check_range_inline(const void *addr,
+						     size_t size, bool write,
+						     unsigned long ret_ip)
+{
+	u8 *shadow_first, *shadow_last, *shadow, *shadow_first_aligned, *shadow_last_aligned;
+	u64 addr_start_aligned, addr_end_aligned;
+	u8 tag, kasan_granule_offset;
+	size_t aligned_size;
+	void *untagged_addr;
+
+	if (unlikely(size == 0))
+		return true;
+
+	if (unlikely(addr + size < addr))
+		return !kasan_report(addr, size, write, ret_ip);
+
+	tag = get_tag((const void *)addr);
+
+	/*
+	 * Ignore accesses for pointers tagged with native kernel
+	 * pointer tag to suppress false positives caused by kmap.
+	 *
+	 * Some kernel code was written to account for archs that don't keep
+	 * high memory mapped all the time, but rather map and unmap particular
+	 * pages when needed. Instead of storing a pointer to the kernel memory,
+	 * this code saves the address of the page structure and offset within
+	 * that page for later use. Those pages are then mapped and unmapped
+	 * with kmap/kunmap when necessary and virt_to_page is used to get the
+	 * virtual address of the page. For arm64 (that keeps the high memory
+	 * mapped all the time), kmap is turned into a page_address call.
+
+	 * The issue is that with use of the page_address + virt_to_page
+	 * sequence the top byte value of the original pointer gets lost (gets
+	 * set to KASAN_TAG_KERNEL).
+	 */
+	if (tag == KASAN_TAG_KERNEL)
+		return true;
+
+	untagged_addr = kasan_reset_tag((void *)round_down((u64)addr, KASAN_GRANULE_SIZE));
+	if (unlikely(!addr_has_metadata(untagged_addr)))
+		return !kasan_report(addr, size, write, ret_ip);
+
+	kasan_granule_offset = ((u64)addr & KASAN_GRANULE_MASK);
+	aligned_size = round_up(size + kasan_granule_offset, KASAN_GRANULE_SIZE);
+	shadow_first = kasan_mem_to_shadow(untagged_addr);
+	shadow_last = kasan_mem_to_shadow(untagged_addr + aligned_size);
+	addr_start_aligned = round_up((u64)untagged_addr, KASAN_SHADOW_SCALE_SIZE);
+	addr_end_aligned = round_down((u64)untagged_addr + aligned_size, KASAN_SHADOW_SCALE_SIZE);
+	shadow_first_aligned = kasan_mem_to_shadow((void *)addr_start_aligned);
+	shadow_last_aligned = kasan_mem_to_shadow((void *)addr_end_aligned);
+
+	/* Check the first unaligned tag in shadow memory. */
+	if ((u64)untagged_addr % KASAN_SHADOW_SCALE_SIZE) {
+		if (unlikely((*shadow_first >> KASAN_TAG_WIDTH) != tag))
+			return !kasan_report(addr, size, write, ret_ip);
+	}
+
+	/* Check the middle aligned part in shadow memory. */
+	for (shadow = shadow_first_aligned; shadow < shadow_last_aligned; shadow++) {
+		if (unlikely(*shadow != ((tag << KASAN_TAG_WIDTH) | tag)))
+			return !kasan_report(addr, size, write, ret_ip);
+	}
+
+	/* Check the last unaligned tag in shadow memory. */
+	if (((u64)untagged_addr + aligned_size) % KASAN_SHADOW_SCALE_SIZE) {
+		if (unlikely((*shadow_last & KASAN_TAG_MASK) != tag))
+			return !kasan_report(addr, size, write, ret_ip);
+	}
+
+	return true;
+}
+
+#if IS_ENABLED(CONFIG_KASAN_SW_TAGS_DENSE)
+bool kasan_check_range(const void *addr, size_t size, bool write,
+		       unsigned long ret_ip)
+{
+	return kasan_check_range_inline(addr, size, write, ret_ip);
+}
+#endif
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 0e04c5e2c405..d29bd0e65020 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -183,7 +183,7 @@ static inline bool kasan_requires_meta(void)
 #define META_BYTES_PER_BLOCK 1
 #define META_BLOCKS_PER_ROW 16
 #define META_BYTES_PER_ROW (META_BLOCKS_PER_ROW * META_BYTES_PER_BLOCK)
-#define META_MEM_BYTES_PER_ROW (META_BYTES_PER_ROW * KASAN_GRANULE_SIZE)
+#define META_MEM_BYTES_PER_ROW (META_BYTES_PER_ROW * KASAN_SHADOW_SCALE_SIZE)
 #define META_ROWS_AROUND_ADDR 2
 
 #define KASAN_STACK_DEPTH 64
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index c08097715686..ee9e406b0cdb 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -436,7 +436,7 @@ static int meta_pointer_offset(const void *row, const void *addr)
 	 *    plus 1 byte for space.
 	 */
 	return 3 + (BITS_PER_LONG / 8) * 2 +
-		(addr - row) / KASAN_GRANULE_SIZE * 3 + 1;
+		(addr - row) / KASAN_SHADOW_SCALE_SIZE * 3 + 1;
 }
 
 static void print_memory_metadata(const void *addr)
diff --git a/mm/kasan/report_sw_tags.c b/mm/kasan/report_sw_tags.c
index 689e94f9fe3c..1ac5c7a9011d 100644
--- a/mm/kasan/report_sw_tags.c
+++ b/mm/kasan/report_sw_tags.c
@@ -39,7 +39,7 @@ const void *kasan_find_first_bad_addr(const void *addr, size_t size)
 	if (!addr_has_metadata(p))
 		return p;
 
-	while (p < end && tag == *(u8 *)kasan_mem_to_shadow(p))
+	while (p < end && tag == kasan_get_shadow_tag(p))
 		p += KASAN_GRANULE_SIZE;
 
 	return p;
@@ -48,7 +48,6 @@ const void *kasan_find_first_bad_addr(const void *addr, size_t size)
 size_t kasan_get_alloc_size(void *object, struct kmem_cache *cache)
 {
 	size_t size = 0;
-	u8 *shadow;
 
 	/*
 	 * Skip the addr_has_metadata check, as this function only operates on
@@ -59,13 +58,11 @@ size_t kasan_get_alloc_size(void *object, struct kmem_cache *cache)
 	 * The loop below returns 0 for freed objects, for which KASAN cannot
 	 * calculate the allocation size based on the metadata.
 	 */
-	shadow = (u8 *)kasan_mem_to_shadow(object);
 	while (size < cache->object_size) {
-		if (*shadow != KASAN_TAG_INVALID)
+		if (kasan_get_shadow_tag(object + size) != KASAN_TAG_INVALID)
 			size += KASAN_GRANULE_SIZE;
 		else
 			return size;
-		shadow++;
 	}
 
 	return cache->object_size;
@@ -78,9 +75,8 @@ void kasan_metadata_fetch_row(char *buffer, void *row)
 
 void kasan_print_tags(u8 addr_tag, const void *addr)
 {
-	u8 *shadow = (u8 *)kasan_mem_to_shadow(addr);
-
-	pr_err("Pointer tag: [%02x], memory tag: [%02x]\n", addr_tag, *shadow);
+	pr_err("Pointer tag: [%02x], memory tag: [%02x]\n", addr_tag,
+	       kasan_get_shadow_tag(addr));
 }
 
 #ifdef CONFIG_KASAN_STACK
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index 32435d33583a..7a6b8ea9bf78 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -79,6 +79,7 @@ u8 __hwasan_generate_tag(void)
 }
 EXPORT_SYMBOL(__hwasan_generate_tag);
 
+#if !IS_ENABLED(CONFIG_KASAN_SW_TAGS_DENSE)
 bool kasan_check_range(const void *addr, size_t size, bool write,
 			unsigned long ret_ip)
 {
@@ -127,17 +128,24 @@ bool kasan_check_range(const void *addr, size_t size, bool write,
 
 	return true;
 }
+#endif
 
 bool kasan_byte_accessible(const void *addr)
 {
 	u8 tag = get_tag(addr);
 	void *untagged_addr = kasan_reset_tag(addr);
 	u8 shadow_byte;
+	int shift;
 
 	if (!addr_has_metadata(untagged_addr))
 		return false;
 
 	shadow_byte = READ_ONCE(*(u8 *)kasan_mem_to_shadow(untagged_addr));
+	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS_DENSE)) {
+		shift = !!((u64)addr & BIT(KASAN_TAG_WIDTH)) * KASAN_TAG_WIDTH;
+		shadow_byte = (shadow_byte >> shift) & KASAN_TAG_KERNEL;
+	}
+
 	return tag == KASAN_TAG_KERNEL || tag == shadow_byte;
 }
 
-- 
2.47.1

