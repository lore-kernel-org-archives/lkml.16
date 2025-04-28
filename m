Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406501DDC23
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875180; cv=none; b=X1QoAUkmF8aBQR6iCEAovOVdaHPVj3S5Ya+6aoBmZHUn7cXcgFSgeBuylvOe+E69nA7jkxMRhXD5WEOH7DK8vzz08B0Efsx2GJwU3dnSCoEFVb2FMcg0LTUZcraRgshJqWbfpT0lPRDeXAF+PMPaO0v9Y20XUsaVRU6IqvL9OAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875180; c=relaxed/simple;
	bh=9HCZPUGw7K95mrbaLw4ND/oJkXnc3XFOFqciaVpOzks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQHAPrnzTTFk3GmCBvozlfkfPNLpzVlwbpSEpi2LLDUaSOOwkvwXAP7kJX27P3eUfmO/RSXvhdAUwmZIX6KTVWuVyHi9TIzYVuccVAV7+/wR1eBDtKmawR25OANyx0w0ovgKjAzO3r4ycBCbbBElRPAYRXdV+k9d+oFUQ/5xOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z3MYHlo3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z3MYHlo3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745875177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=holDY0Gs1L49s/vEerhi6Olgi48zndWL011WQGLEs9g=;
	b=Z3MYHlo3NsslBhd/h+mQQrEh2KF6qASUgqD+5QsgJOCcZ6l5j6sy+dVk4pLQAGJp9cUhIS
	63To5wMQxhVuLN+nfPyQ0EgEueT42nE7ITEnbPp3ugVksO8PDxGEgc3XAJ+MzDJGsvIWRv
	BhJ/EyhUg7V5NdGRzGwCxMH6N18Qys4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-hcacGt3SP8qeq3Myb-60xA-1; Mon, 28 Apr 2025 17:19:35 -0400
X-MC-Unique: hcacGt3SP8qeq3Myb-60xA-1
X-Mimecast-MFC-AGG-ID: hcacGt3SP8qeq3Myb-60xA_1745875174
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a07a7b4298so1349185f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875174; x=1746479974;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=holDY0Gs1L49s/vEerhi6Olgi48zndWL011WQGLEs9g=;
        b=aaPaM9MQvs7fJpL5wHYqaPw6N/X54oPe3DAgMybSMx1+jV+KAS3ZgfaI6Y8FInSqL8
         vbviw+UVXj0F1l8Qmdaxbq5qMsO2clplY4etQpZe5Ubo7abWpPbqB8koAXcKJJwCu/JZ
         6uVQmqL1g/DKfs6iRzhz1/yX8kDqevu1bRpfpPLWfcpXGr8DpoQLAUMJ22K4EwMyi735
         +z2yfMQWF9TSY7FQinpp+U9G+FI4tZCbn27SaLoqlf78PVFED0lcXy2NuuiwkUbDKd0S
         6fQ5x/hdHfjkc9LeG1uh6K4CoePGa/QNKvnUrvO+sllxITTQNdsokO3R27N6xcqJErRP
         orIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT9Y6SeOKI8qf3GSDhZ2nCyL2T2lfbWoCS5tOtOR1gTIUF5RL4W7hGdiRjnBj5tCyH9vqNE4F1oM4EkP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHkp5eBCAq6qIcGm+k5WmWl72Fia4NreHejRimEa0UJ0HBkmi
	ovfT/1SMF1RS7IuISZpojIKRZt/5ho/PeNzt3LV4TfetU7/wleEWyx32GIlVjLDbsqeryevjiMH
	G4BHeCulKYWNB+dx3tO7LtB3RUd7C2syZhd/P9WHtU/zkm2OQZKoRIRalA1Gc/g==
