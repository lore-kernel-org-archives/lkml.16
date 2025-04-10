Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87EC1E503D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744316248; cv=none; b=tE5+b5WiZgLVDlkfTPyNucquevXNV4vbMu/ZxVO523THhELlJ49CXUyH2YcAHJ/lGgNP5h+aZ0PZz3Ka+yQX5dklfpioMxVeTGea9V5fTWqtRq2AXQUrywiGVVUnKudPO/0yOLQpdJK7aZ2OPIeJoQMvLzZ2Te1h3H7UnyZEkGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744316248; c=relaxed/simple;
	bh=exa1+H5mc+RXhQsUTm+nLCEbG00gCzobO7VvShNt+c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUUliiniFHy//iXn7ONW+0UOPMr7hqpPu/HkXMsRCbJrV/3/w/MrVelwe4v9bvwKMhEE7pnYyGT9lJl/1fWlPhVkHGdRtjex8kBKgE1ol1Y8UcOxMPxauZAVomM7sCwuaxpt7MSDGiVZwrCTnuYWi+A5Byysip7F2cFDjfOhkFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=xl9w/jIN; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="xl9w/jIN"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c54b651310so175716085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744316243; x=1744921043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYE2DqZFp3RMAU6AvSsXNZuFJ7WeXusYrsxIjd2l0Bg=;
        b=xl9w/jINXaa5lzuN4JjNd1hJHmaE8RwpFX3FH0D8197sWatrr5pey3yBjBZ+/4jGtZ
         hOK0eou7PKD+ffzog77Y5XaHOW2xmlHmyHEV18YPmRSAspcYSaaSD44CQUr7rYYl15xq
         chovSR9GETgmD0PACXqNT0y9ZNoe9E1IwDPo5MiR8OD1PV+LhoLrIlAoP9WozG5Eu432
         HAfJXONXoVIIyde0upXLriz6TqAhqvaxudSRMzCJqZCeyrkQBGFiwGqHW9K4wZjHXFr2
         iMXYZaUZtSgEFbr5xUQPVHwMa6gYwMEjyTeFH01YAbToNeqniEDVTOd7fH3u581RMH2H
         i6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744316243; x=1744921043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYE2DqZFp3RMAU6AvSsXNZuFJ7WeXusYrsxIjd2l0Bg=;
        b=rHMWKJcLFq92a1dahxO/jXX5vciDPgGlc6+mvfQFUXcL25hA1xkPClbNWTZxaKflLN
         TuUQbnJMdkObwE9DRpD4yzFYifhXriIos+j+z/wLshL4YMrRWU3FyelOiJx8w0/lhEqM
         TNP1MBGN76b0bI9u52XkI0Ywc7/QmFzp1vR5zNF93MMtU8zxlNjLK3St3WJjKcTTtfjJ
         2wYPexkIBaqY0DzifRK+NJfvEnQo19XFmptHNgvk7kdUcvj+HyAzk83DhQRt89zm7iBL
         Lo1Tf+I9+ypTOvcWg4vf60OILSdtemdQA9dNUvKpJnOcWce1/qG9oCVVTWNgbf/aANED
         BInA==
X-Forwarded-Encrypted: i=1; AJvYcCWkfjYL8ksmPgrpTV1X4zuKqqKK+lKjziQIddRAbjUAe09oSz5PB8rG7GcUhev/kojcOOzF/Zwo8QBAPK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsABLG6KO0QI58/WlHbCVT0OD9Q8//kLzswQwek94St+udB9cs
	cum2nrRxVlkOU60RpXKhrTPCcCJEHDyRaIbxHFuEojgyqXupuPLfTNiQU7O+yK8=
X-Gm-Gg: ASbGncshs2Ox+LhJ/mKH5l4aCEI9o5wWWMs76SVUrQ7g7nqoBTSz8Eml9ApssnivYW+
	/PTnVb+sADKICoVjgGeaLTebSvKlIBWZ9q1ZpDgmW97oTWUEwZzbtTdoU813g6dY26xe2ILKi4S
	0mMfXSBFf306ZWzfYxaeuuW8HhYXQ6HpTsugi1GUyLLG4efHUe/0JjyzSHih2gG5HFcwh4AOBRK
	amCHt++tPb1RfOSUGo1cZpUSFSUElZz5JwCFYLZMP80/bERTWrNOyLChck6O5rD/9RjIWhXGoiG
	yzereI58hfBdoUelnhrqBkFqC2UK0JCvuLTS0k4=
X-Google-Smtp-Source: AGHT+IHToBiY9Y0UPycGOGqHIngZX336hB/whYyZb8k7vTgrwjmw7X4OIwWfyQCkonQXDC+ZuqSYXg==
X-Received: by 2002:a05:620a:bc9:b0:7c5:5339:48cf with SMTP id af79cd13be357-7c7af0e3324mr53165385a.30.1744316243535;
        Thu, 10 Apr 2025 13:17:23 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942f26sm145978085a.4.2025.04.10.13.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:17:22 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:17:18 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] mm: compaction: push watermark into
 compaction_suitable() callers
