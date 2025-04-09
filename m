Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CB6227B9A;
	Wed,  9 Apr 2025 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182183; cv=none; b=fu5mG+XytP9ROUe/KbUqZKX/cCZRXC947j8ifp3c+VFSTcA4D2ht8r8medlK0CW/Bbg2acOMgGpkzSygboCKSVaPl5Vs1Y4i7UFnF6eOubPj8F7fZqShr4MOixvpYSDMK2ttUGdHYaQ/RsKxr6FrNGidwJ8WOhj3Evolecf2mdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182183; c=relaxed/simple;
	bh=GhJjba4DASE+gn/vKR2p2ZDR4gtAyED9oHXRfRJMQDg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=r+2JcNWVdbqU8cvTHOlbtwsG5E7aJGsLHDKlvwdRHXOxga6iUoAJvGZWr19fpHZMX0dO5cJud11XDZzgkDXsr+I5Ssmk7pG4rR4Cys7GPqBTDCv5sz8l8nTUo2hxbscxlFKH1euU7FyfjaupG0ZtH89t5G1rRlmHHY8GDlowyjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3D5Ssgch; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6ifcU608; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3D5Ssgch";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6ifcU608"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744182179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=VOmAn5HJOdV8OMSxYWo4JluT1F/+Pu1GjzeS4u5pAO0=;
	b=3D5SsgchXR80wcDt9UVR8yINSR2645wVWl9u7QujPCmO/G2KS0u8p8PkHkuWPbodk637p0
	kozkEAM6squKqZ79dn8hLteKVtODT5LH3q1qRgYbSWxWh9YSQDuDiwQfetliKPztI+YFdp
	Spc+O04y/1zcdLnj23spfCHI87IsCT6QToMvKygaJaWy9pv9nQpwial5SOev2LYiXWmNvX
	20FALRNtpQrpUyE1VJqgJ2myVtGe8gSlgUKhvAy/UZBEIVyuaFXpJvRkOsEhSd7momrfTY
	BVSOexTekNViyqoNrAZ1kg8lPWIElkIdthS+myV5AokSGK5Z6MoJZOCZzasU0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744182179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=VOmAn5HJOdV8OMSxYWo4JluT1F/+Pu1GjzeS4u5pAO0=;
	b=6ifcU608szf0bZHytP4UwRb8K9SLqsSsJiJZR+9bDUoHw1d7f318b4GCdlFKQEy1Vqp8dx
	sCq+Tpm03IjxY9DA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 19/24] irqchip/gic-v5: Add GICv5 IRS/SPI support
In-Reply-To: <20250408-gicv5-host-v1-19-1f26db465f8d@kernel.org>
Date: Wed, 09 Apr 2025 09:02:58 +0200
Message-ID: <87zfgpu89p.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> +struct iaffid_entry {
> +	u16 iaffid;
> +	bool valid;
> +};

See the previous documentation link and search for struct definitions on
that page.

