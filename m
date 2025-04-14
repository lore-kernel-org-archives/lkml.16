Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE2629CB39
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632649; cv=none; b=cHlIvut+ZNmYE8hB0O3+g4/Xf23/qd/FfbTKEWjk3TzO+ymhfXVeAQVLf0KloxVQmZt/ZxPTc1rTllzBAxOOY7TJFS8eJLQYltfgSAbKf+MVEPwyW2RhGwS0992Ta2mt2Gt3HcS4oH0+jOai5egWxqo/Ium8MCsWJDAZFvupFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632649; c=relaxed/simple;
	bh=3jQYeiSemq48bC7JXP/vJNoTa2JyOyD+sytNbvri2MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZL6LRk/TwBJHCH/gTFZXFcFe7pjBka544qWKTcNBAHZ4P6b2wO4Zep52B0azd2z7SGovBBqD/i6ocYqj0kRuFcIf0hwLa0NDMw/CuQr5aAdUP9B9twU6rKxuq1/43i53447BENO+VrtqRBEtI3MQhtbN6vL4e+moWvhgWUyF+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MVTcjloL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MVTcjloL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-879d2e419b9so3460007a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744632646; x=1745237446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XfXsb949IpIrQcLxEAN9RM9/l4JYGx+zg6pl2WJHuWQ=;
        b=MVTcjloLtGhaydFi4i6bPCHqc1WlyBVQ95Nu4J1SPaPUejVVek/tEiNQVbyUcBPBDR
         G2PmeTNh6RQOl7KPyQwxJq2pvQlmEYAAaL8Uo+TtHi36Mr2o77Ae95l03nq9mLmstMPr
         Gl8PKOk5aQA2RD21v2ZLuq6xKtGOSv6kS6MakxMwx6QN5933ofQv26K2PfPVX4DP5Zr6
         /1fEsR63pr0BH2UzYedhzrNGFhLcXFuJToTp8EuttdWDZZVTBUr0SGliVYxKVl6msV3J
         iQT0qUIvqxLdrqRV8k+SSvLueKEkP3SZ1Xbb+fUetU4nN+ra1ltIVpVGqHd88pOee0e5
         QLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632646; x=1745237446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfXsb949IpIrQcLxEAN9RM9/l4JYGx+zg6pl2WJHuWQ=;
        b=kyPRLnTcNeJwKOpSiOE6lAwR05ic7RnlPnz2VQNhqiSpT3+ojlF04pA2wOQ9tQFvTG
         D82/IdoPJwMvMlkybl0zOcjDqkAgeEsgpC7Kdas5lpeMrajZNqWC++gOTnVI6I46wvJI
         obClIy+JgY/HG6wKt2ryjvVKcsqsDIB4gxUgZs+7a75Rkn9a6tl0jDQXt8rDn4KkoE5E
         94/G8wiCQO/Y79PHnUtH21VA2A/n2HlPbqqR8uamPRNSvO+lE4yPmcpvind8wac3PJzk
         8wASAk+TO4jZuUw2RAZAf9zRrqNbEsMc7AS+eO5FHkdOlOJZfTMgyF28lkOycoL2zLhH
         nNjw==
X-Forwarded-Encrypted: i=1; AJvYcCUu45dtx4LiCv3+aPdFrQlRqPwvujtsOfW0npPzqm2W8qx1j4B1JUoOwoUKh9BwOw9uLUO7kuvDApKWe3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEKU+vE+MIdkw1w6WDFD/aEIGszt4q6xFRVWyweqkhc2ng/OD4
	NIunnN0t7psgO/DsFMmkbxmJmN112cCH6YQOrGCV/tkM9xe12wkk/igfWgGN+A==
X-Gm-Gg: ASbGncv95DjRaM92NhLYjovTJT9oHCO+6ZizlLuDsmWmavXP8xfQY3I9N0GFXksqpvQ
	8MXxDrywBHkO10QKoVzBRTuW8VuVQg9g/yY71wWFC06JNfPZcDBU4BJSR7fbnDYbYcpqcvGKsY9
	dp+ma7KsptiYIaiT5cJ+wFi2v5HapWm0FZEWhCcW8QoJgzmHZeJrPdpaB0DlYq42oZftPQ9qKLw
	Ic6Lox8Ri9KXG9xrR5JW0ypgImtDYvYmc5tWdEf7bNfa6ztP8cPm5jt9t56WFf0gzibsp30tr6Q
	FsfuxeyP6VnbmhHlc+TNsa0B7LPwHM1u/ANbMJhZ
