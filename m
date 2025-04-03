Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536F7F7FC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689412; cv=none; b=TYm8alCi8lIP4dFCrdtYPlqnRH1aOjTPqWYTRdzH/xEPtbHZs/CV8VjoMclUDUC+8q1xs+1j/2sHtw7xW8VcvMcLl+IXMDuRwYv78terUXT7AQM4XtWllMaozOTa1a6flSvBiY4v9tXyQSGHJM8QR/J2yB/GHqqtolLQ1VrhHbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689412; c=relaxed/simple;
	bh=HehmzWN07oImSDzOXjOMFAC9bLomTxZFRkiMNjxI5FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icmOizhuEMDttNTeeCWfAS11uEOhxveKpMxD39UgfVGu2XlRivD5ryrLVna3I5kJ1jqKM0NLcPYF2JYVYHR8PJQEGYHKfbtrYTCwRnfs+MUyupUC/Sf97WXzi/loe2W0EC8R15lMExyA2rETQOuDhBv2FDZETMl8alRRR8FJr0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4tCPFYY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4tCPFYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A22C4CEE3;
	Thu,  3 Apr 2025 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743689412;
	bh=HehmzWN07oImSDzOXjOMFAC9bLomTxZFRkiMNjxI5FQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4tCPFYYYPGoaZWejEYhyx1y7zD3cp3NTUeFqKkYekF1dCNx8KDC4P0g66yoeO4fj
	 IwQeRmrNwV+NXJciR0mgdgA6w6dLUogofUeFKcS6brgieJ4VEzsExBZsOaZYHtc5fR
	 sLRe6uQRvYTJw2G5EZMRtQ8sydPfG4I8GEmaP/Gm2jeQtdppNQCAGEDSHnU9vhK7Hq
	 SFXipEe7jLpRvLbkwRKX3pJWCXfRBYqfkk9EXc8forpXVlHdDUfdZ3Vo4TcIpD8vk9
	 ui6dBY5E6bgi5+Ffe916I7e/DwfPLsM9iBqNRXH9PJO1hX3BTGEisqGFtMeFiPRumM
	 2X0cBdR7DNuXg==
Date: Thu, 3 Apr 2025 17:10:03 +0300
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
Subject: Re: [RFC PATCH 3/3] mm: Implement for_each_valid_pfn() for
 CONFIG_SPARSEMEM
Message-ID: <Z-6WuzNDSwPN4Enn@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-3-dwmw2@infradead.org>
 <Z-4phOInXZlxFwk9@kernel.org>
 <e465ba32fb34b31eddb18890587960671b73234f.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e465ba32fb34b31eddb18890587960671b73234f.camel@infradead.org>

On Thu, Apr 03, 2025 at 08:07:22AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 09:24 +0300, Mike Rapoport wrote:
> > with a small nit below
> > 
> > > +static inline bool first_valid_pfn(unsigned long *p_pfn)
> > > +{
> > > +	unsigned long pfn = *p_pfn;
> > > +	unsigned long nr = pfn_to_section_nr(pfn);
> > > +	struct mem_section *ms;
> > > +	bool ret = false;
> > > +
> > > +	ms = __pfn_to_section(pfn);
> > > +
> > > +	rcu_read_lock_sched();
> > > +
> > > +	while (!ret && nr <= __highest_present_section_nr) {
> > 
> > This could be just for(;;), we anyway break when ret becomes true or we get
> > past last present section.
> 
> True for the 'ret' part but not *nicely* for the last present section.
> If the original pfn is higher than the last present section it could
> trigger that check before entering the loop.
> 
> Yes, in that case 'ms' will be NULL, valid_section(NULL) is false and
> you're right that it'll make it through to the check in the loop
> without crashing. So it would currently be harmless, but I didn't like
> it. It's relying on the loop not to do the wrong thing with an input
> which is arguably invalid.
> 
> I'll see if I can make it neater. I may drop the 'ret' variable
> completely and just turn the match clause into unlock-and-return-true.
> I *like* having a single unlock site. But I think I like simpler loop
> code more than that.
> 
> FWIW I think the check for (PHYS_PFN(PFN_PHYS(pfn)) != pfn) at the
> start of pfn_valid() a few lines above is similarly redundant. Because
> if the high bits are set in the PFN then pfn_to_section_nr(pfn) is
> surely going to be higher than NR_MEM_SECTIONS and it'll get thrown out
> at the very next check, won't it?

I believe the check for (PHYS_PFN(PFN_PHYS(pfn)) != pfn) got to the generic
version from arm64::pfn_valid() that historically supported both FLATMEM
and SPARSEMEM.

I can't think of a configuration in which (PHYS_PFN(PFN_PHYS(pfn)) != pfn)
and pfn_to_section_nr(pfn) won't be higher than NR_MEM_SECTIONS, but with
all variants that arm64 has for PAGE_SHIFT and ARM64_PA_BITS I could miss
something.
 
> I care because I didn't bother to duplicate that 'redundant' check in
> my first_valid_pfn(), so if there's a reason for it that I'm missing, I
> should take a closer look.
> 
> I'm also missing the reason why the FLATMEM code in memory_model.h does
> 'unsigned long pfn_offset = ARCH_PFN_OFFSET' and then uses its local
> pfn_offset variable, instead of just using ARCH_PFN_OFFSET directly as
> I do in the FLATMEM for_each_valid_pfn() macro.

Don't remember now, but I surely had some $REASON for that :) 

-- 
Sincerely yours,
Mike.
