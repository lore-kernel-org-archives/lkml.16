Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C7925B666;
	Wed,  9 Apr 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204515; cv=none; b=s1nGSbd9tzyyiMbBkrXeC3qAAbRZv6/+sudJFPts3C+SYdruRSZlwHibCOhiQviZXyKtbWSgGtb0bccI4LjaSzLUGbrVRt2jrRr80GogOT4HbPzJ8wRxl8nr5tjKldKORqF7FRLQ3+tE8jjoSEPBYNE2MfpPg3ZjrsSkMJlk6ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204515; c=relaxed/simple;
	bh=S15u78BKbSHh1fzKUfpf0wJOK432GkMnYgwe1vKsInk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUAD8VyxmiX8l4izfptykgSdajJ9WNz7DZLTNRO/jBnBGxwHEOopLCm0jbfXKTv+y2LZ8vj/DoY+SRpJyYlj3Q+6UsF1TK/xeUrEjjF3o+hUPlKymMh4hsZuovTvTLvmITm1ZvI+4kIYCwNF8GI5lp1VlIEUd+V1e5Jku9p+W1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDc6J0t0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDc6J0t0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D98C4CEE7;
	Wed,  9 Apr 2025 13:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744204514;
	bh=S15u78BKbSHh1fzKUfpf0wJOK432GkMnYgwe1vKsInk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDc6J0t0EzQjucGrX0fYRnnbfFGbB+cQfpVivNIqSiL01iuj2QPaABZ1DsziZ/82I
	 I6tINz1dLf/clN00vw8sip9ev7esPsaoolLYjDetj4uyzgSWXOmxSavofpNhG1nFIn
	 MXHCBwJ1OUdbhdlFyjKkl5e1VTl/n2L6570ywcTvSNbLKE2MAKtp0TCbb2XYpN44lH
	 WY10uAbIMfK5RJ0BWApbSGkqBDEB5Fkbc/eadVmdDdrnEwVpy7SR2yD/08pKdzANuv
	 UtxUDo8h2EsD9fsoBU0zNDgzqjjqP5WFXkdhn6DxNIDvOKCDTeCK2UqjzX48QmRpBL
	 wzwuim9Kzmb2A==
Date: Wed, 9 Apr 2025 15:15:07 +0200
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
Message-ID: <Z/Zy2zxD33/7sRrx@lpieralisi>
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

I will review and update accordingly.

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

Yes sure (and try to consolidate them as Thomas correctly pointed out).

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

Are you referring to KMALLOC_MAX_CACHE_SIZE or KMALLOC_MAX_SIZE ?

KMALLOC_MAX_SIZE is set according to MAX_PAGE_ORDER, that should
be fine for most set-ups (well, obviously implementations that
only support a 1-level IST can't expect a very large number of
IRQs -  we set that to 12 bits worth of IDs deliberately but
given the current memory allocation limits it can be much higher).

A 2-level IST can easily manage 24-bits worth of IDs split into
two-level tables with the current kmalloc() limits.

For the ITS DT and ITT the same reasoning goes, so the capping
is the (rare) exception not the rule and I don't expect this to be a
problem at all or I am missing something.

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

You don't understand why the GIC HW is not coherent or why we set it
up as such in the driver ?

> The only other idea I have would be to use an uncached allocation
> for the non-coherent case, the same way that dma_alloc_coherent()
> or maybe dma_alloc_wc() does. This still has the same problem
> with bypassing the dma-mapping.h interface because of the lack
> of a device pointer, but it would at least avoid the cache flushes
> at runtime. If I read this code right, the data in here is only
> written by the CPU and read by the GIC, so a WC buffer wouldn't
> be more expensive, right?

The IST is also written by the GIC, the CPU reads it (explicity, with a
memory read rather than through instructions) only if the table is two
level and we are allocating L2 entries on demand to check whether an
L2 entry is valid.

I am not sure the CMOs are that bad given that's what we do
for GICv3 already but it is worth looking into it.

Thanks,
Lorenzo
