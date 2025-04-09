Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D111DF247;
	Wed,  9 Apr 2025 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193516; cv=none; b=qTx9vuNF/g0fXfjVRnSlldlJl1iwzh8vK7g7LmO6cgJ7TjDKeVm6zAiNoEpvfwBvVFyoKJc1+rwH48fFJ7WtYYve0ZxO5W2Orn8Qlu0F2Ji+a/cY1aP2X9t2XQrYp73VKr776p/Tdbe1LSRpIPDZSNS4XUlcmXUpfvVRKa6498E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193516; c=relaxed/simple;
	bh=RGF42t7ba2gAeFKFDl+Vmbdg5+GzN+Zs2MtQQeMaOzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuTzgfXM/M+YDHbo//wgU5eZZDmGoOIP/3hRdVduYTPX4XxWJQGlG/Hi9sPVpeDHYExBQwn+T9XDgavtGUFBuWPECKh9T3KlyACUFlse+tDvumW8EtktWMQn3SCLz9FZ6KwqeOugjshgipHB7XTlkViLPXhdH+7Ca+s0oyxcvV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwUeGYpD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwUeGYpD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3749AC4CEE3;
	Wed,  9 Apr 2025 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744193515;
	bh=RGF42t7ba2gAeFKFDl+Vmbdg5+GzN+Zs2MtQQeMaOzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwUeGYpDLFK+5BGx2AbhI3UnKi4pDLqO80mF/ZArkv9w4uEn25194kz+ZQVL5Yfbq
	 1I2aYAqMrSfMogQbOKTS2P1eWRbIbsxujxh8wVKFsRDFefIzGt2yfVELOKkvb1peGc
	 ty4vT5Nqe7KmZQj+zTOyiPKansiizzmZMyEGr9vr6Yi0ms1BS0F4LKhc18kSO3Gxu6
	 oZfVrlAQKrHLsbcwlqWxtS+1pAgS8GgLzn9ZTrO/qJz/BZoJ4Pwr2ERQZlpyYFN03b
	 uVRedj9uJ57K+3l5aSvN3dazHwV1Jd8+Odd2YWOC8XeIS4kf5DIh88q5GbHR2VZpdT
	 pZ/4NmFqEm3RA==
Date: Wed, 9 Apr 2025 12:11:48 +0200
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
Message-ID: <Z/ZH5IBQAZ8rc9Cz@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>

On Wed, Apr 09, 2025 at 10:23:57AM +0200, Arnd Bergmann wrote:
> On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
> > @@ -22,12 +25,346 @@ static u32 irs_readl(struct gicv5_irs_chip_data 
> > *irs_data, const u64 reg_offset)
> >  	return readl_relaxed(irs_data->irs_base + reg_offset);
> >  }
> > 
> > +static u64 irs_readq(struct gicv5_irs_chip_data *irs_data, const u64 
> > reg_offset)
> > +{
> > +	return readq_relaxed(irs_data->irs_base + reg_offset);
> > +}
> > +
> >  static void irs_writel(struct gicv5_irs_chip_data *irs_data, const u32 
> > val,
> >  		       const u64 reg_offset)
> >  {
> >  	writel_relaxed(val, irs_data->irs_base + reg_offset);
> >  }
> > 
> > +static void irs_writeq(struct gicv5_irs_chip_data *irs_data, const u64 
> > val,
> > +		       const u64 reg_offset)
> > +{
> > +	writeq_relaxed(val, irs_data->irs_base + reg_offset);
> > +}
> 
> I think the use of _relaxed memory accessors needs some code
> comments here. The definition of these is that you don't care
> about ordering relative to DMA master accesses, yet you seem to
> very much have accesses to the 'ist' from the GIC, as well as
> DMA accesses from an MSI device, and I would expect both to
> require ordering.

For the 1-level (linear) IST we allocate it in one go, write
the base address through relaxed access (that sets the IST
valid) and poll completion with a relaxed access. Memory is
cleaned and invalidated from the cache (if the IRS is not
coherent) before the MMIO sequence above, which implies a
dsb().

After that memory is handed over to the GIC.

For a 2-level IST, the code that updates L1 entries already add
a dma_rmb() barrier (ie gicv5_irs_iste_alloc()) to make sure we
order MMIO wait completion with the subsequent cache invalidate
(again, in the yet hypothetical case where the IRS is not coherent).

I think I can add comments where the sequence to initialize the
tables is executed more than here, given that these helpers are
used for other purposes too.

> > +/* Wait for completion of an IST change */
> > +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data 
> > *irs_data)
> > +{
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
> > +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
> > +			USEC_PER_SEC);
> > +
> 
> What is the significance of the 1 second timeout? This is probably
> a million times longer than I would expect any hardware interaction
> to be specified to take. Are you waiting for another thread here?

It is arbitrary, agreed.

> > +	l2istsz = BIT(n + 1);
> > +	if (l2istsz > KMALLOC_MAX_SIZE) {
> > +		u8 lpi_id_cap = ilog2(KMALLOC_MAX_SIZE) - 2 + istsz;
> > +
> > +		pr_warn("Limiting LPI ID bits from %u to %u\n",
> > +			lpi_id_bits, lpi_id_cap);
> > +		lpi_id_bits = lpi_id_cap;
> > +		l2istsz = KMALLOC_MAX_SIZE;
> > +	}
> 
> The use of KMALLOC_MAX_SIZE seem arbitrary here. I remember discussing
> this in the past and concluding that this is fine for all cases
> that may be relevant, but it would be good to explain the reasoning
> in a comment.

We need contiguous physical memory that can be < PAGE_SIZE or larger.

For allocations larger than the allocator caches kmalloc hands over to
the page allocator, MAX_ORDER is reflected into KMALLOC_MAX_SIZE AFAIU.

That's the reasoning. Does it make sense ?

> > +	if (irs_data->flags & IRS_FLAGS_NON_COHERENT)
> > +		dcache_clean_inval_poc((unsigned long)ist,
> > +				       (unsigned long)ist + l2istsz);
> > +	else
> > +		dsb(ishst);
> ...
> > +	baser = (virt_to_phys(ist) & GICV5_IRS_IST_BASER_ADDR_MASK) |
> > +		FIELD_PREP(GICV5_IRS_IST_BASER_VALID, 0x1);
> 
> Here it seems like you are open-coding the DMA mapping interface
> details, in particular the mapping of the 'ist' memory area into
> the gic's DMA master space, the coherency and the barrier that is
> normally part of a (non-relaxed) writeq().  Is there a reason
> you can't use the normal interfaces here, using dma_alloc_coherent()
> or dma_alloc_noncoherent()?

The GIC IRS must be brought up early, it is not a struct device.

> Do you expect actual implementation to not be cache-coherent?

It is allowed by the architecture - I don't have a crystal ball
but if I want to add support for a non-coherent IRS the DMA mapping
like sequence above has to be there - alternatives are welcome.

Thanks a lot for reviewing.

Lorenzo
