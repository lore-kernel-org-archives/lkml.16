Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D0D205AB3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041261; cv=none; b=t/5XQsNNIiIggsaQk7yhC/X8DAgNV9GPBemy4raplNGJIQNG4PpLjowAL/sC16GxKE/7LBcZLT+8RbfLpE7lsQ5JEu9ybmC5oSxEI6zO13uY2aRHSoDSsCigYHSjQbwZCebdYRG03IC8DArYBBhYiTvP6eoYeKPo4fDP1//8pMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041261; c=relaxed/simple;
	bh=uPK9e7ftIPTw8zu5iGDsH4fY5aAwprWD1ICvL7gQrok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxsUI77bPEMelaUUamx9vuf3m1xbUi+YOY8HRyDUzPJqimqOuBrbOyGABzNHvVvdJoCPLyqRg+YVI/BHO6n9+0q4rxpVrfe8CeVteIq08szfSEWYsU8MBFE2hoAqyXdLudE/BXndDiGqZ/OzuOfgWDE62OBPnKXTILhlCB80ns0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=BRqwaR8O; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="BRqwaR8O"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8ec399427so38162136d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744041254; x=1744646054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ms9R7ahBBm0CuzZ+6IiKEPp0eXj/hwoNb73wK3/VqY=;
        b=BRqwaR8O1vWnW5LKfy44aLR3G8puyWLNiAS3lLT2orLcuE7Lwf4YrEDaKwDwJA8/yF
         PEkcCMgufIYs8ggVdCVnZbG21vl+v2L9dEmMTq2Er8KD5bjkBBfDwR4aRPUIzlRJhcN3
         wZCdxpvIHgYTKxdnMUhl/iepr8HwrO8l9THbiqtYp3w8tUn9z3hl1qn9gcvTvVT4uhQC
         Sks2tyi0CzfnfA540Ctvggo2EqFKRo4Eu0IWwQPXdSldcKBZj+JBeNx3LBijqAEkhRKb
         oPLkbkgDA8uADlWi1vDLL11BFMeXJG2pqsR6M7bTU/mMkx4lEPelyV+nfp7Kcpw2Dmdx
         mpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041254; x=1744646054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ms9R7ahBBm0CuzZ+6IiKEPp0eXj/hwoNb73wK3/VqY=;
        b=eZbGWI5iwk9j6lYUeNf7NHWyKF0EHD+SIUo0TheWPANe7rCKcvjLowskDnPgzeuoQH
         htvvcdHDCHBwCDEH2elskavzcc8AYhvmnZ65/0T1XDOPeTAakGo97FcEOTBV6EdY/DaU
         D6i76G0kEGnxjRmC8pUTeYXiaN9X2s5p0quTtBmCY2L7clOLJaFs74jvf787YSAqT9cA
         o589taH77h4McZS3TxiG2g+P8G+1Q9iTgchFCfRPd9mbclnjcqIyns357A9E1i4dU2Nf
         cj6HHv5OrSzTc0W7344h7IKMRaKe0tjNJIj6ISo1TZD1gwz+qgpVrx5QJhwRXs+ztIdX
         vWlw==
X-Forwarded-Encrypted: i=1; AJvYcCWz7moKQZLN4/NvRn5GZkdIx92Eobg68Vq2q8d9m1mR7fpsLA8/uB1D95BE9mrtxoOoq8ITui2Lw2PyX7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NcBSQyQsCxgaFlfAq5sYSDh939nJL/VXDwYYVz8h3QO8X58X
	JT9mfd4qCx5TZeQSObbo9tMjoLc4oRB7Ix7+lWlxvXwN80d1mIeycDcY/pQ+0Nc=
X-Gm-Gg: ASbGncvMr2qmD1JqikQEcuimHCoCoy2so4eZVzl4PCsoIOP6blWxGMq8enVYbrzXAg+
	Uft1S9F6RehqZTMRQbAZEhBaFtM6Ime10HfPCd0VhApROFj6hSHb5mQT328qt5zj+qIrEtgJdzU
	pKB5+n6zrOEwNp1cuwDAK505W+r6S5BU6BQTeet4PSwD4NvTZYZ+N7bmyhopQRmGoiviHJPLRl6
	+GUURnYG6uaSI/m2yzMA2PvPWEGuMjj6JYqrMyEaKELweGxyVvKC4aJm/fACDpCs7MPOYOY+HtY
	kgVKUd35UsM0025hZYMbSYt9goKuRAoOa8nFEYwHPcg=
