Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F758F58
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390219; cv=none; b=e/jr46twIcmqeOdYXIHEG9ksHplbpUdkMz9gNdsDmpEHTi5p9odSaMgPpQypKGnMOHLHMtqvKyXn7kGYcR0/194N+6lNYfYj3heqiKvOYUkffIa5qncRCs1SWSOoAuAPBf7czkeu1HOaSamq3c9uGH4MsLf0dnZgUrevF/EhTVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390219; c=relaxed/simple;
	bh=l3hkmccqskrkSc27azrjBvj9XafJps7LIFqdo5AwIX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0KGh90z9aSGWys9adyflTeNHyTKhxrrnyQTM/vSlsFAHWQYqUqc02DOKaoy0WL2xR0YRknLCb6hrMRGW3Df3Nomon/T+I/l83TCgQC3xu+eMMoeKBwGM7bV5fQXxgCLsQTfr6pcAtKn7rtTtK+VcdILfEDEf8bw7Wq6JIoGAqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5HmBz+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5HmBz+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C3FC4CEE4;
	Fri, 16 May 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747390218;
	bh=l3hkmccqskrkSc27azrjBvj9XafJps7LIFqdo5AwIX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5HmBz+vL9djoC56PsTH6z7K4FAy6zAPV1unkebkHnypAe1gjuS/lCMwEMWA/D4er
	 vzdEvmounJjoZaP1JCmBj71FA7tcM5iOX3nRQ7/IsHbHFF3VIz0mV7Giy5WITO6uV+
	 TzEQnfdrKl5EskAuRaqIyo26EVzjwlnKNt8Xkd0kOI2jCK9fQSDGJzrwMa/dOVw+3S
	 YGDYLXYs/nWDRYDcCEImaWZDBRexgrlXF38viCs1UKkBjoVIx28d7bDVRhxweSSlsj
	 z047FO04gSIh4QORqSAFwzLofXdRE9FaEJ5QnQsUgfKHqLqqXP/9CUv6+GztcihDgb
	 Ckm+y2hWi5Kyg==
Date: Fri, 16 May 2025 13:10:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
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
Subject: Re: [PATCH v4 2/4] driver/base: remove
 register_mem_block_under_node_early()
Message-ID: <aCcPAV0RiVp0iq9W@kernel.org>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <1b516adb43371fad2dbc69c83a2ed2a224219688.1747376551.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b516adb43371fad2dbc69c83a2ed2a224219688.1747376551.git.donettom@linux.ibm.com>

On Fri, May 16, 2025 at 03:19:52AM -0500, Donet Tom wrote:
> The function register_mem_block_under_node_early() is no longer used,
> as register_memory_blocks_under_node_early() now handles memory block
> registration during early boot.
> 
> Removed register_mem_block_under_node_early() and get_nid_for_pfn(),
> the latter was only used by the former.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> v3->v4
> 
> Added Acked-by tag
> 
> v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> ---
>  drivers/base/node.c | 58 +--------------------------------------------
>  1 file changed, 1 insertion(+), 57 deletions(-)
> 
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index f8cafd8c8fb1..8a14ebcae3b9 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -748,15 +748,6 @@ int unregister_cpu_under_node(unsigned int cpu, unsigned int nid)
>  }
>  
>  #ifdef CONFIG_MEMORY_HOTPLUG
> -static int __ref get_nid_for_pfn(unsigned long pfn)
> -{
> -#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
> -	if (system_state < SYSTEM_RUNNING)
> -		return early_pfn_to_nid(pfn);
> -#endif
> -	return pfn_to_nid(pfn);
> -}
> -
>  static void do_register_memory_block_under_node(int nid,
>  						struct memory_block *mem_blk,
>  						enum meminit_context context)
> @@ -783,46 +774,6 @@ static void do_register_memory_block_under_node(int nid,
>  				    ret);
>  }
>  
> -/* register memory section under specified node if it spans that node */
> -static int register_mem_block_under_node_early(struct memory_block *mem_blk,
> -					       void *arg)
> -{
> -	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
> -	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
> -	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
> -	int nid = *(int *)arg;
> -	unsigned long pfn;
> -
> -	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
> -		int page_nid;
> -
> -		/*
> -		 * memory block could have several absent sections from start.
> -		 * skip pfn range from absent section
> -		 */
> -		if (!pfn_in_present_section(pfn)) {
> -			pfn = round_down(pfn + PAGES_PER_SECTION,
> -					 PAGES_PER_SECTION) - 1;
> -			continue;
> -		}
> -
> -		/*
> -		 * We need to check if page belongs to nid only at the boot
> -		 * case because node's ranges can be interleaved.
> -		 */
> -		page_nid = get_nid_for_pfn(pfn);
> -		if (page_nid < 0)
> -			continue;
> -		if (page_nid != nid)
> -			continue;
> -
> -		do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
> -		return 0;
> -	}
> -	/* mem section does not span the specified node */
> -	return 0;
> -}
> -
>  /*
>   * During hotplug we know that all pages in the memory block belong to the same
>   * node.
> @@ -892,15 +843,8 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>  				       unsigned long end_pfn,
>  				       enum meminit_context context)
>  {
> -	walk_memory_blocks_func_t func;
> -
> -	if (context == MEMINIT_HOTPLUG)
> -		func = register_mem_block_under_node_hotplug;
> -	else
> -		func = register_mem_block_under_node_early;
> -
>  	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
> -			   (void *)&nid, func);
> +			   (void *)&nid, register_mem_block_under_node_hotplug);
>  	return;
>  }
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> -- 
> 2.43.5
> 

-- 
Sincerely yours,
Mike.
