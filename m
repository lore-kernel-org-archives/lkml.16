Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B675136347
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638105; cv=none; b=Ate8ji8YXZjt6mDzPXdMD0pmL/Dlurx207+nJYvtSRgHz7qYNKg4KXyCaRUQ1IVGx7KmyfOzOL3xSN/Sc9GKxVQt5PqosyqIQbo2B+Q3l+vQAEvcUiqtwTcgGt0cqyRWwDs/3IFMQQA2FKbrbbVEWhjq0XabRm0R4dZUFEF+pJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638105; c=relaxed/simple;
	bh=hkAZTTkb02Yr058B5xW9H0NdVmjxeNDp3bYZ2t7Wnus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxRdgL2EQ5c1WSIwwD2zaw2s/BmCqix+mfzA+xOPQI+DeLG0+/B0znZyyItnWo1+d1oLg0MBhOD+ESdVUb5p/STJcbplC5+DdkejntNfzn9xtWpJQh6LP1v/JmxG+P/feY4bgN9QLFJ/Jsks6qEPdJSZxOhhUNqP7xhMdTy3QXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cH4jeheH; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cH4jeheH"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so8383955e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751638100; x=1752242900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l8xvVjbk2ls/5emFjHb8tdOrQ5itQScQPyuJL2DWz58=;
        b=cH4jeheHYbCf9yGPK4FvuiYV3nFQFKv3NMAIuUsrodM6z1NODfxt4l+S5WVuLxJmw8
         ayPVtgUqrpFTkDDRbE1m2062GxyHk1R9/BH+g4BcTaPdoGbMEmlgaMeA5UEO576i0Maq
         GJByCM5qUR4gGCUW7sB3XE47CVqOvBW4/XRQaKKqqP1WNHDL98HLTWULYH7GM9FfglHd
         ECU/QAEwA1fjGZM7A80w2M/3k+Ae9Ta/QPCi+H+Wi/mUStD0SN32EW58p3mnpuVi2y0u
         iACKMZQgvNs1en2AfnzMClJcUSrHeZbq5uaeix6PJfXVR33MQxnZQrHLW0IED/JJk5qA
         jCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638100; x=1752242900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8xvVjbk2ls/5emFjHb8tdOrQ5itQScQPyuJL2DWz58=;
        b=KGhNkGOI2v+7Gy1ytksqri+mRNPT2bJeR0kW2gq76xcx1WgqXC5cN1OgK1aOm8x+/F
         2cZJy4nUzNhsl4UVZFX2+irgDRD4bOJBXi+W0gRSmj8GucJSnq77NW5JkDxa/qtbIecr
         AaHZtBetPFcqFwvqZpWMtnK5VBQ3um91Nt0schi+PF9sTkncNLxShKyl83UVNsEpZYVA
         vmrewew2RIHjM6OaCgJaZl6H2k3IqOs5zPVd7da3TQq8QZ14bX0qRXds8lDZ8KJHDo0r
         vqMWb0r5Mi8fa8TyKUOi2nu8AEsFhUsog7jPC3FbLVzMv4f2YKi+ioKZXnEwDn8hemMh
         vtXw==
X-Forwarded-Encrypted: i=1; AJvYcCWTU6WklRPr5aQ3NsyV35KjfRTU/h4N165XtTeTucP7FS6pdMreaVDoqbPufshdsa+lf1j6manVH7+Iv9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFYwjnvu2Efd/BmzwpuP1i+c3Cmn0StNbOdb0G3d33Xfefp2dU
	HnM0/e7BVF3H/94bSUB9Sag10KKO1hhcYfW/D9Zgxuvu4p2qbB1jVVtiTUBhFIbwAAI=
