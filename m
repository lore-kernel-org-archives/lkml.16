Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C444615530C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386938; cv=none; b=pDJ/WfBpKCsmfdeAH8YsQZT5ABruFp7UfGlJzI7entbX5Uihmcgs0NsRra7rKbeEkqJfQuoyrgX+oLtRT7V/LnivrTXeqjoBIKlmLmFobd7nruM4CgZh8f9fd251n1vBhvwmZaTrM4kDxB5t77NwohpmDENcWVox70dMf+Fbr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386938; c=relaxed/simple;
	bh=uyX06JxKATGNl1PKiE+wP8pVXMWg9EUWU0gAutKkGSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfZgmrDFr4tDw5q6B8puT/Aat9aYVekR8KHUyKjf/NFI7RZDynuvNGE68g8PXWupbChNCkwFAxG2ZVKFGmnHgyB8lY+eyRZg38fNmyaQjZk2l/+TtWpn/2Nh/UreldDn+s8UfH28Sc8z6SH6en5bDapjtzoGe1uuRZQX8dVvONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4+uc1Wc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4+uc1Wc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747386935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XTbK9sRTvm5odFejfLW2HZKsOm6kL8K30eqDX3kjZGs=;
	b=E4+uc1WclIMN4aRJgf2zxSrWdmxIZYNxeWhbijDqVci513FJJcijjema7XQwFIXQlmlyKd
	BwgPlVXtYiZGr+BJ25qu7wjl3v64lqT1+Kl28A4vo0niEzuhLvV1yERTK8WzEYpHUrnBiI
	/QiLL5PUDSH+JbCbiRqmlzXpL/UFBa0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-KurQnN3aP0GJU_2W74iPvg-1; Fri, 16 May 2025 05:15:34 -0400
X-MC-Unique: KurQnN3aP0GJU_2W74iPvg-1
X-Mimecast-MFC-AGG-ID: KurQnN3aP0GJU_2W74iPvg_1747386933
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso14680725e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386933; x=1747991733;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XTbK9sRTvm5odFejfLW2HZKsOm6kL8K30eqDX3kjZGs=;
        b=sf3T3i606488/dWP/bHqcr6btEvuWOsedgEkt2iB9KEHonjiHhhOMRIqN/RlXJdaX/
         PqkWi2BOkXJS77YKC7jVs+iOHV0Sz/GPTvAvutqpQ2Qqh2+IlxVgRxap6DsuS2LKe+J1
         Bh5UswADsY4pf/2zH2IieZzpJeWHh9B2xIzRmsq36+BZGg28bxXpDiRh0qgnUjedxkmL
         SUoVblLHeDUt24oRoVQG0ZVCsdJeQqrhoSvzyaVVarwMBEkQznqjYfC2V+wYDiKKMrho
         HYODiYJHAq125nI5ZmmYgm/k7X5tztQOHydMiQgqAI62IvRw+EqzPZLblPcQU1mF1/lJ
         vsqg==
X-Forwarded-Encrypted: i=1; AJvYcCUuk9zZic9X5ALWexVGwhH0ETDGfj9X45GeXu+A/Lh1eVxiCminjKEVFK1h+bEltLs7fFS9ysuW1s68Pwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzakXRd+WUWZ3amBSq9ahs/hWqvp7FQ//9b8TB6swhUizpqXFnQ
	SrWLEL1dE/QlImVTBOwKHI0d+gorpl5P5Rz0pwxy5U70/+TohoWbS7UkgzMKr31l+Ivb0ScYUII
	2uACVv/ndModis+gr8yCgkMOZjDcR5u68BWUYyB6ProTIduUEDRFfwDIQ20Yk807Vcg==
