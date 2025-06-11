Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD072C2C9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613303; cv=none; b=Y7olDWX+jL/nDDaVM5rocXmtKew8+CKeJK1k9KRrHhLXX9UJLCdhfMjNzROrFFOjW4OcM3CxyO+2x+mQeoDZdW4aLYcESvMCzU4gynBCNxssfCPGGe+Unhdwuum1Ksxn51xTh1kzIE2SsFjtSsfJpW37fISG4uI0OwIXBsONq08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613303; c=relaxed/simple;
	bh=fWpvHug4KD46JDmNRZOMiqJkfXioXvNjgZ6P+4H2Pqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNBcOuKX9udyQbo6nluCnXnBuqg0sUn+4fVq1nffxxFp/Y7Ses8DGsJuS62lHabm6DfUDtGcmgjL9oWaI5U0mZk8PWsuv/1Qa9gLhyOwHeNggk60hBCMEGMmGxu14vnU43DTSkMxz+nwY1A+vpOZfdbrOsCB9CeBYUfKcsOFHW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sPDei5hw; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sPDei5hw"
Date: Tue, 10 Jun 2025 23:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749613297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FcbMdWL9nohzlfXyKkU5qmdIVkZuUvvMyKp/ZhqYUxQ=;
	b=sPDei5hw1wxHO/c7GpPFFng4Z4B4Q2mjUKA09sRqeegIkAHF2HWzbE9gqLotIZpH32WPKx
	BNbJB4xOq7CjLrSFybj5csBKEL8iO1ScqutkJ07iWWtBXHGMruLiXOvkc7S8QuCRVuT1jG
	IdGyALOoF4unS5NnuNnqcIbPDZhqY6E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Casey Chen <cachen@purestorage.com>, surenb@google.com, corbet@lwn.net, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, vbabka@suse.cz, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, rientjes@google.com, 
	roman.gushchin@linux.dev, harry.yoo@oracle.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, yzhong@purestorage.com
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
Message-ID: <hvtuqyu6urtutdjfqvtowgjqf5psyubljqujwtq3exdm33a7sq@3nxcevou3pok>
References: <20250610233053.973796-1-cachen@purestorage.com>
 <20250610182155.36090c78124e1f60f2959d8e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610182155.36090c78124e1f60f2959d8e@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 10, 2025 at 06:21:55PM -0700, Andrew Morton wrote:
> On Tue, 10 Jun 2025 17:30:53 -0600 Casey Chen <cachen@purestorage.com> wrote:
> 
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
> What is glaringly missing here is "why".
> 
> What is the use case?  Why does Linux want this?  What benefit does
> this bring to our users?  This is the most important part of the
> changelog because it tells Andrew why he is even looking at this patch.

In the last thread, I was pushing to get some input from other people
working on userspace profiling - it seems like that's where we're going
with this, so we need to make sure people working in the same area are
talking to each other, and if we're building tools to export data we
want to make sure it's relevant and useful.

Steven Rostadt sent out some pings, but I don't think we've heard back
from the relevant people, and I do want that to happen before (if) this
goes in.

And more basic than this, now that we've got the ability to map kernel
address -> code that owns it, we should be seeing if that is relevant
and interesting to the tooling people before we get fancier.

Casey also mentioned that this was being used for some internal stuff at
Pure, and I'd still like to hear more about that. If they already know
interesting and cool stuff we can use this for - great, let's please
hear what it is.

But we definitely need some wider context before merging this.

> Probably related to the above omission: why per-nid?  It would be more
> flexible to present the per-cpu counts and let userspace aggregate that
> into per-node info if that is desirable.

Per nid makes more sense to me if this is for profiling, and since this
is a text interface meant primarily for human consumption we don't want
to bloat that excessively.

We can always add multiple interfaces for viewing the same data, and
there's nothing preventing us from adding that later if it turns out
something else does want per-cpu counts.

Per-cpu counts would, I believe, bloat the data structures quite a bit
since the counters are internally percpu - would there then be counters
in nr_cpus^2? I hope not :)

> > +static inline struct alloc_tag_counters alloc_tag_read_nid(struct alloc_tag *tag, int nid)
> > +{
> > +	struct alloc_tag_counters v = { 0, 0 };
> > +	struct alloc_tag_counters *counters;
> > +	int cpu;
> > +
> > +	for_each_possible_cpu(cpu) {
> 
> for_each_possible_cpu() is lame - potentially much more expensive than
> for_each_online_cpu.  Is it impractical to use for_each_online_cpu()?
> 
> Probably doesn't matter for a userspace displaying function but
> userspace can do weird and unexpected things.

for_each_online_cpu() means having to think hard about cpu hotplug and
possibly adding callbacks, no? I think simple and dumb is fine here.

> > +	for (i = 0; i < kernel_tags.count; i++) {
> > +		/* Each CPU has one alloc_tag_counters per numa node */
> > +		kernel_tags.first_tag[i].counters =
> > +			pcpu_alloc_noprof(pcpu_counters_size,
> > +					  sizeof(struct alloc_tag_counters),
> > +					  false, GFP_KERNEL | __GFP_ZERO);
> > +		if (!kernel_tags.first_tag[i].counters) {
> > +			while (--i >= 0)
> > +				free_percpu(kernel_tags.first_tag[i].counters);
> > +			pr_info("Failed to allocate per-cpu alloc_tag counters\n");
> 
> pr_err(), methinks.
> 
> > +			return;
> 
> And now what happens.  Will the kernel even work?
> 
> This code path is untestable unless the developer jumps through hoops
> and it will never be tested again.
> 
> We assume that __init-time allocations always succeed, so a hearty
> panic() here would be OK.

percpu allocations are more limited than normal allocations, and we did
hit that when developing memory allocation profiling, so - maybe WARN()?

> > +				int nid;
> 
> C99 definition.
> 
> > +				for (nid = 0; nid < pcpu_counters_num; nid++) {
> 
> If we're going to use C99 (is OK now) then it's better to go all the
> way and give `i' loop scope.  "for (int i..".

Yes please; variable reuse can lead to some nasties.

Going full C99 has its own problems (you can't do it after labels, and
only one of gcc or clang complains and I forget which - perpetual
headache).

But C99 for loops are a total no brainer.
