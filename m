Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9867925D216
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736335; cv=none; b=mFrynBKZ5HFm526ZxwoZsA2SyD9Jx8i8qT2CaYxesKXsJHHfiORNyl9+ch0qjTv/dnQg4k/RhOALBiz+k59xOUDM0gf5fPj7rLeUDzzuckWja7/w9HlGtkunbgYAangn/knygWcPu7ioZsTbzgQO+ISvJpjqhRtCL2Ql7gcp3xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736335; c=relaxed/simple;
	bh=6jyJO+X952+v9TwQQqqRUwUO7WaprcuJD8QBDocVKf8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=GNodoRQddYFzSOA0vdfQS0/9OKOylMwEBk94uJMe4EstRAVQ/XXp7Xj2piK1viW3PId6tvwDqYAZlnSEPlk1ba40L3ZLOqtn1iV7iNqW+A8TRjnNorDm+BHEfLhTHTGZTAi3B4p6aztWhPehbKjilHJ2W3l3A1b1xOpb3uyYH/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R+7g2HFT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R+7g2HFT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=o2GFNTBpg11EZaBhNmzaf8Q+rSd69uuVAy6ECARk8uI=; b=R+7g2HFTyxtl0Dp7X4mYEETR2G
	XmmBp75s0Y89+6sL+EA5pnw1RSCFro81l8va0AWkd+3OctL+MJ0JNIru0mft7gsxWFJR5Mj5mKIBO
	iYF8WQO3ZQVHa8GaiHVkef9K/0PlA+awYXOBzW27XdpJ/fxB0G8CfxQLGhDkW8lxgHdfNCJiuQk39
	OXM93uALKj++/TfPZ1pr9vu7zbrjiC3BjdXiAl8VzTQSaNeEz9taja/w+Wgbk+zr8WGnNVZr3IZrl
	XOvQ+gAjwnZuQuZWMSk4W1xEn6LUNJV3kdU9TI7JoMTr11lcgFwiqLkPpAansow3LpRHc8wcioGrN
	6LeMLJAg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHK3a-00000000lL5-0Vyy;
	Tue, 20 May 2025 10:18:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C57E8301C4D; Tue, 20 May 2025 12:18:44 +0200 (CEST)
Message-ID: <20250520101727.984171377@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 20 May 2025 11:45:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@redhat.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 clm@meta.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org
Subject: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
References: <20250520094538.086709102@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

One of the things lost with introduction of DELAY_DEQUEUE is the
ability of TTWU to move those tasks around on wakeup, since they're
on_rq, and as such, need to be woken in-place.

Doing the in-place thing adds quite a bit of cross-cpu latency, add a
little something that gets remote CPUs to do their own in-place
wakeups, significantly reducing the rq->lock contention.

Reported-by: Chris Mason <clm@meta.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c     |   74 ++++++++++++++++++++++++++++++++++++++++++------
 kernel/sched/fair.c     |    5 ++-
 kernel/sched/features.h |    1 
 kernel/sched/sched.h    |    1 
 4 files changed, 72 insertions(+), 9 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3784,6 +3784,8 @@ static int __ttwu_runnable(struct rq *rq
 	return 1;
 }
 
+static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags);
+
 /*
  * Consider @p being inside a wait loop:
  *
@@ -3811,6 +3813,33 @@ static int __ttwu_runnable(struct rq *rq
  */
 static int ttwu_runnable(struct task_struct *p, int wake_flags)
 {
+#ifdef CONFIG_SMP
+	if (sched_feat(TTWU_QUEUE_DELAYED) && READ_ONCE(p->se.sched_delayed)) {
+		/*
+		 * Similar to try_to_block_task():
+		 *
+		 * __schedule()				ttwu()
+		 *   prev_state = prev->state		  if (p->sched_delayed)
+		 *   if (prev_state)			     smp_acquire__after_ctrl_dep()
+		 *     try_to_block_task()		     p->state = TASK_WAKING
+		 *       ... set_delayed()
+		 *         RELEASE p->sched_delayed = 1
+		 *
+		 * __schedule() and ttwu() have matching control dependencies.
+		 *
+		 * Notably, once we observe sched_delayed we know the task has
+		 * passed try_to_block_task() and p->state is ours to modify.
+		 *
+		 * TASK_WAKING controls ttwu() concurrency.
+		 */
+		smp_acquire__after_ctrl_dep();
+		WRITE_ONCE(p->__state, TASK_WAKING);
+
+		if (ttwu_queue_wakelist(p, task_cpu(p), wake_flags | WF_DELAYED))
+			return 1;
+	}
+#endif
+
 	CLASS(__task_rq_lock, guard)(p);
 	return __ttwu_runnable(guard.rq, p, wake_flags);
 }
