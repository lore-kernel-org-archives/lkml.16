Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525125486A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902218; cv=none; b=R66cVXtVU8JJCvSrtBI5Ts5hG4R542+CfQY69f8S1+UxhTYLjNi6ft9Ye/1TVCAZ0vqXc+lqY7mmuOFCmLBSqUecxfM4HAJp53C1tEzZwPc9F+2TMHsqT7CMrkaIezZrHJ9NoXb67AE1PXbk3KeqF0yQOptA803a7cSi0Yh/IQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902218; c=relaxed/simple;
	bh=OuG7bgpuINTzi4M5PwFJbSBJPIUj78klN583dLZgJnI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nzk07e8cvg7BFCx8lqyPTculdjRbZu/nfrjjVEarDsVn03WTurc9nsL9gejeoIjWAN/Zj1AfP5crW8PaU7qwQBgrdioYuRIyTY8IyHQ7WsViYya7aeJHVyAGty8qqx05QMi4OGhfZV2tb7cCmQW2z07ZILIVUlhXFAB41Vzd4jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3f85FHue; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3f85FHue"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7377139d8b1so4101425b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748902216; x=1749507016; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=95Vx5WXV6yyOahsPjF279YVAJJvFpKRnSC5YDPXpSWE=;
        b=3f85FHueoJv4Rj/aRB515J9y+6sKjyY9MYxgLPfOPf7RqnWWLcsn63/57gquyC3J51
         QQh2RgxDNfFyVkg8ZZkOa6MnJLFBV5meVTUCe7ljYvUheKCRkuXtC8PXpd6wZImcvjs0
         tzZU23ul2IMGiHlOoV3V3C9q9dTXisn9CmPO6w5ySKsFXd6vEJuWTIwfOEWV+HAAqLxN
         nUThHJO8Szs6oQi5LzIyez4IHz3noZT3d4wtmCLBCtqJjjn56UC3DWGu7wN62bWUNrZY
         jUrfNhZN0bG7L3g0Gz7P2ZPwS0X3PkAIJQgphvbQz37zOXZZh3Kqp5YNJ1W/fqm4mDe7
         OBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902216; x=1749507016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95Vx5WXV6yyOahsPjF279YVAJJvFpKRnSC5YDPXpSWE=;
        b=LpOxeEXx47mF4/FY0FLIsARUXZoL+48aJHP0mEdVXAyWoU9pAE8iy+1sZKI0ZSQRVl
         BcqC+asU7/mujLpvFWDN9Di/PYkpkOgxTi8qv0ibBMFCB5SD5lpEA48BnHnFt57Em6oc
         ngzDpEW3DC2BKecDrdL2t3GVsa6W6THhVQs8kGQgt7917N19pku7UN20/q+2lL/8fV3Q
         j5MOGzKdqTEV2OWalsgL32uD/XIatpF53wXxk1a3vOo/bIi8UvvSUxascFrSSYjhq3K8
         dVimE6v2Z8B5dOCxx/3ybTMprACuhedKMgXOr2bB5KsYYrW3zFQPlSaQWpfywGwOKzv1
         uWhw==
X-Gm-Message-State: AOJu0YxrWBjSxtIA5oQNMbJJ5ctaROga00ujIIFNkjKALc5Aem92Xrlb
	pJfrUlWLQTo3QoMXVIieqS6mlYGwgZnUKWIB9HkggHi/hDFQ8pIpuM0e8g752nn4SC9xzBSHF7/
	5ezBGdZeEZSj7Mgo9l8WFZ8roFUpAFJB6070Du9qViMQhzj4vq/He5MFevVE1hp9Dd9xF+T3wrN
	TfahW1xTbgvHGoF3gCUhWpJlQShmR5PV86jw83NC8mRO4TdgEQ
X-Google-Smtp-Source: AGHT+IHk/bqbQfZ6oNzaFMnlZR/cY8E1jXnpoTLpyaaCXjlW3dYcKpfvDPrD/DoRxJywaYe6CDwixYdlO0cf
X-Received: from pgbdm14.prod.google.com ([2002:a05:6a02:d8e:b0:b2c:4f8e:b169])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:394b:b0:21a:efe7:168a
 with SMTP id adf61e73a8af0-21ba10663a1mr14987986637.8.1748902215930; Mon, 02
 Jun 2025 15:10:15 -0700 (PDT)
