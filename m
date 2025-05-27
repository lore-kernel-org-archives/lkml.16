Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FDC20966B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329145; cv=none; b=gYcMTM13h5MoTJlisuP2LeC9+73YLg6lUlp0GmUmMzkv+XQeWuSGBAGUOBen36wbS2Q3tkCNrPdbOJCGsVUr2ASUCZjnYZ/tbRnVKmQ13/rc+x7Sex3WqOCSupPI7yD6AHG2mknmcnShtPxOuxc3THFDlH3O+Cn6S8xifBBNZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329145; c=relaxed/simple;
	bh=TG2UG/8Y56kbRFHut+BeBBw5r1xgJUqgI2TtDdP7MmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgT8xqBDtpTAE5OsWAVaOcWWDmo3+an8TeK+41n7e06X4iAYAtOWvuIRwBYZiPsNYVJwDcbLRX/4v7lqn3KisbbPjAYcP6W8l/TieQ7l7NxfLuRbwN4ghF+dt5JIalHVOBW3fmb9KgNPa5DEwu4BvuJorKRQgllM+VP/PlYFgrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RfYQnyHf; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RfYQnyHf"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso2165685b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 23:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748329143; x=1748933943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu3dCdXct3vjt+v7d/QmCGTkD+5eHZIKEtHki9N2O+E=;
        b=RfYQnyHfM9YM364+1XcPKkXp1EZVCrAyvKe97rTXHJvA1nt4c+NMUd1PhbbtXTA9hm
         3NhEpLg6cgHuTUxKrl/Q7w89yjbrb2X9V0ilj6tqQniMd0665U37tY8yuieUbuVrtZP6
         zO4EerRzZuJWDxfdrEUP8XtR/w+oc5cB5fXWDusf7Byprb0crjE4aXjCGKUUPno+G6dv
         SEhSLzORWIbPRO/Rbze8lOBbOIL17Cv4PmOjcev+OaWaZTVVYN6quiMQ+nW1InCiDDeU
         MWq6J/jhBUER2nWPJezH4Z/YtdgBU7BAbaM2ziqbxl0UdEPY5FiMdtxOzBctbj7Hk8yq
         b4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329143; x=1748933943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu3dCdXct3vjt+v7d/QmCGTkD+5eHZIKEtHki9N2O+E=;
        b=oXKfhSOmupLpwAld92D/MB3gE4wT3J+GWHJqx6QOpJOta4h6jrjWyGnZNxqCTkEzWh
         i2FV4Z2SK8oc5OM+QX42/JL7iheW1aQurNPs4dzzKu11U36kmrsNZszqcNV5yo8/QEm8
         9TwZ9PazMT2EDhnfeJXKJSN3eoE5vr17iQDca84Umt+irl0pD4Sl3PEdz8pxFQt5WO60
         K7Ub1XcV1054ZB710OXfPUczTq+novbTzJmfzGTArLLJEl+i0RCTuq15Xbk2IB2xtBHi
         YvZU9LlrlolzhPEKZBT6wnaRLy+20phZK9EkLNTdEM6Qrn4CwabxF5MT9ricnvQurlhh
         +rmw==
X-Forwarded-Encrypted: i=1; AJvYcCU8NO4qWK7xNnR2jNLosbb/ATJwc4/6qIYAONBKE8aOI5z9UiIBn/kBg25IIHynRrLba7zEFoHALp7emKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/RJBJE9I1MRa3xdF1fkPzFsN2YzLb+kbhIB5s7VYUPIu+bWl
	jJEeCec4ysK/eNdyHFca37K0e5mxNArURw1pVTs1CDIl3koaSYPWjmBpbUuNWbVorw==
