Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502B92522B6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902213; cv=none; b=Qmrm4a0My7t1zcAam8QnES02fIHOiy7/ApI4eZ1r5hfAX2mFLK1vEj8npEEwSYAGrIW3uiWUsnPjehXMcwTNB4zMtuGNpfYDmAaUsrjTUSzMGfhqth4ul+IpNwK8LXFmYEoULqIaYpNmK7qkiYBU/sIuDyi+FcE6fk8SYYUX/Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902213; c=relaxed/simple;
	bh=uRY0cQWoM59QIz6zSlqMmRUgY8LuuDxNZUVGNCDLDMI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WiaoyXZtPW6M/kqBjylzbnCMJWBTllWZtw/Y+Dfs32d7lWpIUsV517LqYqWNNopLN2g0LYKJORsqbi+4bAERI8QtABtvb8624VV8Y8Nj3txnOM13HaKSnhqRndz1cK0e/G3By2Ol/2a3t3s0CLVZqz8NGxLJ8IbDVYLdc+k60zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CBCRJ1Fq; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CBCRJ1Fq"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742a969a4d0so4186043b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748902210; x=1749507010; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=31IrVhlTatvJPgj99Y0CaQAyNBtXvroxsdzRXQrW1lo=;
        b=CBCRJ1FqdsyVI7qdRxS5JeXYt5Xb51XLJQmt/+68B0PFX+no/sPZLFNiRLHUYuIoRt
         Gx1UOvqigYA93m28oyOuAEmzTIhdtWlHF5tfH76rO7c7qglsr5mAYpokLJcCq5tjSPJ9
         7+uyEimRicGh4yEU2fWceyA9QUN3q8hjF/DGA/cLNcBOAzsiNXKYY/hGG8RbWeZclEPR
         3TVpE4Pcqe6i/wjMTBfBkSbXHxzIjJKR7P+DTYSNvKAN1gb1omjVgjizIB+2gCajvCbI
         Tnn46vYLtoQEnaa/LtumGB+QWL4Z5AFvrrTQ07M8n0GQTHKAoyE1hAJvCB8+zNGK855D
         H1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902210; x=1749507010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31IrVhlTatvJPgj99Y0CaQAyNBtXvroxsdzRXQrW1lo=;
        b=X1L9MIqkD7649XBeDuXogNUpA10VDE4V4E/6NAV1y2EqDt7YL/nhttk0BONbBoBUHw
         CSrXsv5MbcD5eIypvmXaBUqX5n3MrahvhqlsRqTaYJT5Dra6nsBP1hqIw7LNvRJ/TnM8
         INH71XrrjIP/DRot5y8Wb5pZm1lu5bG+cRdRYDzP5VOn9KxJdQNICKZ4d5KsybjwnASU
         SUFzvnwCkPLACmXrIyCKMcrwRnS8cozCDSQr3Im1btMD17t7CXMc7k2MlL2HNGJdpu1C
         oA5wHgDBDRJx9weGFIJhvaDbmJu3jVwdQ/t6nEhRMri8UBBNLifNjTU2EDBMXTc0rh9X
         pFiw==
X-Gm-Message-State: AOJu0Yy12j4L1+eWUAdPi6LBnBN47WbbWiGU/9zuOUR+wM+FaHNewxe8
	LZ72qBbe+IMc8XDt95ULPH16pEkZXiArrbWkPGZul3MyZBY41XjXP5Qerx+c/wNRfzveH/WPo7B
	7z2GueSkWEVemJ+fuGgRY/UkJSVWMq3qFWqeTufeYj0ZK/KrI4oNdGSR2BHtBtLxmM52bqOnXAa
	AcQXn+LJX5uHvBu8pfTXyDEQC3nPeNmHcSdzR710uMsDaKSlMZ
X-Google-Smtp-Source: AGHT+IFCLiQ/NlgzF0UXjQYROZ1e6GC0b+XsfSMROghy7Q4pZeXQsVbd9vaSUVP1bvvA4VP+MbBXAh1ozgyG
X-Received: from pfiy15.prod.google.com ([2002:a05:6a00:190f:b0:747:9faf:ed39])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:218c:b0:742:a02e:dd8d
 with SMTP id d2e1a72fcca58-747d1ab07b7mr13818022b3a.20.1748902210380; Mon, 02
 Jun 2025 15:10:10 -0700 (PDT)
Date: Mon,  2 Jun 2025 22:09:49 +0000
In-Reply-To: <20250602221004.3837674-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602221004.3837674-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602221004.3837674-3-jstultz@google.com>
Subject: [RESEND][PATCH v17 2/8] locking/mutex: Rework task_struct::blocked_on
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	"Connor O'Brien" <connoro@google.com>, John Stultz <jstultz@google.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Ingo Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