X-Gm-Gg: ASbGncvnEYRir/7hHr4iv4alhDbCgoGfEqKa2ZqalRF2PFavQFJaECfOJRFPzMvrdX8
	hTmt/rSj/udrnCbMaUlGgZk4oc57YBZzDs9xOBU+PF/XtuZ17imz6pq8dPtySlixtX4w73Dx7F0
	F5g6WVPl/x7/CHIZIA4ZS6iQ2CcQJGFBwXBOg3aGCAO+LU0nDQF20hIrE622vEokXPa15zAuAcc
	n935gY4LVhvptZkK8/nDilFAM1vycZvTM7XtUQGDNMaZ817keAHrAZYRqqZgyrMAj72J4NlEyPX
	UEkS6b21Yanbt6weVfLPKUBlJ6oI/7hnvN4TOD44G59XHfXkl1pK9p5CoXmwNLSK9KLdbnqL2LM
	=
X-Google-Smtp-Source: AGHT+IFrMiw1US/lEUCjj2v3AFhGOkqNCCT7VUPsJaUfeVnCmM78JGdxwvPFH/t+OSWCtSojBiVsRQ==
X-Received: by 2002:a05:600c:8b0e:b0:450:d104:29eb with SMTP id 5b1f17b1804b1-454b4e6bc38mr21973565e9.5.1751638100331;
        Fri, 04 Jul 2025 07:08:20 -0700 (PDT)
Received: from localhost (109-81-17-167.rct.o2.cz. [109.81.17.167])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9be5bbfsm55754055e9.34.2025.07.04.07.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:08:20 -0700 (PDT)
Date: Fri, 4 Jul 2025 16:08:18 +0200
From: Michal Hocko <mhocko@suse.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "sched/numa: add statistics of numa balance task"
Message-ID: <aGfgUq9Tfn8xlcar@tiehlicka>
References: <20250704135620.685752-1-yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704135620.685752-1-yu.c.chen@intel.com>

