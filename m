Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8445B217F40;
	Wed,  7 May 2025 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606603; cv=none; b=Anv41n/+THyJGiOlboSzT4W/85qx7hJemNnK1UaBJ9s/Y5ycjWWz0lNaDncVEV1lK+5V/j078ecqbg4ED2CokZcr8RoYQT2htO4fOpxTN7rhfddEPEKLrPsnxnuGVC7YwcE9kZ9/V5+D+lZwn5xlAfzaf9ldyp4rJlGqwbN6lKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606603; c=relaxed/simple;
	bh=LgZIIR3VWR/B7NCGqfYJnfn8zg8b4s8/O2CmZ0PJpS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPbDbTZEuH/H3mAZw+8ILoYe6f4aUiKQRvb+GL66u7/iYMjtV/iP2SQ/nTST7hTVMudogZzzG8Rr7EHYa1CGMeGwMoyFz4BTuFLe1vwrlzH7Qpb1238pE2PQZWv6Irn6+pQJy14bcE9ejMmJ4O7ZSzH/aWl3qSiiFhLkW/8Jrz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQVl1AAs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQVl1AAs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B25AC4CEE7;
	Wed,  7 May 2025 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746606603;
	bh=LgZIIR3VWR/B7NCGqfYJnfn8zg8b4s8/O2CmZ0PJpS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQVl1AAsAzPugaTbhcwnyMqVE8YJga+7DZmHrA/tgTUXLEAgXl84aD5k4IRr5v1A/
	 cscW4kkPIESdZQD0uYOHjZNS/jJ0XWybnrbxB2nOCBtJXLTRM7Se5ph3PqfjXx/ihH
	 Tqyuesewk7mNSRpBbFxc4fvwg+n0oDaolAaiaTDX6IVx81RMrWwAGo68M3r2LBTETh
	 GU0xAlvJz4cVUtrhK3EW+3uCnE2nb/6KTxYu9DjPwibSJthMLOAwMBsvDwe4JJzP65
	 RzFyJhXyOPFqa0eYddjViK16bTXwcOO6GHNpbZ9zHR9AfuoQc2lVNw104kwvqvhDCd
	 uqOUS3LvJ/u4w==
Date: Wed, 7 May 2025 10:29:56 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aBsaBDB17LAV48ZB@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
 <87zffpn5rk.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zffpn5rk.ffs@tglx>

On Tue, May 06, 2025 at 05:00:31PM +0200, Thomas Gleixner wrote:
> On Tue, May 06 2025 at 14:23, Lorenzo Pieralisi wrote:
> > +
> > +static u8 pri_bits = 5;
> 
> __ro_after_init ?

Ok.

> 
> > +#define GICV5_IRQ_PRI_MASK 0x1f
> 
> Please put a new line before the #define and use a TAB between the
> symbol and the value.

Ok, sorry.

> > +#define GICV5_IRQ_PRI_MI \
> > +		(GICV5_IRQ_PRI_MASK & GENMASK(4, 5 - pri_bits))
> 
> No line break required. You have 100 characters

Right.

