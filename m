Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46093214
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170234; cv=none; b=bGrCYcjKCvZAzWR/HzzaZMK6mkH9F7r62n6q1nqh6uTYLn2d67p3HBhku5qzp3Ffdco6fHduQeQ0uVwZoUFB8xiMjQ4pjRpvukml6kUYr2XmFGx0vLuDvxP+OGkjEuTeGxc5wvbj4cjnRDIucZLWIfwkCT39sySkbt0c8QKBFI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170234; c=relaxed/simple;
	bh=5kijZb4nYvfMUASmwIWA9jFEYd1bG9ABS9DGUErcjmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htOhZYO9s8BTx0aT3GN0KrSIe7m9o2ttvgWgy77Ko3QbzqgrCzQLLiNUm0zXjuoJxVcWNhwgy5JdWUgL0jREJs/nV/ObXukv4ios3TvfTUoemUt2sMmXfQQXEpsONAclKAgAak6s6xuDbsfBFfGKs2YBeomurj46DaGebjHzOAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=P8D3UzIa; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="P8D3UzIa"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22403c99457so4558675ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743170230; x=1743775030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPT3t7TB6g5rSXsK4tza8LBFgn2PN8y0UrqzRswNoPs=;
        b=P8D3UzIaQkhMo04DvbWrw0wdotHvtEaqXj9TU+QErOWfThZVpsU5TMo/HqJSIgxgQJ
         6OVOvWr8agBIFJ8PwSTtfoR2CK7L7R8uwbIHuCx2gJUcl2AXZ1hg8XylF3dgLmXCspfh
         LqYo+CUD4azMLtlFJB5rOopsYiQUwTO1K4dkDZjudU/Mt18L+cWAMkpRnPFeNd0M9+eq
         6VNpk9u415hmHh8BwYlbgy6OmOUEyTpSUW3fAbdEj7DAXb6f82QxCxW+7pZV2V55M10j
         N/wZHOXnj4MXvT4o89EzP2/HAnLyHqdnXSwdHxNkMXEqVuz4ahjL0Y/ABZaiy73CHOHL
         ZlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743170230; x=1743775030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPT3t7TB6g5rSXsK4tza8LBFgn2PN8y0UrqzRswNoPs=;
        b=hQwxMelwFNnNvyr7Fu+3OD/hfUiN5Ve98kh+JCvr2J/lTXJuIL8vER/RZGLgG/WHxK
         DhVt13yJgfyO3GqgLNxnU2syrQkyxiTrmNI1XjpcbWGnPCEtkeSavXfWCZcFYyUwTPoI
         Ju7g70kWGQZjiPrGrbRU3MMbxExUseSUibhJ0/AKcVP6s3GKfsUj86TQ34mh+Ev/2gcW
         FcsGmZ/VSOxrC/zO2Tsv0ptNPu4JETRUN4kcEBdjS7xtyfbeAj4XJGVIXkANQuVVRMcj
         5Q6kvOuNa6F8IvDkYTZIW4O1QTmjrgp+9RNsqJBuoduB98mk35PFQU+hjpUWG/f89FLr
         taQA==
X-Forwarded-Encrypted: i=1; AJvYcCUtAQA6No27YLVZoA09foXN4X0w2v+N87hrblRZwoxJoD0SMnYqdBQztG+FBL9zWaHeOpKCe2KpOZ/xd6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcuucfjVEXqadcaSdWXh0hlBe/uSFaRCsolAnljWs2dd5snBJV
	FAisWB/kTlaV+MUpjfBbYI05vVGhg2FxUJc3HJ/L5jOERaNHRWTXSa/fl5Pbqg4=
