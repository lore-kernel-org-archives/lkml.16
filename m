Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED20F299A94
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742642; cv=none; b=BuqujzaCvLenJkZR5BXc8YOnnbQsKiqlpjl1b+gKvMyQll48uFHhlgRErL4qU/LA3b4MV4GOgdxhjg5hOmfac3w8Moc9FQ+zlIsHev6MywCxd6qHNAwnnv6ChFTnN6S8MKyhdcxSewhhK+HuDGInGG+eXjiVhMS0+yAnCzZxBm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742642; c=relaxed/simple;
	bh=40oOS0EzOygRw6Ct8YfCoYPEwtrQozMXnQmoWeB0P9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOpUJWObOnNLjUsZxAMU1XjnzQlRGrje+bqAq3D8KULB0X+q4+CU9kL3RHt2jawzV8CINYRn9+FHltd4j47vlatYP2ZEvHA1tfz/sBZ0CmRihdg559OCnvP8EYJeN0HuHJyz6jFaphytjmCe1F6txnzSBhBfBv0v7ELkJq9wbng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CCV7CGw7; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CCV7CGw7"
Date: Thu, 12 Jun 2025 11:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749742637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7CU/iQsk5gpUai/YAmYmMwFfofj02R/7lL+2KrmQX8Y=;
	b=CCV7CGw79cuNiwv6htG/7Spz678SlAhpsv+4m607dtbbh7HzBUbTyoaLpPNBrrenxvyGBw
	2Xx6YMoa8NPHFAv2hHjvq4c03koTlaIaNgNxrBg7ROLm64jQHArzc/G+2gAiko4tFEWxtQ
	AeUSnHssZ/WYL8RNIUVwvdEx7XtX8c0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: David Wang <00107082@163.com>
Cc: cachen@purestorage.com, akpm@linux-foundation.org, cl@gentwo.org, 
	corbet@lwn.net, dennis@kernel.org, hannes@cmpxchg.org, harry.yoo@oracle.com, 
	jackmanb@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, mhocko@suse.com, rientjes@google.com, roman.gushchin@linux.dev, 
	surenb@google.com, tj@kernel.org, vbabka@suse.cz, yzhong@purestorage.com, 
	ziy@nvidia.com
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
Message-ID: <ub5knll6sof6sbl4elcrdpmf7ptyds6xfusio672fgyt6sxeja@3awoyjpq7xev>
References: <20250610233053.973796-1-cachen@purestorage.com>
 <20250612053605.5911-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612053605.5911-1-00107082@163.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jun 12, 2025 at 01:36:05PM +0800, David Wang wrote:
> Hi, 
> 
> On Tue, 10 Jun 2025 17:30:53 -0600 Casey Chen <cachen@purestorage.com> wrote:
> > Add support for tracking per-NUMA node statistics in /proc/allocinfo.
> > Previously, each alloc_tag had a single set of counters (bytes and
> > calls), aggregated across all CPUs. With this change, each CPU can
> > maintain separate counters for each NUMA node, allowing finer-grained
> > memory allocation profiling.
> > 
> > This feature is controlled by the new
> > CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS option:
> > 
> > * When enabled (=y), the output includes per-node statistics following
> >   the total bytes/calls:
> > 
> > <size> <calls> <tag info>
> > ...
> > 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> >         nid0     94912        2966
> >         nid1     220544       6892
> > 7680         60       mm/dmapool.c:254 func:dma_pool_create
> >         nid0     4224         33
> >         nid1     3456         27
> > 
> > * When disabled (=n), the output remains unchanged:
> > <size> <calls> <tag info>
> > ...
> > 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> > 7680         60       mm/dmapool.c:254 func:dma_pool_create
> > 
> > To minimize memory overhead, per-NUMA stats counters are dynamically
> > allocated using the percpu allocator. PERCPU_DYNAMIC_RESERVE has been
> > increased to ensure sufficient space for in-kernel alloc_tag counters.
> > 
> > For in-kernel alloc_tag instances, pcpu_alloc_noprof() is used to
> > allocate counters. These allocations are excluded from the profiling
> > statistics themselves.
> 
> Considering NUMA balance, I have two questions:
> 1. Do we need the granularity of calling sites?
> We need that granularity to identify a possible memory leak, or somewhere
> we can optimize its memory usage.
> But for NUMA unbalance, the calling site would mostly be *innocent*, the
> clue normally lies in the cpu making memory allocation, memory interface, etc...
> The point is, when NUMA unbalance happened, can it be fixed by adjusting the calling sites?
> Isn't <cpu, memory interface/slab name, numa id> enough to be used as key for numa
> stats analysis?

kmalloc_node().

Per callsite is the right granularity.

But AFAIK correlating profiling information with the allocation is still
an entirely manual process, so that's the part I'm interested in right
now.

Under the hood memory allocation profiling gives you the ability to map
any specific allocation to the line of code that owns it - that is, map
kernel virtual address to codetag.

But I don't know if perf collects _data_ addresses on cache misses. Does
anyone?
