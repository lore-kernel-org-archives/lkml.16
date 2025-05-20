Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4F424C063
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752229; cv=none; b=kJFd7afZPUeD9MLbAurrBdaOOB1YbJQxQngXzh2kqvA0+oQWttIsiDkoH10I8LunN2/cFq+E3Y8FH2Wv4mcRCAHnDYITFJ8tgpb2QuDv8jWeGzRF9wlNE212p64gAwu+0NFGCgmEQDUdLkJM7ZmsBmhlAc1ifWrt1vEmO6ozrb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752229; c=relaxed/simple;
	bh=poMDWomSHm/7La5v9RRwAi2yuj0/cALqWvTC9gTtnbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsecxv06YUjyeQxd5CYZq8BYXB0sOxK3AqCmu2nAznHE8TYP+2qSaN5qCv0s+tBVBb+LkpK2rWc6d5Qw+XKjqDbayO4F7QZwJLZ8tABZRP91aeuz5/k+D+cG2mWKuiczop3CC6rjRxqSHJFePgEwgNAlR84MTvU3MOde54fuyYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8wBNvwO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8wBNvwO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61D1C4CEEA;
	Tue, 20 May 2025 14:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747752229;
	bh=poMDWomSHm/7La5v9RRwAi2yuj0/cALqWvTC9gTtnbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8wBNvwOuGZj39j2XIwIyChrXokCWk83F4sh+KyvhR7RSrd6Lz+ubXMgqQRU1KuE0
	 Kn4oGZxm8QJNva46vLxQ1F9jFaYrBaPHdBThn/PJCecf8MhbnU6a2c6gsTXtDTLQtW
	 ubVLkHElNmV/4QIYv5NhXYqr5vwBpNUgze3/V/q36Rrbr2Md6mGZuIBfCBUuqPf5q5
	 laI/WvLw+K9HL/BLrTrMHpDLGz9IXHr9Y6YSImvH9sIx/6xKkMLs/WwztxW/chkSal
	 jBgfTyMNupVp6jGmPtYtO9WxoU/ZqjOxZboufsVeIQ5NwUufUJ8tCtlQHZQnV8NdOi
	 lpsPUF/sf1ceg==
Date: Tue, 20 May 2025 16:43:45 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 6/6] timers: Exclude isolated cpus from timer migation
Message-ID: <aCyVIfD-pbOlvsFy@localhost.localdomain>
References: <20250508145319.97794-8-gmonaco@redhat.com>
 <20250508145319.97794-14-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508145319.97794-14-gmonaco@redhat.com>

Le Thu, May 08, 2025 at 04:53:26PM +0200, Gabriele Monaco a écrit :
> diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
> index 25439f961ccf..fb27e929e2cf 100644
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
> @@ -1478,6 +1479,16 @@ static int tmigr_cpu_available(unsigned int cpu)
>  	if (WARN_ON_ONCE(!tmc->tmgroup))
>  		return -EINVAL;
>  
> +	/*
> +	 * Domain isolated CPUs don't participate in timer migration.
> +	 * Checking here guarantees that CPUs isolated at boot (e.g. isolcpus)
> +	 * are not marked as available when they first become online.
> +	 * During runtime, any offline isolated CPU is also not incorrectly
> +	 * marked as available once it gets back online.
> +	 */
> +	if (!housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
> +	    cpuset_cpu_is_isolated(cpu))

if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) &&
    (!housekeeping_cpu(cpu,HK_TYPE_DOMAIN) || cpuset_cpu_is_isolated(cpu)))

Because nohz_full= must be part of the hierarchy.

> +		return 0;
>  	raw_spin_lock_irq(&tmc->lock);
>  	trace_tmigr_cpu_available(tmc);
>  	tmc->idle = timer_base_is_idle();
> @@ -1489,6 +1500,38 @@ static int tmigr_cpu_available(unsigned int cpu)
>  	return 0;
>  }
>  
> +static void tmigr_remote_cpu_unavailable(void *ignored)
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
> +	cpumask_and(cpumask, cpumask, housekeeping_cpumask(HK_TYPE_TICK));

Good, but please use HK_TYPE_KERNEL_NOISE, I need to finish that rename at some
point.

Thanks.

> +	on_each_cpu_mask(cpumask, tmigr_remote_cpu_unavailable, NULL, 0);
> +
> +	cpumask_andnot(cpumask, cpu_online_mask, exclude_cpumask);
> +	cpumask_andnot(cpumask, cpumask, tmigr_available_cpumask);
> +	on_each_cpu_mask(cpumask, tmigr_remote_cpu_available, NULL, 0);
> +
> +	free_cpumask_var(cpumask);
> +	return ret;
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