Date: Mon,  2 Jun 2025 22:09:53 +0000
In-Reply-To: <20250602221004.3837674-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602221004.3837674-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602221004.3837674-7-jstultz@google.com>
Subject: [RESEND][PATCH v17 6/8] sched: Add an initial sketch of the
 find_proxy_task() function
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
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

Add a find_proxy_task() function which doesn't do much.

When we select a blocked task to run, we will just deactivate it
and pick again. The exception being if it has become unblocked
after find_proxy_task() was called.

This allows us to validate keeping blocked tasks on the runqueue
and later deactivating them is working ok, stressing the failure
cases for when a proxy isn't found.

Greatly simplified from patch by:
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Juri Lelli <juri.lelli@redhat.com>
  Valentin Schneider <valentin.schneider@arm.com>
  Connor O'Brien <connoro@google.com>

[jstultz: Split out from larger proxy patch and simplified
 for review and testing.]
Signed-off-by: John Stultz <jstultz@google.com>
---
v5:
* Split out from larger proxy patch
v7:
* Fixed unused function arguments, spelling nits, and tweaks for
  clarity, pointed out by Metin Kaya
* Fix build warning Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202311081028.yDLmCWgr-lkp@intel.com/
v8:
* Fixed case where we might return a blocked task from find_proxy_task()
* Continued tweaks to handle avoiding returning blocked tasks
v9:
* Add zap_balance_callbacks helper to unwind balance_callbacks
  when we will re-call pick_next_task() again.
* Add extra comment suggested by Metin
* Typo fixes from Metin
* Moved adding proxy_resched_idle earlier in the series, as suggested
  by Metin
* Fix to call proxy_resched_idle() *prior* to deactivating next, to avoid
  crashes caused by stale references to next
* s/PROXY/SCHED_PROXY_EXEC/ as suggested by Metin
* Number of tweaks and cleanups suggested by Metin
* Simplify proxy_deactivate as suggested by Metin
v11:
* Tweaks for earlier simplification in try_to_deactivate_task
v13:
* Rename rename "next" to "donor" in find_proxy_task() for clarity
* Similarly use "donor" instead of next in proxy_deactivate
* Refactor/simplify proxy_resched_idle
* Moved up a needed fix from later in the series
v15:
* Tweaked some comments to better explain the initial sketch of
  find_proxy_task(), suggested by Qais
* Build fixes for !CONFIG_SMP
* Slight rework for blocked_on_state being added later in the
  series.
* Move the zap_balance_callbacks to later in the patch series
v16:
* Move the enqueue_task_rt() out to later in the series, as
  suggested by K Prateek Nayak
* Fixup whitespace error pointed out by K Prateek Nayak
* Use put_prev_set_next_task as suggested by K Prateek Nayak
* Try to rework find_proxy_task() locking to use guard and
  proxy_deactivate_task() in the way Peter suggested.
v17:
* Slightly simplified variable names per suggestion from
  Juri Lelli
* Minor comment and commit message tweaks suggested by Peter

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
 kernel/sched/core.c  | 99 ++++++++++++++++++++++++++++++++++++++++++--
 kernel/sched/sched.h | 10 ++++-
 2 files changed, 105 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 82817650a635b..878d9c5fea53c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6600,7 +6600,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
  * Otherwise marks the task's __state as RUNNING
  */
 static bool try_to_block_task(struct rq *rq, struct task_struct *p,
-			      unsigned long task_state)
+			      unsigned long task_state, bool deactivate_cond)
 {
 	int flags = DEQUEUE_NOCLOCK;
 
@@ -6609,6 +6609,9 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
 		return false;
 	}
 
+	if (!deactivate_cond)
+		return false;
+
 	p->sched_contributes_to_load =
 		(task_state & TASK_UNINTERRUPTIBLE) &&
 		!(task_state & TASK_NOLOAD) &&
