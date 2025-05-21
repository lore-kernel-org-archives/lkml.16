Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1734A231852
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818135; cv=none; b=DgZE9aUuhFUAFRO9u1Nq2TFN83xxK6y1wgPfqTcNwAPGG9wXVJM80uu9VdCXFhWllI54uoFddDckx7b4GNi2IaQuBk5+BFSqUzkjbhoifEtFG+5U6HjXbUSEjmJGDbfW9CXjcDLL1n6Bj2E9j0v97SxXRGzdiMd3ISYv2HHi/4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818135; c=relaxed/simple;
	bh=bD5FcWIKnKVUtHrnv+Fs+3tBl8itWUq2MSEh+g69qok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WO5S0vT1jWCaW8kmBA+4/E5/Lcod3tJk/t80yq9M4/NBo7Hkr94SN9nhrNsGQi+xs2EkUoPf6NtWQZC6R1HBiVpB8B6wNu9C/L7XM8Dd54a6mt7cUpC04AoEpyaAxcb9RmyewZCkk4F9sWC1ugCbk0Td4HEwBELwgx0Bn0IzzDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xkE7GyNv; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xkE7GyNv"
Message-ID: <871cf7c1-951c-4ddd-9800-db96e050c6d9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747818130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=te+I280bRWIGg/4eO9vD07O3O/yvjHGTXpS5M4aIH+0=;
	b=xkE7GyNv+fqDq98Eo87zK0WVbVQd4ZRu0gme+O+R4MwjOeAxx/aBrTfg0uxFFEetc58Kwj
	bvIShnz0+yBn3sZ8j2S2XilEGqJaeOtWRAw8KjBedMRVat7Nfaqrj3FoeelbrrPoUB73Pg
	trMt4rX7ich97ly6mF+hNzFRdFYrhyI=
Date: Wed, 21 May 2025 17:01:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
To: Aaron Lu <ziqianlu@bytedance.com>,
 Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250520104110.3673059-3-ziqianlu@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/5/20 18:41, Aaron Lu wrote:
> From: Valentin Schneider <vschneid@redhat.com>
> 
> In current throttle model, when a cfs_rq is throttled, its entity will
> be dequeued from cpu's rq, making tasks attached to it not able to run,
> thus achiveing the throttle target.
> 
> This has a drawback though: assume a task is a reader of percpu_rwsem
> and is waiting. When it gets wakeup, it can not run till its task group's
> next period comes, which can be a relatively long time. Waiting writer
> will have to wait longer due to this and it also makes further reader
> build up and eventually trigger task hung.
> 
> To improve this situation, change the throttle model to task based, i.e.
> when a cfs_rq is throttled, record its throttled status but do not remove
> it from cpu's rq. Instead, for tasks that belong to this cfs_rq, when
> they get picked, add a task work to them so that when they return
> to user, they can be dequeued. In this way, tasks throttled will not
> hold any kernel resources.
> 
> To avoid breaking bisect, preserve the current throttle behavior by
> still dequeuing throttled hierarchy from rq and because of this, no task
> can have that throttle task work added yet. The throttle model will
> switch to task based in a later patch.
> 
> Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # tag on pick
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>

I'm wondering how about put 02-04 patches together, since it's strange
to setup task work in this patch but without changing throttle_cfs_rq(),
which makes the reviewing process a bit confused? WDYT?

Thanks!