X-Gm-Gg: ASbGncvWqKgWJWe4YEnTbJUtv7f/RK0h3s7UVJpoZgHMiTKBK27w18Br21rIBbqswAe
	7OYkcx9ZSqIieVPXEXu+y/hfoyNu8ZNknBfK6xz0bnmyCMe0yObOQ/dHfy7AzYK5faVBMKaXcgJ
	W8QwpeXwNmvmxckjIKI4QPbVABCwYwB3bJzxyogDV583vyvXNirQfFZUQbEXjPA3RQcZQ3viwJ/
	DiApoepNKD4QYFAiGONLpwr7a295CeykwXHOwH4Gwog/tZm1uXYYfv95mCuWnV7whXyEUldkdQK
	fTefpGoZe/QbssXg+rwlGshFTULBG6hCMoVVi4YvAsqpVkD4hTTy0Km27NiJW0GNj4w=
X-Google-Smtp-Source: AGHT+IGNG/pWl3hy7b+LIeftK1+uWMI3m28kmy0ETALLxn0Y8TM2VfhC02Nw1gzCQVAWG9bt7LdN+w==
X-Received: by 2002:a05:6a00:2306:b0:736:89bd:ffb9 with SMTP id d2e1a72fcca58-73962ad7f19mr3663816b3a.0.1743170229690;
        Fri, 28 Mar 2025 06:57:09 -0700 (PDT)
Received: from [10.4.177.157] ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971091cadsm1716027b3a.126.2025.03.28.06.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 06:57:08 -0700 (PDT)
Message-ID: <93907416-dab4-4a3a-82b6-e37e4ee334db@bytedance.com>
Date: Fri, 28 Mar 2025 21:57:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
To: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org,
 gautham.shenoy@amd.com, kprateek.nayak@amd.com
Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
 yu.c.chen@intel.com, tim.c.chen@linux.intel.com, tglx@linutronix.de
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peter,

