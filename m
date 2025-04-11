Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DB216FF44
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744385956; cv=none; b=bH3RV5r3XocCWgGjaO8L3VZb+LiQaLsc37jNpzaUqH2VPGwviyXpD7/c742XJiQjCXWCz0JwCxSi7y7Rx+pIjPu1isgvQT/28ng+fYt6WENJ0aU85bleqCuALcYSDo1lS/qUmUUmfWJ6dQjhogwPPjAifydcRE+cePo0sGqzjhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744385956; c=relaxed/simple;
	bh=bImw5OOGbgEA6iZslrff03WUdjwcF/rPO1mcSAR7CUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQymecbkTTfXM+00oRHKCmWAC7vf2FKecQBW0a2QQR/Bnha7MxFICrAmataSa9oP2kYiilxZusGPZImswgISeMNhb/n2IdTzURQ086G3+XWf0t2cyK40O0bB4Gv8t5z5ieHcjv0YARyfeXP4K6UA5Rd6pXWFAcNRuP8fJtoglkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=Clrdxkac; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="Clrdxkac"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so23073056d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744385952; x=1744990752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4zYNA1FuF5UGOp9xK52pBzhGeanKaxhrzOWMnlAuxLI=;
        b=Clrdxkac3+Q3ALaXDQT3UWowZwE0RPAcPe6Smh+RWgril+1acfTphbf1KQ5PAFboep
         DLZJAiR0MeG8xdhLhOeZi9mJzg/b0ErLlMyi120EsYGK+dWxXl26CuekJNV69u+vdgpc
         7Ir95+U+Qr0SBY7WFD0gfSCLjXcQF/jlj/nfsvlvHGzgRN3USdYTXvc7S3lbVPfaNqLG
         RoJD56qMk+cOjE48/zIGQcY0eI9ayI6LY8LG1df2zw6zrInuTN193zq8eY3DwCSuBes2
         PVEk1AoJNwNIW6Is0xeprXR3wNHtQ8svW/66QN8I4qmfLlrkaWuneB5ejXPa0H1+Nwf0
         plVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744385952; x=1744990752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zYNA1FuF5UGOp9xK52pBzhGeanKaxhrzOWMnlAuxLI=;
        b=tipUDQL+92XVrn4GdZi0wHyBpcXmgS7ouloz74wKI1Q/D58e3sZdpvweaLYl2Fw6Ah
         LPJz+NwGG2mX4C/A8QDGRHRPbAr5iKybs6QqAHorWeUrn8I0sWEgXrxs65TfSZYlzqWa
         jH7EgAmIKw1U64mJYKMD5pQRY2rTHOEqxRzuNF2fMK3LJy7dkL/+MIjIn/IrJxO1i0wg
         nEPa5YBDiwsrCswdATEKHzZihHsKkUPgpf0KXVYCAAR+ESURcsW2ddB5cGL1TK7uIysz
         T1G4AtHHJLDPDJBADBkR8MI6t9oirzZ5/sVDqwugWYnrmHH1Tg9fLNo7w1RNDAwkF2vH
         0ccA==
X-Forwarded-Encrypted: i=1; AJvYcCWxRBrbXHZsCT+AM1JRCklD24T8XCbp1tInL3OV5z/YQ8/p4SND3Pa7wMyFY0A05+ehKKGH+t2OIudONRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSqQMpBVj5KroiQ8jVYCJHre+hP6j+kNYP/vahTkg9mbTxXNI
	ueYDIWRa9Ty5gsLNCx92UjssrcdGwEDSCroqj19k6nV8ESft7YxZOmJB7n3+yaI=
X-Gm-Gg: ASbGnculoqBpEXWrBieVXR/EHpP1QBTCzUe+S9O3sBZFZB21trVOa9HJ9Xi+RPksLM4
	+Bki6frljbidfpsDDXY3R8iAg6EatiJxDVuXbCR4YSc2n+H3qaCxEyxrGUbfHb8j4S+/jlnIRhZ
	Wiwl7h3KpsiD6qjWVeNHiYcJ+VzZmgWFDXQqITKU5nrp720oNSLofH7SMqskdA6jRqVXYa4D08D
	UrRRoR+ToLeor8fmgCMpLRs04PDLQ0h2PD/ajyKkhhAeFYvpyJe+Bt6HK8kNSS+PBsWmb3r+kVl
	6CNqwtObtQnpP2DF2kXbF6k1j/NMrFlbVHL8654=
X-Google-Smtp-Source: AGHT+IFIqADj/xLZLbLmVnObT99X4OVEjUc986G0OtNBq54QFbfU9AIGF7a8i90vQRDbqoaQq6HKEg==
X-Received: by 2002:ad4:5742:0:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6f230d52924mr50696356d6.21.1744385951619;
        Fri, 11 Apr 2025 08:39:11 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea10681sm37921396d6.104.2025.04.11.08.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:39:10 -0700 (PDT)
Date: Fri, 11 Apr 2025 11:39:06 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: page_alloc: defrag_mode kswapd/kcompactd
 watermarks
Message-ID: <20250411153906.GC366747@cmpxchg.org>
References: <20250313210647.1314586-1-hannes@cmpxchg.org>
 <20250313210647.1314586-6-hannes@cmpxchg.org>
 <46f1b2ab-2903-4cde-9e68-e334a0d0df22@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46f1b2ab-2903-4cde-9e68-e334a0d0df22@suse.cz>

