Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272EC1F0E2C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507215; cv=none; b=Oj4Snv6sdI5d/Nb5NrLBi//Ce9lk78tQNYGpk6KgR6+L4Fr2RombpMVfPkxiagc8KcU7XRJW+CF3Dselk8t/HjBCW/u3Clv8utjoKVanl1n7DluCf/VIRbtm957hkPW6tKKaoeE2XaP5wSe0yZTLXdqJiBsTTqFCXegiXgpx+gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507215; c=relaxed/simple;
	bh=MSiUoVdDeD/owNol8s9zGlBrDOxClJLf4FDx5m/hEsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgIgtyLGh5fyOFXUrls8mQcOscCD7O7Ziq3XAX1xZVUW3UHfm7Ts2GDWrMYBmKg4aR3yff5eQnD0BtnT7zztNxTli8YbPOh20ILQ+LAbz2OSBwuD2JdaEZwHnpPcrIdiaQzeDKYhFEV3MJQFjk2pBj3GFlY4oSWqB6ODF+Z3tPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQ7+TlbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQ7+TlbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D89C4CEE4;
	Tue,  1 Apr 2025 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743507214;
	bh=MSiUoVdDeD/owNol8s9zGlBrDOxClJLf4FDx5m/hEsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQ7+TlbZFGday6F66wCc6Mj8FCsVOgzRf3x/EBAEeFRwGpJMFImo4y+kbZrIow662
	 ta53p8FR4siSwV0A+kRdo9nX82WVlFPI/6QS5KPCe7b8wrCiVlhpZAsKX95vqxrS1I
	 O6QuwcWWBQ9je8KrhEJNr268w2jvLZgKO/ASMrsjB0FSMA957/ULchEGwkawZwGKzJ
	 JQbPLAmiGEPDKTF2NwWVGuXvoKl0OudXGBO0QH6TyB59bmMLAcHd7DJT69km6gnaQK
	 LLSkabpmai4IP0/hzPWvudn4o9K+ZHbx6+OEnKlP4v3ITB3Y1F7a74aydHecpONRus
	 6qlDxiICUnX+Q==
Date: Tue, 1 Apr 2025 14:33:26 +0300
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
Message-ID: <Z-vPBu5vAvFhYDzP@kernel.org>
References: <20210511100550.28178-1-rppt@kernel.org>
 <20210511100550.28178-3-rppt@kernel.org>
 <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>
 <Z-qrtJ6cs-kXpepR@kernel.org>
 <b47d5f5602573bd082be3729ceddb3d1dc374ef1.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b47d5f5602573bd082be3729ceddb3d1dc374ef1.camel@infradead.org>

On Mon, Mar 31, 2025 at 04:13:56PM +0100, David Woodhouse wrote:
> On Mon, 2025-03-31 at 17:50 +0300, Mike Rapoport wrote:
> > On Mon, Mar 31, 2025 at 01:50:33PM +0100, David Woodhouse wrote:
> > > On Tue, 2021-05-11 at 13:05 +0300, Mike Rapoport wrote:
> > > 
> > > On platforms with large NOMAP regions (e.g. which are actually reserved
> > > for guest memory to keep it out of the Linux address map and allow for
> > > kexec-based live update of the hypervisor), this pointless loop ends up
> > > taking a significant amount of time which is visible as guest steal
> > > time during the live update.
> > > 
> > > Can reserve_bootmem_region() skip the loop *completely* if no PFN in
> > > the range from start to end is valid? Or tweak the loop itself to have
> > > an 'else' case which skips to the next valid PFN? Something like
> > > 
> > >  for(...) {
> > >     if (pfn_valid(start_pfn)) {
> > >        ...
> > >     } else {
> > >        start_pfn = next_valid_pfn(start_pfn);
> > >     }
> > >  }
> > 
> > My understanding is that you have large reserved NOMAP ranges that don't
> > appear as memory at all, so no memory map for them is created and so
> > pfn_valid() is false for pfns in those ranges.
> > 
> > If this is the case one way indeed would be to make
> > reserve_bootmem_region() skip ranges with no valid pfns.
> > 
> > Another way could be to memblock_reserved_mark_noinit() such ranges and
> > then reserve_bootmem_region() won't even get called, but that would require
> > firmware to pass that information somehow.
> 
> I was thinking along these lines (not even build tested)...
> 
> I don't much like the (unsigned long)-1 part. I might make the helper
> 'static inline bool first_valid_pfn (unsigned long *pfn)' and return
> success or failure. But that's an implementation detail.
> 
> index 6d1fb6162ac1..edd27ba3e908 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -29,8 +29,43 @@ static inline int pfn_valid(unsigned long pfn)
>         return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
>  }
>  #define pfn_valid pfn_valid
> +
> +static inline unsigned long first_valid_pfn(unsigned long pfn)
> +{
> +       /* avoid <linux/mm.h> include hell */
> +       extern unsigned long max_mapnr;
> +       unsigned long pfn_offset = ARCH_PFN_OFFSET;
> +
> +       if (pfn < pfn_offset)
> +               return pfn_offset;
> +
> +       if ((pfn - pfn_offset) < max_mapnr)
> +               return pfn;
> +
> +       return (unsigned long)(-1);
> +}

This seems about right for FLATMEM. For SPARSEMEM it would be something
along these lines (I kept dubious -1):

static inline unsigned long first_valid_pfn(unsigned long pfn)
{
	unsigned long nr = pfn_to_section_nr(pfn);

	do {
		if (pfn_valid(pfn))
			return pfn;
		pfn = section_nr_to_pfn(nr++);
	} while (nr < NR_MEM_SECTIONS);

	return (unsigned long)-1;
}

-- 
Sincerely yours,
Mike.
