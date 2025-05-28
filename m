Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E282C60;
	Wed, 28 May 2025 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748442498; cv=none; b=erLvqAYGRyTxHbErO5UZLPdl1RkFTrka0h0TR1Ywl0pZ0rHk3yq8S7H1CAuGKfhGRFvGyyP76ix+S+VK/lHJVLkMc2nEco3C8pk/Bh0Lqe2oceHWjZ4qsN3wcb/kLpIB2nlkzhLI+lQHIVnYLdSch7nqT6muZQyWLgaBq/nRhbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748442498; c=relaxed/simple;
	bh=Pj2dKcYrs8qtXXImT3zhxemqWnlmlXzSCeJP/bi3GqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flufaKY5SSO0N1It0+X0w7oK0ebvAZsYjw9uqDyavxG7bN896NzbqOXPDOAAP7+P3YUn7m6askAzbRnSmJJV4mkGRFG+M3hd2715VMyeWL7/Y8QaeOPFRy7DEN1rxZKmkGh+nafbvDJ5EmB8qH6L3mWZQyy4I5YKMBRY1rA3ed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7V4HdhH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7V4HdhH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589E9C4CEE3;
	Wed, 28 May 2025 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748442497;
	bh=Pj2dKcYrs8qtXXImT3zhxemqWnlmlXzSCeJP/bi3GqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7V4HdhH4LP0/xhdufXH7ukurAfnZkeM28NOSeG7dnwmm7xGN2Q21KwDYd99fZser
	 ENBiRECT9v5o6UwShPCdLRJs5hb76XQNPWD2f/FtHeNJ16IQ1P1atj4YicGXgqoJn1
	 Qd2um5zkwTUZJ2j0jGLZXafqR8nLyKbFR3akyuxesS0b0jKtOD4xUph+xmh7+49kee
	 b927Nhc/iraXGDSm+YLrubDnVPbh8ckd6J+rDLrEABHeq1f/+nNRsVK6PeHmm6jOV6
	 1a5v0NhCdVWXwv5mJEnlDyFrPrmCiExJ30hu90lAAlQ9yyNdZtG+Q+Zw+BxBaQHGoV
	 bk/5c/9YQyLKA==
Date: Wed, 28 May 2025 16:28:09 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v4 18/26] arm64: smp: Support non-SGIs for IPIs
Message-ID: <aDcdeWuwCzZ4pA9y@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-18-b36e9b15a6c3@kernel.org>
 <20250528131744.00001544@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528131744.00001544@huawei.com>

On Wed, May 28, 2025 at 01:17:44PM +0100, Jonathan Cameron wrote:
> On Tue, 13 May 2025 19:48:11 +0200
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > From: Marc Zyngier <maz@kernel.org>
> > 
> > The arm64 arch has relied so far on GIC architectural software
> > generated interrupt (SGIs) to handle IPIs. Those are per-cpu
> > software generated interrupts.
> > 
> > arm64 architecture code that allocates the IPIs virtual IRQs and
> > IRQ descriptors was written accordingly.
> > 
> > On GICv5 systems, IPIs are implemented using LPIs that are not
> > per-cpu interrupts - they are just normal routable IRQs.
> > 
> > Add arch code to set-up IPIs on systems where they are handled
> > using normal routable IRQs.
> > 
> > For those systems, force the IRQ affinity (and make it immutable)
> > to the cpu a given IRQ was assigned to.
> > 
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > [timothy.hayes@arm.com: fixed ipi/irq conversion, irq flags]
> > Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> > [lpieralisi: changed affinity set-up, log]
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> Hi Lorenzo,
> 
> A few trivial comments inline.
> 
> > +
> > +static int ipi_to_irq(int ipi, int cpu)
> 
> Maybe this naming needs a breadcrumb to indicate this only
> applies only to lpi case as it's directly computed in the old ppi code?
> A comment might do the job.

Maybe rename it to ipi_to_irq_percpu() (similar to what we did for
set_smp_ipi_range()) and then

static int ipi_to_irq(int ipi)
{
	ipi_to_irq_percpu(ipi, 0);
}

and use ipi_to_irq() in ppi code ?

Likely overkill, not a big deal anyway.

> > +{
> > +	return ipi_irq_base + (cpu * nr_ipi) + ipi;
> > +}
> > +
> > +static int irq_to_ipi(int irq)
> > +{
> > +	return (irq - ipi_irq_base) % nr_ipi;
> > +}
> 
> 
> > +static void ipi_setup_lpi(int ipi, int ncpus)
> > +{
> > +	for (int cpu = 0; cpu < ncpus; cpu++) {
> > +		int err, irq;
> > +
> > +		irq = ipi_to_irq(ipi, cpu);
> > +
> > +		err = irq_force_affinity(irq, cpumask_of(cpu));
> > +
> Trivial local consistency thing but maybe no blank line here or...
> > +		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
> > +
> > +		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
> > +				  &irq_stat);
> > +
> here to match the style in ipi_setup_ppi()

Done.

Thanks,
Lorenzo

> > +		WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
> > +
> > +		irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
> > +
> > +		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
> > +	}
> > +}
> 
