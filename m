Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com [207.171.188.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4B24E4B1;
	Thu,  3 Apr 2025 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743695423; cv=none; b=f29Sp2nHmIGv5nDNhFe3jUu/F0Wb8LdyI1d+oPw0LoP0BgtyLvmG91rsqSl3sy9f8pD2QfY9Wv88AgH4VDGl78Pwn1oOGe2J3Ndg897ApfwmI/jhKOc7Bakjspp6T0FwlmtssTTScj9z/NW8QDhp2SJYmiLXcIdFy/P1IzRuUEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743695423; c=relaxed/simple;
	bh=sK+vNoIaDrOOFQJ5YOOB49Psgi0K4ClVy9ZJc83Ts/g=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d9iCeIdjGSUkb2IvTbXgimHg08RdGw1R956Ww+u2hTs0rhD5KmDO3o9SPJiEwLmv3SKlLL42EnxvvpYuwydzIPWGLWCaj/7HJid4TfmKvFUfvVKrOz0mQyBsDIo/j2Ylzns1znTLucegka/2IdaweBkVipfScPSa7wVedQn7Q3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=NABWvBIr; arc=none smtp.client-ip=207.171.188.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="NABWvBIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1743695420; x=1775231420;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=qcMW5YU6Ov/npYgSuZB97Gp5gouJCI42HOQPuo027Pk=;
  b=NABWvBIr/FfrkS8gAuGtwSI7bUGqdUbEsvzQVcjL7TgLMuRXKbksVy1/
   YNPixZNux6kv+lX+2hGq9yvtHLrfwC57kSFimCqsVxy/A9q9NdGleoA1d
   YKxxhn9M3KLeC/XAtCeTEJ6BVIUIE6sUGRnf3XF2sm8NMni+hwmwe9X/G
   g=;
X-IronPort-AV: E=Sophos;i="6.15,184,1739836800"; 
   d="scan'208";a="7305493"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9105.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 15:50:11 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.17.79:58793]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.0.201:2525] with esmtp (Farcaster)
 id 695a9014-428d-4134-ad0e-8fc30892e84e; Thu, 3 Apr 2025 15:50:10 +0000 (UTC)
X-Farcaster-Flow-ID: 695a9014-428d-4134-ad0e-8fc30892e84e
Received: from EX19D014EUA004.ant.amazon.com (10.252.50.41) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 3 Apr 2025 15:50:06 +0000
Received: from EX19MTAUEA002.ant.amazon.com (10.252.134.9) by
 EX19D014EUA004.ant.amazon.com (10.252.50.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 3 Apr 2025 15:50:05 +0000
Received: from email-imr-corp-prod-iad-all-1a-f1af3bd3.us-east-1.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 15:50:05 +0000
Received: from dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com [172.19.91.144])
	by email-imr-corp-prod-iad-all-1a-f1af3bd3.us-east-1.amazon.com (Postfix) with ESMTP id 2C2D740633;
	Thu,  3 Apr 2025 15:50:05 +0000 (UTC)
Received: by dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id DC9874F88; Thu,  3 Apr 2025 15:50:04 +0000 (UTC)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Changyuan Lyu <changyuanl@google.com>
CC: <linux-kernel@vger.kernel.org>, <graf@amazon.com>,
	<akpm@linux-foundation.org>, <luto@kernel.org>, <anthony.yznaga@oracle.com>,
	<arnd@arndb.de>, <ashish.kalra@amd.com>, <benh@kernel.crashing.org>,
	<bp@alien8.de>, <catalin.marinas@arm.com>, <dave.hansen@linux.intel.com>,
	<dwmw2@infradead.org>, <ebiederm@xmission.com>, <mingo@redhat.com>,
	<jgowans@amazon.com>, <corbet@lwn.net>, <krzk@kernel.org>, <rppt@kernel.org>,
	<mark.rutland@arm.com>, <pbonzini@redhat.com>, <pasha.tatashin@soleen.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <robh+dt@kernel.org>,
	<robh@kernel.org>, <saravanak@google.com>,
	<skinsburskii@linux.microsoft.com>, <rostedt@goodmis.org>,
	<tglx@linutronix.de>, <thomas.lendacky@amd.com>, <usama.arif@bytedance.com>,
	<will@kernel.org>, <devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
In-Reply-To: <20250320015551.2157511-10-changyuanl@google.com>
References: <20250320015551.2157511-1-changyuanl@google.com>
	<20250320015551.2157511-10-changyuanl@google.com>
