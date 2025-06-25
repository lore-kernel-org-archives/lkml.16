Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96632DCC0C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883492; cv=none; b=ltVNrIv/QwlNTBZZs9+P5OiPb3jmSidCWfjeof0bHoWZujNVFi0PSSo3R5vGY7jYKq10zlPyKDjuYUx07nPoihtGyRwEw382KxHbWcw2ESoorMBxBDGUn9D6kCQL5zZTxammssaxIYLZQ0qRBI1O+4wfISFyTC5lDheo6QZnxbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883492; c=relaxed/simple;
	bh=eEGbTUhehreNHJJcHfYFZqQbpQHx5PlflpLC6KOfwLo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HOG4Xc6tbTCd+XpmoTlWCoc2lmsf9OdE9KrXc7V0hFpxusd8QFe8bA7d2YSehqIjjG7seXdMjA+YFTmr7SOZZXKSG0owC4O9o4ba+y4xCQKa3fbJA6+jJaBV1Nu2zB+P+VIgxbM0d9cWnkKzCI7GfNhSPvp04upRCVrMqok/gi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jo5R9Auf; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jo5R9Auf"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so239161b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750883490; x=1751488290; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yGWjwWeoIfXjnW6VujAMlFOzBqf8NJo/hzIiehZaI4M=;
        b=Jo5R9AufxBdN96dV06AmJ21iybtZU/8iHyOpOMs2rEsXeuBEOBM1x0+b4QssgW8PZ/
         z1cXQxx/ZQourEkwATIljPOaNtSnxUcC1c5YxoSj9YGGCK5I0gYJjqjQBmkbYNBnyeui
         q5FcjJwE8ZnourSHueKyYXf6dNwxdkrjEkR4CNSxicSScKCuTPWz+r+5Atc3mCm8WED4
         tJ2lJ3+zk/5uA/IGvpCSwb5fUvYkMVI3/aKUhVCcq7Qk94BZvm6QEDqBBqRgFeMrzmXC
         Vc19g6ach+rEtnb1KVWors6cZ5HeuAtEBoS62ZNqM7BOjgPqFbIu5Z6861xJ5YVVxKnr
         uMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750883490; x=1751488290;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGWjwWeoIfXjnW6VujAMlFOzBqf8NJo/hzIiehZaI4M=;
        b=AR/IB+WaQNp3blQIXO5jHt7Arms5+4sQskekVuwqpyuxDQlhsSmtvZJQvol0iwSMPK
         kbJNtc94JZ1fgv7cWheZBxi3yEX6h6UmvzWNGI2fTbokIwRQRNf1hCDwSfyv/m0PLwLN
         qLI1RRXfmum6RfDOi4PleJvGroDPQBTKfRwqQa37NT30sFH2YlrRyVO9p+NYR5uSjL4Y
         YGIo8JV1VgZr5ydjWRBfv3aqbB3BqZBvJO9JOXKoQx2jsak4nGRPNY0MsOx8vM5cfd1A
         TjqPap4rkZYP2v1zWS7OJRQVEbJ2jWpGrJpj54z4o3G6zUNO9uudY+LdvVezLINjv9yL
         qAZg==
X-Gm-Message-State: AOJu0Yy1qaj0yorkrLhKD1HTky0kdE+crLrEvNzfj0ESTRBhIlfaRV3T
	trJEnPUl6CJn7jNqpixvbo8QBZ3Ntw1LdGjJXsQkH19NA+mxin0gTRGPYu14FhCVwLXjhqwVrgd
	f1y/tTCH+U0ifjUHvG1eKudKba9qr97MOPbudWF15q2CCYxUhTeRlir002e4vjmGSeh7tC4LsXR
	zadzByj9Jza7btFh5CE0ccLsRwwmZ5PwzCWWXz7bqXueg/85We
X-Google-Smtp-Source: AGHT+IEqs5f8XRv7rHPGYoDkgavkdCUmUkG8ZyD9wKvrccGxxaEgqULooPwub1kfQqVHhIN1j9jPGtID56OS
X-Received: from pgy33.prod.google.com ([2002:a63:1861:0:b0:b31:cdc2:ff97])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3298:b0:1f5:591b:4f7a
 with SMTP id adf61e73a8af0-2207f31ac43mr7293136637.38.1750883489863; Wed, 25
 Jun 2025 13:31:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:31:01 +0000
