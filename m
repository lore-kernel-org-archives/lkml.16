Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3EB2686AA;
	Fri, 18 Apr 2025 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968086; cv=none; b=M0nlx3GbjqPKyqxy/6UzeKor8IV2v4BdPMKIf7wlhSbrG6sCdnX4J5ByJP1qpQ03piSxr8lO14SxdHE0U7WatcjkFDeOkK1hhMMk8lb7UizKlVmsj5c0nrUWi8LEnqm+76lvQdRwDW/SoA7WITJBPkpH6JXyeP8OmsRw7uDseVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968086; c=relaxed/simple;
	bh=fNbzTX4bJUFtShrgr0Hcpqfmfa8a26KAiBIpBmZ1Y5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2GhtIemQYjOVwwKPpRie4Jz94qZr/TJ8+/MOER15fLlsS7V9VhZ0eQab0jVElek3esOcokzd3YYH/jYdOB4PRJ7Cr7HTAz7hU4CiO/MS1HxkjtxGYqJbmGDD6I+b3FNxpYqBXpWnLUAf6yk8r0WGOvgqM01Ixmim0Ep8idQvAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knANdacn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knANdacn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A5CC4CEE2;
	Fri, 18 Apr 2025 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744968085;
	bh=fNbzTX4bJUFtShrgr0Hcpqfmfa8a26KAiBIpBmZ1Y5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knANdacnNuaugZ83fQ0Ue9T/dgGs3AOR6+QIIf58yLS1+d3wGg0cdf1CUFgSIBzUm
	 VSMwOvRQJmm36D01HBjkZaSym1mEJ3yjMZ5ILZ2uA3jJOHzLJaiZdiC1VDUwxrgRcn
	 WudtkGo7S+d3MVkl65q0ZMqS4LXvUgWe/U6ECWU912+ESI+z4H55UVRkXsmaEm26Tw
	 y2Kb5bfLj8WDc60MwLF4qSv0EFUid1VDm+sfc7FX/w/UitXMOgEwWOr72W9s7GLZC0
	 w1qvv31QY90Iwml+d1VMnrDYUdt2L8bbdswAP1SO2pwcyEhu2kVJOjvMw4YzmdlRjK
	 Sx7fKHlyrsgWA==
Date: Fri, 18 Apr 2025 11:21:18 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <aAIZjmzlGxIHCuJl@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>
 <Z/ZH5IBQAZ8rc9Cz@lpieralisi>
 <e7e4e9f0-a9e4-48d4-9bed-a4c52453ee8e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7e4e9f0-a9e4-48d4-9bed-a4c52453ee8e@app.fastmail.com>

On Wed, Apr 09, 2025 at 12:56:52PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 9, 2025, at 12:11, Lorenzo Pieralisi wrote:
> > On Wed, Apr 09, 2025 at 10:23:57AM +0200, Arnd Bergmann wrote:
> >> On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
> >> > +static void irs_writeq(struct gicv5_irs_chip_data *irs_data, const u64 
> >> > val,
> >> > +		       const u64 reg_offset)
> >> > +{
> >> > +	writeq_relaxed(val, irs_data->irs_base + reg_offset);
> >> > +}
> >> 
> >> I think the use of _relaxed memory accessors needs some code
> >> comments here. The definition of these is that you don't care
> >> about ordering relative to DMA master accesses, yet you seem to
> >> very much have accesses to the 'ist' from the GIC, as well as
> >> DMA accesses from an MSI device, and I would expect both to
> >> require ordering.
> >
> > For the 1-level (linear) IST we allocate it in one go, write
> > the base address through relaxed access (that sets the IST
> > valid) and poll completion with a relaxed access. Memory is
> > cleaned and invalidated from the cache (if the IRS is not
> > coherent) before the MMIO sequence above, which implies a
> > dsb().
> >
> > After that memory is handed over to the GIC.
> >
> > For a 2-level IST, the code that updates L1 entries already add
> > a dma_rmb() barrier (ie gicv5_irs_iste_alloc()) to make sure we
> > order MMIO wait completion with the subsequent cache invalidate
> > (again, in the yet hypothetical case where the IRS is not coherent).
> >
> > I think I can add comments where the sequence to initialize the
> > tables is executed more than here, given that these helpers are
> > used for other purposes too.
> 
> Usually my recommendation is to have abstractions like this
> provide both relaxed and normal variants, and then only
> use the relaxed ones where it really matters for performance.
> 
> That way you can keep relatively short explanations where
> you call irs_writeq_relaxed() and use irs_writeq() without
> any code comments any place that doesn't care about saving
> a few cycles per call.

Technically, memory is always handed over to the GIC following a GICv5
MMIO register poll that guarantees the GIC has seen the change (whether
it is making an IST table valid, or enabling an ITS - that in turn means
device table (DT) translations are enabled).

