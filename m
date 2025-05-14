Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE84F14900B;
	Wed, 14 May 2025 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238738; cv=none; b=ZhjXnoppfHjSHSuu9f5gfYERKct8D77uZPyhHaeAHNoKQe3K1ZwGFERQWB5+czO1Buw0ZvQB6YX+XuvV5aLq+JoKzZc2OE/R0RJGmkLaiLqsMgVDyCBxddh3RnRmoCUt6iB83e4oXyPhB6wlbuv9J1WPjPwae+E25IsMKzJm9b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238738; c=relaxed/simple;
	bh=9G/dho57kzWG+845DqzNm+Vc+/T2+p3QlemMEguLtc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2rojh8Q3NiUZUOzFHNzlca5u2o6pRLndAc49CpU811KFof6ppi1O37uTs+xkfRKzIMJEyDI/nEs4aqKH2wjblMM5eMdQGPZIdFmp6eKSYV02bX7AnCx2nYqMgRv12YYtYRl3kTGdf66boNNn8PiHqd/69cNBZZ5u0IXq61O2AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhgUKevX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhgUKevX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B575C4CEE9;
	Wed, 14 May 2025 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238738;
	bh=9G/dho57kzWG+845DqzNm+Vc+/T2+p3QlemMEguLtc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhgUKevX4jd886+FJAyjiX/2MSRhZVDJGgLri+N6u5AdRw6Ku7xmZDLFa3qTD9EDz
	 r4Cd/VV5rfwnUDTLhWli/QLXdWSya2YjIu6uGhzKpdbTqb1nm68GIcKzxHtiX8iKi2
	 4dTvBfk27E3llp84ceI18yPlmUKIBgBYf6o1hLbY/uQM6/fo3sdjZtKqY1/NHOewdv
	 RC7ap+GjI5f34f4Y9u7jyo6IlcysllCn3YUOMHcqdD/RY49RIpuZU68cM5pem0WaSs
	 mGWdPZ6yTO3PbkOdQc/cxNkz2kFddEvt/VnspA8zJXrIn1yaRbRa4Zs3sdCz+YiFJp
	 ropsDWs3x3+5w==
Date: Wed, 14 May 2025 18:05:31 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 18/26] arm64: smp: Support non-SGIs for IPIs
Message-ID: <aCS/SxDG9M+jh7Wr@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-18-b36e9b15a6c3@kernel.org>
 <aCRy4K/jvLr95GOp@lpieralisi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCRy4K/jvLr95GOp@lpieralisi>