Date: Thu, 3 Apr 2025 15:50:04 +0000
Message-ID: <mafs01pu9qm6r.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi all,

The below patch implements the table based memory preservation mechanism
I suggested. It is a replacement of this patch. Instead of using an
xarray of bitmaps and converting them into a linked list of bitmaps at
serialization time, it tracks preserved pages in a page table like
format, that needs no extra work when serializing. This results in
noticeably better performance when preserving a large number of pages.

To compare performance, I allocated 48 GiB of memory and preserved it
using KHO. Below is the time taken to make the reservations, and then
serialize that to FDT.

    Linked list:  577ms +- 0.7% (6 samples)
    Table:        469ms +- 0.6% (6 samples)

From this, we can see that the table is almost 19% faster.

This test was done with only one thread, but since it is possible to
make reservations in parallel, the performance would increase even more
-- especially since the linked list serialization cannot be parallelized
easily.

In terms of memory usage, I could not collect reliable data, but I don't
think there should be significant difference between either approach
since the bitmaps are the same density, and only difference would be
extra metadata (chunks vs upper level tables).

Memory usage for tables can be further optimized if needed by collapsing
full tables. That is, if all bits in a L1 table are set, we can just not
allocate a page for it, and instead set a flag in the L2 descriptor.

The patch currently has a limitation where it does not free any of the
empty tables after a unpreserve operation. But Changyuan's patch also
doesn't do it so at least it is not any worse off.

In terms of code size, I believe both are roughly the same. This patch
is 609 lines compared Changyuan's 522, many of which come from the
longer comment.

When working on this patch, I realized that kho_mem_deserialize() is
currently _very_ slow. It takes over 2 seconds to make memblock
reservations for 48 GiB of 0-order pages. I suppose this can later be
optimized by teaching memblock_free_all() to skip preserved pages
instead of making memblock reservations.

Regards,
Pratyush Yadav

---- 8< ----
From 40c1274052709e4d102cc9fe55fa94272f827283 Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 19 Mar 2025 18:55:44 -0700
Subject: [PATCH] kexec: enable KHO support for memory preservation

Introduce APIs allowing KHO users to preserve memory across kexec and
get access to that memory after boot of the kexeced kernel

kho_preserve_folio() - record a folio to be preserved over kexec
kho_restore_folio() - recreates the folio from the preserved memory
kho_preserve_phys() - record physically contiguous range to be
preserved over kexec.
kho_restore_phys() - recreates order-0 pages corresponding to the
preserved physical range

The memory preservations are tracked by using 4 levels of tables,
similar to page tables, except at the lowest level, a bitmap is present
instead of PTEs. Each page order has its own separate table. A set bit
in the bitmap represents a page of the table's order. The tables are
named simply by their level, with the highest being level 4 (L4), the
next being level 3 (L3) and so on.

Assuming 0-order 4K pages, a L1 table will have a total of 4096 * 8 ==
23768 bits. This maps to 128 MiB of memory. L2 and above tables will
consist of pointers to lower level tables, so each level will have 4096
/ 8 == 512 pointers. This means Each level 2 table maps to 64 GiB of
memory, each level 3 table maps to 32 TiB of memory, and each level 4
table maps to 16 PiB of memory. More information on the table format can
be found in the comment in the patch.

At serialization time, all that needs to be done is to record the
top-level table descriptors for each order. The next kernel can use
those to find the tables, walk the them, reserve the memory ranges, and
later when a user requests a folio or a physical range, KHO restores
corresponding memory map entries.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
[ptyadav@amazon.de: table based preserved page tracking]
Co-developed-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
---
 include/linux/kexec_handover.h |  38 +++
 kernel/kexec_handover.c        | 573 ++++++++++++++++++++++++++++++++-
 2 files changed, 609 insertions(+), 2 deletions(-)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index c665ff6cd728a..d52a7b500f4ce 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 #include <linux/hashtable.h>
 #include <linux/notifier.h>
