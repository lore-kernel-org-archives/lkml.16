Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40372472BE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419888; cv=none; b=QV0Mz0+9iAj34fEm3Ov3Sb/Zq/+4Y7GPG52GuJt7SV1ORrQHOTNTigMdNjMSm1yt4cU9+BFNfLCb3Nb6BQo1iHNW2q2pLoeaT/fdB9vUqSDPAFZwRuT8uqLH/5vDw3UvTY7ja2FRsJaa63o1d8hRE0M17yYIBlMG1/IJprTcgyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419888; c=relaxed/simple;
	bh=9qIjADipKCxWWsixiqxlsxQqCV/80rzVkbIAgAeM5xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kqqt5sq3ALAhvUNLQDSw7uBplmqAD1oVd/mmu9m3UemcY/eHbpyOBpkeCf6nafGjddwFifidrGoWe40HS/Pi+wpfPlmUuIbzGeanWqAhIhRiAg3KYvpLKKA/Ys6W+CNBG9FRMIxlT2wQYzcBa3yPS8ndhhog1H8pQX3dQ/Y9cW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbLUUJTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbLUUJTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BA5C4CEE7;
	Wed, 28 May 2025 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419887;
	bh=9qIjADipKCxWWsixiqxlsxQqCV/80rzVkbIAgAeM5xg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KbLUUJTUK1OKA6LQHimIbEkVHXJAgcqmhIeGZNDFs0MeKKmoZHNom9I7pq8fYUnyh
	 +6egr2ApfxfV3G4myPFVCN5sIAjgIGfsr+8rbqa24Uerx0bvVPLNEr5cSLNjxKvkfm
	 xTifqNvZRUuBI49IpI7ncx1yZQPzuqIAeJVHWjDmDgiFwLoU3DdqysIO351w+GcqXO
	 y9c98spVS4JI4NmW3PXEBIGj7/PJJ0GLH1IRNshdl5o0dmeExi8sUfwq6Sn+wx0M9j
	 EDdhvrBcKU+xl3ZuqbnHu1+bsDgGY+VhlGyzJObVrT8azdlcWayibh3JgtyP9Vmfso
	 EnegwLXM6feCQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 28/43] sched/smp: Use the SMP version of the RT scheduling class
Date: Wed, 28 May 2025 10:09:09 +0200
Message-ID: <20250528080924.2273858-29-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional in the RT policies scheduler.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/rt.c    | 72 ----------------------------------------------------
 kernel/sched/sched.h |  2 --
 2 files changed, 74 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 0cd801458eef..7119f4c8aa68 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -75,12 +75,10 @@ void init_rt_rq(struct rt_rq *rt_rq)
 	/* delimiter for bitsearch: */
 	__set_bit(MAX_RT_PRIO, array->bitmap);
 
-#if defined CONFIG_SMP
 	rt_rq->highest_prio.curr = MAX_RT_PRIO-1;
 	rt_rq->highest_prio.next = MAX_RT_PRIO-1;
 	rt_rq->overloaded = 0;
 	plist_head_init(&rt_rq->pushable_tasks);
-#endif /* CONFIG_SMP */
 	/* We start is dequeued state, because no RT tasks are queued */
 	rt_rq->rt_queued = 0;
 
@@ -329,8 +327,6 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 }
 #endif /* !CONFIG_RT_GROUP_SCHED */
 
-#ifdef CONFIG_SMP
-
 static inline bool need_pull_rt_task(struct rq *rq, struct task_struct *prev)
 {
 	/* Try to pull RT tasks here if we lower this rq's prio */
@@ -430,21 +426,6 @@ static void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
 	}
 }
 
-#else /* !CONFIG_SMP: */
-
-static inline void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
-{
-}
-
-static inline void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
-{
-}
-
-static inline void rt_queue_push_tasks(struct rq *rq)
-{
-}
-#endif /* !CONFIG_SMP */
-
 static void enqueue_top_rt_rq(struct rt_rq *rt_rq);
 static void dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count);
 
