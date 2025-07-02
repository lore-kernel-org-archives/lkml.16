Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792D274659
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458382; cv=none; b=kM75PArGKJSzFIpWOtUj/X+v13/3ltVWMpcAQwiDOs6MrZh46DILqv1zv0pgLjd+fGiRHdxlMP60n4sgZ4ToNpKGEdxuG3bpMI75RaXBxj9ipzFUO+zr8EZPncPN7dAI13Z/G8RdmfqyvikJCtAKJUbqqqWl5r9qtzb506/T1IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458382; c=relaxed/simple;
	bh=O4fB1ytCYp8R6bFWsHDxEMVK8ik8kb1jHCv0k1+JVso=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=QKYn4CXwKD5wSErK0u0B+fe8r9vKb3jLMzhY0CvyqvqX6A5cjqKT+DIzggZK+crr2SFdcjRdgAczOhH0NfEk2NDh2Tj+RC09B6725wz9GQNJiUbb/EP2VykNs6xM+89WlmHvqac2g1qx6vjnXodz+lZPGGL6UsbLumsjEoMNbIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JUQi5LKH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JUQi5LKH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=aOXHO3W/zaz2mG5Ga3zMsmUmXkp279to5l/xdH3Itiw=; b=JUQi5LKHuCgxHnK30GXNYkVuZ4
	JhH4YQEuwrSqT9TAjrCMCwizJxox/Hy6RJSB0/pE295GnuLa215iAPTF8arvT7nDOB3blZ77dgw1c
	UM1MvQPml6PZeLTF+6rnrxcQw7ekkSraqtZ8VVutrB4UALTxBrn3OkWLx3Ms+Ct60cip/UPSObPpV
	wn52ekmvtpY/JRin4lCoPOQ1Tw7fcaHWI6cGvqbDbBtH6P123jriykC/LGDfaD/aHZLvenj7CFp3E
	xcCZBe94rY5gFt0jWOVFA8Y1DeNTgWMtbHBuBcFaTbozBfNIeORzLZhF2kOr3aTsojGF0mqCFvfJL
	migWsE8A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKW-00000009lFI-1xPR;
	Wed, 02 Jul 2025 12:12:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id EA7DD300243; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121159.652969404@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:36 +0200
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
Subject: [PATCH v2 12/12] sched: Add ttwu_queue support for delayed tasks
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

One of the more expensive things to do is take a remote runqueue lock;
which is exactly what ttwu_runnable() ends up doing. However, in the
case of sched_delayed tasks it is possible to queue up an IPI instead.

Reported-by: Chris Mason <clm@meta.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/20250520101727.984171377@infradead.org
---
 include/linux/sched.h   |    1 
 kernel/sched/core.c     |   96 +++++++++++++++++++++++++++++++++++++++++++++---
 kernel/sched/fair.c     |   17 ++++++++
 kernel/sched/features.h |    1 
 kernel/sched/sched.h    |    1 
 5 files changed, 110 insertions(+), 6 deletions(-)

