Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123382561CC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902222; cv=none; b=IC/0WGxoTQmntYo6TMYJr1Hc4RqC2INHLPdcZkxXTdDk7hJypOKaZh9embdblW8ww6QVYKoPWAlhphhaFEibREWE1r/3a7vchFBx3XReCpHmTtcsn82gS961dY24jRcm0WBuNEaxVJd9zUJkL8dzHGcsPYoPyRr8S8NyD4Fg2t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902222; c=relaxed/simple;
	bh=wvXd1bWf9leq4zQLM0GXWQfermobhZ0k7/FSb422d4k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D7ER9QwoJjIpjLjakiIkn8p2p/yTSiKHvPEpV5GVVCaA2zbnEL/4E1vESTHqtOB9P/AsCfqwqkDjQJDq3Ke6o6KT4i3YNsHe6Ky3a97oYhdO2UlHr5uCMGkql5Gf0BRtb6tiEwMM1+XJThsa9h/5CcsXs3o7f53YsuPXM54/mL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nJftkV8b; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nJftkV8b"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7462aff55bfso3869820b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748902219; x=1749507019; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6yM01eqioopPzU/tvtFeFk0CtCeRB7fCEiINGQnDBzo=;
        b=nJftkV8b2UrOzQ+L8LUTn3a6klrZVvu5ma9MyeCSc9Nce3G++pA3i3tQFETWM+/Tx/
         oSggqrk0JG8XrxBKK6LgnbP47Y/t7dToIVKSeA3gwvwu1sKvURxQkMvBGpup4skTdNrl
         j7LJdj112/6hCB72Tq9ICvvoLTS8Jt+HoEZ8F/i1ULjgDbiyO8A6g+jmOdHlwvVi1IB/
         s8jyHBQDQ4bOPSIFrvq4EHO0HUKIIDLSWVfhcoCM2cAnN657eyR1zhBG+7I9RBEmdNTz
         CLXYoyweSN5EpfWioeK92egUjZ+rO2/QiUMaCGNMSN752tvDRq0gf5BEIHc1R4bOaCNM
         8GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902219; x=1749507019;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yM01eqioopPzU/tvtFeFk0CtCeRB7fCEiINGQnDBzo=;
        b=dsmy8LMnTSzdHsjnlF/x97SdHN8/amrH/mORQbrYNQ1dvCX3RvVOY8UoaJ0lCTn4U5
         0Q/BSHYd2nOm2bKHiSc1ZUlzgviEdrlA2sdqINnrcC+WNhiHMltIktNXTZ1IBBBwjJB5
         dV4tgro6D/4VTRj8gQwR/gRCHjnHMfQHWSlVZQXwBXB0vHArge5gjT5WglOg7TEFNHpN
         vb9kKJYGdsydqrsR9Tge5TK2wwqPRipagayb7da37ucevwm4L7afrFB8aU4ndaA6UtHy
         xMhI14zIXd+qGfoAHXLavUzIIOt0VEoCQmIYby20xZxbRDfi2mNMxIfgE+u71NRaXdOh
         t+tw==
X-Gm-Message-State: AOJu0YzLB2rf9PLNs1C2sHYPozq/+WOaUpJl3ISSqYYHHvJQYYQr7cNJ
	7cAQfRHNKvbje+oEyKZ+/6dT6trE+laFiByr/tSDaZSZdYa8dIoFv9LcAHzGTIJOTCR0aFh5Z8j
	U/YeocgWbE28OQp+w56toAsDKq3Y10cr3icWd0InHEtf7dmErSXFgPjzRWsndEz5aZOLE0Xa3OX
	2PQCeq//ESEfvD+oxMCKdv/kG2bfymjyV5GF/91HF5Cp4oyXak
X-Google-Smtp-Source: AGHT+IG0P4FFDQlbTL0y+CEvcGKO5m4lDlD4zrPk1HXFLpyaXK99KkEN7nsk6sUNgIBZPu0oF73pmDkpQXHe
X-Received: from pfblb23.prod.google.com ([2002:a05:6a00:4f17:b0:746:1cdd:faa3])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:734f:b0:206:a9bd:a3a3
 with SMTP id adf61e73a8af0-21ad95ce038mr23395438637.24.1748902218738; Mon, 02
 Jun 2025 15:10:18 -0700 (PDT)