On 3/25/25 8:09 PM, Peter Zijlstra wrote:
> Hi all,
> 
> One of the many things on the eternal todo list has been finishing the
> below hackery.
> 
> It is an attempt at modelling cache affinity -- and while the patch
> really only targets LLC, it could very well be extended to also apply to
> clusters (L2). Specifically any case of multiple cache domains inside a
> node.
> 
> Anyway, I wrote this about a year ago, and I mentioned this at the
> recent OSPM conf where Gautham and Prateek expressed interest in playing
> with this code.
> 
> So here goes, very rough and largely unproven code ahead :-)
> 
> It applies to current tip/master, but I know it will fail the __percpu
> validation that sits in -next, although that shouldn't be terribly hard
> to fix up.
> 
> As is, it only computes a CPU inside the LLC that has the highest recent
> runtime, this CPU is then used in the wake-up path to steer towards this
> LLC and in task_hot() to limit migrations away from it.
> 
> More elaborate things could be done, notably there is an XXX in there
> somewhere about finding the best LLC inside a NODE (interaction with
> NUMA_BALANCING).
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>   include/linux/mm_types.h |  44 +++++++
>   include/linux/sched.h    |   4 +
>   init/Kconfig             |   4 +
>   kernel/fork.c            |   5 +
>   kernel/sched/core.c      |  13 +-
>   kernel/sched/fair.c      | 330 ++++++++++++++++++++++++++++++++++++++++++++---
>   kernel/sched/sched.h     |   8 ++
>   7 files changed, 388 insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 0234f14f2aa6..3ed8dd225eb9 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -800,6 +800,12 @@ struct mm_cid {
>   };
>   #endif
>   
> +struct mm_sched {
> +	u64 runtime;
> +	unsigned long epoch;
> +	unsigned long occ;
> +};
> +
>   struct kioctx_table;
>   struct iommu_mm_data;
>   struct mm_struct {
> @@ -890,6 +896,17 @@ struct mm_struct {
>   		 */
>   		raw_spinlock_t cpus_allowed_lock;
>   #endif
> +#ifdef CONFIG_SCHED_CACHE
> +		/*
> +		 * Track per-cpu-per-process occupancy as a proxy for cache residency.
> +		 * See account_mm_sched() and ...
> +		 */
> +		struct mm_sched __percpu *pcpu_sched;
> +		raw_spinlock_t mm_sched_lock;
> +		unsigned long mm_sched_epoch;
> +		int mm_sched_cpu;
> +#endif
> +
>   #ifdef CONFIG_MMU
>   		atomic_long_t pgtables_bytes;	/* size of all page tables */
>   #endif
> @@ -1296,6 +1313,33 @@ static inline unsigned int mm_cid_size(void)
>   static inline void mm_set_cpus_allowed(struct mm_struct *mm, const struct cpumask *cpumask) { }
>   #endif /* CONFIG_SCHED_MM_CID */
>   
> +#ifdef CONFIG_SCHED_CACHE
> +extern void mm_init_sched(struct mm_struct *mm, struct mm_sched *pcpu_sched);
> +
> +static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
> +{
> +	struct mm_sched *pcpu_sched = alloc_percpu_noprof(struct mm_sched);
> +	if (!pcpu_sched)
> +		return -ENOMEM;
> +
> +	mm_init_sched(mm, pcpu_sched);
> +	return 0;
> +}
> +
> +#define mm_alloc_sched(...)	alloc_hooks(mm_alloc_sched_noprof(__VA_ARGS__))
> +
> +static inline void mm_destroy_sched(struct mm_struct *mm)
> +{
> +	free_percpu(mm->pcpu_sched);
> +	mm->pcpu_sched = NULL;
> +}
> +#else /* !CONFIG_SCHED_CACHE */
> +
> +static inline int mm_alloc_sched(struct mm_struct *mm) { return 0; }
> +static inline void mm_destroy_sched(struct mm_struct *mm) { }
> +
> +#endif /* CONFIG_SCHED_CACHE */
> +
>   struct mmu_gather;
>   extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm);
>   extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct mm_struct *mm);
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 6e5c38718ff5..f8eafe440369 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1379,6 +1379,10 @@ struct task_struct {
>   	unsigned long			numa_pages_migrated;
>   #endif /* CONFIG_NUMA_BALANCING */
>   
> +#ifdef CONFIG_SCHED_CACHE
> +	struct callback_head		cache_work;
> +#endif

IIUC this work updates stats for the whole mm and seems not
necessary for each task of the process to repeat same thing.
Hence would be better move this work to mm_struct.

> +
>   #ifdef CONFIG_RSEQ
>   	struct rseq __user *rseq;
>   	u32 rseq_len;
> diff --git a/init/Kconfig b/init/Kconfig
> index 681f38ee68db..14b15215318f 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -950,6 +950,10 @@ config NUMA_BALANCING
>   
>   	  This system will be inactive on UMA systems.
>   
> +config SCHED_CACHE
> +	bool "Cache aware scheduler"
> +	default y
> +
>   config NUMA_BALANCING_DEFAULT_ENABLED
>   	bool "Automatically enable NUMA aware memory/task placement"
>   	default y
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 1b659b07ecd5..bc9d7dbfd980 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1314,6 +1314,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>   	if (mm_alloc_cid(mm, p))
>   		goto fail_cid;
>   
> +	if (mm_alloc_sched(mm))
> +		goto fail_sched;
> +
>   	if (percpu_counter_init_many(mm->rss_stat, 0, GFP_KERNEL_ACCOUNT,
>   				     NR_MM_COUNTERS))
>   		goto fail_pcpu;
> @@ -1323,6 +1326,8 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>   	return mm;
>   
>   fail_pcpu:
> +	mm_destroy_sched(mm);
> +fail_sched:
>   	mm_destroy_cid(mm);
>   fail_cid:
>   	destroy_context(mm);
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 87540217fc09..649db6ea41ea 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4514,6 +4514,7 @@ static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
>   	p->migration_pending = NULL;
>   #endif
>   	init_sched_mm_cid(p);
> +	init_sched_mm(p);
>   }
>   
>   DEFINE_STATIC_KEY_FALSE(sched_numa_balancing);
> @@ -8505,6 +8506,7 @@ static struct kmem_cache *task_group_cache __ro_after_init;
>   
>   void __init sched_init(void)
>   {
> +	unsigned long now = jiffies;
>   	unsigned long ptr = 0;
>   	int i;
>   
> @@ -8579,7 +8581,7 @@ void __init sched_init(void)
>   		raw_spin_lock_init(&rq->__lock);
>   		rq->nr_running = 0;
>   		rq->calc_load_active = 0;
> -		rq->calc_load_update = jiffies + LOAD_FREQ;
> +		rq->calc_load_update = now + LOAD_FREQ;
>   		init_cfs_rq(&rq->cfs);
>   		init_rt_rq(&rq->rt);
>   		init_dl_rq(&rq->dl);
> @@ -8623,7 +8625,7 @@ void __init sched_init(void)
>   		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
>   		rq->balance_callback = &balance_push_callback;
>   		rq->active_balance = 0;
> -		rq->next_balance = jiffies;
> +		rq->next_balance = now;
>   		rq->push_cpu = 0;
>   		rq->cpu = i;
>   		rq->online = 0;
> @@ -8635,7 +8637,7 @@ void __init sched_init(void)
>   
>   		rq_attach_root(rq, &def_root_domain);
>   #ifdef CONFIG_NO_HZ_COMMON
> -		rq->last_blocked_load_update_tick = jiffies;
> +		rq->last_blocked_load_update_tick = now;
>   		atomic_set(&rq->nohz_flags, 0);
>   
>   		INIT_CSD(&rq->nohz_csd, nohz_csd_func, rq);
> @@ -8660,6 +8662,11 @@ void __init sched_init(void)
>   
>   		rq->core_cookie = 0UL;
>   #endif
> +#ifdef CONFIG_SCHED_CACHE
> +		raw_spin_lock_init(&rq->cpu_epoch_lock);
> +		rq->cpu_epoch_next = now;
> +#endif
> +
>   		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
>   	}
>   
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e580..943af076e09c 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1166,10 +1166,229 @@ static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
>   	return delta_exec;
>   }
>   
> -static inline void update_curr_task(struct task_struct *p, s64 delta_exec)
> +#ifdef CONFIG_SCHED_CACHE
> +
> +/*
> + * XXX numbers come from a place the sun don't shine -- probably wants to be SD
> + * tunable or so.
> + */
> +#define EPOCH_PERIOD	(HZ/100)	/* 10 ms */
> +#define EPOCH_OLD	5		/* 50 ms */
> +
> +void mm_init_sched(struct mm_struct *mm, struct mm_sched *_pcpu_sched)
> +{
> +	unsigned long epoch;
> +	int i;
> +
> +	for_each_possible_cpu(i) {
> +		struct mm_sched *pcpu_sched = per_cpu_ptr(_pcpu_sched, i);
> +		struct rq *rq = cpu_rq(i);
> +
> +		pcpu_sched->runtime = 0;
> +		pcpu_sched->epoch = epoch = rq->cpu_epoch;
> +		pcpu_sched->occ = -1;
> +	}
> +
> +	raw_spin_lock_init(&mm->mm_sched_lock);
> +	mm->mm_sched_epoch = epoch;
> +	mm->mm_sched_cpu = -1;
> +
> +	smp_store_release(&mm->pcpu_sched, _pcpu_sched);
> +}
> +
> +/* because why would C be fully specified */
> +static __always_inline void __shr_u64(u64 *val, unsigned int n)
> +{
> +	if (n >= 64) {
> +		*val = 0;
> +		return;
> +	}
> +	*val >>= n;
> +}
> +
> +static inline void __update_mm_sched(struct rq *rq, struct mm_sched *pcpu_sched)
> +{
> +	lockdep_assert_held(&rq->cpu_epoch_lock);
> +
> +	unsigned long n, now = jiffies;
> +	long delta = now - rq->cpu_epoch_next;
> +
> +	if (delta > 0) {
> +		n = (delta + EPOCH_PERIOD - 1) / EPOCH_PERIOD;
> +		rq->cpu_epoch += n;
> +		rq->cpu_epoch_next += n * EPOCH_PERIOD;
> +		__shr_u64(&rq->cpu_runtime, n);
> +	}
> +
> +	n = rq->cpu_epoch - pcpu_sched->epoch;
> +	if (n) {
> +		pcpu_sched->epoch += n;
> +		__shr_u64(&pcpu_sched->runtime, n);
> +	}
> +}
> +
> +static unsigned long fraction_mm_sched(struct rq *rq, struct mm_sched *pcpu_sched)
> +{
> +	guard(raw_spinlock_irqsave)(&rq->cpu_epoch_lock);
> +
> +	__update_mm_sched(rq, pcpu_sched);
> +
> +	/*
> +	 * Runtime is a geometric series (r=0.5) and as such will sum to twice
> +	 * the accumulation period, this means the multiplcation here should
> +	 * not overflow.
> +	 */
> +	return div64_u64(NICE_0_LOAD * pcpu_sched->runtime, rq->cpu_runtime + 1);

Should the actual cpu capacity also be taken into consideration?

> +}
> +
> +static inline
> +void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
> +{
> +	struct mm_struct *mm = p->mm;
> +	struct mm_sched *pcpu_sched;
> +	unsigned long epoch;
> +
> +	/*
> +	 * init_task and kthreads don't be having no mm
> +	 */
> +	if (!mm || !mm->pcpu_sched)
> +		return;
> +
> +	pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
> +
> +	scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
> +		__update_mm_sched(rq, pcpu_sched);
> +		pcpu_sched->runtime += delta_exec;
> +		rq->cpu_runtime += delta_exec;
> +		epoch = rq->cpu_epoch;
> +	}
> +
> +	/*
> +	 * If this task hasn't hit task_cache_work() for a while, invalidate
> +	 * it's preferred state.
> +	 */
> +	if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD) {
> +		mm->mm_sched_cpu = -1;
> +		pcpu_sched->occ = -1;
> +	}

