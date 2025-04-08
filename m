Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE431CAA79;
	Tue,  8 Apr 2025 21:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744148553; cv=none; b=nt71fHSmH36Xx8pMASKN7Vr4qukVjTP2MguT9n/UABNkQ6Ba+ElOkTSCqdc4Zv8zE2PTw6AprmhlU1Rpg80mAfBWAZgRmSdbk+4FM5ZpAMozJvbYoJSZFF0Ko9ARlRPj9P2zhjAD9n2kbVXX68q6joOnKfnabBW0XP4vhaSqRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744148553; c=relaxed/simple;
	bh=V6l8LPpzKVuDCZjwSUjFCxIyQ9xmi70qRu7BFGrR/QQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pafd7PAaThHmHwFXDvNMFAXuIE0BRa5PaMgIlTYcYYymyXXdXaoBH1PAjuIBeqRuTObEqYmZGkITki6jTUAL4/K6eAQhwid/gWU/pJuA3SI7WcQ/lYrBsMggoQhiBNOiCpjIuifarBM1ovJEmOR/12//FYVz+VplFLeWWqUwt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MFLpieLp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=77EC+vEQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MFLpieLp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="77EC+vEQ"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744148549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn5vQVdpj+6NFg9syCTLQKAefF57K+DJA73qfxXP2lA=;
	b=MFLpieLp0m41URh28V6jjWQ0WR8q2sIR0yLReJmbwQtRe/uVoWZT8PeP8Tce3jD2y8EXBK
	gugJoTXoUILS3MCReboMvC4kmFsqxnLfX8c/XElVFupkHdsRonI9JuNZC1Scj9ltIG1fxy
	zZsELf5QaZqCKDvyAD/tjELojEcgnaZ91YHWMSAg1SNELgVfWUAhq1FEgeZqM09eh1noHn
	B71+Aehbw+iRxend+b8iAwWvx7pMAAttp0gm3Y8AqnZAUvuikEdqI0Sul0X+Fd3gG99dMO
	G1rKoLxEjjvAvt/8XU9cHtxhtrpq0BXIbVwrKWDFVJHFAP/cAB3oN60GkiW+cQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744148549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn5vQVdpj+6NFg9syCTLQKAefF57K+DJA73qfxXP2lA=;
	b=77EC+vEQ9WRjg5BR8Alx0YlpnaD9y8tA0EUeJZkVtxXzcDMp/CTNOxJDEUCyu8iNONtqJ3
	SVymjvzcKekwHeAw==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 18/24] irqchip/gic-v5: Add GICv5 PPI support
In-Reply-To: <20250408-gicv5-host-v1-18-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-18-1f26db465f8d@kernel.org>
Date: Tue, 08 Apr 2025 23:42:29 +0200
Message-ID: <877c3uuy7u.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> +
> +static void gicv5_ppi_priority_init(void)
> +{
> +	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRIORITY_MI),
> +				 SYS_ICC_PPI_PRIORITYR0_EL1);

Just let stick it out. You have 100 characters. All over the place...

> +static int gicv5_ppi_irq_set_irqchip_state(struct irq_data *d,
> +					   enum irqchip_irq_state which,
> +					   bool val)
> +{
> +	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> +
> +	switch (which) {
> +	case IRQCHIP_STATE_PENDING:
> +		if (val) {
> +			if (d->hwirq < 64)
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_SPENDR0_EL1);
> +			else
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_SPENDR1_EL1);
> +
> +		} else {
> +			if (d->hwirq < 64)
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_CPENDR0_EL1);
> +			else
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_CPENDR1_EL1);
> +		}
> +
> +		return 0;
> +	case IRQCHIP_STATE_ACTIVE:
> +		if (val) {
> +			if (d->hwirq < 64)
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_SACTIVER0_EL1);
> +			else
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_SACTIVER1_EL1);
> +		} else {
> +			if (d->hwirq < 64)
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_CACTIVER0_EL1);
> +			else
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_CACTIVER1_EL1);
> +		}

You already precalculate hwirq_id_bit. Can't you do something similar
for the registers?

	case IRQCHIP_STATE_PENDING:
        	u32 reg = val ? SYS_ICC_PPI_SPENDR1_EL1 : SYS_ICC_PPI_SPENDR0_EL1;

                write_sysreg_s(hwirq_id_bit, reg);
                return 0;
	case IRQCHIP_STATE_ACTIVE:
                ....

Ditto in the get_state() function.

No?

