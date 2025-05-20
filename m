Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4715022D794
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750727; cv=none; b=MuK7wImZyuXGqV28dW2KaKpBSFMuChqPA7U2QgzlbvIRI92ussh8ZUIoFfZpZFPKHszXlYqxUY4tV2kC1loNbBtLw6OY71wIVANPrufgfOcMPdLc/5GTZKD5UrE/K7XbSRrVaPRQotnX1fAw9PUpFPqvv7mE1NMnaZjnfJ8HFdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750727; c=relaxed/simple;
	bh=LualCfcyas5tT9WjEBm248L1C27XUMLuZS92yR37o4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTfGtrTQo67TO5ifV55kT46v3q4NgE5mb0aI6J6ULvOjJV6L1cX1UGx34ya/bYvAN5rCNKDMg6vZnrx5akzUYMeKzDTGsnxzobjIJZO2LRwABPQj7tOOL3X3u0Sa70yBLhvqP1HWPyFKOhhGPsh0I8O8E8T8Aug4BeDUoutRApg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cp5y5e6S; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cp5y5e6S"
Date: Tue, 20 May 2025 07:18:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747750722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rFwCIYRzvivPUpYkVHoooHboU3UiLo3gQHBSoPT9tl8=;
	b=cp5y5e6SU4YVtdcAtwm9kMPfUTAjrY5+zYTk+C/qEjtajECvAv/W7ALjkTregnupGrmpwR
	CYQM/GgUFquJ08kIWlg2Dn3D4pN/ojNcx6LBw8SX90QgIDtEOoGPBuRDrZjwd99Dv1yQ13
	apYyXvUAbQ3aEPd0sw/VG2OTaSm0lGo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Harry Yoo <harry.yoo@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, surenb@google.com, hannes@cmpxchg.org, vlad.wing@gmail.com, 
	linux-mm@kvack.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, vbabka@suse.cz, cl@gentwo.org, rientjes@google.com, 
	roman.gushchin@linux.dev
Subject: Re: [PATCH 2/2] mm: slub: only warn once when allocating slab obj
 extensions fails
Message-ID: <h7mwe4tr4r233zewdqaoehmmoktaljslgcxvr2qybon2vnxhrz@pbwpt253olkd>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <20250520122547.1317050-2-usamaarif642@gmail.com>
 <aCyEyxHEXQ7DU9I1@harry>
 <cf17cfde-cd1a-4217-a09a-1aa86347f830@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf17cfde-cd1a-4217-a09a-1aa86347f830@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, May 20, 2025 at 02:42:09PM +0100, Usama Arif wrote:
> 
> 
> On 20/05/2025 14:34, Harry Yoo wrote:
> > On Tue, May 20, 2025 at 01:25:47PM +0100, Usama Arif wrote:
> >> In memory bound systems, a large number of warnings for failing this
> >> allocation repeatedly may mask any real issues in the system
> >> during memory pressure being reported in dmesg. Change this to
> >> WARN_ONCE.
> >>
> >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> >> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> >> ---
> > 
> > Hi,
> > 
> > Please Cc SLAB ALLOCATOR folks in MAINTAINERS on patches that touch
> > slab code ;)
> > 
> 
> Thanks for adding them to CC! I was just thinking of this as a memory
> allocation profiling issue and added the maintainers for it,
> but should have added slab maintainers as well.
> 
> 
> >>  mm/slub.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/mm/slub.c b/mm/slub.c
> >> index bf43c403ead2..97cb3d9e8d00 100644
> >> --- a/mm/slub.c
> >> +++ b/mm/slub.c
> >> @@ -2102,7 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
> >>  
> >>  	slab = virt_to_slab(p);
> >>  	if (!slab_obj_exts(slab) &&
> >> -	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
> >> +	    WARN_ONCE(alloc_slab_obj_exts(slab, s, flags, false),
> >>  		 "%s, %s: Failed to create slab extension vector!\n",
> >>  		 __func__, s->name))
> > 
> > I think this should be pr_warn_once()?
> > I'm not sure why this was WARN() in the first place.
> > 
> 
> Isn't WARN_ONCE the same as pr_warn_once but with needing the condition
> of the first arg to be true? We only want to warn if alloc_slab_obj_exts
> returns non-zero. So WARN_ONCE should be ok?
> 

The difference is the impact on panic_on_warn users which are mostly
testing bots. This warning is not actionable, so I agree with Harry to
covert this to pr_warn_once().

> > The coding style guide explicitly states that:
> >> Do not WARN lightly
> >> ===================
> >>
> >> WARN*() is intended for unexpected, this-should-never-happen situations.
> >> WARN*() macros are not to be used for anything that is expected to happen
> >> during normal operation. These are not pre- or post-condition asserts,
> >> for example. Again: WARN*() must not be used for a condition that is
> >> expected to trigger easily, for example, by user space actions.
> >> pr_warn_once() is a possible alternative, if you need to notify the user
> >> of a problem.
> > 
> > And failing to allocate the extension vector can happen during normal
> > operations.
> > 
> > panic_on_warn users will be unhappy if they notice their kernel panicked
> > just because their kernel failed to allocate slab extension vectors, which is
> > a totally normal situtation.
> > 
> >>  		return NULL;
> >> -- 
> >> 2.47.1
> >>
> >>
> > 
> 
