Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D129B22F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369186; cv=none; b=Dqqeldjuzh6WxUgeFy9QoVaVRg2PN9Zjl7Z7H06GhMJMnhlKZfpAvKf36mxHVrTkGQU3w5ljrlRxKYcIoQpM527Hc0x55O1ifzO6WGoRjVVLuDKYbYkd269kVRtjaq4dSLbA0g41O6/CJbn0/6z1SRJZNmQfuYx87/4JxhPkqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369186; c=relaxed/simple;
	bh=wc0UpXn6sUdus2QycRrAxOVVMt10J2WNcT8yUwvY1O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9OQ7BRcf5aEf8gtGw8L6W7qeTD0z0+oGV77Nq0YZcPaj6fr9fklPdMuS6YWhZ+pPd7Um32dpwhBd/M65HQE2hwqBPZZBiIGQSjjSUX5g/1yimNzKh5DqmKzC7z+zDpesZM3jh90+py26Ix9MZJLVXXKFUe9REU9LMFGo6mS1po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwF8Kcp7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwF8Kcp7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662E9C4CEE2;
	Fri, 11 Apr 2025 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744369185;
	bh=wc0UpXn6sUdus2QycRrAxOVVMt10J2WNcT8yUwvY1O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GwF8Kcp7+j1uVnsw6jVXeh65S2ekxKGXg+t2nQ8HwMpF6UpVIXPvaMAhGBGdVsix8
	 ok5d3wvmWB8v4QmXPWsEW83xp9/YIg3eNGqKJe7Qbi+C3jajuxrfL22c0YLsnNoZ84
	 EZlPoC7n0NPLAuTnhvo1oP6Gng8gqC4Y7xlO7MNBUQtvWAOiXe3s7xMD9gQM9IqK4H
	 TsKtL6UrukOnfL5HHij0QKOOTRQ6VQQuJQY4GHeU8cU3n0dLANzEpT6nmhgRv7Pnvw
	 YPboFa70FF5EM3gloLm31Hvp58KHKSD+TrAn2zAT+TzZuILeRnb8OwdKKXXysyfFt7
	 i2MhX9zdxXkTw==
Date: Fri, 11 Apr 2025 13:59:38 +0300
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
Message-ID: <Z_j2Gv9n4DOj6LSs@kernel.org>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
 <d10d1a9f11e9f8752c7ec5ff5bb262b3f6c6bb85.1744175097.git.donettom@linux.ibm.com>
 <Z_d8T3QtnZVeH3HF@kernel.org>
 <d982df07-e7d1-4d4f-a2c3-857901ccc0d0@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d982df07-e7d1-4d4f-a2c3-857901ccc0d0@linux.ibm.com>

On Fri, Apr 11, 2025 at 12:27:28AM +0530, Donet Tom wrote:
> 
> On 4/10/25 1:37 PM, Mike Rapoport wrote:
> > On Wed, Apr 09, 2025 at 10:57:57AM +0530, Donet Tom wrote:
> > > In the current implementation, when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
> > > set, we iterate over all PFNs in the memory block and use
> > > early_pfn_to_nid to find the NID until a match is found.
> > > 
> > > This patch we are using curr_node_memblock_intersect_memory_block() to
> > > check if the current node's memblock intersects with the memory block
> > > passed when CONFIG_DEFERRED_STRUCT_PAGE_INIT is set. If an intersection
> > > is found, the memory block is added to the current node.
> > > 
> > > If CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set, the existing mechanism
> > > for finding the NID will continue to be used.
> > I don't think we really need different mechanisms for different settings of
> > CONFIG_DEFERRED_STRUCT_PAGE_INIT.
> > 
> > node_dev_init() runs after all struct pages are already initialized and can
> > always use pfn_to_nid().
> 
> 
> In the current implementation, if CONFIG_DEFERRED_STRUCT_PAGE_INIT
> is enabled, we perform a binary search in the memblock region to
> determine the pfn's nid. Otherwise, we use pfn_to_nid() to obtain
> the pfn's nid.
> 
> Your point is that we could unify this logic and always use
> pfn_to_nid() to determine the pfn's nid, regardless of whether
> CONFIG_DEFERRED_STRUCT_PAGE_INIT is set. Is that
> correct?

Yes, struct pages should be ready by the time node_dev_init() is called
even when CONFIG_DEFERRED_STRUCT_PAGE_INIT is set.
 
> > 
> > kernel_init_freeable() ->
> > 	page_alloc_init_late(); /* completes initialization of deferred pages */
> > 	...
> > 	do_basic_setup() ->
> > 		driver_init() ->
> > 			node_dev_init();
> > 
> > The next step could be refactoring register_mem_block_under_node_early() to
> > loop over memblock regions rather than over pfns.
> So it the current implementation
> 
> node_dev_init()
>     register_one_node
>         register_memory_blocks_under_node
>             walk_memory_blocks()
>                 register_mem_block_under_node_early
>                     get_nid_for_pfn
> 
> We get each node's start and end PFN from the pg_data. Using these
> values, we determine the memory block's start and end within the
> current node. To identify the node to which these memory block
> belongs,we iterate over each PFN in the range.
> 
> The problem I am facing is,
> 
> In my system node4 has a memory block ranging from memory30351
> to memory38524, and memory128433. The memory blocks between
> memory38524 and memory128433 do not belong to this node.
> 
> In  walk_memory_blocks() we iterate over all memory blocks starting
> from memory38524 to memory128433.
> In register_mem_block_under_node_early(), up to memory38524, the
> first pfn correctly returns the corresponding nid and the function
> returns from there. But after memory38524 and until memory128433,
> the loop iterates through each pfn and checks the nid. Since the nid
> does not match the required nid, the loop continues. This causes
> the soft lockups.
> 
> This issue occurs only when CONFIG_DEFERRED_STRUCT_PAGE_INIT
> is enabled, as a binary search is used to determine the PFN's nid. When
> this configuration is disabled, pfn_to_nid is faster, and the issue does
> not seen.( Faster because nid is getting from page)
> 
> To speed up the code when CONFIG_DEFERRED_STRUCT_PAGE_INIT
> is enabled, I added this function that iterates over all memblock regions
> for each memory block to determine its nid.
> 
> "Loop over memblock regions instead of iterating over PFNs" -
> My question is - in register_one_node, do you mean that we should iterate
> over all memblock regions, identify the regions belonging to the current
> node, and then retrieve the corresponding memory blocks to register them
> under that node?

I looked more closely at register_mem_block_under_node_early() and
iteration over memblock regions won't make sense there. 

It might make sense to use for_each_mem_range() as top level loop in
node_dev_init(), but that's a separate topic.
 
> Thanks
> Donet
> 

-- 
Sincerely yours,
Mike.