X-Google-Smtp-Source: AGHT+IF+V7c4qNe3MRAkG3MUBYioh6lO0/VFY5lKcOJwVlNiE+bB7K1u4g81cTaPayf0lysmMBNo2g==
X-Received: by 2002:a17:90b:3850:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-3082377bff7mr19488174a91.10.1744632645890;
        Mon, 14 Apr 2025 05:10:45 -0700 (PDT)
Received: from bytedance ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df0823aasm10863218a91.20.2025.04.14.05.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:10:45 -0700 (PDT)
Date: Mon, 14 Apr 2025 20:10:38 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC PATCH v2 2/7] sched/fair: Handle throttle path for task
 based throttle
Message-ID: <20250414121038.GD3558904@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-3-ziqianlu@bytedance.com>
 <d584dfb39a391143e4b0006f5a22903899d726b3.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d584dfb39a391143e4b0006f5a22903899d726b3.camel@siemens.com>

On Mon, Apr 14, 2025 at 10:54:59AM +0200, Florian Bezdeka wrote:
> On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
> > From: Valentin Schneider <vschneid@redhat.com>
> > 
> > In current throttle model, when a cfs_rq is throttled, its entity will
> > be dequeued from cpu's rq, making tasks attached to it not able to run,
> > thus achiveing the throttle target.
> > 
> > This has a drawback though: assume a task is a reader of percpu_rwsem
> > and is waiting. When it gets wakeup, it can not run till its task group's
> > next period comes, which can be a relatively long time. Waiting writer
> > will have to wait longer due to this and it also makes further reader
> > build up and eventually trigger task hung.
> > 
> > To improve this situation, change the throttle model to task based, i.e.
> > when a cfs_rq is throttled, record its throttled status but do not
> > remove it from cpu's rq. Instead, for tasks that belong to this cfs_rq,
> > when they get picked, add a task work to them so that when they return
> > to user, they can be dequeued. In this way, tasks throttled will not
> > hold any kernel resources.
> > 
> > Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> > ---
> >  kernel/sched/fair.c  | 185 +++++++++++++++++++++----------------------
> >  kernel/sched/sched.h |   1 +
> >  2 files changed, 93 insertions(+), 93 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 894202d232efd..c566a5a90d065 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -5516,8 +5516,11 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> >  	if (flags & DEQUEUE_DELAYED)
> >  		finish_delayed_dequeue_entity(se);
> >  
> > -	if (cfs_rq->nr_queued == 0)
> > +	if (cfs_rq->nr_queued == 0) {
> >  		update_idle_cfs_rq_clock_pelt(cfs_rq);
> > +		if (throttled_hierarchy(cfs_rq))
> > +			list_del_leaf_cfs_rq(cfs_rq);
> > +	}
> >  
> >  	return true;
> >  }
> > @@ -5598,7 +5601,7 @@ pick_next_entity(struct rq *rq, struct cfs_rq *cfs_rq)
> >  	return se;
> >  }
> >  
> > -static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq);
> > +static void check_cfs_rq_runtime(struct cfs_rq *cfs_rq);
> >  
> >  static void put_prev_entity(struct cfs_rq *cfs_rq, struct sched_entity *prev)
> >  {
> > @@ -5823,8 +5826,48 @@ static inline int throttled_lb_pair(struct task_group *tg,
> >  	       throttled_hierarchy(dest_cfs_rq);
> >  }
> >  
> > +static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
> >  static void throttle_cfs_rq_work(struct callback_head *work)
> >  {
> > +	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
> > +	struct sched_entity *se;
> > +	struct cfs_rq *cfs_rq;
> > +	struct rq *rq;
> > +
> > +	WARN_ON_ONCE(p != current);
> > +	p->sched_throttle_work.next = &p->sched_throttle_work;
> > +
> > +	/*
> > +	 * If task is exiting, then there won't be a return to userspace, so we
> > +	 * don't have to bother with any of this.
> > +	 */
> > +	if ((p->flags & PF_EXITING))
> > +		return;
> > +
> > +	scoped_guard(task_rq_lock, p) {
> > +		se = &p->se;
> > +		cfs_rq = cfs_rq_of(se);
> > +
> > +		/* Raced, forget */
> > +		if (p->sched_class != &fair_sched_class)
> > +			return;
> > +
> > +		/*
> > +		 * If not in limbo, then either replenish has happened or this
> > +		 * task got migrated out of the throttled cfs_rq, move along.
> > +		 */
> > +		if (!cfs_rq->throttle_count)
> > +			return;
> > +
> > +		rq = scope.rq;
> > +		update_rq_clock(rq);
> > +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> > +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> > +		resched_curr(rq);
> > +	}
> > +
> > +	cond_resched_tasks_rcu_qs();
> >  }
> >  
> >  void init_cfs_throttle_work(struct task_struct *p)
> > @@ -5864,32 +5907,53 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
> >  	return 0;
> >  }
> >  
> > +static inline bool task_has_throttle_work(struct task_struct *p)
> > +{
> > +	return p->sched_throttle_work.next != &p->sched_throttle_work;
> > +}
> > +
> > +static inline void task_throttle_setup_work(struct task_struct *p)
> > +{
> > +	if (task_has_throttle_work(p))
> > +		return;
> > +
> > +	/*
> > +	 * Kthreads and exiting tasks don't return to userspace, so adding the
> > +	 * work is pointless
> > +	 */
> > +	if ((p->flags & (PF_EXITING | PF_KTHREAD)))
> > +		return;
> > +
> > +	task_work_add(p, &p->sched_throttle_work, TWA_RESUME);
> > +}
> > +
> >  static int tg_throttle_down(struct task_group *tg, void *data)
> >  {
> >  	struct rq *rq = data;
> >  	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
> >  
> > +	cfs_rq->throttle_count++;
> > +	if (cfs_rq->throttle_count > 1)
> > +		return 0;
> > +
> >  	/* group is entering throttled state, stop time */
> > -	if (!cfs_rq->throttle_count) {
> > -		cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
> > -		list_del_leaf_cfs_rq(cfs_rq);
> > +	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
> >  
> > -		WARN_ON_ONCE(cfs_rq->throttled_clock_self);
> > -		if (cfs_rq->nr_queued)
> > -			cfs_rq->throttled_clock_self = rq_clock(rq);
> > -	}
> > -	cfs_rq->throttle_count++;
> > +	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
> > +	if (cfs_rq->nr_queued)
> > +		cfs_rq->throttled_clock_self = rq_clock(rq);
> > +	else
> > +		list_del_leaf_cfs_rq(cfs_rq);
> >  
> > +	WARN_ON_ONCE(!list_empty(&cfs_rq->throttled_limbo_list));
> >  	return 0;
> >  }
> 
> tg_throttle_down() is touched twice in this series. Some code added
> here (as part of patch 2) is later removed again in patch 7.
> 
> Maybe there is some room for improvement...

