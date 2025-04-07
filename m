Received: from mailrelay4-3.pub.mailoutpod2-cph3.one.com (mailrelay4-3.pub.mailoutpod2-cph3.one.com [46.30.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5921ADC7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050481; cv=none; b=PwgAWahRHalR0xJANBqHtq+hfATugi5tlryE+RRHZnXwfI/Aonw/qBu1kaK+cbvp1yEw3vTlZ2kM3mjX2FGwSBafzekaesPGN6dI/d4HvYqv79SaNlAtQWL34XyOx51SHRH5fys77IR5UATokVcYQaV++7d7zWu1fo7uqb4vXP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050481; c=relaxed/simple;
	bh=Hm9FKmHBuNZJM8FySdfVpsnIY58bFG81vEgJgFjHLPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OjvOn99c3k6pOTM+3XmqtkdrM4QxDnLcE/m8bmYQ+s8+D4wVXcuOLnihHvMsFtR05VvHXPrhHr21GUK9IS1J5j+UuczkQAFk9ePr9N+fPpFV8gygI2l4QH2G42nMhxt++53mRtDlRhnyLpCStlsvGLQN3gofFST5f71ahLlf740=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=R1DWbg2E; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=dlljCiiU; arc=none smtp.client-ip=46.30.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="R1DWbg2E";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="dlljCiiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1744050405; x=1744655205;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=6UZZ6n7fWOJYocDmgRLVOgUInHQMU8Le+qW/9evS4hc=;
	b=R1DWbg2EYhZKLupgfmclllIdoTr3dzyUekcWJ5EIu5zu2uGH/ISlkCS/0DrAiSF2ZjTdkF2KWnYIb
	 sQQ33vVjNPYpDPB3ZCa2Ebfy4kWFfN8KOzF8+ed99npqmkBSd5DZn9B75oPa/eXxeST0KHezFr0jub
	 W64Rp4Lg/RrWD3kkP+aQTOL0/tejVEXZ9xnk35svCMn5JVSxp8mkGvipeo4Vwtf96yMsKhlDt7Rk+L
	 ENhQP6bIKSrSR4YM6fcZkWuW+ftBW2Et2YfoL4OzLzqjQsI6RkHBK0KCV/ovP9s+x3nRCzX7rghTYt
	 0ZuPEau2eT3grO8do83HY0oG1GD4qQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1744050405; x=1744655205;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=6UZZ6n7fWOJYocDmgRLVOgUInHQMU8Le+qW/9evS4hc=;
	b=dlljCiiU8Je5AsnXEVMGMNsWxwED9o1ZiRA5ggjA6YWwy1K63CyuVcZArSskCe+rAZlMCx8XSje1B
	 VADndBzAw==
X-HalOne-ID: dba9432e-13dd-11f0-8f06-e77cec7da75b
Received: from [192.168.10.245] (host-90-233-218-222.mobileonline.telia.com [90.233.218.222])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id dba9432e-13dd-11f0-8f06-e77cec7da75b;
	Mon, 07 Apr 2025 18:26:44 +0000 (UTC)
Message-ID: <2cfcfdde-0d87-4195-b5a9-73636a94e89a@konsulko.se>
Date: Mon, 7 Apr 2025 20:26:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: add zblock allocator
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Igor Belousov <igor.b@beldev.am>
References: <20250404192813.925835-1-vitaly.wool@konsulko.se>
 <20250407155409.GB827@cmpxchg.org>
Content-Language: en-US
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <20250407155409.GB827@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johannes,

thanks for the review, some comments follow below.

On 4/7/25 17:54, Johannes Weiner wrote:
> On Fri, Apr 04, 2025 at 09:28:13PM +0200, Vitaly Wool wrote:
>> @@ -0,0 +1,24 @@
>> +. SPDX-License-Identifier: GPL-2.0
>> +
>> +======
>> +zblock
>> +======
>> +
>> +zblock is a special purpose allocator for storing compressed pages.
>> +It stores integer number of compressed objects per its block. These
>> +blocks consist of several physical pages (2**n, i. e. 1/2/4/8).
>> +
>> +With zblock, it is possible to densely arrange objects of various sizes
>> +resulting in low internal fragmentation. Also this allocator tries to
>> +fill incomplete blocks instead of adding new ones,  in many cases
>> +providing a compression ratio substantially higher than z3fold and zbud
>> +(though lower than zmalloc's).
> 
> This last part seems to be incorrect based on Igor's measurements.

Well, I surely don't mind deleting that.

>> +zblock does not require MMU to operate and also is superior to zsmalloc
>> +with regard to average performance and worst execution times, thus
>> +allowing for better response time and real-time characteristics of the
>> +whole system.
> 
> Please delete the MMU comment here and in the changelog. As Nhat said,
> this is a pointless advantage of a swap backend allocator, as swapping
> itself requires an MMU.

That's correct indeed but I still believe zblock may be a good match for 
ZRAM, even better than zsmalloc, and that is where MMU indepencence 
comes into play.

> Please also add that highmem is not supported.
> 
> Please also add that migration is not supported, which has a negative
> impact on the kernel's ability to produce higher-order pages. This is
> particularly unfortunate because zblock itself wants higher-order pages.

Right. We plan to add migration support in the close future though.

>> +E. g. on a series of stress-ng tests run on a Raspberry Pi 5, we get
>> +5-10% higher value for bogo ops/s in zblock/zsmalloc comparison.
>> +
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d5dfb9186962..19283e6a08eb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -26556,6 +26556,13 @@ F:	Documentation/networking/device_drivers/hamradio/z8530drv.rst
>>   F:	drivers/net/hamradio/*scc.c
>>   F:	drivers/net/hamradio/z8530.h
>>   
>> +ZBLOCK COMPRESSED SLAB MEMORY ALLOCATOR
>> +M:	Vitaly Wool <vitaly.wool@konsulko.se>
>> +L:	linux-mm@kvack.org
>> +S:	Maintained
>> +F:	Documentation/mm/zblock.rst
>> +F:	mm/zblock.[ch]
>> +
>>   ZBUD COMPRESSED PAGE ALLOCATOR
>>   M:	Seth Jennings <sjenning@redhat.com>
>>   M:	Dan Streetman <ddstreet@ieee.org>
> 
> It looks like you're using an old tree. Can you please rebase on top
> of the mm tree? There have been some significant changes to how zswap
> is calling into zpool since the other allocators have been deleted.
> 
>> @@ -0,0 +1,418 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * zblock.c
>> + *
>> + * Author: Vitaly Wool <vitaly.wool@konsulko.se>
>> + * Based on the work from Ananda Badmaev <a.badmaev@clicknet.pro>
>> + * Copyright (C) 2022-2025, Konsulko AB.
>> + *
>> + * Zblock is a small object allocator with the intention to serve as a
>> + * zpool backend. It operates on page blocks which consist of number
>> + * of physical pages being a power of 2 and store integer number of
>> + * compressed pages per block which results in determinism and simplicity.
>> + *
>> + * zblock doesn't export any API and is meant to be used via zpool API.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/list.h>
>> +#include <linux/mm.h>
>> +#include <linux/module.h>
>> +#include <linux/preempt.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/zpool.h>
>> +#include "zblock.h"
>> +
>> +static struct rb_root block_desc_tree = RB_ROOT;
>> +
>> +/* add a new block to the list */
>> +static inline void add_block(struct zblock_block *block,
>> +				struct block_list *block_list)
>> +{
>> +	list_add(&block->link, &block_list->list);
>> +}
>> +
>> +/*
>> + * Find a block with at least one free slot and claim it.
>> + * We make sure that the first block, if exists, will always work.
>> + */
>> +static inline struct zblock_block *find_block(struct block_list *block_list)
>> +{
>> +	struct list_head *l = &block_list->list;
>> +
>> +	if (!list_empty(l)) {
>> +		struct zblock_block *z = list_first_entry(l, typeof(*z), link);
>> +
>> +		if (z->free_slots > 0) {
>> +			if (--z->free_slots == 0)
>> +				list_move_tail(&z->link, l);
>> +			return z;
>> +		}
>> +	}
>> +	return NULL;
>> +}
>> +
>> +/* remove block from the list */
>> +static inline void remove_block(struct zblock_block *block)
>> +{
>> +	list_del_init(&block->link);
>> +}
>> +
>> +/* Encodes the handle of a particular slot in the pool using metadata */
>> +static inline unsigned long metadata_to_handle(struct zblock_block *block,
>> +				unsigned int block_type, unsigned int slot)
>> +{
>> +	return (unsigned long)(block) | (block_type << SLOT_BITS) | slot;
>> +}
>> +
>> +/* Returns block, block type and slot in the pool corresponding to handle */
>> +static inline struct zblock_block *handle_to_metadata(unsigned long handle,
>> +				unsigned int *block_type, unsigned int *slot)
>> +{
>> +	*block_type = (handle & (PAGE_SIZE - 1)) >> SLOT_BITS;
>> +	*slot = handle & SLOT_MASK;
>> +	return (struct zblock_block *)(handle & PAGE_MASK);
>> +}
>> +
>> +
>> +/*
>> + * allocate new block and add it to corresponding block list
>> + */
>> +static struct zblock_block *alloc_block(struct zblock_pool *pool,
>> +					int block_type, gfp_t gfp,
>> +					unsigned long *handle)
>> +{
>> +	struct zblock_block *block;
>> +	struct block_list *block_list;
>> +
>> +	block = (void *)__get_free_pages(gfp, block_desc[block_type].order);
> 
> This gfp comes from zswap, which currently does:
> 
>          gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE;
> 
> So you might get highmem here that cannot be dereferenced and crash.
> 
> __GFP_MOVABLE is also wrong, as you're not implementing migration.

Ack.

>> +	if (!block)
>> +		return NULL;
>> +
>> +	block_list = &pool->block_lists[block_type];
>> +
>> +	/* init block data  */
>> +	block->free_slots = block_desc[block_type].slots_per_block - 1;
>> +	memset(&block->slot_info, 0, sizeof(block->slot_info));
>> +	set_bit(0, block->slot_info);
>> +	*handle = metadata_to_handle(block, block_type, 0);
>> +
>> +	spin_lock(&block_list->lock);
>> +	add_block(block, block_list);
> 
> Use list_add() directly here.

This is probably too small a thing to argue about but I would rather 
keep add_block and put block_count increment there. Would you agree?

>> +	block_list->block_count++;
>> +	spin_unlock(&block_list->lock);
>> +	return block;
>> +}
>> +
>> +/*****************
>> + * API Functions
>> + *****************/
>> +/**
>> + * zblock_create_pool() - create a new zblock pool
>> + * @gfp:	gfp flags when allocating the zblock pool structure
>> + * @ops:	user-defined operations for the zblock pool
>> + *
>> + * Return: pointer to the new zblock pool or NULL if the metadata allocation
>> + * failed.
>> + */
>> +static struct zblock_pool *zblock_create_pool(gfp_t gfp)
>> +{
>> +	struct zblock_pool *pool;
>> +	struct block_list *block_list;
>> +	int i;
>> +
>> +	pool = kmalloc(sizeof(struct zblock_pool), gfp);
>> +	if (!pool)
>> +		return NULL;
>> +
>> +	/* init each block list */
>> +	for (i = 0; i < ARRAY_SIZE(block_desc); i++) {
>> +		block_list = &pool->block_lists[i];
>> +		spin_lock_init(&block_list->lock);
>> +		INIT_LIST_HEAD(&block_list->list);
>> +		block_list->block_count = 0;
>> +	}
>> +	return pool;
>> +}
>> +
>> +/**
>> + * zblock_destroy_pool() - destroys an existing zblock pool
>> + * @pool:	the zblock pool to be destroyed
>> + *
>> + */
>> +static void zblock_destroy_pool(struct zblock_pool *pool)
>> +{
>> +	kfree(pool);
>> +}
>> +
>> +
>> +/**
>> + * zblock_alloc() - allocates a slot of appropriate size
>> + * @pool:	zblock pool from which to allocate
>> + * @size:	size in bytes of the desired allocation
>> + * @gfp:	gfp flags used if the pool needs to grow
>> + * @handle:	handle of the new allocation
>> + *
>> + * Return: 0 if success and handle is set, otherwise -EINVAL if the size or
>> + * gfp arguments are invalid or -ENOMEM if the pool was unable to allocate
>> + * a new slot.
>> + */
>> +static int zblock_alloc(struct zblock_pool *pool, size_t size, gfp_t gfp,
>> +			unsigned long *handle)
>> +{
>> +	int block_type = -1;
>> +	unsigned int slot;
>> +	struct zblock_block *block;
>> +	struct block_list *block_list;
>> +
>> +	if (!size)
>> +		return -EINVAL;
>> +
>> +	if (size > PAGE_SIZE)
>> +		return -ENOSPC;
>> +
>> +	/* find basic block type with suitable slot size */
>> +	if (size < block_desc[0].slot_size)
>> +		block_type = 0;
>> +	else {
>> +		struct block_desc_node *block_node;
>> +		struct rb_node *node = block_desc_tree.rb_node;
>> +
>> +		while (node) {
>> +			block_node = container_of(node, typeof(*block_node), node);
>> +			if (size < block_node->this_slot_size)
>> +				node = node->rb_left;
>> +			else if (size >= block_node->next_slot_size)
>> +				node = node->rb_right;
>> +			else {
>> +				block_type = block_node->block_idx + 1;
>> +				break;
>> +			}
>> +		}
>> +	}
>> +	if (WARN_ON(block_type < 0 || block_type >= ARRAY_SIZE(block_desc)))
>> +		return -EINVAL;
>> +
>> +	block_list = &pool->block_lists[block_type];
>> +
>> +	spin_lock(&block_list->lock);
>> +	block = find_block(block_list);
>> +	spin_unlock(&block_list->lock);
>> +	if (block)
>> +		goto found;
>> +	/* not found block with free slots try to allocate new empty block */
>> +	block = alloc_block(pool, block_type, gfp, handle);
>> +	return block ? 0 : -ENOMEM;
>> +
>> +found:
>> +	/* find the first free slot in block */
>> +	for (slot = find_first_zero_bit(block->slot_info,
>> +					block_desc[block_type].slots_per_block);
>> +	     slot < block_desc[block_type].slots_per_block;
>> +	     slot = find_next_zero_bit(block->slot_info,
>> +					block_desc[block_type].slots_per_block,
>> +					slot)) {
>> +		if (!test_and_set_bit(slot, block->slot_info))
>> +			break;
>> +		barrier();
> 
> Ah, so find_block() reserves a slot in block->free_slots. You can race
> with another allocation for the exact bit, but there is one bit
> guaranteed to remain. Clever. This could use a comment.

Will do.

>> +	}
>> +	BUG_ON(slot >= block_desc[block_type].slots_per_block);
>> +	*handle = metadata_to_handle(block, block_type, slot);
>> +	return 0;
>> +}
>> +
>> +/**
>> + * zblock_free() - frees the allocation associated with the given handle
>> + * @pool:	pool in which the allocation resided
>> + * @handle:	handle associated with the allocation returned by zblock_alloc()
>> + *
>> + */
>> +static void zblock_free(struct zblock_pool *pool, unsigned long handle)
>> +{
>> +	unsigned int slot, block_type;
>> +	struct zblock_block *block;
>> +	struct block_list *block_list;
>> +
>> +	block = handle_to_metadata(handle, &block_type, &slot);
>> +	block_list = &pool->block_lists[block_type];
>> +
>> +	spin_lock(&block_list->lock);
>> +	/* if all slots in block are empty delete whole block */
>> +	if (++block->free_slots == block_desc[block_type].slots_per_block) {
>> +		block_list->block_count--;
>> +		remove_block(block);
>> +		spin_unlock(&block_list->lock);
>> +		free_pages((unsigned long)block, block_desc[block_type].order);
>> +		return;
>> +	}
>> +	spin_unlock(&block_list->lock);
>> +
>> +	clear_bit(slot, block->slot_info);
> 
> The list handling here is unusual. find_block() only checks the first
> block in the list. Filling a block puts it at the tail, but partially
> freeing a block doesn't rotate it back to the head. AFAICS this can
> lead to an ugly edge case where you have an unbounded amount of free
> memory trapped in partial blocks, but you keep allocating new blocks:
> 
> You start with [new block]. Once full, list_move_tail() is a nop.
> 
> You allocate a new one, [partial]->[full].
> 
> Keep going, you can have [partial]->[full]->[full]->[full]->[full]
> until it's hundreds of gigabytes.
> 
> The workload now unmaps randomly and thus partially draining many
> blocks. So you have: [partial]->[full]->[partial]->... with many
> gigabytes of free slots in partially used blocks.
> 
> Once the first partial block fills up, it rotates to the tail:
> [full]->[partial]->...[full]
> 
> find_block() will fail. You allocate a new block, fill it, move it to
> the tail. The old [full] is back at the head. Rinse, repeat.
> 
> You could make find_block() keep going, but it might have to go
> through a million [full] blocks before finding a partial one.
> 
> This is the reason why other allocator schemes, like zsmalloc e.g.,
> have separate partial and full lists.

The initial variant of zblock_free() had list_move() for that very 
purpose but we hadn't hit this corner case in our testing so far so I 
decided to remove it. As an interesting coincidence I seem to had hit it 
minutes before I received your response so I've got it restored and 
checking now if it is enough.

~Vitaly
