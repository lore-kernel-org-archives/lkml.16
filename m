Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB0019E826
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743618348; cv=none; b=sTGjzk0oRkJcFOVNXAl1PEnfQIwhRxodmbcPZTholCo5Qw1KVujZr00l0aWndPK5dwWVMAoP1xImEI1DhVUbXvoTEgd4fcL3ZBIFHaFSsWrb6TgCat+qLywsRJz/35//53/Tku2nGHKZMg3YrIxnYUc2uE1MOTUPnhFk7gTwSqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743618348; c=relaxed/simple;
	bh=VzOSyS1EZlfE2DfU5y9oHGAHnRMo1AP+5erK5uklHo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfvBvcg03FsVe29rgu3maXYIgVU5ZHExnIWDzE2PpC8rmhmp3RruaatHr4AqJ64v0YnU1sI6G2Rq+nWWaUZg8keiRKdi7oqDNUnqImoSeo748Ld3cVLpUAx7Nw9Xc2V33c6wqnE9C9bWKXm5ryUK3rn2elMKk1xXsici5bqDR9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bMkN6bIU; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bMkN6bIU"
Date: Wed, 2 Apr 2025 11:25:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743618344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=utksKWb1mh68CIFg9Ttln7a3dxhUhC5QtFuhH58eisE=;
	b=bMkN6bIUDl+UMVJNMfZt8MWB0kTzuA2+pNZVC0p6QxN/GxYB62OfWclmNJlOBFBzod9XbC
	CG+FopgouoebhGAfAEBBIVnb1g6myRqTLtrGRQyy+oI8Eqtf5cYPRhyvnPnK3Y1V0g2vvB
	2riQUyBS6Kwn4rUhbnTBUCeoD/SSRMQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Yafang Shao <laoar.shao@gmail.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Kees Cook <kees@kernel.org>, joel.granados@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, linux-mm@kvack.org, 
	Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] proc: Avoid costly high-order page allocations when
 reading proc files
Message-ID: <rmo4z3dlc5gexnd5ci4v4vbste3yxywyutuag4jsrjixd4qset@olp7hikomgey>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <c6823186-9267-418c-a676-390be9d4524d@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6823186-9267-418c-a676-390be9d4524d@suse.cz>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 02, 2025 at 11:25:12AM +0200, Vlastimil Babka wrote:
> On 4/2/25 10:42, Yafang Shao wrote:
> > On Wed, Apr 2, 2025 at 12:15 PM Harry Yoo <harry.yoo@oracle.com> wrote:
> >>
> >> On Tue, Apr 01, 2025 at 07:01:04AM -0700, Kees Cook wrote:
> >> >
> >> >
> >> > On April 1, 2025 12:30:46 AM PDT, Yafang Shao <laoar.shao@gmail.com> wrote:
> >> > >While investigating a kcompactd 100% CPU utilization issue in production, I
> >> > >observed frequent costly high-order (order-6) page allocations triggered by
> >> > >proc file reads from monitoring tools. This can be reproduced with a simple
> >> > >test case:
> >> > >
> >> > >  fd = open(PROC_FILE, O_RDONLY);
> >> > >  size = read(fd, buff, 256KB);
> >> > >  close(fd);
> >> > >
> >> > >Although we should modify the monitoring tools to use smaller buffer sizes,
> >> > >we should also enhance the kernel to prevent these expensive high-order
> >> > >allocations.
> >> > >
> >> > >Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> >> > >Cc: Josef Bacik <josef@toxicpanda.com>
> >> > >---
> >> > > fs/proc/proc_sysctl.c | 10 +++++++++-
> >> > > 1 file changed, 9 insertions(+), 1 deletion(-)
> >> > >
> >> > >diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
> >> > >index cc9d74a06ff0..c53ba733bda5 100644
> >> > >--- a/fs/proc/proc_sysctl.c
> >> > >+++ b/fs/proc/proc_sysctl.c
> >> > >@@ -581,7 +581,15 @@ static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
> >> > >     error = -ENOMEM;
> >> > >     if (count >= KMALLOC_MAX_SIZE)
> >> > >             goto out;
> >> > >-    kbuf = kvzalloc(count + 1, GFP_KERNEL);
> >> > >+
> >> > >+    /*
> >> > >+     * Use vmalloc if the count is too large to avoid costly high-order page
> >> > >+     * allocations.
> >> > >+     */
> >> > >+    if (count < (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
> >> > >+            kbuf = kvzalloc(count + 1, GFP_KERNEL);
> >> >
> >> > Why not move this check into kvmalloc family?
> >>
> >> Hmm should this check really be in kvmalloc family?
> > 
> > Modifying the existing kvmalloc functions risks performance regressions.
> > Could we instead introduce a new variant like vkmalloc() (favoring
> > vmalloc over kmalloc) or kvmalloc_costless()?
> 
> We have gfp flags and kmalloc_gfp_adjust() to moderate how aggressive
> kmalloc() is before the vmalloc() fallback. It does e.g.:
> 
>                 if (!(flags & __GFP_RETRY_MAYFAIL))
>                         flags |= __GFP_NORETRY;
> 
> However if your problem is kcompactd utilization then the kmalloc() attempt
> would have to avoid ___GFP_KSWAPD_RECLAIM to avoid waking up kswapd and then
> kcompactd. Should we remove the flag for costly orders? Dunno.

Agree with the following points (i.e. ad-hoc fixing etc). The above
point of removing kswapd reclaim for costly orders need more thought.
Will we be hiding some compaction issues by doing so (i.e. no kswapd
reclaim for costly orders)?

> Ideally the
> deferred compaction mechanism would limit the issue in the first place.
> 
> The ad-hoc fixing up of a particular place (/proc files reading) or creating
> a new vkmalloc() and then spreading its use as you see other places
> triggering the issue seems quite suboptimal to me.
> 
> >>
> >> I don't think users would expect kvmalloc() to implictly decide on using
> >> vmalloc() without trying kmalloc() first, just because it's a high-order
> >> allocation.
> >>
> > 
> 