Message-ID: <20250410201718.GA366747@cmpxchg.org>
References: <20250313210647.1314586-1-hannes@cmpxchg.org>
 <20250313210647.1314586-2-hannes@cmpxchg.org>
 <2025de6c-a25b-42f2-8ff2-da2bad0e0aa0@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025de6c-a25b-42f2-8ff2-da2bad0e0aa0@suse.cz>

On Thu, Apr 10, 2025 at 05:19:06PM +0200, Vlastimil Babka wrote:
> On 3/13/25 22:05, Johannes Weiner wrote:
> > compaction_suitable() hardcodes the min watermark, with a boost to the
> > low watermark for costly orders. However, compaction_ready() requires
> > order-0 at the high watermark. It currently checks the marks twice.
> > 
> > Make the watermark a parameter to compaction_suitable() and have the
> > callers pass in what they require:
> > 
> > - compaction_zonelist_suitable() is used by the direct reclaim path,
> >   so use the min watermark.
> > 
> > - compact_suit_allocation_order() has a watermark in context derived
> >   from cc->alloc_flags.
> > 
> >   The only quirk is that kcompactd doesn't initialize cc->alloc_flags
> >   explicitly. There is a direct check in kcompactd_do_work() that
> >   passes ALLOC_WMARK_MIN, but there is another check downstack in
> >   compact_zone() that ends up passing the unset alloc_flags. Since
> >   they default to 0, and that coincides with ALLOC_WMARK_MIN, it is
> >   correct. But it's subtle. Set cc->alloc_flags explicitly.
> > 
> > - should_continue_reclaim() is direct reclaim, use the min watermark.
> > 
> > - Finally, consolidate the two checks in compaction_ready() to a
> >   single compaction_suitable() call passing the high watermark.
> > 
> >   There is a tiny change in behavior: before, compaction_suitable()
> >   would check order-0 against min or low, depending on costly
> >   order. Then there'd be another high watermark check.
> > 
> >   Now, the high watermark is passed to compaction_suitable(), and the
> >   costly order-boost (low - min) is added on top. This means
> >   compaction_ready() sets a marginally higher target for free pages.
> > 
> >   In a kernelbuild + THP pressure test, though, this didn't show any
> >   measurable negative effects on memory pressure or reclaim rates. As
> >   the comment above the check says, reclaim is usually stopped short
> >   on should_continue_reclaim(), and this just defines the worst-case
> >   reclaim cutoff in case compaction is not making any headway.
> > 
> > Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> 
> <snip>
> 
> > @@ -2513,13 +2516,13 @@ compaction_suit_allocation_order(struct zone *zone, unsigned int order,
> >  	 */
> >  	if (order > PAGE_ALLOC_COSTLY_ORDER && async &&
> >  	    !(alloc_flags & ALLOC_CMA)) {
> > -		watermark = low_wmark_pages(zone) + compact_gap(order);
> > -		if (!__zone_watermark_ok(zone, 0, watermark, highest_zoneidx,
> > -					   0, zone_page_state(zone, NR_FREE_PAGES)))
> > +		if (!__zone_watermark_ok(zone, 0, watermark + compact_gap(order),
> > +					 highest_zoneidx, 0,
> > +					 zone_page_state(zone, NR_FREE_PAGES)))
> >  			return COMPACT_SKIPPED;
> 
> The watermark here is no longer recalculated as low_wmark_pages() but the
> value from above based on alloc_flags is reused.
> It's probably ok, maybe it's even more correct, just wasn't mentioned in the
> changelog as another tiny change of behavior so I wanted to point it out.

Ah yes, it would have made sense to point out.

I was wondering about this check. It was introduced to bail on
compaction if there are not enough free non-CMA pages. But if there
are, we still fall through and check the superset of regular + CMA
pages against the watermarks as well. We know this will succeed, so
this seems moot.

It's also a little odd that compaction_suitable() hardcodes ALLOC_CMA
with the explanation that "CMA are migration targets", but then this
check says "actually, it doesn't help us if blocks are formed in CMA".

Does it make more sense to plumb alloc_flags to compaction_suitable()?

There is more head-scratching, though. The check is meant to test
whether compaction has a chance of forming non-CMA blocks. But free
pages are targets. You could have plenty of non-contiguous, free
non-CMA memory - compaction will then form blocks in CMA by moving CMA
pages into those non-CMA targets.

The longer I look at this, the more I feel like this just hard-coded
the very specific scenario the patch author had a problem with: CMA is
massive. The page allocator fills up regular memory first. Once
regular memory is full, non-CMA requests stall on compaction making
CMA blocks. So just bail on compaction then.

It's a valid problem, but I don't see how this code makes any general
sense outside of this exact sequence of events. Especially once
compaction has moved stuff around between regular and CMA memory, the
issue will be back, and the check does nothing to prevent it.