From: Peter Zijlstra <peterz@infradead.org>

Track the blocked-on relation for mutexes, to allow following this
relation at schedule time.

   task
     | blocked-on
     v
   mutex
     | owner
     v
   task

This all will be used for tracking blocked-task/mutex chains
with the prox-execution patch in a similar fashion to how
priority inheritance is done with rt_mutexes.

For serialization, blocked-on is only set by the task itself
(current). And both when setting or clearing (potentially by
others), is done while holding the mutex::wait_lock.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
[minor changes while rebasing]
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Connor O'Brien <connoro@google.com>
[jstultz: Fix blocked_on tracking in __mutex_lock_common in error paths]
Signed-off-by: John Stultz <jstultz@google.com>
---
v2:
* Fixed blocked_on tracking in error paths that was causing crashes
v4:
* Ensure we clear blocked_on when waking ww_mutexes to die or wound.
  This is critical so we don't get circular blocked_on relationships
  that can't be resolved.
v5:
* Fix potential bug where the skip_wait path might clear blocked_on
  when that path never set it
* Slight tweaks to where we set blocked_on to make it consistent,
  along with extra WARN_ON correctness checking
* Minor comment changes
v7:
* Minor commit message change suggested by Metin Kaya
* Fix WARN_ON conditionals in unlock path (as blocked_on might already
  be cleared), found while looking at issue Metin Kaya raised.
* Minor tweaks to be consistent in what we do under the
  blocked_on lock, also tweaked variable name to avoid confusion
  with label, and comment typos, as suggested by Metin Kaya
* Minor tweak for CONFIG_SCHED_PROXY_EXEC name change
* Moved unused block of code to later in the series, as suggested
  by Metin Kaya
* Switch to a tri-state to be able to distinguish from waking and
  runnable so we can later safely do return migration from ttwu
* Folded together with related blocked_on changes
v8:
* Fix issue leaving task BO_BLOCKED when calling into optimistic
  spinning path.
* Include helper to better handle BO_BLOCKED->BO_WAKING transitions
v9:
* Typo fixup pointed out by Metin
* Cleanup BO_WAKING->BO_RUNNABLE transitions for the !proxy case
* Many cleanups and simplifications suggested by Metin
v11:
* Whitespace fixup pointed out by Metin
v13:
* Refactor set_blocked_on helpers clean things up a bit
v14:
* Small build fixup with PREEMPT_RT
v15:
* Improve consistency of names for functions that assume blocked_lock
  is held, as suggested by Peter
* Use guard instead of separate spinlock/unlock calls, also suggested
  by Peter
* Drop blocked_on_state tri-state for now, as its not needed until
  later in the series, when we get to proxy-migration and return-
  migration.