@@ -6632,6 +6635,89 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
 	return true;
 }
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
+static inline struct task_struct *proxy_resched_idle(struct rq *rq)
+{
+	put_prev_set_next_task(rq, rq->donor, rq->idle);
+	rq_set_donor(rq, rq->idle);
+	set_tsk_need_resched(rq->idle);
+	return rq->idle;
+}
+
+static bool __proxy_deactivate(struct rq *rq, struct task_struct *donor)
+{
+	unsigned long state = READ_ONCE(donor->__state);
+
+	/* Don't deactivate if the state has been changed to TASK_RUNNING */
+	if (state == TASK_RUNNING)
+		return false;
+	/*
+	 * Because we got donor from pick_next_task(), it is *crucial*
+	 * that we call proxy_resched_idle() before we deactivate it.
+	 * As once we deactivate donor, donor->on_rq is set to zero,
+	 * which allows ttwu() to immediately try to wake the task on
+	 * another rq. So we cannot use *any* references to donor
+	 * after that point. So things like cfs_rq->curr or rq->donor
+	 * need to be changed from next *before* we deactivate.
+	 */
+	proxy_resched_idle(rq);
+	return try_to_block_task(rq, donor, state, true);
+}
+
+static struct task_struct *proxy_deactivate(struct rq *rq, struct task_struct *donor)
+{
+	if (!__proxy_deactivate(rq, donor)) {
+		/*
+		 * XXX: For now, if deactivation failed, set donor
+		 * as unblocked, as we aren't doing proxy-migrations
+		 * yet (more logic will be needed then).
+		 */
+		donor->blocked_on = NULL;
+	}
+	return NULL;
+}
+
+/*
+ * Initial simple sketch that just deactivates the blocked task
+ * chosen by pick_next_task() so we can then pick something that
+ * isn't blocked.
+ */
+static struct task_struct *
+find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
+{
+	struct mutex *mutex;
+
+	mutex = donor->blocked_on;
+	/* Something changed in the chain, so pick again */
+	if (!mutex)
+		return NULL;
+	/*
+	 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
+	 * and ensure @owner sticks around.
+	 */
+	guard(raw_spinlock)(&mutex->wait_lock);
+
+	/* Check again that donor is blocked with blocked_lock held */
+	if (!task_is_blocked(donor) || mutex != __get_task_blocked_on(donor)) {
+		/*
+		 * Something changed in the blocked_on chain and
+		 * we don't know if only at this level. So, let's
+		 * just bail out completely and let __schedule()
+		 * figure things out (pick_again loop).
+		 */
+		return NULL; /* do pick_next_task() again */
+	}
+	return proxy_deactivate(rq, donor);
+}
+#else /* SCHED_PROXY_EXEC */
+static struct task_struct *
+find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
+{
+	WARN_ONCE(1, "This should never be called in the !SCHED_PROXY_EXEC case\n");
+	return donor;
+}
+#endif /* SCHED_PROXY_EXEC */
+
 /*
  * __schedule() is the main scheduler function.
  *
@@ -6742,12 +6828,19 @@ static void __sched notrace __schedule(int sched_mode)
 			goto picked;
 		}
 	} else if (!preempt && prev_state) {
-		try_to_block_task(rq, prev, prev_state);
+		try_to_block_task(rq, prev, prev_state,
+				  !task_is_blocked(prev));
 		switch_count = &prev->nvcsw;
 	}
 
-	next = pick_next_task(rq, prev, &rf);
+pick_again:
+	next = pick_next_task(rq, rq->donor, &rf);
 	rq_set_donor(rq, next);
+	if (unlikely(task_is_blocked(next))) {
+		next = find_proxy_task(rq, next, &rf);
+		if (!next)
+			goto pick_again;
+	}
 picked:
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 154f0aa0c6322..ea2c987005bc1 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2264,6 +2264,14 @@ static inline int task_current_donor(struct rq *rq, struct task_struct *p)
 	return rq->donor == p;
 }
 
+static inline bool task_is_blocked(struct task_struct *p)
+{
+	if (!sched_proxy_exec())
+		return false;
+
+	return !!p->blocked_on;
+}
+
 static inline int task_on_cpu(struct rq *rq, struct task_struct *p)
 {
 #ifdef CONFIG_SMP
@@ -2473,7 +2481,7 @@ static inline void put_prev_set_next_task(struct rq *rq,
 					  struct task_struct *prev,
 					  struct task_struct *next)
 {
-	WARN_ON_ONCE(rq->curr != prev);
+	WARN_ON_ONCE(rq->donor != prev);
 
 	__put_prev_set_next_dl_server(rq, prev, next);
 
-- 
2.49.0.1204.g71687c7c1d-goog

