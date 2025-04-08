Received: from mailrelay4-3.pub.mailoutpod2-cph3.one.com (mailrelay4-3.pub.mailoutpod2-cph3.one.com [46.30.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1F527701F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116759; cv=none; b=J0akWc9czYmlDpXFpE8MUL0DELARBxzBaxBI2KJOS3yj8D4PtMmnF2riIo3N5wDrAH8yxn5edXLz2EJjosJ99QB/n3Tc3sxgGHDtc6BQy4Vd+1flAdYYr3WZtOZiXpqzlZ6mdMYiKvGzsJGtSPAn4yY6XyippqCNV44NJ6Td5yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116759; c=relaxed/simple;
	bh=KeuOtoltE4jTJw5I9DCocwkcqd4h/S7QDVuBm9fcmn8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dZDzwGOoAAD0FDgzfkjNB5Uw7LnT1Cra3HZQq2Tcdd0YMZ72oCW0WW9ufXeKBhu6/fM1AftuX9Ue2yYI+ZTtGzxZzKxAjsTwOaWiZ9xOqsEBraOIiB4AvkrreqdWMTSz5xHJkgcVJlIRu5uo7pYG3WD1iDE/5nXuM1AfcfiiyXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=QQqrbdB9; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=G0hFd8hS; arc=none smtp.client-ip=46.30.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="QQqrbdB9";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="G0hFd8hS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1744116749; x=1744721549;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=Tu9nr9DbKdE4pfmQXxtZh+/3MYSLYrF9//OU4Wrh+4A=;
	b=QQqrbdB94TrhDoSlbyve5NbMPLkNTUW2X/DL1ZIrntlmcOnBEnIGRvt89WRIRK+fBhhyqolRqUPbJ
	 2wWCGQxqjJfyFiWN0WOMupFvXAXTupBxR7IPtyHBikvwgBOzHVmNIUD2ACNWGrbM95uX712ZmjzyRb
	 lOB9TInXQ+m9dPnBUfpr0CbqPtYgAckSbmTYcyR5lrKF/nrpwJanfqhIO6oQBvVay5FlXsJ7HhRGku
	 Ssmz0ksT5dlYqpB25kyMhy0jPlj0NnRS6OhQrD+l0AJQcJIaBNDLCTPDIOoGGqVtfy8y1/m4XLnRji
	 4cY3un19MKONQ1WIup1FOVBDXy+kLWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1744116749; x=1744721549;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=Tu9nr9DbKdE4pfmQXxtZh+/3MYSLYrF9//OU4Wrh+4A=;
	b=G0hFd8hS1mV30uORZcCDNdR+wHEMnOfNa+N8MfJ4uKQuQM65xuo4wTWUVKAu9kmfFMFKLfE7vrlT2
	 AsTZVXwBA==
X-HalOne-ID: 5280f6f4-1478-11f0-992a-e77cec7da75b
Received: from localhost.localdomain (host-90-233-218-222.mobileonline.telia.com [90.233.218.222])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 5280f6f4-1478-11f0-992a-e77cec7da75b;
	Tue, 08 Apr 2025 12:52:27 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Igor Belousov <igor.b@beldev.am>
Subject: [PATCH v3] mm: add zblock allocator
Date: Tue,  8 Apr 2025 14:52:11 +0200
Message-Id: <20250408125211.1611879-1-vitaly.wool@konsulko.se>
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
fill incomplete blocks instead of adding new ones, in many cases
providing a compression ratio comparable to zmalloc's.

zblock is also in most cases superior to zsmalloc with regard to
average performance and worst execution times, thus allowing for better
response time and real-time characteristics of the whole system. E. g.
on a series of stress-ng tests run on a Raspberry Pi 5, we get 5-10%
higher value for bogo ops/s in zblock/zsmalloc comparison.

High memory and page migration are currently not supported by zblock.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
Signed-off-by: Igor Belousov <igor.b@beldev.am>
---
Changes since v2:
- rebased and tested against the latest -mm tree
- 2 lists for allocated blocks (with/without free slots)
- comments in the code updated per review
- __GFP_HIGHMEM and __GFP_MOVABLE flags are masked for block allocation
- removed redundant helper functions

 Documentation/mm/zblock.rst |  24 ++
 MAINTAINERS                 |   7 +
 mm/Kconfig                  |  12 +
 mm/Makefile                 |   1 +
 mm/zblock.c                 | 436 ++++++++++++++++++++++++++++++++++++
 mm/zblock.h                 | 138 ++++++++++++
 6 files changed, 618 insertions(+)
 create mode 100644 Documentation/mm/zblock.rst
 create mode 100644 mm/zblock.c
 create mode 100644 mm/zblock.h

diff --git a/Documentation/mm/zblock.rst b/Documentation/mm/zblock.rst
new file mode 100644
index 000000000000..9751434d0b76
--- /dev/null
+++ b/Documentation/mm/zblock.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
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
index 96b827049501..46465c986005 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26640,6 +26640,13 @@ F:	Documentation/networking/device_drivers/hamradio/z8530drv.rst
 F:	drivers/net/hamradio/*scc.c
 F:	drivers/net/hamradio/z8530.h
 
+ZBLOCK COMPRESSED SLAB MEMORY ALLOCATOR
+M:	Vitaly Wool <vitaly.wool@konsulko.se>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	Documentation/mm/zblock.rst
+F:	mm/zblock.[ch]
+
 ZD1211RW WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
diff --git a/mm/Kconfig b/mm/Kconfig
index e113f713b493..5aa1479151ec 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -152,6 +152,18 @@ config ZSWAP_ZPOOL_DEFAULT
        default "zsmalloc" if ZSWAP_ZPOOL_DEFAULT_ZSMALLOC
        default ""
 
+config ZBLOCK
+	tristate "Fast compression allocator with high density"
+	depends on ZPOOL
+	help
+	  A special purpose allocator for storing compressed pages.
+	  It stores integer number of same size compressed objects per
+	  its block. These blocks consist of several physical pages
+	  (2**n, i. e. 1/2/4/8).
+
+	  With zblock, it is possible to densely arrange objects of
+	  various sizes resulting in low internal fragmentation.
+
 config ZSMALLOC
 	tristate
 	prompt "N:1 compression allocator (zsmalloc)" if (ZSWAP || ZRAM)
diff --git a/mm/Makefile b/mm/Makefile
index e7f6bbf8ae5f..9d7e5b5bb694 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -116,6 +116,7 @@ obj-$(CONFIG_DEBUG_VM_PGTABLE) += debug_vm_pgtable.o
 obj-$(CONFIG_PAGE_OWNER) += page_owner.o
 obj-$(CONFIG_MEMORY_ISOLATION) += page_isolation.o
 obj-$(CONFIG_ZPOOL)	+= zpool.o
+obj-$(CONFIG_ZBLOCK)	+= zblock.o
 obj-$(CONFIG_ZSMALLOC)	+= zsmalloc.o
 obj-$(CONFIG_GENERIC_EARLY_IOREMAP) += early_ioremap.o
 obj-$(CONFIG_CMA)	+= cma.o
diff --git a/mm/zblock.c b/mm/zblock.c
new file mode 100644
index 000000000000..b3e758bb1913
--- /dev/null
+++ b/mm/zblock.c
@@ -0,0 +1,436 @@
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
+/*
+ * Find a block with at least one free slot and claim it.
+ * We make sure that the first block, if exists, will always work.
+ */
+static inline struct zblock_block *find_and_claim_block(struct block_list *blist)
+{
+	struct list_head *l = &blist->active_list;
+
+	if (!list_empty(l)) {
+		struct zblock_block *z = list_first_entry(l, typeof(*z), link);
+
+		if (--z->free_slots == 0)
+			list_move(&z->link, &blist->full_list);
+		return z;
+	}
+	return NULL;
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
+	list_add(&block->link, &block_list->active_list);
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
+		INIT_LIST_HEAD(&block_list->full_list);
+		INIT_LIST_HEAD(&block_list->active_list);
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
+	block = find_and_claim_block(block_list);
+	spin_unlock(&block_list->lock);
+	if (block)
+		goto found;
+
+	/* not found block with free slots try to allocate new empty block */
+	block = alloc_block(pool, block_type, gfp & ~(__GFP_MOVABLE | __GFP_HIGHMEM), handle);
+	return block ? 0 : -ENOMEM;
+
+found:
+	/*
+	 * If we got here, there is a slot in the block claimed for us
+	 * by find_and_claim_block(). Find that slot and set the busy bit.
+	 */
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
+		list_del(&block->link);
+		spin_unlock(&block_list->lock);
+		free_pages((unsigned long)block, block_desc[block_type].order);
+		return;
+	} else if (block->free_slots == 1)
+		list_move_tail(&block->link, &block_list->active_list);
+	clear_bit(slot, block->slot_info);
+	spin_unlock(&block_list->lock);
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
+ * zblock_write() - write to the memory area defined by handle
+ * @pool:	pool in which the allocation resides
+ * @handle:	handle associated with the allocation
+ * @handle_mem: pointer to source memory block
+ * @mem_len:	length of the memory block to write
+ */
+static void zblock_write(struct zblock_pool *pool, unsigned long handle,
+			 void *handle_mem, size_t mem_len)
+{
+	unsigned int block_type, slot;
+	struct zblock_block *block;
+	unsigned long offs;
+	void *p;
+
+	block = handle_to_metadata(handle, &block_type, &slot);
+	offs = ZBLOCK_HEADER_SIZE + slot * block_desc[block_type].slot_size;
+	p = (void *)block + offs;
+	memcpy(p, handle_mem, mem_len);
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
+static void *zblock_zpool_read_begin(void *pool, unsigned long handle,
+				void *local_copy)
+{
+	return zblock_map(pool, handle);
+}
+
+static void zblock_zpool_obj_write(void *pool, unsigned long handle,
+				void *handle_mem, size_t mem_len)
+{
+	zblock_write(pool, handle, handle_mem, mem_len);
+}
+
+static void zblock_zpool_read_end(void *pool, unsigned long handle,
+				void *handle_mem)
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
+	.type =			"zblock",
+	.owner =		THIS_MODULE,
+	.create =		zblock_zpool_create,
+	.destroy =		zblock_zpool_destroy,
+	.malloc =		zblock_zpool_malloc,
+	.free =			zblock_zpool_free,
+	.obj_read_begin =	zblock_zpool_read_begin,
+	.obj_read_end =		zblock_zpool_read_end,
+	.obj_write =		zblock_zpool_obj_write,
+	.total_pages =		zblock_zpool_total_pages,
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
index 000000000000..c70ffe765be0
--- /dev/null
+++ b/mm/zblock.h
@@ -0,0 +1,138 @@
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
+ * active_list:		linked list of active (non-full) blocks
+ * full_list:		linked list of full blocks
+ * block_count:		total number of blocks in the list
+ */
+struct block_list {
+	spinlock_t lock;
+	struct list_head active_list;
+	struct list_head full_list;
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