v16:
* Clear blocked on before optimistic spinning

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
 include/linux/sched.h        |  5 +----
 kernel/fork.c                |  3 +--
 kernel/locking/mutex-debug.c |  9 +++++----
 kernel/locking/mutex.c       | 22 ++++++++++++++++++++++
 kernel/locking/ww_mutex.h    | 18 ++++++++++++++++--
 5 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 3cdd598aaa9aa..10be203ddb7e1 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1234,10 +1234,7 @@ struct task_struct {
 	struct rt_mutex_waiter		*pi_blocked_on;
 #endif
 
-#ifdef CONFIG_DEBUG_MUTEXES
-	/* Mutex deadlock detection: */
-	struct mutex_waiter		*blocked_on;
-#endif
+	struct mutex			*blocked_on;	/* lock we're blocked on */
 
 #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
 	struct mutex			*blocker_mutex;
diff --git a/kernel/fork.c b/kernel/fork.c
index c4b26cd8998b8..3455ab283482e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2383,9 +2383,8 @@ __latent_entropy struct task_struct *copy_process(
 	lockdep_init_task(p);
 #endif
 
-#ifdef CONFIG_DEBUG_MUTEXES
 	p->blocked_on = NULL; /* not blocked yet */
-#endif
+
 #ifdef CONFIG_BCACHE
 	p->sequential_io	= 0;
 	p->sequential_io_avg	= 0;
diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
index 6e6f6071cfa27..758b7a6792b0c 100644
--- a/kernel/locking/mutex-debug.c
+++ b/kernel/locking/mutex-debug.c
@@ -53,17 +53,18 @@ void debug_mutex_add_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 {
 	lockdep_assert_held(&lock->wait_lock);
 
-	/* Mark the current thread as blocked on the lock: */
-	task->blocked_on = waiter;
+	/* Current thread can't be already blocked (since it's executing!) */
+	DEBUG_LOCKS_WARN_ON(task->blocked_on);
 }
 
 void debug_mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 			 struct task_struct *task)
 {
+	struct mutex *blocked_on = READ_ONCE(task->blocked_on);
+
 	DEBUG_LOCKS_WARN_ON(list_empty(&waiter->list));
 	DEBUG_LOCKS_WARN_ON(waiter->task != task);
-	DEBUG_LOCKS_WARN_ON(task->blocked_on != waiter);
-	task->blocked_on = NULL;
+	DEBUG_LOCKS_WARN_ON(blocked_on && blocked_on != lock);
 
 	INIT_LIST_HEAD(&waiter->list);
 	waiter->task = NULL;
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 555e2b3a665a3..5243e59d75f40 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -643,6 +643,8 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 			goto err_early_kill;
 	}
 
+	WARN_ON(current->blocked_on);
+	current->blocked_on = lock;
 	set_current_state(state);
 	trace_contention_begin(lock, LCB_F_MUTEX);
 	for (;;) {
@@ -679,6 +681,12 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 
 		first = __mutex_waiter_is_first(lock, &waiter);
 
+		/*
+		 * As we likely have been woken up by task
+		 * that has cleared our blocked_on state, re-set
+		 * it to the lock we are trying to aquire.
+		 */
+		current->blocked_on = lock;
 		set_current_state(state);
 		/*
 		 * Here we order against unlock; we must either see it change
@@ -690,8 +698,11 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 
 		if (first) {
 			trace_contention_begin(lock, LCB_F_MUTEX | LCB_F_SPIN);
+			/* clear blocked_on as mutex_optimistic_spin may schedule() */
+			current->blocked_on = NULL;
 			if (mutex_optimistic_spin(lock, ww_ctx, &waiter))
 				break;
+			current->blocked_on = lock;
 			trace_contention_begin(lock, LCB_F_MUTEX);
 		}
 
@@ -699,6 +710,7 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 	}
 	raw_spin_lock_irqsave(&lock->wait_lock, flags);
 acquired:
+	current->blocked_on = NULL;
 	__set_current_state(TASK_RUNNING);
 
 	if (ww_ctx) {
@@ -728,9 +740,11 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 	return 0;
 
 err:
+	current->blocked_on = NULL;
 	__set_current_state(TASK_RUNNING);
 	__mutex_remove_waiter(lock, &waiter);
 err_early_kill:
+	WARN_ON(current->blocked_on);
 	trace_contention_end(lock, ret);
 	raw_spin_unlock_irqrestore_wake(&lock->wait_lock, flags, &wake_q);
 	debug_mutex_free_waiter(&waiter);
@@ -940,6 +954,14 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 		next = waiter->task;
 
 		debug_mutex_wake_waiter(lock, waiter);
+		/*
+		 * Unlock wakeups can be happening in parallel
+		 * (when optimistic spinners steal and release
+		 * the lock), so blocked_on may already be
+		 * cleared here.
+		 */
+		WARN_ON(next->blocked_on && next->blocked_on != lock);
+		next->blocked_on = NULL;
 		wake_q_add(&wake_q, next);
 	}
 
diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
index 37f025a096c9d..00db40946328e 100644
--- a/kernel/locking/ww_mutex.h
+++ b/kernel/locking/ww_mutex.h
@@ -284,6 +284,14 @@ __ww_mutex_die(struct MUTEX *lock, struct MUTEX_WAITER *waiter,
 #ifndef WW_RT
 		debug_mutex_wake_waiter(lock, waiter);
 #endif
+		/*
+		 * When waking up the task to die, be sure to clear the
+		 * blocked_on pointer. Otherwise we can see circular
+		 * blocked_on relationships that can't resolve.
+		 */
+		WARN_ON(waiter->task->blocked_on &&
+			waiter->task->blocked_on != lock);
+		waiter->task->blocked_on = NULL;
 		wake_q_add(wake_q, waiter->task);
 	}
 
@@ -331,9 +339,15 @@ static bool __ww_mutex_wound(struct MUTEX *lock,
 		 * it's wounded in __ww_mutex_check_kill() or has a
 		 * wakeup pending to re-read the wounded state.
 		 */
-		if (owner != current)
+		if (owner != current) {
+			/*
+			 * When waking up the task to wound, be sure to clear the
+			 * blocked_on pointer. Otherwise we can see circular
+			 * blocked_on relationships that can't resolve.
+			 */
+			owner->blocked_on = NULL;
 			wake_q_add(wake_q, owner);
-
+		}
 		return true;
 	}
 
-- 
2.49.0.1204.g71687c7c1d-goog

