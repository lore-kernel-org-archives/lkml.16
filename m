Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8761D6AA
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280007; cv=none; b=UacHPcXwzYQTJaT2eJoEK/BqyqHH2Gf6PhPeDVupVRkXiYc8vrPj4tkxsVTFeYovPoBxHdPuFYp1NLfFJd1lAB5vKsj4l4OIE/0NJzp4lRiU5EHSajvFZ9+PtuRsx26JASHlIpZ56gPnFL9F9C03b9SYXr0ZwOIuwCVxV+UClKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280007; c=relaxed/simple;
	bh=BoduCq/Gvf3oL+PCY3BKYpk4CBuUkJoN/jD6A9E/eY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDBCLyHNkNKmv3I6RMLEEQ+rQcdwYKYvgvxdSqUsS7iwejvATpLemiT79CFgiAjsBTQdITMGyQN5QuoR1bj3reoEaOpHwSjrjAW2IZ39HdLUhPT5dTeOpWutgkzX4+jEuQJFS/VaXTFFXRZL+87eGixN/rCMpFDeMcQiejoXnwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=HVFwtCGJ; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="HVFwtCGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1751280005; x=1782816005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u4+i+fCG0zXOAmrMwSL4XzdeT83nVSjToGPcdOCxeS8=;
  b=HVFwtCGJtSl5L1iWAsb4SbOSNeEGJCUOfe1mi+F5d3N5vAHWOfAKmkdl
   QKgXQX1FrAJw9QHtm6oqlnWZGV2/UYntmBsN7rwoPTIOayHTp6kOgbz1J
   7L+Cqhrot6dPeUMDlCeR2FeEhLL9jFFzZ62F59xABAtWJ4t3H8r0zB1Qu
   XrJzEcfyPS9X1XH5KNXqlV+0mpADJsGqie0P0r5Q/HHyZEZXirvOd/xt2
   D2qnVjq4DoDvorEFW+opB+nXx+oRDQmaJAJywfTFyko7qzRQid7z0w3bi
   /20RTrFEhvB+nQL4IdXRh0Y4Ol8+9QW7TqIwUxN+r7fQTeNwfBlVZYAqT
   g==;
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 19:29:55 +0900
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="2171375"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 19:29:55 +0900
Date: Mon, 30 Jun 2025 19:29:51 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	James Morse <james.morse@arm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [RFC PATCH] kernel/cpu: in freeze_secondary_cpus() ensure
 primary cpu is of domain type
Message-ID: <aGJnH0Ka2Y0koGAX@JPC00244420>
References: <20250630082103.829352-1-shashank.mahadasyam@sony.com>
 <20250630084808.GH1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630084808.GH1613376@noisy.programming.kicks-ass.net>

Hi Peter,