@@ -594,17 +575,10 @@ static int rt_se_boosted(struct sched_rt_entity *rt_se)
 	return p->prio != p->normal_prio;
 }
 
-#ifdef CONFIG_SMP
 static inline const struct cpumask *sched_rt_period_mask(void)
 {
 	return this_rq()->rd->span;
 }
-#else
-static inline const struct cpumask *sched_rt_period_mask(void)
-{
-	return cpu_online_mask;
-}
-#endif
 
 static inline
 struct rt_rq *sched_rt_period_rt_rq(struct rt_bandwidth *rt_b, int cpu)
@@ -625,7 +599,6 @@ bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
 		rt_rq->rt_time < rt_b->rt_runtime);
 }
 
-#ifdef CONFIG_SMP
 /*
  * We ran out of runtime, see if we can borrow some from our neighbours.
  */
@@ -798,9 +771,6 @@ static void balance_runtime(struct rt_rq *rt_rq)
 		raw_spin_lock(&rt_rq->rt_runtime_lock);
 	}
 }
-#else /* !CONFIG_SMP: */
-static inline void balance_runtime(struct rt_rq *rt_rq) {}
-#endif /* !CONFIG_SMP */
 
 static int do_sched_rt_period_timer(struct rt_bandwidth *rt_b, int overrun)
 {
@@ -977,10 +947,8 @@ struct rt_rq *sched_rt_period_rt_rq(struct rt_bandwidth *rt_b, int cpu)
 	return &cpu_rq(cpu)->rt;
 }
 
-#ifdef CONFIG_SMP
 static void __enable_runtime(struct rq *rq) { }
 static void __disable_runtime(struct rq *rq) { }
-#endif
 
 #endif /* !CONFIG_RT_GROUP_SCHED */
 
@@ -1075,8 +1043,6 @@ enqueue_top_rt_rq(struct rt_rq *rt_rq)
 	cpufreq_update_util(rq, 0);
 }
 
-#if defined CONFIG_SMP
-
 static void
 inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 {
@@ -1107,16 +1073,6 @@ dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 		cpupri_set(&rq->rd->cpupri, rq->cpu, rt_rq->highest_prio.curr);
 }
 
-#else /* !CONFIG_SMP: */
-
-static inline
-void inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio) {}
-static inline
-void dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio) {}
-
-#endif /* !CONFIG_SMP */
-
-#if defined CONFIG_SMP || defined CONFIG_RT_GROUP_SCHED
 static void
 inc_rt_prio(struct rt_rq *rt_rq, int prio)
 {
@@ -1155,13 +1111,6 @@ dec_rt_prio(struct rt_rq *rt_rq, int prio)
 	dec_rt_prio_smp(rt_rq, prio, prev_prio);
 }
 
-#else /* !(CONFIG_SMP || CONFIG_RT_GROUP_SCHED): */
-
-static inline void inc_rt_prio(struct rt_rq *rt_rq, int prio) {}
-static inline void dec_rt_prio(struct rt_rq *rt_rq, int prio) {}
-
-#endif /* !(CONFIG_SMP || CONFIG_RT_GROUP_SCHED) */
-
 #ifdef CONFIG_RT_GROUP_SCHED
 
 static void
@@ -1538,7 +1487,6 @@ static void yield_task_rt(struct rq *rq)
 	requeue_task_rt(rq, rq->curr, 0);
 }
 
-#ifdef CONFIG_SMP
 static int find_lowest_rq(struct task_struct *task);
 
 static int
@@ -1653,7 +1601,6 @@ static int balance_rt(struct rq *rq, struct task_struct *p, struct rq_flags *rf)
 
 	return sched_stop_runnable(rq) || sched_dl_runnable(rq) || sched_rt_runnable(rq);
 }