+#include <linux/mm_types.h>
 
 struct kho_scratch {
 	phys_addr_t addr;
@@ -54,6 +55,13 @@ int kho_add_string_prop(struct kho_node *node, const char *key,
 int register_kho_notifier(struct notifier_block *nb);
 int unregister_kho_notifier(struct notifier_block *nb);
 
+int kho_preserve_folio(struct folio *folio);
+int kho_unpreserve_folio(struct folio *folio);
+int kho_preserve_phys(phys_addr_t phys, size_t size);
+int kho_unpreserve_phys(phys_addr_t phys, size_t size);
+struct folio *kho_restore_folio(phys_addr_t phys);
+void *kho_restore_phys(phys_addr_t phys, size_t size);
+
 void kho_memory_init(void);
 
 void kho_populate(phys_addr_t handover_fdt_phys, phys_addr_t scratch_phys,
@@ -118,6 +126,36 @@ static inline int unregister_kho_notifier(struct notifier_block *nb)
 	return -EOPNOTSUPP;
 }
 
+static inline int kho_preserve_folio(struct folio *folio)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int kho_unpreserve_folio(struct folio *folio)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int kho_preserve_phys(phys_addr_t phys, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int kho_unpreserve_phys(phys_addr_t phys, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct folio *kho_restore_folio(phys_addr_t phys)
+{
+	return NULL;
+}
+
+static inline void *kho_restore_phys(phys_addr_t phys, size_t size)
+{
+	return NULL;
+}
+
 static inline void kho_memory_init(void)
 {
 }
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 6ebad2f023f95..16f10bd06de0a 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -3,6 +3,7 @@
  * kexec_handover.c - kexec handover metadata processing
  * Copyright (C) 2023 Alexander Graf <graf@amazon.com>
  * Copyright (C) 2025 Microsoft Corporation, Mike Rapoport <rppt@kernel.org>
+ * Copyright (C) 2025 Amazon.com Inc. or its affiliates, Pratyush Yadav <ptyadav@amazon.de>
  * Copyright (C) 2024 Google LLC
  */
 
@@ -62,6 +63,10 @@ struct kho_out {
 	struct rw_semaphore tree_lock;
 	struct kho_node root;
 
+	/* Array containing the L4 table descriptors for each order. */
+	unsigned long mem_tables[NR_PAGE_ORDERS];
+	struct kho_node preserved_memory;
+
 	void *fdt;
 	u64 fdt_max;
 };
@@ -70,6 +75,7 @@ static struct kho_out kho_out = {
 	.chain_head = BLOCKING_NOTIFIER_INIT(kho_out.chain_head),
 	.tree_lock = __RWSEM_INITIALIZER(kho_out.tree_lock),
 	.root = KHO_NODE_INIT,
+	.preserved_memory = KHO_NODE_INIT,
 	.fdt_max = 10 * SZ_1M,
 };
 
@@ -237,6 +243,559 @@ int kho_node_check_compatible(const struct kho_in_node *node,
 }
 EXPORT_SYMBOL_GPL(kho_node_check_compatible);
 
+/*
+ * Keep track of memory that is to be preserved across KHO.
+ *
+ * The memory is tracked by using 4 levels of tables, similar to page tables,
+ * except at the lowest level, a bitmap is present instead of PTEs. Each page
+ * order has its own separate table. A set bit in the bitmap represents a page
+ * of the table's order. The tables are named simply by their level, with the
+ * highest being level 4 (L4), the next being level 3 (L3) and so on.
+ *
+ * The table hierarchy can be seen with the below diagram.
+ *
+ * +----+
+ * | L4 |
+ * +----+
+ *    |
+ *    |   +----+
+ *    +-->| L3 |
+ *        +----+
+ *           |
+ *           |   +----+
+ *           +-->| L2 |
+ *               +----+
+ *                  |
+ *                  |   +----+
+ *                  +-->| L1 |
+ *                      +----+
+ *
+ * Assuming 0-order 4K pages, a L1 table will have a total of 4096 * 8 == 23768
+ * bits. This maps to 128 MiB of memory. L2 and above tables will consist of
+ * pointers to lower level tables, so each level will have 4096 / 8 == 512
+ * pointers. This means Each level 2 table maps to 64 GiB of memory, each level
+ * 3 table maps to 32 TiB of memory, and each level 4 table maps to 16 PiB of
+ * memory.
+ *
+ * The below diagram shows how the address is split into the different levels
+ * for 0-order 4K pages:
+ *
+ *    63:54     53:45    44:36     35:27       26:12        11:0
+ * +----------+--------+--------+--------+--------------+-----------+
+ * | Ignored  |   L4   |   L3   |   L2   |      L1      | Page off  |
+ * +----------+--------+--------+--------+--------------+-----------+
+ *
+ * For higher order pages, the bits for each level get shifted left by the
+ * order.
+ *
+ * Each table except L1 contains a descriptor for the next level table. For 4K
+ * pages, the below diagram shows the format of the descriptor:
+ *
+ *                           63:12                          11:0
+ * +----------+--------+--------+--------+--------------+-----------+
+ * |             Pointer to next level table            | Reserved  |
+ * +----------+--------+--------+--------+--------------+-----------+
+ *
+ * The reserved bits must be zero, but can be used for flags in later versions.
+ */
+
+typedef unsigned long khomem_desc_t;
+typedef int (*khomem_walk_fn_t)(unsigned long phys, unsigned int order, void *arg);
+
+#define PTRS_PER_LEVEL		(PAGE_SIZE / sizeof(unsigned long))
+#define KHOMEM_L1_BITS		(PAGE_SIZE * BITS_PER_BYTE)
+#define KHOMEM_L1_MASK		((1 << ilog2(KHOMEM_L1_BITS)) - 1)
+#define KHOMEM_L1_SHIFT		(PAGE_SHIFT)
+#define KHOMEM_L2_SHIFT		(KHOMEM_L1_SHIFT + ilog2(KHOMEM_L1_BITS))
+#define KHOMEM_L3_SHIFT		(KHOMEM_L2_SHIFT + ilog2(PTRS_PER_LEVEL))
+#define KHOMEM_L4_SHIFT		(KHOMEM_L3_SHIFT + ilog2(PTRS_PER_LEVEL))
+#define KHOMEM_PFN_MASK		PAGE_MASK
+
+static unsigned int khomem_level_shifts[] = {
+	[1] = KHOMEM_L1_SHIFT,
+	[2] = KHOMEM_L2_SHIFT,
+	[3] = KHOMEM_L3_SHIFT,
+	[4] = KHOMEM_L4_SHIFT,
+};
+
+static inline unsigned long khomem_table_index(unsigned long address,
+					       unsigned int level,
+					       unsigned int order)
+{
+	unsigned long mask = level == 1 ? KHOMEM_L1_MASK : (PTRS_PER_LEVEL - 1);
+	/* Avoid undefined behaviour in case shift is too big. */
+	int shift = min_t(int, khomem_level_shifts[level] + order, BITS_PER_LONG);
+
+	return (address >> shift) & mask;
+}
+
+static inline khomem_desc_t *khomem_table(khomem_desc_t desc)
+{
+	return __va(desc & KHOMEM_PFN_MASK);
+}
+
+static inline khomem_desc_t *khomem_table_offset(khomem_desc_t *table,
+						 unsigned long address,
+						 unsigned int level,
+						 unsigned int order)
+{
+	return khomem_table(*table) + khomem_table_index(address, level, order);
+}
+
+static inline bool khomem_desc_none(khomem_desc_t desc)
+{
+	return !(desc & KHOMEM_PFN_MASK);
+}
+
+static inline void khomem_bitmap_preserve(khomem_desc_t *desc,
+					  unsigned long address,
+					  unsigned int order)
+{
+	/* set_bit() is atomic, so no need for locking. */
+	set_bit(khomem_table_index(address, 1, order), khomem_table(*desc));
+}
+
+static inline void khomem_bitmap_unpreserve(khomem_desc_t *desc,
+					    unsigned long address,
+					    unsigned int order)
+{
+	/* clear_bit() is atomic, so no need for locking. */
+	clear_bit(khomem_table_index(address, 1, order), khomem_table(*desc));
+}
+
+static inline khomem_desc_t khomem_mkdesc(void *table)
+{
+	return virt_to_phys(table) & KHOMEM_PFN_MASK;
+}
+
+static int __khomem_table_alloc(khomem_desc_t *desc)
+{
+	if (khomem_desc_none(*desc)) {
+		khomem_desc_t *table, val;
+
+		table = (khomem_desc_t *)get_zeroed_page(GFP_KERNEL);
+		if (!table)
+			return -ENOMEM;
+
+		val = khomem_mkdesc(table);
+		if (cmpxchg(desc, 0, val))
+			/* Someone else already allocated it. */
+			free_page((unsigned long)table);
+	}
+
+	return 0;
+}
+
+static khomem_desc_t *khomem_table_alloc(khomem_desc_t *desc,
+					 unsigned long address,
+					 unsigned int level,
+					 unsigned int order)
+{
+	if (__khomem_table_alloc(desc))
+		return NULL;
+
+	return khomem_table_offset(desc, address, level, order);
+}
+
+static int khomem_preserve(khomem_desc_t *l4, unsigned long pfn,
+			   unsigned int order)
+{
+	unsigned long address = PFN_PHYS(pfn);
+	khomem_desc_t *l4p, *l3p, *l2p;
+	int ret;
+
+	l4p = khomem_table_alloc(l4, address, 4, order);
+	if (!l4p)
+		return -ENOMEM;
+
+	l3p = khomem_table_alloc(l4p, address, 3, order);
+	if (!l3p)
+		return -ENOMEM;
+
+	l2p = khomem_table_alloc(l3p, address, 2, order);
+	if (!l2p)
+		return -ENOMEM;
+
+	/*
+	 * L1 table is handled different since it is a bitmap not a table of
+	 * descriptors. So offsetting into it directly does not work.
+	 */
+	ret = __khomem_table_alloc(l2p);
+	if (ret)
+		return ret;
+
+	khomem_bitmap_preserve(l2p, address, order);
+	return 0;
+}
+
+/* TODO: Clean up empty tables eventually. */
+static void khomem_unpreserve(khomem_desc_t *l4, unsigned long pfn,
+			      unsigned int order)
+{
+	unsigned long address = PFN_PHYS(pfn);
+	khomem_desc_t *l4p, *l3p, *l2p;
+
+	if (khomem_desc_none(*l4))
+		return;
+
+	l4p = khomem_table_offset(l4, address, 4, order);
+	if (khomem_desc_none(*l4p))
+		return;
+
+	l3p = khomem_table_offset(l4p, address, 3, order);
+	if (khomem_desc_none(*l3p))
+		return;
+
+	l2p = khomem_table_offset(l3p, address, 2, order);
+	if (khomem_desc_none(*l2p))
+		return;
+
+	khomem_bitmap_unpreserve(l2p, address, order);
+}
+
+static int khomem_walk_l1(unsigned long *table, unsigned long addr,
+			  unsigned int order, khomem_walk_fn_t fn, void *arg)
+{
+	int ret, i;
+
+	for_each_set_bit(i, table, KHOMEM_L1_BITS) {
+		ret = fn(addr + (i * PAGE_SIZE), order, arg);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int __khomem_walk_table(khomem_desc_t *base, unsigned int level,
+			       unsigned long addr, unsigned int order,
+			       khomem_walk_fn_t fn, void *arg)
+{
+	unsigned long block = (1UL << (khomem_level_shifts[level] + order));
+	khomem_desc_t *cur;
+	int ret;
+
+	if (level == 1)
+		return khomem_walk_l1(base, addr, order, fn, arg);
+
+	for (cur = base; cur < base + PTRS_PER_LEVEL; cur++, addr += block) {
+		if (!khomem_desc_none(*cur)) {
+			ret = __khomem_walk_table(khomem_table(*cur), level - 1,
+						  addr, order, fn, arg);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int khomem_walk_preserved(khomem_desc_t *l4, unsigned int order,
+				 khomem_walk_fn_t fn, void *arg)
+{
+	if (khomem_desc_none(*l4))
+		return 0;
+
+	return __khomem_walk_table(khomem_table(*l4), 4, 0, order, fn, arg);
+}
+
+struct kho_mem_track {
+	/* Points to L4 KHOMEM descriptor, each order gets its own table. */
+	struct xarray orders;
+};
+
+static struct kho_mem_track kho_mem_track;
+
+static void *xa_load_or_alloc(struct xarray *xa, unsigned long index, size_t sz)
+{
+	void *elm, *res;
+
+	elm = xa_load(xa, index);
+	if (elm)
+		return elm;
+
+	elm = kzalloc(sz, GFP_KERNEL);
+	if (!elm)
+		return ERR_PTR(-ENOMEM);
+
+	res = xa_cmpxchg(xa, index, NULL, elm, GFP_KERNEL);
+	if (xa_is_err(res))
+		res = ERR_PTR(xa_err(res));
+
+	if (res) {
+		kfree(elm);
+		return res;
+	}
+
+	return elm;
+}
+
+static void __kho_unpreserve(struct kho_mem_track *tracker, unsigned long pfn,
+			     unsigned int order)
+{
+	khomem_desc_t *l4;
+
+	l4 = xa_load(&tracker->orders, order);
+	if (!l4)
+		return;
+
+	khomem_unpreserve(l4, pfn, order);
+}
+
+static int __kho_preserve(struct kho_mem_track *tracker, unsigned long pfn,
+			  unsigned int order)
+{
+	khomem_desc_t *l4;
+
+	might_sleep();
+
+	l4 = xa_load_or_alloc(&tracker->orders, order, sizeof(*l4));
+	if (IS_ERR(l4))
+		return PTR_ERR(l4);
+
+	khomem_preserve(l4, pfn, order);
+
+	return 0;
+}
+
+/**
+ * kho_preserve_folio - preserve a folio across KHO.
+ * @folio: folio to preserve
+ *
+ * Records that the entire folio is preserved across KHO. The order
+ * will be preserved as well.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_preserve_folio(struct folio *folio)
+{
+	unsigned long pfn = folio_pfn(folio);
+	unsigned int order = folio_order(folio);
+	int err;
+
+	if (!kho_enable)
+		return -EOPNOTSUPP;
+
+	down_read(&kho_out.tree_lock);
+	if (kho_out.fdt) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	err = __kho_preserve(&kho_mem_track, pfn, order);
+
+unlock:
+	up_read(&kho_out.tree_lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_preserve_folio);
+
+/**
+ * kho_unpreserve_folio - unpreserve a folio
+ * @folio: folio to unpreserve
+ *
+ * Remove the record of a folio previously preserved by kho_preserve_folio().
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_unpreserve_folio(struct folio *folio)
+{
+	unsigned long pfn = folio_pfn(folio);
+	unsigned int order = folio_order(folio);
+	int err = 0;
+
+	down_read(&kho_out.tree_lock);
+	if (kho_out.fdt) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	__kho_unpreserve(&kho_mem_track, pfn, order);
+
+unlock:
+	up_read(&kho_out.tree_lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_unpreserve_folio);
+
+/**
+ * kho_preserve_phys - preserve a physically contiguous range across KHO.
+ * @phys: physical address of the range
+ * @size: size of the range
+ *
+ * Records that the entire range from @phys to @phys + @size is preserved
+ * across KHO.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_preserve_phys(phys_addr_t phys, size_t size)
+{
+	unsigned long pfn = PHYS_PFN(phys), end_pfn = PHYS_PFN(phys + size);
+	unsigned int order = ilog2(end_pfn - pfn);
+	unsigned long failed_pfn;
+	int err = 0;
+
+	if (!kho_enable)
+		return -EOPNOTSUPP;
+
+	down_read(&kho_out.tree_lock);
+	if (kho_out.fdt) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	for (; pfn < end_pfn;
+	     pfn += (1 << order), order = ilog2(end_pfn - pfn)) {
+		err = __kho_preserve(&kho_mem_track, pfn, order);
+		if (err) {
+			failed_pfn = pfn;
+			break;
+		}
+	}
+
+	if (err)
+		for (pfn = PHYS_PFN(phys); pfn < failed_pfn;
+		     pfn += (1 << order), order = ilog2(end_pfn - pfn))
+			__kho_unpreserve(&kho_mem_track, pfn, order);
+
+unlock:
+	up_read(&kho_out.tree_lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_preserve_phys);
+
+/**
+ * kho_unpreserve_phys - unpreserve a physically contiguous range
+ * @phys: physical address of the range
+ * @size: size of the range
+ *
+ * Remove the record of a range previously preserved by kho_preserve_phys().
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_unpreserve_phys(phys_addr_t phys, size_t size)
+{
+	unsigned long pfn = PHYS_PFN(phys), end_pfn = PHYS_PFN(phys + size);
+	unsigned int order = ilog2(end_pfn - pfn);
+	int err = 0;
+
+	down_read(&kho_out.tree_lock);
+	if (kho_out.fdt) {
+		err = -EBUSY;
+		goto unlock;
+	}
+
+	for (; pfn < end_pfn; pfn += (1 << order), order = ilog2(end_pfn - pfn))
+		__kho_unpreserve(&kho_mem_track, pfn, order);
+
+unlock:
+	up_read(&kho_out.tree_lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_unpreserve_phys);
+
+/* almost as free_reserved_page(), just don't free the page */
+static void kho_restore_page(struct page *page)
+{
+	ClearPageReserved(page);
+	init_page_count(page);
+	adjust_managed_page_count(page, 1);
+}
+
+struct folio *kho_restore_folio(phys_addr_t phys)
+{
+	struct page *page = pfn_to_online_page(PHYS_PFN(phys));
+	unsigned long order = page->private;
+
+	if (!page)
+		return NULL;
+
+	order = page->private;
+	if (order)
+		prep_compound_page(page, order);
+	else
+		kho_restore_page(page);
+
+	return page_folio(page);
+}
+EXPORT_SYMBOL_GPL(kho_restore_folio);
+
+void *kho_restore_phys(phys_addr_t phys, size_t size)
+{
+	unsigned long start_pfn, end_pfn, pfn;
+	void *va = __va(phys);
+
+	start_pfn = PFN_DOWN(phys);
+	end_pfn = PFN_UP(phys + size);
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+		struct page *page = pfn_to_online_page(pfn);
+
+		if (!page)
+			return NULL;
+		kho_restore_page(page);
+	}
+
+	return va;
+}
+EXPORT_SYMBOL_GPL(kho_restore_phys);
+
+static void kho_mem_serialize(void)
+{
+	struct kho_mem_track *tracker = &kho_mem_track;
+	khomem_desc_t *desc;
+	unsigned long order;
+
+	xa_for_each(&tracker->orders, order, desc) {
+		if (WARN_ON(order >= NR_PAGE_ORDERS))
+			break;
+		kho_out.mem_tables[order] = *desc;
+	}
+}
+
+static int kho_mem_deser_walk_fn(unsigned long phys, unsigned int order,
+				 void *arg)
+{
+	struct page *page = phys_to_page(phys);
+	unsigned long sz = 1UL << (PAGE_SHIFT + order);
+
+	memblock_reserve(phys, sz);
+	memblock_reserved_mark_noinit(phys, sz);
+	page->private = order;
+
+	return 0;
+}
+
+static void __init kho_mem_deserialize(void)
+{
+	struct kho_in_node preserved_mem;
+	const unsigned long *tables;
+	unsigned int nr_tables;
+	int err, order;
+	u32 len;
+
+	err = kho_get_node(NULL, "preserved-memory", &preserved_mem);
+	if (err) {
+		pr_err("no preserved-memory node: %d\n", err);
+		return;
+	}
+
+	tables = kho_get_prop(&preserved_mem, "metadata", &len);
+	if (!tables || len % sizeof(*tables)) {
+		pr_err("failed to get preserved memory table\n");
+		return;
+	}
+
+	nr_tables = min_t(unsigned int, len / sizeof(*tables), NR_PAGE_ORDERS);
+	for (order = 0; order < nr_tables; order++)
+		khomem_walk_preserved((khomem_desc_t *)&tables[order], order,
+				      kho_mem_deser_walk_fn, NULL);
+}
+
 /* Helper functions for KHO state tree */
 
 struct kho_prop {
@@ -542,6 +1101,8 @@ static int kho_unfreeze(void)
 	kho_out.fdt = NULL;
 	up_write(&kho_out.tree_lock);
 
+	memset(kho_out.mem_tables, 0, sizeof(kho_out.mem_tables));
+
 	if (fdt)
 		kvfree(fdt);
 
@@ -648,6 +1209,8 @@ static int kho_finalize(void)
 	kho_out.fdt = fdt;
 	up_write(&kho_out.tree_lock);
 
+	kho_mem_serialize();
+
 	err = kho_convert_tree(fdt, kho_out.fdt_max);
 
 unfreeze:
@@ -829,6 +1392,10 @@ static __init int kho_init(void)
 
 	kho_out.root.name = "";
 	err = kho_add_string_prop(&kho_out.root, "compatible", "kho-v1");
+	err |= kho_add_prop(&kho_out.preserved_memory, "metadata",
+			    kho_out.mem_tables, sizeof(kho_out.mem_tables));
+	err |= kho_add_node(&kho_out.root, "preserved-memory",
+			    &kho_out.preserved_memory);
 	if (err)
 		goto err_free_scratch;
 
@@ -1079,10 +1646,12 @@ static void __init kho_release_scratch(void)
 
 void __init kho_memory_init(void)
 {
-	if (!kho_get_fdt())
+	if (!kho_get_fdt()) {
 		kho_reserve_scratch();
-	else
+	} else {
+		kho_mem_deserialize();
 		kho_release_scratch();
+	}
 }
 
 void __init kho_populate(phys_addr_t handover_fdt_phys,
-- 
2.47.1
