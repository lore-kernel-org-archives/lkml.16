Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19981B4234
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620905; cv=none; b=hFt1QKZ9qvkoDdaKl63KygA2vAa7TYKEP1NDNcS1IK895Z2OiZkDyT1WJaMspQofWC2HQsR6PrNuvYBqdNYkBqpT/4uGBaAOnxhqaX37wURvXHrxHL98764vW2PjSkaawRYWrvCvPuPHvUbg/YaX24lPnYsV0lCZHeoaEM0+wgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620905; c=relaxed/simple;
	bh=hlmAr5kFiyxNTTyXafm6K+dcBQLzfmFToLWGsAwXuRs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o5sAL9SlqcdyubSRu8sUd+RiAKikGSIf70FBHDqsPVGbwD/PEmNyiK2ksOuObdL4XXT0KoEpALUz+L0guInbrKgzzygoaAaMn0Nv9EZWrSdrq2wC0hRQkVaI+o/c8yODnf/2kCGfAi6ys0h/V149WNKpiKoZuB3pHAjhpFBS3/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=cFLZTipO; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="cFLZTipO"
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250414085459ec797d8ac5513f33e7
        for <linux-kernel@vger.kernel.org>;
        Mon, 14 Apr 2025 10:55:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=B21npI5sDWjWqDkCGmDkUyuSzyv9/MjxJbgq4r074FQ=;
 b=cFLZTipOo7qO2WoRt8SQRWCabMA2WBBAZDW+smJdEGpQZbYUUOuYl1CKOeLXBkXtrKt1kS
 ET3iTUWGQK0uSEpi4YD4HQxGdBjNsSga46m5QY875exwg1Db7LsVZu7DAHj4G7bwXdV5GmST
 idjm14IVkPYhBRZv4aerNEtYxhryC7+iQEGh8xjTCWvjFNiWHuElrzm7/EgF/G+Jo5IqCpnG
 fxDzp3VTSNjyOZZe88AZUa2hwfQL3Az0w5ZQ7x7H+nLTlHD1ANZc4OnWkEvEoxQ8r/+5vdQg
 I7IUCb0yiXlJpFWM6XsnEQk5/LjgPIwlAN7VP8QSSRjTEkjer5SPSNlQ==;
Message-ID: <d584dfb39a391143e4b0006f5a22903899d726b3.camel@siemens.com>
Subject: Re: [RFC PATCH v2 2/7] sched/fair: Handle throttle path for task
 based throttle
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Aaron Lu <ziqianlu@bytedance.com>, Valentin Schneider
 <vschneid@redhat.com>,  Ben Segall <bsegall@google.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>, Peter Zijlstra	 <peterz@infradead.org>, Josh Don
 <joshdon@google.com>, Ingo Molnar	 <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang	 <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,  Chengming Zhou
 <chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, Jan
 Kiszka	 <jan.kiszka@siemens.com>
Date: Mon, 14 Apr 2025 10:54:59 +0200
In-Reply-To: <20250409120746.635476-3-ziqianlu@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
	 <20250409120746.635476-3-ziqianlu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
