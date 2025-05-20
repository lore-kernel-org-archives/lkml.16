Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF927D77A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747742535; cv=none; b=DHMTzWZEYpOwwmSnw5TX7Wp8URGix0XCZVWzIl5QIQxrBh/yb3Zcbl9PRrYb86VQ0gmjUxR82shPHleXWoP+qnOAwBdD7ekcUFvSY9UqK+fDkjud4NU7brLYf6CgN4FvB5Bkx7dXYoMbJzK+wAbgwoAAqIYfOYYWOspMv+2FqRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747742535; c=relaxed/simple;
	bh=qvUElvheYQ8LwukyqWUZVDgjbyUVfhzuv5PfNPBUvIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzYZIVi7ezd0YLdyB9EzoSVzgZJjAnXuP44UIGPzJziLA3PqNaaz0KWzwBwoxb4RTx83dW/WNBLMoCoyIyYxwzDlB8EXIpA9ONqus6pJuaSNPjX1oU7bFwKPpFstpD4hnAGkgLCfIxk7eD8Q4AOE5t8TlTgXnUOCf08hicL8aR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1/gqES+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1/gqES+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88698C4CEEB;
	Tue, 20 May 2025 12:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747742534;
	bh=qvUElvheYQ8LwukyqWUZVDgjbyUVfhzuv5PfNPBUvIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1/gqES+zwp4Qks6F81eSeCU+ll+/MTWPSLUOyBBRvgUFPcFvmF6RCCAt1kqlzPW/
	 VYmaY3qTmHlZk6P1Il2ZPmrwX7M+vhE0ELEZxOhsVkVAjdwPFbCa76dbJW8UeOr16U
	 CHTJwAYVnYFjSfJ8t4xQkYJcLhGeueYMSu6PC5w8nzzo2ir34mtdzGV0IRp3RUF+vv
	 Qhd4mLwjSINaIWwaW7vxlJ4Ahh6tyGnRrhDTJMf3eS9Zc142/z1DjTLw32n+21Lwzm
	 246t+F1hdAg5kzEjC4VQEM4WoVbzPPCIU/IZ9dzIgPh5K/BTxcCnMMJU/QhtSubbKV
	 mI1PQvBH0+ujg==
Date: Tue, 20 May 2025 14:02:11 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 4/6] sched/isolation: Force housekeeping if isolcpus
 and nohz_full don't leave any
Message-ID: <aCxvQxSS31PcHsDR@localhost.localdomain>
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

I wouldn't even bother recovering:

pr_warn("Housekeeping: must include one present CPU neither in nohz_full= nor in
isolcpus=\n ignoring setting %lx", flags);

goto free_housekeeping_staging;

-- 
Frederic Weisbecker
SUSE Labs
