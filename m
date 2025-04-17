Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E371B4153
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875002; cv=none; b=IPzpomqSSg/reVy6NzS7WepAxTnC8j5WiXg4UdDvHXNyluy3eECKaivTM3Lh+SPJGxxo0UYV2S6bxv8wJaJ8BB5DnNBreZY8o83W4baCEvPuF7wMjgUxBRu+r3+PKNwZUnZQtBGjORb6/QNyOQmh5gUkN0aJD89N3rCWAF/TXlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875002; c=relaxed/simple;
	bh=W5dO5+1iQDL11I67wwgPDyxZ3fBJwPwBYC8gQq8nxhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bp6e/+A66gz6J+pFHG1p8LO87EtXyzgoFz5tXMYRVoDVtopIDSIXPmGV6/WbYe8oo314OZ8k4QzNlqw0gMoPaKnNO4B92nVGA+lkAg/emltw7kh/95RcP7Zb6rVgJgc6DIgTLD1nIbcRldnZcY9/zSBMC5Rlecj/KQkS9km/G80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fx1ff+N0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fx1ff+N0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3F3C4CEE4;
	Thu, 17 Apr 2025 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744875001;
	bh=W5dO5+1iQDL11I67wwgPDyxZ3fBJwPwBYC8gQq8nxhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fx1ff+N0lInqZBtgczz/K8jggjODkehaathKdT1rdrulLjfP3XbIkkdvbJnaovMK+
	 cbqPiF6m7V7Wva8E4yP0N8hVqIF0khMlBcGqPzXX89kMWxYanV6xZz7QZ6XcV8ny+W
	 FaKLAY0520ssGOwYyaM1aLjXwFqVbXoyqRXDfHc4OnUoXFTOrwpssWoEOArqKbdHFp
	 gQD3GpD5Oqz7QY+lksDAopFwy6Wlq2Axhu4o1m02CZU4Qf3MYI/VOsOMb9S3XEUhCe
	 t9o2zCvP02kMrequCOWk9WocV/jL1QDYKb1lQ52azbCKMG9NF4V2z1xxCIJkoVv87G
	 a4P8bwlCQ4LxQ==
Date: Thu, 17 Apr 2025 12:58:22 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: dave.hansen@linux.intel.com, Ingo Molnar <mingo@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] x86/devmem: Remove duplicate range_is_allowed()
 definition
Message-ID: <ucdjz2mytjsndtkoroadd7r7grsi4hwpqd47v752zwo6rn5bg7@a7pq6ah4tdai>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
 <174433454327.924142.13014632539194148381.stgit@dwillia2-xfh.jf.intel.com>
 <s6fek3k3zsgf74yuppzckhcnud67pgfitz66n6uwkky7gvjcpc@rp4pxvie2dpb>
 <6800205d86e73_71fe294e4@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6800205d86e73_71fe294e4@dwillia2-xfh.jf.intel.com.notmuch>

