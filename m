Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E6C49659
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731040; cv=none; b=PMzUM6qkVV8XVGU9n7JD/BvyihtW6q4PgRWjGsiTyqP/e98YE2zkgWUkgBPcnEfNwGuXoF0QFBcIXDRESjD49Tz41RhpQOXFQ3g1UjlA/T1DZiDjMQpk3ILaPikwf7hThYfAsBkGhzJ/DRuEmG1CwZkMkeVHMVe8rAR9wK0S3Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731040; c=relaxed/simple;
	bh=JFPBZ3a/qBapWQTvHl2Q61Cy/n4rx0vBYTyoRnqGTBE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=bEBzO/K/N1A/d1OvWYXEDEyL0S1CsQklBURunqSFCzF2bw5jFGr8g8bTrxgBqddNgsaWCwFK5gaCXJzP3FXXwZs7NBZQbiQ2tHfyDfVQlwjlWPCsmpAMWnWc23G+nh3fZypESpyIu9YeMmF22W8+sn3gyrZV0Lgg/6GQcgzcUps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QNDixM6S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QNDixM6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744731037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRfJKcbd5A4qpHOeV7JQbzfnNglzpSYsmQbeVdQzKJ8=;
	b=QNDixM6SsGHnFgu8qZ6HMgi07TI17JM3HdjxZeDDdOD0zqYB0wKfg0vu2G6+xXpVKF8NHB
	kbJKYJR4pqasvoHydjV1mvKpKErwIOnGw8c80vXZMVju0iPXtIRRM/xoxwiE2ejk8S3Tko
	VJV4JSav8dK6kwdS52Cpm5Zb+5nXbh0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-_BOm6ytqPVC68SWv26NfFA-1; Tue, 15 Apr 2025 11:30:35 -0400
X-MC-Unique: _BOm6ytqPVC68SWv26NfFA-1
X-Mimecast-MFC-AGG-ID: _BOm6ytqPVC68SWv26NfFA_1744731035
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e28d0cc0so924812385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731034; x=1745335834;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRfJKcbd5A4qpHOeV7JQbzfnNglzpSYsmQbeVdQzKJ8=;
        b=mu8jgmgM1t/9xwHeBDY4ws1uncCum97achHFLQ91dS8RKugD/UCysp1rSV2+48ZAad
         J09B1eZ9WMHpbjFnr0Az0cxu70xr5tMqJDQezH1u2mMnTvcZJAJugLBBweRqfkLgNXW8
         MyeQ3m48jEDSaiRxVB+JS4YJ7uGlvefn09GKvd1Y3B3xMUNOAQMukkQVf9FafsskpM1q
         iXPG/mfz0DA7bIeiTBSFFN8bBFqRp2vB6iS/VzMR3k3rC2iA5AyAsBOTWRAk/mWVRIeT
         /KxURWnnrfoX7VxOuJYNKZKQwVxaRQx5Wiy4WHOeVI6O/89QgukXcXZ7ukdmzhu++s5f
         dkDw==
X-Forwarded-Encrypted: i=1; AJvYcCX949TBhKEVCBcUtwVP6yjxmf+VOnM5c9UbnMblggL3+LZZ9dJvyVzyCbd6fY4kGUi7LSiVG/Mg63JAk1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFcOy2fNJ474ncpCtW211Q278mS1HEKl2hhRNl168siVhUpqu
	XuIYqWBsCdgZY6cREcZffudClqT44OsSjdNS0HSmBeEm5vi6jrsR66HU4s2BOVK3t78NiHC5/Rg
	5chwVFZ6Cm+3sMUQjqGPM4JX1vmpd2GV4u/1W7vPsxdeZuy4uU52wOWH7vSwCRCrDCN4c5A==
X-Gm-Gg: ASbGnctfEOStL8KuBELQvBQ7Wk8sZxPpE+edFmg6eysTRVC/y6qyzKVw3lECqktDwqq
	53sfjs7cnSfe+XJtK+1q4pPHZBgAE4/6LCVrlW7mICJxYYL4cc6Rd5MI/SXsG87m/JE2nNaGlwn
	Sm7g3A8X2Aq/+h6EcS9faf/T1iI2zSLBKPs3MXB39dNEtoFTA4EhMmI4Rn52GmkGQ+pRFA06GQ3
	t1Q5RkvL0rR1bxy3l+HPsahlvfXuLBBWhBpUh435DozdhuS4Zk6VoPRwYD2av0q+CYqQwt21gFX
	Dxvu4DoEmfW9IZ5DsTPayNoUD/rbrIhMoklkefRkOFD5Y4ukRwiFcNI3VQ==
X-Received: by 2002:a05:620a:29c8:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7c7af14aa6cmr2507694785a.48.1744731034193;
        Tue, 15 Apr 2025 08:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnJZXGgziAlsMezIomdRLwHYTHY9IJV5+CRa0YCHxSf/YXR0J5buwhz2gubVsFN/wcpIYRRA==
