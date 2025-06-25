Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAF92DECC1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883485; cv=none; b=rQ7P/0SJyt6dpPl22aTX6IDJElyT8s4IMIi0NwbwjC5p4MhkkL67L2x8ZbpxagKLBYIMVZg4DVnIjQrnwOU/lFdhLm4Fnr6hfZKUwQwtmOCIxIOSAvVdYkm6bawtK+d1HAxlcujWIp8duDh+JYk2Kjg6VU0ZVfskTKTEoIRkcr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883485; c=relaxed/simple;
	bh=W+qmZSIaHerBC6mMLl7PYab0nmLTysV/UsZpoTQGwms=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qM7Ol8wEinIIem+n/OxTCiiabppVTk6DzSDz8RolEp0TcqLLPwleMMZnSrio6DbjFgKNzRfbdwvl/2AoM3O4/YClNnTG87br//a8pt1uHD0vlsL+bLuaohg6Uy61WFSLn4owfIWpWYyH1hA0iiCsu/ar5R7aEfJSAEzx2vz0eu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZLzz8OK4; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZLzz8OK4"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b31f112c90aso191708a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750883482; x=1751488282; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8i/fLaJcfoOBu+GE99WreXdg0Kg5hxNU37Cftd/kbl0=;
        b=ZLzz8OK4/1PhZ+qla4amjqZuAmySP1yG4lR7edGW6W00WCgOzum13LRmeRWQhYDDIE
         zSpr4C8v8SAmt86Mt7pqTcyQQnO4qWK/6xOBtUdJ3Xpy66wK/Mu3q/IAKUKgCVJOQfDT
         RqFP6tDHsnXZv8AsHXtvTtnirIxFqd2024d/+axXPhKkT9nidzvL3q6MEpgWz9E//6pH
         in6N60CE05QtCuMShhGwU4fIXF9+uVcIRc2QtB63JeJgsr3koPd3GZpMCzZC/zUVEJVV
         0KlqEogTea6sTpgDgBq6xdMuNAvR5Vm6CI42hQ8JChd1QQENeQ0PrCw1Y25P/AGITuI0
         Sv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750883482; x=1751488282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8i/fLaJcfoOBu+GE99WreXdg0Kg5hxNU37Cftd/kbl0=;
        b=u5cawpWQkKQ9LFRLYQMzAUSF29Xl1PaT2ryGCSsp+xGAv8qMf/u6TU893EdKNev/JO
         tXVf6+3z9nvHhWPlXOpjNXJnxr9b4nwYeIGaD79cQg5UD3Y638QTZFNJklQXj/AC/VOm
         oGXRLSNqjU1vu/xE8EWQFgCYs2snvTnB8jGo/yNFd6oY8buv/OJUPT8cNZ5ZDRcleH1u
         QRDxWrOaVgriH7c+uhRxgB6hnMV9eV+OsSrh9oyZS5q83om4W7ABr486GMdMfc3UH2ZQ
         DEzqj6UoS5McAdE+8MZgatn7R/ckNfoleZS9qlVn0XDY+X7ln52VAtybI9tiIMuT4zoW
         UsyQ==
X-Gm-Message-State: AOJu0YwVeIeZ/ImK+jvuIRRSnlZsPkCjGoBPv13jpM5J/pAuj7JAz2Ai
	6IYjx8btDaAKbioWJJzUSuDFgPRDvpxtaf4kBTFc1hjE6mdhsRuxQNUyCHsH0YnXNNb/eSzI/Pj
	1DVW5UmX0INhIkFH5D8yL8cAJE2VTsPRZCluEZIgUNN90Dz0shytaHU8T9TyNJjlEmIEAzJnk3r
	NRpwvcr2C7C0rhs7O/IL+XsNM/B1YsFs1VDZc2XEf1AJf4toe0
X-Google-Smtp-Source: AGHT+IHWEW7MnrGP8BNZ0jkqVpfSLJoF00onsFnffYMQy+IlxrmpUPVdQV7hWQVFIu03Lgnxan9LyfUj7FRQ
X-Received: from pfqf28.prod.google.com ([2002:aa7:9d9c:0:b0:73c:29d8:b795])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a11a:b0:1f3:20be:c18a
 with SMTP id adf61e73a8af0-2208d0ec8d6mr1160715637.10.1750883482137; Wed, 25
 Jun 2025 13:31:22 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:30:56 +0000
In-Reply-To: <20250625203110.2299275-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250625203110.2299275-1-jstultz@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250625203110.2299275-4-jstultz@google.com>
Subject: [PATCH v18 3/8] locking/mutex: Add p->blocked_on wrappers for
 correctness checks
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>, "Connor O'Brien" <connoro@google.com>, 
	John Stultz <jstultz@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
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

