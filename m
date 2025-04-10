Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E85146A68
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271377; cv=none; b=mWqe4qsXqTq/lP1pydxkerAAr2ob6AwjFdYGmRpKlRYxagEDSx6b1qy4RZF7LMYH1nlTBWVM3xBUarCALroLPWOwPIvgJrmXNBDgFDo/5/PvO4rNnwoOhGCLE+uUeUcVb6lINjIIhFcoc5W0suw+OjgbnH7horSQ8homgY9KIHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271377; c=relaxed/simple;
	bh=RRAIvL49jWr5UXpHyg24TTbKmsDEsHJOZ/YSFNdrKyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ng3BhWtp8GQLgeSlHDYokeArDHK9oDlYauD7swoCBX7JU5jCFWK59k9BF87MxQgWmk2SeOcFEvT7UqLYFGbUmnUcNgkRA35Xf2Eub9N9RcGf22M42TcXNeVBq064NeGyvqRLYt98ViD1YSE2rWgFSfb82PFK17DTSZeM/4dzh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0P8Orq+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0P8Orq+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD07C4CEDD;
	Thu, 10 Apr 2025 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744271376;
	bh=RRAIvL49jWr5UXpHyg24TTbKmsDEsHJOZ/YSFNdrKyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0P8Orq+IAjD6kBUIsVb1nq+b7O62vZaXEVXyoCZes3A2bqvf9464zvEtT4smNWAm
	 q0Hu6pmXRPNxGWRCP6pKLZw4GKAQm6+Yw/XwWD4XTMk3GEl1+z6ZfG3Suie8F8OoIy
	 VEpQmS2/+aAHs89//rAGAYi7FvdisXvyXSDZIPSaXSmILQKvq2CclQQ40yk/N0xKu7
	 P9A1Z5xG1bLWbcpdp48J+pq7gAU3Y99TA7hgs23vn4QM4d2voB4t5WlKz4txZkGchL
	 bNsBM3zvHBkNM4JZOOPxOGkDGYAoWJUa8xSe20A5XpnN5k2O62XTB9BsvzNgxueRZi
	 IfPXrAZg5OP0g==
Date: Thu, 10 Apr 2025 10:49:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 1/2] mm/memblock: Added a New Memblock Function to Check
 if the Current Node's Memblock Region Intersects with a Memory Block
Message-ID: <Z_d4CvSjQFK55wfQ@kernel.org>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>

Hi,

On Wed, Apr 09, 2025 at 10:57:56AM +0530, Donet Tom wrote:
> A new function, curr_node_memblock_intersect_memory_block, has been
> added to check if the current node's NID intersects with a memory block.

As Andrew mentioned, the name is too long :)
Maybe memblock_range_intersects_node(), but I think intersection is not the
right thing to check (see below).

Also, memblock does not care about sysfs representation of memory blocks,
please use "range" rather than "memory block" in changelog and comments.
 
> This function takes the start and end PFN of a memory block, along with
> the node ID being registered. It then finds the memblock region of the
> current node and check if the passed memory block intersects with it. If
> there is an intersection, the function returns true; otherwise, itreturns
> false.
 
Please describe here what problem you are solving and why you need this
functionality rather than what the new function does.

> There are two scenarios to consider during the search:
> 
> 1. The memory block size is greater than the memblock region size.
> 
> This means that multiple memblocks can be present within a single
> memory block. If the start or end of the memblock is within the
> start and end of the memory block, it indicates that the memblock
> is part of that memory block. Therefore, the memory block can be
> added to the node where the memblock resides.

If a range crosses several memblocks, it's possible that they belong to a
different nodes.
 
> 2. The memory block size is less than or equal to the memblock size
> 
> This means that multiple memory blocks can be part of a single memblock
> region. If the start or end of the memory block is within the start and
> end of the memblock, it indicates that the memory block is part of the
> memblock. Therefore, the memory block can be added to the node where
> the memblock resides.
> 
> In the current implementation, during node device initialization, to
> find the memory block NID, it iterates over each PFN of the memory
> block until it finds a match. On large systems, this can take a
> long time.

Why won't you replace the loop over each PFN with a loop over memblock
memory regions in the node device initialization?
 
