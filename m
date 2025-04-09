Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3438B13B59B;
	Wed,  9 Apr 2025 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194649; cv=none; b=HTwYmIlhmq3pO05k2ek0ivkFut3J4BzdD+E6g3D5G6++QLvpQXe08FTElBDjnVKba0ZVC3ruCbDGB0KRD8d87o9kD8M+iRJYqIrrIogfF903xAVpVSEGeYmRyELAU3LZsE/rik/PPeKeuC3pEWdyjjJ3BZhAGcnbRGZdGegzTj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194649; c=relaxed/simple;
	bh=CIzSWQr2fxowjjcyE1pGFvoBUxHTEzwh5eGjyymix3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKbHVvxXgBj+Pvi+ykO/ctyLt08Z5mf5/FlH0DIM9Td5E1HqhQ8wu2PfAZAT69IcIBc7UHGRhNu3cEIhdXxvFEQbAfD5Hgj/ndrm9rDWFGjLqpAsT9KYd69bl/RQkwo2EcGoiAmqOMeaFsmPg5rB+BLgyUBelHSiSOhb8LhibQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWmn87rl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWmn87rl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E2FC4CEE3;
	Wed,  9 Apr 2025 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744194648;
	bh=CIzSWQr2fxowjjcyE1pGFvoBUxHTEzwh5eGjyymix3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWmn87rlAUQYXSgWIh045wU/TuVqaNrrIrAVIA9E0PcXE1XiZHj4Ox8Y/420Wqy8P
	 Su+jrC/cfSsF3QJ9S9GWhW42ZNOkT0TfmDg8e7AbdLmsAqiReN7nTU068EbxZBI7BM
	 zYMq1vhcLyfg0E9GgXqhl6ns9f9uRh8tfJywEShHCl1G3XFgHXgNU/djyK7bQbRexR
	 HTRXKkn38VXbUu0iurAKH7lGf4h5vO5gTAdkXTHErirnfjZc0PCEfzcZvAK9/Y+/XD
	 N9ByBmt5FVUqPUaiQ3pEIVWq1rCFRKOD5QtXFcJ8TwS+KL9zXHzhjqyKQ+t3b/NbVp
	 /m39+4Fj4yPZg==
Date: Wed, 9 Apr 2025 12:30:41 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <Z/ZMUchUElp4AdCC@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <87wmbtu4cz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmbtu4cz.ffs@tglx>

On Wed, Apr 09, 2025 at 10:27:24AM +0200, Thomas Gleixner wrote:
> On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> > +/* Wait for completion of an IST change */
> > +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data *irs_data)
> > +{
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
> > +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
> > +			USEC_PER_SEC);
> > +
> > +	if (ret == -ETIMEDOUT)
> > +		pr_err_ratelimited("IST_STATUSR.IDLE timeout...\n");
> > +
> > +	return ret;
> 
> I'm sure I've seen that code before and without looking I'm sure the
> diff between the two functions is ~2 lines.

Yep, you have a point, will do my best to consolidate them.

> > +
> > +	mtree_lock(&lpi_mt);
> > +	ret = mas_empty_area(&mas, 0, num_lpis - 1, lpis);
> > +	if (ret) {
> > +		pr_err("Failed to perform a dynamic alloc in the LPI MT!\n");
> > +		return ret;
> > +	}
> > +
> > +	lpi_base = mas.index;
> > +
> > +	/*
> > +	 * We don't really care about the entry itself, only about
> > +	 * allocation of a maple tree ranges describing in use LPIs.
> > +	 * That's why, upon allocation, we try to merge slots adjacent
> > +	 * with the empty one we are allocating to minimize the number
> > +	 * of slots we take from maple tree nodes for nothing, all
> > +	 * we need to keep track of is in use ranges.
> > +	 */
> 
> I'm really not convinced that you need a maple tree and the code
> complexity for this. What's wrong with a simple bitmap other than that
> it might need 1MB memory?

Yes, I wrote it in the cover letter (again, easy to miss), I have
to admit I am not convinced either. We need 24 bits max, so a 2MB
chunk of memory worst case but other than that I can't really argue
to be honest.

I also thought about re-using the GICv3 ITS LPI allocator (which
does the same thing - agree, it is an on-purpose one, so maybe
it is better to reuse a core code construct).

Marc obviously has more background knowledge on this - I am
open to reworking this LPI allocator and remove the MT.

> > +static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain,
> > +				      unsigned int virq, unsigned int nr_irqs,
> > +				      void *arg)
> > +{
> > +	irq_hw_number_t hwirq;
> > +	struct irq_data *irqd;
> > +	u32 *base_lpi = arg;
> > +	int i, ret;
> > +
> > +	hwirq = *base_lpi;
> > +
> > +	for (i = 0; i < nr_irqs; i++) {
> > +		irqd = irq_desc_get_irq_data(irq_to_desc(virq + i));
> 
> irq_get_irq_data() and irq_domain_get_irq_data() exist for a reason.

Point taken.

> > +
> > +		irq_domain_set_info(domain, virq + i, hwirq + i,
> > +				    &gicv5_lpi_irq_chip, NULL,
> > +				    handle_fasteoi_irq, NULL, NULL);
> > +		irqd_set_single_target(irqd);
> > +static int gicv5_irq_ipi_domain_alloc(struct irq_domain *domain,
> > +				      unsigned int virq, unsigned int nr_irqs,
> > +				      void *arg)
> > +{
> > +	int ret, i;
> > +	u32 lpi;
> > +	struct irq_data *irqd = irq_desc_get_irq_data(irq_to_desc(virq));
> 
> Again. Zero reason to fiddle with irq_desc.

I will update it.

Thanks Thomas,
Lorenzo
