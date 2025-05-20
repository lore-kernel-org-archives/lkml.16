Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAA243370
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749704; cv=none; b=gQV5WyIVUfQc9aqOrQJYEqT+77WyuEawopvEMNvkmm/9HFJNQydMTxMHz9ztNkd9JyqAQ0znIPdrBzPqtrLkkd5fAfXK7qSPYnXGnPDC+aqCRHIf4uCPCm1PXGjyXhAXrHf7FjAEN7k8DlOQmQ6qf/ssyLTy8fojsqMbJhzvduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749704; c=relaxed/simple;
	bh=fleZtakNfBr4uWaPeXui2qYHnQvcz0I2ZGYwwTBG1MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbyiKtrKJTXFvaY6qngFYFQdift9lYZxCxmAombh/eRBmtp3GEHc+j/eknqat45HOzZP9yz6EKK+tS1DsfcUVDZnkFbbiRTjXj/OITxNArnuSBvhjMTjCBJEFZygxS5U9R9qIZtdZGrqWDG5shF4CV2biM0MiAkpDsXLvwQEtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Sy5x6vTB; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Sy5x6vTB"
Date: Tue, 20 May 2025 10:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747749699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h97csemHNLxAOxFVa08yH6eTv2RpV7guY036p3vP+t8=;
	b=Sy5x6vTBsLnVOlRksZPFzfJn4ELw3wX02Wx1B0ylbHomDJ0+QRQN1CxQamW5x2V7M7iDD2
	hsna1dpXmnZmwko2TKHFFAkCFP145/CAghIFzTQJtM9jx3DxMypSgKi1OqZFT0o+DE1So2
	nd0GUNWK9wWHRe+CHxEt44l99/HVsOE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
Message-ID: <22oihuvcrh5sg3urocw6wbop2v5yni7zinuhywbz7glsee4yoa@gzi5v5fcggdl>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, May 20, 2025 at 02:46:14PM +0100, Usama Arif wrote:
> 
> 
> On 20/05/2025 14:44, Kent Overstreet wrote:
> > On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> >> When memory allocation profiling is running on memory bound services,
> >> allocations greater than order 0 for slab object extensions can fail,
> >> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
> >> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> >> of the allocation being successful.
> >>
> >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> >> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> >> ---
> >>  mm/slub.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/mm/slub.c b/mm/slub.c
> >> index dc9e729e1d26..bf43c403ead2 100644
> >> --- a/mm/slub.c
> >> +++ b/mm/slub.c
> >> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> >>  	gfp &= ~OBJCGS_CLEAR_MASK;
> >>  	/* Prevent recursive extension vector allocation */
> >>  	gfp |= __GFP_NO_OBJ_EXT;
> >> -	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> >> +	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> >>  			   slab_nid(slab));
> > 
> > And what's the latency going to be on a vmalloc() allocation when we're
> > low on memory?
> 
> Would it not be better to get the allocation slighly slower than to not get
> it at all?

Our behaviour when thrashing sucks, we don't want to do anything to make
that worse.

There's also the fact that vmalloc doesn't correctly respect gfp flags,
so until that gets fixed this doesn't work at all.
