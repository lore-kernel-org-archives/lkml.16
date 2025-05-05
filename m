Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72514C98
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429417; cv=none; b=pW1WgflAoEJ8cwjfNog9iU+0FJ8qxQpKQjxzW4n6yN6mKBqxsBD2yTwrTkceg5hxWXkUFlHC9UXzLbuskkym18Km18/V0and8oAD30nXzUxEerz8iEQfSx0ynPjT8jSt607ycz3VzTLn1XJ1tKDLIpDz2/r4cYZYleYVgk9PNkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429417; c=relaxed/simple;
	bh=/x7RNQ4paAZ1jJP4iYdMDnHuWoHMqotTE+4wWGAsvMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DoAdANqJIPULB/H8sbA3rJOFxoTYSebZ6aWfZp2RlHeAbeOvL3fGrxlDgRgd3KQpgjdTWoE0Mg4WTwdiUAJqq2uVmPbzFAqe/KN8AgCtfFzmID5NLMSYqBhNKmjYwSEJGYXoy6aUBf5uHFt+gn8HDEhkfoai1s/JE91UbC6niRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DooqL5Q7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DooqL5Q7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746429413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T+Y9CRSgdg+bLZFzKaq4Mjnbpe4YhoWgbwOQ4rWb/Aw=;
	b=DooqL5Q74XMesn4cOvR2M4kOylMQjN96Bc74VTDmIOqL84aNLoQ4Y8TtQ/vO7WysLrfbrt
	1w06/Ue1VEAaoE5RLATtfVIn7VrO0OTwhIWn6tQ70gzf7yWVesU6p6E3bYbMbpIoBpukYL
	XzNHOfHuGP7s36pOQJLFdADeP6mndgY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-O8Wm15EvNXWDBXfftWRdEg-1; Mon, 05 May 2025 03:16:51 -0400
X-MC-Unique: O8Wm15EvNXWDBXfftWRdEg-1
X-Mimecast-MFC-AGG-ID: O8Wm15EvNXWDBXfftWRdEg_1746429411
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39c2da64df9so1793488f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746429410; x=1747034210;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T+Y9CRSgdg+bLZFzKaq4Mjnbpe4YhoWgbwOQ4rWb/Aw=;
        b=hLceeieQAaHCdDPNDmW74CF+ifGTMBOmrXMrfUgH9vQndoOgdryUQyTCPghhT/IOkn
         JN/M9etUTihvVv2M0wI/czJ1w/XMUWb1rv/+XUJtKGxVn8LcsNlszXrbkLxhvhclhrSh
         T7H7IhxzIxiJWdYIw3/0fKj/kZj2ys9gV1os6hunNq8OhUBnxWmWb/AmEjg8RzJeBtmO
         mHaA4DeSvdBHgY9N7++lg++WTUZXDK3KdCD0wXLi/K9J+U9VoYafFTsWwT9NyzcFUjcV
         sVbSp0DpkJhZc9tyflgLzn+ezPSYDreEmrEkIt7wK9ObtFmS+5sWCzrpwPaHe+cxnvtj
         8ZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW+cID4iCxMrIKVS/C+Hc3m788WW5n3Ckfsbz6SZielVcwfGO/FgJirYNaS+vfnPw3m+s73YqemIsas70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8WORzvaKBkKruObS2/I3nF/nZALZQ6fswLCc6eQ3epobvrC3E
	PKZuBTUF3emUVzK6DKvM02mM1hYJbqVRoFW5MBzPpvOiRlKB7yUTwiCdO8Kedi7S18yE0MVgCwk
	XohEvEMM4OeL9Lt5cHDLd8qIYNjnzoGxaYLNqbak6+eFsR7geviiU50E8NBMc1Q==
