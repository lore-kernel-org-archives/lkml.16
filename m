Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666CE1754B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438855; cv=none; b=PwOLfLU3MriKsK/VnVeLByXWBC8ZuQyutxzFZGE1/4Q7zxa5FgYm2cYlyM7smozIm+xyZLo5trkE/tmbe0DXm+JP1y8QQpgPczX8YbJoT21t09FLgmdakawTH1MW02FzKMiVlYR/13thRhrdGmwtRZ4jJQH7ZnPm8/qG0KmgShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438855; c=relaxed/simple;
	bh=u5j3oSDjt2m4XoKCZRShfgJ93sMeb2IJ60LHHDWjXUM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h2rFwbgBVfL5wGKA0NA25DLj84aUXKNqk8fQbhRuvmhuCjKuFVf/B3Nn+p7p32LVn19YtuGbt1Az2dnAVWnNJGxC15NeqKtUS1c8CZVuSpj7VGM6ESuN0tVDf2/ghusQVNsdBFfqLTJS8CY8KfOW9c9I5uNEq/edlvgOTiMfpE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K0S6b7xp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FN79cN+c; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K0S6b7xp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FN79cN+c"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750438851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5UK6tcGwGcSmp6JzY9pybOxQipHZHVqlupXH6Fcm41w=;
	b=K0S6b7xp5Z92h7rDFcw8eBkKBCJTTtYfYYcKhIEeeBPsmh2VjFvFZwMRsfJnJ4TKyC+18P
	QBb3ulqXvqqJu4kUXVM+2QSSTz3pIfSYkT2R4kKD1G01jOnZLKAullm8/xrrQjtVbcRcof
	kedLik/uJWxcUCS0RbeUwiLrt348ri1mVCBx7AKlenJSEORkoaWiNGqoeCjsMcwJEaB30Y
	aLNw2hracYCs1Af/H0FBCuVaRyeI23Xjf4OUK6plan1wQ5qyLprdBf2eVmYkhWjhJg5810
	BYiWw84CZLnOG4isiUAY265jEboZJmy1Wx176a64IXh02xIKkSbB8JtEQ03fag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750438851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5UK6tcGwGcSmp6JzY9pybOxQipHZHVqlupXH6Fcm41w=;
	b=FN79cN+cL9ikP9y/ScHmRnWsbDm/I+/3UNpLB+YdFvq/tKCnQUYs/jL45hJ4DEC3DlgsYC
	QE/I0KPowCQbeqAA==
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: Re: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
In-Reply-To: <20250530142031.215594-7-gmonaco@redhat.com>
References: <20250530142031.215594-1-gmonaco@redhat.com>
 <20250530142031.215594-7-gmonaco@redhat.com>
Date: Fri, 20 Jun 2025 19:00:50 +0200
Message-ID: <875xgqqrel.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 30 2025 at 16:20, Gabriele Monaco wrote:

timer migation?

> The timer migration mechanism allows active CPUs to pull timers from
> idle ones to improve the overall idle time. This is however undesired
> when CPU intensive workloads run on isolated cores, as the algorithm
> would move the timers from housekeeping to isolated cores, negatively
> affecting the isolation.
>
> This effect was noticed on a 128 cores machine running oslat on the
> isolated cores (1-31,33-63,65-95,97-127). The tool monopolises CPUs,
> and the CPU with lowest count in a timer migration hierarchy (here 1
> and 65) appears as always active and continuously pulls global timers,
> from the housekeeping CPUs. This ends up moving driver work (e.g.
> delayed work) to isolated CPUs and causes latency spikes:
>
> before the change:
>
>  # oslat -c 1-31,33-63,65-95,97-127 -D 62s
>  ...
>   Maximum:     1203 10 3 4 ... 5 (us)
>
> after the change:
>
>  # oslat -c 1-31,33-63,65-95,97-127 -D 62s
>  ...
>   Maximum:      10 4 3 4 3 ... 5 (us)

It's nice to add numbers, but you should out them at the end _after_ you
described the change. At this point 'after the change' makes no sense as
the reader does not read backwards or jumps around randomly in the text.

> Exclude isolated cores from the timer migration algorithm, extend the
> concept of unavailable cores, currently used for offline ones, to
> isolated ones:
> * A core is unavailable if isolated or offline;
> * A core is available if isolated and offline;
>
> A core is considered unavailable as isolated if it belongs to:
> * the isolcpus (domain) list
> * an isolated cpuset
> Except if it is:
> * in the nohz_full list (already idle for the hierarchy)
> * the nohz timekeeper core (must be available to handle global timers)
>
> Due to how the timer migration algorithm works, any CPU part of the
> hierarchy can have their global timers pulled by remote CPUs and have to
> pull remote timers, only skipping pulling remote timers would break the
> logic.
> For this reason, we prevent isolated CPUs from pulling remote global