> +static int gicv5_irs_wait_for_spi_op(struct gicv5_irs_chip_data *irs_dat=
a)
> +{
> +	int ret;
> +	u32 statusr;

See documentaion...

> +	ret =3D readl_relaxed_poll_timeout_atomic(
> +			irs_data->irs_base + GICV5_IRS_SPI_STATUSR, statusr,
> +			FIELD_GET(GICV5_IRS_SPI_STATUSR_IDLE, statusr), 1,
> +			USEC_PER_SEC);

See previous mail about how to make stuff like this readable. My eyes
bleed already.

> +	if (ret =3D=3D -ETIMEDOUT) {

unlikely(ret =3D=3D ...) perhaps?

> +		pr_err_ratelimited("Time out waiting for IRS SPI to be configured\n");

> +static int __init gicv5_irs_init_bases(struct gicv5_irs_chip_data *irs_d=
ata,
> +				       void __iomem *irs_base,
> +				       struct fwnode_handle *handle)
> +{
> +	u32 cr0, cr1;
> +	struct device_node *np =3D to_of_node(handle);

Sigh

> +static int __init gicv5_irs_of_init_affinity(struct device_node *node,
> +				      struct gicv5_irs_chip_data *irs_data,
> +				      u8 iaffid_bits)

Moar random coding style choices.

> +{
> +	/*
> +	 * Detect IAFFID<->CPU mappings from the device tree and
> +	 * record IRS<->CPU topology information.
> +	 */
> +	int ret, i, ncpus, niaffids;
> +	u16 *iaffids;
> +	u16 iaffid_mask =3D GENMASK(iaffid_bits - 1, 0);
> +
> +	ncpus =3D of_property_count_elems_of_size(node, "cpus", sizeof(u32));
> +	if (WARN_ON(ncpus < 0))
> +		return -EINVAL;

Do you really need all these warnings?

> +
> +	niaffids =3D of_property_count_elems_of_size(node, "arm,iaffids",
> +						   sizeof(u16));
> +	if (WARN_ON(niaffids !=3D ncpus))
> +		return -EINVAL;
> +
> +	iaffids =3D kcalloc(niaffids, sizeof(*iaffids), GFP_KERNEL);
> +	if (!iaffids)
> +		return -ENOMEM;
> +
> +	ret =3D of_property_read_u16_array(node, "arm,iaffids", iaffids, niaffi=
ds);
> +	if (ret)
> +		return ret;

Leaks iaffids. Please use

      u16 *iaffids __free(kfree) =3D kcalloc(...);

and the compiler will take care of that.

> +static int __init gicv5_irs_init(struct device_node *node)
> +{
> +	void __iomem *irs_base;
> +	struct gicv5_irs_chip_data *irs_data;
> +	int ret;
> +	u32 idr;
> +	u8 iaffid_bits;
> +
> +	irs_data =3D kzalloc(sizeof(*irs_data), GFP_KERNEL);

__free(kfree)

> +	if (!irs_data)
> +		return -ENOMEM;

> +	if (irs_data->spi_range)
> +		pr_info("%s detected SPI range [%u-%u]\n",
> +						of_node_full_name(node),
> +						irs_data->spi_min,
> +						irs_data->spi_min +
> +						irs_data->spi_range - 1);

Please put those _five_ lines into brackets. It's not required by the
compiler, but for reading. Brackets should be omitted only if the
statement which follows =E2=80=98if=E2=80=99, =E2=80=98for=E2=80=99, =E2=80=
=98while=E2=80=99 etc. is truly a single
line.

> +static int gicv5_iri_irq_get_irqchip_state(struct irq_data *d,
> +					   enum irqchip_irq_state which,
> +					   bool *val, u8 hwirq_type)
> +{
> +	u64 icsr, cdrcfg =3D d->hwirq | FIELD_PREP(GICV5_GIC_CDRCFG_TYPE_MASK,
> +						 hwirq_type);
> +
> +	preempt_disable();

That's required because the calling contexts protection (raw spinlock
held and interrupts disabled) is not enough, right?

> +	gic_insn(cdrcfg, GICV5_OP_GIC_CDRCFG);
> +	isb();
> +	icsr =3D read_sysreg_s(SYS_ICC_ICSR_EL1);
> +	preempt_enable();

> +static int gicv5_irq_spi_domain_translate(struct irq_domain *d,
> +					  struct irq_fwspec *fwspec,
> +					  irq_hw_number_t *hwirq,
> +					  unsigned int *type)
> +{
> +	if (is_of_node(fwspec->fwnode)) {
> +		if (fwspec->param_count < 3)
> +			return -EINVAL;
> +
> +		if (fwspec->param[0] !=3D GICV5_HWIRQ_TYPE_SPI)
> +			return -EINVAL;
> +
> +		*hwirq =3D fwspec->param[1];
> +		*type =3D fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
> +
> +		return 0;
> +	}

The only difference between this and the ppi variant is the type check
of param[0]. Common helper perhaps?

Thanks,

        tglx