X-Gm-Gg: ASbGncvMsOug1pIJtbdZXrHqUrGzKXvd5Js9mET9x1s0Kn31HFw4jD9azQ2HCSlrK54
	2H/7eyS8wYTPkn6Ce7VfTrqT1cIADPSPXSEDCNvGg+IxoGLMjaQaGfiSPZgz9FdRuAWHCbdqROn
	MrOMuQDCamtuzf+gPKCFvnOKkBqAr96txjUN61kJJnLi3txwhye508fjJfipWT+qsTprkeaasiE
	BLl0rCV7NGT0ZuKBIIwCUx3G/hBb6cylhTjcA9WoX+AhjTdpqjF8MrE6DQWSJADFZ96tExKx52L
	IYcXZQwjh8xvXMqGYeEoVVeUnbI69Q8i957lKJoQ9ioXrb4fJBRs4cnoTWZGCcjb4aWRLKXF1ot
	2OM50fFmh7s/Xjs7KE5pNfV+4Fu1FgytK+w20doU=
X-Received: by 2002:a05:600c:45cf:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-442fd610128mr27946425e9.12.1747386932456;
        Fri, 16 May 2025 02:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHewVXndYMAl7vT2uSTeXW5dISsVPfMpYHcvE30hivF1T4Kr2bsukuLGj1OaN42mn82FqnSiQ==
X-Received: by 2002:a05:600c:45cf:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-442fd610128mr27946035e9.12.1747386931981;
        Fri, 16 May 2025 02:15:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f47:4700:e6f9:f453:9ece:7602? (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef8bbsm101068845e9.37.2025.05.16.02.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:15:31 -0700 (PDT)
Message-ID: <56cb2494-56ba-4895-9dd1-23243c2eecdb@redhat.com>
Date: Fri, 16 May 2025 11:15:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] driver/base: Optimize memory block registration to
 reduce boot time
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.05.25 10:19, Donet Tom wrote:
> During node device initialization, `memory blocks` are registered under
> each NUMA node. The `memory blocks` to be registered are identified using
> the node’s start and end PFNs, which are obtained from the node's pg_data
> 
> However, not all PFNs within this range necessarily belong to the same
> node—some may belong to other nodes. Additionally, due to the
> discontiguous nature of physical memory, certain sections within a
> `memory block` may be absent.
> 
> As a result, `memory blocks` that fall between a node’s start and end
> PFNs may span across multiple nodes, and some sections within those blocks
> may be missing. `Memory blocks` have a fixed size, which is architecture
> dependent.
> 
> Due to these considerations, the memory block registration is currently
> performed as follows:
> 
> for_each_online_node(nid):
>      start_pfn = pgdat->node_start_pfn;
>      end_pfn = pgdat->node_start_pfn + node_spanned_pages;
>      for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
>          mem_blk = memory_block_id(pfn_to_section_nr(pfn));
>          pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
>          pfn_mb_end = pfn_start + memory_block_pfns - 1
>          for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
>              if (get_nid_for_pfn(pfn) != nid):
>                  continue;
>              else
>                  do_register_memory_block_under_node(nid, mem_blk,
>                                                          MEMINIT_EARLY);
> 
> Here, we derive the start and end PFNs from the node's pg_data, then
> determine the memory blocks that may belong to the node. For each
> `memory block` in this range, we inspect all PFNs it contains and check
> their associated NUMA node ID. If a PFN within the block matches the
> current node, the memory block is registered under that node.
> 
> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() performs
> a binary search in the `memblock regions` to determine the NUMA node ID
> for a given PFN. If it is not enabled, the node ID is retrieved directly
> from the struct page.
> 
> On large systems, this process can become time-consuming, especially since
> we iterate over each `memory block` and all PFNs within it until a match is
> found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
> overhead of the binary search increases the execution time significantly,
> potentially leading to soft lockups during boot.
> 
> In this patch, we iterate over `memblock region` to identify the
> `memory blocks` that belong to the current NUMA node. `memblock regions`
> are contiguous memory ranges, each associated with a single NUMA node, and
> they do not span across multiple nodes.
> 
> for_each_online_node(nid):
>    for_each_memory_region(r): // r => region
>      if (r->nid != nid):
>        continue;
>      else
>        for_each_memory_block_between(r->base, r->base + r->size - 1):
>          do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
> 
> We iterate over all `memblock regions` and identify those that belong to
> the current NUMA node. For each `memblock region` associated with the
> current node, we calculate the start and end `memory blocks` based on the
> region's start and end PFNs. We then register all `memory blocks` within
> that range under the current node.
> 
> Test Results on My system with 32TB RAM
> =======================================
> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
> 
> Without this patch
> ------------------
> Startup finished in 1min 16.528s (kernel)
> 
> With this patch
> ---------------
> Startup finished in 17.236s (kernel) - 78% Improvement
> 
> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
> 
> Without this patch
> ------------------
> Startup finished in 28.320s (kernel)
> 
> With this patch
> ---------------
> Startup finished in 15.621s (kernel) - 46% Improvement
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> 
> ---
> v3 -> v4
> 
> Addressed Mike's comment by making node_dev_init() call __register_one_node().
> 
> V3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> ---
>   drivers/base/memory.c  |  4 ++--
>   drivers/base/node.c    | 41 ++++++++++++++++++++++++++++++++++++++++-
>   include/linux/memory.h |  2 ++
>   include/linux/node.h   |  3 +++
>   4 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 19469e7f88c2..7f1d266ae593 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -60,7 +60,7 @@ static inline unsigned long pfn_to_block_id(unsigned long pfn)
>   	return memory_block_id(pfn_to_section_nr(pfn));
>   }
>   
> -static inline unsigned long phys_to_block_id(unsigned long phys)
> +unsigned long phys_to_block_id(unsigned long phys)
>   {
>   	return pfn_to_block_id(PFN_DOWN(phys));
>   }