X-Gm-Gg: ASbGnctu9yu7nZGoiTMbsLTqRvdjSvMRipvdMSDmTreLmLnQcpHA+ajWi+xk0X4AiES
	/jyo2L7Zo3pYCV7iwYER2WkGiCPsNXC2ioJ6jZMB/vf3xMnMOhGNsVkPTfjBhIMJdNUomSzSAZw
	iDjmxKfzAErDleiXR2aycekdsZ5YvaL2oPFKlattS8+GHEMU3pNDnx5dt/XtD6oPzzfVb2KGfAG
	RWQcM9Mp1wdDvISC3vqkB5F9Hs7jiHwAARJUL7+hIHlwZ5O1tqeRKfnIIOx+F3y+OOlpf4x186B
	YNwMVz6rJVDIOFo/jQ2i5PwJCdQHaEju2J4VMQD92qwMt0lQzv/5RwGPyTRRo0cwOykb6QjzrDX
	YfuMsX1eeKEBG8/PUQVzxSArMjZUOcSdxP7e94k8=
X-Received: by 2002:a5d:5f44:0:b0:39c:1429:fa57 with SMTP id ffacd0b85a97d-3a09fd6dcf7mr5242334f8f.3.1746429410438;
        Mon, 05 May 2025 00:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXSED6oy1mYodyEZMeEJDutKTAvYwWGYE0ppzzZOWq9jPxT+2VT7UH9O/qNIZPl6snH8J1lw==
