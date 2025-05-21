Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E33523956E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819330; cv=none; b=eQvPv/r1RGn4nZv7JBYdUstwB2x+s3t3tvyUSDBHENkzYHmM4nuZJxlFule8/i0fV58tYBWm3ecd0/mZ0yF7ypqn4rKBPAtWtZm9Em3q/jp6/DIQblJ7ki8rPluW5Tk1em5D1Qv4qClhT7XuhIqvJaKQ6dKUtJ60dbt0bnsAEZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819330; c=relaxed/simple;
	bh=ePH6QsmqVjxKNo2ofUeAHwIrCfCir/FXq1AxbtG+RWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTBbwbjcJ1HhugW2eDCLKE6JSgHYjDLD/LfBsSvB2SqiiXVacNDyZw0KryNG0Hc5h+QsEiQO3Ou8+99Kb8DynXKFgzut7gKWn8iqaakF47vDFhXpbAQiNbu7Ab3AUZBI4XuKVHZot/1egwqzWQk4WEt1WpUjoUHkI7EXhjaZH1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=G/Sh0UIp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="G/Sh0UIp"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b26f5eb16a5so4092863a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747819328; x=1748424128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sEywSFKJGCCl8hpQ5eTShZYWHHdriyTg32KOpjHUtPk=;
        b=G/Sh0UIpf1Ojteitofg3+2/RZIV8l/svxTZLi4YZhXnYEvDfObXGZYCol0t/e/Tmk2
         fo0FCI0Lx/lSJkgKtalqbQj5SyzcfcViaGBgSFOOKbUm5EIxSU1gI9ZQRD7O+kp0LuI9
         M0nKy3pz8gcV1Us2h4yiW2Q4prRVmFfhiEGQo/12eMQwq9jfM1Lu13HTPOsCl5taIPwU
         ELVvY3J74EvRTmOubfx7iEjNksoClYV5yIKJf3YNMuYOobjtBNXqO5NzGrxrNhYjBHFx
         w+/S6L6C5O5PdidIaM1MD/9Q4WNooLrVJmQeAcoXf9HUw77LftnFsWX0V2ESzd2dpiVk
         XSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819328; x=1748424128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEywSFKJGCCl8hpQ5eTShZYWHHdriyTg32KOpjHUtPk=;
        b=uHSMvItDDepTEKpT206cETHLVoRvu/rgdzenUpuCu1m5HQn+y4/L9owKgeqEhKdl71
         kJt15WpqFQKlMFPPxUoOleFgm4GML1vHLbLxiCwN9hC8STqhPZx8ZpkJ4sG/aZ/qzhcp
         /3gd02inbLa16SCNc5FmwZHhU0kslfkGhUHIvqzmXrOjJP1zaEukoi9FWK69tIhvwM6M
         xZ8pYMo0bBENsE7HyhydLgNYKw3zYp/UW2LAJluKhAdGP2r4og3VEsjh15TzdSKMV12Z
         lCWXdLxP9fHwpKybUKpfy4LCzc7cV4Jtw+yKvZeo52PzO2NO1bgQrQhj9EQSCpMYpk89
         T7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCW04PwR5DbRSJBm9C9v4SSMKLDYgxMQZgYP5wyQSQ/Nvo1MOZw23I4alWyPLgiQsjOUiT+8bfhqcAv8VB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzadkTNIYy+M3+sMMAsHSTltr9/HachIfMN4x2ejVcc252j7MIo
	d8ynjp5FHP4NCVmf+q8fihz5+oMzcHfJnzModhB4cMp3XFmNIqCuntgRN4kMnZFfSg==
X-Gm-Gg: ASbGncvHyx4KfjiZ77Ghz6OqGtZT3ckbyGBpc0P2W3eUF6BPh3U5u/UtdHLbQlJROrM
	9kPyTulHN+w1Dh1HLGJYBx1rz6bXHy1eGfMCZiDOlIN+OuZ59gbRCeYaz2a1hW18mBGXF2nbcIk
	5FNpBuZn+9NY2zsqRz/h22rqLjTMb4vKJUnHLVLlOC7pf8OsXnZItn51gsX4U+BKEKja1tAm9cT
	MpY0cZwdZhTIH4hiSvlfdlhLUFdnuU1ThDcuZ5cDHkXUKF+dtu9AVm9u7Nv+LwkkzhgOrQ+5mQt
	TWq11EH6JF+jQ3okO58dW8PjfAasV8WmVo92zd5ApVhC46bcMkUSIERE1voNhg==
X-Google-Smtp-Source: AGHT+IGyb2zDfMZvHOOce+Kx+j6rz5DulP5yEvAlC9ZaD6DlnH3q+QwLI4UNxkVHCzH83K1PQoWNRw==
X-Received: by 2002:a17:902:d4d0:b0:22e:3d2e:d94f with SMTP id d9443c01a7336-231d481919cmr317065725ad.0.1747819327541;
        Wed, 21 May 2025 02:22:07 -0700 (PDT)
