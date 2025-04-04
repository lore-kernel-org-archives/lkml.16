Received: from mailrelay2-3.pub.mailoutpod3-cph3.one.com (mailrelay2-3.pub.mailoutpod3-cph3.one.com [46.30.212.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F280145B25
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743794980; cv=none; b=mhH1tczivplc9EmoygyxjyviCVflH1J7SbH8jZ1UHK7mohnO1qODyHkzXqs7KIfCHneYf1ntb8UeDF8kk5kx+977owuPZINGryNqAirKIxutXuxfroanDUF+ng82smINB7x6e0Kdpln/FBmbdaeNJ5USyqYh8VteVvdhrhHGWAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743794980; c=relaxed/simple;
	bh=yXq3ryc23odlSeUHAZxigj2EGO8/58KujX1KhxTIfEc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HssMoMARHglR+eW8sAiXZniMfz8kEN3IDr1UTi9zamTu0D2KPBFDzQMRn4lcmi7p3uHluvjCEBvQ2HE+Mx4VE9xgT2wXgOkd7ZYUf5k8Tn2U2W+QjfoYxaktCb1pVVm/jf97tPxRE/miJcgUdpNkOQu4ohTtu3IenSlPkEJuP4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=FL2BtSeV; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Jq4BxHjq; arc=none smtp.client-ip=46.30.212.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="FL2BtSeV";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Jq4BxHjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1743794905; x=1744399705;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=BQZzMTOgcpC8fCMsxs1H5Oo6ICbu3/t38Hu6uz4+Ag8=;
	b=FL2BtSeVpPXVAF865MwzRCPQTG2P+ScEzKpMmtiFvDybed0DuZDnEhsdgDDukT587gf3l0mq7vz+d
	 jg2T7m/j6hXP2UMUovcqlZSXRnDiMzeIeO7hgPz5QxHvWrpPNAfTIFXhY6RUFVjOTvF/Ab6K/ixin0
	 9FmiN+QKkew8zE7Q5dZz8sRf7D3om6iC/0NtVpuUbms/IToCwO+h+ZKzthgHhCx8Dmzo9aobtPQUch
	 SoPBTPl3fkmzNQgQtjx0wHIiL38dW4awL85t8xD6er25OxDFvHhbKJjg6e7WY4lpA83GGFyJdRvfpz
	 OaahGjpAVa8NkEuqoMTCnJY7LfsiKDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1743794905; x=1744399705;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=BQZzMTOgcpC8fCMsxs1H5Oo6ICbu3/t38Hu6uz4+Ag8=;
	b=Jq4BxHjqzbESIeeRPLNZvDelnor1gfxqhJeIlBUxPKq8W+bzRWFl/torzqyA85K9cn/Qw9C3H0g5g
	 I+wGA1sBQ==
X-HalOne-ID: f9b5e3c2-118a-11f0-b435-b37c246f863f
Received: from localhost.localdomain (host-90-233-218-222.mobileonline.telia.com [90.233.218.222])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id f9b5e3c2-118a-11f0-b435-b37c246f863f;
	Fri, 04 Apr 2025 19:28:24 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Igor Belousov <igor.b@beldev.am>
Subject: [PATCH v2] mm: add zblock allocator
Date: Fri,  4 Apr 2025 21:28:13 +0200
Message-Id: <20250404192813.925835-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zblock is a special purpose allocator for storing compressed pages.
It stores integer number of compressed objects per its block. These
blocks consist of several physical pages (2**n, i. e. 1/2/4/8).

With zblock, it is possible to densely arrange objects of various sizes
resulting in low internal fragmentation. Also this allocator tries to
fill incomplete blocks instead of adding new ones,  in many cases
providing a compression ratio substantially higher than z3fold and zbud
(though lower than zmalloc's).

zblock does not require MMU to operate and also is superior to zsmalloc
with regard to average performance and worst execution times, thus
allowing for better response time and real-time characteristics of the
whole system.

E. g. on a series of stress-ng tests run on a Raspberry Pi 5, we get
5-10% higher value for bogo ops/s in zblock/zsmalloc comparison.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
Signed-off-by: Igor Belousov <igor.b@beldev.am>
---
Changes since v1:
- adaptations to better handle 16K pages
- block table is dropped in favor of a linked list (the list entry on
  top of the list always has empty slots)
- rbtree is created at the initialization phase to speed up the search
  for an appropriate block type

Performance metrics:

1 Kernel build on a Raspberry Pi 5
Kernel build on a tmpfs with zblock/zsmalloc as zswap backend (LZ4
compression):

1.1 zblock

real    25m53.040s
user    96m43.424s
sys     4m56.652s

real    25m20.748s
user    94m24.324s
sys     4m58.005s

real    25m37.486s
user    95m35.913s
sys     4m55.892s

1.2 zsmalloc

real    26m17.934s
user    97m13.342s
sys     5m2.415s

real    25m50.694s
user    95m22.065s
sys     5m1.305s

real    25m57.714s
user    96m14.675s
sys     4m59.081s

Since zswap is used starting from minute 21, this gives 9% in average in
advantage for zblock.

2 stress-ng
Command: stress-ng --vm 4 --vm-bytes 8G --vm-keep --timeout 10m --metrics-brief
Results:
2.1 zblock

stress-ng: metrc: [421] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
stress-ng: metrc: [421]                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
stress-ng: metrc: [421] vm             29701982    601.32   1088.63    209.89     49394.38       22873.66

2.2 zsmalloc

stress-ng: metrc: [479] stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
stress-ng: metrc: [479]                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
stress-ng: metrc: [479] vm             29561584    600.59    916.38    895.74     49221.11       16313.22

Object file size comparison

1 ARM64
1.1 zblock: 10k
1.2 zsmalloc: 36K

2 RISC-V
1.1 zblock: 12k
1.2 zsmalloc: 77k

 Documentation/mm/zblock.rst |  24 +++
 MAINTAINERS                 |   7 +
 mm/Kconfig                  |   8 +
 mm/Makefile                 |   1 +
 mm/zblock.c                 | 418 ++++++++++++++++++++++++++++++++++++
 mm/zblock.h                 | 136 ++++++++++++
 6 files changed, 594 insertions(+)
 create mode 100644 Documentation/mm/zblock.rst
 create mode 100644 mm/zblock.c
 create mode 100644 mm/zblock.h

diff --git a/Documentation/mm/zblock.rst b/Documentation/mm/zblock.rst
new file mode 100644
index 000000000000..69e302d53255
--- /dev/null
+++ b/Documentation/mm/zblock.rst
@@ -0,0 +1,24 @@
+. SPDX-License-Identifier: GPL-2.0
+
+======
+zblock
+======
+
+zblock is a special purpose allocator for storing compressed pages.
+It stores integer number of compressed objects per its block. These
+blocks consist of several physical pages (2**n, i. e. 1/2/4/8).
+
+With zblock, it is possible to densely arrange objects of various sizes
+resulting in low internal fragmentation. Also this allocator tries to
+fill incomplete blocks instead of adding new ones,  in many cases
+providing a compression ratio substantially higher than z3fold and zbud
+(though lower than zmalloc's).
+
+zblock does not require MMU to operate and also is superior to zsmalloc
+with regard to average performance and worst execution times, thus
+allowing for better response time and real-time characteristics of the
+whole system.
+
+E. g. on a series of stress-ng tests run on a Raspberry Pi 5, we get
+5-10% higher value for bogo ops/s in zblock/zsmalloc comparison.
+
diff --git a/MAINTAINERS b/MAINTAINERS
index d5dfb9186962..19283e6a08eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26556,6 +26556,13 @@ F:	Documentation/networking/device_drivers/hamradio/z8530drv.rst
 F:	drivers/net/hamradio/*scc.c
 F:	drivers/net/hamradio/z8530.h
 
+ZBLOCK COMPRESSED SLAB MEMORY ALLOCATOR
+M:	Vitaly Wool <vitaly.wool@konsulko.se>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	Documentation/mm/zblock.rst
+F:	mm/zblock.[ch]
+
 ZBUD COMPRESSED PAGE ALLOCATOR
 M:	Seth Jennings <sjenning@redhat.com>
 M:	Dan Streetman <ddstreet@ieee.org>
diff --git a/mm/Kconfig b/mm/Kconfig
index 0b7f4bb5cb80..c3082809ad35 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -193,6 +193,14 @@ config Z3FOLD_DEPRECATED
 	  page. It is a ZBUD derivative so the simplicity and determinism are
 	  still there.
 
+config ZBLOCK
+	tristate "Fast compression allocator with high density"
+	depends on ZPOOL
+	help
+	  A special purpose allocator for storing compressed pages.
+	  It is designed to store same size compressed pages in blocks of
+	  physical pages.
+
 config Z3FOLD
 	tristate
 	default y if Z3FOLD_DEPRECATED=y
diff --git a/mm/Makefile b/mm/Makefile
index 850386a67b3e..2018455b7baa 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -116,6 +116,7 @@ obj-$(CONFIG_ZPOOL)	+= zpool.o
 obj-$(CONFIG_ZBUD)	+= zbud.o
 obj-$(CONFIG_ZSMALLOC)	+= zsmalloc.o
 obj-$(CONFIG_Z3FOLD)	+= z3fold.o
+obj-$(CONFIG_ZBLOCK)	+= zblock.o
 obj-$(CONFIG_GENERIC_EARLY_IOREMAP) += early_ioremap.o
 obj-$(CONFIG_CMA)	+= cma.o
 obj-$(CONFIG_NUMA) += numa.o
diff --git a/mm/zblock.c b/mm/zblock.c
new file mode 100644
index 000000000000..03e8180908e5
--- /dev/null
+++ b/mm/zblock.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * zblock.c
+ *
+ * Author: Vitaly Wool <vitaly.wool@konsulko.se>
+ * Based on the work from Ananda Badmaev <a.badmaev@clicknet.pro>
+ * Copyright (C) 2022-2025, Konsulko AB.
+ *
+ * Zblock is a small object allocator with the intention to serve as a
+ * zpool backend. It operates on page blocks which consist of number
+ * of physical pages being a power of 2 and store integer number of
+ * compressed pages per block which results in determinism and simplicity.
+ *
+ * zblock doesn't export any API and is meant to be used via zpool API.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/atomic.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/preempt.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/zpool.h>
+#include "zblock.h"
+
+static struct rb_root block_desc_tree = RB_ROOT;
+
+/* add a new block to the list */
+static inline void add_block(struct zblock_block *block,
+				struct block_list *block_list)
+{
+	list_add(&block->link, &block_list->list);
+}
+
+/*
+ * Find a block with at least one free slot and claim it.
+ * We make sure that the first block, if exists, will always work.
+ */
+static inline struct zblock_block *find_block(struct block_list *block_list)
+{
+	struct list_head *l = &block_list->list;
+
+	if (!list_empty(l)) {
+		struct zblock_block *z = list_first_entry(l, typeof(*z), link);
+
+		if (z->free_slots > 0) {
+			if (--z->free_slots == 0)
+				list_move_tail(&z->link, l);
+			return z;
+		}
+	}
+	return NULL;
+}
+
+/* remove block from the list */
+static inline void remove_block(struct zblock_block *block)
+{
+	list_del_init(&block->link);
+}
+
+/* Encodes the handle of a particular slot in the pool using metadata */
+static inline unsigned long metadata_to_handle(struct zblock_block *block,
+				unsigned int block_type, unsigned int slot)
+{
+	return (unsigned long)(block) | (block_type << SLOT_BITS) | slot;
+}
+
+/* Returns block, block type and slot in the pool corresponding to handle */
+static inline struct zblock_block *handle_to_metadata(unsigned long handle,
+				unsigned int *block_type, unsigned int *slot)
+{
+	*block_type = (handle & (PAGE_SIZE - 1)) >> SLOT_BITS;
+	*slot = handle & SLOT_MASK;
+	return (struct zblock_block *)(handle & PAGE_MASK);
+}
+
+
+/*
+ * allocate new block and add it to corresponding block list
+ */
+static struct zblock_block *alloc_block(struct zblock_pool *pool,
+					int block_type, gfp_t gfp,
+					unsigned long *handle)
+{
+	struct zblock_block *block;
+	struct block_list *block_list;
+
+	block = (void *)__get_free_pages(gfp, block_desc[block_type].order);
+	if (!block)
+		return NULL;
+
+	block_list = &pool->block_lists[block_type];
+
+	/* init block data  */
+	block->free_slots = block_desc[block_type].slots_per_block - 1;
+	memset(&block->slot_info, 0, sizeof(block->slot_info));
+	set_bit(0, block->slot_info);
+	*handle = metadata_to_handle(block, block_type, 0);
+
+	spin_lock(&block_list->lock);
+	add_block(block, block_list);
+	block_list->block_count++;
+	spin_unlock(&block_list->lock);
+	return block;
+}
+
+/*****************
+ * API Functions
+ *****************/
+/**
+ * zblock_create_pool() - create a new zblock pool
+ * @gfp:	gfp flags when allocating the zblock pool structure
+ * @ops:	user-defined operations for the zblock pool
+ *
+ * Return: pointer to the new zblock pool or NULL if the metadata allocation
+ * failed.
+ */
+static struct zblock_pool *zblock_create_pool(gfp_t gfp)
+{
+	struct zblock_pool *pool;
+	struct block_list *block_list;
+	int i;
+
+	pool = kmalloc(sizeof(struct zblock_pool), gfp);
+	if (!pool)
+		return NULL;
+
+	/* init each block list */
+	for (i = 0; i < ARRAY_SIZE(block_desc); i++) {
+		block_list = &pool->block_lists[i];
+		spin_lock_init(&block_list->lock);
+		INIT_LIST_HEAD(&block_list->list);
+		block_list->block_count = 0;
+	}
+	return pool;
+}
+
+/**
+ * zblock_destroy_pool() - destroys an existing zblock pool
+ * @pool:	the zblock pool to be destroyed
+ *
+ */
+static void zblock_destroy_pool(struct zblock_pool *pool)
+{
+	kfree(pool);
+}
+
+
+/**
+ * zblock_alloc() - allocates a slot of appropriate size
+ * @pool:	zblock pool from which to allocate
+ * @size:	size in bytes of the desired allocation
+ * @gfp:	gfp flags used if the pool needs to grow
+ * @handle:	handle of the new allocation
+ *
+ * Return: 0 if success and handle is set, otherwise -EINVAL if the size or
+ * gfp arguments are invalid or -ENOMEM if the pool was unable to allocate
+ * a new slot.
+ */
+static int zblock_alloc(struct zblock_pool *pool, size_t size, gfp_t gfp,
+			unsigned long *handle)
+{
+	int block_type = -1;
+	unsigned int slot;
+	struct zblock_block *block;
+	struct block_list *block_list;
+
+	if (!size)
+		return -EINVAL;
+
+	if (size > PAGE_SIZE)
+		return -ENOSPC;
+
+	/* find basic block type with suitable slot size */
+	if (size < block_desc[0].slot_size)
+		block_type = 0;
+	else {
+		struct block_desc_node *block_node;
+		struct rb_node *node = block_desc_tree.rb_node;
+
+		while (node) {
+			block_node = container_of(node, typeof(*block_node), node);
+			if (size < block_node->this_slot_size)
+				node = node->rb_left;
+			else if (size >= block_node->next_slot_size)
+				node = node->rb_right;
+			else {
+				block_type = block_node->block_idx + 1;
+				break;
+			}
+		}
+	}
+	if (WARN_ON(block_type < 0 || block_type >= ARRAY_SIZE(block_desc)))
+		return -EINVAL;
+
+	block_list = &pool->block_lists[block_type];
+
+	spin_lock(&block_list->lock);
+	block = find_block(block_list);
+	spin_unlock(&block_list->lock);
+	if (block)
+		goto found;
+
+	/* not found block with free slots try to allocate new empty block */
+	block = alloc_block(pool, block_type, gfp, handle);
+	return block ? 0 : -ENOMEM;
+
+found:
+	/* find the first free slot in block */
+	for (slot = find_first_zero_bit(block->slot_info,
+					block_desc[block_type].slots_per_block);
+	     slot < block_desc[block_type].slots_per_block;
+	     slot = find_next_zero_bit(block->slot_info,
+					block_desc[block_type].slots_per_block,
+					slot)) {
+		if (!test_and_set_bit(slot, block->slot_info))
+			break;
+		barrier();
+	}
+	BUG_ON(slot >= block_desc[block_type].slots_per_block);
+	*handle = metadata_to_handle(block, block_type, slot);
+	return 0;
+}
+
+/**
+ * zblock_free() - frees the allocation associated with the given handle
+ * @pool:	pool in which the allocation resided
+ * @handle:	handle associated with the allocation returned by zblock_alloc()
+ *
+ */
+static void zblock_free(struct zblock_pool *pool, unsigned long handle)
+{
+	unsigned int slot, block_type;
+	struct zblock_block *block;
+	struct block_list *block_list;
+
+	block = handle_to_metadata(handle, &block_type, &slot);
+	block_list = &pool->block_lists[block_type];
+
+	spin_lock(&block_list->lock);
+	/* if all slots in block are empty delete whole block */
+	if (++block->free_slots == block_desc[block_type].slots_per_block) {
+		block_list->block_count--;
+		remove_block(block);
+		spin_unlock(&block_list->lock);
+		free_pages((unsigned long)block, block_desc[block_type].order);
+		return;
+	}
+	spin_unlock(&block_list->lock);
+
+	clear_bit(slot, block->slot_info);
+}
+
+/**
+ * zblock_map() - maps the allocation associated with the given handle
+ * @pool:	pool in which the allocation resides
+ * @handle:	handle associated with the allocation to be mapped
+ *
+ *
+ * Returns: a pointer to the mapped allocation
+ */
+static void *zblock_map(struct zblock_pool *pool, unsigned long handle)
+{
+	unsigned int block_type, slot;
+	struct zblock_block *block;
+	unsigned long offs;
+	void *p;
+
+	block = handle_to_metadata(handle, &block_type, &slot);
+	offs = ZBLOCK_HEADER_SIZE + slot * block_desc[block_type].slot_size;
+	p = (void *)block + offs;
+	return p;
+}
+
+/**
+ * zblock_unmap() - unmaps the allocation associated with the given handle
+ * @pool:	pool in which the allocation resides
+ * @handle:	handle associated with the allocation to be unmapped
+ */
+static void zblock_unmap(struct zblock_pool *pool, unsigned long handle)
+{
+}
+
+/**
+ * zblock_get_total_pages() - gets the zblock pool size in pages
+ * @pool:	pool being queried
+ *
+ * Returns: size in bytes of the given pool.
+ */
+static u64 zblock_get_total_pages(struct zblock_pool *pool)
+{
+	u64 total_size;
+	int i;
+
+	total_size = 0;
+	for (i = 0; i < ARRAY_SIZE(block_desc); i++)
+		total_size += pool->block_lists[i].block_count << block_desc[i].order;
+
+	return total_size;
+}
+
+/*****************
+ * zpool
+ ****************/
+
+static void *zblock_zpool_create(const char *name, gfp_t gfp)
+{
+	return zblock_create_pool(gfp);
+}
+
+static void zblock_zpool_destroy(void *pool)
+{
+	zblock_destroy_pool(pool);
+}
+
+static int zblock_zpool_malloc(void *pool, size_t size, gfp_t gfp,
+			unsigned long *handle)
+{
+	return zblock_alloc(pool, size, gfp, handle);
+}
+
+static void zblock_zpool_free(void *pool, unsigned long handle)
+{
+	zblock_free(pool, handle);
+}
+
+static void *zblock_zpool_map(void *pool, unsigned long handle,
+			enum zpool_mapmode mm)
+{
+	return zblock_map(pool, handle);
+}
+
+static void zblock_zpool_unmap(void *pool, unsigned long handle)
+{
+	zblock_unmap(pool, handle);
+}
+
+static u64 zblock_zpool_total_pages(void *pool)
+{
+	return zblock_get_total_pages(pool);
+}
+
+static struct zpool_driver zblock_zpool_driver = {
+	.type =		"zblock",
+	.owner =	THIS_MODULE,
+	.create =	zblock_zpool_create,
+	.destroy =	zblock_zpool_destroy,
+	.malloc =	zblock_zpool_malloc,
+	.free =		zblock_zpool_free,
+	.map =		zblock_zpool_map,
+	.unmap =	zblock_zpool_unmap,
+	.total_pages =	zblock_zpool_total_pages,
+};
+
+MODULE_ALIAS("zpool-zblock");
+
+static void delete_rbtree(void)
+{
+	while (!RB_EMPTY_ROOT(&block_desc_tree))
+		rb_erase(block_desc_tree.rb_node, &block_desc_tree);
+}
+
+static int __init create_rbtree(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(block_desc); i++) {
+		struct block_desc_node *block_node = kmalloc(sizeof(*block_node),
+							GFP_KERNEL);
+		struct rb_node **new = &block_desc_tree.rb_node, *parent = NULL;
+
+		if (!block_node) {
+			delete_rbtree();
+			return -ENOMEM;
+		}
+		block_node->this_slot_size = block_desc[i].slot_size;
+		block_node->block_idx = i;
+		if (i == ARRAY_SIZE(block_desc) - 1)
+			block_node->next_slot_size = PAGE_SIZE;
+		else
+			block_node->next_slot_size = block_desc[i+1].slot_size;
+		while (*new) {
+			parent = *new;
+			/* the array is sorted so we will always go to the right */
+			new = &((*new)->rb_right);
+		}
+		rb_link_node(&block_node->node, parent, new);
+		rb_insert_color(&block_node->node, &block_desc_tree);
+	}
+	return 0;
+}
+
+static int __init init_zblock(void)
+{
+	int ret = create_rbtree();
+
+	if (ret)
+		return ret;
+
+	zpool_register_driver(&zblock_zpool_driver);
+	return 0;
+}
+
+static void __exit exit_zblock(void)
+{
+	zpool_unregister_driver(&zblock_zpool_driver);
+	delete_rbtree();
+}
+
+module_init(init_zblock);
+module_exit(exit_zblock);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vitaly Wool <vitaly.wool@konsulko.se>");
+MODULE_DESCRIPTION("Block allocator for compressed pages");
diff --git a/mm/zblock.h b/mm/zblock.h
new file mode 100644
index 000000000000..0163d13593bf
--- /dev/null
+++ b/mm/zblock.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Author: Vitaly Wool <vitaly.wool@konsulko.com>
+ * Copyright (C) 2025, Konsulko AB.
+ */
+#ifndef __ZBLOCK_H__
+#define __ZBLOCK_H__
+
+#include <linux/mm.h>
+#include <linux/rbtree.h>
+#include <linux/types.h>
+
+#define SLOT_FREE 0
+#define BIT_SLOT_OCCUPIED 0
+#define BIT_SLOT_MAPPED 1
+
+#if PAGE_SIZE == 0x1000
+#define SLOT_BITS 5
+#elif PAGE_SIZE == 0x4000
+#define SLOT_BITS 8
+#else
+#error Unsupported PAGE_SIZE
+#endif
+
+#define MAX_SLOTS (1 << SLOT_BITS)
+#define SLOT_MASK ((0x1UL << SLOT_BITS) - 1)
+
+#define ZBLOCK_HEADER_SIZE	round_up(sizeof(struct zblock_block), sizeof(long))
+#define BLOCK_DATA_SIZE(order) ((PAGE_SIZE << order) - ZBLOCK_HEADER_SIZE)
+#define SLOT_SIZE(nslots, order) (round_down((BLOCK_DATA_SIZE(order) / nslots), sizeof(long)))
+
+/**
+ * struct zblock_block - block metadata
+ * Block consists of several (1/2/4/8) pages and contains fixed
+ * integer number of slots for allocating compressed pages.
+ *
+ * free_slots:	number of free slots in the block
+ * slot_info:	contains data about free/occupied slots
+ */
+struct zblock_block {
+	struct list_head link;
+	DECLARE_BITMAP(slot_info, 1 << SLOT_BITS);
+	u32 free_slots;
+};
+
+/**
+ * struct block_desc - general metadata for block lists
+ * Each block list stores only blocks of corresponding type which means
+ * that all blocks in it have the same number and size of slots.
+ * All slots are aligned to size of long.
+ *
+ * slot_size:		size of slot for this list
+ * slots_per_block:	number of slots per block for this list
+ * order:		order for __get_free_pages
+ */
+struct block_desc {
+	unsigned int slot_size;
+	unsigned short slots_per_block;
+	unsigned short order;
+};
+
+struct block_desc_node {
+	struct rb_node node;
+	unsigned int this_slot_size;
+	unsigned int next_slot_size;
+	unsigned int block_idx;
+};
+
+static const struct block_desc block_desc[] = {
+#if PAGE_SIZE == 0x4000
+	{ SLOT_SIZE(181, 0), 181, 0 },
+	{ SLOT_SIZE(150, 0), 150, 0 },
+	{ SLOT_SIZE(116, 0), 116, 0 },
+	{ SLOT_SIZE(94, 0), 94, 0 },
+	{ SLOT_SIZE(72, 0), 72, 0 },
+	{ SLOT_SIZE(54, 0), 54, 0 },
+	{ SLOT_SIZE(42, 0), 42, 0 },
+#endif /* PAGE_SIZE */
+	{ SLOT_SIZE(32, 0), 32, 0 },
+	{ SLOT_SIZE(22, 0), 22, 0 },
+	{ SLOT_SIZE(17, 0), 17, 0 },
+	{ SLOT_SIZE(13, 0), 13, 0 },
+	{ SLOT_SIZE(11, 0), 11, 0 },
+	{ SLOT_SIZE(9, 0), 9, 0 },
+	{ SLOT_SIZE(8, 0), 8, 0 },
+	{ SLOT_SIZE(14, 1), 14, 1 },
+	{ SLOT_SIZE(12, 1), 12, 1 },
+	{ SLOT_SIZE(11, 1), 11, 1 },
+	{ SLOT_SIZE(10, 1), 10, 1 },
+	{ SLOT_SIZE(9, 1), 9, 1 },
+	{ SLOT_SIZE(8, 1), 8, 1 },
+	{ SLOT_SIZE(15, 2), 15, 2 },
+	{ SLOT_SIZE(14, 2), 14, 2 },
+	{ SLOT_SIZE(13, 2), 13, 2 },
+	{ SLOT_SIZE(12, 2), 12, 2 },
+	{ SLOT_SIZE(11, 2), 11, 2 },
+	{ SLOT_SIZE(10, 2), 10, 2 },
+	{ SLOT_SIZE(9, 2), 9, 2 },
+	{ SLOT_SIZE(8, 2), 8, 2 },
+	{ SLOT_SIZE(15, 3), 15, 3 },
+	{ SLOT_SIZE(14, 3), 14, 3 },
+	{ SLOT_SIZE(13, 3), 13, 3 },
+	{ SLOT_SIZE(12, 3), 12, 3 },
+	{ SLOT_SIZE(11, 3), 11, 3 },
+	{ SLOT_SIZE(10, 3), 10, 3 },
+	{ SLOT_SIZE(9, 3), 9, 3 },
+	{ SLOT_SIZE(7, 3), 7, 3 }
+};
+
+/**
+ * struct block_list - stores metadata of particular list
+ * lock:		protects the list of blocks
+ * list:		linked list of blocks
+ * block_count:		total number of blocks in the list
+ */
+struct block_list {
+	spinlock_t lock;
+	struct list_head list;
+	unsigned long block_count;
+};
+
+/**
+ * struct zblock_pool - stores metadata for each zblock pool
+ * @block_lists:	array of block lists
+ * @zpool:		zpool driver
+ *
+ * This structure is allocated at pool creation time and maintains metadata
+ * for a particular zblock pool.
+ */
+struct zblock_pool {
+	struct block_list block_lists[ARRAY_SIZE(block_desc)];
+	struct zpool *zpool;
+};
+
+
+#endif
-- 
2.39.2