In-Reply-To: <20250625203110.2299275-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250625203110.2299275-1-jstultz@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250625203110.2299275-9-jstultz@google.com>
Subject: [PATCH v18 8/8] sched: Start blocked_on chain processing in find_proxy_task()
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
	Suleiman Souhlal <suleiman@google.com>, kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, 
	kernel-team@android.com
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
v18:
* Minor tweak to order of logic in find_proxy_task() to enable
  an optimization later in the full series suggested by Suleiman
* Use READ_ONCE calls to on_rq references as I hit a bug where
  the compiler was optimizing out some of the reads.

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
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: kernel-team@android.com
---
 kernel/locking/mutex.h |   3 +-
 kernel/sched/core.c    | 143 ++++++++++++++++++++++++++++++++++-------
 kernel/sched/fair.c    |  11 +++-
 3 files changed, 132 insertions(+), 25 deletions(-)

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
index 98a802e0a3f36..1c7573d0cd312 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -96,6 +96,7 @@
 #include "../workqueue_internal.h"
 #include "../../io_uring/io-wq.h"
 #include "../smpboot.h"
+#include "../locking/mutex.h"
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpu);
 EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpumask);
@@ -2965,8 +2966,15 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
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
@@ -6695,36 +6703,124 @@ static struct task_struct *proxy_deactivate(struct rq *rq, struct task_struct *d
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
 
-	/* Check again that donor is blocked with blocked_lock held */
-	if (!task_is_blocked(donor) || mutex != __get_task_blocked_on(donor)) {
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
+		if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
+			/* XXX Don't handle blocked owners/delayed dequeue yet */
+			return proxy_deactivate(rq, donor);
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
+		/*
+		 * Its possible to race where after we check owner->on_rq
+		 * but before we check (owner_cpu != this_cpu) that the
+		 * task on another cpu was migrated back to this cpu. In
+		 * that case it could slip by our  checks. So double check
+		 * we are still on this cpu and not migrating. If we get
+		 * inconsistent results, try again.
+		 */
+		if (!task_on_rq_queued(owner) || task_cpu(owner) != this_cpu)
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
 		/*
-		 * Something changed in the blocked_on chain and
-		 * we don't know if only at this level. So, let's
-		 * just bail out completely and let __schedule()
-		 * figure things out (pick_again loop).
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
@@ -6876,10 +6972,13 @@ static void __sched notrace __schedule(int sched_mode)
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
index c34e0891193a7..ea4331ed6bc23 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9415,7 +9415,8 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	 * 2) throttled_lb_pair, or
 	 * 3) cannot be migrated to this CPU due to cpus_ptr, or
 	 * 4) running (obviously), or
-	 * 5) are cache-hot on their current CPU.
+	 * 5) are cache-hot on their current CPU or
+	 * 6) are blocked on mutexes (if SCHED_PROXY_EXEC is enabled)
 	 */
 	if ((p->se.sched_delayed) && (env->migration_type != migrate_load))
 		return 0;
@@ -9437,6 +9438,9 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	if (kthread_is_per_cpu(p))
 		return 0;
 
+	if (task_is_blocked(p))
+		return 0;
+
 	if (!cpumask_test_cpu(env->dst_cpu, p->cpus_ptr)) {
 		int cpu;
 
@@ -9472,7 +9476,8 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	/* Record that we found at least one task that could run on dst_cpu */
 	env->flags &= ~LBF_ALL_PINNED;
 
-	if (task_on_cpu(env->src_rq, p)) {
+	if (task_on_cpu(env->src_rq, p) ||
+	    task_current_donor(env->src_rq, p)) {
 		schedstat_inc(p->stats.nr_failed_migrations_running);
 		return 0;
 	}
@@ -9515,6 +9520,8 @@ static void detach_task(struct task_struct *p, struct lb_env *env)
 		schedstat_inc(env->sd->lb_hot_gained[env->idle]);
 		schedstat_inc(p->stats.nr_forced_migrations);
 	}
+	WARN_ON(task_current(env->src_rq, p));
+	WARN_ON(task_current_donor(env->src_rq, p));
 
 	deactivate_task(env->src_rq, p, DEQUEUE_NOCLOCK);
 	set_task_cpu(p, env->dst_cpu);
-- 
2.50.0.727.gbf7dc18ff4-goog