X-Received: by 2002:a05:620a:29c8:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7c7af14aa6cmr2507689785a.48.1744731033694;
        Tue, 15 Apr 2025 08:30:33 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0c9aesm927146885a.90.2025.04.15.08.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 08:30:33 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <6c9ee628-26d1-423e-801a-2922683d004d@redhat.com>
Date: Tue, 15 Apr 2025 11:30:31 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] timers: Exclude isolated cpus from timer migation
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250415102500.100415-5-gmonaco@redhat.com>
 <20250415102500.100415-8-gmonaco@redhat.com>
Content-Language: en-US
In-Reply-To: <20250415102500.100415-8-gmonaco@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/25 6:25 AM, Gabriele Monaco wrote:
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
>   # oslat -c 1-31,33-63,65-95,97-127 -D 62s
>   ...
>    Maximum:     1203 10 3 4 ... 5 (us)
>
> after the change:
>
>   # oslat -c 1-31,33-63,65-95,97-127 -D 62s
>   ...
>    Maximum:      10 4 3 4 3 ... 5 (us)
>
> Exclude isolated cores from the timer migration algorithm, extend the
> concept of unavailable cores, currently used for offline ones, to
> isolated ones:
> * A core is unavailable if isolated or offline;
> * A core is available if isolated and offline;
I think you mean "A core is available if NOT isolated and NOT offline". 
Right?
>
> A core is considered unavailable as idle if:
> * is in the isolcpus list
> * is in the nohz_full list
> * is in an isolated cpuset
>
> Due to how the timer migration algorithm works, any CPU part of the
> hierarchy can have their global timers pulled by remote CPUs and have to
> pull remote timers, only skipping pulling remote timers would break the
> logic.
> For this reason, we prevents isolated CPUs from pulling remote global
> timers, but also the other way around: any global timer started on an
> isolated CPU will run there. This does not break the concept of
> isolation (global timers don't come from outside the CPU) and, if
> considered inappropriate, can usually be mitigated with other isolation
> techniques (e.g. IRQ pinning).
>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>   include/linux/timer.h         |  6 ++++++
>   kernel/cgroup/cpuset.c        | 14 ++++++++------
>   kernel/time/tick-internal.h   |  1 +
>   kernel/time/timer.c           | 10 ++++++++++
>   kernel/time/timer_migration.c | 24 +++++++++++++++++++++---
>   5 files changed, 46 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/timer.h b/include/linux/timer.h
> index 10596d7c3a346..4722e075d9843 100644
> --- a/include/linux/timer.h
> +++ b/include/linux/timer.h
> @@ -190,4 +190,10 @@ int timers_dead_cpu(unsigned int cpu);
>   #define timers_dead_cpu		NULL
>   #endif
>   
> +#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
> +extern void tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask);
> +#else
> +static inline void tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
> +#endif
> +
>   #endif
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 306b604300914..866b4b8188118 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1323,7 +1323,7 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
>   	return isolcpus_updated;
>   }
>   
> -static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
> +static void update_exclusion_cpumasks(bool isolcpus_updated)
>   {
>   	int ret;
>   
> @@ -1334,6 +1334,8 @@ static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
>   
>   	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
>   	WARN_ON_ONCE(ret < 0);
> +
> +	tmigr_isolated_exclude_cpumask(isolated_cpus);
>   }
>   
>   /**
> @@ -1454,7 +1456,7 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
>   	list_add(&cs->remote_sibling, &remote_children);
>   	cpumask_copy(cs->effective_xcpus, tmp->new_cpus);
>   	spin_unlock_irq(&callback_lock);
> -	update_unbound_workqueue_cpumask(isolcpus_updated);
> +	update_exclusion_cpumasks(isolcpus_updated);
>   	cpuset_force_rebuild();
>   	cs->prs_err = 0;
>   
> @@ -1495,7 +1497,7 @@ static void remote_partition_disable(struct cpuset *cs, struct tmpmasks *tmp)
>   	compute_effective_exclusive_cpumask(cs, NULL, NULL);
>   	reset_partition_data(cs);
>   	spin_unlock_irq(&callback_lock);
> -	update_unbound_workqueue_cpumask(isolcpus_updated);
> +	update_exclusion_cpumasks(isolcpus_updated);
>   	cpuset_force_rebuild();
>   
>   	/*
> @@ -1563,7 +1565,7 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
>   	if (xcpus)
>   		cpumask_copy(cs->exclusive_cpus, xcpus);
>   	spin_unlock_irq(&callback_lock);
> -	update_unbound_workqueue_cpumask(isolcpus_updated);
> +	update_exclusion_cpumasks(isolcpus_updated);
>   	if (adding || deleting)
>   		cpuset_force_rebuild();
>   
> @@ -1906,7 +1908,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>   		WARN_ON_ONCE(parent->nr_subparts < 0);
>   	}
>   	spin_unlock_irq(&callback_lock);
> -	update_unbound_workqueue_cpumask(isolcpus_updated);
> +	update_exclusion_cpumasks(isolcpus_updated);
>   
>   	if ((old_prs != new_prs) && (cmd == partcmd_update))
>   		update_partition_exclusive_flag(cs, new_prs);
> @@ -2931,7 +2933,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
>   	else if (isolcpus_updated)
>   		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
>   	spin_unlock_irq(&callback_lock);
> -	update_unbound_workqueue_cpumask(isolcpus_updated);
> +	update_exclusion_cpumasks(isolcpus_updated);
>   
>   	/* Force update if switching back to member & update effective_xcpus */
>   	update_cpumasks_hier(cs, &tmpmask, !new_prs);
> diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
> index faac36de35b9e..75580f7c69c64 100644
> --- a/kernel/time/tick-internal.h
> +++ b/kernel/time/tick-internal.h
> @@ -167,6 +167,7 @@ extern void fetch_next_timer_interrupt_remote(unsigned long basej, u64 basem,
>   extern void timer_lock_remote_bases(unsigned int cpu);
>   extern void timer_unlock_remote_bases(unsigned int cpu);
>   extern bool timer_base_is_idle(void);
> +extern bool timer_base_remote_is_idle(unsigned int cpu);
>   extern void timer_expire_remote(unsigned int cpu);
>   # endif
>   #else /* CONFIG_NO_HZ_COMMON */
> diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> index 4d915c0a263c3..f04960091eba9 100644
> --- a/kernel/time/timer.c
> +++ b/kernel/time/timer.c
> @@ -2162,6 +2162,16 @@ bool timer_base_is_idle(void)
>   	return __this_cpu_read(timer_bases[BASE_LOCAL].is_idle);
>   }
>   
> +/**
> + * timer_base_remote_is_idle() - Return whether timer base is set idle for cpu
> + *
> + * Returns value of local timer base is_idle value for remote cpu.
> + */
> +bool timer_base_remote_is_idle(unsigned int cpu)
> +{
> +	return per_cpu(timer_bases[BASE_LOCAL].is_idle, cpu);
> +}
> +
>   static void __run_timer_base(struct timer_base *base);
>   
>   /**
> diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
> index 1fae38fbac8c2..6fe6ca798e98d 100644
> --- a/kernel/time/timer_migration.c
> +++ b/kernel/time/timer_migration.c
> @@ -10,6 +10,7 @@
>   #include <linux/spinlock.h>
>   #include <linux/timerqueue.h>
>   #include <trace/events/ipi.h>
> +#include <linux/sched/isolation.h>
>   
>   #include "timer_migration.h"
>   #include "tick-internal.h"
> @@ -1445,7 +1446,7 @@ static long tmigr_trigger_active(void *unused)
>   
>   static int tmigr_cpu_unavailable(unsigned int cpu)
>   {
> -	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
> +	struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
>   	int migrator;
>   	u64 firstexp;
>   
> @@ -1472,15 +1473,18 @@ static int tmigr_cpu_unavailable(unsigned int cpu)
>   
>   static int tmigr_cpu_available(unsigned int cpu)
>   {
> -	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
> +	struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
>   
>   	/* Check whether CPU data was successfully initialized */
>   	if (WARN_ON_ONCE(!tmc->tmgroup))
>   		return -EINVAL;
>   
> +	/* Isolated CPUs don't participate in timer migration */
> +	if (cpu_is_isolated(cpu))
> +		return 0;

