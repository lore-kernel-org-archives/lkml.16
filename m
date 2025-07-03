Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6E9289E38
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 17:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751563681; cv=none; b=ZUGKB2wlzPo+6abvVNg2KjiJPymrt1KnBBXRtQfLail73jOjK3IWQZKXcbqhwHitH1zZ5J8o5DM28eq1dSLfyaAiXKkopp0frvKaHAzu+KSuF39vLpo2bBluf2E9D/y1bldeoXGjk1O97mLfZNCgaBbHV/cWjK0T9iMSjw5ZoyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751563681; c=relaxed/simple;
	bh=IybfEWRjtWPI3vgAe1K+ogML3aRIqiWylmbRMg2TS4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoSU7qLxq+GFNLJZq5vBy/LPa71XKfYpU0crTDJPoV+dw8EnVM8vFobZL4ukPddDdR7Js3Q21MjpcuqXZ0RKAJGMrbEIOYm9AsXs3n3Zc4JQulst1LCe9m1rErLukZ32+MUIaex3G/CprDtM1lJstkpH7GVhd1GSvqgiNtCbRAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4QmyCGY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4QmyCGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB48C4CEE3;
	Thu,  3 Jul 2025 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751563681;
	bh=IybfEWRjtWPI3vgAe1K+ogML3aRIqiWylmbRMg2TS4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4QmyCGYJccppXLi/utWO3Asz33p4If0D/yWQ2Vv8J0qRff2M5vTzpE1iT5Onnhyp
	 k7fmnhyVrcV5s/nrb7amumz4UlQc2Q3pXd7HUmunjuqUpFExA+qgpP4hu0Z3lgY1dR
	 ey79NaAsiwa3FtQxi1R/wYhLCZXZXDb08nXNs7Zr24zQQjvxT1I4aPf2iERYzrwpCe
	 TmRDYPLgsH62puoIVbift8wvH/ME3OtjpsoNeABXafwxj93A8Ja3beYswDETRDa+K0
	 r2iCeCZDwJt9qXa3HGm0q6xEiZUm1rNupCC2bMzSdAYtXIcqJ3VLyInllF13ETNkTe
	 MyZamdx2xwYEg==
Date: Thu, 3 Jul 2025 20:27:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Pratyush Yadav <ptyadav@amazon.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 3/3] cma: move allocation from HIGHMEM to a helper
 function
Message-ID: <aGa9mworOcOE6GhV@kernel.org>
References: <20250702173605.2198924-1-rppt@kernel.org>
 <20250702173605.2198924-4-rppt@kernel.org>
 <aGZTApK8WxFrTxI0@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGZTApK8WxFrTxI0@localhost.localdomain>

On Thu, Jul 03, 2025 at 11:53:06AM +0200, Oscar Salvador wrote:
> On Wed, Jul 02, 2025 at 08:36:05PM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > When CONFIG_HIGMEM is enabled, __cma_declare_contiguous_nid() first
> > tries to allocate the area from HIGHMEM and if that fails it falls back
> > to allocation from low memory.
> > 
> > Split allocation from HIGMEM into a helper function to further decouple
> > logic related to CONFIG_HIGHMEM.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  mm/cma.c | 52 +++++++++++++++++++++++++++++-----------------------
> >  1 file changed, 29 insertions(+), 23 deletions(-)
> > 
> > diff --git a/mm/cma.c b/mm/cma.c
> > index 1df8ff312d99..0a24c46f3296 100644
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -376,6 +376,30 @@ static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
> >  	return 0;
> >  }
> >  
> > +static phys_addr_t __init cma_alloc_highmem(phys_addr_t base, phys_addr_t size,
> > +			phys_addr_t align, phys_addr_t *limit, int nid)
> > +{
> > +	phys_addr_t addr = 0;
> > +
> > +	if (IS_ENABLED(CONFIG_HIGHMEM)) {
> > +		phys_addr_t highmem = __pa(high_memory - 1) + 1;
> > +
> > +		/*
> > +		 * All pages in the reserved area must come from the same zone.
> > +		 * If the requested region crosses the low/high memory boundary,
> > +		 * try allocating from high memory first and fall back to low
> > +		 * memory in case of failure.
> > +		 */
> > +		if (base < highmem && *limit > highmem) {
> > +			addr = memblock_alloc_range_nid(size, align, highmem,
> > +							*limit, nid, true);
> > +			*limit = highmem;
> > +		}
> > +	}
> 
> Not a big deal, but maybe better to do it in one function? Maybe even move
> the CONFIG_PHYS_ADDR_T_64BIT block in there as well? So memblock_alloc_range_nid()
> calls would be contained in one place and the X86_64/HIGHMEM comments as
> well.
> Just a thought.

Yeah, this will be neater, thanks!
Will send v2 shortly.

> -- 
> Oscar Salvador
> SUSE Labs

-- 
Sincerely yours,
Mike.