Received: from bytedance ([115.190.40.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebae24sm89378555ad.197.2025.05.21.02.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:22:07 -0700 (PDT)
Date: Wed, 21 May 2025 17:21:55 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Chengming Zhou <chengming.zhou@linux.dev>
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
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [External] Re: [PATCH 2/7] sched/fair: prepare throttle path for
 task based throttle
Message-ID: <20250521092155.GA24746@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <871cf7c1-951c-4ddd-9800-db96e050c6d9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871cf7c1-951c-4ddd-9800-db96e050c6d9@linux.dev>

On Wed, May 21, 2025 at 05:01:58PM +0800, Chengming Zhou wrote:
> On 2025/5/20 18:41, Aaron Lu wrote:
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
> > when a cfs_rq is throttled, record its throttled status but do not remove
> > it from cpu's rq. Instead, for tasks that belong to this cfs_rq, when
> > they get picked, add a task work to them so that when they return
> > to user, they can be dequeued. In this way, tasks throttled will not
> > hold any kernel resources.
> > 
> > To avoid breaking bisect, preserve the current throttle behavior by
> > still dequeuing throttled hierarchy from rq and because of this, no task
> > can have that throttle task work added yet. The throttle model will
> > switch to task based in a later patch.
> > 
> > Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # tag on pick
> > Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> 
> I'm wondering how about put 02-04 patches together, since it's strange
> to setup task work in this patch but without changing throttle_cfs_rq(),

Do you mean 02-05?
Because the actual change to throttle_cfs_rq() happens in patch5 :)

> which makes the reviewing process a bit confused? WDYT?

Yes, I agree it looks a bit confused.

The point is to not break bisect while make review easier; if merging
all task based throttle related patches together, that would be to put
patch 02-05 together, which seems too big?

Thanks,
Aaron

> > ---
> >   kernel/sched/fair.c  | 88 +++++++++++++++++++++++++++++++++++++++-----
> >   kernel/sched/sched.h |  1 +
> >   2 files changed, 80 insertions(+), 9 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 75bf6186a5137..e87ceb0a2d37f 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -5825,8 +5825,47 @@ static inline int throttled_lb_pair(struct task_group *tg,
> >   	       throttled_hierarchy(dest_cfs_rq);
> >   }
> > +static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
> >   static void throttle_cfs_rq_work(struct callback_head *work)
> >   {
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
> > +		rq = scope.rq;
> > +		update_rq_clock(rq);
> > +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> > +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> > +		resched_curr(rq);
> > +	}
> > +
> > +	cond_resched_tasks_rcu_qs();
> >   }
> >   void init_cfs_throttle_work(struct task_struct *p)
> > @@ -5866,21 +5905,42 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
> >   	return 0;
> >   }
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
> >   static int tg_throttle_down(struct task_group *tg, void *data)
> >   {
> >   	struct rq *rq = data;
> >   	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
> > +	cfs_rq->throttle_count++;
> > +	if (cfs_rq->throttle_count > 1)
> > +		return 0;
> > +
> >   	/* group is entering throttled state, stop time */
> > -	if (!cfs_rq->throttle_count) {
> > -		cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
> > -		list_del_leaf_cfs_rq(cfs_rq);
> > +	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
> > +	list_del_leaf_cfs_rq(cfs_rq);
> > -		WARN_ON_ONCE(cfs_rq->throttled_clock_self);
> > -		if (cfs_rq->nr_queued)
> > -			cfs_rq->throttled_clock_self = rq_clock(rq);
> > -	}
> > -	cfs_rq->throttle_count++;
> > +	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
> > +	if (cfs_rq->nr_queued)
> > +		cfs_rq->throttled_clock_self = rq_clock(rq);
> >   	return 0;
> >   }
> > @@ -6575,6 +6635,7 @@ static void init_cfs_rq_runtime(struct cfs_rq *cfs_rq)
> >   	cfs_rq->runtime_enabled = 0;
> >   	INIT_LIST_HEAD(&cfs_rq->throttled_list);
> >   	INIT_LIST_HEAD(&cfs_rq->throttled_csd_list);
> > +	INIT_LIST_HEAD(&cfs_rq->throttled_limbo_list);
> >   }
> >   void start_cfs_bandwidth(struct cfs_bandwidth *cfs_b)
> > @@ -6744,6 +6805,7 @@ static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
> >   static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
> >   static inline void sync_throttle(struct task_group *tg, int cpu) {}
> >   static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> > +static void task_throttle_setup_work(struct task_struct *p) {}
> >   static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
> >   {
> > @@ -8851,6 +8913,7 @@ static struct task_struct *pick_task_fair(struct rq *rq)
> >   {
> >   	struct sched_entity *se;
> >   	struct cfs_rq *cfs_rq;
> > +	struct task_struct *p;
> >   again:
> >   	cfs_rq = &rq->cfs;
> > @@ -8871,7 +8934,14 @@ static struct task_struct *pick_task_fair(struct rq *rq)
> >   		cfs_rq = group_cfs_rq(se);
> >   	} while (cfs_rq);
> > -	return task_of(se);
> > +	p = task_of(se);
> > +	if (throttled_hierarchy(cfs_rq_of(se))) {
> > +		/* Shuold not happen for now */
> > +		WARN_ON_ONCE(1);
> > +		task_throttle_setup_work(p);
> > +	}
> > +
> > +	return p;
> >   }
> >   static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool first);
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index 921527327f107..83f16fc44884f 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -736,6 +736,7 @@ struct cfs_rq {
> >   	int			throttle_count;
> >   	struct list_head	throttled_list;
> >   	struct list_head	throttled_csd_list;
> > +	struct list_head        throttled_limbo_list;
> >   #endif /* CONFIG_CFS_BANDWIDTH */
> >   #endif /* CONFIG_FAIR_GROUP_SCHED */
> >   };
