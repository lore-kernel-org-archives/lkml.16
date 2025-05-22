Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7411C3306
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910228; cv=none; b=dY4O89m3HS4jFgqUOs/c2nw0m4EH297ZEqor4oh+/LNibwZWOQ+QF3yEu5F0MzrFp4n+JLyDbf7Jsb92tkMG6awc74Aqr/JdQsiMavG7swOq4fUCoJmNFWY/blExhEYKlRYqumrFv+9khDbMc84zb6XnrNfcvJFkOUVIosXMnqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910228; c=relaxed/simple;
	bh=R9eVqf3ocvCkF7oOCf8M5BDeTpo98BblFckyQ7qS2kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgqyLRqlkCeoELtJMVgaFOSvI1MUk5u7HT0pV9W9No0PstFMro2XYbyYY3KIj0Uv0Lpd/EwMJ+F+bBLNFKret8YX/PuxPxfrElUIzC26euf5/IO6rtkcL+H9u6H49En/opNMibosLOxLnPk0xdb8eTd+DL8cqvs16Tyx5vj2JHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aac2C0Lt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aac2C0Lt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB7DC4CEE4;
	Thu, 22 May 2025 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747910227;
	bh=R9eVqf3ocvCkF7oOCf8M5BDeTpo98BblFckyQ7qS2kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aac2C0Lt3lj5HVNfQYo6I80TuK7F4iSkB0eCFTAyoNlhkitkBv9prcjDBXue3ONYj
	 0C0WT6Nxxu/+2FudCFt66w3Tc1jwzlXjgm97/yKG7XMhrcGKCuXRbYJ1sWWYEkBCi7
	 0TFFZHZ+64RLI9DZSG4FQY8NfLOXTH0gAZnND/GnHEdHb7JIbd7mTm+y3iRmerMf2t
	 B6zNMzh0bQi8uuSIGwDgsfQlgxQB/8ryyvAQHM7/wOOt28SLJBpBJydRjtnNLAWOJt
	 ObVABYHvdXQBE/poi40J0T7cn8zaCUzLhiswWfKkg0xZtW6JT/Ye7JSgUYF6vnlSUA
	 6KWN2cxvFqSdg==
Date: Thu, 22 May 2025 13:36:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v5 1/4] drivers/base/node: Optimize memory block
 registration to reduce boot time
Message-ID: <aC7-S0EXnbGP3UNU@kernel.org>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>

