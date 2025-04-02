Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277E1C863B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743618630; cv=none; b=lm2q1+W+uIrDW4ZBLhu5MLoVrKE4Is8BIQa7aqcXVZ1p8a9F3BmdaAyRrkOcAqAhu8CExKC8GImMiwj3B4SmhwjL6qmdk82PdBXeBvlCPzbyhktyOBKEwJsJhPtgrrHL+TiZ4D/U98fFjPJODcTPksEbUc5PN1sjtdwbeYG2OFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743618630; c=relaxed/simple;
	bh=5x2issN15vB42zgZIfNc/uBiGhxFXgYG5j4rbXf2OPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEzK6+Bt7RmCzttoFdvUImC6UahwkoNwSKxaluP+lnZQxM2VSaXwkI/3h8yQ6oOcksydDdRy2sauSU07qI1+/l92wSUl+ndqlELqQPLwfXvkiPXUYgnCUOPK5EUVhucaMLxPG8hMjyPoi10qnRLwpgDbGM8L5ZFQOegHjEjPsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PySjimlQ; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PySjimlQ"
Date: Wed, 2 Apr 2025 11:30:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743618615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RRd3SQcvztMwM6nVkcAFoWMZZ4yVqjmYprozJgTEDhQ=;
	b=PySjimlQBSxDpoJBYRyJxPQX5UpQ3bEXK4WqSxSBQq3lQsdjcZ3pft3X45O3k9kKcmTIxp
	qnZtHY0MvLbowPwWBVCXOWBHpr/KAWGybO6i7YS4frnUMuYCtrHjbTedEihOjnwzqkxHpt
	YUA+D+cNrQ4LgfNb3wc5WN7NV3Szmak=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Matthew Wilcox <willy@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>, Dave Chinner <david@fromorbit.com>, 
	Yafang Shao <laoar.shao@gmail.com>, Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>, 
	joel.granados@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] proc: Avoid costly high-order page allocations when
 reading proc files
Message-ID: <vwlkfkkz3hezfwedklvybe3lhy2haz2l5fmcojmcjjwj3axye7@ac7junf6ay2f>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
 <Z-1yui_QgubgRAmL@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-1yui_QgubgRAmL@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 02, 2025 at 06:24:10PM +0100, Matthew Wilcox wrote:
> On Wed, Apr 02, 2025 at 02:24:45PM +0200, Michal Hocko wrote:
> > On Wed 02-04-25 22:32:14, Dave Chinner wrote:
> > > > > > >+    /*
> > > > > > >+     * Use vmalloc if the count is too large to avoid costly high-order page
> > > > > > >+     * allocations.
> > > > > > >+     */
> > > > > > >+    if (count < (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
> > > > > > >+            kbuf = kvzalloc(count + 1, GFP_KERNEL);
> > > > > >
> > > > > > Why not move this check into kvmalloc family?
> > > > >
> > > > > Hmm should this check really be in kvmalloc family?
> > > > 
> > > > Modifying the existing kvmalloc functions risks performance regressions.
> > > > Could we instead introduce a new variant like vkmalloc() (favoring
> > > > vmalloc over kmalloc) or kvmalloc_costless()?
> > > 
> > > We should fix kvmalloc() instead of continuing to force
> > > subsystems to work around the limitations of kvmalloc().
> > 
> > Agreed!
> > 
> > > Have a look at xlog_kvmalloc() in XFS. It implements a basic
> > > fast-fail, no retry high order kmalloc before it falls back to
> > > vmalloc by turning off direct reclaim for the kmalloc() call.
> > > Hence if the there isn't a high-order page on the free lists ready
> > > to allocate, it falls back to vmalloc() immediately.
> 
> ... but if vmalloc fails, it goes around again!  This is exactly why
> we don't want filesystems implementing workarounds for MM problems.
> What a mess.
> 
> >  	if (size > PAGE_SIZE) {
> >  		flags |= __GFP_NOWARN;
> >  
> >  		if (!(flags & __GFP_RETRY_MAYFAIL))
> >  			flags |= __GFP_NORETRY;
> > +		else
> > +			flags &= ~__GFP_DIRECT_RECLAIM;
> 
> I think it might be better to do this:
> 
> 		flags |= __GFP_NOWARN;
> 
> 		if (!(flags & __GFP_RETRY_MAYFAIL))
> 			flags |= __GFP_NORETRY;
> +		else if (size > (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
> +			flags &= ~__GFP_DIRECT_RECLAIM;

The above seems more appropriate then the Michal's bigger hammer.
In addition I think Vlastimil has a very good point about the kswapd
reclaim for such cases (the patch explicitly complains about kcompactd
cpu usage).

> 
> I think it's entirely appropriate for a call to kvmalloc() to do
> direct reclaim if it's asking for, say, 16KiB and we don't have any of
> those available.  Better than exacerbating the fragmentation problem by
> allocating 4x4KiB pages, each from different groupings.
