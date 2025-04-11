Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C771221FDB;
	Fri, 11 Apr 2025 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391177; cv=none; b=CFYwU7AyMhj9PRsLNrDF2JGL9pZ6o0rKH79nusatDiLBXOybUVzwRmzfseLwpEHrZPNe9R8Js4Ot9BPFukfb8hw8LnxU+1yMma3TgNtBul8ApFUYnu0ZJRnpLkr4Hn3GszfHNSsGvlhHfUGE8MlBCRmu7OJFIdilyt+mgHL6drw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391177; c=relaxed/simple;
	bh=LCpOJCeSOBB59YaAWLr3Fa430+JRYrnTRAqBnQl3nDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VT6EKXsbGk7w9r+6TmZeqLWCjIdX7KQhJJXjb/1F4/EQcxX27yf25HQPuffhNbrSnKRxadYeSRwfsz3BTQ7AtZ/s+JGgZDuxd764mCiNWRwoagQnf26iRz1mYS1sFu1bvLiiA9b3Xnmv4hbbDQLBFN1JpJ1Gm9DmsGGGJdnc9qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khB2ukdP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khB2ukdP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD2DC4CEE2;
	Fri, 11 Apr 2025 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744391176;
	bh=LCpOJCeSOBB59YaAWLr3Fa430+JRYrnTRAqBnQl3nDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khB2ukdP9E7ti/hWeipsjfCxlbBBJqi3+4gJYHi5XMJbNV9jvfxiVYgF5eMeVvMoa
	 Y0UlV7DtSyHXnwwQoa9s7A7jz5vJ73aMZ0wmHZljZzU/jZMALX0Vl0wmdCI5opihXS
	 iq7OwCh0j6bwL78DWHoXhkB0Kogu+9cn8b+cGzAuxm/a4n6xw6wAJzrmsPaMIFyBQa
	 18iLaTQdaEYxrtDSnBK3RJZfsPvuB91u03+NXu5auzG7SFmf7VY6LgvngbYuNyTKsV
	 PxzbSPg6vsnuSmPgkJiG/R0WQnVrShiYHxTC1pB+e82PHEbDpKZBdF774NhGdOGwMw
	 wgydXuYTfOPIg==
Date: Fri, 11 Apr 2025 19:06:09 +0200
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
Message-ID: <Z/lMASBtEVggMyV/@lpieralisi>
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

[...]

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

Can't do it like that, write_sysreg_s takes a register encoding, not a
u32 offset, I will see if I can wrap it in a macro, even though that
might obfuscate a bit rather than clarify.

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

gicr_insn() is an instruction ACK'ing the IRQ, I would leave it like this
explicitly if you don't mind lest it gave the impression that it
is an initializer.

Thanks,
Lorenzo

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
> 
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
> 
> Thanks,
> 
>         tglx