I was wondering whether we should move all these helpers into a header, 
and export sections_per_block instead. Probably doesn't really matter 
for your use case.

> @@ -632,7 +632,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
>    *
>    * Called under device_hotplug_lock.
>    */
> -static struct memory_block *find_memory_block_by_id(unsigned long block_id)
> +struct memory_block *find_memory_block_by_id(unsigned long block_id)
>   {
>   	struct memory_block *mem;
>   
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index cd13ef287011..f8cafd8c8fb1 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -20,6 +20,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/swap.h>
>   #include <linux/slab.h>
> +#include <linux/memblock.h>
>   
>   static const struct bus_type node_subsys = {
>   	.name = "node",
> @@ -850,6 +851,43 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>   			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>   }
>   
> +/*
> + * register_memory_blocks_under_node_early : Register the memory
> + *		  blocks under the current node.
> + * @nid : Current node under registration
> + *
> + * This function iterates over all memblock regions and identifies the regions
> + * that belong to the current node. For each region which belongs to current
> + * node, it calculates the start and end memory blocks based on the region's
> + * start and end PFNs. It then registers all memory blocks within that range
> + * under the current node.
> + */
> +static void register_memory_blocks_under_node_early(int nid)
> +{
> +	struct memblock_region *r;
> +
> +	for_each_mem_region(r) {
> +		if (r->nid != nid)
> +			continue;
> +
> +		const unsigned long start_block_id = phys_to_block_id(r->base);
> +		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
> +		unsigned long block_id;

This should definitely be above the if().

> +
> +		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
> +			struct memory_block *mem;
> +
> +			mem = find_memory_block_by_id(block_id);
> +			if (!mem)
> +				continue;
> +
> +			do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
> +			put_device(&mem->dev);
> +		}
> +
> +	}
> +}
> +
>   void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>   				       unsigned long end_pfn,
>   				       enum meminit_context context)
> @@ -974,8 +1012,9 @@ void __init node_dev_init(void)
>   	 * to applicable memory block devices and already created cpu devices.
>   	 */
>   	for_each_online_node(i) {
> -		ret = register_one_node(i);
> +		ret =  __register_one_node(i);
>   		if (ret)
>   			panic("%s() failed to add node: %d\n", __func__, ret);
> +		register_memory_blocks_under_node_early(i);
>   	}

In general, LGTM.


BUT :)

I was wondering whether having a register_memory_blocks_early() call 
*after* the for_each_online_node(), and walking all memory regions only 
once would make a difference.

We'd have to be smart about memory blocks that fall into multiple 
regions, but it should be a corner case and doable.

OTOH, we usually don't expect having a lot of regions, so iterating over 
them is probably not a big bottleneck? Anyhow, just wanted to raise it.

-- 
Cheers,

David / dhildenb