X-Gm-Gg: ASbGncu30y0mr84i0SZpNiLuixUhV1VQUdhZ+hMu5pOkPs/MNv8gnrj8vmraSZchlRG
	I9KsZ9eby2xuemS0OyUQvSOWCdHFv0hSf/gmShp1XGY7R/1qk1A8mK8j+pAewuYtGeVepOhvElH
	HtFZEJSBrPeOh1CBv4zHfUqYBFYU1TeSBvqIlQgY1mbr87zkMMD3jpJIpA2sbqzFPxyTVBBjBDk
	fN72Ri/fSynOL4Jy/351HCyRYbzAgfNxZ6goChUfdo1V5fO2Cr+JtRHayS7dAAjwyG4JWtwU2Nc
	+7j4nb6+zO5QS7Aacis/bJ87xGmwZMGdDO6H9CFoeEul70Bh2vY=
X-Google-Smtp-Source: AGHT+IGHJAkK6CzCCM9cOfSrYEK3mHhZArf63vIxMeajw31jj/EyLMgG6z5FnWqIFS7q5Xt47NFtKg==
X-Received: by 2002:a05:6a00:10cb:b0:732:2923:b70f with SMTP id d2e1a72fcca58-745fdf4ab96mr14791901b3a.11.1748329142559;
        Mon, 26 May 2025 23:59:02 -0700 (PDT)
Received: from bytedance ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a0ca7sm18078765b3a.158.2025.05.26.23.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:59:02 -0700 (PDT)
Date: Tue, 27 May 2025 14:58:54 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
Message-ID: <20250527065836.GA3373486@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <20250522120336.GI39944@noisy.programming.kicks-ass.net>
 <20250522124840.GC672414@bytedance>
 <20250523145942.GL39944@noisy.programming.kicks-ass.net>
 <20250526113352.GA2993700@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526113352.GA2993700@bytedance>

On Mon, May 26, 2025 at 07:36:50PM +0800, Aaron Lu wrote:
> On Fri, May 23, 2025 at 04:59:42PM +0200, Peter Zijlstra wrote:
> > On Thu, May 22, 2025 at 08:49:43PM +0800, Aaron Lu wrote:
> > > On Thu, May 22, 2025 at 02:03:36PM +0200, Peter Zijlstra wrote:
> > 
> > > > This is asymmetric -- dequeue removes it from that throttle list, but
> > > > the corresponding enqueue will not add it back, what gives?
> > > > 
> > > > Because now we have:
> > > > 
> > > >  p->on_rq=1
> > > >  p->throttle_node on list
> > > > 
> > > > move_queued_task()
> > > >   deactivate_task()
> > > >     dequeue_task_fair()
> > > >       list_del_init(throttle_node)
> > > >     p->on_rq = 2
> > > > 
> > > >   activate_task()
> > > >     enqueue_task_fair()
> > > >       // nothing special, makes the thing runnable
> > > >     p->on_rq = 1;
> > > > 
> > > > and we exit with a task that is on-rq and not throttled ?!?
> > > >
> > > > Why is this? Are we relying on pick_task_fair() to dequeue it again and
> > > > fix up our inconsistencies? If so, that had better have a comment on.
> > > 
> > > Correct.
> > 
> > But would it not be better to have enqueue bail when we're trying to
> > enqueue an already throttled task into a throttled cfs_rq?
> > 
> > It seems a waste to do the actual enqueue, pick, dequeue when we
> > could've just avoided all that.
> >
> 
> The original idea is to keep code simple but surely this can be
> optimized. I'm working on it and will paste diff here once I get it
> work.
>

I tried below diff on top of this series:

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 055f3782eeaee..1c5d7c4ff6652 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -882,6 +882,7 @@ struct task_struct {
 #ifdef CONFIG_CFS_BANDWIDTH
 	struct callback_head		sched_throttle_work;
 	struct list_head		throttle_node;
+	bool				throttled;
 #endif
 #endif
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 89afa472299b7..c585a12f2c753 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5798,7 +5798,7 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
 
 static inline bool task_is_throttled(struct task_struct *p)
 {
-	return !list_empty(&p->throttle_node);
+	return p->throttled;
 }
 
 static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
@@ -5842,6 +5842,7 @@ static void throttle_cfs_rq_work(struct callback_head *work)
 		 * mistakenly regard this task as an already throttled one.
 		 */
 		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
+		p->throttled = true;
 		resched_curr(rq);
 	}
 
