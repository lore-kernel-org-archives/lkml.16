Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896CD22A4E1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745559553; cv=none; b=WNCQn0gG7q7hr5GIRWI/M+WEVVtKcUw9pMaaaqfo8hbx1/4S+vRzfQAlRlo3waEUSXa1/WFm4zDzWgqpwTqOMqHdopWHcT6bpf3OyvE2AxRccffA5rzKp+d5C1hXWdtNds/RW4EPuY2vF8/AU39eDz5Ar9Asp2t898wZEfvFALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745559553; c=relaxed/simple;
	bh=b9UUp56fhlHYYYqBq7pOiquc0aK8VSlUBOO1CQ3XJwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D66kWwOu+cQUooDVIgZsdPke/2SDbtyyD1E3CWwhrF3K2o7vOooLvoP8svfLzci5izAALJ0lfHRN3yDt7Mi5QvpIpSKEKG8FAQxwhO2nGOlKHxuahLdq43PCe2ik2qFUsDzw87mxlFOrGw7q6QrPSn19M1hPKtO5jCYGg/dm3ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=aRU2FiQd; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="aRU2FiQd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kQn3j8oy3qQQmYRxZVRSssTGsG+xx6gciB4/Lw9xIb4=; b=aRU2FiQdm7p0kU18GfiiHDUZI+
	bhxxB5U6Y5Oni3Sb58QWI6TsWtzzwsLnJv+wJ8T/8ThI/uEwhmBTe+DFJCs8lLMbaINcJ4vlgUE6M
	MdhET5I3UeipXsZ+j9DsCF1FKXO6hfYIDWsl07Q/dA528pkWLVhW4HS0RZjY0/jauDt0WOJuueYV1
	zjHJOA4fajUTZ833hFG9m/A3Lb5FrhRPUxC92GMDcj+D7zhdMdg/bViQyrn3uiTPNClGX8NHeKEjm
	PZNhtCd42vfgT/1QYt0/QiILbyIr99QElEBdeCFNkyyfM+GlOMsQD9YN/+VQsAfjthM3jaofo1FNA
	+sl6TDfA==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u8Bm6-008AX9-C6; Fri, 25 Apr 2025 07:38:59 +0200
Message-ID: <44776ca8-f059-4655-ace4-c98330dc6074@igalia.com>
Date: Fri, 25 Apr 2025 14:38:50 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] sched_ext: Move event_stats_cpu into scx_sched
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>, linux-kernel@vger.kernel.org
References: <20250423234542.1890867-1-tj@kernel.org>
 <20250423234542.1890867-11-tj@kernel.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250423234542.1890867-11-tj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tejun,