> ---
>   kernel/sched/fair.c  | 88 +++++++++++++++++++++++++++++++++++++++-----
>   kernel/sched/sched.h |  1 +
>   2 files changed, 80 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 75bf6186a5137..e87ceb0a2d37f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5825,8 +5825,47 @@ static inline int throttled_lb_pair(struct task_group *tg,
>   	       throttled_hierarchy(dest_cfs_rq);
>   }
>   
> +static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
>   static void throttle_cfs_rq_work(struct callback_head *work)
>   {
> +	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
> +	struct sched_entity *se;
> +	struct cfs_rq *cfs_rq;
> +	struct rq *rq;
> +
> +	WARN_ON_ONCE(p != current);
> +	p->sched_throttle_work.next = &p->sched_throttle_work;
> +
> +	/*
> +	 * If task is exiting, then there won't be a return to userspace, so we
> +	 * don't have to bother with any of this.
> +	 */
> +	if ((p->flags & PF_EXITING))
> +		return;
> +
> +	scoped_guard(task_rq_lock, p) {
> +		se = &p->se;
> +		cfs_rq = cfs_rq_of(se);
> +
> +		/* Raced, forget */
> +		if (p->sched_class != &fair_sched_class)
> +			return;
> +
> +		/*
> +		 * If not in limbo, then either replenish has happened or this
> +		 * task got migrated out of the throttled cfs_rq, move along.
> +		 */
> +		if (!cfs_rq->throttle_count)
> +			return;
> +		rq = scope.rq;
> +		update_rq_clock(rq);
> +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> +		resched_curr(rq);
> +	}
> +
> +	cond_resched_tasks_rcu_qs();
>   }
>   
>   void init_cfs_throttle_work(struct task_struct *p)
> @@ -5866,21 +5905,42 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
>   	return 0;
>   }
>   
> +static inline bool task_has_throttle_work(struct task_struct *p)
> +{
> +	return p->sched_throttle_work.next != &p->sched_throttle_work;
> +}
> +
> +static inline void task_throttle_setup_work(struct task_struct *p)
> +{
> +	if (task_has_throttle_work(p))
> +		return;
> +
> +	/*
> +	 * Kthreads and exiting tasks don't return to userspace, so adding the
> +	 * work is pointless
> +	 */
> +	if ((p->flags & (PF_EXITING | PF_KTHREAD)))
> +		return;
> +
> +	task_work_add(p, &p->sched_throttle_work, TWA_RESUME);
> +}
> +
>   static int tg_throttle_down(struct task_group *tg, void *data)
>   {
>   	struct rq *rq = data;
>   	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
>   
> +	cfs_rq->throttle_count++;
> +	if (cfs_rq->throttle_count > 1)
> +		return 0;
> +
>   	/* group is entering throttled state, stop time */
> -	if (!cfs_rq->throttle_count) {
> -		cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
> -		list_del_leaf_cfs_rq(cfs_rq);
> +	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
> +	list_del_leaf_cfs_rq(cfs_rq);
>   
> -		WARN_ON_ONCE(cfs_rq->throttled_clock_self);
> -		if (cfs_rq->nr_queued)
> -			cfs_rq->throttled_clock_self = rq_clock(rq);
> -	}
> -	cfs_rq->throttle_count++;
> +	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
> +	if (cfs_rq->nr_queued)
> +		cfs_rq->throttled_clock_self = rq_clock(rq);
>   
>   	return 0;
>   }
> @@ -6575,6 +6635,7 @@ static void init_cfs_rq_runtime(struct cfs_rq *cfs_rq)
>   	cfs_rq->runtime_enabled = 0;
>   	INIT_LIST_HEAD(&cfs_rq->throttled_list);
>   	INIT_LIST_HEAD(&cfs_rq->throttled_csd_list);
> +	INIT_LIST_HEAD(&cfs_rq->throttled_limbo_list);
>   }
>   
>   void start_cfs_bandwidth(struct cfs_bandwidth *cfs_b)
> @@ -6744,6 +6805,7 @@ static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
>   static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
>   static inline void sync_throttle(struct task_group *tg, int cpu) {}
>   static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> +static void task_throttle_setup_work(struct task_struct *p) {}
>   
>   static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
>   {
> @@ -8851,6 +8913,7 @@ static struct task_struct *pick_task_fair(struct rq *rq)
>   {
>   	struct sched_entity *se;
>   	struct cfs_rq *cfs_rq;
> +	struct task_struct *p;
>   
>   again:
>   	cfs_rq = &rq->cfs;
> @@ -8871,7 +8934,14 @@ static struct task_struct *pick_task_fair(struct rq *rq)
>   		cfs_rq = group_cfs_rq(se);
>   	} while (cfs_rq);
>   
> -	return task_of(se);
> +	p = task_of(se);
> +	if (throttled_hierarchy(cfs_rq_of(se))) {
> +		/* Shuold not happen for now */
> +		WARN_ON_ONCE(1);
> +		task_throttle_setup_work(p);
> +	}
> +
> +	return p;
>   }
>   
>   static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool first);
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 921527327f107..83f16fc44884f 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -736,6 +736,7 @@ struct cfs_rq {
>   	int			throttle_count;
>   	struct list_head	throttled_list;
>   	struct list_head	throttled_csd_list;
> +	struct list_head        throttled_limbo_list;
>   #endif /* CONFIG_CFS_BANDWIDTH */
>   #endif /* CONFIG_FAIR_GROUP_SCHED */
>   };
