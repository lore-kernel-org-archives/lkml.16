Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48B53FBB3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513602; cv=none; b=cBfQySdVXOJzlyZkgqIeBu9linyunCzC0pkjlhvdRAsrfpbADuRKOYBiRG+0iSjEtSREh2pljQAuq1/RiAwxzrFgWEyI+zHg673DyKjd7AS5ZRBhIj8z4o49OvEm3x44lNOBNmi0ls3k8ZfSK+RtavcHmGp8nG1pg5v3tXC3xvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513602; c=relaxed/simple;
	bh=9wSJvejkq5NxPrQKr0Jhsiek8qkHChwl57pzJsxs7qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab1iV8TmiG/Em0jgt8oY8geaVWLm49rDxPFZcP0j+0l9pj/49E8KlkbMyW5jRoG8yRNj8zJwhEI+UFuwCiTlE0DvMOkXvy51nydWSVlDVS15oKImfuQaX520S6EdbG47KmtUutuREYmQDio9G3Rq1f/BfbFs0MQVsLj2LbqRhQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIaDl7Mv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIaDl7Mv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE0CC4CEE4;
	Tue,  1 Apr 2025 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743513602;
	bh=9wSJvejkq5NxPrQKr0Jhsiek8qkHChwl57pzJsxs7qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YIaDl7MvazjElWMG6+MRQRAKFy4pTiPH2Y5kKB+bwOeQGRBx28iNTxNhm+kBGiDtp
	 4YKO8ZQVxGwwSlju1t7NgbfrcAPwjIo8gvofNVbWgUvO0GBU0+rwWFjhkT3apkAmJ4
	 uY6pQqwyoDvqNlDYRZ6RCPga2q3TC6ojEw3OP+LuTxjk5AxZLRDTvJDoDvb6gOWS6h
	 jWngKU0OhKMznLLv+XUMAgOMR4RZ/zSX670RxahSYlQ+eSNB6tA5K2+nNlGWzX4fN9
	 HG0WNS17ib8DRY6FK3ZVY7oTA0kM7Eb5cnhK7WDEDKBVJRdkqT7xn73igeNcfTzWSk
	 KgnRbPM3oyH6A==
Date: Tue, 1 Apr 2025 16:19:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 2/4] memblock: update initialization of reserved pages
Message-ID: <Z-vn-sMtNfwyJ9VW@kernel.org>
References: <20210511100550.28178-1-rppt@kernel.org>
 <20210511100550.28178-3-rppt@kernel.org>
 <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>
 <Z-qrtJ6cs-kXpepR@kernel.org>
 <b47d5f5602573bd082be3729ceddb3d1dc374ef1.camel@infradead.org>
 <Z-vPBu5vAvFhYDzP@kernel.org>
 <1787b97c267b53127c60a61419d99751f8a66b1a.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1787b97c267b53127c60a61419d99751f8a66b1a.camel@infradead.org>

On Tue, Apr 01, 2025 at 12:50:33PM +0100, David Woodhouse wrote:
> On Tue, 2025-04-01 at 14:33 +0300, Mike Rapoport wrote:
> > On Mon, Mar 31, 2025 at 04:13:56PM +0100, David Woodhouse wrote:
> > > On Mon, 2025-03-31 at 17:50 +0300, Mike Rapoport wrote:
> > > > On Mon, Mar 31, 2025 at 01:50:33PM +0100, David Woodhouse wrote:
> > > > > On Tue, 2021-05-11 at 13:05 +0300, Mike Rapoport wrote:
> > > > > 
> > > > > On platforms with large NOMAP regions (e.g. which are actually reserved
> > > > > for guest memory to keep it out of the Linux address map and allow for
> > > > > kexec-based live update of the hypervisor), this pointless loop ends up
> > > > > taking a significant amount of time which is visible as guest steal
> > > > > time during the live update.
> > > > > 
> > > > > Can reserve_bootmem_region() skip the loop *completely* if no PFN in
> > > > > the range from start to end is valid? Or tweak the loop itself to have
> > > > > an 'else' case which skips to the next valid PFN? Something like
> > > > > 
> > > > >  for(...) {
> > > > >     if (pfn_valid(start_pfn)) {
> > > > >        ...
> > > > >     } else {
> > > > >        start_pfn = next_valid_pfn(start_pfn);
> > > > >     }
> > > > >  }
> > > > 
> > > > My understanding is that you have large reserved NOMAP ranges that don't
> > > > appear as memory at all, so no memory map for them is created and so
> > > > pfn_valid() is false for pfns in those ranges.
> > > > 
> > > > If this is the case one way indeed would be to make
> > > > reserve_bootmem_region() skip ranges with no valid pfns.
> > > > 
> > > > Another way could be to memblock_reserved_mark_noinit() such ranges and
> > > > then reserve_bootmem_region() won't even get called, but that would require
> > > > firmware to pass that information somehow.
> > > 
> > > I was thinking along these lines (not even build tested)...
> > > 
> > > I don't much like the (unsigned long)-1 part. I might make the helper
> > > 'static inline bool first_valid_pfn (unsigned long *pfn)' and return
> > > success or failure. But that's an implementation detail.
> > > 
> > > index 6d1fb6162ac1..edd27ba3e908 100644
> > > --- a/include/asm-generic/memory_model.h
> > > +++ b/include/asm-generic/memory_model.h
> > > @@ -29,8 +29,43 @@ static inline int pfn_valid(unsigned long pfn)
> > >         return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
> > >  }
> > >  #define pfn_valid pfn_valid
> > > +
> > > +static inline unsigned long first_valid_pfn(unsigned long pfn)
> > > +{
> > > +       /* avoid <linux/mm.h> include hell */
> > > +       extern unsigned long max_mapnr;
> > > +       unsigned long pfn_offset = ARCH_PFN_OFFSET;
> > > +
> > > +       if (pfn < pfn_offset)
> > > +               return pfn_offset;
> > > +
> > > +       if ((pfn - pfn_offset) < max_mapnr)
> > > +               return pfn;
> > > +
> > > +       return (unsigned long)(-1);
> > > +}
> > 
> > This seems about right for FLATMEM. For SPARSEMEM it would be something
> > along these lines (I kept dubious -1):
> 
> Thanks. Is that right even with CONFIG_SPARSEMEM_VMEMMAP? It seems that
> it's possible for pfn_valid() to be false for a given *page*, but there
> may still be valid pages in the remainder of the same section in that
> case? 

Right, it might after memory hot-remove. At boot the entire section either
valid or not.
 
> I think it should only skip to the next section if the current section
> doesn't exist at all, not just when pfn_section_valid() return false?

Yeah, when pfn_section_valid() returns false it should itereate pfns until
the end of the section and check if they are valid. 
 
> I also wasn't sure how to cope with the rcu_read_lock_sched() that
> happens in pfn_valid(). What's that protecting against? Does it mean
> that by the time pfn_valid() returns true, that might not be the
> correct answer any more?
 
That's protecting against kfree_rcu() in section_deactivate() so even if
the answer is still correct, later access to apparently valid struct page
may blow up :/ 

> > static inline unsigned long first_valid_pfn(unsigned long pfn)
> > {
> > 	unsigned long nr = pfn_to_section_nr(pfn);
> > 
> > 	do {
> > 		if (pfn_valid(pfn))
> > 			return pfn;
> > 		pfn = section_nr_to_pfn(nr++);
> > 	} while (nr < NR_MEM_SECTIONS);
> > 
> > 	return (unsigned long)-1;
> > }

-- 
Sincerely yours,
Mike.