On 4/24/25 08:44, Tejun Heo wrote:
> The event counters are going to become per scheduler instance. Move
> event_stats_cpu into scx_sched.
> 
> - [__]scx_add_event() are updated to take @sch. While at it, add missing
>    parentheses around @cnt expansions.
> 
> - scx_read_events() is updated to take @sch.
> 
> - scx_bpf_events() accesses scx_root under RCU read lock.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>   kernel/sched/ext.c | 100 ++++++++++++++++++++++++++-------------------
>   1 file changed, 58 insertions(+), 42 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 4d2866db8cbe..75c91b58430c 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -835,6 +835,13 @@ struct scx_sched {
>   	struct rhashtable	dsq_hash;
>   	struct scx_dispatch_q	**global_dsqs;
>   
> +	/*
> +	 * The event counters are in a per-CPU variable to minimize the
> +	 * accounting overhead. A system-wide view on the event counter is
> +	 * constructed when requested by scx_bpf_get_event_stat().

scx_bpf_get_event_stat() should be replaced to scx_bpf_events(). I
think, in the original code, the old function name,
scx_bpf_get_event_stat(), was creeped in by mistake.

Other than that, the other changes look straightforward and good to me.

Acked-by: Changwoo Min <changwoo@igalia.com>

Regards,
Changwoo Min


> +	 */
> +	struct scx_event_stats __percpu *event_stats_cpu;
> +
>   	bool			warned_zero_slice;
>   
>   	atomic_t		exit_kind;
> @@ -1596,34 +1603,29 @@ static struct task_struct *scx_task_iter_next_locked(struct scx_task_iter *iter)
>   	return p;
>   }
>   
> -/*
> - * The event counter is organized by a per-CPU variable to minimize the
> - * accounting overhead without synchronization. A system-wide view on the
> - * event counter is constructed when requested by scx_bpf_get_event_stat().
> - */
> -static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
> -
>   /**
>    * scx_add_event - Increase an event counter for 'name' by 'cnt'
> + * @sch: scx_sched to account events for
>    * @name: an event name defined in struct scx_event_stats
>    * @cnt: the number of the event occured
>    *
>    * This can be used when preemption is not disabled.
>    */
> -#define scx_add_event(name, cnt) do {						\
> -	this_cpu_add(event_stats_cpu.name, cnt);				\
> -	trace_sched_ext_event(#name, cnt);					\
> +#define scx_add_event(sch, name, cnt) do {					\
> +	this_cpu_add((sch)->event_stats_cpu->name, (cnt));			\
> +	trace_sched_ext_event(#name, (cnt));					\
>   } while(0)
>   
>   /**
>    * __scx_add_event - Increase an event counter for 'name' by 'cnt'
> + * @sch: scx_sched to account events for
>    * @name: an event name defined in struct scx_event_stats
>    * @cnt: the number of the event occured
>    *
>    * This should be used only when preemption is disabled.
>    */
> -#define __scx_add_event(name, cnt) do {						\
> -	__this_cpu_add(event_stats_cpu.name, cnt);				\
> +#define __scx_add_event(sch, name, cnt) do {					\
> +	__this_cpu_add((sch)->event_stats_cpu->name, (cnt));			\
>   	trace_sched_ext_event(#name, cnt);					\
>   } while(0)
>   
> @@ -1648,7 +1650,8 @@ static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
>   } while (0)
>   
>   
> -static void scx_read_events(struct scx_event_stats *events);
> +static void scx_read_events(struct scx_sched *sch,
> +			    struct scx_event_stats *events);
>   
>   static enum scx_enable_state scx_enable_state(void)
>   {
> @@ -1874,7 +1877,7 @@ static void dsq_mod_nr(struct scx_dispatch_q *dsq, s32 delta)
>   static void refill_task_slice_dfl(struct task_struct *p)
>   {
>   	p->scx.slice = SCX_SLICE_DFL;
> -	__scx_add_event(SCX_EV_REFILL_SLICE_DFL, 1);
> +	__scx_add_event(scx_root, SCX_EV_REFILL_SLICE_DFL, 1);
>   }
>   
>   static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
> @@ -2203,7 +2206,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
>   		goto local;
>   
>   	if (scx_rq_bypassing(rq)) {
> -		__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
> +		__scx_add_event(sch, SCX_EV_BYPASS_DISPATCH, 1);
>   		goto global;
>   	}
>   
> @@ -2213,14 +2216,14 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
>   	/* see %SCX_OPS_ENQ_EXITING */
>   	if (!(scx_root->ops.flags & SCX_OPS_ENQ_EXITING) &&
>   	    unlikely(p->flags & PF_EXITING)) {
> -		__scx_add_event(SCX_EV_ENQ_SKIP_EXITING, 1);
> +		__scx_add_event(sch, SCX_EV_ENQ_SKIP_EXITING, 1);
>   		goto local;
>   	}
>   
>   	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
>   	if (!(scx_root->ops.flags & SCX_OPS_ENQ_MIGRATION_DISABLED) &&
>   	    is_migration_disabled(p)) {
> -		__scx_add_event(SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
> +		__scx_add_event(sch, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
>   		goto local;
>   	}
>   
> @@ -2343,7 +2346,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
>   
>   	if ((enq_flags & SCX_ENQ_CPU_SELECTED) &&
>   	    unlikely(cpu_of(rq) != p->scx.selected_cpu))
> -		__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);
> +		__scx_add_event(scx_root, SCX_EV_SELECT_CPU_FALLBACK, 1);
>   }
>   
>   static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
> @@ -2571,7 +2574,8 @@ static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
>   
>   	if (!scx_rq_online(rq)) {
>   		if (enforce)
> -			__scx_add_event(SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
> +			__scx_add_event(scx_root,
> +					SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
>   		return false;
>   	}
>   
> @@ -3093,7 +3097,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
>   	if (prev_on_rq &&
>   	    (!(scx_root->ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
>   		rq->scx.flags |= SCX_RQ_BAL_KEEP;
> -		__scx_add_event(SCX_EV_DISPATCH_KEEP_LAST, 1);
> +		__scx_add_event(sch, SCX_EV_DISPATCH_KEEP_LAST, 1);
>   		goto has_tasks;
>   	}
>   	rq->scx.flags &= ~SCX_RQ_IN_BALANCE;
> @@ -3424,6 +3428,7 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
>   
>   static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flags)
>   {
> +	struct scx_sched *sch = scx_root;
>   	bool rq_bypass;
>   
>   	/*
> @@ -3440,7 +3445,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
>   		return prev_cpu;
>   
>   	rq_bypass = scx_rq_bypassing(task_rq(p));
> -	if (likely(SCX_HAS_OP(scx_root, select_cpu)) && !rq_bypass) {
> +	if (likely(SCX_HAS_OP(sch, select_cpu)) && !rq_bypass) {
>   		s32 cpu;
>   		struct task_struct **ddsp_taskp;
>   
> @@ -3469,7 +3474,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
>   		p->scx.selected_cpu = cpu;
>   
>   		if (rq_bypass)
> -			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
> +			__scx_add_event(sch, SCX_EV_BYPASS_DISPATCH, 1);
>   		return cpu;
>   	}
>   }
> @@ -4410,6 +4415,8 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
>   	struct scx_dispatch_q *dsq;
>   	int node;
>   
> +	free_percpu(sch->event_stats_cpu);
> +
>   	for_each_node_state(node, N_POSSIBLE)
>   		kfree(sch->global_dsqs[node]);
>   	kfree(sch->global_dsqs);
> @@ -4452,10 +4459,11 @@ SCX_ATTR(ops);
>   static ssize_t scx_attr_events_show(struct kobject *kobj,
>   				    struct kobj_attribute *ka, char *buf)
>   {
> +	struct scx_sched *sch = container_of(kobj, struct scx_sched, kobj);
>   	struct scx_event_stats events;
>   	int at = 0;
>   
> -	scx_read_events(&events);
> +	scx_read_events(sch, &events);
>   	at += scx_attr_event_show(buf, at, &events, SCX_EV_SELECT_CPU_FALLBACK);
>   	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
>   	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_KEEP_LAST);
> @@ -4588,25 +4596,29 @@ static void scx_bypass(bool bypass)
>   {
>   	static DEFINE_RAW_SPINLOCK(bypass_lock);
>   	static unsigned long bypass_timestamp;
> -
> -	int cpu;
> +	struct scx_sched *sch;
>   	unsigned long flags;
> +	int cpu;
>   
>   	raw_spin_lock_irqsave(&bypass_lock, flags);
> +	sch = rcu_dereference_bh(scx_root);
> +
>   	if (bypass) {
>   		scx_bypass_depth++;
>   		WARN_ON_ONCE(scx_bypass_depth <= 0);
>   		if (scx_bypass_depth != 1)
>   			goto unlock;
>   		bypass_timestamp = ktime_get_ns();
> -		scx_add_event(SCX_EV_BYPASS_ACTIVATE, 1);
> +		if (sch)
> +			scx_add_event(sch, SCX_EV_BYPASS_ACTIVATE, 1);
>   	} else {
>   		scx_bypass_depth--;
>   		WARN_ON_ONCE(scx_bypass_depth < 0);
>   		if (scx_bypass_depth != 0)
>   			goto unlock;
> -		scx_add_event(SCX_EV_BYPASS_DURATION,
> -			      ktime_get_ns() - bypass_timestamp);
> +		if (sch)
> +			scx_add_event(sch, SCX_EV_BYPASS_DURATION,
> +				      ktime_get_ns() - bypass_timestamp);
>   	}
>   
>   	atomic_inc(&scx_breather_depth);
> @@ -5179,7 +5191,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
>   	dump_line(&s, "Event counters");
>   	dump_line(&s, "--------------");
>   
> -	scx_read_events(&events);
> +	scx_read_events(scx_root, &events);
>   	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
>   	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
>   	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
> @@ -5287,16 +5299,22 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
>   		sch->global_dsqs[node] = dsq;
>   	}
>   
> +	sch->event_stats_cpu = alloc_percpu(struct scx_event_stats);
> +	if (!sch->event_stats_cpu)
> +		goto err_free_gdsqs;
> +
>   	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
>   	sch->ops = *ops;
>   
>   	sch->kobj.kset = scx_kset;
>   	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
>   	if (ret < 0)
> -		goto err_free_gdsqs;
> +		goto err_event_stats;
>   
>   	return sch;
>   
> +err_event_stats:
> +	free_percpu(sch->event_stats_cpu);
>   err_free_gdsqs:
>   	for_each_node_state(node, N_POSSIBLE)
>   		kfree(sch->global_dsqs[node]);
> @@ -5372,15 +5390,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
>   
>   	mutex_lock(&scx_enable_mutex);
>   
> -	/*
> -	 * Clear event counters so a new scx scheduler gets
> -	 * fresh event counter values.
> -	 */
> -	for_each_possible_cpu(cpu) {
> -		struct scx_event_stats *e = per_cpu_ptr(&event_stats_cpu, cpu);
> -		memset(e, 0, sizeof(*e));
> -	}
> -
>   	if (!scx_helper) {
>   		WRITE_ONCE(scx_helper, scx_create_rt_helper("sched_ext_helper"));
>   		if (!scx_helper) {
> @@ -7401,7 +7410,7 @@ __bpf_kfunc u64 scx_bpf_now(void)
>   	return clock;
>   }
>   
> -static void scx_read_events(struct scx_event_stats *events)
> +static void scx_read_events(struct scx_sched *sch, struct scx_event_stats *events)
>   {
>   	struct scx_event_stats *e_cpu;
>   	int cpu;
> @@ -7409,7 +7418,7 @@ static void scx_read_events(struct scx_event_stats *events)
>   	/* Aggregate per-CPU event counters into @events. */
>   	memset(events, 0, sizeof(*events));
>   	for_each_possible_cpu(cpu) {
> -		e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
> +		e_cpu = per_cpu_ptr(sch->event_stats_cpu, cpu);
>   		scx_agg_event(events, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
>   		scx_agg_event(events, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
>   		scx_agg_event(events, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
> @@ -7430,9 +7439,16 @@ static void scx_read_events(struct scx_event_stats *events)
>   __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
>   				size_t events__sz)
>   {
> +	struct scx_sched *sch;
>   	struct scx_event_stats e_sys;
>   
> -	scx_read_events(&e_sys);
> +	rcu_read_lock();
> +	sch = rcu_dereference(scx_root);
> +	if (sch)
> +		scx_read_events(sch, &e_sys);
> +	else
> +		memset(&e_sys, 0, sizeof(e_sys));
> +	rcu_read_unlock();
>   
>   	/*
>   	 * We cannot entirely trust a BPF-provided size since a BPF program

