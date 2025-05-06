Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C55E198A08;
	Tue,  6 May 2025 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746543635; cv=none; b=nZELeP/W9ZeXSIkXAxqTGXmV8C1Ssm+U8ZM0iOnrW45vOe6kTkAy9ZVwpPc75x6P+SX1lnFKvrB/SQVDVophUlnydsIlwcO778YerSFYEAFm7kMdzZBH+cCLAA/cntOEL1cIRvDQ2ZTzTCzXyHu7IDUPNjCH3+gd7Ci/N52omYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746543635; c=relaxed/simple;
	bh=xuC83YMU8A+0LiB/NfAWrspi379z447UqFIkXwgiDG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BI+SmnBOKpUy6PIkW1y8rZV5jGpXXRmI/Jy1naBWz24bEaAvY3sg11605ZKHNw0+QBZrzn5yxmhWjp0gfByY8DWqpUpCo212jnmOLOwTmhmEdKfowLOYbgFBtyms30fPOnOwROpak44VowndvyrhktO1czR9VMkmTinSa64DF9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wErMUTUO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NfZe5z1P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wErMUTUO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NfZe5z1P"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746543632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tcg1uck+PJdLT3sfZ0kHBMDtN1dwi+oG323b6C8H4LM=;
	b=wErMUTUO5NR5ggh9k6XOtaNCd9S3uaR575AuJbrW2Og5poFHFJtivt4rBmb58ZZq4mXocU
	WU17vsStGuVa9ZJr5Lo9mxt9blely8iC6AEtnd6lhwupVCekMMVKC4rZiijRCVDvX41zkm
	Iw4Qjji0WWsjjnLeC/v2/G0Dqyt5DfoV1XvG+YGwoKP7/q7sTVi0Wqz4NzfqnyNHxyXtNQ
	uzi3WxoEeLqlu5eicthtmS/DrsSYGdVXWfSq4/l/AdPUWGpOc2HvWofEQBlUyY1EmqvlZw
	KtDYiqYsXX4dBGbN3I51yvizTTqk9b7564Ak/AwrbgndfKaom3RmLd+eiFIpYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746543632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tcg1uck+PJdLT3sfZ0kHBMDtN1dwi+oG323b6C8H4LM=;
	b=NfZe5z1PQoP7Ys2YaavSKFguw/oOm7wjhpMrPBiGjky5CiaXi63jL3dwtmVMPBc7IPz031
	EdtBoeXFKRrblBDA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
In-Reply-To: <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
Date: Tue, 06 May 2025 17:00:31 +0200
Message-ID: <87zffpn5rk.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 06 2025 at 14:23, Lorenzo Pieralisi wrote:
> +
> +static u8 pri_bits = 5;

__ro_after_init ?

> +#define GICV5_IRQ_PRI_MASK 0x1f

Please put a new line before the #define and use a TAB between the
symbol and the value.

> +#define GICV5_IRQ_PRI_MI \
> +		(GICV5_IRQ_PRI_MASK & GENMASK(4, 5 - pri_bits))

No line break required. You have 100 characters

> +#define READ_PPI_REG(irq, reg)							\
> +	({									\
> +		u64 __ppi_val;							\
> +										\
> +		if (irq < 64)							\
> +			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R0_EL1);	\
> +		else								\
> +			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R1_EL1);	\
> +		__ppi_val;							\
> +	})
> +
> +#define WRITE_PPI_REG(set, irq, bit, reg)					\
> +	do {									\
> +		if (set) {							\
> +			if (irq < 64)						\
> +				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R0_EL1);\
> +			else							\
> +				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R1_EL1);\
> +		} else {							\
> +			if (irq < 64)						\
> +				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R0_EL1);\
> +			else							\
> +				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R1_EL1);\
> +		}								\
> +	} while (0)

I'm not convinced that these need to be macros.

static __always_inline u64 read_ppi_sysreg_s(unsigned int irq, const unsigned int which)
{
        switch (which) {
        case PPI_HM:
        	return irq < 64 ? read_sysreg_s(SYS_ICC_PPI_HM_R0_EL1) :
                		  read_sysreg_s(SYS_ICC_PPI_HM_R1_EL1;
        case ....:

        default:
                BUILD_BUG_ON(1);
        }
}

static __always_inline void write_ppi_sysreg_s(unsigned int irq, bool set, const unsigned int which)
{
	u64 bit = BIT_ULL(irq % 64);

        switch (which) {  
        case PPI_HM:
        	if (irq < 64)
                	write_sysreg_s(bit, SYS_ICC_PPI_HM_R0_EL1);
                else
                	write_sysreg_s(bit, SYS_ICC_PPI_HM_R1_EL1;
                return;
        case ....:

        default:
                BUILD_BUG_ON(1);
        }
}

Or something like that.

> +static int gicv5_ppi_set_type(struct irq_data *d, unsigned int type)
> +{
> +	/*
> +	 * The PPI trigger mode is not configurable at runtime,
> +	 * therefore this function simply confirms that the `type`
> +	 * parameter matches what is present.
> +	 */
> +	u64 hmr = READ_PPI_REG(d->hwirq, HM);
> +
> +	switch (type) {
> +	case IRQ_TYPE_LEVEL_HIGH:
> +	case IRQ_TYPE_LEVEL_LOW:
> +		if (((hmr >> (d->hwirq % 64)) & 0x1) != GICV5_PPI_HM_LEVEL)
> +			return -EINVAL;

Blink!

How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
tests for level, no? So the test is interesting at best ...

Secondly this comparison is confusing at best especially given that you
mask with a hex constant (0x1) first.

     		if (hmr & BIT_UL(d->hwirq % 64))
                	return -EINVAL;

Aside of that why do you have a set_type() function if there is no way
to set the type?

> +
> +static int gicv5_ppi_irq_get_irqchip_state(struct irq_data *d,
> +					   enum irqchip_irq_state which,
> +					   bool *val)
> +{
> +	u64 pendr, activer, hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> +
> +	switch (which) {
> +	case IRQCHIP_STATE_PENDING:
> +		pendr = READ_PPI_REG(d->hwirq, SPEND);
> +
> +		*val = !!(pendr & hwirq_id_bit);
> +
> +		return 0;

		*val = !!(read_ppi_reg(d->hwirq, PPI_SPEND) & bit);
                return 0;

would take up less space and be readable.

> +	case IRQCHIP_STATE_ACTIVE:
> +		activer = READ_PPI_REG(d->hwirq, SACTIVE);
> +
> +		*val = !!(activer & hwirq_id_bit);
> +
> +		return 0;
> +	default:
> +		pr_debug("Unexpected PPI irqchip state\n");
> +	}
> +
> +	return -EINVAL;

Move the return into the default case.

> +static int __init gicv5_init_domains(struct fwnode_handle *handle)
> +{
> +	struct irq_domain *d;
> +
> +	d = irq_domain_create_linear(handle, PPI_NR, &gicv5_irq_ppi_domain_ops,
> +				     NULL);

Please use the full 100 charactes all over the place.

> +	if (!d)
> +		return -ENOMEM;
> +
> +	irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
> +	gicv5_global_data.ppi_domain = d;
> +
> +	gicv5_global_data.fwnode = handle;

The random choices of seperating code with new lines are really
amazing.

> +static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
> +{
> +	int ret;
> +
> +	ret = gicv5_init_domains(&node->fwnode);

        int ret = ....;

> +	if (ret)

Thanks,

        tglx