From: Valentin Schneider <valentin.schneider@arm.com>

This lets us assert mutex::wait_lock is held whenever we access
p->blocked_on, as well as warn us for unexpected state changes.

Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
[fix conflicts, call in more places]
Signed-off-by: Connor O'Brien <connoro@google.com>
[jstultz: tweaked commit subject, reworked a good bit]
Signed-off-by: John Stultz <jstultz@google.com>
---
v2:
* Added get_task_blocked_on() accessor
v4:
* Address READ_ONCE usage that was dropped in v2
* Reordered to be a later add on to the main patch series as
  Peter was unhappy with similar wrappers in other patches.
v5:
* Added some extra correctness checking in wrappers
v7:
* Tweaks to reorder this change in the patch series
* Minor cleanup to set_task_blocked_on() suggested by Metin Kaya
v15:
* Split out into its own patch again.
* Further improve assumption checks in helpers.
v16:
* Fix optimistic spin case that can call schedule()
v17:
* Fix typos caught by Metin Kaya
* Add lockdep_assert_held_once and drop the READ_ONCE in
  __get_task_blocked_on(), as suggested by Juri Lelli

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
 include/linux/sched.h        | 54 ++++++++++++++++++++++++++++++++++--
 kernel/locking/mutex-debug.c |  4 +--
 kernel/locking/mutex.c       | 32 ++++++++++-----------
 kernel/locking/ww_mutex.h    |  6 ++--
 4 files changed, 70 insertions(+), 26 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index aa7966141a090..1d7f625adbb5e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -34,6 +34,7 @@
 #include <linux/sched/prio.h>
 #include <linux/sched/types.h>
 #include <linux/signal_types.h>
+#include <linux/spinlock.h>
 #include <linux/syscall_user_dispatch_types.h>
 #include <linux/mm_types_task.h>
 #include <linux/netdevice_xmit.h>
@@ -2177,6 +2178,57 @@ extern int __cond_resched_rwlock_write(rwlock_t *lock);
 	__cond_resched_rwlock_write(lock);					\
 })
 
+static inline void __set_task_blocked_on(struct task_struct *p, struct mutex *m)
+{
+	WARN_ON_ONCE(!m);
+	/* The task should only be setting itself as blocked */
+	WARN_ON_ONCE(p != current);
+	/* Currently we serialize blocked_on under the mutex::wait_lock */
+	lockdep_assert_held_once(&m->wait_lock);
+	/*
+	 * Check ensure we don't overwrite existing mutex value
+	 * with a different mutex. Note, setting it to the same
+	 * lock repeatedly is ok.
+	 */
+	WARN_ON_ONCE(p->blocked_on && p->blocked_on != m);
+	p->blocked_on = m;
+}
+
+static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
+{
+	guard(raw_spinlock_irqsave)(&m->wait_lock);
+	__set_task_blocked_on(p, m);
+}
+
+static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *m)
+{
+	WARN_ON_ONCE(!m);
+	/* Currently we serialize blocked_on under the mutex::wait_lock */
+	lockdep_assert_held_once(&m->wait_lock);
+	/*
+	 * There may be cases where we re-clear already cleared
+	 * blocked_on relationships, but make sure we are not
+	 * clearing the relationship with a different lock.
+	 */
+	WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
+	p->blocked_on = NULL;
+}
+
+static inline void clear_task_blocked_on(struct task_struct *p, struct mutex *m)
+{
+	guard(raw_spinlock_irqsave)(&m->wait_lock);
+	__clear_task_blocked_on(p, m);
+}
+
+static inline struct mutex *__get_task_blocked_on(struct task_struct *p)
+{
+	struct mutex *m = p->blocked_on;
+
+	if (m)
+		lockdep_assert_held_once(&m->wait_lock);
+	return m;
+}
+
 static __always_inline bool need_resched(void)
 {
 	return unlikely(tif_need_resched());
@@ -2216,8 +2268,6 @@ extern bool sched_task_on_rq(struct task_struct *p);
 extern unsigned long get_wchan(struct task_struct *p);
 extern struct task_struct *cpu_curr_snapshot(int cpu);
 
-#include <linux/spinlock.h>
-
 /*
  * In order to reduce various lock holder preemption latencies provide an
  * interface to see if a vCPU is currently running or not.
diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
index 758b7a6792b0c..949103fd8e9b5 100644
--- a/kernel/locking/mutex-debug.c
+++ b/kernel/locking/mutex-debug.c
@@ -54,13 +54,13 @@ void debug_mutex_add_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 	lockdep_assert_held(&lock->wait_lock);
 
 	/* Current thread can't be already blocked (since it's executing!) */
-	DEBUG_LOCKS_WARN_ON(task->blocked_on);
+	DEBUG_LOCKS_WARN_ON(__get_task_blocked_on(task));
 }
 
 void debug_mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 			 struct task_struct *task)
 {
-	struct mutex *blocked_on = READ_ONCE(task->blocked_on);
+	struct mutex *blocked_on = __get_task_blocked_on(task);
 
 	DEBUG_LOCKS_WARN_ON(list_empty(&waiter->list));
 	DEBUG_LOCKS_WARN_ON(waiter->task != task);
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index e2f59863a866e..80d778fedd605 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -644,8 +644,7 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 			goto err_early_kill;
 	}
 
