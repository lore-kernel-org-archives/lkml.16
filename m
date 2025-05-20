Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4E01C8603
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759294; cv=none; b=P49lWdFONEHKdXW1ZjMTurkxYRj33Fvty5DCLRiKD1TPpFmu/oVszDd7S5v7qOQURlRK/XjzLpOK6MsKbTLobfojE1Ot9bIv0fd9Q3jc+FSdb8N8FpiFOBQ7Hj1QSCYbyHRPIi/OTmmk9WNqpAm76Yo2tSsTpv/58gX8/GFlZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759294; c=relaxed/simple;
	bh=Lk4YRXtXRsvB/RhdeZ5uh98f9tYT1dI73CFFgqPX/9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJcG6TWs70Ol4l1yLPLiCyst1Y8l0m+zrFXqYFtbeQ1JZhX2sm7kfUJXiIi6q2IHjc7HltpqCbyOpAFZy+stDZllfLwfv3yKen/y4wsae+EbG0d3kTMb/i7kkoZki09btrM5TTHM8ZXXxJip1gHOOC864WTtKqGgW1K03pIr5EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O4O+QXIT; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O4O+QXIT"
Date: Tue, 20 May 2025 12:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747759288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yesL9v5oI+2cUm8MiDnev15NKhDO2Hb+odQB+4YCNWM=;
	b=O4O+QXITIhBx+t//BHiXt6DJlx9SEukou54zmJlhbo6vcJIRGOe1ybUjFRTse5adKBXqIn
	jOoXYXwHmgeHt3BG99WVkpXi5c4c/o+bbowVaRkHcf2UIvsAqw6pddn7EvyIvVtKFDgJlk
	XTVB+HRg/zke9xNpjRSoyLUL0idIl1U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Usama Arif <usamaarif642@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
Message-ID: <sfh57nqbhxaycdlyitiughqc7ul3xuix5kis65l4grrnxwfqz3@gch2dlf3fnxo>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
 <b696e3c2-3d96-4729-9e07-87bb644f145b@gmail.com>
 <CAJuCfpEL__bRSbVWATs0qbNF3E2ZS_n7banhRxU01FFT2aTPAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpEL__bRSbVWATs0qbNF3E2ZS_n7banhRxU01FFT2aTPAQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, May 20, 2025 at 08:20:38AM -0700, Suren Baghdasaryan wrote:
> On Tue, May 20, 2025 at 7:13 AM Usama Arif <usamaarif642@gmail.com> wrote:
> >
> >
> >
> > On 20/05/2025 14:46, Usama Arif wrote:
> > >
> > >
> > > On 20/05/2025 14:44, Kent Overstreet wrote:
> > >> On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> > >>> When memory allocation profiling is running on memory bound services,
> > >>> allocations greater than order 0 for slab object extensions can fail,
> > >>> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
> > >>> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> > >>> of the allocation being successful.
> > >>>
> > >>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > >>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> > >>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> > >>> ---
> > >>>  mm/slub.c | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/mm/slub.c b/mm/slub.c
> > >>> index dc9e729e1d26..bf43c403ead2 100644
> > >>> --- a/mm/slub.c
> > >>> +++ b/mm/slub.c
> > >>> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> > >>>     gfp &= ~OBJCGS_CLEAR_MASK;
> > >>>     /* Prevent recursive extension vector allocation */
> > >>>     gfp |= __GFP_NO_OBJ_EXT;
> > >>> -   vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > >>> +   vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > >>>                        slab_nid(slab));
> > >>
> > >> And what's the latency going to be on a vmalloc() allocation when we're
> > >> low on memory?
> > >
> > > Would it not be better to get the allocation slighly slower than to not get
> > > it at all?
> >
> > Also a majority of them are less than 1 page. kvmalloc of less than 1 page
> > falls back to kmalloc. So vmalloc will only be on those greater than 1 page
> > size, which are in the minority (for e.g. zs_handle, request_sock_subflow_v6,
> > request_sock_subflow_v4...).
> 
> Not just the majority. For all of these kvmalloc allocations kmalloc
> will be tried first and vmalloc will be used only if the former
> failed: https://elixir.bootlin.com/linux/v6.14.7/source/mm/util.c#L665
> That's why I think this should not regress normal case when slab has
> enough space to satisfy the allocation.

And you really should consider just letting the extension vector
allocation fail if we're under that much memory pressure.

Failing allocations is an important mechanism for load shedding,
otherwise stuff just piles up - it's a big cause of our terrible
behaviour when we're thrashing.

It's equivalent to bufferbloat in the networking world.
