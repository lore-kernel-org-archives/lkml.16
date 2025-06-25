Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FDE2E0B64
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883489; cv=none; b=jo3XZlVO0zhZsb7fcoqC9vGaO2W6IS1jM/lMVq/qVZrAO/Vc+6yYnEs2+zzck3nifb8sj61zLhYYgrwABKKvfX/imvwNX8NeehY43/BFn7II2dKNYLbOVi2eZ8ul6PqDdJXsIEhCozmYzuX4/sJRzBZMNXsHqBAYKd09Nk3bs3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883489; c=relaxed/simple;
	bh=7Gbbe7DmrjCrYsDM9bnRRyN0PD8a0t+/UhqfWT8utV8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BIv5IzeYnz4vhbCBGG2U7jl60vUmAE/pfGHUlO8NR41PHo9wt897HMj2kNKZGYNnNRkqDzXQ9fK3tbIzumDM6UlaIWaSRovz+DSQ5JLKcb4DJRXP17wdsHNN97kDi93qDLAFAwVVZgbBobreeavjHNFhla1n4EDDjkrZsRAI5oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kN+cbraF; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kN+cbraF"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313c3915345so274419a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750883487; x=1751488287; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vb+m0zzjHPVW7QgH/i+p2jYSCiuiyBNV0PMACERIPxY=;
        b=kN+cbraFspWqyc4L2CPS6S3BcAnlTfEOem7AeDkJOfNIsIprR6cfznnoS4ME5Qhjw6
         +R/7m+812z7dHCgst2fGp4CTaBD6Ck00R8kz+0p6sf5mGI2fbnO+NpkI+8P1C5VTS11W
         sSacZRjmhn6wYSB7MNFMJAVqbGrVvEV3VIAlvScIcPbn/epBUBzl5/Ef95Sw0/O0RXs8
         K8Gzwapo2fuyExvsZEktNzTn0msQo5gSngqkSIiuGY9LnESiylbN+wsUkSujwJJ9BRJe
         j4RUcRPTAeJhUscfPrvPtwqUV1x1rTFJy+CU5fqxtVELHEf3p/lS6XwxUCx2548fDxdV
         hlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750883487; x=1751488287;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vb+m0zzjHPVW7QgH/i+p2jYSCiuiyBNV0PMACERIPxY=;
        b=RQOeB1rZq7MuJHAVQY7TsNcitJ0x3Zlezb8lib9tdJJlaf1p5wH8LGz5OaUDCd6swr
         yPX3IQkpwTySJA/o1iMHaHCinlQBEQjGZaeVDF4bD8XyDxNzP10JTJA5Vp0CHxvqx2pE
         GrveiaMKwmEyaI9QjN4qqa/eCtVN+dMdpM9iYQDv92k4eUCa95cg8uWS0w5gd+SQFvvs
         A5iBXPdxyt1F0MtoAla/wcQKDtb2agBYuZyi89fWu+2QPviL7sQJQ6jfH9GZ7OsyDdJK
         ejZ1yCVt3GVywe/H6XlAlzEZ0+wRJsqlkIz++9uvFKjjZZujFVpZ80LcsjydubHMd2MB
         6szQ==
X-Gm-Message-State: AOJu0YxLcRhRuD+tEcFV+2EdmG3SGeSbmdWyfLA8YKXY4pg8uX9cDDXX
	Xm4HFe3RRyS6YCi0ka5rIEnF5to9oQMGGJ/3+vOhXMrtJuOGBCqJNXG+rhiKMZOc9qRNfoaIeFs
	4WdeBKgvHimx7P1JfxdwXrgqh+WJEjJ3JlDKLMWPdQAoZ2jsKgjE7CYOHoxhy1CUBJNqoUYGj7R
	Hsyo6UxmFSjzzb3lv2NL7nQhhS3KQ2BcsPbWyYFObiB4D678Na
X-Google-Smtp-Source: AGHT+IEMawx/CbvxPo4TMaer7VeKx3+9OKJyDqLjKr+lWkY/rS1bfp0rx+UN29DaGPxjqwR+TeQlirmkjawr
X-Received: from pjbpv1.prod.google.com ([2002:a17:90b:3c81:b0:313:2d44:397b])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2884:b0:311:ba2e:bdc9
 with SMTP id 98e67ed59e1d1-315f26893bemr6517524a91.27.1750883486877; Wed, 25
 Jun 2025 13:31:26 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:30:59 +0000
In-Reply-To: <20250625203110.2299275-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250625203110.2299275-1-jstultz@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250625203110.2299275-7-jstultz@google.com>
Subject: [PATCH v18 6/8] sched: Add an initial sketch of the find_proxy_task() function
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
	Suleiman Souhlal <suleiman@google.com>, kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, 
	kernel-team@android.com
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
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: kernel-team@android.com
---
 kernel/sched/core.c  | 100 +++++++++++++++++++++++++++++++++++++++++--
 kernel/sched/sched.h |  10 ++++-
 2 files changed, 106 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 853157b27f384..dc82d9b8bee2c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6614,7 +6614,8 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
  * Otherwise marks the task's __state as RUNNING
  */
 static bool try_to_block_task(struct rq *rq, struct task_struct *p,
-			      unsigned long *task_state_p)
+			      unsigned long *task_state_p,
+			      bool deactivate_cond)
 {
 	unsigned long task_state = *task_state_p;
 	int flags = DEQUEUE_NOCLOCK;
@@ -6625,6 +6626,9 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
 		return false;
 	}
 
+	if (!deactivate_cond)
+		return false;
+
 	p->sched_contributes_to_load =
 		(task_state & TASK_UNINTERRUPTIBLE) &&
 		!(task_state & TASK_NOLOAD) &&
@@ -6648,6 +6652,89 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
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
+	return try_to_block_task(rq, donor, &state, true);
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
@@ -6760,12 +6847,19 @@ static void __sched notrace __schedule(int sched_mode)
 			goto picked;
 		}
 	} else if (!preempt && prev_state) {
-		try_to_block_task(rq, prev, &prev_state);
+		try_to_block_task(rq, prev, &prev_state,
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
index 6b61e0c7f6e78..590a44c0215fb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2290,6 +2290,14 @@ static inline int task_current_donor(struct rq *rq, struct task_struct *p)
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
@@ -2499,7 +2507,7 @@ static inline void put_prev_set_next_task(struct rq *rq,
 					  struct task_struct *prev,
 					  struct task_struct *next)
 {
-	WARN_ON_ONCE(rq->curr != prev);
+	WARN_ON_ONCE(rq->donor != prev);
 
 	__put_prev_set_next_dl_server(rq, prev, next);
 
-- 
2.50.0.727.gbf7dc18ff4-goog

