Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD00B381C4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390160; cv=none; b=owngbI/E1dKvAmlHwX0aZ4RM9mq4DW0YB+KZKNmksw+t8zkBrQiz8S6heUvyh7d3PxxesLgZMjeapLrmIXyrku3XdcMqPbOZsoabJ8qm4eSPBE4gsQvn+l2z/AQoLMl/4Z22FKPyBTgicjodlG2+Qs8URej/rpNbxtTShIlBp9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390160; c=relaxed/simple;
	bh=kVrshvKd5nIGlIZNHziZvog4XCiYuAiPq6I8gahwiEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1+e57BJ0nZAnE6KbCzts9CXmy7U/Q9XZ8hotJvOTyI7gcnXgm9arQut6YJLk7jo6lNkiam98NhWWIGj5QtsDSAkTRdUgDwI26rR5V1mQ7ziN83A0XL7zdZdP9kRBoYXqNMRy5QCDiIKk7h5r1MiWdmkTxZlX1+gDYW6xJ5pi7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JclQu3wy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JclQu3wy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DED7C4CEE4;
	Fri, 16 May 2025 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747390160;
	bh=kVrshvKd5nIGlIZNHziZvog4XCiYuAiPq6I8gahwiEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JclQu3wyPQQOHXxgoHQ5xk6HV92AJrnQZodvFirKBkH58nLBk7XsHL3JOjSsmEB7h
	 Q9bx0Zugk9bMqMfUC8Ed8SCoA/LrVaI/X6UEZpaPWluYsNg8kDoEx3lS1IcybduWbO
	 HHCnz9+qZV6FjDso2b8CLHLyEEiqtgk5zM0gwmqiEJh2NtZQFWtlCrgdAhMIFRFha0
	 82GBZfZRXdmZKZUOd4ASWG5zUmpCh6Jtym7EM1COEm4eTWGlVZsC+mxxT2qwAufe28
	 Ivp0zxO+9fXIpBko2n1wJ4PBgb6K8nIg2pPBQox4NO6/vgARCQQe66yCZreecLulei
	 6DZWfKArkHhUw==
Date: Fri, 16 May 2025 13:09:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Donet Tom <donettom@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v4 1/4] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <aCcOx34j5mgiwfcx@kernel.org>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <56cb2494-56ba-4895-9dd1-23243c2eecdb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56cb2494-56ba-4895-9dd1-23243c2eecdb@redhat.com>