Date: Mon,  2 Jun 2025 22:09:55 +0000
In-Reply-To: <20250602221004.3837674-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602221004.3837674-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602221004.3837674-9-jstultz@google.com>
Subject: [RESEND][PATCH v17 8/8] sched: Start blocked_on chain processing in find_proxy_task()
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Valentin Schneider <valentin.schneider@arm.com>, "Connor O'Brien" <connoro@google.com>, 
	John Stultz <jstultz@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

From: Peter Zijlstra <peterz@infradead.org>

Start to flesh out the real find_proxy_task() implementation,
but avoid the migration cases for now, in those cases just
deactivate the donor task and pick again.

To ensure the donor task or other blocked tasks in the chain
aren't migrated away while we're running the proxy, also tweak
the fair class logic to avoid migrating donor or mutex blocked
tasks.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
Signed-off-by: Connor O'Brien <connoro@google.com>
[jstultz: This change was split out from the larger proxy patch]
Signed-off-by: John Stultz <jstultz@google.com>
---
v5:
* Split this out from larger proxy patch
v7:
* Minor refactoring of core find_proxy_task() function
* Minor spelling and corrections suggested by Metin Kaya
* Dropped an added BUG_ON that was frequently tripped
v8:
* Fix issue if proxy_deactivate fails, we don't leave task
  BO_BLOCKED
* Switch to WARN_ON from BUG_ON checks
v9:
* Improve comments suggested by Metin
* Minor cleanups
v11:
* Previously we checked next==rq->idle && prev==rq->idle, but I
  think we only really care if next==rq->idle from find_proxy_task,
  as we will still want to resched regardless of what prev was.
v12:
* Commit message rework for selected -> donor rewording
v13:
* Address new delayed dequeue condition (deactivate donor for now)
* Next to donor renaming in find_proxy_task
* Improved comments for find_proxy_task
* Rework for proxy_deactivate cleanup
v14:
* Fix build error from __mutex_owner() with CONFIG_PREEMPT_RT
v15:
* Reworks for moving blocked_on_state to later in the series
v16:
* Pull down fix from later in the series where a deactivated
  task could pass the (task_cpu(owner) == this_cpu) check
  then have it be activated on a different cpu, so it passes
  the on_rq check. Thus double check the values in the opposite
  order to make sure nothing slips by.
* Add resched_idle label to simplify common exit path
* Get rid of preserve_need_resched flag and rework per Peter's
  suggestion
* Rework find_proxy_task() to use guard to cleanup the exit gotos
  as Peter suggested.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: kernel-team@android.com
---
 kernel/locking/mutex.h |   3 +-
 kernel/sched/core.c    | 145 ++++++++++++++++++++++++++++++++++-------
 kernel/sched/fair.c    |  11 +++-
 3 files changed, 134 insertions(+), 25 deletions(-)

diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
index cbff35b9b7ae3..2e8080a9bee37 100644
--- a/kernel/locking/mutex.h
+++ b/kernel/locking/mutex.h
@@ -6,7 +6,7 @@
  *
  *  Copyright (C) 2004, 2005, 2006 Red Hat, Inc., Ingo Molnar <mingo@redhat.com>
  */
-
+#ifndef CONFIG_PREEMPT_RT
 /*
  * This is the control structure for tasks blocked on mutex, which resides
  * on the blocked task's kernel stack:
@@ -70,3 +70,4 @@ extern void debug_mutex_init(struct mutex *lock, const char *name,
 # define debug_mutex_unlock(lock)			do { } while (0)
 # define debug_mutex_init(lock, name, key)		do { } while (0)
 #endif /* !CONFIG_DEBUG_MUTEXES */
+#endif /* CONFIG_PREEMPT_RT */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index af35a493fd943..ecaba65e6ec85 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -95,6 +95,7 @@
 #include "../workqueue_internal.h"
 #include "../../io_uring/io-wq.h"
 #include "../smpboot.h"
+#include "../locking/mutex.h"
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpu);
 EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpumask);
