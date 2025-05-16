Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50178257AFE
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365512; cv=none; b=nR+19fFRFgZ40WG8nWbGgf36Vzf7dI7z0+p6TMitMX7Kbn4oCnRYQJ75d51eTUwUSVr9I7SUB2xOoYhx+9uZ1USoouzlqjvcahtsSBQCYXylebenDUIeu+FLtoL5cwynwx6FW1gXd3uWmfTL82ljLCicezFwhSDFHBtsOpFkAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365512; c=relaxed/simple;
	bh=xckFht0Ehvq+JkG0kswLIAeaWhyY85f3EyNoE7l4WYA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aejEvJ/7tscBVhoidAP853slGZNIptSpxWunpdNVT6zsksWzdQXKKf0CwKyQBAe4326jEwiKogBGh/TKRVYXRP26nCGBNrQbvd1TBoaUqvLRK6+P0Ys6JxkB2B/ttX323yVdpd8Ma0lAc2L6o/s27ceyhIkMLRdEsrxHP9y4BrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LRDKfMzV; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LRDKfMzV"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231d7f590ffso2937545ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747365509; x=1747970309; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lz5zBZhQmqgS0FJIOSwAiVkfeTBjk3eOu4DJCrXNzwY=;
        b=LRDKfMzVHxEQLiyRBRVIZNLZ4JsC7MOgB9T8VTFiaFo1bek2IQde/WpWrY3WR1zGyL
         gvVhLlwQpOovesqdkT+hYBHrvukW6bD3Ngd9ysV0IfzibOlbtRMOas5Yyx9jA2WNdqJb
         TJtObJ50xvYPQY3USrsjJPluUbUZq6bI7gQ9vi/BnI9PRQyYMLibM7QYH5+FzQKXMDhY
         kRE8DzQjQF7pRMOWeNf3fEjMd6vJnBbWi4ljrttO9TvXggdq7peW618kkXwH3CrvFsze
         WyQsjfayjfb4UTvZpA1qqLHVerKhgsLVyjB/05jY1+2t/TZhfwmno0gugjQ4bEP2r6SW
         ge9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747365509; x=1747970309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lz5zBZhQmqgS0FJIOSwAiVkfeTBjk3eOu4DJCrXNzwY=;
        b=tzzmHaMKs9+ZN5cdLBEMcFimPEflDzrfalx9GIpTxyGpHznTZ9fidoUWEUwueMXjvy
         6fmpGgdKzaKM1SYED3ACUIc4UTmJi3WvUPX4DKhQD6JpaTKxZfMFwCHWqveDdU0QsvIr
         XdwUMZ+dWEmCWH3YwEVbOphmh6YDBR0zfDR+GFTmHQmTnuy6P/gjqGbAFqHoeDF/p3o9
         NR0s+OpMSu0wcrM9kCENFfOi6gKjfXlaXhmxN4nNsPblQH5naZUki8S4XijyZxJJDyFa
         BND0DCgmYXjCIv8sWUhbd4I3gsExvT2aPRUMAz6BIWP8UVfmryTBhizLNCILcHg8pl7R
         HqZw==
X-Gm-Message-State: AOJu0YxXQl2+UvQLXotJE9jyx8Ph+3nYwQWcwmIGFSqj+Ya5IEwrNyCL
	r0o9aYPQ4aIxrHA+Sv8oQb/dniO0KtMcAm0Sa2bWUI8d7reQk6h7tCX/faqr8sBpyna4yQzjaM0
	MAsbDwotcGzP66DUQH+5OjHKTMeLKL4YIT60QL4N7D0WNFO/3BaNmnbmu32CFBbMVCRt3YusMl5
	PFBa1EmuoKHI6/Clvavh9aIt0FT/Cg2euSRMhrGldeHftFyWsd
X-Google-Smtp-Source: AGHT+IFD637/IxYNkL3FgAdmMGIf0cp7ie7cBcDPsYCGsw+W3kTV/p8Q2PsgVuah6Fp9mHomhq2dckFbLsuc
X-Received: from plgp6.prod.google.com ([2002:a17:902:ebc6:b0:22c:31a0:b350])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:17c4:b0:231:c6be:19a5
 with SMTP id d9443c01a7336-231de31d6d3mr10476905ad.27.1747365509420; Thu, 15
 May 2025 20:18:29 -0700 (PDT)
Date: Fri, 16 May 2025 03:17:55 +0000
In-Reply-To: <20250516031814.1870508-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516031814.1870508-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516031814.1870508-9-jstultz@google.com>
Subject: [PATCH v17 8/8] sched: Start blocked_on chain processing in find_proxy_task()
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
2.49.0.1101.gccaa498523-goog

