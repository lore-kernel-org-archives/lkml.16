Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA5670823
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558442; cv=none; b=DaEFQ/ofZ8WKoeo3AN5DBzgShP805D+ugWeJzHAk4mYHcMvyMqSwKwvFOdVbKOluBfqy5djYEGbEH2r20UbbgZUP/arHqEjvxAfVOlFK9knJBi/ZFxlaiUUy7R3D1zE30RTUdHk/i7hqQOccNR+WuDhJNZbPgKkGu60cVMP8L5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558442; c=relaxed/simple;
	bh=paFDT5Qr9j74Ry7Omp+6NS4Qyt4uDovPBvXaIV/vEeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pirTLnBjqDmhIdKQ3Iod8xbzct18MTyht3eQ6Osl1n1kPgH2puKQgpyWb/vwzDVDVI1Hk5Ei52XA/+/bC4BkkDYTHEGycXuV347wHQwCcNTL12bj4yjycHjAQly5MtVFh2lg80pLyNMr/2P6wjEO0pzN9ZssENKSTUW3ufVgPIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ouatgim1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ouatgim1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751558439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=THbUhAMU6671doItxBRxrHwaDWw9rs+01ji6PGfefAY=;
	b=Ouatgim1LpuOuafkORoi4g9/wpUvjIHlyRqjO6BKNeFVqEwaLUr7oONQ5rZNKCv/2HUERi
	+MLel+lI9v3Aq+QNtD6qAzJj/uORLcBObWAstxUWREvLgFsdkhR/uZHdEZT8KHUshx5mlU
	HSp0c1nvwA5IXNbbCWurQN9dSELedGQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-j-nOOWmSPLKQVzg4vRhMOA-1; Thu,
 03 Jul 2025 12:00:34 -0400
X-MC-Unique: j-nOOWmSPLKQVzg4vRhMOA-1
X-Mimecast-MFC-AGG-ID: j-nOOWmSPLKQVzg4vRhMOA_1751558433
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8FF421801216;
	Thu,  3 Jul 2025 16:00:32 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.80.203])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC9703000218;
	Thu,  3 Jul 2025 16:00:29 +0000 (UTC)
Date: Thu, 3 Jul 2025 12:00:27 -0400
From: Phil Auld <pauld@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, clm@meta.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/12] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250703160027.GC245663@pauld.westford.csb>
References: <20250702114924.091581796@infradead.org>
 <20250702121159.652969404@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702121159.652969404@infradead.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Peter,

