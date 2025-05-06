Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB3A283FF5
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547209; cv=none; b=ZcneadBt1P0B+T3WmiHMp4Izf/CBXB3sMBd3PNPZjSGKITgU/3PefSH5DuQLWnaH1qu5n614q/LyXnIHSngnyFvKarEkI2/UIzcHLZO5IApWdh4zeUuCalDJVQz1AT76UyYrpC1hKs0LN1Xph8/9XuG3ZrN9Qx/pZZDR291jQ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547209; c=relaxed/simple;
	bh=O27YcR0gbPT+9EysSOV0xfoQF1dzy4G2vSwjKofllSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWzYu/wazMHIEnkZtKVX6/6DeZXUi4XTYX5ER/1eBaPPAs4iWiWuE9Cw0xkLivuuiyI/C8y402H8UoRiUF7fWQ2zjf9sIdtcIKVZHuc41pZVcQq75R9vr9O3roqDRdulLsZ+OPBq+2EjwTcxHoFGWv37yrzy5ohkwpTmytUBWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkfnVYbN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkfnVYbN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1D1C4CEEB;
	Tue,  6 May 2025 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746547208;
	bh=O27YcR0gbPT+9EysSOV0xfoQF1dzy4G2vSwjKofllSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkfnVYbNeaNC58aQpS2nv9XBCx/wAVF20aFZmHSi1++J/3Txpco/E+td7mjVFx6XP
	 m7NXivaTwMkh6R/gRgR2HnRmWbAYG7SnXVzb1mfcgR27YeD5AMEV9w4DBr4q9tJzbE
	 fA2KgRDglVSy2peZJ+eC1pXPqXOrM2CXQUexdTLeO/lbV/4shR1kZhk9Q4KBYCEpY6
	 1xGGSYd/Ei4hOoHNtj2ZIdJbiiyd9By4Uuw//nlHmE/qamR1bP5mRMDaBjp5MaSDTT
	 xFfo2eNO9RlXjZ3U31T+g4lsmHr2DJZhX3F/wAUvv/9Ohb7/xUDlTWJQQtXn7KXV54
	 orqDRT1Pj8p8A==
Date: Tue, 6 May 2025 18:00:05 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 5/5] timers: Exclude isolated cpus from timer migation
Message-ID: <aBoyBbDDslnly60w@localhost.localdomain>
References: <20250506091534.42117-7-gmonaco@redhat.com>
 <20250506091534.42117-12-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506091534.42117-12-gmonaco@redhat.com>

Le Tue, May 06, 2025 at 11:15:40AM +0200, Gabriele Monaco a écrit :
> @@ -1472,15 +1473,24 @@ static int tmigr_cpu_unavailable(unsigned int cpu)
>  
>  static int tmigr_cpu_available(unsigned int cpu)
>  {
> -	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
> +	struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
>  
>  	/* Check whether CPU data was successfully initialized */
>  	if (WARN_ON_ONCE(!tmc->tmgroup))
>  		return -EINVAL;
>  
> +	/*
> +	 * Isolated CPUs don't participate in timer migration.
> +	 * Checking here guarantees that CPUs isolated at boot (e.g. isolcpus)
> +	 * are not marked as available when they first become online.
> +	 * During runtime, any offline isolated CPU is also not incorrectly
> +	 * marked as available once it gets back online.
> +	 */
> +	if (cpu_is_isolated(cpu))

I would like nohz_full to remain an exception here. It already handles
well (even better than domain isolated CPUs) global timers by behaving like idle
CPUs. Because when the tick is stopped on nohz_full, the global timers are
then handled by housekeeping. We are doing something different with domain
isolated CPUs because those must still handle their own global timers.

So please keep nohz_full CPUs inside the tree (that includes CPUs that are
_both_ nohz_full and domain isolated).


> +		return 0;
>  	raw_spin_lock_irq(&tmc->lock);
>  	trace_tmigr_cpu_available(tmc);
> -	tmc->idle = timer_base_is_idle();
> +	tmc->idle = timer_base_remote_is_idle(cpu);

This is racy:

      CPU 0                                 CPU 1
      -----                                 -----

tick_nohz_stop_tick()
    timer_base_try_to_set_idle()
        __get_next_timer_interrupt()
            tmigr_cpu_deactivate()
                                          tmigr_isolated_exclude_cpumask()
                                              tmigr_cpu_available()
                                                  tmc->idle = timer_base_remote_is_idle(cpu);
                                                  if (!tmc->idle)
                                                      __tmigr_cpu_activate(tmc);
            base_global->is_idle = true;
            

CPU 0 can now become the migrator even when it's idle sleeping forever.

My suggestion is to not rely remotely on is_idle. This can only
be racy. You can trigger tmigr_cpu_available() through smp_call_function_many()
instead.

Thanks.


>  	if (!tmc->idle)
>  		__tmigr_cpu_activate(tmc);
>  	tmc->available = true;
> @@ -1489,6 +1499,21 @@ static int tmigr_cpu_available(unsigned int cpu)
>  	return 0;
>  }
>  
> +void tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
> +{
> +	int cpu;
> +
> +	lockdep_assert_cpus_held();
> +
> +	for_each_cpu_and(cpu, exclude_cpumask, tmigr_available_cpumask)
> +		tmigr_cpu_unavailable(cpu);
> +
> +	for_each_cpu_andnot(cpu, cpu_online_mask, exclude_cpumask) {
> +		if (!cpumask_test_cpu(cpu, tmigr_available_cpumask))
> +			tmigr_cpu_available(cpu);
> +	}
> +}
> +
>  static void tmigr_init_group(struct tmigr_group *group, unsigned int lvl,
>  			     int node)
>  {
> -- 
> 2.49.0
> 

-- 
Frederic Weisbecker
SUSE Labs
