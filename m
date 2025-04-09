Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFBE1DDC07;
	Wed,  9 Apr 2025 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744183859; cv=none; b=INO0fLKfeqRQX53pQqE7KKY+Uc1RwjqDi72H3XBBqbbAm+BXgIPApY+KIWJr6qaNPOhDr/897k1FX5qVyYzsBAsi6ZvZB7heG8BzQoab2Vpox11DGh98B1+WNlOwOVSszEkg4euly6VFogquKFZwtyeXBpRlkf8PBYAKAKnZttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744183859; c=relaxed/simple;
	bh=v3n5JgwpE6270eRrZMtFhK0CZ0KtsCC90coVUAGG9aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y74vZItQpaHcgPl83thkzzJsT4dFh6r5vuV6YKYTn90vwIyjVWTpi/W0JKKTMszw91d3sSVCA4Fc1if7tfthw5f2MpqBogntpv+o+c4+7u4e8sZIpUxMuBUyriH1gXcQ52oz11MWRCftVsCwzBTBT/09XTedlWj5P/T/EpnYka4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oq9TuK38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oq9TuK38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC10C4CEE3;
	Wed,  9 Apr 2025 07:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744183859;
	bh=v3n5JgwpE6270eRrZMtFhK0CZ0KtsCC90coVUAGG9aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oq9TuK38hrQocohwoPsnURn+ULs/oGCy9Y9IBcW4pjU6px6xjpvUzanY9a+Tahu3l
	 afwfMQxG3wf0pGQizMQWWc2tiywjUWmISG1LCARkEV9qODEgWCj4Wffh0dPFnrUpRA
	 aazDJpiwoq6Pl3PHRspEk+yrYY4DgZ2x5t1hF+osaryN5AyEz/fG+AEJr8EtnWpmKH
	 xUYQ3GqH4GUAi1T0xDEQyw3fEeewIt7TX3JUOy0kXCNSdmOyY3jO8B6MY9fz9wFJcd
	 62VyS6lK9aXKHvfN4dxeL62ZShJWS68w2CKXBWRNgDFJ2/OoAkQG0LriOrsl8ABqvb
	 NZ/KJlsP8jQ8Q==
Date: Wed, 9 Apr 2025 09:30:52 +0200
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
Subject: Re: [PATCH 18/24] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <Z/YiLNzRvXUgcHFc@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-18-1f26db465f8d@kernel.org>
 <877c3uuy7u.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c3uuy7u.ffs@tglx>

On Tue, Apr 08, 2025 at 11:42:29PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> > +
> > +static void gicv5_ppi_priority_init(void)
> > +{
> > +	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRIORITY_MI),
> > +				 SYS_ICC_PPI_PRIORITYR0_EL1);
> 
> Just let stick it out. You have 100 characters. All over the place...

I will do.

> > +static int gicv5_ppi_irq_set_irqchip_state(struct irq_data *d,
> > +					   enum irqchip_irq_state which,
> > +					   bool val)
> > +{
> > +	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> > +
> > +	switch (which) {
> > +	case IRQCHIP_STATE_PENDING:
> > +		if (val) {
> > +			if (d->hwirq < 64)
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_SPENDR0_EL1);
> > +			else
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_SPENDR1_EL1);
> > +
> > +		} else {
> > +			if (d->hwirq < 64)
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_CPENDR0_EL1);
> > +			else
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_CPENDR1_EL1);
> > +		}
> > +
> > +		return 0;
> > +	case IRQCHIP_STATE_ACTIVE:
> > +		if (val) {
> > +			if (d->hwirq < 64)
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_SACTIVER0_EL1);
> > +			else
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_SACTIVER1_EL1);
> > +		} else {
> > +			if (d->hwirq < 64)
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_CACTIVER0_EL1);
> > +			else
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_CACTIVER1_EL1);
> > +		}
> 
> You already precalculate hwirq_id_bit. Can't you do something similar
> for the registers?
> 
> 	case IRQCHIP_STATE_PENDING:
>         	u32 reg = val ? SYS_ICC_PPI_SPENDR1_EL1 : SYS_ICC_PPI_SPENDR0_EL1;
> 
>                 write_sysreg_s(hwirq_id_bit, reg);
>                 return 0;
> 	case IRQCHIP_STATE_ACTIVE:
>                 ....
> 
> Ditto in the get_state() function.
> 
> No?

Yes, more readable.