On Mon, Jun 30, 2025 at 10:48:08AM +0200, Peter Zijlstra wrote:
> > diff --git a/kernel/cpu.c b/kernel/cpu.c
> > index a59e009e0be4..d9167b0559a5 100644
> > --- a/kernel/cpu.c
> > +++ b/kernel/cpu.c
> > @@ -1902,12 +1902,28 @@ int freeze_secondary_cpus(int primary)
> >  
> >  	cpu_maps_update_begin();
> >  	if (primary == -1) {
> > -		primary = cpumask_first(cpu_online_mask);
> > -		if (!housekeeping_cpu(primary, HK_TYPE_TIMER))
> > -			primary = housekeeping_any_cpu(HK_TYPE_TIMER);
> > +		primary = cpumask_first_and_and(cpu_online_mask,
> > +								housekeeping_cpumask(HK_TYPE_TIMER),
> > +								housekeeping_cpumask(HK_TYPE_DOMAIN));
> 
> That's terrible indenting, please align after the opening bracket like:
> 
> 		primary = cpumask_first_and_and(cpu_online_mask,
> 						housekeeping_cpumask(HK_TYPE_TIMER),
> 						housekeeping_cpumask(HK_TYPE_DOMAIN));
> 
> Also, IIRC HK_TYPE_HRTIMER is deprecated and should be something like
> HK_TYPE_NOISE or somesuch. Frederic?
>     <snip>
> > +			primary = cpumask_first_and(cpu_online_mask,
> > +								housekeeping_cpumask(HK_TYPE_DOMAIN));
> 
> Indenting again.

Sorry about the indentation. I've now set my editor to use 8-space tabs.
I'll have it fixed in the next version of the patch.

HK_TYPE_KERNEL_NOISE was added by commit 6010d245ddc9f463bbf0
(sched/isolation: Consolidate housekeeping cpumasks that are always identical).
I'll replace HK_TYPE_TIMER with HK_TYPE_KERNEL_NOISE in the next
version.

> 
> > +			if (primary >= nr_cpu_ids) {
> > +				error = -ENODEV;
> > +				pr_err("No suitable primary CPU found. Ensure at least one non-isolated CPU is online\n");
> > +				goto abort;
> > +			}
> > +		} else if (!housekeeping_cpu(primary, HK_TYPE_DOMAIN)) {
> > +			error = -ENODEV;
> > +			pr_err("Primary CPU %d should not be isolated\n", primary);
> > +			goto abort;
> > +		}
> >  	}
> >  
> >  	/*
> > @@ -1943,6 +1959,7 @@ int freeze_secondary_cpus(int primary)
> >  	else
> >  		pr_err("Non-boot CPUs are not disabled\n");
> >  
> > +abort:
> >  	/*
> >  	 * Make sure the CPUs won't be enabled by someone else. We need to do
> >  	 * this even in case of failure as all freeze_secondary_cpus() users are
> 
> 
> Also; doesn't the above boil down to something like:
> 
> 	if (primary == -1) {
> 		primary = cpumask_first_and_and(cpu_online_mask,
> 						housekeeping_cpumask(HK_TYPE_TIMER),
> 						housekeeping_cpumask(HK_TYPE_DOMAIN));
> 	} if (!cpu_online(primary)) {
> 		primary = cpumask_first_and(cpu_online_mask,
> 					    housekeeping_cpumask(HK_TYPE_DOMAIN));
> 	} 
> 
> 	if (primary >= nr_cpu_ids || !housekeeping_cpu(primary, HK_TYPE_DOMAIN)) {
> 		error = -ENODEV;
> 		pr_err("Primary CPU %d should not be isolated\n", primary);
> 		goto abort;
> 	}
> 
> Yes, this has less error string variation, but the code is simpler.

If primary >= nr_cpu_ids, primary should not be used in the error
string. But I do think it can be simplified as so, at the cost of the
error string not being completely accurate:

	if (primary == -1) {
		primary = cpumask_first_and_and(cpu_online_mask,
						housekeeping_cpumask(HK_TYPE_TIMER),
						housekeeping_cpumask(HK_TYPE_DOMAIN));
	} else if (!cpu_online(primary)) {
		primary = cpumask_first_and(cpu_online_mask,
					    housekeeping_cpumask(HK_TYPE_DOMAIN));
	}
	if (primary >= nr_cpu_ids) {
		error = -ENODEV;
		pr_err("No suitable primary CPU found. Ensure at least one non-isolated CPU is online\n");
		goto abort;
	} else if (!housekeeping_cpu(HK_TYPE_DOMAIN)) {
		error = -ENODEV;
		pr_err("Primary CPU %d should not be isolated\n", primary);
		goto abort;
	}

The "Ensure at lest one non-isolated CPU is online" is only partially
true in the case primary = -1 was passed and we couldn't find a suitable
cpu because we were looking for an online cpu that's non-isolated _and_
non-nohz_full. But the "non-nohz_full" condition isn't taken care of in
the !cpu_online(primary) branch. Although, I do think it should be
(question 2 below): in both the branches, we should look for a cpu that's online,
non-isolated, and of domain type. That would further simplify the above snippet to,

	if (primary == -1 || !cpu_online(primary)) {
		primary = cpumask_first_and_and(cpu_online_mask,
						housekeeping_cpumask(HK_TYPE_TIMER),
						housekeeping_cpumask(HK_TYPE_DOMAIN));
	}
	if (primary >= nr_cpu_ids) {
		error = -ENODEV;
		pr_err("No suitable primary CPU found. Ensure at least one non-isolated, non-nohz_full CPU is online\n");
		goto abort;
	} else if (!housekeeping_cpu(HK_TYPE_DOMAIN) || !housekeeping_cpu(HK_TYPE_TIMER)) {
		error = -ENODEV;
		pr_err("Primary CPU %d should not be isolated or nohz_full\n", primary);
		goto abort;
	}

Now the error string is accurate.

>2. This concerns the following snippet of freeze_secondary_cpus():
>
>        if (primary == -1) {
>            primary = cpumask_first(cpu_online_mask);
>            if (!housekeeping_cpu(primary, HK_TYPE_TIMER))
>                primary = housekeeping_any_cpu(HK_TYPE_TIMER);
>        } else {
>            if (!cpu_online(primary))
>                primary = cpumask_first(cpu_online_mask);
>        }
>
>    suspend_disable_secondary_cpus() calls freeze_secondary_cpus() with primary = -1,
>    if CONFIG_PM_SLEEP_SMP_NONZERO_CPU, and primary = 0 otherwise. On x86 and arm64,
>    for example, it's called with primary = 0. In the primary != -1 branch, why
>    isn't primary checked for HK_TYPE_TIMER as is done in the primary == 1 branch?
>    On x86 this is fine, since it doesn't advertise ARCH_SUSPEND_NONZERO_CPU,
>    cpu 0 will be removed out of the nohz_full mask even if it's specified. And it
>    also cannot be offlined. So on x86, the primary cpu will always be online and
>    non-nohz_full. But on arm64, for example, cpu 0 _can_ be offlined. So
>    cpumask_first(cpu_online_mask) will find the next online cpu, which may not
>    be non-nohz_full.
>
>    Also, why the requirement for the primary cpu to be of HK_TYPE_TIMER?

The HK_TYPE_TIMER check was added by Nicholas in
commit 9ca12ac04bb7d7cfb28aa5 (kernel/cpu: Allow non-zero CPU to be primary
for suspend / kexec freeze) [1], but it was added only to the primary = -1 branch.
I'm not sure why we don't check for HK_TYPE_TIMER when primary is specified.

[1] https://lore.kernel.org/all/20190411033448.20842-4-npiggin@gmail.com/

Thanks,
Shashank

