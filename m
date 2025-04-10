Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBCA1E1A17
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273591; cv=none; b=Q0YwcwsTvUS3+LMLMuIm3YAAs62QF8dYVxTgazNgdYTlWKsA9RXBCEwcFyxqEbSZ48V0+kcZHdff9wSBMMIYM5lrCjjdO4bfnhMNoaP2HeHp4yMMuK3j/HOORdx5KJp5KQCjDe0temXHZ9+W7eeD2vhllZxLAkefdcu5+Rj4Us4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273591; c=relaxed/simple;
	bh=Zt5wT8BxHcC6U8kz+EOUAJtbJ0+dgEe+qtaubnwIykQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OIf6qXMcQ+XmIBX/azoRdvla6YbIDcwpIR9lUmRKj0rlIXhBEcwvqJq/CizQnHfJdcKXQURmyma06gToVzV59Y5Oa0ClgAX3WYuOWKfXw7q9FQRCs+cRIfAYSu8nvpB7sGJPxCm3Uyp2HTYbQ7ENoU556jdl7rpaIxRGkRmgyfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IrCY+a8Z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K2lCdSzW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IrCY+a8Z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K2lCdSzW"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744273587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GcP8bp/Bwxaz8iMlCvzBl968xjN5im+xVM+3YcYabbk=;
	b=IrCY+a8ZKPOrJCYZ1CKJKGPAILCcmdHhY1saDz0LyEz8CfcKsTGo4O0zLliEddWX6NSJcw
	N3rH/hNZn854OhQqeBK2O2wCyPajirHi2Tmu3N1mHEWJwNwWIpuyvUZ4wx+ojH2kzXbmGM
	lz5RXL6iPiEXnOPNMxk84ruHmRtuokIcLqPWCmLy+8tAnyR+bqSJP1Iz3o2wXifp+Q3QyC
	cUvBnx9NqkRAmXvN5bNlCKmOTfRytU4Q7EVgYXtFCHey5VRtmHOBhGynt4eXoKOwTuL5RP
	WI4L+PSsfmYeJSslSMxZLCO38L3B9SrZ91svLdS2dfVyD2TsiNjEOjoN/h/pKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744273587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GcP8bp/Bwxaz8iMlCvzBl968xjN5im+xVM+3YcYabbk=;
	b=K2lCdSzWG57FDviMSN5qmowD3D4yuX86cH4rzn/LSewWL3haeE75uBrXY8ZxzUX4eydR14
	U+TuzdE1AN7HNyBw==
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
In-Reply-To: <20250410065446.57304-2-gmonaco@redhat.com>
References: <20250410065446.57304-2-gmonaco@redhat.com>
Date: Thu, 10 Apr 2025 10:26:26 +0200
Message-ID: <87ecy0tob1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 10 2025 at 08:54, Gabriele Monaco wrote:
>  
> +/*  cpumask excluded from migration */
> +static cpumask_var_t tmigr_unavailable_cpumask;

Why is this a negated mask instead of being the obvious and intuitive
available mask?

>  	if (firstexp != KTIME_MAX) {
> -		migrator = cpumask_any_but(cpu_online_mask, cpu);
> +		migrator = cpumask_nth_andnot(0, cpu_possible_mask,
> +					      tmigr_unavailable_cpumask);

That's exactly what this negated mask causes: incomprehensible code.

	cpumask_clear_cpu(cpu, available_mask);
        ...               
		migrator = cpumask_first(available_mask);

is too simple and obvious, right?

> +		/* Fall back to any online in case all are isolated. */

How can that happen? There is always at least _ONE_ housekeeping,
non-isolated, CPU online, no?

> +		if (migrator >= nr_cpu_ids)
> +			migrator = cpumask_any_but(cpu_online_mask, cpu);
>  		work_on_cpu(migrator, tmigr_trigger_active, NULL);
>  	}
>  
>  	return 0;
>  }
>  
> -static int tmigr_cpu_online(unsigned int cpu)
> +static int tmigr_cpu_available(unsigned int cpu)
>  {
> -	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
> +	struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
>  
>  	/* Check whether CPU data was successfully initialized */
>  	if (WARN_ON_ONCE(!tmc->tmgroup))
>  		return -EINVAL;
>  
> +	/* Silently ignore online requests if isolated */

This comment makes no sense.

     /* Isolated CPUs are not participating in timer migration */

makes it entirely clear what this is about, no?

That brings me to the general design decision here. Your changelog
explains at great length WHAT the change is doing, but completely fails
to explain the consequences and the rationale why this is the right
thing to do.

By excluding the isolated CPUs from migration completely, any 'global'
timer, which is armed on such a CPU, has to be expired on that isolated
CPU. That's fundamentaly different from e.g. RCU isolation.

It might be the right thing to do and harmless, but without a proper
explanation it's a silent side effect of your changes, which leaves
people scratching their heads.

> +	if (cpu_is_isolated(cpu))
> +		return 0;
>  	raw_spin_lock_irq(&tmc->lock);
> -	trace_tmigr_cpu_online(tmc);
> +	trace_tmigr_cpu_available(tmc);
>  	tmc->idle = timer_base_is_idle();
>  	if (!tmc->idle)
>  		__tmigr_cpu_activate(tmc);
> -	tmc->online = true;
> +	tmc->available = true;
> +	tmc->idle = true;

How so?

> +	cpumask_clear_cpu(cpu, tmigr_unavailable_cpumask);
>  	raw_spin_unlock_irq(&tmc->lock);
>  	return 0;
>  }
>  
> +int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)

cpumask_var_t is wrong here. 'const struct cpumask *' is what you want.

> +{
> +	int cpu;
> +	cpumask_var_t cpumask;

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#coding-style-notes

> +	if (!zalloc_cpumask_var(&cpumask, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	cpumask_copy(cpumask, tmigr_unavailable_cpumask);

What serializes this against concurrent CPU hotplug? I assume it's done
by the caller, but then this code should have a lockdep assert to
validate it. If it's not, then this is broken.

As it is serialized it does not need a copy either, right?

> +	/* Was not excluded but should be excluded now. */
> +	for_each_cpu_andnot(cpu, exclude_cpumask, cpumask)
> +		tmigr_cpu_unavailable(cpu);
> +
> +	/* Was excluded but should be included now */
> +	for_each_cpu_andnot(cpu, cpumask, exclude_cpumask)
> +		if (cpu_online(cpu))
> +			tmigr_cpu_available(cpu);

My brain hurts by now.

         for_each_cpu_and(cpu, available_mask, exclude_mask)
         	tmigr_cpu_unavailable(cpu);

         for_each_cpu_andnot(cpu, cpu_online_mask, exclude_mask) {
         	if (!cpumask_test_cpu(cpu, available_mask))
                	tmigr_cpu_available(cpu);
         }

No?

Also this patch is doing too many things at once. It want's to be split
into:

    Patch 1: Rename 'online' to 'available' (bit and function names)
    Patch 2: Add the available mask logic
    Patch 3: Add the isolation functionality

Thanks,

        tglx