--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -984,6 +984,7 @@ struct task_struct {
 	 * ->sched_remote_wakeup gets used, so it can be in this word.
 	 */
 	unsigned			sched_remote_wakeup:1;
+	unsigned			sched_remote_delayed:1;
 #ifdef CONFIG_RT_MUTEXES
 	unsigned			sched_rt_mutex:1;
 #endif
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -675,7 +675,12 @@ struct rq *__task_rq_lock(struct task_st
 {
 	struct rq *rq;
 
-	lockdep_assert_held(&p->pi_lock);
+	/*
+	 * TASK_WAKING is used to serialize the remote end of wakeup, rather
+	 * than p->pi_lock.
+	 */
+	lockdep_assert(p->__state == TASK_WAKING ||
+		       lockdep_is_held(&p->pi_lock) != LOCK_STATE_NOT_HELD);
 
 	for (;;) {
 		rq = task_rq(p);
@@ -3727,6 +3732,8 @@ ttwu_do_activate(struct rq *rq, struct t
 	}
 }
 
+static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags);
+
 /*
  * Consider @p being inside a wait loop:
  *
@@ -3754,6 +3761,35 @@ ttwu_do_activate(struct rq *rq, struct t
  */
 static int ttwu_runnable(struct task_struct *p, int wake_flags)
 {
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
+		/*
+		 * Bit of a hack, see select_task_rq_fair()'s WF_DELAYED case.
+		 */
+		p->wake_cpu = smp_processor_id();
+
+		if (ttwu_queue_wakelist(p, task_cpu(p), wake_flags | WF_DELAYED))
+			return 1;
+	}
+
 	CLASS(__task_rq_lock, guard)(p);
 	struct rq *rq = guard.rq;
 
@@ -3776,6 +3812,8 @@ static int ttwu_runnable(struct task_str
 	return 1;
 }
 
+static void __ttwu_queue_wakelist(struct task_struct *p, int cpu);
+
 static inline bool ttwu_do_migrate(struct rq *rq, struct task_struct *p, int cpu)
 {
 	struct rq *p_rq = rq ? : task_rq(p);
@@ -3801,6 +3839,52 @@ static inline bool ttwu_do_migrate(struc
 	return true;
 }
 
+static int ttwu_delayed(struct rq *rq, struct task_struct *p, int wake_flags,
+			struct rq_flags *rf)
+{
+	struct rq *p_rq = task_rq(p);
+	int cpu;
+
+	/*
+	 * Notably it is possible for on-rq entities to get migrated -- even
+	 * sched_delayed ones. This should be rare though, so flip the locks
+	 * rather than IPI chase after it.
+	 */
+	if (unlikely(rq != p_rq)) {
+		rq_unlock(rq, rf);
+		p_rq = __task_rq_lock(p, rf);
+		update_rq_clock(p_rq);
+	}
+
+	if (task_on_rq_queued(p))
+		dequeue_task(p_rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP | DEQUEUE_DELAYED);
+
+	/*
+	 * NOTE: unlike the regular try_to_wake_up() path, this runs both
+	 * select_task_rq() and ttwu_do_migrate() while holding rq->lock
+	 * rather than p->pi_lock.
+	 */
+	cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
+	if (ttwu_do_migrate(rq, p, cpu))
+		wake_flags |= WF_MIGRATED;
+
+	if (unlikely(rq != p_rq)) {
+		__task_rq_unlock(p_rq, rf);
+		rq_lock(rq, rf);
+	}
+
+	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
+	p->sched_remote_delayed = 0;
+
+	/* it wants to run here */
+	if (cpu_of(rq) == cpu)
+		return 0;
+
+	/* shoot it to the CPU it wants to run on */
+	__ttwu_queue_wakelist(p, cpu);
+	return 1;
+}
+
 void sched_ttwu_pending(void *arg)
 {
 	struct llist_node *llist = arg;
@@ -3819,12 +3903,13 @@ void sched_ttwu_pending(void *arg)
 		if (WARN_ON_ONCE(p->on_cpu))
 			smp_cond_load_acquire(&p->on_cpu, !VAL);
 
-		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
-			set_task_cpu(p, cpu_of(rq));
-
 		if (p->sched_remote_wakeup)
 			wake_flags |= WF_MIGRATED;
 
+		if (p->sched_remote_delayed &&
+		    ttwu_delayed(rq, p, wake_flags | WF_DELAYED, &guard.rf))
+			continue;
+
 		ttwu_do_activate(rq, p, wake_flags, &guard.rf);
 	}
 
@@ -3964,12 +4049,13 @@ static inline bool ttwu_queue_cond(struc
 
 static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
 {
-	bool def = sched_feat(TTWU_QUEUE_DEFAULT);
+	bool def = sched_feat(TTWU_QUEUE_DEFAULT) || (wake_flags & WF_DELAYED);
 
 	if (!ttwu_queue_cond(p, cpu, def))
 		return false;
 
 	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
+	p->sched_remote_delayed = !!(wake_flags & WF_DELAYED);
 
 	__ttwu_queue_wakelist(p, cpu);
 	return true;
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5327,7 +5327,10 @@ static __always_inline void return_cfs_r
 
 static void set_delayed(struct sched_entity *se)
 {
-	se->sched_delayed = 1;
+	/*
+	 * See TTWU_QUEUE_DELAYED in ttwu_runnable().
+	 */
+	smp_store_release(&se->sched_delayed, 1);
 
 	/*
 	 * Delayed se of cfs_rq have no tasks queued on them.
@@ -8481,6 +8484,18 @@ select_task_rq_fair(struct task_struct *
 	/* SD_flags and WF_flags share the first nibble */
 	int sd_flag = wake_flags & 0xF;
 
+	if (wake_flags & WF_DELAYED) {
+		/*
+		 * This is the ttwu_delayed() case; where prev_cpu is in fact
+		 * the CPU that did the wakeup, while @p is running on the
+		 * current CPU.
+		 *
+		 * Make sure to flip them the right way around, otherwise
+		 * wake-affine is going to do the wrong thing.
+		 */
+		swap(cpu, new_cpu);
+	}
+
 	/*
 	 * required for stable ->cpus_allowed
 	 */
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -82,6 +82,7 @@ SCHED_FEAT(TTWU_QUEUE, false)
 SCHED_FEAT(TTWU_QUEUE, true)
 #endif
 SCHED_FEAT(TTWU_QUEUE_ON_CPU, true)
+SCHED_FEAT(TTWU_QUEUE_DELAYED, true)
 SCHED_FEAT(TTWU_QUEUE_DEFAULT, false)
 
 /*
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2280,6 +2280,7 @@ static inline int task_on_rq_migrating(s
 #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
 
 #define WF_ON_CPU		0x0100
+#define WF_DELAYED		0x0200
 
 static_assert(WF_EXEC == SD_BALANCE_EXEC);
 static_assert(WF_FORK == SD_BALANCE_FORK);