@@ -2955,8 +2956,15 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 	struct set_affinity_pending my_pending = { }, *pending = NULL;
 	bool stop_pending, complete = false;
 
-	/* Can the task run on the task's current CPU? If so, we're done */
-	if (cpumask_test_cpu(task_cpu(p), &p->cpus_mask)) {
+	/*
+	 * Can the task run on the task's current CPU? If so, we're done
+	 *
+	 * We are also done if the task is the current donor, boosting a lock-
+	 * holding proxy, (and potentially has been migrated outside its
+	 * current or previous affinity mask)
+	 */
+	if (cpumask_test_cpu(task_cpu(p), &p->cpus_mask) ||
+	    (task_current_donor(rq, p) && !task_current(rq, p))) {
 		struct task_struct *push_task = NULL;
 
 		if ((flags & SCA_MIGRATE_ENABLE) &&
@@ -6678,36 +6686,126 @@ static struct task_struct *proxy_deactivate(struct rq *rq, struct task_struct *d
 }
 
 /*
- * Initial simple sketch that just deactivates the blocked task
- * chosen by pick_next_task() so we can then pick something that
- * isn't blocked.
+ * Find runnable lock owner to proxy for mutex blocked donor
+ *
+ * Follow the blocked-on relation:
+ *   task->blocked_on -> mutex->owner -> task...
+ *
+ * Lock order:
+ *
+ *   p->pi_lock
+ *     rq->lock
+ *       mutex->wait_lock
+ *
+ * Returns the task that is going to be used as execution context (the one
+ * that is actually going to be run on cpu_of(rq)).
  */
 static struct task_struct *
 find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 {
+	struct task_struct *owner = NULL;
+	int this_cpu = cpu_of(rq);
+	struct task_struct *p;
 	struct mutex *mutex;
 
-	mutex = donor->blocked_on;
-	/* Something changed in the chain, so pick again */
-	if (!mutex)
-		return NULL;
-	/*
-	 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
-	 * and ensure @owner sticks around.
-	 */
-	guard(raw_spinlock)(&mutex->wait_lock);
+	/* Follow blocked_on chain. */
+	for (p = donor; task_is_blocked(p); p = owner) {
+		mutex = p->blocked_on;
+		/* Something changed in the chain, so pick again */
+		if (!mutex)
+			return NULL;
+		/*
+		 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
+		 * and ensure @owner sticks around.
+		 */
+		guard(raw_spinlock)(&mutex->wait_lock);
+
+		/* Check again that p is blocked with wait_lock held */
+		if (mutex != __get_task_blocked_on(p)) {
+			/*
+			 * Something changed in the blocked_on chain and
+			 * we don't know if only at this level. So, let's
+			 * just bail out completely and let __schedule()
+			 * figure things out (pick_again loop).
+			 */
+			return NULL;
+		}
+
+		owner = __mutex_owner(mutex);
+		if (!owner) {
+			__clear_task_blocked_on(p, mutex);
+			return p;
+		}
+
+		if (task_cpu(owner) != this_cpu) {
+			/* XXX Don't handle migrations yet */
+			return proxy_deactivate(rq, donor);
+		}
+
+		if (task_on_rq_migrating(owner)) {
+			/*
+			 * One of the chain of mutex owners is currently migrating to this
+			 * CPU, but has not yet been enqueued because we are holding the
+			 * rq lock. As a simple solution, just schedule rq->idle to give
+			 * the migration a chance to complete. Much like the migrate_task
+			 * case we should end up back in find_proxy_task(), this time
+			 * hopefully with all relevant tasks already enqueued.
+			 */
+			return proxy_resched_idle(rq);
+		}
+
+		if (!owner->on_rq) {
+			/* XXX Don't handle blocked owners yet */
+			return proxy_deactivate(rq, donor);
+		}
+
+		if (owner->se.sched_delayed) {
+			/* XXX Don't handle delayed dequeue yet */
+			return proxy_deactivate(rq, donor);
+		}
 
-	/* Check again that donor is blocked with blocked_lock held */
-	if (!task_is_blocked(donor) || mutex != __get_task_blocked_on(donor)) {
 		/*
-		 * Something changed in the blocked_on chain and
-		 * we don't know if only at this level. So, let's
-		 * just bail out completely and let __schedule()
-		 * figure things out (pick_again loop).
+		 * If owner was !on_rq, the task_cpu() check followed by on_rq check
+		 * could race with a wakeup onto another cpu right inbetween those checks.
+		 * So double check owner is both on_rq & on this cpu.
+		 */
+		if (!(task_on_rq_queued(owner) && task_cpu(owner) == this_cpu))
+			return NULL;
+
+		if (owner == p) {
+			/*
+			 * It's possible we interleave with mutex_unlock like:
+			 *
+			 *				lock(&rq->lock);
+			 *				  find_proxy_task()
+			 * mutex_unlock()
+			 *   lock(&wait_lock);
+			 *   donor(owner) = current->blocked_donor;
+			 *   unlock(&wait_lock);
+			 *
+			 *   wake_up_q();
+			 *     ...
+			 *       ttwu_runnable()
+			 *         __task_rq_lock()
+			 *				  lock(&wait_lock);
+			 *				  owner == p
+			 *
+			 * Which leaves us to finish the ttwu_runnable() and make it go.
+			 *
+			 * So schedule rq->idle so that ttwu_runnable() can get the rq
+			 * lock and mark owner as running.
+			 */
+			return proxy_resched_idle(rq);
+		}
+		/*
+		 * OK, now we're absolutely sure @owner is on this
+		 * rq, therefore holding @rq->lock is sufficient to
+		 * guarantee its existence, as per ttwu_remote().
 		 */
-		return NULL; /* do pick_next_task() again */
 	}
-	return proxy_deactivate(rq, donor);
+
+	WARN_ON_ONCE(owner && !owner->on_rq);
+	return owner;
 }
 #else /* SCHED_PROXY_EXEC */
 static struct task_struct *
@@ -6857,10 +6955,13 @@ static void __sched notrace __schedule(int sched_mode)
 		next = find_proxy_task(rq, next, &rf);
 		if (!next)
 			goto pick_again;
+		if (next == rq->idle)
+			goto keep_resched;
 	}
 picked:
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();
+keep_resched:
 	rq->last_seen_need_resched_ns = 0;
 
 	is_switch = prev != next;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1fd4c78314d6e..0342def9fcbbf 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9401,7 +9401,8 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	 * 2) throttled_lb_pair, or
 	 * 3) cannot be migrated to this CPU due to cpus_ptr, or
 	 * 4) running (obviously), or