On Thu, May 22, 2025 at 04:17:28AM -0500, Donet Tom wrote:
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
> for_each_memory_region(r): // r => region
>   if (!node_online(r->nid)):
>     continue;
>   else
>     for_each_memory_block_between(r->base, r->base + r->size - 1):
>       do_register_memory_block_under_node(r->nid, mem_blk, MEMINIT_EARLY);
> 
> We iterate over all memblock regions, and if the node associated with the
> region is online, we calculate the start and end memory blocks based on the
> region's start and end PFNs. We then register all the memory blocks within
> that range under the region node.
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
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> 
> ---
> v4 -> v5
> 
> 1. Moved all helpers(memory_block_id(), pfn_to_block_id(), and phys_to_block_id())
>    into memory.h and exported sections_per_block.
> 2. register_memory_blocks_early() moved out of for_each_online_node().
>    Now we iterate over all memory regions at once and register the
>    memory blocks.
> 
>    Tested corner cases where memory blocks span across multiple memblock regions; it
>    is working fine.
> 
>    #cd /sys/devices/system/node/
>    # find node1/  |grep memory0
>    node1/memory0
>    # find node0/  |grep memory0
>    node0/memory0
>    # find node0/  |grep memory0
>    node2/memory0
>    # cat node0/memory0/valid_zones
>    none
> 
> V4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
> V3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> ---
>  drivers/base/memory.c  | 21 ++++----------------
>  drivers/base/node.c    | 45 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/memory.h | 19 +++++++++++++++++-
>  include/linux/node.h   |  3 +++
>  4 files changed, 68 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 19469e7f88c2..39fcc075a36f 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -22,6 +22,7 @@
>  #include <linux/stat.h>
>  #include <linux/slab.h>
>  #include <linux/xarray.h>
> +#include <linux/export.h>
>  
>  #include <linux/atomic.h>
>  #include <linux/uaccess.h>
> @@ -48,22 +49,8 @@ int mhp_online_type_from_str(const char *str)
>  
>  #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
>  
> -static int sections_per_block;
> -
> -static inline unsigned long memory_block_id(unsigned long section_nr)
> -{
> -	return section_nr / sections_per_block;
> -}
> -
> -static inline unsigned long pfn_to_block_id(unsigned long pfn)
> -{
> -	return memory_block_id(pfn_to_section_nr(pfn));
> -}
> -
> -static inline unsigned long phys_to_block_id(unsigned long phys)
> -{
> -	return pfn_to_block_id(PFN_DOWN(phys));
> -}
> +int sections_per_block;
> +EXPORT_SYMBOL(sections_per_block);
>  
>  static int memory_subsys_online(struct device *dev);
>  static int memory_subsys_offline(struct device *dev);
> @@ -632,7 +619,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
>   *
>   * Called under device_hotplug_lock.
>   */
> -static struct memory_block *find_memory_block_by_id(unsigned long block_id)
> +struct memory_block *find_memory_block_by_id(unsigned long block_id)
>  {
>  	struct memory_block *mem;
>  
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index cd13ef287011..e8b6f6b9ce51 100644
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
> @@ -850,6 +851,41 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>  			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>  }
>  
> +/*
> + * register_memory_blocks_under_node_early : Register the memory blocks
> + *                 under the nodes.
> + *
> + * This function iterates over all memblock regions, and if the node associated with
> + * the region is online, calculates the start and end memory blocks based on the
> + * region's start and end PFNs. Then, registers all the memory blocks within that
> + * range under the region node.
> + */
> +static void register_memory_blocks_under_node_early(void)
> +{
> +	struct memblock_region *r;
> +
> +	for_each_mem_region(r) {
> +		const unsigned long start_block_id = phys_to_block_id(r->base);
> +		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
> +		unsigned long block_id;
> +
> +		if (!node_online(r->nid))

memblock_get_region_node() please, otherwise it won't build for !NUMA.
Otherwise

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> +			continue;
> +
> +		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
> +			struct memory_block *mem;
> +
> +			mem = find_memory_block_by_id(block_id);
> +			if (!mem)
> +				continue;
> +
> +			do_register_memory_block_under_node(r->nid, mem, MEMINIT_EARLY);
> +			put_device(&mem->dev);
> +		}
> +
> +	}
> +}
> +
>  void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>  				       unsigned long end_pfn,
>  				       enum meminit_context context)
> @@ -971,11 +1007,16 @@ void __init node_dev_init(void)
>  
>  	/*
>  	 * Create all node devices, which will properly link the node
> -	 * to applicable memory block devices and already created cpu devices.
> +	 * to already created cpu devices.
>  	 */
>  	for_each_online_node(i) {
> -		ret = register_one_node(i);
> +		ret =  __register_one_node(i);
>  		if (ret)
>  			panic("%s() failed to add node: %d\n", __func__, ret);
>  	}
> +
> +	/*
> +	 * Link the node to memory block devices
> +	 */
> +	register_memory_blocks_under_node_early();
>  }
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 12daa6ec7d09..2a61088e17ad 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -171,12 +171,30 @@ struct memory_group *memory_group_find_by_id(int mgid);
>  typedef int (*walk_memory_groups_func_t)(struct memory_group *, void *);
>  int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
>  			       struct memory_group *excluded, void *arg);
> +struct memory_block *find_memory_block_by_id(unsigned long block_id);
>  #define hotplug_memory_notifier(fn, pri) ({		\
>  	static __meminitdata struct notifier_block fn##_mem_nb =\
>  		{ .notifier_call = fn, .priority = pri };\
>  	register_memory_notifier(&fn##_mem_nb);			\
>  })
>  
> +extern int sections_per_block;
> +
> +static inline unsigned long memory_block_id(unsigned long section_nr)
> +{
> +	return section_nr / sections_per_block;
> +}
> +
> +static inline unsigned long pfn_to_block_id(unsigned long pfn)
> +{
> +	return memory_block_id(pfn_to_section_nr(pfn));
> +}
> +
> +static inline unsigned long phys_to_block_id(unsigned long phys)
> +{
> +	return pfn_to_block_id(PFN_DOWN(phys));
> +}
> +
>  #ifdef CONFIG_NUMA
>  void memory_block_add_nid(struct memory_block *mem, int nid,
>  			  enum meminit_context context);
> @@ -188,5 +206,4 @@ void memory_block_add_nid(struct memory_block *mem, int nid,
>   * can sleep.
>   */
>  extern struct mutex text_mutex;
> -
>  #endif /* _LINUX_MEMORY_H_ */
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 2b7517892230..5c763253c42c 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -120,6 +120,9 @@ static inline void register_memory_blocks_under_node(int nid, unsigned long star
>  						     enum meminit_context context)
>  {
>  }
> +static inline void register_memory_blocks_under_node_early(void)
> +{
> +}
>  #endif
>  
>  extern void unregister_node(struct node *node);
> -- 
> 2.43.5
> 

-- 
Sincerely yours,
Mike.
