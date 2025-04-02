Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86911F4187
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635426; cv=none; b=AnA2dSGgl+9iOSUzTeIKmCAz03fSfVAWrCMYQyUCR8gJ0YB2DsNXymH9pAjK1XC1D7RsON0RRPCA74gY/DfJyJsDke9CTbwQOudtiSUyQDIO8B7qK5BdtDsy4ystUMXT17ccaAdIh28LMRT+J1E8XQwaTtvIy+v8h+jcovPZcrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635426; c=relaxed/simple;
	bh=Z5E+Ul9vRx/jedHULA901e1CtpGaie0FTu1DOwKgGRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ix2G1QEnNJ2RAoezICU7HztS7bq3NU4+MiPQpQLhV6/it0X3glLryoF8W86PuNt2yx5TnE38ftaXv/YM/T+Ezxg1rs115zxCZc4sWvL5iduhX6A2IHANg+v8P+gc6Zbxn0Fl7Y307HL9cLxgyO27QNolo9qvCAgpH1Bt1hEEzaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oHzJphOF; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oHzJphOF"
Date: Wed, 2 Apr 2025 16:10:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743635411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LQmokx6Rzrba+kqyKTeF3C/N0r3WG9zBf0JGb6uUwnA=;
	b=oHzJphOFyUFATELdREX2cGOk0OBVZWQ8ZI28+8TjnKNSqGGuTFtPk0k2flq2xYpSz7jtcS
	CNpWZwJb7sOSIfUuImj1P/dTorBxzVB5cwF+wdiC9LS/DeELwM3H5TxVVYyrxzzBsQfQmR
	knDEKvvnkfJOWGG8ToFzliDiACvY94o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Dave Chinner <david@fromorbit.com>
Cc: Michal Hocko <mhocko@suse.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>, joel.granados@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
	linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] proc: Avoid costly high-order page allocations when
 reading proc files
Message-ID: <b7qr6djsicpkecrkjk6473btzztfrvxifiy34u2vdb4cp5ktjf@lvg3rtwrbmsx>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
 <Z-2pSF7Zu0CrLBy_@dread.disaster.area>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-2pSF7Zu0CrLBy_@dread.disaster.area>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 03, 2025 at 08:16:56AM +1100, Dave Chinner wrote:
> On Wed, Apr 02, 2025 at 02:24:45PM +0200, Michal Hocko wrote:
> > On Wed 02-04-25 22:32:14, Dave Chinner wrote:
> > > Have a look at xlog_kvmalloc() in XFS. It implements a basic
> > > fast-fail, no retry high order kmalloc before it falls back to
> > > vmalloc by turning off direct reclaim for the kmalloc() call.
> > > Hence if the there isn't a high-order page on the free lists ready
> > > to allocate, it falls back to vmalloc() immediately.
> > > 
> > > For XFS, using xlog_kvmalloc() reduced the high-order per-allocation
> > > overhead by around 80% when compared to a standard kvmalloc()
> > > call. Numbers and profiles were documented in the commit message
> > > (reproduced in whole below)...
> > 
> > Btw. it would be really great to have such concerns to be posted to the
> > linux-mm ML so that we are aware of that.
> 
> I have brought it up in the past, along with all the other kvmalloc
> API problems that are mentioned in that commit message.
> Unfortunately, discussion focus always ended up on calling context
> and API flags (e.g. whether stuff like GFP_NOFS should be supported
> or not) no the fast-fail-then-no-fail behaviour we need.
> 
> Yes, these discussions have resulted in API changes that support
> some new subset of gfp flags, but the performance issues have never
> been addressed...
> 
> > kvmalloc currently doesn't support GFP_NOWAIT semantic but it does allow
> > to express - I prefer SLAB allocator over vmalloc.
> 
> The conditional use of __GFP_NORETRY for the kmalloc call is broken
> if we try to use __GFP_NOFAIL with kvmalloc() - this causes the gfp
> mask to hold __GFP_NOFAIL | __GFP_NORETRY....
> 
> We have a hard requirement for xlog_kvmalloc() to provide
> __GFP_NOFAIL semantics.
> 
> IOWs, we need kvmalloc() to support kmalloc(GFP_NOWAIT) for
> performance with fallback to vmalloc(__GFP_NOFAIL) for
> correctness...
> 

Are you asking the above kvmalloc() semantics just for xfs or for all
the users of kvmalloc() api? 

> > I think we could make
> > the default kvmalloc slab path weaker by default as those who really
> > want slab already have means to achieve that. There is a risk of long
> > term fragmentation but I think this is worth trying
> 
> We've been doing this for a few years now in XFS in a hot path that
> can make in the order of a million xlog_kvmalloc() calls a second.
> We've not seen any evidence that this causes or exacerbates memory
> fragmentation....
> 
> -Dave.
> -- 
> Dave Chinner
> david@fromorbit.com
