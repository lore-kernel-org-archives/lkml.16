Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB06202F62
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272470; cv=none; b=rNvrT86OX59+EopopLwiVmXH64aW8E9cAStkN6r7UcgOKkwwJ7A1z2PE9+9EzIkUgQmPre6iOKuaPmwNksFqOaoRcgsTu1UC7+p4K3phJN2NNQyzqmYxY/2+lyoUvZBQT7uPU+F0T99akM8kUYSeTPPN92P8HPUWbv1Qp1wzfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272470; c=relaxed/simple;
	bh=H7Rr6CifLf6QgJhumDAIt1E3qwzpwA0TrV+uAgCK1VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQkIq9ww9McYQyxCosIyelPBBGTxrYcjVlrMl6KkFm6hRulnPf8FU4Rl3d52J+Q1oiDiIbK1TdisrhdvVqdvwYR/f25UjlVPYxGE9A8ODEXNVp9fdNOYoSdo/mU0xszdC8yBwD8CxxkGfYTxZtQSlge6lp4AjcJRR33IXNMxIEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCMZi2RI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCMZi2RI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BD0C4CEEB;
	Thu, 10 Apr 2025 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744272470;
	bh=H7Rr6CifLf6QgJhumDAIt1E3qwzpwA0TrV+uAgCK1VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCMZi2RIQ6T607JQU0kvnz/SfZhePCZ9j3K2fWu174vju//7Xvbw1VryurqK2fWMY
	 1FPAHjmV/L7SvqNqp5XPe+CNdpsUlN1T2srtBX+kkJTg3Bmhpc4pX7pTCjgERo8Nyg
	 Ajjsu9rYwr+Nlm3k5nV61nMHVxtx1YrjjahCRyZSAKkIEdFzECRCHYpX4t8BSZhp53
	 YCLDYaugP8YIUkWwFrjPX/6EodDuyNyEBBZlrJgB25MPmeOMKzyWUC6/WATI3enia/
	 WcfWcZorvfnUYQBaOxhfD5wCsNmgcMLAgLIy1JLFHYKhT1Wgp5VAEHFsVhzH4Y4Y2s
	 da4qpnUgk2m3A==
Date: Thu, 10 Apr 2025 11:07:43 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 2/2] base/node: Use
 curr_node_memblock_intersect_memory_block to Get Memory Block NID if
 CONFIG_DEFERRED_STRUCT_PAGE_INIT is Set
Message-ID: <Z_d8T3QtnZVeH3HF@kernel.org>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
 <d10d1a9f11e9f8752c7ec5ff5bb262b3f6c6bb85.1744175097.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d10d1a9f11e9f8752c7ec5ff5bb262b3f6c6bb85.1744175097.git.donettom@linux.ibm.com>

On Wed, Apr 09, 2025 at 10:57:57AM +0530, Donet Tom wrote:
> In the current implementation, when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
> set, we iterate over all PFNs in the memory block and use
> early_pfn_to_nid to find the NID until a match is found.
> 
> This patch we are using curr_node_memblock_intersect_memory_block() to
> check if the current node's memblock intersects with the memory block
> passed when CONFIG_DEFERRED_STRUCT_PAGE_INIT is set. If an intersection
> is found, the memory block is added to the current node.
> 
> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set, the existing mechanism
> for finding the NID will continue to be used.

I don't think we really need different mechanisms for different settings of
CONFIG_DEFERRED_STRUCT_PAGE_INIT. 

node_dev_init() runs after all struct pages are already initialized and can
always use pfn_to_nid().

kernel_init_freeable() ->
	page_alloc_init_late(); /* completes initialization of deferred pages */
	...
	do_basic_setup() ->
		driver_init() ->
			node_dev_init();

The next step could be refactoring register_mem_block_under_node_early() to
loop over memblock regions rather than over pfns.
 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>  drivers/base/node.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index cd13ef287011..5c5dd02b8bdd 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -20,6 +20,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/swap.h>
>  #include <linux/slab.h>
> +#include <linux/memblock.h>
> +
>  
>  static const struct bus_type node_subsys = {
>  	.name = "node",
> @@ -782,16 +784,19 @@ static void do_register_memory_block_under_node(int nid,
>  				    ret);
>  }
>  
> -/* register memory section under specified node if it spans that node */
> -static int register_mem_block_under_node_early(struct memory_block *mem_blk,
> -					       void *arg)
> +static int register_mem_block_early_if_dfer_page_init(struct memory_block *mem_blk,
> +				unsigned long start_pfn, unsigned long end_pfn, int nid)
>  {
> -	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
> -	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
> -	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
> -	int nid = *(int *)arg;
> -	unsigned long pfn;
>  
> +	if (curr_node_memblock_intersect_memory_block(start_pfn, end_pfn, nid))
> +		do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
> +	return 0;
> +}
> +
> +static int register_mem_block_early__normal(struct memory_block *mem_blk,
> +				unsigned long start_pfn, unsigned long end_pfn, int nid)
> +{
> +	unsigned long pfn;
>  	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
>  		int page_nid;
>  
> @@ -821,6 +826,22 @@ static int register_mem_block_under_node_early(struct memory_block *mem_blk,
>  	/* mem section does not span the specified node */
>  	return 0;
>  }
> +/* register memory section under specified node if it spans that node */
> +static int register_mem_block_under_node_early(struct memory_block *mem_blk,
> +					       void *arg)
> +{
> +	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
> +	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
> +	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
> +	int nid = *(int *)arg;
> +
> +#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
> +	if (system_state < SYSTEM_RUNNING)
> +		return register_mem_block_early_if_dfer_page_init(mem_blk, start_pfn, end_pfn, nid);
> +#endif
> +	return register_mem_block_early__normal(mem_blk, start_pfn, end_pfn, nid);
> +
> +}
>  
>  /*
>   * During hotplug we know that all pages in the memory block belong to the same
> -- 
> 2.48.1
> 

-- 
Sincerely yours,
Mike.