X-Received: by 2002:a5d:5f44:0:b0:39c:1429:fa57 with SMTP id ffacd0b85a97d-3a09fd6dcf7mr5242305f8f.3.1746429410054;
        Mon, 05 May 2025 00:16:50 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:2400:3be1:a856:724c:fd29? (p200300cbc73d24003be1a856724cfd29.dip0.t-ipconnect.de. [2003:cb:c73d:2400:3be1:a856:724c:fd29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe92sm9613356f8f.68.2025.05.05.00.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:16:49 -0700 (PDT)
Message-ID: <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
Date: Mon, 5 May 2025 09:16:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04.05.25 18:34, Donet Tom wrote:
> 
> On 5/4/25 4:39 PM, Mike Rapoport wrote:
>> On Sat, May 03, 2025 at 11:10:12AM +0530, Donet Tom wrote:
>>> During node device initialization, `memory blocks` are registered under
>>> each NUMA node. The `memory blocks` to be registered are identified using
>>> the node’s start and end PFNs, which are obtained from the node's pg_data
>>>
>>> However, not all PFNs within this range necessarily belong to the same
>>> node—some may belong to other nodes. Additionally, due to the
>>> discontiguous nature of physical memory, certain sections within a
>>> `memory block` may be absent.
>>>
>>> As a result, `memory blocks` that fall between a node’s start and end
>>> PFNs may span across multiple nodes, and some sections within those blocks
>>> may be missing. `Memory blocks` have a fixed size, which is architecture
>>> dependent.
>>>
>>> Due to these considerations, the memory block registration is currently
>>> performed as follows:
>>>
>>> for_each_online_node(nid):
>>>       start_pfn = pgdat->node_start_pfn;
>>>       end_pfn = pgdat->node_start_pfn + node_spanned_pages;
>>>       for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
>>>           mem_blk = memory_block_id(pfn_to_section_nr(pfn));
>>>           pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
>>>           pfn_mb_end = pfn_start + memory_block_pfns - 1
>>>           for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
>>>               if (get_nid_for_pfn(pfn) != nid):
>>>                   continue;
>>>               else
>>>                   do_register_memory_block_under_node(nid, mem_blk,
>>>                                                           MEMINIT_EARLY);
>>>
>>> Here, we derive the start and end PFNs from the node's pg_data, then
>>> determine the memory blocks that may belong to the node. For each
>>> `memory block` in this range, we inspect all PFNs it contains and check
>>> their associated NUMA node ID. If a PFN within the block matches the
>>> current node, the memory block is registered under that node.
>>>
>>> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() performs
>>> a binary search in the `memblock regions` to determine the NUMA node ID
>>> for a given PFN. If it is not enabled, the node ID is retrieved directly
>>> from the struct page.
>>>
>>> On large systems, this process can become time-consuming, especially since
>>> we iterate over each `memory block` and all PFNs within it until a match is
>>> found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
>>> overhead of the binary search increases the execution time significantly,
>>> potentially leading to soft lockups during boot.
>>>
>>> In this patch, we iterate over `memblock region` to identify the
>>> `memory blocks` that belong to the current NUMA node. `memblock regions`
>>> are contiguous memory ranges, each associated with a single NUMA node, and
>>> they do not span across multiple nodes.
>>>
>>> for_each_online_node(nid):
>>>     for_each_memory_region(r): // r => region
>>>       if (r->nid != nid):
>>>         continue;
>>>       else
>>>         for_each_memory_block_between(r->base, r->base + r->size - 1):
>>>           do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
>>>
>>> We iterate over all `memblock regions` and identify those that belong to
>>> the current NUMA node. For each `memblock region` associated with the
>>> current node, we calculate the start and end `memory blocks` based on the
>>> region's start and end PFNs. We then register all `memory blocks` within
>>> that range under the current node.
>>>
>>> Test Results on My system with 32TB RAM
>>> =======================================
>>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>>
>>> Without this patch
>>> ------------------
>>> Startup finished in 1min 16.528s (kernel)
>>>
>>> With this patch
>>> ---------------
>>> Startup finished in 17.236s (kernel) - 78% Improvement
>>>
>>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>>
>>> Without this patch
>>> ------------------
>>> Startup finished in 28.320s (kernel)
>>>
>>> With this patch
>>> ---------------
>>> Startup finished in 15.621s (kernel) - 46% Improvement
>>>
>>> Acked-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>>
>>> ---
>>> v2 -> v3
>>>
>>> Fixed indentation issues, made `start_block_id` and `end_block_id` constants,
>>> and moved variable declarations to the places where they are needed.
>>>
>>> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
>>> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
>>> ---
>>>    drivers/base/memory.c  |  4 ++--
>>>    drivers/base/node.c    | 38 ++++++++++++++++++++++++++++++++++++++
>>>    include/linux/memory.h |  2 ++
>>>    include/linux/node.h   | 11 +++++------
>>>    4 files changed, 47 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>>> index 19469e7f88c2..7f1d266ae593 100644
>>> --- a/drivers/base/memory.c
>>> +++ b/drivers/base/memory.c
>>> @@ -60,7 +60,7 @@ static inline unsigned long pfn_to_block_id(unsigned long pfn)
>>>    	return memory_block_id(pfn_to_section_nr(pfn));
>>>    }
>>>    
>>> -static inline unsigned long phys_to_block_id(unsigned long phys)
>>> +unsigned long phys_to_block_id(unsigned long phys)
>>>    {
>>>    	return pfn_to_block_id(PFN_DOWN(phys));
>>>    }
>>> @@ -632,7 +632,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
>>>     *
>>>     * Called under device_hotplug_lock.
>>>     */
>>> -static struct memory_block *find_memory_block_by_id(unsigned long block_id)
>>> +struct memory_block *find_memory_block_by_id(unsigned long block_id)
>>>    {
>>>    	struct memory_block *mem;
>>>    
>>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>>> index cd13ef287011..0f8a4645b26c 100644
>>> --- a/drivers/base/node.c
>>> +++ b/drivers/base/node.c
>>> @@ -20,6 +20,7 @@
>>>    #include <linux/pm_runtime.h>
>>>    #include <linux/swap.h>
>>>    #include <linux/slab.h>
>>> +#include <linux/memblock.h>
>>>    
>>>    static const struct bus_type node_subsys = {
>>>    	.name = "node",
>>> @@ -850,6 +851,43 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>>>    			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>>>    }
>>>    
>>> +/*
>>> + * register_memory_blocks_under_node_early : Register the memory
>>> + *		  blocks under the current node.
>>> + * @nid : Current node under registration
>>> + *
>>> + * This function iterates over all memblock regions and identifies the regions
>>> + * that belong to the current node. For each region which belongs to current
>>> + * node, it calculates the start and end memory blocks based on the region's
>>> + * start and end PFNs. It then registers all memory blocks within that range
>>> + * under the current node.
>>> + */
>>> +void register_memory_blocks_under_node_early(int nid)
>>> +{
>>> +	struct memblock_region *r;
>>> +
>>> +	for_each_mem_region(r) {
>>> +		if (r->nid != nid)
>>> +			continue;
>>> +
>>> +		const unsigned long start_block_id = phys_to_block_id(r->base);
>>> +		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
>>> +		unsigned long block_id;
>>> +
>>> +		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
>>> +			struct memory_block *mem;
>>> +
>>> +			mem = find_memory_block_by_id(block_id);
>>> +			if (!mem)
>>> +				continue;
>>> +
>>> +			do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
>>> +			put_device(&mem->dev);
>>> +		}
>>> +
>>> +	}
>>> +}
>>> +
>>>    void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>>>    				       unsigned long end_pfn,
>>>    				       enum meminit_context context)
>>> diff --git a/include/linux/memory.h b/include/linux/memory.h
>>> index 12daa6ec7d09..cb8579226536 100644
>>> --- a/include/linux/memory.h
>>> +++ b/include/linux/memory.h
>>> @@ -171,6 +171,8 @@ struct memory_group *memory_group_find_by_id(int mgid);
>>>    typedef int (*walk_memory_groups_func_t)(struct memory_group *, void *);
>>>    int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
>>>    			       struct memory_group *excluded, void *arg);
>>> +unsigned long phys_to_block_id(unsigned long phys);
>>> +struct memory_block *find_memory_block_by_id(unsigned long block_id);
>>>    #define hotplug_memory_notifier(fn, pri) ({		\
>>>    	static __meminitdata struct notifier_block fn##_mem_nb =\
>>>    		{ .notifier_call = fn, .priority = pri };\
>>> diff --git a/include/linux/node.h b/include/linux/node.h
>>> index 2b7517892230..93beefe8f179 100644
>>> --- a/include/linux/node.h
>>> +++ b/include/linux/node.h
>>> @@ -114,12 +114,16 @@ extern struct node *node_devices[];
>>>    void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>>>    				       unsigned long end_pfn,
>>>    				       enum meminit_context context);
>>> +void register_memory_blocks_under_node_early(int nid);
>>>    #else
>>>    static inline void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>>>    						     unsigned long end_pfn,
>>>    						     enum meminit_context context)
>>>    {
>>>    }
>>> +static inline void register_memory_blocks_under_node_early(int nid)
>>> +{
>>> +}
>>>    #endif
>>>    
>>>    extern void unregister_node(struct node *node);
>>> @@ -134,15 +138,10 @@ static inline int register_one_node(int nid)
>>>    	int error = 0;
>>>    
>>>    	if (node_online(nid)) {
>>> -		struct pglist_data *pgdat = NODE_DATA(nid);
>>> -		unsigned long start_pfn = pgdat->node_start_pfn;
>>> -		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
>>> -
>>>    		error = __register_one_node(nid);
>>>    		if (error)
>>>    			return error;
>>> -		register_memory_blocks_under_node(nid, start_pfn, end_pfn,
>>> -						  MEMINIT_EARLY);
>>> +		register_memory_blocks_under_node_early(nid);
>> Does not that change mean that when register_one_node() is called from
>> memory hotplug it will always try to iterate memblock regions?
>> This would be a problem on architectures that don't keep memblock around
>> after boot.
> 
> 
> Hi Mike
> 
> Apologies — I wasn’t aware about CONFIG_ARCH_KEEP_MEMBLOCK.
> Thank you for pointing it out.
> 
> If this configuration is disabled, the current patchset would not function
> correctly, and node device initialization could fail during the hotplug path.

memory hotplug code never calls register_one_node(), unless I am missing 
something.

During add_memory_resource(), we call __try_online_node(nid, false), 
meaning we skip register_one_node().

The only caller of __try_online_node(nid, true) is try_online_node(), 
called from CPU hotplug code, and I *guess* that is not required.

I think the reason is simple: memory hotplug onlines the node before it 
adds any memory. So, there is no memory yet, consequently nothing to 
walk / register.

This whole code could deserve some cleanups. In particular, I am not 
sure if __try_online_node() must ever call register_one_node().

-- 
Cheers,

David / dhildenb