There are two main sets of isolated CPUs used by cpu_is_isolated() - 
boot-time isolated CPUs via "isolcpus" and "nohz_full" boot command time 
options and runtime isolated CPUs via cpuset isolated partitions. The 
check for runtime isolated CPUs is redundant here as those CPUs won't be 
passed to tmigr_cpu_available(). So this call is effectively removing 
the boot time isolated CPUs away from the available cpumask especially 
during the boot up process. Maybe you can add some comment about this 
behavioral change.


>   	raw_spin_lock_irq(&tmc->lock);
>   	trace_tmigr_cpu_available(tmc);
> -	tmc->idle = timer_base_is_idle();
> +	tmc->idle = timer_base_remote_is_idle(cpu);
>   	if (!tmc->idle)
>   		__tmigr_cpu_activate(tmc);
>   	tmc->available = true;
> @@ -1489,6 +1493,20 @@ static int tmigr_cpu_available(unsigned int cpu)
>   	return 0;
>   }
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
> +	for_each_cpu_andnot(cpu, cpu_online_mask, exclude_cpumask)
> +		if (!cpumask_test_cpu(cpu, tmigr_available_cpumask))
> +			tmigr_cpu_available(cpu);
> +}
> +
>   static void tmigr_init_group(struct tmigr_group *group, unsigned int lvl,
>   			     int node)
>   {

So far, I haven't seen any major issue with this patch series.

Cheers,
Longman

