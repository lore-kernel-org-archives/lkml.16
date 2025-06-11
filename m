Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCD1182B4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613668; cv=none; b=GTvJTlxIAJePsdUd9nqNmRSIO+Su7Igc6+AxeXtWzi9xuNcRNjgn6LU2VYjpceHMwUWoEVpceBv7JdBXw5Wisma2Y2SUMHNcy8fQwWBH0MoBv4rVuDWGbwb3z2L7xipZl4f1CVPAR8viVJ0TnmkbohhQAm6gq4w4wnnOcmChEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613668; c=relaxed/simple;
	bh=RLtUcIQJcfNe31BGVjPU6Llz02bUwQhES1+Od36btWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8PsmbmF/3QHIPfJ/u/uHyPj890TrWqftWjlgKXQcObukwGemCwAUdTAyspN1vQn5RyF7GRjFQS/6HBhE6DJj2dpNMjgsnr/4v45iy3721NF8n/dfmsweP1Py3DIptVPFI5XWvGk/cZOfFcOlnXsIDxev8EYS10ZHslenwevAjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KuVeWYfp; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KuVeWYfp"
Date: Tue, 10 Jun 2025 23:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749613664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvpnQoqgyLnzKDoMRY0NMalAYqmO3bg2+7Ckkfaxpf0=;
	b=KuVeWYfp9oMxP80mFfGk0WXdDsLCgRN3km2DUOXVDerGKl7A/kplaxVvPACnnEe9PUDQ5u
	m6tk6Rq973H5A980GqGmm379Jl7pTGkppi6itYpLImupWjHiS8UawG62U09CPIfGNmxqTe
	NxXnQE44v+KXCZJpr3x5hV4EfSur+74=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Casey Chen <cachen@purestorage.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com, 
	corbet@lwn.net, dennis@kernel.org, tj@kernel.org, cl@gentwo.org, vbabka@suse.cz, 
	mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, 
	rientjes@google.com, roman.gushchin@linux.dev, harry.yoo@oracle.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	yzhong@purestorage.com
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
Message-ID: <z4wctxhaajq7r3i6ste2fkeglj527ahk3kkb6jbhlics7mjqto@bgsmpm2qcus7>
References: <20250610233053.973796-1-cachen@purestorage.com>
 <20250610182155.36090c78124e1f60f2959d8e@linux-foundation.org>
 <CALCePG318ATYRH-5G+OTY_utre57EwTe3EuP4BLuXMaXPJK9gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALCePG318ATYRH-5G+OTY_utre57EwTe3EuP4BLuXMaXPJK9gA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 10, 2025 at 06:33:58PM -0700, Casey Chen wrote:
> On Tue, Jun 10, 2025 at 6:21 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 10 Jun 2025 17:30:53 -0600 Casey Chen <cachen@purestorage.com> wrote:
> >
> > > Add support for tracking per-NUMA node statistics in /proc/allocinfo.
> > > Previously, each alloc_tag had a single set of counters (bytes and
> > > calls), aggregated across all CPUs. With this change, each CPU can
> > > maintain separate counters for each NUMA node, allowing finer-grained
> > > memory allocation profiling.
> > >
> > > This feature is controlled by the new
> > > CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS option:
> > >
> > > * When enabled (=y), the output includes per-node statistics following
> > >   the total bytes/calls:
> > >
> > > <size> <calls> <tag info>
> > > ...
> > > 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> > >         nid0     94912        2966
> > >         nid1     220544       6892
> > > 7680         60       mm/dmapool.c:254 func:dma_pool_create
> > >         nid0     4224         33
> > >         nid1     3456         27
> > >
> > > * When disabled (=n), the output remains unchanged:
> > > <size> <calls> <tag info>
> > > ...
> > > 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> > > 7680         60       mm/dmapool.c:254 func:dma_pool_create
> > >
> > > To minimize memory overhead, per-NUMA stats counters are dynamically
> > > allocated using the percpu allocator. PERCPU_DYNAMIC_RESERVE has been
> > > increased to ensure sufficient space for in-kernel alloc_tag counters.
> > >
> > > For in-kernel alloc_tag instances, pcpu_alloc_noprof() is used to
> > > allocate counters. These allocations are excluded from the profiling
> > > statistics themselves.
> >
> > What is glaringly missing here is "why".
> >
> > What is the use case?  Why does Linux want this?  What benefit does
> > this bring to our users?  This is the most important part of the
> > changelog because it tells Andrew why he is even looking at this patch.
> >
> >
> > Probably related to the above omission: why per-nid?  It would be more
> > flexible to present the per-cpu counts and let userspace aggregate that
> > into per-node info if that is desirable.
> >
> 
> Hi Andrew,
> 
> Thanks for taking time reviewing my patch. Sorry I didn't include you
> in the previous conversion. See
> https://lore.kernel.org/all/CAJuCfpHhSUhxer-6MP3503w6520YLfgBTGp7Q9Qm9kgN4TNsfw@mail.gmail.com/T/#u

It's good practice to add lore links to any and all previous discussion
to the commit message for the latest patch, like so:

Link: https://lore.kernel.org/all/CAJuCfpHhSUhxer-6MP3503w6520YLfgBTGp7Q9Qm9kgN4TNsfw@mail.gmail.com/T/#u

Make sure to give as much as context as possible - and your commit
message should always include _rationale_ - none of us can keep up with
everything :)