s/we//

> timers, but also the other way around: any global timer started on an
> isolated CPU will run there. This does not break the concept of
> isolation (global timers don't come from outside the CPU) and, if
> considered inappropriate, can usually be mitigated with other isolation
> techniques (e.g. IRQ pinning).

> +#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
> +extern int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask);

s/cpumask_var_t/struct cpumask */

cpumask_var_t is only for declaration purposes to avoid ifdeffery, but a
function always gets a pointer to the cpumask itself.

> diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
> index 25439f961ccf8..a14fbca7457fe 100644
> --- a/kernel/time/timer_migration.c
> +++ b/kernel/time/timer_migration.c
> @@ -10,6 +10,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/timerqueue.h>
>  #include <trace/events/ipi.h>
> +#include <linux/sched/isolation.h>
>  
>  #include "timer_migration.h"
>  #include "tick-internal.h"
> @@ -1449,6 +1450,13 @@ static int tmigr_cpu_unavailable(unsigned int cpu)
>  	int migrator;
>  	u64 firstexp;
>  
> +	/*
> +	 * The tick CPU can be marked as isolated by the cpuset code, however
> +	 * we cannot mark it as unavailable to avoid having no global migrator
> +	 * for the nohz_full CPUs.
> +	 */
> +	if (!tick_nohz_cpu_hotpluggable(cpu))
> +		return 0;

This is really horribly confusing. This function is also invoked from
the CPU offline hotplug callback and in context of CPU hotplug this
check makes absolutely no sense at all.

Please do this check in the smp function call which handles this
isolation muck.

>  	raw_spin_lock_irq(&tmc->lock);
>  	tmc->available = false;

This clearly lacks a check whether available is true or not. If it's
false, it must return right here.

To avoid goto or whatever ugly please convert that locking to a scoped
guard in a seperate patch. Then you can simply do

      if (!tmc->available)
      	  return 0;

inside the lock scope and the compiler will mop it up for you.

>  	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
> @@ -1478,6 +1486,20 @@ static int tmigr_cpu_available(unsigned int cpu)
>  	if (WARN_ON_ONCE(!tmc->tmgroup))
>  		return -EINVAL;
>  
> +	/*
> +	 * Domain isolated CPUs don't participate in timer migration, nohz_full
> +	 * CPUs are still part of the hierarchy but are always considered idle.
> +	 * Additionally, the tick CPU during nohz_full cannot be disabled.
> +	 * Checking here guarantees that CPUs isolated at boot (e.g. isolcpus)
> +	 * are not marked as available when they first become online.
> +	 * During runtime, any offline isolated CPU is also not incorrectly
> +	 * marked as available once it gets back online.
> +	 */
> +	if ((!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
> +	     cpuset_cpu_is_isolated(cpu)) &&
> +	    housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) &&
> +	    tick_nohz_cpu_hotpluggable(cpu))
> +		return 0;

Same nonsense as above.

>  	raw_spin_lock_irq(&tmc->lock);

Same missing check for available == true

>  	trace_tmigr_cpu_available(tmc);
>  	tmc->idle = timer_base_is_idle();
> @@ -1489,6 +1511,38 @@ static int tmigr_cpu_available(unsigned int cpu)
>  	return 0;
>  }
>  
> +static void tmigr_remote_cpu_unavailable(void *ignored)

This is a SMP function call so what's the _remote_ for? It runs on the
CPU on which the call is scheduled. Please make it entirely clear what
this is about. This is about isolation and not about available. The fact
that it sets/clears the availability is just an implementation detail.

static void timgr_cpu_isolate(void *ignored)
{
	unsigned int cpu = smp_processor_id();

        /* Big fat comment */
	if (!tick_nohz_cpu_hotpluggable(cpu))
        	return;
                
	tmigr_set_cpu_available(cpu);
}

> +{
> +	tmigr_cpu_unavailable(smp_processor_id());
> +}
> +
> +static void tmigr_remote_cpu_available(void *ignored)
> +{
> +	tmigr_cpu_available(smp_processor_id());
> +}
> +
> +int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
> +{
> +	cpumask_var_t cpumask;
> +	int ret = 0;
> +
> +	lockdep_assert_cpus_held();
> +
> +	if (!alloc_cpumask_var(&cpumask, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	cpumask_and(cpumask, exclude_cpumask, tmigr_available_cpumask);
> +	cpumask_and(cpumask, cpumask, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
> +	on_each_cpu_mask(cpumask, tmigr_remote_cpu_unavailable, NULL, 0);

Why are those function calls async?

Shouldn't it be guaranteed that the change has been committed once this
function returns? If not then this wants a comment why it does not matter.

Thanks,

        tglx