On Wed, Apr 16, 2025 at 02:25:49PM -0700, Dan Williams wrote:
> Naveen N Rao wrote:
> > On Thu, Apr 10, 2025 at 06:22:23PM -0700, Dan Williams wrote:
> > > It looks like x86 has a local re-implementation of range_is_allowed()
> > > just to add a pat_enabled() check for the strong symbol override of
> > > phys_mem_access_prot_allowed() from drivers/char/mem.c.
> > > 
> > > In preparation for updating range_is_allowed() logic, arrange for there
> > > to be only one shared instance of "range_is_allowed()" in the kernel by
> > > moving a common helper to include/linux/io.h.
> > > 
> > > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > > Cc: Ingo Molnar <mingo@kernel.org>
> > > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > > ---
> > >  arch/x86/mm/pat/memtype.c |   31 ++++---------------------------
> > >  drivers/char/mem.c        |   18 ------------------
> > >  include/linux/io.h        |   21 +++++++++++++++++++++
> > >  3 files changed, 25 insertions(+), 45 deletions(-)
> > > 
> > > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> > > index 72d8cbc61158..c97b6598f187 100644
> > > --- a/arch/x86/mm/pat/memtype.c
> > > +++ b/arch/x86/mm/pat/memtype.c
> > > @@ -38,6 +38,7 @@
> > >  #include <linux/kernel.h>
> > >  #include <linux/pfn_t.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/io.h>
> > >  #include <linux/mm.h>
> > >  #include <linux/highmem.h>
> > >  #include <linux/fs.h>
> > > @@ -773,38 +774,14 @@ pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
> > >  	return vma_prot;
> > >  }
> > >  
> > > -#ifdef CONFIG_STRICT_DEVMEM
> > > -/* This check is done in drivers/char/mem.c in case of STRICT_DEVMEM */
> > > -static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> > > -{
> > > -	return 1;
> > > -}
> > 
> > It looks like no checks were done here if CONFIG_STRICT_DEVMEM was set, 
> > so this patch changes that.
> 
> Yes, but this still matches the historical intent, and the historical
> intent is a tad messy.
> 
> The pat_enabled check was originally added as a *bypass* of additional
> logic in phys_mem_access_prot_allowed() [1] to validate that /dev/mem was
> establishing compatible mappings of "System-RAM" via /dev/mem. This
> patch maintains that expectation that phys_mem_access_prot_allowed()
> returns immediately when there is no potential cache conflict.

Thanks for the background, that makes sense.

Do we also no longer need the devmem_is_allowed() checks in pat.c if PAT 
is enabled and !CONFIG_STRICT_DEVMEM?

> 
> However, the point is moot in current code because [2] and [3] removed
> all cache type validation from phys_mem_access_prot_allowed() in favor
> track_pfn_remap().
> 
> According to:
> Commit 9e41bff2708e ("x86: fix /dev/mem mmap breakage when PAT is disabled") [1]
> Commit 1886297ce0c8 ("x86/mm/pat: Fix BUG_ON() in mmap_mem() on QEMU/i386") [2]
> Commit 0c3c8a18361a ("x86, PAT: Remove duplicate memtype reserve in devmem mmap") [3]
> 
> > > -#else
> > > -/* This check is needed to avoid cache aliasing when PAT is enabled */
> > > -static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> > > -{
> > > -	u64 from = ((u64)pfn) << PAGE_SHIFT;
> > > -	u64 to = from + size;
> > > -	u64 cursor = from;
> > > -
> > > -	if (!pat_enabled())
> > > -		return 1;
> > > -
> > > -	while (cursor < to) {
> > > -		if (!devmem_is_allowed(pfn))
> > > -			return 0;
> > > -		cursor += PAGE_SIZE;
> > > -		pfn++;
> > > -	}
> > > -	return 1;
> > > -}
> > > -#endif /* CONFIG_STRICT_DEVMEM */
> > > -
> > >  int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
> > >  				unsigned long size, pgprot_t *vma_prot)
> > >  {
> > >  	enum page_cache_mode pcm = _PAGE_CACHE_MODE_WB;
> > >  
> > > +	if (!pat_enabled())
> > > +		return 1;
> > > +
> > 
> > Shouldn't this test for pat_enabled() (perhaps only if 
> > CONFIG_STRICT_DEVMEM is set) and continue with the rest of the function 
> > otherwise?
> 
> No because, per above, the check is here to short-circuit the rest of
> phys_mem_access_prot_allowed() when PAT is disabled.
> 
> I will add some notes to the changelog to save the next person from
> needing to find the history here.
> 
> I found it interesting that Venki suggested that the duplicated
> "range_is_allowed()" be cleaned up back in 2008 [4], so this is a
> cleanup 17 years (almost to the day) in the making:
> 
> Commit 0124cecfc85a ("x86, PAT: disable /dev/mem mmap RAM with PAT") [4]

Indeed!


Thanks,
Naveen