@@ -5870,6 +5871,22 @@ static void dequeue_throttled_task(struct task_struct *p, int flags)
 	list_del_init(&p->throttle_node);
 }
 
+/* return true to skip actual enqueue */
+static bool enqueue_throttled_task(struct task_struct *p)
+{
+	struct cfs_rq *cfs_rq = cfs_rq_of(&p->se);
+
+	if (throttled_hierarchy(cfs_rq)) {
+		/* throttled task move across task groups/rqs. */
+		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
+		return true;
+	}
+
+	/* unthrottle */
+	p->throttled = false;
+	return false;
+}
+
 static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
 static int tg_unthrottle_up(struct task_group *tg, void *data)
 {
@@ -6714,6 +6731,7 @@ static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
 static void task_throttle_setup_work(struct task_struct *p) {}
 static bool task_is_throttled(struct task_struct *p) { return false; }
 static void dequeue_throttled_task(struct task_struct *p, int flags) {}
+static bool enqueue_throttled_task(struct task_struct *p) { return false; }
 static void record_throttle_clock(struct cfs_rq *cfs_rq) {}
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
@@ -6907,6 +6925,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	int rq_h_nr_queued = rq->cfs.h_nr_queued;
 	u64 slice = 0;
 
+	if (unlikely(task_is_throttled(p) && enqueue_throttled_task(p)))
+		return;
+
 	/*
 	 * The code below (indirectly) updates schedutil which looks at
 	 * the cfs_rq utilization to select a frequency.
@@ -6917,7 +6938,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		util_est_enqueue(&rq->cfs, p);
 
 	if (flags & ENQUEUE_DELAYED) {
-		WARN_ON_ONCE(task_is_throttled(p));
 		requeue_delayed_entity(se);
 		return;
 	}

But got a list corruption issue on se->group_node. After some debugging,
the following situation could happen and cause a throttled task's
se.group_node left on rq->cfs_tasks when this task is returning to user
with throttle task executed and another cpu moving it to a new group and
its new cfs_rq is also throttled:

       cpuX                         cpuY
    taskA ret2user
  throttle_cfs_rq_work()     sched_move_task(taskA)
  task_rq_lock acquired
  dequeue_task_fair(taskA)
  task_rq_lock released
                             task_rq_lock acquired
			     task_current_donor(taskA) == true
			     task_on_rq_queued(taskA) == true
			     dequeue_task(taskA)
			     put_prev_task(taskA)
			     sched_change_group()
			     enqueue_task(taskA) -> taskA's new cfs_rq
			                            is throttled, go the
						    fast path and skip
						    actual enqueue
			     set_next_task(taskA)
		          __set_next_task_fair(taskA)
	              list_move(&se->group_node, &rq->cfs_tasks); // bug
     schedule()

(The current series does not have the problem because it always did an
actual enqueue.)

I think this can be trivially fixed by checking if the task is the
current one in enqueue_throttled_task() and if so, do not go the fast
path but do an actual enqueue, like below. I've tested it and do not
find any problem right now. Thoughts?

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index c585a12f2c753..f9de7df44e968 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5876,7 +5876,8 @@ static bool enqueue_throttled_task(struct task_struct *p)
 {
 	struct cfs_rq *cfs_rq = cfs_rq_of(&p->se);
 
-	if (throttled_hierarchy(cfs_rq)) {
+	if (throttled_hierarchy(cfs_rq) &&
+	    !task_current_donor(rq_of(cfs_rq), p)) {
 		/* throttled task move across task groups/rqs. */
 		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
 		return true;
