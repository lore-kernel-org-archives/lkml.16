Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB214F70
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746356962; cv=none; b=pca2garoVYWDKu4xgtofILWSnmTLlSZNaeyfJHu2mGifONaCI7GRbCSzaG6eKVi1SAx/H0bDpYNWajnE7tucP7wHrmxAwTcKHyaQpjBo+NOAdD9wy5MnOPucF/eWMCte15Gm79Tib9ymf6dbq92pcLN6VMQTsju7M4pkQbMZnyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746356962; c=relaxed/simple;
	bh=cy53ThJnkCDaMJgQ055ps47ch/XTPqto9UYPXZizdlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9ku4vzuVBspaEAjwr6ZBB3z1XoWFgLnGjES6j30sSCg0mnSR/Jjl9CGVZaHxudd6/HT/4QRWmkCEEeMjr70VLzq0eTR/IBr1ALn+0nAlJbR2F6ybZlFjMXfNbUvgF6L7hIbCK1/OR7dHvmf4Yi9vXk49hNsxPfbsXE4ZldCrGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPte1lAn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPte1lAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E15BC4CEE7;
	Sun,  4 May 2025 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746356961;
	bh=cy53ThJnkCDaMJgQ055ps47ch/XTPqto9UYPXZizdlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPte1lAnS27cxeIYbvOKvsumsxykBguHsByHWGdh7XJ7hVSZVEa+UNLMLwQMUnGHE
	 Jv1LJD26++VA4p13BHrz6Vmqdy/qzaI0twmxYBG3o09G9UQJkNAw8dTJp+qKByfKET
	 q2fa9D5tb1Y/tfkrX/VR+MhntHzL+rwdXQi4/u7MCrJwymHPfwMnTxyza0DN41vM8L
	 shN2rThh8q4gKy/og9l3n6+rZ0zd4ehfYBHJuNym5J7halY4t+T9XTvQt5vWJuFLyj
	 Bkn8GXCkVfXWTur2HG4W2GQcnVLsOHobjPhHCfVevcCZtT3pjquT88h3P2Vld9Qdmg
	 wysPSn0YFC2AQ==
Date: Sun, 4 May 2025 14:09:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <aBdK2EIMYYRmmEwA@kernel.org>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>

On Sat, May 03, 2025 at 11:10:12AM +0530, Donet Tom wrote:
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
>     start_pfn = pgdat->node_start_pfn;
>     end_pfn = pgdat->node_start_pfn + node_spanned_pages;
>     for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
>         mem_blk = memory_block_id(pfn_to_section_nr(pfn));
>         pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
>         pfn_mb_end = pfn_start + memory_block_pfns - 1
>         for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
>             if (get_nid_for_pfn(pfn) != nid):
>                 continue;
>             else
>                 do_register_memory_block_under_node(nid, mem_blk,
>                                                         MEMINIT_EARLY);
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
>   for_each_memory_region(r): // r => region
>     if (r->nid != nid):
>       continue;
>     else
>       for_each_memory_block_between(r->base, r->base + r->size - 1):
>         do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
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
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> 
> ---
> v2 -> v3
> 
> Fixed indentation issues, made `start_block_id` and `end_block_id` constants,
> and moved variable declarations to the places where they are needed.
> 
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> ---
>  drivers/base/memory.c  |  4 ++--
>  drivers/base/node.c    | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/memory.h |  2 ++
>  include/linux/node.h   | 11 +++++------
>  4 files changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 19469e7f88c2..7f1d266ae593 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -60,7 +60,7 @@ static inline unsigned long pfn_to_block_id(unsigned long pfn)
>  	return memory_block_id(pfn_to_section_nr(pfn));
>  }
>  
> -static inline unsigned long phys_to_block_id(unsigned long phys)
> +unsigned long phys_to_block_id(unsigned long phys)
>  {
>  	return pfn_to_block_id(PFN_DOWN(phys));
>  }
> @@ -632,7 +632,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
>   *
>   * Called under device_hotplug_lock.
>   */
> -static struct memory_block *find_memory_block_by_id(unsigned long block_id)
> +struct memory_block *find_memory_block_by_id(unsigned long block_id)
>  {
>  	struct memory_block *mem;
>  
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index cd13ef287011..0f8a4645b26c 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -20,6 +20,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/swap.h>
>  #include <linux/slab.h>
> +#include <linux/memblock.h>
>  
>  static const struct bus_type node_subsys = {
>  	.name = "node",
> @@ -850,6 +851,43 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>  			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>  }
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
> +void register_memory_blocks_under_node_early(int nid)
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
>  void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>  				       unsigned long end_pfn,
>  				       enum meminit_context context)
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 12daa6ec7d09..cb8579226536 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -171,6 +171,8 @@ struct memory_group *memory_group_find_by_id(int mgid);
>  typedef int (*walk_memory_groups_func_t)(struct memory_group *, void *);
>  int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
>  			       struct memory_group *excluded, void *arg);
> +unsigned long phys_to_block_id(unsigned long phys);
> +struct memory_block *find_memory_block_by_id(unsigned long block_id);
>  #define hotplug_memory_notifier(fn, pri) ({		\
>  	static __meminitdata struct notifier_block fn##_mem_nb =\
>  		{ .notifier_call = fn, .priority = pri };\
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 2b7517892230..93beefe8f179 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -114,12 +114,16 @@ extern struct node *node_devices[];
>  void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>  				       unsigned long end_pfn,
>  				       enum meminit_context context);
> +void register_memory_blocks_under_node_early(int nid);
>  #else
>  static inline void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>  						     unsigned long end_pfn,
>  						     enum meminit_context context)
>  {
>  }
> +static inline void register_memory_blocks_under_node_early(int nid)
> +{
> +}
>  #endif
>  
>  extern void unregister_node(struct node *node);
> @@ -134,15 +138,10 @@ static inline int register_one_node(int nid)
>  	int error = 0;
>  
>  	if (node_online(nid)) {
> -		struct pglist_data *pgdat = NODE_DATA(nid);
> -		unsigned long start_pfn = pgdat->node_start_pfn;
> -		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
> -
>  		error = __register_one_node(nid);
>  		if (error)
>  			return error;
> -		register_memory_blocks_under_node(nid, start_pfn, end_pfn,
> -						  MEMINIT_EARLY);
> +		register_memory_blocks_under_node_early(nid);

Does not that change mean that when register_one_node() is called from
memory hotplug it will always try to iterate memblock regions?
This would be a problem on architectures that don't keep memblock around
after boot.

I thought that the for_each_mem_region() loop should be in node_dev_init()
when we know for sure that memblock is available.

>  	}
>  
>  	return error;
> -- 
> 2.48.1
> 

-- 
Sincerely yours,
Mike.