-	 * 5) are cache-hot on their current CPU.
+	 * 5) are cache-hot on their current CPU or
+	 * 6) are blocked on mutexes (if SCHED_PROXY_EXEC is enabled)
 	 */
 	if ((p->se.sched_delayed) && (env->migration_type != migrate_load))
 		return 0;
@@ -9423,6 +9424,9 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	if (kthread_is_per_cpu(p))
 		return 0;
 
+	if (task_is_blocked(p))
+		return 0;
+
 	if (!cpumask_test_cpu(env->dst_cpu, p->cpus_ptr)) {
 		int cpu;
 
@@ -9458,7 +9462,8 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	/* Record that we found at least one task that could run on dst_cpu */
 	env->flags &= ~LBF_ALL_PINNED;
 
-	if (task_on_cpu(env->src_rq, p)) {
+	if (task_on_cpu(env->src_rq, p) ||
+	    task_current_donor(env->src_rq, p)) {
 		schedstat_inc(p->stats.nr_failed_migrations_running);
 		return 0;
 	}
@@ -9501,6 +9506,8 @@ static void detach_task(struct task_struct *p, struct lb_env *env)
 		schedstat_inc(env->sd->lb_hot_gained[env->idle]);
 		schedstat_inc(p->stats.nr_forced_migrations);
 	}
+	WARN_ON(task_current(env->src_rq, p));
+	WARN_ON(task_current_donor(env->src_rq, p));
 
 	deactivate_task(env->src_rq, p, DEQUEUE_NOCLOCK);
 	set_task_cpu(p, env->dst_cpu);
-- 
2.49.0.1204.g71687c7c1d-goog