> +static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
> +					  struct irq_fwspec *fwspec,
> +					  irq_hw_number_t *hwirq,
> +					  unsigned int *type)
> +{
> +	if (is_of_node(fwspec->fwnode)) {

It'd be way more readable to invert this check

     if (!is_of_node(...))
     	return -EINVAL;

so that the subsequent checks are just a read through.

> +		if (fwspec->param_count < 3)
> +			return -EINVAL;
> +
> +		if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI)
> +			return -EINVAL;
> +
> +		*hwirq = fwspec->param[1];
> +		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}

> +static void gicv5_irq_ppi_domain_free(struct irq_domain *domain,
> +				      unsigned int virq, unsigned int nr_irqs)
> +{
> +	struct irq_data *d;
> +
> +	if (WARN_ON(nr_irqs != 1))

WARN_ON_ONCE ?

> +		return;
> +
> +	d = irq_domain_get_irq_data(domain, virq);
> +
> +	irq_set_handler(virq, NULL);
> +	irq_domain_reset_irq_data(d);
> +}
> +
> +static int gicv5_irq_ppi_domain_select(struct irq_domain *d,
> +				       struct irq_fwspec *fwspec,
> +				       enum irq_domain_bus_token bus_token)
> +{
> +	/* Not for us */
> +	if (fwspec->fwnode != d->fwnode)
> +		return 0;
> +
> +	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI) {
> +		// only handle PPIs

Commenting the obvious?

> +		return 0;
> +	}
> +
> +	return (d == gicv5_global_data.ppi_domain);
> +}
> +
> +static const struct irq_domain_ops gicv5_irq_ppi_domain_ops = {
> +	.translate	= gicv5_irq_ppi_domain_translate,
> +	.alloc		= gicv5_irq_ppi_domain_alloc,
> +	.free		= gicv5_irq_ppi_domain_free,
> +	.select		= gicv5_irq_ppi_domain_select
> +};
> +
> +static inline void handle_irq_per_domain(u32 hwirq)
> +{
> +	u32 hwirq_id;
> +	struct irq_domain *domain = NULL;
> +	u8 hwirq_type = FIELD_GET(GICV5_HWIRQ_TYPE, hwirq);

So far you managed to comply with the documented reverse fir tree
ordering.

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

Why are you changing coding style in the middle of the code?

> +
> +	hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, hwirq);
> +
> +	if (hwirq_type == GICV5_HWIRQ_TYPE_PPI)
> +		domain = gicv5_global_data.ppi_domain;
> +
> +	if (generic_handle_domain_irq(domain, hwirq_id)) {
> +		pr_err("Could not handle, hwirq = 0x%x", hwirq_id);

pr_err_once() perhaps?

> +		gicv5_hwirq_eoi(hwirq_id, hwirq_type);
> +	}
> +}
> +
> +static asmlinkage void __exception_irq_entry
> +gicv5_handle_irq(struct pt_regs *regs)
> +{
> +	u64 ia;
> +	bool valid;
> +	u32 hwirq;

See above

> +	ia = gicr_insn(GICV5_OP_GICR_CDIA);
> +	valid = GICV5_GIC_CDIA_VALID(ia);

And please move that to the declaration lines

> +static int __init gicv5_init_domains(struct fwnode_handle *handle)
> +{
> +	gicv5_global_data.fwnode = handle;
> +	gicv5_global_data.ppi_domain = irq_domain_create_linear(
> +		handle, 128, &gicv5_irq_ppi_domain_ops, NULL);

The ever changing choice of coding styles across functions is really
interesting. Obviously the length of 'gicv5_global_data.ppi_domain'
forces ugly, but that does not mean it needs to be that way:

       struct irqdomain *d;

       d = irq_domain_create_linear(handle, 128, &gicv5_irq_ppi_domain_ops, NULL);
       if (!d)
       		return - ENOMEM;

       irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
       gicv5_global_data.fwnode = handle;
       gicv5_global_data.ppi_domain = d;
       return 0;

No?

> +static int __init gicv5_of_init(struct device_node *node,
> +				struct device_node *parent)
> +{
> +	int ret;
> +
> +	ret = gicv5_init_domains(&node->fwnode);
> +	if (ret)
> +		return ret;
> +
> +	gicv5_set_cpuif_pribits();
> +
> +	ret = gicv5_starting_cpu(smp_processor_id());

You invoke the CPU hotplug callback for the boot CPU explicitly, but
what the heck installs the actual hotplug callback for the secondary
CPUs?

Thanks,

        tglx