> With this function, the boot time is reduced.
> 
> Boot time without this function - 32TB RAM
> ==========================================
> Startup finished in 1min 12.413s (kernel)
> 
> Boot time with this function -  32TB RAM
> ========================================
> Startup finished in 18.031s (kernel)
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>  include/linux/memblock.h |  2 ++
>  mm/memblock.c            | 67 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index ef5a1ecc6e59..db87f7daa46c 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -277,6 +277,8 @@ static inline bool memblock_is_driver_managed(struct memblock_region *m)
>  
>  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>  			    unsigned long  *end_pfn);
> +bool curr_node_memblock_intersect_memory_block(unsigned long start_pfn,
> +				unsigned long end_pfn, int curr_nid);
>  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
>  			  unsigned long *out_end_pfn, int *out_nid);
>  
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 0a53db4d9f7b..570ab7ac4dce 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -6,6 +6,8 @@
>   * Copyright (C) 2001 Peter Bergner.
>   */
>  
> +#include "linux/stddef.h"
> +#include "linux/types.h"
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/init.h>
> @@ -17,7 +19,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/memblock.h>
>  #include <linux/mutex.h>
> -
> +#include <linux/minmax.h>
>  #include <asm/sections.h>
>  #include <linux/io.h>
>  
> @@ -1909,6 +1911,69 @@ bool __init_memblock memblock_is_map_memory(phys_addr_t addr)
>  	return !memblock_is_nomap(&memblock.memory.regions[i]);
>  }
>  
> +/**
> + * curr_node_memblock_intersect_memory_block:  checks if the current node's memblock
> + * region intersects with the memory block.
> + * @start_pfn: memory block start pfn
> + * @end_pfn: memory block end_pfn
> + * @curr_nid: Current node
> + *
> + * This function takes the start and end PFN of a memory block, as well as the node ID
> + * that is being registered. It then finds the memblock region of the current node and
> + * checks if the passed memory block intersects with the memblock. If there is an
> + * intersection, the function returns true; otherwise, it returns false.
> + *
> + * Return:
> + * If the current node's memblock region intersects with the memory block, it returns
> + * true; otherwise, it returns false.
> + */
> +bool __init_memblock curr_node_memblock_intersect_memory_block(unsigned long start_pfn,
> +						unsigned long end_pfn, int curr_nid)
> +{
> +	struct memblock_region *r;
> +	unsigned long r_start, r_end;
> +	unsigned long size = end_pfn - start_pfn;
> +	unsigned long r_size = 0;
> +
> +	for_each_mem_region(r) {
> +		r_start = PFN_DOWN(r->base);
> +		r_end = PFN_DOWN(r->base + r->size);
> +		r_size = r_end - r_start;
> +
> +		if (r->nid == curr_nid) {

r->nid is not defined for !NUMA configurations, please use
memblock_get_region_node()

> +			if (size > r_size) {
> +				/*
> +				 * The memory block size is greater than the memblock
> +				 * region size, meaning multiple memblocks can be present
> +				 * within a single memory block. If the memblock's start
> +				 * or end is within the memory block's start and end, It
> +				 * indicates that the memblock is part of this memory block.
> +				 * Therefore, the memory block can be added to the node
> +				 * where the memblock resides.
> +				 */
> +				if (in_range(r_start, start_pfn, size) ||
> +						in_range(r_end, start_pfn, size))
> +					return true;
> +			} else {
> +				/*
> +				 * The memory block size is less than or equal to the
> +				 * memblock size, meaning multiple memory blocks can
> +				 * be part of a single memblock region. If the memory
> +				 * block's start or end is within the memblock's start
> +				 * and end, it indicates that the memory block is part of
> +				 * the memblock. Therefore, the memory block can be added
> +				 * to the node where the memblock resides.
> +				 */
> +				if (in_range(start_pfn, r_start, r_size) ||
> +						in_range(end_pfn, r_start, r_size))
> +					return true;
> +			}
> +		}
> +	}
> +	return false;
> +}
> +
> +
>  int __init_memblock memblock_search_pfn_nid(unsigned long pfn,
>  			 unsigned long *start_pfn, unsigned long *end_pfn)
>  {
> -- 
> 2.48.1
> 

-- 
Sincerely yours,
Mike.