> From: Valentin Schneider <vschneid@redhat.com>
>=20
> In current throttle model, when a cfs_rq is throttled, its entity will
> be dequeued from cpu's rq, making tasks attached to it not able to run,
> thus achiveing the throttle target.
>=20
> This has a drawback though: assume a task is a reader of percpu_rwsem
> and is waiting. When it gets wakeup, it can not run till its task group's
> next period comes, which can be a relatively long time. Waiting writer
> will have to wait longer due to this and it also makes further reader
> build up and eventually trigger task hung.
>=20
> To improve this situation, change the throttle model to task based, i.e.
> when a cfs_rq is throttled, record its throttled status but do not
> remove it from cpu's rq. Instead, for tasks that belong to this cfs_rq,
> when they get picked, add a task work to them so that when they return
> to user, they can be dequeued. In this way, tasks throttled will not
> hold any kernel resources.
>=20
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> ---
>  kernel/sched/fair.c  | 185 +++++++++++++++++++++----------------------
>  kernel/sched/sched.h |   1 +
>  2 files changed, 93 insertions(+), 93 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 894202d232efd..c566a5a90d065 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5516,8 +5516,11 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched=
_entity *se, int flags)
>  	if (flags & DEQUEUE_DELAYED)
>  		finish_delayed_dequeue_entity(se);
> =20
> -	if (cfs_rq->nr_queued =3D=3D 0)
> +	if (cfs_rq->nr_queued =3D=3D 0) {
>  		update_idle_cfs_rq_clock_pelt(cfs_rq);
> +		if (throttled_hierarchy(cfs_rq))
> +			list_del_leaf_cfs_rq(cfs_rq);
> +	}
> =20
>  	return true;
>  }
> @@ -5598,7 +5601,7 @@ pick_next_entity(struct rq *rq, struct cfs_rq *cfs_=
rq)
>  	return se;
>  }
> =20
> -static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq);
> +static void check_cfs_rq_runtime(struct cfs_rq *cfs_rq);
> =20
>  static void put_prev_entity(struct cfs_rq *cfs_rq, struct sched_entity *=
prev)
>  {
> @@ -5823,8 +5826,48 @@ static inline int throttled_lb_pair(struct task_gr=
oup *tg,
>  	       throttled_hierarchy(dest_cfs_rq);
>  }
> =20
> +static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int =
flags);
>  static void throttle_cfs_rq_work(struct callback_head *work)
>  {
> +	struct task_struct *p =3D container_of(work, struct task_struct, sched_=
throttle_work);
> +	struct sched_entity *se;
> +	struct cfs_rq *cfs_rq;
> +	struct rq *rq;
> +
> +	WARN_ON_ONCE(p !=3D current);
> +	p->sched_throttle_work.next =3D &p->sched_throttle_work;
> +
> +	/*
> +	 * If task is exiting, then there won't be a return to userspace, so we
> +	 * don't have to bother with any of this.
> +	 */
> +	if ((p->flags & PF_EXITING))
> +		return;
> +
> +	scoped_guard(task_rq_lock, p) {
> +		se =3D &p->se;
> +		cfs_rq =3D cfs_rq_of(se);
> +
> +		/* Raced, forget */
> +		if (p->sched_class !=3D &fair_sched_class)
> +			return;
> +
> +		/*
> +		 * If not in limbo, then either replenish has happened or this
> +		 * task got migrated out of the throttled cfs_rq, move along.
> +		 */
> +		if (!cfs_rq->throttle_count)
> +			return;
> +
> +		rq =3D scope.rq;
> +		update_rq_clock(rq);
> +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> +		resched_curr(rq);
> +	}
> +
> +	cond_resched_tasks_rcu_qs();
>  }
> =20
>  void init_cfs_throttle_work(struct task_struct *p)
> @@ -5864,32 +5907,53 @@ static int tg_unthrottle_up(struct task_group *tg=
, void *data)
>  	return 0;
>  }
> =20
> +static inline bool task_has_throttle_work(struct task_struct *p)
> +{
> +	return p->sched_throttle_work.next !=3D &p->sched_throttle_work;
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
>  static int tg_throttle_down(struct task_group *tg, void *data)
>  {
>  	struct rq *rq =3D data;
>  	struct cfs_rq *cfs_rq =3D tg->cfs_rq[cpu_of(rq)];
> =20
> +	cfs_rq->throttle_count++;
> +	if (cfs_rq->throttle_count > 1)
> +		return 0;
> +
>  	/* group is entering throttled state, stop time */
> -	if (!cfs_rq->throttle_count) {
> -		cfs_rq->throttled_clock_pelt =3D rq_clock_pelt(rq);
> -		list_del_leaf_cfs_rq(cfs_rq);
> +	cfs_rq->throttled_clock_pelt =3D rq_clock_pelt(rq);
> =20
> -		WARN_ON_ONCE(cfs_rq->throttled_clock_self);
> -		if (cfs_rq->nr_queued)
> -			cfs_rq->throttled_clock_self =3D rq_clock(rq);
> -	}
> -	cfs_rq->throttle_count++;
> +	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
> +	if (cfs_rq->nr_queued)
> +		cfs_rq->throttled_clock_self =3D rq_clock(rq);
> +	else
> +		list_del_leaf_cfs_rq(cfs_rq);
> =20
> +	WARN_ON_ONCE(!list_empty(&cfs_rq->throttled_limbo_list));
>  	return 0;
>  }

tg_throttle_down() is touched twice in this series. Some code added
here (as part of patch 2) is later removed again in patch 7.

Maybe there is some room for improvement...

> =20
> -static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
> +static void throttle_cfs_rq(struct cfs_rq *cfs_rq)
>  {
>  	struct rq *rq =3D rq_of(cfs_rq);
>  	struct cfs_bandwidth *cfs_b =3D tg_cfs_bandwidth(cfs_rq->tg);
> -	struct sched_entity *se;
> -	long queued_delta, runnable_delta, idle_delta, dequeue =3D 1;
> -	long rq_h_nr_queued =3D rq->cfs.h_nr_queued;
> +	int dequeue =3D 1;
> =20
>  	raw_spin_lock(&cfs_b->lock);
>  	/* This will start the period timer if necessary */
> @@ -5910,74 +5974,13 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq=
)
>  	raw_spin_unlock(&cfs_b->lock);
> =20
>  	if (!dequeue)
> -		return false;  /* Throttle no longer required. */
> -
> -	se =3D cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
> +		return;  /* Throttle no longer required. */
> =20
>  	/* freeze hierarchy runnable averages while throttled */
>  	rcu_read_lock();
>  	walk_tg_tree_from(cfs_rq->tg, tg_throttle_down, tg_nop, (void *)rq);
>  	rcu_read_unlock();
> =20
> -	queued_delta =3D cfs_rq->h_nr_queued;
> -	runnable_delta =3D cfs_rq->h_nr_runnable;
> -	idle_delta =3D cfs_rq->h_nr_idle;
> -	for_each_sched_entity(se) {
> -		struct cfs_rq *qcfs_rq =3D cfs_rq_of(se);
> -		int flags;
> -
> -		/* throttled entity or throttle-on-deactivate */
> -		if (!se->on_rq)
> -			goto done;
> -
> -		/*
> -		 * Abuse SPECIAL to avoid delayed dequeue in this instance.
> -		 * This avoids teaching dequeue_entities() about throttled
> -		 * entities and keeps things relatively simple.
> -		 */
> -		flags =3D DEQUEUE_SLEEP | DEQUEUE_SPECIAL;
> -		if (se->sched_delayed)
> -			flags |=3D DEQUEUE_DELAYED;
> -		dequeue_entity(qcfs_rq, se, flags);
> -
> -		if (cfs_rq_is_idle(group_cfs_rq(se)))
> -			idle_delta =3D cfs_rq->h_nr_queued;
> -
> -		qcfs_rq->h_nr_queued -=3D queued_delta;
> -		qcfs_rq->h_nr_runnable -=3D runnable_delta;
> -		qcfs_rq->h_nr_idle -=3D idle_delta;
> -
> -		if (qcfs_rq->load.weight) {
> -			/* Avoid re-evaluating load for this entity: */
> -			se =3D parent_entity(se);
> -			break;
> -		}
> -	}
> -
> -	for_each_sched_entity(se) {
> -		struct cfs_rq *qcfs_rq =3D cfs_rq_of(se);
> -		/* throttled entity or throttle-on-deactivate */
> -		if (!se->on_rq)
> -			goto done;
> -
> -		update_load_avg(qcfs_rq, se, 0);
> -		se_update_runnable(se);
> -
> -		if (cfs_rq_is_idle(group_cfs_rq(se)))
> -			idle_delta =3D cfs_rq->h_nr_queued;
> -
> -		qcfs_rq->h_nr_queued -=3D queued_delta;
> -		qcfs_rq->h_nr_runnable -=3D runnable_delta;
> -		qcfs_rq->h_nr_idle -=3D idle_delta;
> -	}
> -
> -	/* At this point se is NULL and we are at root level*/
> -	sub_nr_running(rq, queued_delta);
> -
> -	/* Stop the fair server if throttling resulted in no runnable tasks */
> -	if (rq_h_nr_queued && !rq->cfs.h_nr_queued)
> -		dl_server_stop(&rq->fair_server);
> -done:
>  	/*
>  	 * Note: distribution will already see us throttled via the
>  	 * throttled-list.  rq->lock protects completion.
> @@ -5986,7 +5989,7 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
>  	WARN_ON_ONCE(cfs_rq->throttled_clock);
>  	if (cfs_rq->nr_queued)
>  		cfs_rq->throttled_clock =3D rq_clock(rq);
> -	return true;
> +	return;

Obsolete now, could be removed.

>  }
> =20
>  void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
> @@ -6462,22 +6465,22 @@ static void sync_throttle(struct task_group *tg, =
int cpu)
>  }
> =20
>  /* conditionally throttle active cfs_rq's from put_prev_entity() */
> -static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq)
> +static void check_cfs_rq_runtime(struct cfs_rq *cfs_rq)
>  {
>  	if (!cfs_bandwidth_used())
> -		return false;
> +		return;
> =20
>  	if (likely(!cfs_rq->runtime_enabled || cfs_rq->runtime_remaining > 0))
> -		return false;
> +		return;
> =20
>  	/*
>  	 * it's possible for a throttled entity to be forced into a running
>  	 * state (e.g. set_curr_task), in this case we're finished.
>  	 */
>  	if (cfs_rq_throttled(cfs_rq))
> -		return true;
> +		return;
> =20
> -	return throttle_cfs_rq(cfs_rq);
> +	throttle_cfs_rq(cfs_rq);
>  }
> =20
>  static enum hrtimer_restart sched_cfs_slack_timer(struct hrtimer *timer)
> @@ -6573,6 +6576,7 @@ static void init_cfs_rq_runtime(struct cfs_rq *cfs_=
rq)
>  	cfs_rq->runtime_enabled =3D 0;
>  	INIT_LIST_HEAD(&cfs_rq->throttled_list);
>  	INIT_LIST_HEAD(&cfs_rq->throttled_csd_list);
> +	INIT_LIST_HEAD(&cfs_rq->throttled_limbo_list);
>  }
> =20
>  void start_cfs_bandwidth(struct cfs_bandwidth *cfs_b)
> @@ -6738,10 +6742,11 @@ static void sched_fair_update_stop_tick(struct rq=
 *rq, struct task_struct *p)