-	WARN_ON(current->blocked_on);
-	current->blocked_on = lock;
+	__set_task_blocked_on(current, lock);
 	set_current_state(state);
 	trace_contention_begin(lock, LCB_F_MUTEX);
 	for (;;) {
@@ -685,9 +684,9 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 		/*
 		 * As we likely have been woken up by task
 		 * that has cleared our blocked_on state, re-set
-		 * it to the lock we are trying to aquire.
+		 * it to the lock we are trying to acquire.
 		 */
-		current->blocked_on = lock;
+		set_task_blocked_on(current, lock);
 		set_current_state(state);
 		/*
 		 * Here we order against unlock; we must either see it change
@@ -699,11 +698,15 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 
 		if (first) {
 			trace_contention_begin(lock, LCB_F_MUTEX | LCB_F_SPIN);
-			/* clear blocked_on as mutex_optimistic_spin may schedule() */
-			current->blocked_on = NULL;
+			/*
+			 * mutex_optimistic_spin() can call schedule(), so
+			 * clear blocked on so we don't become unselectable
+			 * to run.
+			 */
+			clear_task_blocked_on(current, lock);
 			if (mutex_optimistic_spin(lock, ww_ctx, &waiter))
 				break;
-			current->blocked_on = lock;
+			set_task_blocked_on(current, lock);
 			trace_contention_begin(lock, LCB_F_MUTEX);
 		}
 
@@ -711,7 +714,7 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 	}
 	raw_spin_lock_irqsave(&lock->wait_lock, flags);
 acquired:
-	current->blocked_on = NULL;
+	__clear_task_blocked_on(current, lock);
 	__set_current_state(TASK_RUNNING);
 
 	if (ww_ctx) {
@@ -741,11 +744,11 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 	return 0;
 
 err:
-	current->blocked_on = NULL;
+	__clear_task_blocked_on(current, lock);
 	__set_current_state(TASK_RUNNING);
 	__mutex_remove_waiter(lock, &waiter);
 err_early_kill:
-	WARN_ON(current->blocked_on);
+	WARN_ON(__get_task_blocked_on(current));
 	trace_contention_end(lock, ret);
 	raw_spin_unlock_irqrestore_wake(&lock->wait_lock, flags, &wake_q);
 	debug_mutex_free_waiter(&waiter);
@@ -956,14 +959,7 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 		next = waiter->task;
 
 		debug_mutex_wake_waiter(lock, waiter);
-		/*
-		 * Unlock wakeups can be happening in parallel
-		 * (when optimistic spinners steal and release
-		 * the lock), so blocked_on may already be
-		 * cleared here.
-		 */
-		WARN_ON(next->blocked_on && next->blocked_on != lock);
-		next->blocked_on = NULL;
+		__clear_task_blocked_on(next, lock);
 		wake_q_add(&wake_q, next);
 	}
 
diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
index 00db40946328e..086fd5487ca77 100644
--- a/kernel/locking/ww_mutex.h
+++ b/kernel/locking/ww_mutex.h
@@ -289,9 +289,7 @@ __ww_mutex_die(struct MUTEX *lock, struct MUTEX_WAITER *waiter,
 		 * blocked_on pointer. Otherwise we can see circular
 		 * blocked_on relationships that can't resolve.
 		 */
-		WARN_ON(waiter->task->blocked_on &&
-			waiter->task->blocked_on != lock);
-		waiter->task->blocked_on = NULL;
+		__clear_task_blocked_on(waiter->task, lock);
 		wake_q_add(wake_q, waiter->task);
 	}
 
@@ -345,7 +343,7 @@ static bool __ww_mutex_wound(struct MUTEX *lock,
 			 * blocked_on pointer. Otherwise we can see circular
 			 * blocked_on relationships that can't resolve.
 			 */
-			owner->blocked_on = NULL;
+			__clear_task_blocked_on(owner, lock);
 			wake_q_add(wake_q, owner);
 		}
 		return true;
-- 
2.50.0.727.gbf7dc18ff4-goog