On Fri, Apr 11, 2025 at 10:19:58AM +0200, Vlastimil Babka wrote:
> On 3/13/25 22:05, Johannes Weiner wrote:
> > The previous patch added pageblock_order reclaim to kswapd/kcompactd,
> > which helps, but produces only one block at a time. Allocation stalls
> > and THP failure rates are still higher than they could be.
> > 
> > To adequately reflect ALLOC_NOFRAGMENT demand for pageblocks, change
> > the watermarking for kswapd & kcompactd: instead of targeting the high
> > watermark in order-0 pages and checking for one suitable block, simply
> > require that the high watermark is entirely met in pageblocks.
> 
> Hrm.

Hrm!

> > @@ -2329,6 +2329,22 @@ static enum compact_result __compact_finished(struct compact_control *cc)
> >  	if (!pageblock_aligned(cc->migrate_pfn))
> >  		return COMPACT_CONTINUE;
> >  
> > +	/*
> > +	 * When defrag_mode is enabled, make kcompactd target
> > +	 * watermarks in whole pageblocks. Because they can be stolen
> > +	 * without polluting, no further fallback checks are needed.
> > +	 */
> > +	if (defrag_mode && !cc->direct_compaction) {
> > +		if (__zone_watermark_ok(cc->zone, cc->order,
> > +					high_wmark_pages(cc->zone),
> > +					cc->highest_zoneidx, cc->alloc_flags,
> > +					zone_page_state(cc->zone,
> > +							NR_FREE_PAGES_BLOCKS)))
> > +			return COMPACT_SUCCESS;
> > +
> > +		return COMPACT_CONTINUE;
> > +	}
> 
> Wonder if this ever succeds in practice. Is high_wmark_pages() even aligned
> to pageblock size? If not, and it's X pageblocks and a half, we will rarely
> have NR_FREE_PAGES_BLOCKS cover all of that? Also concurrent allocations can
> put us below high wmark quickly and then we never satisfy this?

The high watermark is not aligned, but why does it have to be? It's a
binary condition: met or not met. Compaction continues until it's met.

NR_FREE_PAGES_BLOCKS moves in pageblock_nr_pages steps. This means
it'll really work until align_up(highmark, pageblock_nr_pages), as
that's when NR_FREE_PAGES_BLOCKS snaps above the (unaligned) mark. But
that seems reasonable, no?

The allocator side is using low/min, so we have the conventional
hysteresis between consumer and producer.

For illustration, on my 2G test box, the watermarks in DMA32 look like
this:

  pages free     212057
        boost    0
        min      11164		(21.8 blocks)
        low      13955		(27.3 blocks)
        high     16746		(32.7 blocks)
        promo    19537
        spanned  456704
        present  455680
        managed  431617		(843.1 blocks)

So there are several blocks between the kblahds wakeup and sleep. The
first allocation to cut into a whole free block will decrease
NR_FREE_PAGES_BLOCK by a whole block. But subsequent allocs that fill
the remaining space won't change that counter. So the distance between
the watermarks didn't fundamentally change (modulo block rounding).

> Doesn't then happen that with defrag_mode, in practice kcompactd basically
> always runs until scanners met?

Tracing kcompactd calls to compaction_finished() with defrag_mode:

@[COMPACT_CONTINUE]: 6955
@[COMPACT_COMPLETE]: 19
@[COMPACT_PARTIAL_SKIPPED]: 1
@[COMPACT_SUCCESS]: 17
@wakeuprequests: 3

Of course, similar to kswapd, it might not reach the watermarks and
keep running if there is a continuous stream of allocations consuming
the blocks it's making. Hence the ratio between wakeups & continues.

But when demand stops, it'll balance the high mark and quit.

> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -6724,11 +6724,24 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
> >  	 * meet watermarks.
> >  	 */
> >  	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
> > +		unsigned long free_pages;
> > +
> >  		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
> >  			mark = promo_wmark_pages(zone);
> >  		else
> >  			mark = high_wmark_pages(zone);
> > -		if (zone_watermark_ok_safe(zone, order, mark, highest_zoneidx))
> 
> I think you just removed the only user of this _safe() function. Is the
> cpu-drift control it does no longer necessary?

Ah good catch. This should actually use zone_page_state_snapshot()
below depending on z->percpu_drift_mark.

This is active when there are enough cpus for the vmstat pcp deltas to
exceed low-min. Afaics this is still necessary, but also still
requires a lot of CPUs to matter (>212 cpus with 64G of memory).

I'll send a follow-up fix.

> > +		/*
> > +		 * In defrag_mode, watermarks must be met in whole
> > +		 * blocks to avoid polluting allocator fallbacks.
> > +		 */
> > +		if (defrag_mode)
> > +			free_pages = zone_page_state(zone, NR_FREE_PAGES_BLOCKS);
> > +		else
> > +			free_pages = zone_page_state(zone, NR_FREE_PAGES);
> > +
> > +		if (__zone_watermark_ok(zone, order, mark, highest_zoneidx,
> > +					0, free_pages))
> >  			return true;
> >  	}
> >  