X-Gm-Gg: ASbGncughH8+e/zVAUQq5tnoo1ehiqkG+K+EYwY0BasA8/EZl34re1xgrYafWgDFBBG
	AcWdUuziktNYzJlTNcCRzZ5uRAJmkpGwPBftqU5kAzf0wYF9I3GJGPgkYLiVSu6LfhX2zpgcyT+
	nQsGDV6tmEEP3mtfIcgXNVOsNrR9mwzeIaeBQm3oAg81SmkL6Rmx4dJ9H73dcO/L+Mc139Z1d5T
	XBpQ1So2Dqlfg8zpppaqpr3F2YoWIFi+QgksMMYSVZT3sIzXmjkf7+/YaQc26UxzboSCTcpn411
	E6VXFvAIR0w7isdCX1clbXlOG2XMs7dqQhmAySL7Qg==
X-Received: by 2002:a05:6000:22c5:b0:3a0:8a1c:ef0 with SMTP id ffacd0b85a97d-3a08ad3be40mr188580f8f.24.1745875174364;
        Mon, 28 Apr 2025 14:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX95i6nnVvl2x38H1rjq/DYXCJ9md3+GDJ/8L0xaeGk4KtoplJJwLhLdSRAgr0zZlncIWOiw==
X-Received: by 2002:a05:6000:22c5:b0:3a0:8a1c:ef0 with SMTP id ffacd0b85a97d-3a08ad3be40mr188569f8f.24.1745875173919;
        Mon, 28 Apr 2025 14:19:33 -0700 (PDT)
Received: from [192.168.3.141] (p4ff23ddd.dip0.t-ipconnect.de. [79.242.61.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2ac0sm168280885e9.15.2025.04.28.14.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:19:33 -0700 (PDT)
Message-ID: <da9c6b2f-5b4b-444c-a453-cf72272c2fb7@redhat.com>
Date: Mon, 28 Apr 2025 23:19:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] driver/base: Optimize memory block registration to
 reduce boot time
To: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28.04.25 19:03, Donet Tom wrote:
> During node device initialization, `memory blocks` are registered under
> each NUMA node. The `memory blocks` to be registered are identified using
> the node’s start and end PFNs, which are obtained from the node's pg_data
> 
> However, not all PFNs within this range necessarily belong to the same
> node—some may belong to other nodes. Additionally, due to the
> discontiguous nature of physical memory, certain sections within a
> `memory block` may be absent.> 
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

Yes, makes sense.

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

Wow!

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

Also very nice!

> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
> 
> v1->v2
> 
> Reworked the implementation according to suggestions from
> Mike Rapoport[1]
> 
> [1] - https://lore.kernel.org/all/Z_j2Gv9n4DOj6LSs@kernel.org/
> 
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> ---
>   drivers/base/memory.c  |  4 ++--
>   drivers/base/node.c    | 39 +++++++++++++++++++++++++++++++++++++++
>   include/linux/memory.h |  2 ++
>   include/linux/node.h   | 11 +++++------
>   4 files changed, 48 insertions(+), 8 deletions(-)
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
> index cd13ef287011..4869333d366d 100644
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
> @@ -850,6 +851,44 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
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
> + *
> + */
> +void register_memory_blocks_under_node_early(int nid)
> +{
> +	struct memblock_region *r;

You almost achieved a reverse x-mas tree :)

> +	unsigned long start_block_id;
> +	unsigned long end_block_id;
> +	struct memory_block *mem;
> +	unsigned long block_id;
> +
> +	for_each_mem_region(r) {
> +		if (r->nid == nid) {

To reduce indentation

if (r->nid != nid)
	continue;

> +			start_block_id = phys_to_block_id(r->base);
> +			end_block_id = phys_to_block_id(r->base + r->size - 1);

Probably you could make them const in the for loop

	const unsigned long start_block_id = phys_to_block_id(r->base);
	const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);

Okay, so end is inclusive as well.

> +
> +			for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
> +				mem = find_memory_block_by_id(block_id);
> +				if (!mem)
> +					continue;
> +
> +				do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);

-- 
Cheers,

David / dhildenb