Yes.

So the purpose of patch7 is to show an alternative accounting of this
new per-task throttle model and since we haven't decided the proper way
to do accounting yet so I chose to separate it out. Another rationale
is, I want to keep the core of the patchset(patch2 and patch3) as simple
as possible to ease reviewing. Does this make sense? If folding them is
better, I can do that too for next version.

> >  
> > -static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
> > +static void throttle_cfs_rq(struct cfs_rq *cfs_rq)
> >  {
> >  	struct rq *rq = rq_of(cfs_rq);
> >  	struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
> > -	struct sched_entity *se;
> > -	long queued_delta, runnable_delta, idle_delta, dequeue = 1;
> > -	long rq_h_nr_queued = rq->cfs.h_nr_queued;
> > +	int dequeue = 1;
> >  
> >  	raw_spin_lock(&cfs_b->lock);
> >  	/* This will start the period timer if necessary */
> > @@ -5910,74 +5974,13 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
> >  	raw_spin_unlock(&cfs_b->lock);
> >  
> >  	if (!dequeue)
> > -		return false;  /* Throttle no longer required. */
> > -
> > -	se = cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
> > +		return;  /* Throttle no longer required. */
> >  
> >  	/* freeze hierarchy runnable averages while throttled */
> >  	rcu_read_lock();
> >  	walk_tg_tree_from(cfs_rq->tg, tg_throttle_down, tg_nop, (void *)rq);
> >  	rcu_read_unlock();
> >  
> > -	queued_delta = cfs_rq->h_nr_queued;
> > -	runnable_delta = cfs_rq->h_nr_runnable;
> > -	idle_delta = cfs_rq->h_nr_idle;
> > -	for_each_sched_entity(se) {
> > -		struct cfs_rq *qcfs_rq = cfs_rq_of(se);
> > -		int flags;
> > -
> > -		/* throttled entity or throttle-on-deactivate */
> > -		if (!se->on_rq)
> > -			goto done;
> > -
> > -		/*
> > -		 * Abuse SPECIAL to avoid delayed dequeue in this instance.
> > -		 * This avoids teaching dequeue_entities() about throttled
> > -		 * entities and keeps things relatively simple.
> > -		 */
> > -		flags = DEQUEUE_SLEEP | DEQUEUE_SPECIAL;
> > -		if (se->sched_delayed)
> > -			flags |= DEQUEUE_DELAYED;
> > -		dequeue_entity(qcfs_rq, se, flags);
> > -
> > -		if (cfs_rq_is_idle(group_cfs_rq(se)))
> > -			idle_delta = cfs_rq->h_nr_queued;
> > -
> > -		qcfs_rq->h_nr_queued -= queued_delta;
> > -		qcfs_rq->h_nr_runnable -= runnable_delta;
> > -		qcfs_rq->h_nr_idle -= idle_delta;
> > -
> > -		if (qcfs_rq->load.weight) {
> > -			/* Avoid re-evaluating load for this entity: */
> > -			se = parent_entity(se);
> > -			break;
> > -		}
> > -	}
> > -
> > -	for_each_sched_entity(se) {
> > -		struct cfs_rq *qcfs_rq = cfs_rq_of(se);
> > -		/* throttled entity or throttle-on-deactivate */
> > -		if (!se->on_rq)
> > -			goto done;
> > -
> > -		update_load_avg(qcfs_rq, se, 0);
> > -		se_update_runnable(se);
> > -
> > -		if (cfs_rq_is_idle(group_cfs_rq(se)))
> > -			idle_delta = cfs_rq->h_nr_queued;
> > -
> > -		qcfs_rq->h_nr_queued -= queued_delta;
> > -		qcfs_rq->h_nr_runnable -= runnable_delta;
> > -		qcfs_rq->h_nr_idle -= idle_delta;
> > -	}
> > -
> > -	/* At this point se is NULL and we are at root level*/
> > -	sub_nr_running(rq, queued_delta);
> > -
> > -	/* Stop the fair server if throttling resulted in no runnable tasks */
> > -	if (rq_h_nr_queued && !rq->cfs.h_nr_queued)
> > -		dl_server_stop(&rq->fair_server);
> > -done:
> >  	/*
> >  	 * Note: distribution will already see us throttled via the
> >  	 * throttled-list.  rq->lock protects completion.
> > @@ -5986,7 +5989,7 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
> >  	WARN_ON_ONCE(cfs_rq->throttled_clock);
> >  	if (cfs_rq->nr_queued)
> >  		cfs_rq->throttled_clock = rq_clock(rq);
> > -	return true;
> > +	return;
> 
> Obsolete now, could be removed.

Indeed and one less line of code :-)

Thanks,
Aaron

> >  }
> >  
> >  void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
> > @@ -6462,22 +6465,22 @@ static void sync_throttle(struct task_group *tg, int cpu)
> >  }
> >  
> >  /* conditionally throttle active cfs_rq's from put_prev_entity() */
> > -static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq)
> > +static void check_cfs_rq_runtime(struct cfs_rq *cfs_rq)
> >  {
> >  	if (!cfs_bandwidth_used())
> > -		return false;
> > +		return;
> >  
> >  	if (likely(!cfs_rq->runtime_enabled || cfs_rq->runtime_remaining > 0))
> > -		return false;
> > +		return;
> >  
> >  	/*
> >  	 * it's possible for a throttled entity to be forced into a running
> >  	 * state (e.g. set_curr_task), in this case we're finished.
> >  	 */
> >  	if (cfs_rq_throttled(cfs_rq))
> > -		return true;
> > +		return;
> >  
> > -	return throttle_cfs_rq(cfs_rq);
> > +	throttle_cfs_rq(cfs_rq);
> >  }
> >  
> >  static enum hrtimer_restart sched_cfs_slack_timer(struct hrtimer *timer)
> > @@ -6573,6 +6576,7 @@ static void init_cfs_rq_runtime(struct cfs_rq *cfs_rq)
> >  	cfs_rq->runtime_enabled = 0;
> >  	INIT_LIST_HEAD(&cfs_rq->throttled_list);
> >  	INIT_LIST_HEAD(&cfs_rq->throttled_csd_list);
> > +	INIT_LIST_HEAD(&cfs_rq->throttled_limbo_list);
> >  }
> >  
> >  void start_cfs_bandwidth(struct cfs_bandwidth *cfs_b)
> > @@ -6738,10 +6742,11 @@ static void sched_fair_update_stop_tick(struct rq *rq, struct task_struct *p)
> >  #else /* CONFIG_CFS_BANDWIDTH */
> >  
> >  static void account_cfs_rq_runtime(struct cfs_rq *cfs_rq, u64 delta_exec) {}
> > -static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
> > +static void check_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> >  static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
> >  static inline void sync_throttle(struct task_group *tg, int cpu) {}
> >  static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> > +static void task_throttle_setup_work(struct task_struct *p) {}
> >  
> >  static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
> >  {
> > @@ -7108,10 +7113,6 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
> >  		if (cfs_rq_is_idle(cfs_rq))
> >  			h_nr_idle = h_nr_queued;
> >  
> > -		/* end evaluation on encountering a throttled cfs_rq */
> > -		if (cfs_rq_throttled(cfs_rq))
> > -			return 0;
> > -
> >  		/* Don't dequeue parent if it has other entities besides us */
> >  		if (cfs_rq->load.weight) {
> >  			slice = cfs_rq_min_slice(cfs_rq);
> > @@ -7148,10 +7149,6 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
> >  
> >  		if (cfs_rq_is_idle(cfs_rq))
> >  			h_nr_idle = h_nr_queued;
> > -
> > -		/* end evaluation on encountering a throttled cfs_rq */
> > -		if (cfs_rq_throttled(cfs_rq))
> > -			return 0;
> >  	}
> >  
> >  	sub_nr_running(rq, h_nr_queued);
> > @@ -8860,8 +8857,7 @@ static struct task_struct *pick_task_fair(struct rq *rq)
> >  		if (cfs_rq->curr && cfs_rq->curr->on_rq)
> >  			update_curr(cfs_rq);
> >  
> > -		if (unlikely(check_cfs_rq_runtime(cfs_rq)))
> > -			goto again;
> > +		check_cfs_rq_runtime(cfs_rq);
> >  
> >  		se = pick_next_entity(rq, cfs_rq);
> >  		if (!se)
> > @@ -8888,6 +8884,9 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
> >  		goto idle;
> >  	se = &p->se;
> >  
> > +	if (throttled_hierarchy(cfs_rq_of(se)))
> > +		task_throttle_setup_work(p);
> > +
> >  #ifdef CONFIG_FAIR_GROUP_SCHED
> >  	if (prev->sched_class != &fair_sched_class)
> >  		goto simple;
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index 921527327f107..97be6a6f53b9c 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -736,6 +736,7 @@ struct cfs_rq {
> >  	int			throttle_count;
> >  	struct list_head	throttled_list;
> >  	struct list_head	throttled_csd_list;
> > +	struct list_head	throttled_limbo_list;
> >  #endif /* CONFIG_CFS_BANDWIDTH */
> >  #endif /* CONFIG_FAIR_GROUP_SCHED */
> >  };
> 
