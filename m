Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9DF295517
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751886697; cv=none; b=BEfTGcArdpHq9kwBLfUETOMGWTBXC+4FPMC5c2pVtkGzvWhqXpSx5sfCvFlcmN80ku4b5XIyyAM074x2h5yU9mQwo1/vaq7Nhs5fq38YQxiWBGnHIYdTYkL0qgstm0Lh39k2v4Jji3XNM4vOHzm+s1QAvKpAYqs21pEcG8fXk7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751886697; c=relaxed/simple;
	bh=eUElEPwoOvyaNjTOTv3WX7sLQxh41JrdSfFl1EEMg74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRPUzfHCQjxWZmzxJbJ/PWJUk1DIaypvnRrQEcIydheNnYGLEd5Dpj+Kj7tigUbucasdQ/PTnc8NQP22dr+ZVhA7jUD5UnMdDue+SN2WR7qXwvWeEPtzi0EKYvoVfNa8XlxiG2qJDN/G4ALXOoc51yOzmz6j1FiuQHNm8ZKWg44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3fPu0hy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3fPu0hy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71AEC4CEE3;
	Mon,  7 Jul 2025 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751886697;
	bh=eUElEPwoOvyaNjTOTv3WX7sLQxh41JrdSfFl1EEMg74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3fPu0hyhYB+YrvfW5e+eFQTvlukO6QVmYR04vnTfUADN46+b/O8FxDHFjoBpwo2V
	 ToXsUkUdFemzd7exumn2p5wt45KHBLR+G37HjqYYi07geKq0pUMpryCm0OEK6sDfN2
	 4RjbfD7aINbvIyNou4Lzf/Ogn2hpZ1sMuIihIl61QzX5r0RB6+y6LhWXNbAQdmKVVC
	 HDP9M8Sy41tZzJ/Osb3W3oAK3lMY0L/fkpXxpiuOiZV0MFY9Hq+wJpDSoCcDrRu/CA
	 FEIWHcciemxU2aVp4sC/42tCWpGWRSZxEr3GjZxbGw1y41cmzZPf3TVcyZxmGrwLbs
	 8oidEKIpmntjQ==
Date: Mon, 7 Jul 2025 13:11:34 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v7 2/7] timers: Add the available mask in timer migration
Message-ID: <aGurZkPohjZ0pRwX@localhost.localdomain>
References: <20250626114900.106061-1-gmonaco@redhat.com>
 <20250626114900.106061-3-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626114900.106061-3-gmonaco@redhat.com>

Le Thu, Jun 26, 2025 at 01:48:55PM +0200, Gabriele Monaco a écrit :
> Keep track of the CPUs available for timer migration in a cpumask. This
> prepares the ground to generalise the concept of unavailable CPUs.
> 
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>  kernel/time/timer_migration.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
> index 2c2c8810b8137..2ec003c2bbbea 100644
> --- a/kernel/time/timer_migration.c
> +++ b/kernel/time/timer_migration.c
> @@ -422,6 +422,9 @@ static unsigned int tmigr_crossnode_level __read_mostly;
>  
>  static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
>  
> +/* CPUs available for timer migration */
> +static cpumask_var_t tmigr_available_cpumask;
> +
>  #define TMIGR_NONE	0xFF
>  #define BIT_CNT		8
>  
> @@ -1449,6 +1452,7 @@ static int tmigr_clear_cpu_available(unsigned int cpu)
>  	raw_spin_lock_irq(&tmc->lock);
>  	tmc->available = false;
>  	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
> +	cpumask_clear_cpu(cpu, tmigr_available_cpumask);

This is under the tmc lock.

>  
>  	/*
>  	 * CPU has to handle the local events on his own, when on the way to
> @@ -1459,7 +1463,7 @@ static int tmigr_clear_cpu_available(unsigned int cpu)
>  	raw_spin_unlock_irq(&tmc->lock);
>  
>  	if (firstexp != KTIME_MAX) {
> -		migrator = cpumask_any_but(cpu_online_mask, cpu);
> +		migrator = cpumask_any(tmigr_available_cpumask);

But this is not.

We should make it clear what synchronizes the accesses to
tmigr_available_cpumask.

ie: we expect that either the cpu_hotplug_lock is write-held, or
it's read-held and cpuset_mutex is held.

But tmc->lock is not helpful. So the cpumask should be outside that
lock to avoid confusion.

Thanks.

>  		work_on_cpu(migrator, tmigr_trigger_active, NULL);
>  	}
>  
> @@ -1480,6 +1484,7 @@ static int tmigr_set_cpu_available(unsigned int cpu)
>  	if (!tmc->idle)
>  		__tmigr_cpu_activate(tmc);
>  	tmc->available = true;
> +	cpumask_set_cpu(cpu, tmigr_available_cpumask);
>  	raw_spin_unlock_irq(&tmc->lock);
>  	return 0;
>  }
> @@ -1801,6 +1806,11 @@ static int __init tmigr_init(void)
>  	if (ncpus == 1)
>  		return 0;
>  
> +	if (!zalloc_cpumask_var(&tmigr_available_cpumask, GFP_KERNEL)) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
>  	/*
>  	 * Calculate the required hierarchy levels. Unfortunately there is no
>  	 * reliable information available, unless all possible CPUs have been
> -- 
> 2.49.0
> 

-- 
Frederic Weisbecker
SUSE Labs