>  #else /* CONFIG_CFS_BANDWIDTH */
> =20
>  static void account_cfs_rq_runtime(struct cfs_rq *cfs_rq, u64 delta_exec=
) {}
> -static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; =
}
> +static void check_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
>  static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
>  static inline void sync_throttle(struct task_group *tg, int cpu) {}
>  static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq)=
 {}
> +static void task_throttle_setup_work(struct task_struct *p) {}
> =20
>  static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
>  {
> @@ -7108,10 +7113,6 @@ static int dequeue_entities(struct rq *rq, struct =
sched_entity *se, int flags)
>  		if (cfs_rq_is_idle(cfs_rq))
>  			h_nr_idle =3D h_nr_queued;
> =20
> -		/* end evaluation on encountering a throttled cfs_rq */
> -		if (cfs_rq_throttled(cfs_rq))
> -			return 0;
> -
>  		/* Don't dequeue parent if it has other entities besides us */
>  		if (cfs_rq->load.weight) {
>  			slice =3D cfs_rq_min_slice(cfs_rq);
> @@ -7148,10 +7149,6 @@ static int dequeue_entities(struct rq *rq, struct =
sched_entity *se, int flags)
> =20
>  		if (cfs_rq_is_idle(cfs_rq))
>  			h_nr_idle =3D h_nr_queued;
> -
> -		/* end evaluation on encountering a throttled cfs_rq */
> -		if (cfs_rq_throttled(cfs_rq))
> -			return 0;
>  	}
> =20
>  	sub_nr_running(rq, h_nr_queued);
> @@ -8860,8 +8857,7 @@ static struct task_struct *pick_task_fair(struct rq=
 *rq)
>  		if (cfs_rq->curr && cfs_rq->curr->on_rq)
>  			update_curr(cfs_rq);
> =20
> -		if (unlikely(check_cfs_rq_runtime(cfs_rq)))
> -			goto again;
> +		check_cfs_rq_runtime(cfs_rq);
> =20
>  		se =3D pick_next_entity(rq, cfs_rq);
>  		if (!se)
> @@ -8888,6 +8884,9 @@ pick_next_task_fair(struct rq *rq, struct task_stru=
ct *prev, struct rq_flags *rf
>  		goto idle;
>  	se =3D &p->se;
> =20
> +	if (throttled_hierarchy(cfs_rq_of(se)))
> +		task_throttle_setup_work(p);
> +
>  #ifdef CONFIG_FAIR_GROUP_SCHED
>  	if (prev->sched_class !=3D &fair_sched_class)
>  		goto simple;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 921527327f107..97be6a6f53b9c 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -736,6 +736,7 @@ struct cfs_rq {
>  	int			throttle_count;
>  	struct list_head	throttled_list;
>  	struct list_head	throttled_csd_list;
> +	struct list_head	throttled_limbo_list;
>  #endif /* CONFIG_CFS_BANDWIDTH */
>  #endif /* CONFIG_FAIR_GROUP_SCHED */
>  };

