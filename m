Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C8321A459
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736263; cv=none; b=iO5XTH75MfQN4ymPekzFiAuxSDNE1ho/dlpBnnS1vchUh0NJmm20Et54GTO2KSvUMNthzYDmKRKCDx2nNCqsexZU/jrKZfoLbTVzmmGz2csKNPTOYeHI40RQXUdY5Kg7sUH0lQoCnX8Et0vsHnNNlYmn68brXzWu47o85Bip+cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736263; c=relaxed/simple;
	bh=9U6YX3W2B9G4OiKz5edOZ0uafPotHEljy1wWN/xh1g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1ux7dt1PO/GH4C/RkPwK3yvwMAoZsEJd0Ctj1Xr758YvrZLh9lNLM+DEepyrS3IDfr9S+DyypGvC/td+8XA+sAAt9Rpa+Tk36ixGF5RIdgOWMDOQ28NK0FII/OEJ6onCfDOS2KbHUrzJVzJm7ior66Q2V3Aa4TITy7LlTgIezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JE9BsWUy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JE9BsWUy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1128CC4CEF1;
	Tue, 20 May 2025 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747736261;
	bh=9U6YX3W2B9G4OiKz5edOZ0uafPotHEljy1wWN/xh1g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JE9BsWUyaTBKdPoLZwivhB75f7tfIkjtyzJKYHaT/vFhl7+lDrVKhoHKRBuy9DgsO
	 JC/tycWx2bPwUtqrGlyI9PILyJChR/PCddpg3ViXUD2ipO6K8zNOHXaLl2QaAa2ScC
	 qexxdXZnOGUT851Omdb1GRqGxKam4vCcOWiYNyUn3De6lQuO1lQifVmeW++xxhglqX
	 RHH/AUkdlKwX2SJ1UZYEQZ281Pw2nZS87zOHHAm2yZ8DdNAXLxd9f5AApdaqPLT1sg
	 gjjeYbn6ulrIYWLhh0b2iwZ8EmzVntwKFmmKUnn1vKSvcvYNWQQdKpEJklpSI2uKvu
	 sGg5lt1uOAwhA==
Date: Tue, 20 May 2025 12:17:37 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 4/6] sched/isolation: Force housekeeping if isolcpus
 and nohz_full don't leave any
Message-ID: <aCxWwVy2UUmvinyZ@localhost.localdomain>
References: <20250508145319.97794-8-gmonaco@redhat.com>
 <20250508145319.97794-12-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508145319.97794-12-gmonaco@redhat.com>

Le Thu, May 08, 2025 at 04:53:24PM +0200, Gabriele Monaco a écrit :
> Currently the user can set up isolcpus and nohz_full in such a way that
> leaves no housekeeping CPU (i.e. no CPU that is neither domain isolated
> nor nohz full). This can be a problem for other subsystems (e.g. the
> timer wheel imgration).
> 
> Prevent this configuration by setting the boot CPU as housekeeping if
> the union of isolcpus and nohz_full covers all CPUs. In a similar
> fashion as it already happens if either of them covers all CPUs.
> 
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>  include/linux/tick.h     |  2 ++
>  kernel/sched/isolation.c | 20 ++++++++++++++++++++
>  kernel/time/tick-sched.c |  7 +++++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/include/linux/tick.h b/include/linux/tick.h
> index b8ddc8e631a3..0b32c0bd3512 100644
> --- a/include/linux/tick.h
> +++ b/include/linux/tick.h
> @@ -278,6 +278,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
>  extern void tick_nohz_full_kick_cpu(int cpu);
>  extern void __tick_nohz_task_switch(void);
>  extern void __init tick_nohz_full_setup(cpumask_var_t cpumask);
> +extern void __init tick_nohz_full_clear_cpu(unsigned int cpu);
>  #else
>  static inline bool tick_nohz_full_enabled(void) { return false; }
>  static inline bool tick_nohz_full_cpu(int cpu) { return false; }
> @@ -304,6 +305,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
>  static inline void tick_nohz_full_kick_cpu(int cpu) { }
>  static inline void __tick_nohz_task_switch(void) { }
>  static inline void tick_nohz_full_setup(cpumask_var_t cpumask) { }
> +static inline void tick_nohz_full_clear_cpu(unsigned int cpu) { }
>  #endif
>  
>  static inline void tick_nohz_task_switch(void)
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 81bc8b329ef1..27b65b401534 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -165,6 +165,26 @@ static int __init housekeeping_setup(char *str, unsigned long flags)
>  			}
>  		}
>  
> +		/* Check in combination with the previously set cpumask */
> +		type = find_first_bit(&housekeeping.flags, HK_TYPE_MAX);
> +		first_cpu = cpumask_first_and_and(cpu_present_mask,
> +						  housekeeping_staging,
> +						  housekeeping.cpumasks[type]);
> +		if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
> +			pr_warn("Housekeeping: must include one present CPU neither "
> +				"in nohz_full= nor in isolcpus=, using boot CPU:%d\n",
> +				smp_processor_id());
> +			for_each_set_bit(type, &housekeeping.flags, HK_TYPE_MAX)
> +				__cpumask_set_cpu(smp_processor_id(),
> +						  housekeeping.cpumasks[type]);
> +			__cpumask_set_cpu(smp_processor_id(), housekeeping_staging);
> +			__cpumask_clear_cpu(smp_processor_id(), non_housekeeping_mask);
> +			tick_nohz_full_clear_cpu(smp_processor_id());
> +
> +			if (cpumask_empty(non_housekeeping_mask))
> +				goto free_housekeeping_staging;
> +		}
> +

Looking again at that, how is it possible to set a different CPU between
isolcpus= and nohz_full= ?

		enum hk_type type;
		unsigned long iter_flags = flags & housekeeping.flags;

		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX) {
			if (!cpumask_equal(housekeeping_staging,
					   housekeeping.cpumasks[type])) {
				pr_warn("Housekeeping: nohz_full= must match isolcpus=\n");
				goto free_housekeeping_staging;
			}
		}

-- 
Frederic Weisbecker
SUSE Labs