X-Google-Smtp-Source: AGHT+IFAr+Ddmty97kMW/x8YowxM7ltqx/bkYOksgNWcfkNe3XapyOnA/fNdirReU+JtXdW5xrViUA==
X-Received: by 2002:a05:6214:268f:b0:6e8:fad9:c688 with SMTP id 6a1803df08f44-6f0b744e6ebmr129230826d6.16.1744041253746;
        Mon, 07 Apr 2025 08:54:13 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f047c23sm59769246d6.58.2025.04.07.08.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:54:13 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:54:09 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH v2] mm: add zblock allocator
Message-ID: <20250407155409.GB827@cmpxchg.org>
References: <20250404192813.925835-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404192813.925835-1-vitaly.wool@konsulko.se>

On Fri, Apr 04, 2025 at 09:28:13PM +0200, Vitaly Wool wrote:
> @@ -0,0 +1,24 @@
> +. SPDX-License-Identifier: GPL-2.0
> +
> +======
> +zblock
> +======
> +
> +zblock is a special purpose allocator for storing compressed pages.
> +It stores integer number of compressed objects per its block. These
> +blocks consist of several physical pages (2**n, i. e. 1/2/4/8).
> +
> +With zblock, it is possible to densely arrange objects of various sizes
> +resulting in low internal fragmentation. Also this allocator tries to
> +fill incomplete blocks instead of adding new ones,  in many cases
> +providing a compression ratio substantially higher than z3fold and zbud
> +(though lower than zmalloc's).

This last part seems to be incorrect based on Igor's measurements.

> +zblock does not require MMU to operate and also is superior to zsmalloc
> +with regard to average performance and worst execution times, thus
> +allowing for better response time and real-time characteristics of the
> +whole system.

Please delete the MMU comment here and in the changelog. As Nhat said,
this is a pointless advantage of a swap backend allocator, as swapping
itself requires an MMU.

Please also add that highmem is not supported.

Please also add that migration is not supported, which has a negative
impact on the kernel's ability to produce higher-order pages. This is
particularly unfortunate because zblock itself wants higher-order pages.

> +E. g. on a series of stress-ng tests run on a Raspberry Pi 5, we get
> +5-10% higher value for bogo ops/s in zblock/zsmalloc comparison.
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d5dfb9186962..19283e6a08eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26556,6 +26556,13 @@ F:	Documentation/networking/device_drivers/hamradio/z8530drv.rst
>  F:	drivers/net/hamradio/*scc.c
>  F:	drivers/net/hamradio/z8530.h
>  
> +ZBLOCK COMPRESSED SLAB MEMORY ALLOCATOR
> +M:	Vitaly Wool <vitaly.wool@konsulko.se>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	Documentation/mm/zblock.rst
> +F:	mm/zblock.[ch]
> +
>  ZBUD COMPRESSED PAGE ALLOCATOR
>  M:	Seth Jennings <sjenning@redhat.com>
>  M:	Dan Streetman <ddstreet@ieee.org>

It looks like you're using an old tree. Can you please rebase on top
of the mm tree? There have been some significant changes to how zswap
is calling into zpool since the other allocators have been deleted.

> @@ -0,0 +1,418 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * zblock.c
> + *
> + * Author: Vitaly Wool <vitaly.wool@konsulko.se>
> + * Based on the work from Ananda Badmaev <a.badmaev@clicknet.pro>
> + * Copyright (C) 2022-2025, Konsulko AB.
> + *
> + * Zblock is a small object allocator with the intention to serve as a
> + * zpool backend. It operates on page blocks which consist of number
> + * of physical pages being a power of 2 and store integer number of
> + * compressed pages per block which results in determinism and simplicity.
> + *
> + * zblock doesn't export any API and is meant to be used via zpool API.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/atomic.h>
> +#include <linux/list.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/preempt.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/zpool.h>
> +#include "zblock.h"
> +
> +static struct rb_root block_desc_tree = RB_ROOT;
> +
> +/* add a new block to the list */
> +static inline void add_block(struct zblock_block *block,
> +				struct block_list *block_list)
> +{
> +	list_add(&block->link, &block_list->list);
> +}
> +
> +/*
> + * Find a block with at least one free slot and claim it.
> + * We make sure that the first block, if exists, will always work.
> + */
> +static inline struct zblock_block *find_block(struct block_list *block_list)
> +{
> +	struct list_head *l = &block_list->list;
> +
> +	if (!list_empty(l)) {
> +		struct zblock_block *z = list_first_entry(l, typeof(*z), link);
> +
> +		if (z->free_slots > 0) {
> +			if (--z->free_slots == 0)
> +				list_move_tail(&z->link, l);
> +			return z;
> +		}
> +	}
> +	return NULL;
> +}
> +
> +/* remove block from the list */
> +static inline void remove_block(struct zblock_block *block)
> +{
> +	list_del_init(&block->link);
> +}
> +
> +/* Encodes the handle of a particular slot in the pool using metadata */
> +static inline unsigned long metadata_to_handle(struct zblock_block *block,
> +				unsigned int block_type, unsigned int slot)
> +{
> +	return (unsigned long)(block) | (block_type << SLOT_BITS) | slot;
> +}
> +
> +/* Returns block, block type and slot in the pool corresponding to handle */
> +static inline struct zblock_block *handle_to_metadata(unsigned long handle,
> +				unsigned int *block_type, unsigned int *slot)
> +{
> +	*block_type = (handle & (PAGE_SIZE - 1)) >> SLOT_BITS;
> +	*slot = handle & SLOT_MASK;
> +	return (struct zblock_block *)(handle & PAGE_MASK);
> +}
> +
> +
> +/*
> + * allocate new block and add it to corresponding block list
> + */
> +static struct zblock_block *alloc_block(struct zblock_pool *pool,
> +					int block_type, gfp_t gfp,
> +					unsigned long *handle)
> +{
> +	struct zblock_block *block;
> +	struct block_list *block_list;
> +
> +	block = (void *)__get_free_pages(gfp, block_desc[block_type].order);

This gfp comes from zswap, which currently does:

        gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE;

So you might get highmem here that cannot be dereferenced and crash.

__GFP_MOVABLE is also wrong, as you're not implementing migration.

> +	if (!block)
> +		return NULL;
> +
> +	block_list = &pool->block_lists[block_type];
> +
> +	/* init block data  */
> +	block->free_slots = block_desc[block_type].slots_per_block - 1;
> +	memset(&block->slot_info, 0, sizeof(block->slot_info));
> +	set_bit(0, block->slot_info);
> +	*handle = metadata_to_handle(block, block_type, 0);
> +
> +	spin_lock(&block_list->lock);
> +	add_block(block, block_list);

Use list_add() directly here.

> +	block_list->block_count++;
> +	spin_unlock(&block_list->lock);
> +	return block;
> +}
> +
> +/*****************
> + * API Functions
> + *****************/
> +/**
> + * zblock_create_pool() - create a new zblock pool
> + * @gfp:	gfp flags when allocating the zblock pool structure
> + * @ops:	user-defined operations for the zblock pool
> + *
> + * Return: pointer to the new zblock pool or NULL if the metadata allocation
> + * failed.
> + */
> +static struct zblock_pool *zblock_create_pool(gfp_t gfp)
> +{
> +	struct zblock_pool *pool;
> +	struct block_list *block_list;
> +	int i;
> +
> +	pool = kmalloc(sizeof(struct zblock_pool), gfp);
> +	if (!pool)
> +		return NULL;
> +
> +	/* init each block list */
> +	for (i = 0; i < ARRAY_SIZE(block_desc); i++) {
> +		block_list = &pool->block_lists[i];
> +		spin_lock_init(&block_list->lock);
> +		INIT_LIST_HEAD(&block_list->list);
> +		block_list->block_count = 0;
> +	}
> +	return pool;
> +}
> +
> +/**
> + * zblock_destroy_pool() - destroys an existing zblock pool
> + * @pool:	the zblock pool to be destroyed
> + *
> + */
> +static void zblock_destroy_pool(struct zblock_pool *pool)
> +{
> +	kfree(pool);
> +}
> +
> +
> +/**
> + * zblock_alloc() - allocates a slot of appropriate size
> + * @pool:	zblock pool from which to allocate
> + * @size:	size in bytes of the desired allocation
> + * @gfp:	gfp flags used if the pool needs to grow
> + * @handle:	handle of the new allocation
> + *
> + * Return: 0 if success and handle is set, otherwise -EINVAL if the size or
> + * gfp arguments are invalid or -ENOMEM if the pool was unable to allocate
> + * a new slot.
> + */
> +static int zblock_alloc(struct zblock_pool *pool, size_t size, gfp_t gfp,
> +			unsigned long *handle)
> +{
> +	int block_type = -1;
> +	unsigned int slot;
> +	struct zblock_block *block;
> +	struct block_list *block_list;
> +
> +	if (!size)
> +		return -EINVAL;
> +
> +	if (size > PAGE_SIZE)
> +		return -ENOSPC;
> +
> +	/* find basic block type with suitable slot size */
> +	if (size < block_desc[0].slot_size)
> +		block_type = 0;
> +	else {
> +		struct block_desc_node *block_node;
> +		struct rb_node *node = block_desc_tree.rb_node;
> +
> +		while (node) {
> +			block_node = container_of(node, typeof(*block_node), node);
> +			if (size < block_node->this_slot_size)
> +				node = node->rb_left;
> +			else if (size >= block_node->next_slot_size)
> +				node = node->rb_right;
> +			else {
> +				block_type = block_node->block_idx + 1;
> +				break;
> +			}
> +		}
> +	}
> +	if (WARN_ON(block_type < 0 || block_type >= ARRAY_SIZE(block_desc)))
> +		return -EINVAL;
> +
> +	block_list = &pool->block_lists[block_type];
> +
> +	spin_lock(&block_list->lock);
> +	block = find_block(block_list);
> +	spin_unlock(&block_list->lock);
> +	if (block)
> +		goto found;
> +	/* not found block with free slots try to allocate new empty block */
> +	block = alloc_block(pool, block_type, gfp, handle);
> +	return block ? 0 : -ENOMEM;
> +
> +found:
> +	/* find the first free slot in block */
> +	for (slot = find_first_zero_bit(block->slot_info,
> +					block_desc[block_type].slots_per_block);
> +	     slot < block_desc[block_type].slots_per_block;
> +	     slot = find_next_zero_bit(block->slot_info,
> +					block_desc[block_type].slots_per_block,
> +					slot)) {
> +		if (!test_and_set_bit(slot, block->slot_info))
> +			break;
> +		barrier();

Ah, so find_block() reserves a slot in block->free_slots. You can race
with another allocation for the exact bit, but there is one bit
guaranteed to remain. Clever. This could use a comment.

> +	}
> +	BUG_ON(slot >= block_desc[block_type].slots_per_block);
> +	*handle = metadata_to_handle(block, block_type, slot);
> +	return 0;
> +}
> +
> +/**
> + * zblock_free() - frees the allocation associated with the given handle
> + * @pool:	pool in which the allocation resided
> + * @handle:	handle associated with the allocation returned by zblock_alloc()
> + *
> + */
> +static void zblock_free(struct zblock_pool *pool, unsigned long handle)
> +{
> +	unsigned int slot, block_type;
> +	struct zblock_block *block;
> +	struct block_list *block_list;
> +
> +	block = handle_to_metadata(handle, &block_type, &slot);
> +	block_list = &pool->block_lists[block_type];
> +
> +	spin_lock(&block_list->lock);
> +	/* if all slots in block are empty delete whole block */
> +	if (++block->free_slots == block_desc[block_type].slots_per_block) {
> +		block_list->block_count--;
> +		remove_block(block);
> +		spin_unlock(&block_list->lock);
> +		free_pages((unsigned long)block, block_desc[block_type].order);
> +		return;
> +	}
> +	spin_unlock(&block_list->lock);
> +
> +	clear_bit(slot, block->slot_info);

The list handling here is unusual. find_block() only checks the first
block in the list. Filling a block puts it at the tail, but partially
freeing a block doesn't rotate it back to the head. AFAICS this can
lead to an ugly edge case where you have an unbounded amount of free
memory trapped in partial blocks, but you keep allocating new blocks:

You start with [new block]. Once full, list_move_tail() is a nop.

You allocate a new one, [partial]->[full].

Keep going, you can have [partial]->[full]->[full]->[full]->[full]
until it's hundreds of gigabytes.

The workload now unmaps randomly and thus partially draining many
blocks. So you have: [partial]->[full]->[partial]->... with many
gigabytes of free slots in partially used blocks.

Once the first partial block fills up, it rotates to the tail:
[full]->[partial]->...[full]

find_block() will fail. You allocate a new block, fill it, move it to
the tail. The old [full] is back at the head. Rinse, repeat.

You could make find_block() keep going, but it might have to go
through a million [full] blocks before finding a partial one.

This is the reason why other allocator schemes, like zsmalloc e.g.,
have separate partial and full lists.
