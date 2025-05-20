Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C827FD50
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763288; cv=none; b=Kck/SDR7aNs3T67CjnVGFblSvnwVJ5fm/lwkpe7NE43djfzrLCRnlOgaWeIClYnuwkk1wzjialkolRNORhLgt2MHTIjb0ACw6e823oWsNj4M6lYqlgj60jc7zPbtPMYKa8fhVaj4W3aTDwvuECXmlLLDZhC520iiSS1lQZEAs/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763288; c=relaxed/simple;
	bh=WV4l3rUa7+XDxyJnrF3UMSVSttwxx9lal3u4LhOh+ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsZIWcowRrM/FXVWAQt69OkSA0F5S51OFQJaRWXMA9RtoM56ok7GkJ+NgX1nrYOuU5h0UOmJ5A1rQWgPJBfhAt3HBum45isfBGf4xdN3kQfRqIKLOHjfrm7MFO0gYEYdtx8rYT8v3FrUNs73rYaf4ylmaNfO3ruEGyKiICR3uRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bSvUqcKL; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bSvUqcKL"
Date: Tue, 20 May 2025 13:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747763281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bg+OboCNSdATtjWjZopnjv9353Tg8njJlaUUMAxqY9o=;
	b=bSvUqcKLhkkXUsYx1xW0Wpg6XFKtPrm9uebhnlpHkJ26G//sq9WzRLbde2RsCi2z1hdpah
	qbBGcPToxj1iY1uxTMivenV4ya40ydiyoAPNLHmMgHVIeC0X6aoZ1LXXDSe3UMxDCLfuh5
	s90C5f/MHl+zCEA0eqdNp0j7R2XRaoc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, 
	Usama Arif <usamaarif642@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, surenb@google.com, 
	hannes@cmpxchg.org, vlad.wing@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
Message-ID: <dvbvfrj4voyoyoj47ufowpr2sblbtd4wptogx6nnucdz3yrvbj@c7xojwuozflq>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
 <22oihuvcrh5sg3urocw6wbop2v5yni7zinuhywbz7glsee4yoa@gzi5v5fcggdl>
 <ewn4u5ssskqzad4sjerg6zkxjhvuik6cs4st4jarpizztq4fca@p4wwfavollhm>
 <qn7zsk4clyzstu7mvsy4lucj4m2os7h3rmjoitdl4fjpqa3kfx@hi75pqd6gtom>
 <aCy_kfhKfojXYwlE@pc636>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCy_kfhKfojXYwlE@pc636>
X-Migadu-Flow: FLOW_OUT

On Tue, May 20, 2025 at 07:44:49PM +0200, Uladzislau Rezki wrote:
> On Tue, May 20, 2025 at 10:28:06AM -0400, Kent Overstreet wrote:
> > On Tue, May 20, 2025 at 07:24:40AM -0700, Shakeel Butt wrote:
> > > On Tue, May 20, 2025 at 10:01:27AM -0400, Kent Overstreet wrote:
> > > > On Tue, May 20, 2025 at 02:46:14PM +0100, Usama Arif wrote:
> > > > > 
> > > > > 
> > > > > On 20/05/2025 14:44, Kent Overstreet wrote:
> > > > > > On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> > > > > >> When memory allocation profiling is running on memory bound services,
> > > > > >> allocations greater than order 0 for slab object extensions can fail,
> > > > > >> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
> > > > > >> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> > > > > >> of the allocation being successful.
> > > > > >>
> > > > > >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > > > > >> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> > > > > >> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> > > > > >> ---
> > > > > >>  mm/slub.c | 2 +-
> > > > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >>
> > > > > >> diff --git a/mm/slub.c b/mm/slub.c
> > > > > >> index dc9e729e1d26..bf43c403ead2 100644
> > > > > >> --- a/mm/slub.c
> > > > > >> +++ b/mm/slub.c
> > > > > >> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> > > > > >>  	gfp &= ~OBJCGS_CLEAR_MASK;
> > > > > >>  	/* Prevent recursive extension vector allocation */
> > > > > >>  	gfp |= __GFP_NO_OBJ_EXT;
> > > > > >> -	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > > > > >> +	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > > > > >>  			   slab_nid(slab));
> > > > > > 
> > > > > > And what's the latency going to be on a vmalloc() allocation when we're
> > > > > > low on memory?
> > > > > 
> > > > > Would it not be better to get the allocation slighly slower than to not get
> > > > > it at all?
> > > > 
> > > > Our behaviour when thrashing sucks, we don't want to do anything to make
> > > > that worse.
> > > > 
> > > > There's also the fact that vmalloc doesn't correctly respect gfp flags,
> > > > so until that gets fixed this doesn't work at all.
> > > 
> > > Which gfp flags vmalloc is not respecting today?
> > 
> > GFP_NOWAIT.
> > 
> > As to why, you'd better ask Michal Hocko...
> > 
> It is mainly due to pte_alloc_one_kernel(), it uses the GFP_KERNEL
> 
> #define GFP_PGTABLE_KERNEL	(GFP_KERNEL | __GFP_ZERO)
> 
> to get a new pte entry.
> 
> I think we can fix it. For example if we populate some region and allocate
> there for NOWAIT. But there are of course can be other hidden problems.

No, PF_MEMALLOC flags allow for passing most of gfp flags for pte
allocation.