On Wed, Jul 02, 2025 at 01:49:36PM +0200 Peter Zijlstra wrote:
> One of the more expensive things to do is take a remote runqueue lock;
> which is exactly what ttwu_runnable() ends up doing. However, in the
> case of sched_delayed tasks it is possible to queue up an IPI instead.
> 
> Reported-by: Chris Mason <clm@meta.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lkml.kernel.org/r/20250520101727.984171377@infradead.org
> ---
>  include/linux/sched.h   |    1 
>  kernel/sched/core.c     |   96 +++++++++++++++++++++++++++++++++++++++++++++---
>  kernel/sched/fair.c     |   17 ++++++++
>  kernel/sched/features.h |    1 
>  kernel/sched/sched.h    |    1 
>  5 files changed, 110 insertions(+), 6 deletions(-)
> 
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -984,6 +984,7 @@ struct task_struct {
>  	 * ->sched_remote_wakeup gets used, so it can be in this word.
>  	 */
>  	unsigned			sched_remote_wakeup:1;
> +	unsigned			sched_remote_delayed:1;
>  #ifdef CONFIG_RT_MUTEXES
>  	unsigned			sched_rt_mutex:1;
>  #endif
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -675,7 +675,12 @@ struct rq *__task_rq_lock(struct task_st
>  {
>  	struct rq *rq;
>  
> -	lockdep_assert_held(&p->pi_lock);
> +	/*
> +	 * TASK_WAKING is used to serialize the remote end of wakeup, rather
> +	 * than p->pi_lock.
> +	 */
> +	lockdep_assert(p->__state == TASK_WAKING ||
> +		       lockdep_is_held(&p->pi_lock) != LOCK_STATE_NOT_HELD);
>  
>  	for (;;) {
>  		rq = task_rq(p);
> @@ -3727,6 +3732,8 @@ ttwu_do_activate(struct rq *rq, struct t
>  	}
>  }
>  
> +static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags);
> +
>  /*
>   * Consider @p being inside a wait loop:
>   *
> @@ -3754,6 +3761,35 @@ ttwu_do_activate(struct rq *rq, struct t
>   */
>  static int ttwu_runnable(struct task_struct *p, int wake_flags)
>  {
> +	if (sched_feat(TTWU_QUEUE_DELAYED) && READ_ONCE(p->se.sched_delayed)) {
> +		/*
> +		 * Similar to try_to_block_task():
> +		 *
> +		 * __schedule()				ttwu()
> +		 *   prev_state = prev->state		  if (p->sched_delayed)
> +		 *   if (prev_state)			     smp_acquire__after_ctrl_dep()
> +		 *     try_to_block_task()		     p->state = TASK_WAKING
> +		 *       ... set_delayed()
> +		 *         RELEASE p->sched_delayed = 1
> +		 *
> +		 * __schedule() and ttwu() have matching control dependencies.
> +		 *
> +		 * Notably, once we observe sched_delayed we know the task has
> +		 * passed try_to_block_task() and p->state is ours to modify.
> +		 *
> +		 * TASK_WAKING controls ttwu() concurrency.
> +		 */
> +		smp_acquire__after_ctrl_dep();
> +		WRITE_ONCE(p->__state, TASK_WAKING);
> +		/*
> +		 * Bit of a hack, see select_task_rq_fair()'s WF_DELAYED case.
> +		 */
> +		p->wake_cpu = smp_processor_id();
> +
> +		if (ttwu_queue_wakelist(p, task_cpu(p), wake_flags | WF_DELAYED))
> +			return 1;
> +	}
> +
>  	CLASS(__task_rq_lock, guard)(p);
>  	struct rq *rq = guard.rq;
>  
> @@ -3776,6 +3812,8 @@ static int ttwu_runnable(struct task_str
>  	return 1;
>  }
>  
> +static void __ttwu_queue_wakelist(struct task_struct *p, int cpu);
> +
>  static inline bool ttwu_do_migrate(struct rq *rq, struct task_struct *p, int cpu)
>  {
>  	struct rq *p_rq = rq ? : task_rq(p);
> @@ -3801,6 +3839,52 @@ static inline bool ttwu_do_migrate(struc
>  	return true;
>  }
>  
> +static int ttwu_delayed(struct rq *rq, struct task_struct *p, int wake_flags,
> +			struct rq_flags *rf)
> +{
> +	struct rq *p_rq = task_rq(p);
> +	int cpu;
> +
> +	/*
> +	 * Notably it is possible for on-rq entities to get migrated -- even
> +	 * sched_delayed ones. This should be rare though, so flip the locks
> +	 * rather than IPI chase after it.
> +	 */
> +	if (unlikely(rq != p_rq)) {
> +		rq_unlock(rq, rf);
> +		p_rq = __task_rq_lock(p, rf);
> +		update_rq_clock(p_rq);
> +	}
> +
> +	if (task_on_rq_queued(p))
> +		dequeue_task(p_rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP | DEQUEUE_DELAYED);
> +
> +	/*
> +	 * NOTE: unlike the regular try_to_wake_up() path, this runs both
> +	 * select_task_rq() and ttwu_do_migrate() while holding rq->lock
> +	 * rather than p->pi_lock.
> +	 */
> +	cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
> +	if (ttwu_do_migrate(rq, p, cpu))
> +

This doesn't compile because ttwu_do_migrate() doesn't take a *rq.

It's easy enough to fix up and I'll try to have our perf team try these
out. 

Thanks,
Phil



		wake_flags |= WF_MIGRATED;
> +
> +	if (unlikely(rq != p_rq)) {
> +		__task_rq_unlock(p_rq, rf);
> +		rq_lock(rq, rf);
> +	}
> +
> +	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
> +	p->sched_remote_delayed = 0;
> +
> +	/* it wants to run here */
> +	if (cpu_of(rq) == cpu)
> +		return 0;
> +
> +	/* shoot it to the CPU it wants to run on */
> +	__ttwu_queue_wakelist(p, cpu);
> +	return 1;
> +}
> +
>  void sched_ttwu_pending(void *arg)
>  {
>  	struct llist_node *llist = arg;
> @@ -3819,12 +3903,13 @@ void sched_ttwu_pending(void *arg)
>  		if (WARN_ON_ONCE(p->on_cpu))
>  			smp_cond_load_acquire(&p->on_cpu, !VAL);
>  
> -		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
> -			set_task_cpu(p, cpu_of(rq));
> -
>  		if (p->sched_remote_wakeup)
>  			wake_flags |= WF_MIGRATED;
>  
> +		if (p->sched_remote_delayed &&
> +		    ttwu_delayed(rq, p, wake_flags | WF_DELAYED, &guard.rf))
> +			continue;
> +
>  		ttwu_do_activate(rq, p, wake_flags, &guard.rf);
>  	}
>  
> @@ -3964,12 +4049,13 @@ static inline bool ttwu_queue_cond(struc
>  
>  static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
>  {
> -	bool def = sched_feat(TTWU_QUEUE_DEFAULT);
> +	bool def = sched_feat(TTWU_QUEUE_DEFAULT) || (wake_flags & WF_DELAYED);
>  
>  	if (!ttwu_queue_cond(p, cpu, def))
>  		return false;
>  
>  	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
> +	p->sched_remote_delayed = !!(wake_flags & WF_DELAYED);
>  
>  	__ttwu_queue_wakelist(p, cpu);
>  	return true;
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5327,7 +5327,10 @@ static __always_inline void return_cfs_r
>  
>  static void set_delayed(struct sched_entity *se)
>  {
> -	se->sched_delayed = 1;
> +	/*
> +	 * See TTWU_QUEUE_DELAYED in ttwu_runnable().
> +	 */
> +	smp_store_release(&se->sched_delayed, 1);
>  
>  	/*
>  	 * Delayed se of cfs_rq have no tasks queued on them.
> @@ -8481,6 +8484,18 @@ select_task_rq_fair(struct task_struct *
>  	/* SD_flags and WF_flags share the first nibble */
>  	int sd_flag = wake_flags & 0xF;
>  
> +	if (wake_flags & WF_DELAYED) {
> +		/*
> +		 * This is the ttwu_delayed() case; where prev_cpu is in fact
> +		 * the CPU that did the wakeup, while @p is running on the
> +		 * current CPU.
> +		 *
> +		 * Make sure to flip them the right way around, otherwise
> +		 * wake-affine is going to do the wrong thing.
> +		 */
> +		swap(cpu, new_cpu);
> +	}
> +
>  	/*
>  	 * required for stable ->cpus_allowed
>  	 */
> --- a/kernel/sched/features.h
> +++ b/kernel/sched/features.h
> @@ -82,6 +82,7 @@ SCHED_FEAT(TTWU_QUEUE, false)
>  SCHED_FEAT(TTWU_QUEUE, true)
>  #endif
>  SCHED_FEAT(TTWU_QUEUE_ON_CPU, true)
> +SCHED_FEAT(TTWU_QUEUE_DELAYED, true)
>  SCHED_FEAT(TTWU_QUEUE_DEFAULT, false)
>  
>  /*
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2280,6 +2280,7 @@ static inline int task_on_rq_migrating(s
>  #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
>  
>  #define WF_ON_CPU		0x0100
> +#define WF_DELAYED		0x0200
>  
>  static_assert(WF_EXEC == SD_BALANCE_EXEC);
>  static_assert(WF_FORK == SD_BALANCE_FORK);
> 
> 
> 

-- 