On Fri, May 16, 2025 at 11:15:29AM +0200, David Hildenbrand wrote:
> On 16.05.25 10:19, Donet Tom wrote:
> > During node device initialization, `memory blocks` are registered under
> > each NUMA node. The `memory blocks` to be registered are identified using
> > the node’s start and end PFNs, which are obtained from the node's pg_data
> > 
> > However, not all PFNs within this range necessarily belong to the same
> > node—some may belong to other nodes. Additionally, due to the
> > discontiguous nature of physical memory, certain sections within a
> > `memory block` may be absent.
> > 
> > As a result, `memory blocks` that fall between a node’s start and end
> > PFNs may span across multiple nodes, and some sections within those blocks
> > may be missing. `Memory blocks` have a fixed size, which is architecture
> > dependent.
> > 
> > Due to these considerations, the memory block registration is currently
> > performed as follows:
> > 
> > for_each_online_node(nid):
> >      start_pfn = pgdat->node_start_pfn;
> >      end_pfn = pgdat->node_start_pfn + node_spanned_pages;
> >      for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
> >          mem_blk = memory_block_id(pfn_to_section_nr(pfn));
> >          pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
> >          pfn_mb_end = pfn_start + memory_block_pfns - 1
> >          for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
> >              if (get_nid_for_pfn(pfn) != nid):
> >                  continue;
> >              else
> >                  do_register_memory_block_under_node(nid, mem_blk,
> >                                                          MEMINIT_EARLY);
> > 
> > Here, we derive the start and end PFNs from the node's pg_data, then
> > determine the memory blocks that may belong to the node. For each
> > `memory block` in this range, we inspect all PFNs it contains and check
> > their associated NUMA node ID. If a PFN within the block matches the
> > current node, the memory block is registered under that node.
> > 
> > If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() performs
> > a binary search in the `memblock regions` to determine the NUMA node ID
> > for a given PFN. If it is not enabled, the node ID is retrieved directly
> > from the struct page.
> > 
> > On large systems, this process can become time-consuming, especially since
> > we iterate over each `memory block` and all PFNs within it until a match is
> > found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
> > overhead of the binary search increases the execution time significantly,
> > potentially leading to soft lockups during boot.
> > 
> > In this patch, we iterate over `memblock region` to identify the
> > `memory blocks` that belong to the current NUMA node. `memblock regions`
> > are contiguous memory ranges, each associated with a single NUMA node, and
> > they do not span across multiple nodes.
> > 
> > for_each_online_node(nid):
> >    for_each_memory_region(r): // r => region
> >      if (r->nid != nid):
> >        continue;
> >      else
> >        for_each_memory_block_between(r->base, r->base + r->size - 1):
> >          do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
> > 
> > We iterate over all `memblock regions` and identify those that belong to
> > the current NUMA node. For each `memblock region` associated with the
> > current node, we calculate the start and end `memory blocks` based on the
> > region's start and end PFNs. We then register all `memory blocks` within
> > that range under the current node.
> > 
> > Test Results on My system with 32TB RAM
> > =======================================
> > 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
> > 
> > Without this patch
> > ------------------
> > Startup finished in 1min 16.528s (kernel)
> > 
> > With this patch
> > ---------------
> > Startup finished in 17.236s (kernel) - 78% Improvement
> > 
> > 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
> > 
> > Without this patch
> > ------------------
> > Startup finished in 28.320s (kernel)
> > 
> > With this patch
> > ---------------
> > Startup finished in 15.621s (kernel) - 46% Improvement
> > 
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> > 
> > ---
> > v3 -> v4
> > 
> > Addressed Mike's comment by making node_dev_init() call __register_one_node().
> > 
> > V3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
> > v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
> > v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> > ---
> >   drivers/base/memory.c  |  4 ++--
> >   drivers/base/node.c    | 41 ++++++++++++++++++++++++++++++++++++++++-
> >   include/linux/memory.h |  2 ++
> >   include/linux/node.h   |  3 +++
> >   4 files changed, 47 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> > index 19469e7f88c2..7f1d266ae593 100644
> > --- a/drivers/base/memory.c
> > +++ b/drivers/base/memory.c
> > @@ -60,7 +60,7 @@ static inline unsigned long pfn_to_block_id(unsigned long pfn)
> >   	return memory_block_id(pfn_to_section_nr(pfn));
> >   }
> > -static inline unsigned long phys_to_block_id(unsigned long phys)
> > +unsigned long phys_to_block_id(unsigned long phys)
> >   {
> >   	return pfn_to_block_id(PFN_DOWN(phys));
> >   }
> 
> 
> I was wondering whether we should move all these helpers into a header, and
> export sections_per_block instead. Probably doesn't really matter for your
> use case.
> 
> > @@ -632,7 +632,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
> >    *
> >    * Called under device_hotplug_lock.
> >    */
> > -static struct memory_block *find_memory_block_by_id(unsigned long block_id)
> > +struct memory_block *find_memory_block_by_id(unsigned long block_id)
> >   {
> >   	struct memory_block *mem;
> > diff --git a/drivers/base/node.c b/drivers/base/node.c
> > index cd13ef287011..f8cafd8c8fb1 100644
> > --- a/drivers/base/node.c
> > +++ b/drivers/base/node.c
> > @@ -20,6 +20,7 @@
> >   #include <linux/pm_runtime.h>
> >   #include <linux/swap.h>
> >   #include <linux/slab.h>
> > +#include <linux/memblock.h>
> >   static const struct bus_type node_subsys = {
> >   	.name = "node",
> > @@ -850,6 +851,43 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
> >   			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
> >   }
> > +/*
> > + * register_memory_blocks_under_node_early : Register the memory
> > + *		  blocks under the current node.
> > + * @nid : Current node under registration
> > + *
> > + * This function iterates over all memblock regions and identifies the regions
> > + * that belong to the current node. For each region which belongs to current
> > + * node, it calculates the start and end memory blocks based on the region's
> > + * start and end PFNs. It then registers all memory blocks within that range
> > + * under the current node.
> > + */
> > +static void register_memory_blocks_under_node_early(int nid)
> > +{
> > +	struct memblock_region *r;
> > +
> > +	for_each_mem_region(r) {
> > +		if (r->nid != nid)
> > +			continue;
> > +
> > +		const unsigned long start_block_id = phys_to_block_id(r->base);
> > +		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
> > +		unsigned long block_id;
> 
> This should definitely be above the if().
> 
> > +
> > +		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
> > +			struct memory_block *mem;
> > +
> > +			mem = find_memory_block_by_id(block_id);
> > +			if (!mem)
> > +				continue;
> > +
> > +			do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
> > +			put_device(&mem->dev);
> > +		}
> > +
> > +	}
> > +}
> > +
> >   void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
> >   				       unsigned long end_pfn,
> >   				       enum meminit_context context)
> > @@ -974,8 +1012,9 @@ void __init node_dev_init(void)
> >   	 * to applicable memory block devices and already created cpu devices.
> >   	 */
> >   	for_each_online_node(i) {
> > -		ret = register_one_node(i);
> > +		ret =  __register_one_node(i);
> >   		if (ret)
> >   			panic("%s() failed to add node: %d\n", __func__, ret);
> > +		register_memory_blocks_under_node_early(i);
> >   	}
> 
> In general, LGTM.
> 
> 
> BUT :)
> 
> I was wondering whether having a register_memory_blocks_early() call *after*
> the for_each_online_node(), and walking all memory regions only once would
> make a difference.

I don't know how many nodes there should be to see measurable performance
difference, but having register_memory_blocks_under_node_early() after
for_each_online_node() is definitely nicer. 
There's no real need to run for_each_mem_region() for every online node.
 
> We'd have to be smart about memory blocks that fall into multiple regions,
> but it should be a corner case and doable.

This is a corner case that should be handled regardless of the loop order.
And I don't think it's handled today at all.

If we have a block that crosses node boundaries, current implementation of
register_mem_block_under_node_early() will register it under the first
node.
 
> OTOH, we usually don't expect having a lot of regions, so iterating over
> them is probably not a big bottleneck? Anyhow, just wanted to raise it.

There would be at least a region per node and having 

for_each_online_node()
	for_each_mem_region()

makes the loop O(n²) for no good reason.
 
> -- 
> Cheers,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.