On Wed, May 14, 2025 at 12:39:28PM +0200, Lorenzo Pieralisi wrote:
> On Tue, May 13, 2025 at 07:48:11PM +0200, Lorenzo Pieralisi wrote:
> 
> [...]
> 
> >  /*
> >   * Called from the secondary holding pen, this is the secondary CPU entry point.
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 3b3f6b56e733039cad7ff5b8995db16a68f3c762..3f3712e47c94c62836fb89cd4bfb3595fbb41557 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -83,7 +83,26 @@ enum ipi_msg_type {
> >  
> >  static int ipi_irq_base __ro_after_init;
> >  static int nr_ipi __ro_after_init = NR_IPI;
> > -static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
> > +
> > +struct ipi_descs {
> > +	struct irq_desc *descs[MAX_IPI];
> > +};
> > +
> > +static DEFINE_PER_CPU(struct ipi_descs, pcpu_ipi_desc);
> > +
> > +#define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
> > +
> > +static bool percpu_ipi_descs __ro_after_init;
> > +
> > +static int ipi_to_irq(int ipi, int cpu)
> > +{
> > +	return ipi_irq_base + (cpu * nr_ipi) + ipi;
> > +}
> > +
> > +static int irq_to_ipi(int irq)
> > +{
> > +	return (irq - ipi_irq_base) % nr_ipi;
> > +}
> >  
> >  static bool crash_stop;
> >  
> > @@ -844,7 +863,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
> >  		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
> >  			   prec >= 4 ? " " : "");
> >  		for_each_online_cpu(cpu)
> > -			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
> > +			seq_printf(p, "%10u ", irq_desc_kstat_cpu(get_ipi_desc(cpu, i), cpu));
> >  		seq_printf(p, "      %s\n", ipi_types[i]);
> >  	}
> >  
> > @@ -919,7 +938,13 @@ static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
> >  
> >  static void arm64_backtrace_ipi(cpumask_t *mask)
> >  {
> > -	__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
> > +	unsigned int cpu;
> > +
> > +	if (!percpu_ipi_descs)
> > +		__ipi_send_mask(get_ipi_desc(0, IPI_CPU_BACKTRACE), mask);
> > +	else
> > +		for_each_cpu(cpu, mask)
> > +			__ipi_send_single(get_ipi_desc(cpu, IPI_CPU_BACKTRACE), cpu);
> >  }
> >  
> >  void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
> > @@ -944,7 +969,7 @@ void kgdb_roundup_cpus(void)
> >  		if (cpu == this_cpu)
> >  			continue;
> >  
> > -		__ipi_send_single(ipi_desc[IPI_KGDB_ROUNDUP], cpu);
> > +		__ipi_send_single(get_ipi_desc(cpu, IPI_KGDB_ROUNDUP), cpu);
> >  	}
> >  }
> >  #endif
> > @@ -1013,14 +1038,21 @@ static void do_handle_IPI(int ipinr)
> >  
> >  static irqreturn_t ipi_handler(int irq, void *data)
> >  {
> > -	do_handle_IPI(irq - ipi_irq_base);
> > +	do_handle_IPI(irq_to_ipi(irq));
> >  	return IRQ_HANDLED;
> >  }
> >  
> >  static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
> >  {
> > +	unsigned int cpu;
> > +
> >  	trace_ipi_raise(target, ipi_types[ipinr]);
> > -	__ipi_send_mask(ipi_desc[ipinr], target);
> > +
> > +	if (!percpu_ipi_descs)
> > +		__ipi_send_mask(get_ipi_desc(0, ipinr), target);
> > +	else
> > +		for_each_cpu(cpu, target)
> > +			__ipi_send_single(get_ipi_desc(cpu, ipinr), cpu);
> >  }
> >  
> >  static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
> > @@ -1046,11 +1078,15 @@ static void ipi_setup(int cpu)
> >  		return;
> >  
> >  	for (i = 0; i < nr_ipi; i++) {
> > -		if (ipi_should_be_nmi(i)) {
> > -			prepare_percpu_nmi(ipi_irq_base + i);
> > -			enable_percpu_nmi(ipi_irq_base + i, 0);
> > +		if (!percpu_ipi_descs) {
> > +			if (ipi_should_be_nmi(i)) {
> > +				prepare_percpu_nmi(ipi_irq_base + i);
> > +				enable_percpu_nmi(ipi_irq_base + i, 0);
> > +			} else {
> > +				enable_percpu_irq(ipi_irq_base + i, 0);
> > +			}
> >  		} else {
> > -			enable_percpu_irq(ipi_irq_base + i, 0);
> > +			enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
> >  		}
> >  	}
> >  }
> > @@ -1064,44 +1100,79 @@ static void ipi_teardown(int cpu)
> >  		return;
> >  
> >  	for (i = 0; i < nr_ipi; i++) {
> > -		if (ipi_should_be_nmi(i)) {
> > -			disable_percpu_nmi(ipi_irq_base + i);
> > -			teardown_percpu_nmi(ipi_irq_base + i);
> > +		if (!percpu_ipi_descs) {
> > +			if (ipi_should_be_nmi(i)) {
> > +				disable_percpu_nmi(ipi_irq_base + i);
> > +				teardown_percpu_nmi(ipi_irq_base + i);
> > +			} else {
> > +				disable_percpu_irq(ipi_irq_base + i);
> > +			}
> >  		} else {
> > -			disable_percpu_irq(ipi_irq_base + i);
> > +			disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
> >  		}
> >  	}
> >  }
> >  #endif
> >  
> > -void __init set_smp_ipi_range(int ipi_base, int n)
> > +static void ipi_setup_ppi(int ipi)
> > +{
> > +	int err, irq, cpu;
> > +
> > +	irq = ipi_irq_base + ipi;
> > +
> > +	if (ipi_should_be_nmi(irq)) {
> > +		err = request_percpu_nmi(irq, ipi_handler, "IPI", &irq_stat);
> > +		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
> > +	} else {
> > +		err = request_percpu_irq(irq, ipi_handler, "IPI", &irq_stat);
> > +		WARN(err, "Could not request IRQ %d as IRQ, err=%d\n", irq, err);
> > +	}
> > +
> > +	for_each_possible_cpu(cpu)
> > +		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
> > +
> > +	irq_set_status_flags(irq, IRQ_HIDDEN);
> > +}
> > +
> > +static void ipi_setup_lpi(int ipi, int ncpus)
> > +{
> > +	for (int cpu = 0; cpu < ncpus; cpu++) {
> > +		int err, irq;
> > +
> > +		irq = ipi_to_irq(ipi, cpu);
> > +
> > +		err = irq_force_affinity(irq, cpumask_of(cpu));
> > +
> > +		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
> > +
> > +		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
> > +				  &irq_stat);
> 
> Heads-up, kbuild bot (sparse) barfed (correctly) at this, because the
> &irq_stat pointer does not match the request_irq() void *dev_id parameter
> signature (it is void __percpu *).
> 
> Of course, the &irq_stat parameter is unused so this is harmless.
> 
> I would just pass NULL (because AFAICS irq_stat in the action handler is
> unused), the question is why are we passing &irq_stat in
> request_percpu_irq() if that's unused in ipi_handler() ?

Right, we have to have it there even if the ipi_handler() does not use
it, that's as much as I can gather by checking the request_percpu_irq()
interface and the percpu flow handler (handle_percpu_devid_irq()) used
for SGIs IRQs on GICv3.

For non-SGI IPIs, I will just pass NULL to request_irq() as void *dev_id
because AFAICS it is not used in arm64 ipi_handler() (I use the
handle_percpu_irq() flow handler), I applied the fix-up locally FYI.

Lorenzo