On Fri 04-07-25 21:56:20, Chen Yu wrote:
> This reverts commit ad6b26b6a0a79166b53209df2ca1cf8636296382.
> 
> This commit introduces per-memcg/task NUMA balance statistics,
> but unfortunately it introduced a NULL pointer exception due
> to the following race condition: After a swap task candidate
> was chosen, its mm_struct pointer was set to NULL due to task
> exit. Later, when performing the actual task swapping, the
> p->mm caused the problem.
> 
> CPU0                                   CPU1
> :
> ...
> task_numa_migrate
>      task_numa_find_cpu
>       task_numa_compare
>         # a normal task p is chosen
>         env->best_task = p
> 
>                                           # p exit:
>                                           exit_signals(p);
>                                              p->flags |= PF_EXITING
>                                           exit_mm
>                                              p->mm = NULL;
> 
>       migrate_swap_stop
>         __migrate_swap_task((arg->src_task, arg->dst_cpu)
>          count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
> 
> task_lock() should be held and the PF_EXITING flag needs to
> be checked to prevent this from happening. After discussion,
> the conclusion was that adding a lock is not worthwhile for
> some statistics calculations. Revert the change and rely on
> the tracepoint for this purpose.
> 
> Fixes: ad6b26b6a0a7 ("sched/numa: add statistics of numa balance task")
> Reported-by: Jirka Hladky <jhladky@redhat.com>
> Closes: https://lore.kernel.org/all/CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com/
> Reported-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> Reported-by: Suneeth D <Suneeth.D@amd.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  Documentation/admin-guide/cgroup-v2.rst | 6 ------
>  include/linux/sched.h                   | 4 ----
>  include/linux/vm_event_item.h           | 2 --
>  kernel/sched/core.c                     | 9 ++-------
>  kernel/sched/debug.c                    | 4 ----
>  mm/memcontrol.c                         | 2 --
>  mm/vmstat.c                             | 2 --
>  7 files changed, 2 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 0cc35a14afbe..bd98ea3175ec 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1732,12 +1732,6 @@ The following nested keys are defined.
>  	  numa_hint_faults (npn)
>  		Number of NUMA hinting faults.
>  
> -	  numa_task_migrated (npn)
> -		Number of task migration by NUMA balancing.
> -
> -	  numa_task_swapped (npn)
> -		Number of task swap by NUMA balancing.
> -
>  	  pgdemote_kswapd
>  		Number of pages demoted by kswapd.
>  
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 4f78a64beb52..aa9c5be7a632 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -548,10 +548,6 @@ struct sched_statistics {
>  	u64				nr_failed_migrations_running;
>  	u64				nr_failed_migrations_hot;
>  	u64				nr_forced_migrations;
> -#ifdef CONFIG_NUMA_BALANCING
> -	u64				numa_task_migrated;
> -	u64				numa_task_swapped;
> -#endif
>  
>  	u64				nr_wakeups;
>  	u64				nr_wakeups_sync;
> diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
> index 91a3ce9a2687..9e15a088ba38 100644
> --- a/include/linux/vm_event_item.h
> +++ b/include/linux/vm_event_item.h
> @@ -66,8 +66,6 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
>  		NUMA_HINT_FAULTS,
>  		NUMA_HINT_FAULTS_LOCAL,
>  		NUMA_PAGE_MIGRATE,
> -		NUMA_TASK_MIGRATE,
> -		NUMA_TASK_SWAP,
>  #endif
>  #ifdef CONFIG_MIGRATION
>  		PGMIGRATE_SUCCESS, PGMIGRATE_FAIL,
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 8988d38d46a3..ca0be74e865b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3362,10 +3362,6 @@ void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
>  #ifdef CONFIG_NUMA_BALANCING
>  static void __migrate_swap_task(struct task_struct *p, int cpu)
>  {
> -	__schedstat_inc(p->stats.numa_task_swapped);
> -	count_vm_numa_event(NUMA_TASK_SWAP);
> -	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> -
>  	if (task_on_rq_queued(p)) {
>  		struct rq *src_rq, *dst_rq;
>  		struct rq_flags srf, drf;
> @@ -7934,9 +7930,8 @@ int migrate_task_to(struct task_struct *p, int target_cpu)
>  	if (!cpumask_test_cpu(target_cpu, p->cpus_ptr))
>  		return -EINVAL;
>  
> -	__schedstat_inc(p->stats.numa_task_migrated);
> -	count_vm_numa_event(NUMA_TASK_MIGRATE);
> -	count_memcg_event_mm(p->mm, NUMA_TASK_MIGRATE);
> +	/* TODO: This is not properly updating schedstats */
> +
>  	trace_sched_move_numa(p, curr_cpu, target_cpu);
>  	return stop_one_cpu(curr_cpu, migration_cpu_stop, &arg);
>  }
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 9d71baf08075..557246880a7e 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1210,10 +1210,6 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
>  		P_SCHEDSTAT(nr_failed_migrations_running);
>  		P_SCHEDSTAT(nr_failed_migrations_hot);
>  		P_SCHEDSTAT(nr_forced_migrations);
> -#ifdef CONFIG_NUMA_BALANCING
> -		P_SCHEDSTAT(numa_task_migrated);
> -		P_SCHEDSTAT(numa_task_swapped);
> -#endif
>  		P_SCHEDSTAT(nr_wakeups);
>  		P_SCHEDSTAT(nr_wakeups_sync);
>  		P_SCHEDSTAT(nr_wakeups_migrate);
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 902da8a9c643..70fdeda1120b 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -474,8 +474,6 @@ static const unsigned int memcg_vm_event_stat[] = {
>  	NUMA_PAGE_MIGRATE,
>  	NUMA_PTE_UPDATES,
>  	NUMA_HINT_FAULTS,
> -	NUMA_TASK_MIGRATE,
> -	NUMA_TASK_SWAP,
>  #endif
>  };
>  
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 429ae5339bfe..a78d70ddeacd 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1346,8 +1346,6 @@ const char * const vmstat_text[] = {
>  	"numa_hint_faults",
>  	"numa_hint_faults_local",
>  	"numa_pages_migrated",
> -	"numa_task_migrated",
> -	"numa_task_swapped",
>  #endif
>  #ifdef CONFIG_MIGRATION
>  	"pgmigrate_success",
> -- 
> 2.25.1
> 

-- 
Michal Hocko
SUSE Labs
