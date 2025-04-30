Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F202258CC0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016052; cv=none; b=LNI32Uc0DxbTLS3Nr1cb8s6HBGsmNM3n9pqgvK2yIRtUEP/tHuVZK+mSMjpaH87w2rWgGys12hxtCvuLgpfo9FjU5YTsVVYuOyEx4lI+AHkjKMA/g34jVspHVSfXUdyexLB4JVoeIMvjsLm3CzeJCVXQsdCG5v3ziSUW33Qv1ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016052; c=relaxed/simple;
	bh=olyFW/2YZ23mxxuYHxWsFH8I9wW11WLvfCwOZndeOc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lq2jm8qMNPcpZT3qag3VTmkIlNwc4kowgkNY+mpWqDuD0ONPn165FEQ8pndjCKUtGt1LCOYC+Q5aOCwFKlIniXubpfr5jy7k0/+URssgsc2KceLsDV+rUFHzQ1NTYkQ1ls6RJ6UAnKwrzf7024JEjJk4/SEouH8PUhK9hEFTvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qu6H+4+u; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qu6H+4+u"
Date: Wed, 30 Apr 2025 05:27:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746016043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W0HXN2DzPh6CIx7IDJDg3sDCnJ77GCrctxZ6KQHXBtw=;
	b=Qu6H+4+uH5lx5/9sjnu+2K9kdBUqQ+AR+b2tQzjAAtDvpAPGD6n0FaQN5jpYnUIf98MOeO
	/C0pZco2ELQVtf0ylIzPk7zqO1tUwrYhCrKiIrPZMgdq0gSfq8kGw90YIrUTWGR5QaMn74
	tudtiITtE2m/a6osW7OBuOpCdqUcKF4=
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
Message-ID: <aBIXJrbxCmYSoCuz@Asmaa.>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
 <aAdzjdv674Jn6G63@Asmaa.>
 <e764d05a-6a83-4563-9f28-3f1a3e28727b@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e764d05a-6a83-4563-9f28-3f1a3e28727b@konsulko.se>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 23, 2025 at 09:53:48PM +0200, Vitaly Wool wrote:
> On 4/22/25 12:46, Yosry Ahmed wrote:
> > I didn't look too closely but I generally agree that we should improve
> > zsmalloc where possible rather than add a new allocator. We are trying
> > not to repeat the zbud/z3fold or slub/slob stories here. Zsmalloc is
> > getting a lot of mileage from both zswap and zram, and is more-or-less
> > battle-tested. Let's work toward building upon that instead of starting
> > over.
> 
> The thing here is, zblock is using a very different approach to small object
> allocation. The idea is: we have an array of descriptors which correspond to
> multi-page blocks divided in chunks of equal size (block_size[i]). For each
> object of size x we find the descriptor n such as:
> 	block_size[n-1] < n < block_size[n]
> and then we store that object in an empty slot in one of the blocks. Thus,
> the density is high, the search is fast (rbtree based) and there are no
> objects spanning over 2 pages, so no extra memcpy involved.

The block sizes seem to be similar in principle to class sizes in
zsmalloc. It seems to me that there are two apparent differentiating
properties to zblock:

- Block lookup uses an rbtree, so it's faster than zsmalloc's list
  iteration. On the other hand, zsmalloc divides each class into
  fullness groups and tries to pack almost full groups first. Not sure
  if zblock's approach is strictly better.

- Zblock uses higher order allocations vs. zsmalloc always using order-0
  allocations. I think this may be the main advantage and I remember
  asking if zsmalloc can support this. Always using order-0 pages is
  more reliable but may not always be the best choice.

On the other hand, zblock is lacking in other regards. For example:
- The lack of compaction means that certain workloads will see a lot of
  fragmentation. It purely depends on the access patterns. We could end
  up with a lot of blocks each containing a single object and there is
  no way to recover AFAICT.

- Zblock will fail if a high order allocation cannot be satisfied, which
  is more likely to happen under memory pressure, and it's usually when
  zblock is needed in the first place.

- There's probably more, I didn't check too closely, and I am hoping
  that Minchan and Sergey will chime in here.

> 
> And with the latest zblock, we see that it has a clear advantage in
> performance over zsmalloc, retaining roughly the same allocation density for
> 4K pages and scoring better on 16K pages. E. g. on a kernel compilation:
> 
> * zsmalloc/zstd/make -j32 bzImage
> 	real	8m0.594s
> 	user	39m37.783s
> 	sys	8m24.262s
> 	Zswap:            200600 kB <-- after build completion
> 	Zswapped:         854072 kB <-- after build completion
> 	zswpin 309774
> 	zswpout 1538332
> 
> * zblock/zstd/make -j32 bzImage
> 	real	7m35.546s
> 	user	38m03.475s
> 	sys	7m47.407s
> 	Zswap:            250940 kB <-- after build completion
> 	Zswapped:         870660 kB <-- after build completion
> 	zswpin 248606
> 	zswpout 1277319
> 
> So what we see here is that zblock is definitely faster and at least not
> worse with regard to allocation density under heavy load. It has slightly
> worse _idle_ allocation density but since it will quickly catch up under
> load it is not really important. What is important is that its
> characteristics don't deteriorate over time. Overall, zblock is simple and
> efficient and there is /raison d'etre/ for it.

Zblock is performing better for this specific workload, but as I
mentioned earlier there are other aspects that zblock is missing.
Zsmalloc has seen a very large range of workloads of different types,
and we cannot just dismiss this.

> 
> Now, it is indeed possible to partially rework zsmalloc using zblock's
> algorithm but this will be a rather substantial change, equal or bigger in
> effort to implementing the approach described above from scratch (and this
> is what we did), and with such drastic changes most of the testing that has
> been done with zsmalloc would be invalidated, and we'll be out in the wild
> anyway. So even though I see your point, I don't think it applies in this
> particular case.


Well, we should start by breaking down the differences and finding out
why zblock is performing better, as I mentioned above. If it's the
faster lookups or higher order allocations, we can work to support that
in zsmalloc. Similarly, if zsmalloc has unnecessary complexity it'd be
great to get rid of it rather than starting over.

Also, we don't have to do it all at once and invalidate the testing that
zsmalloc has seen. These can be incremental changes that get spread over
multiple releases, getting incremental exposure in the process.

> 
> ~Vitaly