One thing I could do is to make the readl_relaxed_poll_timeout_atomic()
readl_poll_timeout_atomic() on those "completion registers", which adds
the required barriers (I can add a comment to the related calling
sites).

That should also allow me to remove the dma_rmb() barrier that I need in:

gicv5_irs_iste_alloc()

to prevent the CPU from issuing a cache invalidation before the

readl_relaxed_poll_timeout_atomic()

loop has completed.

I don't see any other corner case where the _relaxed version would
not work I tried to follow other drivers where AFAICS the relaxed
version is used by default unless the non-relaxed one is strictly
needed (GICv3/SMMUv3).

I can obviously update the {irs/its}_ helpers to add a relaxed
name to make sure it is more obvious to understand what they do.

Would that work ?

Thanks,
Lorenzo

> >> > +/* Wait for completion of an IST change */
> >> > +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data 
> >> > *irs_data)
> >> > +{
> >> > +	int ret;
> >> > +	u32 val;
> >> > +
> >> > +	ret = readl_relaxed_poll_timeout_atomic(
> >> > +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
> >> > +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
> >> > +			USEC_PER_SEC);
> >> > +
> >> 
> >> What is the significance of the 1 second timeout? This is probably
> >> a million times longer than I would expect any hardware interaction
> >> to be specified to take. Are you waiting for another thread here?
> >
> > It is arbitrary, agreed.
> 
> Can you make either much shorter, or non-atomic then?
> 
> >> > +	l2istsz = BIT(n + 1);
> >> > +	if (l2istsz > KMALLOC_MAX_SIZE) {
> >> > +		u8 lpi_id_cap = ilog2(KMALLOC_MAX_SIZE) - 2 + istsz;
> >> > +
> >> > +		pr_warn("Limiting LPI ID bits from %u to %u\n",
> >> > +			lpi_id_bits, lpi_id_cap);
> >> > +		lpi_id_bits = lpi_id_cap;
> >> > +		l2istsz = KMALLOC_MAX_SIZE;
> >> > +	}
> >> 
> >> The use of KMALLOC_MAX_SIZE seem arbitrary here. I remember discussing
> >> this in the past and concluding that this is fine for all cases
> >> that may be relevant, but it would be good to explain the reasoning
> >> in a comment.
> >
> > We need contiguous physical memory that can be < PAGE_SIZE or larger.
> >
> > For allocations larger than the allocator caches kmalloc hands over to
> > the page allocator, MAX_ORDER is reflected into KMALLOC_MAX_SIZE AFAIU.
> >
> > That's the reasoning. Does it make sense ?
> 
> I'm more worried about what happens when KMALLOC_MAX_SIZE is
> really small -- did you show that the allocation is still
> going to work, or is this likely to cause runtime problems?
> 
> >> > +	if (irs_data->flags & IRS_FLAGS_NON_COHERENT)
> >> > +		dcache_clean_inval_poc((unsigned long)ist,
> >> > +				       (unsigned long)ist + l2istsz);
> >> > +	else
> >> > +		dsb(ishst);
> >> ...
> >> > +	baser = (virt_to_phys(ist) & GICV5_IRS_IST_BASER_ADDR_MASK) |
> >> > +		FIELD_PREP(GICV5_IRS_IST_BASER_VALID, 0x1);
> >> 
> >> Here it seems like you are open-coding the DMA mapping interface
> >> details, in particular the mapping of the 'ist' memory area into
> >> the gic's DMA master space, the coherency and the barrier that is
> >> normally part of a (non-relaxed) writeq().  Is there a reason
> >> you can't use the normal interfaces here, using dma_alloc_coherent()
> >> or dma_alloc_noncoherent()?
> >
> > The GIC IRS must be brought up early, it is not a struct device.
> 
> Right, that is rather unfortunate.
> 
> >> Do you expect actual implementation to not be cache-coherent?
> >
> > It is allowed by the architecture - I don't have a crystal ball
> > but if I want to add support for a non-coherent IRS the DMA mapping
> > like sequence above has to be there - alternatives are welcome.
> 
> I see that we have a few GICv3 implementations that are marked
> as non-coherent in DT. I don't understand why they'd do that,
> but I guess there is not much to be done about it.
> 
> The only other idea I have would be to use an uncached allocation
> for the non-coherent case, the same way that dma_alloc_coherent()
> or maybe dma_alloc_wc() does. This still has the same problem
> with bypassing the dma-mapping.h interface because of the lack
> of a device pointer, but it would at least avoid the cache flushes
> at runtime. If I read this code right, the data in here is only
> written by the CPU and read by the GIC, so a WC buffer wouldn't
> be more expensive, right?
> 
>        Arnd
