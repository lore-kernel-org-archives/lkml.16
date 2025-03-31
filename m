Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5740621481D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432637; cv=none; b=V5nbpES5kgS/NjZ9FrmMFE0wX51vjGy8EAlTM7yBaMfVbH+3tR4CexzYuzpMFQ+oWKJNh2/EB+PXQ/T6XVQHspL9lrAKZ5yzS115MdnFr8p1pQMTRyvrapnMWKo2Am+5urQ0cmCHpf7IcTubmmBu8CksuMZDUawrVH7zXRC4vTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432637; c=relaxed/simple;
	bh=FTaAsuzDgScULEa02h8I/KNCYnX/qyk7KV1ALoaDZs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axbeobTFLfodHgpwD3CLhJrxC1FWA284rZ5h57M550xJmHpCOYYfUmQxdNFZpBYQPPW9qA7AMwmrXu0qcnANGiWeK9pV2dE8fDtjho6n2H09emiOTMa3AfmFbE9Kl+XdKsuzc9sKcOTnOvHaD51H6nUnWMeGIRReGn67/Rijt0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shaZyKxL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shaZyKxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6E8C4CEE9;
	Mon, 31 Mar 2025 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432636;
	bh=FTaAsuzDgScULEa02h8I/KNCYnX/qyk7KV1ALoaDZs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shaZyKxLgMY8DS0iCKCgkVYFlABwij1skMdGY9k3ZPmigFjci2tnfEFztXKlJA1bS
	 GEPb5CloQZq2aY9yamsUPgO/kHWjiVvE9z3nFAwVchbx+2n5BgQo5ZJRlywt92MiYl
	 GdGUp1wufn4YUtmHNH8uWQpMyN8q1N0eeahFxUDAmeghZMjM6t+e9uQCgE5JIo1P4p
	 /PGIhT7Ez+s7bYKO8e9qFQdWK6uLhsRYAA+vyHAEfJ3fEwOY4x5gCQnC8so/tvlqLr
	 QVqLlNOihd5SMjkGER2LZoiNBUFPP45NoV1QsKqCQPkocjt9Rv4JAbAtC66S5JnHs2
	 1t9M6BxvlvARQ==
Date: Mon, 31 Mar 2025 17:50:28 +0300
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
Message-ID: <Z-qrtJ6cs-kXpepR@kernel.org>
References: <20210511100550.28178-1-rppt@kernel.org>
 <20210511100550.28178-3-rppt@kernel.org>
 <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>

On Mon, Mar 31, 2025 at 01:50:33PM +0100, David Woodhouse wrote:
> On Tue, 2021-05-11 at 13:05 +0300, Mike Rapoport wrote:
> >  
> > +static void __init memmap_init_reserved_pages(void)
> > +{
> > +	struct memblock_region *region;
> > +	phys_addr_t start, end;
> > +	u64 i;
> > +
> > +	/* initialize struct pages for the reserved regions */
> > +	for_each_reserved_mem_range(i, &start, &end)
> > +		reserve_bootmem_region(start, end);
> > +
> > +	/* and also treat struct pages for the NOMAP regions as PageReserved */
> > +	for_each_mem_region(region) {
> > +		if (memblock_is_nomap(region)) {
> > +			start = region->base;
> > +			end = start + region->size;
> > +			reserve_bootmem_region(start, end);
> > +		}
> > +	}
> > +}
> > +
> 
> In some cases, that whole call to reserve_bootmem_region() may be a no-
> op because pfn_valid() is not true for *any* address in that range.
> 
> But reserve_bootmem_region() spends a long time iterating of them all,
> and eventually doing nothing:
> 
> void __meminit reserve_bootmem_region(phys_addr_t start,
>                                       phys_addr_t end, int nid)
> {
>         unsigned long start_pfn = PFN_DOWN(start);
>         unsigned long end_pfn = PFN_UP(end);
> 
>         for (; start_pfn < end_pfn; start_pfn++) {
>                 if (pfn_valid(start_pfn)) {
>                         struct page *page = pfn_to_page(start_pfn);
> 
>                         init_reserved_page(start_pfn, nid);
> 
>                         /*
>                          * no need for atomic set_bit because the struct
>                          * page is not visible yet so nobody should
>                          * access it yet.
>                          */
>                         __SetPageReserved(page);
>                 }
>         }
> }
> 
> On platforms with large NOMAP regions (e.g. which are actually reserved
> for guest memory to keep it out of the Linux address map and allow for
> kexec-based live update of the hypervisor), this pointless loop ends up
> taking a significant amount of time which is visible as guest steal
> time during the live update.
> 
> Can reserve_bootmem_region() skip the loop *completely* if no PFN in
> the range from start to end is valid? Or tweak the loop itself to have
> an 'else' case which skips to the next valid PFN? Something like
> 
>  for(...) {
>     if (pfn_valid(start_pfn)) {
>        ...
>     } else {
>        start_pfn = next_valid_pfn(start_pfn);
>     }
>  }

My understanding is that you have large reserved NOMAP ranges that don't
appear as memory at all, so no memory map for them is created and so
pfn_valid() is false for pfns in those ranges.

If this is the case one way indeed would be to make
reserve_bootmem_region() skip ranges with no valid pfns.

Another way could be to memblock_reserved_mark_noinit() such ranges and
then reserve_bootmem_region() won't even get called, but that would require
firmware to pass that information somehow.

-- 
Sincerely yours,
Mike.