> > +static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
> > +					  struct irq_fwspec *fwspec,
> > +					  irq_hw_number_t *hwirq,
> > +					  unsigned int *type)
> > +{
> > +	if (is_of_node(fwspec->fwnode)) {
> 
> It'd be way more readable to invert this check
> 
>      if (!is_of_node(...))
>      	return -EINVAL;
> 
> so that the subsequent checks are just a read through.

Will do.

> > +		if (fwspec->param_count < 3)
> > +			return -EINVAL;
> > +
> > +		if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI)
> > +			return -EINVAL;
> > +
> > +		*hwirq = fwspec->param[1];
> > +		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
> > +
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> 
> > +static void gicv5_irq_ppi_domain_free(struct irq_domain *domain,
> > +				      unsigned int virq, unsigned int nr_irqs)
> > +{
> > +	struct irq_data *d;
> > +
> > +	if (WARN_ON(nr_irqs != 1))
> 
> WARN_ON_ONCE ?

Yes.

> > +		return;
> > +
> > +	d = irq_domain_get_irq_data(domain, virq);
> > +
> > +	irq_set_handler(virq, NULL);
> > +	irq_domain_reset_irq_data(d);
> > +}
> > +
> > +static int gicv5_irq_ppi_domain_select(struct irq_domain *d,
> > +				       struct irq_fwspec *fwspec,
> > +				       enum irq_domain_bus_token bus_token)
> > +{
> > +	/* Not for us */
> > +	if (fwspec->fwnode != d->fwnode)
> > +		return 0;
> > +
> > +	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI) {
> > +		// only handle PPIs
> 
> Commenting the obvious?
> 

Will remove it.

> > +		return 0;
> > +	}
> > +
> > +	return (d == gicv5_global_data.ppi_domain);
> > +}
> > +
> > +static const struct irq_domain_ops gicv5_irq_ppi_domain_ops = {
> > +	.translate	= gicv5_irq_ppi_domain_translate,
> > +	.alloc		= gicv5_irq_ppi_domain_alloc,
> > +	.free		= gicv5_irq_ppi_domain_free,
> > +	.select		= gicv5_irq_ppi_domain_select
> > +};
> > +
> > +static inline void handle_irq_per_domain(u32 hwirq)
> > +{
> > +	u32 hwirq_id;
> > +	struct irq_domain *domain = NULL;
> > +	u8 hwirq_type = FIELD_GET(GICV5_HWIRQ_TYPE, hwirq);
> 
> So far you managed to comply with the documented reverse fir tree
> ordering.
> 
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations
> 
> Why are you changing coding style in the middle of the code?

Mea culpa, don't bother commenting on this further, point taken.

> > +	hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, hwirq);
> > +
> > +	if (hwirq_type == GICV5_HWIRQ_TYPE_PPI)
> > +		domain = gicv5_global_data.ppi_domain;
> > +
> > +	if (generic_handle_domain_irq(domain, hwirq_id)) {
> > +		pr_err("Could not handle, hwirq = 0x%x", hwirq_id);
> 
> pr_err_once() perhaps?
> 
> > +		gicv5_hwirq_eoi(hwirq_id, hwirq_type);
> > +	}
> > +}
> > +
> > +static asmlinkage void __exception_irq_entry
> > +gicv5_handle_irq(struct pt_regs *regs)
> > +{
> > +	u64 ia;
> > +	bool valid;
> > +	u32 hwirq;
> 
> See above
> 
> > +	ia = gicr_insn(GICV5_OP_GICR_CDIA);
> > +	valid = GICV5_GIC_CDIA_VALID(ia);
> 
> And please move that to the declaration lines
> 
> > +static int __init gicv5_init_domains(struct fwnode_handle *handle)
> > +{
> > +	gicv5_global_data.fwnode = handle;
> > +	gicv5_global_data.ppi_domain = irq_domain_create_linear(
> > +		handle, 128, &gicv5_irq_ppi_domain_ops, NULL);
> 
> The ever changing choice of coding styles across functions is really
> interesting. Obviously the length of 'gicv5_global_data.ppi_domain'
> forces ugly, but that does not mean it needs to be that way:
> 
>        struct irqdomain *d;
> 
>        d = irq_domain_create_linear(handle, 128, &gicv5_irq_ppi_domain_ops, NULL);
>        if (!d)
>        		return - ENOMEM;
> 
>        irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
>        gicv5_global_data.fwnode = handle;
>        gicv5_global_data.ppi_domain = d;
>        return 0;
> 
> No?

Yes it is better.

> > +static int __init gicv5_of_init(struct device_node *node,
> > +				struct device_node *parent)
> > +{
> > +	int ret;
> > +
> > +	ret = gicv5_init_domains(&node->fwnode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	gicv5_set_cpuif_pribits();
> > +
> > +	ret = gicv5_starting_cpu(smp_processor_id());
> 
> You invoke the CPU hotplug callback for the boot CPU explicitly, but
> what the heck installs the actual hotplug callback for the secondary
> CPUs?

That comes with a subsequent patch[21]. I mentioned in the cover letter
that I tried to split the functionality into interrupt types to ease
review (well, it does not look like I succeeded, sorry) and then in
patch [21] (when LPIs backing IPIs are implemented), enable SMP.

The point is, we need patches [18-21] to enable SMP booting.

I can squash [18-21] all together or I can enable the hotplug callback
here but this patch stand alone is not functional for the reasons
above, let me know please what's best in your opinion and I will do.

Above all, thank you very much for reviewing the series.

Lorenzo