This seems too late. account_mm_sched() is called when p is runnable,
so if the whole process sleeps for a while before woken up, ttwu will
take the out-dated value.

> +}
> +
> +static void task_tick_cache(struct rq *rq, struct task_struct *p)
> +{
> +	struct callback_head *work = &p->cache_work;
> +	struct mm_struct *mm = p->mm;
> +
> +	if (!mm || !mm->pcpu_sched)
> +		return;
> +
> +	if (mm->mm_sched_epoch == rq->cpu_epoch)
> +		return;
> +
> +	guard(raw_spinlock)(&mm->mm_sched_lock);
> +
> +	if (mm->mm_sched_epoch == rq->cpu_epoch)
> +		return;
> +
> +	if (work->next == work) {
> +		task_work_add(p, work, TWA_RESUME);
> +		WRITE_ONCE(mm->mm_sched_epoch, rq->cpu_epoch);
> +	}
> +}
> +
> +static void task_cache_work(struct callback_head *work)
> +{
> +	struct task_struct *p = current;
> +	struct mm_struct *mm = p->mm;
> +	unsigned long m_a_occ = 0;
> +	int cpu, m_a_cpu = -1;
> +	cpumask_var_t cpus;
> +
> +	WARN_ON_ONCE(work != &p->cache_work);
> +
> +	work->next = work;
> +
> +	if (p->flags & PF_EXITING)
> +		return;
> +
> +	if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
> +		return;
> +
> +	scoped_guard (cpus_read_lock) {
> +		cpumask_copy(cpus, cpu_online_mask);
> +
> +		for_each_cpu(cpu, cpus) {
> +			/* XXX sched_cluster_active */
> +			struct sched_domain *sd = per_cpu(sd_llc, cpu);
> +			unsigned long occ, m_occ = 0, a_occ = 0;
> +			int m_cpu = -1, nr = 0, i;
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				occ = fraction_mm_sched(cpu_rq(i),
> +							per_cpu_ptr(mm->pcpu_sched, i));
> +				a_occ += occ;
> +				if (occ > m_occ) {
> +					m_occ = occ;
> +					m_cpu = i;
> +				}

It would be possible to cause task stacking on this hint cpu
due to its less frequently updated compared to wakeup.

And although the occupancy heuristic looks reasonable, IMHO it
doesn't make much sense to compare between cpus as they share
the LLC, and a non-hint cpu with warmer L1/L2$ in same LLC with
the hint cpu seems more preferred.

Do you think it's appropriate or not to only hint on the hottest
LLC? So the tasks can hopefully wokenup on 'right' LLC on the
premise that wouldn't cause much imbalance between LLCs.

I will do some tests and return with more feedback.

Thanks!
	Abel

> +				nr++;
> +				trace_printk("(%d) occ: %ld m_occ: %ld m_cpu: %d nr: %d\n",
> +					     per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
> +			}
> +
> +			a_occ /= nr;
> +			if (a_occ > m_a_occ) {
> +				m_a_occ = a_occ;
> +				m_a_cpu = m_cpu;
> +			}
> +
> +			trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
> +				     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				/* XXX threshold ? */
> +				per_cpu_ptr(mm->pcpu_sched, i)->occ = a_occ;
> +			}
> +
> +			cpumask_andnot(cpus, cpus, sched_domain_span(sd));
> +		}
> +	}
> +
> +	/*
> +	 * If the max average cache occupancy is 'small' we don't care.
> +	 */
> +	if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
> +		m_a_cpu = -1;
> +
> +	mm->mm_sched_cpu = m_a_cpu;
> +
> +	free_cpumask_var(cpus);
> +}
> +
> +void init_sched_mm(struct task_struct *p)
> +{
> +	struct callback_head *work = &p->cache_work;
> +	init_task_work(work, task_cache_work);
> +	work->next = work;
> +}
> +
> +#else
> +
> +static inline void account_mm_sched(struct rq *rq, struct task_struct *p,
> +				    s64 delta_exec) { }
> +
> +
> +void init_sched_mm(struct task_struct *p) { }
> +
> +static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
> +
> +#endif
> +
> +static inline
> +void update_curr_task(struct rq *rq, struct task_struct *p, s64 delta_exec)
>   {
>   	trace_sched_stat_runtime(p, delta_exec);
>   	account_group_exec_runtime(p, delta_exec);
> +	account_mm_sched(rq, p, delta_exec);
>   	cgroup_account_cputime(p, delta_exec);
>   }
>   
> @@ -1215,7 +1434,7 @@ s64 update_curr_common(struct rq *rq)
>   
>   	delta_exec = update_curr_se(rq, &donor->se);
>   	if (likely(delta_exec > 0))
> -		update_curr_task(donor, delta_exec);
> +		update_curr_task(rq, donor, delta_exec);
>   
>   	return delta_exec;
>   }
> @@ -1244,7 +1463,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
>   	if (entity_is_task(curr)) {
>   		struct task_struct *p = task_of(curr);
>   
> -		update_curr_task(p, delta_exec);
> +		update_curr_task(rq, p, delta_exec);
>   
>   		/*
>   		 * If the fair_server is active, we need to account for the
> @@ -7850,7 +8069,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	 * per-cpu select_rq_mask usage
>   	 */
>   	lockdep_assert_irqs_disabled();
> -
> +again:
>   	if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
>   	    asym_fits_cpu(task_util, util_min, util_max, target))
>   		return target;
> @@ -7888,7 +8107,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	/* Check a recently used CPU as a potential idle candidate: */
>   	recent_used_cpu = p->recent_used_cpu;
>   	p->recent_used_cpu = prev;
> -	if (recent_used_cpu != prev &&
> +	if (prev == p->wake_cpu &&
> +	    recent_used_cpu != prev &&
>   	    recent_used_cpu != target &&
>   	    cpus_share_cache(recent_used_cpu, target) &&
>   	    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used_cpu)) &&
> @@ -7941,6 +8161,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	if ((unsigned)i < nr_cpumask_bits)
>   		return i;
>   
> +	if (prev != p->wake_cpu && !cpus_share_cache(prev, p->wake_cpu)) {
> +		/*
> +		 * Most likely select_cache_cpu() will have re-directed
> +		 * the wakeup, but getting here means the preferred cache is
> +		 * too busy, so re-try with the actual previous.
> +		 *
> +		 * XXX wake_affine is lost for this pass.
> +		 */
> +		prev = target = p->wake_cpu;
> +		goto again;
> +	}
> +
>   	/*
>   	 * For cluster machines which have lower sharing cache like L2 or
>   	 * LLC Tag, we tend to find an idle CPU in the target's cluster
> @@ -8563,6 +8795,40 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>   	return target;
>   }
>   
> +#ifdef CONFIG_SCHED_CACHE
> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle);
> +
> +static int select_cache_cpu(struct task_struct *p, int prev_cpu)
> +{
> +	struct mm_struct *mm = p->mm;
> +	int cpu;
> +
> +	if (!mm || p->nr_cpus_allowed == 1)
> +		return prev_cpu;
> +
> +	cpu = mm->mm_sched_cpu;
> +	if (cpu < 0)
> +		return prev_cpu;
> +
> +
> +	if (static_branch_likely(&sched_numa_balancing) &&
> +	    __migrate_degrades_locality(p, prev_cpu, cpu, false) > 0) {
> +		/*
> +		 * XXX look for max occupancy inside prev_cpu's node
> +		 */
> +		return prev_cpu;
> +	}
> +
> +	return cpu;
> +}
> +#else
> +static int select_cache_cpu(struct task_struct *p, int prev_cpu)
> +{
> +	return prev_cpu;
> +}
> +#endif
> +
> +
>   /*
>    * select_task_rq_fair: Select target runqueue for the waking task in domains
>    * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> @@ -8588,6 +8854,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>   	 * required for stable ->cpus_allowed
>   	 */
>   	lockdep_assert_held(&p->pi_lock);
> +	guard(rcu)();
> +
>   	if (wake_flags & WF_TTWU) {
>   		record_wakee(p);
>   
> @@ -8595,6 +8863,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>   		    cpumask_test_cpu(cpu, p->cpus_ptr))
>   			return cpu;
>   
> +		new_cpu = prev_cpu = select_cache_cpu(p, prev_cpu);
> +
>   		if (!is_rd_overutilized(this_rq()->rd)) {
>   			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
>   			if (new_cpu >= 0)
> @@ -8605,7 +8875,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>   		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
>   	}
>   
> -	rcu_read_lock();
>   	for_each_domain(cpu, tmp) {
>   		/*
>   		 * If both 'cpu' and 'prev_cpu' are part of this domain,
> @@ -8638,7 +8907,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>   		/* Fast path */
>   		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
>   	}
> -	rcu_read_unlock();
>   
>   	return new_cpu;
>   }
> @@ -9288,6 +9556,17 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
>   	if (sysctl_sched_migration_cost == 0)
>   		return 0;
>   
> +#ifdef CONFIG_SCHED_CACHE
> +	if (p->mm && p->mm->pcpu_sched) {
> +		/*
> +		 * XXX things like Skylake have non-inclusive L3 and might not
> +		 * like this L3 centric view. What to do about L2 stickyness ?
> +		 */
> +		return per_cpu_ptr(p->mm->pcpu_sched, env->src_cpu)->occ >
> +		       per_cpu_ptr(p->mm->pcpu_sched, env->dst_cpu)->occ;
> +	}
> +#endif
> +
>   	delta = rq_clock_task(env->src_rq) - p->se.exec_start;
>   
>   	return delta < (s64)sysctl_sched_migration_cost;
> @@ -9299,27 +9578,25 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
>    * Returns 0, if task migration is not affected by locality.
>    * Returns a negative value, if task migration improves locality i.e migration preferred.
>    */
> -static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
>   {
>   	struct numa_group *numa_group = rcu_dereference(p->numa_group);
>   	unsigned long src_weight, dst_weight;
>   	int src_nid, dst_nid, dist;
>   
> -	if (!static_branch_likely(&sched_numa_balancing))
> -		return 0;
> -
> -	if (!p->numa_faults || !(env->sd->flags & SD_NUMA))
> +	if (!p->numa_faults)
>   		return 0;
>   
> -	src_nid = cpu_to_node(env->src_cpu);
> -	dst_nid = cpu_to_node(env->dst_cpu);
> +	src_nid = cpu_to_node(src_cpu);
> +	dst_nid = cpu_to_node(dst_cpu);
>   
>   	if (src_nid == dst_nid)
>   		return 0;
>   
>   	/* Migrating away from the preferred node is always bad. */
>   	if (src_nid == p->numa_preferred_nid) {
> -		if (env->src_rq->nr_running > env->src_rq->nr_preferred_running)
> +		struct rq *src_rq = cpu_rq(src_cpu);
> +		if (src_rq->nr_running > src_rq->nr_preferred_running)
>   			return 1;
>   		else
>   			return 0;
> @@ -9330,7 +9607,7 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
>   		return -1;
>   
>   	/* Leaving a core idle is often worse than degrading locality. */
> -	if (env->idle == CPU_IDLE)
> +	if (idle)
>   		return 0;
>   
>   	dist = node_distance(src_nid, dst_nid);
> @@ -9345,7 +9622,24 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
>   	return src_weight - dst_weight;
>   }
>   
> +static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
> +{
> +	if (!static_branch_likely(&sched_numa_balancing))
> +		return 0;
> +
> +	if (!(env->sd->flags & SD_NUMA))
> +		return 0;
> +
> +	return __migrate_degrades_locality(p, env->src_cpu, env->dst_cpu,
> +					   env->idle == CPU_IDLE);
> +}
> +
>   #else
> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
> +{
> +	return 0;
> +}
> +
>   static inline long migrate_degrades_locality(struct task_struct *p,
>   					     struct lb_env *env)
>   {
> @@ -13104,8 +13398,8 @@ static inline void task_tick_core(struct rq *rq, struct task_struct *curr) {}
>    */
>   static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
>   {
> -	struct cfs_rq *cfs_rq;
>   	struct sched_entity *se = &curr->se;
> +	struct cfs_rq *cfs_rq;
>   
>   	for_each_sched_entity(se) {
>   		cfs_rq = cfs_rq_of(se);
> @@ -13115,6 +13409,8 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
>   	if (static_branch_unlikely(&sched_numa_balancing))
>   		task_tick_numa(rq, curr);
>   
> +	task_tick_cache(rq, curr);
> +
>   	update_misfit_status(curr, rq);
>   	check_update_overutilized_status(task_rq(curr));
>   
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 47972f34ea70..d16ccd66ca07 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1171,6 +1171,12 @@ struct rq {
>   	u64			clock_pelt_idle_copy;
>   	u64			clock_idle_copy;
>   #endif
> +#ifdef CONFIG_SCHED_CACHE
> +	raw_spinlock_t		cpu_epoch_lock;
> +	u64			cpu_runtime;
> +	unsigned long		cpu_epoch;
> +	unsigned long		cpu_epoch_next;
> +#endif
>   
>   	atomic_t		nr_iowait;
>   
> @@ -3861,6 +3867,8 @@ static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *curr) { }
>   static inline void init_sched_mm_cid(struct task_struct *t) { }
>   #endif /* !CONFIG_SCHED_MM_CID */
>   
> +extern void init_sched_mm(struct task_struct *p);
> +
>   extern u64 avg_vruntime(struct cfs_rq *cfs_rq);
>   extern int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *se);
>   #ifdef CONFIG_SMP
> 

