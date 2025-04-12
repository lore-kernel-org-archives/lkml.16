Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDFE19B5B1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744437800; cv=none; b=NR4jhRVpsy7AdOknznely+YnRx93N/euWkjOAs+OLHTFe6UY7yyKYzhvW1rGDuTW9B16KCTFo4K4GyjRebFWnMMBeNl5PHothiB9jsweGmo/GdnxoaC82XIPDgFa8dlBBhKPXPHRuaMlbXs1Jjg1gnlOJ9LE6W35w0zI8LWlNhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744437800; c=relaxed/simple;
	bh=6tM9+MxTZUtYkx3p00Wm+273k5zyv3CrYFk73MFyYck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AuULMISaYKYzfKoHo5+BzPKb/9e4Oi1L/2mr57nQXGhoDTHILcKBoM7N8PdG/xyzyk2XOgyo854VjgkCR54Kt8/IWJMKEx6IPOUYBT9D/n6/KELFo8oRDIslvmfwiGT5rBwBy8y3fVOzIlYaAiWAezv8WKyever/qEHmbs93b8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EM6TpAB4; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EM6TpAB4"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30828f9af10so2001336a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744437798; x=1745042598; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=duR7DmfJIKaJrcYmCaNuS2R9apKh4RJR8oGOKow+S2s=;
        b=EM6TpAB4z5xvpwd1/XypsVRFzrEm/jGJbD/f/XlykQ/cC1nobud5ZLY6WrQ5KKHjk8
         Q99Dl2XPUQ3xq7NAgG3rLmtobgJRn0kXHjxvDex/VQsj/lzANSp11lktkOMJpCASIb48
         SpruOJ16PatteAft0XlQJsKxl36Fn2LqqV13jiDwwWv/zlektWgmgFiTu32NvLwvjQgj
         hZGPMbkVGshmKxi3XAjqVpJWuI2k+rVuh6CxYWWpMjZiKD3fzbUxJEEFWKKQxZ9O/CqI
         ZEYUddK424+SRIOqsK2s0N8Iu1ED6hwMKoCeZsPz0If3qzE33CYZ7Xlb/suypLtN5Rgr
         bQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744437798; x=1745042598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duR7DmfJIKaJrcYmCaNuS2R9apKh4RJR8oGOKow+S2s=;
        b=hb65vzV2jPzHaMunp8jVBK/AJLD+VI5N5+BE2+Yd3Z9oisn43uRbDZa4rNpiOI0NCW
         lFrRVJ/8MTWHZB9Br6F1VRYoCZI8qQoS4V7cHU6MYOwbgAGZL7kPKTA0Y7iinZU8iTOs
         alW5jh5pYkM5s2x/EXGtSx4GRatv1UJLCc8zkqxTcYWGsYbsnWkye6RUcOZE+zOLYc5o
         ffLS5DYj6PJPrPZZXB04K9LmTISAtNGJl9FkNMJRNfwLmYxd70PGvmq/lSEmFxVGmvQH
         KbwWlETGHjAG8T7119Qm0oYBZRnoEObWDl98Mcvd6aL0o7a8O/uANH/gzoEumNDRUqza
         YJ6w==
X-Gm-Message-State: AOJu0YyMugDbM8htWYopUIieHE+jkmlyFXuEQb8R58p2RdUwCqBtTEx0
	BFm+c9t1aqcNm+r2HKhEstUpuX1fj2WzG7hRW9wFpEL5JFniR/dQ03FhmSchzf57yKgtoni9H4Y
	nFRK9fETef4eMHDrYbal+TqdgoVRF4edPdiC3c83HcQpoF43LZB41YR/pS+HQIgQYvml34/wXZ3
	8By0KICatnTW752UA6x1BN0k1WaGsDH18FxeE+4WmHBedJ
X-Google-Smtp-Source: AGHT+IF/EkQ6EXTg82jQFBXU3upMTh+bvJXG3QBLHsSVsZYxx/WJdKsoRxtZrJd5brAcBpvnDq9fi+V7KTR5
X-Received: from pjbqo15.prod.google.com ([2002:a17:90b:3dcf:b0:2ea:aa56:49c])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3907:b0:2fe:baa3:b8bc
 with SMTP id 98e67ed59e1d1-3082367df4dmr6022891a91.23.1744437797405; Fri, 11
 Apr 2025 23:03:17 -0700 (PDT)
