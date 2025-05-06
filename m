Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE688C1F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536682; cv=none; b=TWQwOVQ0hbye+ExjL6MsMRaP75BhTv1r9Y8EBeGpZj4jNz+vngCaTcPuKw97drblINH28j5JkEsPuJ27AeYajTcLdxCmH4I2VCTeCH8Rq7H5ENOsEY5Xit0GPnyrvQoYpxvZZZvorurMuvidD3oZcE6vk1DArxtC9pLx0/NbICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536682; c=relaxed/simple;
	bh=YUgV+mh54WvO2Eq1G3DXNwZeO5Cdoy4yvbAh1sUgP+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJzlqevaAfl1mkk3eWjThDXbzjdRa2A7U63VhVMjZP4KixcTu5FCsqV6wwTIdjT1kTIZyl3LO1GGmJ3U0AfcaEuHgToCJrlo4NB8556XzNvdd2bI7v72+DLInexS0NVDH390JHWm7W8kGqaBRBFhOw+kTWr7v2a6YNVe0rJxu+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gnAw0nFp; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gnAw0nFp"
Date: Tue, 6 May 2025 13:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746536677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4D5i0Z2Rj8nNM9ynn41uc7qdgZztSikDkTTZ/HFDZk0=;
	b=gnAw0nFpNuDXQypOdCHtqslgPbbRC4hB0YTe+jSJwKHzAsNskcUpUOoRurJQRt6xKC+EbP
	qZLp64OoWtd4PRgsEz8eQb86/qVc4KymGETMnH7wzUdbLqyMKMz2Ce24ScWz1eGGtLcrNo
	z7+lBkZ+G7XLiFyNhIP0nJOX9LUDD3I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Igor Belousov <igor.b@beldev.am>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v4] mm: add zblock allocator
Message-ID: <aBoI39N_mHx0Tlp-@google.com>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
 <aAdzjdv674Jn6G63@Asmaa.>
 <e764d05a-6a83-4563-9f28-3f1a3e28727b@konsulko.se>
 <aBIXJrbxCmYSoCuz@Asmaa.>
 <c612aff8-1b07-43aa-b909-f555da511da2@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c612aff8-1b07-43aa-b909-f555da511da2@konsulko.se>
X-Migadu-Flow: FLOW_OUT

On Thu, May 01, 2025 at 02:41:29PM +0200, Vitaly Wool wrote:
> Hi Yosry,
> 
> On 4/30/25 14:27, Yosry Ahmed wrote:
> > On Wed, Apr 23, 2025 at 09:53:48PM +0200, Vitaly Wool wrote:
> > > On 4/22/25 12:46, Yosry Ahmed wrote:
> > > > I didn't look too closely but I generally agree that we should improve
> > > > zsmalloc where possible rather than add a new allocator. We are trying
> > > > not to repeat the zbud/z3fold or slub/slob stories here. Zsmalloc is
> > > > getting a lot of mileage from both zswap and zram, and is more-or-less
> > > > battle-tested. Let's work toward building upon that instead of starting
> > > > over.
> > > 
> > > The thing here is, zblock is using a very different approach to small object
> > > allocation. The idea is: we have an array of descriptors which correspond to
> > > multi-page blocks divided in chunks of equal size (block_size[i]). For each
> > > object of size x we find the descriptor n such as:
> > > 	block_size[n-1] < n < block_size[n]
> > > and then we store that object in an empty slot in one of the blocks. Thus,
> > > the density is high, the search is fast (rbtree based) and there are no
> > > objects spanning over 2 pages, so no extra memcpy involved.
> > 
> > The block sizes seem to be similar in principle to class sizes in
> > zsmalloc. It seems to me that there are two apparent differentiating
> > properties to zblock:
> > 
> > - Block lookup uses an rbtree, so it's faster than zsmalloc's list
> >    iteration. On the other hand, zsmalloc divides each class into
> >    fullness groups and tries to pack almost full groups first. Not sure
> >    if zblock's approach is strictly better.
> 
> If we free a slot in a fully packed block we put it on top of the list.
> zswap's normal operation pattern is that there will be more free slots in
> that block so it's roughly the same.

How so? IIUC the order in which slots are freed depends on the LRU (for
writeback) and swapins (for loads). Why do we expect that slots from the
same block will be freed in close succession?