-#endif /* CONFIG_SMP */
 
 /*
  * Preempt the current task with a newly woken task if needed:
@@ -1667,7 +1614,6 @@ static void wakeup_preempt_rt(struct rq *rq, struct task_struct *p, int flags)
 		return;
 	}
 
-#ifdef CONFIG_SMP
 	/*
 	 * If:
 	 *
@@ -1682,7 +1628,6 @@ static void wakeup_preempt_rt(struct rq *rq, struct task_struct *p, int flags)
 	 */
 	if (p->prio == donor->prio && !test_tsk_need_resched(rq->curr))
 		check_preempt_equal_prio(rq, p);
-#endif /* CONFIG_SMP */
 }
 
 static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool first)
@@ -1776,8 +1721,6 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
 		enqueue_pushable_task(rq, p);
 }
 
-#ifdef CONFIG_SMP
-
 /* Only try algorithms three times */
 #define RT_MAX_TRIES 3
 
@@ -2451,11 +2394,6 @@ void __init init_sched_rt_class(void)
 					GFP_KERNEL, cpu_to_node(i));
 	}
 }
-#else /* !CONFIG_SMP: */
-void __init init_sched_rt_class(void)
-{
-}
-#endif /* !CONFIG_SMP */
 
 /*
  * When switching a task to RT, we may overload the runqueue
@@ -2479,10 +2417,8 @@ static void switched_to_rt(struct rq *rq, struct task_struct *p)
 	 * then see if we can move to another run queue.
 	 */
 	if (task_on_rq_queued(p)) {
-#ifdef CONFIG_SMP
 		if (p->nr_cpus_allowed > 1 && rq->rt.overloaded)
 			rt_queue_push_tasks(rq);
-#endif /* CONFIG_SMP */
 		if (p->prio < rq->donor->prio && cpu_online(cpu_of(rq)))
 			resched_curr(rq);
 	}
@@ -2499,7 +2435,6 @@ prio_changed_rt(struct rq *rq, struct task_struct *p, int oldprio)
 		return;
 
 	if (task_current_donor(rq, p)) {
-#ifdef CONFIG_SMP
 		/*
 		 * If our priority decreases while running, we
 		 * may need to pull tasks to this runqueue.
@@ -2513,11 +2448,6 @@ prio_changed_rt(struct rq *rq, struct task_struct *p, int oldprio)
 		 */
 		if (p->prio > rq->rt.highest_prio.curr)
 			resched_curr(rq);
-#else /* !CONFIG_SMP: */
-		/* For UP simply resched on drop of prio */
-		if (oldprio < p->prio)
-			resched_curr(rq);
-#endif /* !CONFIG_SMP */
 	} else {
 		/*
 		 * This task is not running, but if it is
@@ -2638,7 +2568,6 @@ DEFINE_SCHED_CLASS(rt) = {
 	.put_prev_task		= put_prev_task_rt,
 	.set_next_task          = set_next_task_rt,
 
-#ifdef CONFIG_SMP
 	.balance		= balance_rt,
 	.select_task_rq		= select_task_rq_rt,
 	.set_cpus_allowed       = set_cpus_allowed_common,
@@ -2647,7 +2576,6 @@ DEFINE_SCHED_CLASS(rt) = {
 	.task_woken		= task_woken_rt,
 	.switched_from		= switched_from_rt,
 	.find_lock_rq		= find_lock_lowest_rq,
-#endif /* !CONFIG_SMP */
 
 	.task_tick		= task_tick_rt,
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index de130ffa42b2..7c67e1ccc0ae 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -791,11 +791,9 @@ struct rt_rq {
 		int		curr; /* highest queued rt task prio */
 		int		next; /* next highest */
 	} highest_prio;
-#ifdef CONFIG_SMP
 	bool			overloaded;
 	struct plist_head	pushable_tasks;
 
-#endif /* CONFIG_SMP */
 	int			rt_queued;
 
 #ifdef CONFIG_RT_GROUP_SCHED
-- 
2.45.2