Date: Fri, 11 Apr 2025 23:02:41 -0700
In-Reply-To: <20250412060258.3844594-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412060258.3844594-8-jstultz@google.com>
Subject: [PATCH v16 7/7] sched: Start blocked_on chain processing in find_proxy_task()
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com, 
	Valentin Schneider <valentin.schneider@arm.com>, "Connor O'Brien" <connoro@google.com>, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Peter Zijlstra <peterz@infradead.org>

Start to flesh out the real find_proxy_task() implementation,
but avoid the migration cases for now, in those cases just
deactivate the donor task and pick again.

To ensure the donor task or other blocked tasks in the chain
aren't migrated away while we're running the proxy, also tweak
the fair class logic to avoid migrating donor or mutex blocked
tasks.

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
---
 kernel/locking/mutex.h |   3 +-
 kernel/sched/core.c    | 146 ++++++++++++++++++++++++++++++++++-------
 kernel/sched/fair.c    |  10 ++-
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
index 33f0260c20609..c58980028fb5f 100644
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
@@ -6678,37 +6686,126 @@ static struct task_struct *proxy_deactivate(struct rq *rq, struct task_struct *d
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
-	struct task_struct *p = donor;
+	struct task_struct *owner = NULL;
+	int this_cpu = cpu_of(rq);
+	struct task_struct *p;
 	struct mutex *mutex;
 
-	mutex = p->blocked_on;
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
+			 * just bail out completely and let __schedule
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
 
-	/* Check again that p is blocked with blocked_lock held */
-	if (!task_is_blocked(p) || mutex != __get_task_blocked_on(p)) {
 		/*
-		 * Something changed in the blocked_on chain and
-		 * we don't know if only at this level. So, let's
-		 * just bail out completely and let __schedule
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
+			 * So schedule rq->idle so that ttwu_runnable can get the rq lock
+			 * and mark owner as running.
+			 */
+			return proxy_resched_idle(rq);
+		}
+		/*
+		 * OK, now we're absolutely sure @owner is on this
+		 * rq, therefore holding @rq->lock is sufficient to
+		 * guarantee its existence, as per ttwu_remote().
 		 */
-		return NULL; /* do pick_next_task again */
 	}
-	return proxy_deactivate(rq, donor);
+
+	WARN_ON_ONCE(owner && !owner->on_rq);
+	return owner;
 }
 #else /* SCHED_PROXY_EXEC */
 static struct task_struct *
@@ -6858,10 +6955,13 @@ static void __sched notrace __schedule(int sched_mode)
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
index da8b0970c6655..b67c3b44c7b4d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9407,6 +9407,7 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	 * 3) cannot be migrated to this CPU due to cpus_ptr, or
 	 * 4) running (obviously), or
 	 * 5) are cache-hot on their current CPU.
+	 * 6) are blocked on mutexes (if SCHED_PROXY_EXEC is enabled)
 	 */
 	if ((p->se.sched_delayed) && (env->migration_type != migrate_load))
 		return 0;
@@ -9428,6 +9429,9 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	if (kthread_is_per_cpu(p))
 		return 0;
 
+	if (task_is_blocked(p))
+		return 0;
+
 	if (!cpumask_test_cpu(env->dst_cpu, p->cpus_ptr)) {
 		int cpu;
 
@@ -9463,7 +9467,8 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	/* Record that we found at least one task that could run on dst_cpu */
 	env->flags &= ~LBF_ALL_PINNED;
 
-	if (task_on_cpu(env->src_rq, p)) {
+	if (task_on_cpu(env->src_rq, p) ||
+	    task_current_donor(env->src_rq, p)) {
 		schedstat_inc(p->stats.nr_failed_migrations_running);
 		return 0;
 	}
@@ -9507,6 +9512,9 @@ static void detach_task(struct task_struct *p, struct lb_env *env)
 		schedstat_inc(p->stats.nr_forced_migrations);
 	}
 
+	WARN_ON(task_current(env->src_rq, p));
+	WARN_ON(task_current_donor(env->src_rq, p));
+
 	deactivate_task(env->src_rq, p, DEQUEUE_NOCLOCK);
 	set_task_cpu(p, env->dst_cpu);
 }
-- 
2.49.0.604.gff1f9ca942-goog