@@ -3830,12 +3859,41 @@ void sched_ttwu_pending(void *arg)
 	update_rq_clock(rq);
 
 	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
+		struct rq *p_rq = task_rq(p);
+		int ret;
+
+		/*
+		 * This is the ttwu_runnable() case. Notably it is possible for
+		 * on-rq entities to get migrated -- even sched_delayed ones.
+		 */
+		if (unlikely(p_rq != rq)) {
+			rq_unlock(rq, &rf);
+			p_rq = __task_rq_lock(p, &rf);
+		}
+
+		ret = __ttwu_runnable(p_rq, p, WF_TTWU);
+
+		if (unlikely(p_rq != rq)) {
+			if (!ret)
+				set_task_cpu(p, cpu_of(rq));
+
+			__task_rq_unlock(p_rq, &rf);
+			rq_lock(rq, &rf);
+			update_rq_clock(rq);
+		}
+
+		if (ret) {
+			// XXX ttwu_stat()
+			continue;
+		}
+
+		/*
+		 * This is the 'normal' case where the task is blocked.
+		 */
+
 		if (WARN_ON_ONCE(p->on_cpu))
 			smp_cond_load_acquire(&p->on_cpu, !VAL);
 
-		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
-			set_task_cpu(p, cpu_of(rq));
-
 		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
 	}
 
@@ -3974,7 +4032,7 @@ static inline bool ttwu_queue_cond(struc
 
 static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
 {
-	bool def = sched_feat(TTWU_QUEUE_DEFAULT);
+	bool def = sched_feat(TTWU_QUEUE_DEFAULT) || (wake_flags & WF_DELAYED);
 
 	if (!ttwu_queue_cond(p, cpu, def))
 		return false;
@@ -4269,8 +4327,8 @@ int try_to_wake_up(struct task_struct *p
 		 * __schedule().  See the comment for smp_mb__after_spinlock().
 		 *
 		 * Form a control-dep-acquire with p->on_rq == 0 above, to ensure
-		 * schedule()'s deactivate_task() has 'happened' and p will no longer
-		 * care about it's own p->state. See the comment in __schedule().
+		 * schedule()'s try_to_block_task() has 'happened' and p will no longer
+		 * care about it's own p->state. See the comment in try_to_block_task().
 		 */
 		smp_acquire__after_ctrl_dep();
 
@@ -6712,8 +6770,8 @@ static void __sched notrace __schedule(i
 	preempt = sched_mode == SM_PREEMPT;
 
 	/*
-	 * We must load prev->state once (task_struct::state is volatile), such
-	 * that we form a control dependency vs deactivate_task() below.
+	 * We must load prev->state once, such that we form a control
+	 * dependency vs try_to_block_task() below.
 	 */
 	prev_state = READ_ONCE(prev->__state);
 	if (sched_mode == SM_IDLE) {
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5395,7 +5395,10 @@ static __always_inline void return_cfs_r
 
 static void set_delayed(struct sched_entity *se)
 {
-	se->sched_delayed = 1;
+	/*
+	 * See TTWU_QUEUE_DELAYED in ttwu_runnable().
+	 */
+	smp_store_release(&se->sched_delayed, 1);
 
 	/*
 	 * Delayed se of cfs_rq have no tasks queued on them.
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -82,6 +82,7 @@ SCHED_FEAT(TTWU_QUEUE, false)
 SCHED_FEAT(TTWU_QUEUE, true)
 #endif
 SCHED_FEAT(TTWU_QUEUE_ON_CPU, true)
+SCHED_FEAT(TTWU_QUEUE_DELAYED, false)
 SCHED_FEAT(TTWU_QUEUE_DEFAULT, false)
 
 /*
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2313,6 +2313,7 @@ static inline int task_on_rq_migrating(s
 #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
 
 #define WF_ON_CPU		0x0100
+#define WF_DELAYED		0x0200
 
 #ifdef CONFIG_SMP
 static_assert(WF_EXEC == SD_BALANCE_EXEC);