> 
> > - Zblock uses higher order allocations vs. zsmalloc always using order-0
> >    allocations. I think this may be the main advantage and I remember
> >    asking if zsmalloc can support this. Always using order-0 pages is
> >    more reliable but may not always be the best choice.
> 
> There's a patch we'll be posting soon with "opportunistic" high order
> allocations (i. e. if try_alloc_pages fails, allocate order-0 pages
> instead). This will leverage the benefits of higher order allocations
> without putting too much stress on the system.
> 
> > On the other hand, zblock is lacking in other regards. For example:
> > - The lack of compaction means that certain workloads will see a lot of
> >    fragmentation. It purely depends on the access patterns. We could end
> >    up with a lot of blocks each containing a single object and there is
> >    no way to recover AFAICT.
> 
> We have been giving many variants of stress load on the memory subsystem and
> the worst compression ratio *after* the stress load was 2.8x using zstd as
> the compressor (and about 4x under load). With zsmalloc under the same
> conditions the ratio was 3.6x after and 4x under load.
> 
> With more normal (but still stressing) usage patterns the numbers *after*
> the stress load were around 3.8x and 4.1x, respectively.
> 
> Bottom line, ending up with a lot of blocks each containing a single object
> is not a real life scenario. With that said, we have a quite simple solution
> in the making that will get zblock on par with zsmalloc even in the cases
> described above.

Could you share a high-level description of how this issue will be
addressed in zblock? I am trying to understand why/how zblock can handle
this better/simpler than zsmalloc.

> 
> > - Zblock will fail if a high order allocation cannot be satisfied, which
> >    is more likely to happen under memory pressure, and it's usually when
> >    zblock is needed in the first place.
> 
> See above, this issue will be addressed in the patch coming in a really
> short while.
> 
> > - There's probably more, I didn't check too closely, and I am hoping
> >    that Minchan and Sergey will chime in here.
> > 
> > > 
> > > And with the latest zblock, we see that it has a clear advantage in
> > > performance over zsmalloc, retaining roughly the same allocation density for
> > > 4K pages and scoring better on 16K pages. E. g. on a kernel compilation:
> > > 
> > > * zsmalloc/zstd/make -j32 bzImage
> > > 	real	8m0.594s
> > > 	user	39m37.783s
> > > 	sys	8m24.262s
> > > 	Zswap:            200600 kB <-- after build completion
> > > 	Zswapped:         854072 kB <-- after build completion
> > > 	zswpin 309774
> > > 	zswpout 1538332
> > > 
> > > * zblock/zstd/make -j32 bzImage
> > > 	real	7m35.546s
> > > 	user	38m03.475s
> > > 	sys	7m47.407s
> > > 	Zswap:            250940 kB <-- after build completion
> > > 	Zswapped:         870660 kB <-- after build completion
> > > 	zswpin 248606
> > > 	zswpout 1277319
> > > 
> > > So what we see here is that zblock is definitely faster and at least not
> > > worse with regard to allocation density under heavy load. It has slightly
> > > worse _idle_ allocation density but since it will quickly catch up under
> > > load it is not really important. What is important is that its
> > > characteristics don't deteriorate over time. Overall, zblock is simple and
> > > efficient and there is /raison d'etre/ for it.
> > 
> > Zblock is performing better for this specific workload, but as I
> > mentioned earlier there are other aspects that zblock is missing.
> > Zsmalloc has seen a very large range of workloads of different types,
> > and we cannot just dismiss this.
> 
> We've been running many different work loads with both allocators but
> posting all the results in the patch description will go well beyond the
> purpose of a patch submission. If there are some workloads you are
> interested in in particular, please let me know, odds are high we have some
> results for those too.

That's good to know. I don't have specific workloads in mind, was just
stating the fact that zsmalloc has been tested with a variety of
workloads in production environments.

> 
> > > Now, it is indeed possible to partially rework zsmalloc using zblock's
> > > algorithm but this will be a rather substantial change, equal or bigger in
> > > effort to implementing the approach described above from scratch (and this
> > > is what we did), and with such drastic changes most of the testing that has
> > > been done with zsmalloc would be invalidated, and we'll be out in the wild
> > > anyway. So even though I see your point, I don't think it applies in this
> > > particular case.
> > 
> > 
> > Well, we should start by breaking down the differences and finding out
> > why zblock is performing better, as I mentioned above. If it's the
> > faster lookups or higher order allocations, we can work to support that
> > in zsmalloc. Similarly, if zsmalloc has unnecessary complexity it'd be
> > great to get rid of it rather than starting over.
> > 
> > Also, we don't have to do it all at once and invalidate the testing that
> > zsmalloc has seen. These can be incremental changes that get spread over
> > multiple releases, getting incremental exposure in the process.
> 
> I believe we are a lot closer now to having a zblock without the initial
> drawbacks you have pointed out than a faster zsmalloc, retaining the code
> simplicity of the former.

This does not answer my question tho. I am trying to understand what
makes zblock faster than zsmalloc.

If it's the (optionally opportunistic) higher order allocations, we can
probably do the same in zsmalloc and avoid memcpys as well. I guess we
can try to allocate zspages as a high-order contiguous allocation first,
and fallback to the current "chain" structure on failure.

If it's the lack of overhead from compaction (e.g. less locking), then
the question should be why does zsmalloc need compaction and zblock
allegedly doesn't?

I am not arguing that you're seeing better results from zblock, what I
am saying is let's pinpoint what makes zblock better first, then decide
whether the same can be applied to zsmalloc or if it's really better to
create a new allocator instead. Right now we don't have full
information.

WDYT?