> > +#define READ_PPI_REG(irq, reg)							\
> > +	({									\
> > +		u64 __ppi_val;							\
> > +										\
> > +		if (irq < 64)							\
> > +			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R0_EL1);	\
> > +		else								\
> > +			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R1_EL1);	\
> > +		__ppi_val;							\
> > +	})
> > +
> > +#define WRITE_PPI_REG(set, irq, bit, reg)					\
> > +	do {									\
> > +		if (set) {							\
> > +			if (irq < 64)						\
> > +				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R0_EL1);\
> > +			else							\
> > +				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R1_EL1);\
> > +		} else {							\
> > +			if (irq < 64)						\
> > +				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R0_EL1);\
> > +			else							\
> > +				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R1_EL1);\
> > +		}								\
> > +	} while (0)
> 
> I'm not convinced that these need to be macros.
> 
> static __always_inline u64 read_ppi_sysreg_s(unsigned int irq, const unsigned int which)
> {
>         switch (which) {
>         case PPI_HM:
>         	return irq < 64 ? read_sysreg_s(SYS_ICC_PPI_HM_R0_EL1) :
>                 		  read_sysreg_s(SYS_ICC_PPI_HM_R1_EL1;
>         case ....:
> 
>         default:
>                 BUILD_BUG_ON(1);
>         }
> }
> 
> static __always_inline void write_ppi_sysreg_s(unsigned int irq, bool set, const unsigned int which)
> {
> 	u64 bit = BIT_ULL(irq % 64);
> 
>         switch (which) {  
>         case PPI_HM:
>         	if (irq < 64)
>                 	write_sysreg_s(bit, SYS_ICC_PPI_HM_R0_EL1);
>                 else
>                 	write_sysreg_s(bit, SYS_ICC_PPI_HM_R1_EL1;
>                 return;
>         case ....:
> 
>         default:
>                 BUILD_BUG_ON(1);
>         }
> }
> 
> Or something like that.

Done.

> > +static int gicv5_ppi_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +	/*
> > +	 * The PPI trigger mode is not configurable at runtime,
> > +	 * therefore this function simply confirms that the `type`
> > +	 * parameter matches what is present.
> > +	 */
> > +	u64 hmr = READ_PPI_REG(d->hwirq, HM);
> > +
> > +	switch (type) {
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +	case IRQ_TYPE_LEVEL_LOW:
> > +		if (((hmr >> (d->hwirq % 64)) & 0x1) != GICV5_PPI_HM_LEVEL)
> > +			return -EINVAL;
> 
> Blink!
> 
> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
> tests for level, no? So the test is interesting at best ...

There is no HIGH/LOW concept for level interrupts in the architecture,
level interrupts are asserted/de-asserted. On top of that, as you
already noticed, for PPIs this can't even be changed so this function
is utterly pointless.

> Secondly this comparison is confusing at best especially given that you
> mask with a hex constant (0x1) first.
> 
>      		if (hmr & BIT_UL(d->hwirq % 64))
>                 	return -EINVAL;
> 
> Aside of that why do you have a set_type() function if there is no way
> to set the type?

Yes, that's useless, the kernel is not there to validate firmware, I
will remove it.

> > +
> > +static int gicv5_ppi_irq_get_irqchip_state(struct irq_data *d,
> > +					   enum irqchip_irq_state which,
> > +					   bool *val)
> > +{
> > +	u64 pendr, activer, hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> > +
> > +	switch (which) {
> > +	case IRQCHIP_STATE_PENDING:
> > +		pendr = READ_PPI_REG(d->hwirq, SPEND);
> > +
> > +		*val = !!(pendr & hwirq_id_bit);
> > +
> > +		return 0;
> 
> 		*val = !!(read_ppi_reg(d->hwirq, PPI_SPEND) & bit);
>                 return 0;
> 
> would take up less space and be readable.

Ok done.

> > +	case IRQCHIP_STATE_ACTIVE:
> > +		activer = READ_PPI_REG(d->hwirq, SACTIVE);
> > +
> > +		*val = !!(activer & hwirq_id_bit);
> > +
> > +		return 0;
> > +	default:
> > +		pr_debug("Unexpected PPI irqchip state\n");
> > +	}
> > +
> > +	return -EINVAL;
> 
> Move the return into the default case.

Ok.

> > +static int __init gicv5_init_domains(struct fwnode_handle *handle)
> > +{
> > +	struct irq_domain *d;
> > +
> > +	d = irq_domain_create_linear(handle, PPI_NR, &gicv5_irq_ppi_domain_ops,
> > +				     NULL);
> 
> Please use the full 100 charactes all over the place.

Ok.

> > +	if (!d)
> > +		return -ENOMEM;
> > +
> > +	irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
> > +	gicv5_global_data.ppi_domain = d;
> > +
> > +	gicv5_global_data.fwnode = handle;
> 
> The random choices of seperating code with new lines are really
> amazing.

I separated code that initializes the domain from one that initialises
fwnode - it made sense to *me*, I don't know what makes sense to others
unless there are rules (or a script/bot reformatting the code for a
given subsytem) that one can follow I am afraid.

> > +static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
> > +{
> > +	int ret;
> > +
> > +	ret = gicv5_init_domains(&node->fwnode);
> 
>         int ret = ....;

Ok.

> > +	if (ret)
> 
> Thanks,
> 
>         tglx

Thanks for reviewing.

Lorenzo
