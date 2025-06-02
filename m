Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A497253925
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902215; cv=none; b=XXjWuwKHJ5KbUc25dGxPHFtwclXubDmvg7QPhe1HjJtNxZidGP2shZCEIPKlSvCipB8Znoy3EJ3Q65wvxaMZvm/h2DgzEL3xjEAMvJr2R0GRq86qmJLCEN1M45F+ay8DJSWiPoZ7ahGeIQb65NMTAfTT+8SMxMFFrd9N4jP8Mcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902215; c=relaxed/simple;
	bh=OkTokFNzR+LTbaIJWldwGZ6txslRJOqJ0K87LQ2wW/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mEBWGDPK45uqC9764Wl198m2RYBXFCYaLRdiDCw/1fwO02kmsAjk1xT+2zN0PF0/n9n75h9uWd5v4gAI6mVl2S7jJOa6T29Mg/aEoSuCy04BHKvlwQYQS70cSFM7yGGXKn2FqXkJXpGnb7XLTuYlvgqMBxurf6xziwSmJpGKcoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sl89SrbW; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sl89SrbW"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-747dd44048cso1534732b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748902212; x=1749507012; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sC/PRtt/GMghRvne2VHFN9fc1yA9k6PjaGt1peEfjQ=;
        b=sl89SrbWQxHXmB18DuPwQWGWOMa9inli4d7BYl9JfttwuI7Mkm/5DEitktQnWs9Szz
         2nRlPAHNV1J0G92IsUpDUXwRaYtjpHh5MdrVESq3bSUoW4oHLlB8Up+BNqZknlqQlqE5
         MnWRtc5WTPkQvdTlwuAs5qJo8N/sfcmV3YRGt+/fQdmx7dioWCTHEWtC9pkS82AKV7Tu
         CronhRPeuGO84WjKp6ujMMRJyr8nALhy/oXqlfN8GIqAXEXZL8xMbWCV4o9peGzFcmOZ
         utHLmKKQR+7BhVexh5OeTNM9pKRV3RgKSgH+zwawbp0+Ztu7ZdPIZmul4e7PfIv+Djy4
         5fEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902212; x=1749507012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2sC/PRtt/GMghRvne2VHFN9fc1yA9k6PjaGt1peEfjQ=;
        b=ijZ7Uln46gvzR1Ztjz/TKFUKi+42Ksjl+t3o3BYOJx5jI6o9BLTspNbNWgC4m/ffoY
         ET/5xF7iNti0GYw6SHKnGZpJ5uiV6WjYPRCSeBRN2t9450/U2sjkULRfxqWYPShgVKzB
         8p+8Oo2r5gjdUOBD+jEn6DPovaBK8PTBmB9yugPWm/sK9RaXvjvbGu6M6EMGTBBL7RY4
         gliNYemQ8UcbbuSZSUOw7dnjHorhqga5faO7JKHB1yDJKf+RtLuup2Leo8Lbmn2y1d6a
         +HhNeK6iYUrDG0GHg08tPLdszgqEEeyG5Z2paC4rLTc3nEgIwedRjhBnnWVRs2BCGFSw
         /iww==
X-Gm-Message-State: AOJu0YwBQyriDUyKYs+rZkM/HBotuYAsWoBbAuM+hB3yGxU+tJ9i5v1d
	XEK0xZVdbU/8XBtClcfDmGMoDdnCmmsfiZkDZ9drBUxnPCExRJsvF/IenuG/s/7RGyivFw1XvOn
	yv2KpOv0H/JS/UI0VA3OXV8TwD6qzAX/JEhOwydx3yel9HD1FpsNeTR9HUG8TtfAwZ1HrUHUSN/
	dt4wWdNx9SgQ3qxeOyYwWobuTGgyA7KqjUdhO2QmnAhpTjw0An
X-Google-Smtp-Source: AGHT+IHvp0410Sj38/s1im9oXm2RDdvYFiuB0p4E/ZBPsdhlxpaPfet3zRpavKUfmuTPdMx1ZvRozcZ2zp8V
X-Received: from pfqn13.prod.google.com ([2002:aa7:984d:0:b0:746:2f7e:f86d])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a10e:b0:21a:de8e:5e6d
 with SMTP id adf61e73a8af0-21adff3c891mr21263992637.8.1748902211805; Mon, 02
 Jun 2025 15:10:11 -0700 (PDT)
Date: Mon,  2 Jun 2025 22:09:50 +0000
In-Reply-To: <20250602221004.3837674-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602221004.3837674-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602221004.3837674-4-jstultz@google.com>
Subject: [RESEND][PATCH v17 3/8] locking/mutex: Add p->blocked_on wrappers for
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
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
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
Cc: kernel-team@android.com
---
 include/linux/sched.h        | 54 ++++++++++++++++++++++++++++++++++--
 kernel/locking/mutex-debug.c |  4 +--
 kernel/locking/mutex.c       | 32 ++++++++++-----------
 kernel/locking/ww_mutex.h    |  6 ++--
 4 files changed, 70 insertions(+), 26 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 10be203ddb7e1..37c081be30ca6 100644
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
@@ -2181,6 +2182,57 @@ extern int __cond_resched_rwlock_write(rwlock_t *lock);
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
@@ -2220,8 +2272,6 @@ extern bool sched_task_on_rq(struct task_struct *p);
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
index 5243e59d75f40..ec39abbaae85a 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -643,8 +643,7 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 			goto err_early_kill;
 	}
 
-	WARN_ON(current->blocked_on);
-	current->blocked_on = lock;
+	__set_task_blocked_on(current, lock);
 	set_current_state(state);
 	trace_contention_begin(lock, LCB_F_MUTEX);
 	for (;;) {
@@ -684,9 +683,9 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
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
@@ -698,11 +697,15 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 
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
 
@@ -710,7 +713,7 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 	}
 	raw_spin_lock_irqsave(&lock->wait_lock, flags);
 acquired:
-	current->blocked_on = NULL;
+	__clear_task_blocked_on(current, lock);
 	__set_current_state(TASK_RUNNING);
 
 	if (ww_ctx) {
@@ -740,11 +743,11 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
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
@@ -954,14 +957,7 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
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
2.49.0.1204.g71687c7c1d-goog

