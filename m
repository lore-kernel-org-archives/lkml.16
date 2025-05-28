Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00622472A5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419813; cv=none; b=MJ92/w4C/74d+ZPm7c3WN3mhzPpZq7uWmSU12eE1IzXkScMwp/k5Gk4wu0EWOzmgpcvsDsjdNOf3+DIMMhlTLfJE1ln3yDuIuOOL3xB0AqWlsbr2jNphlhwWetMHWrhDILZ0r0BpXH9PnMwscrsHBxQ879UheuX+8xnLyrqlpSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419813; c=relaxed/simple;
	bh=n7Fd0CximPmTongnDQRpr8euc9lxQ5wvM8sWUUcg2Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AaW5JJkcWMY5G3qPQ8wNGhvWRnaUWJXjud1csQzZgNe9Ou6Lcq+rVWq9Mn+6d0Iqo8GBZQxujU/opiyMDt+ze0OoXXTbKNdqeGvLQ/d6DoB80swI9i5s9mdxmB9J0b42MZgZle37NRHrLG5062YXaXApCpm+vY4dpbFnf4cxozI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nM34g3Pn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nM34g3Pn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C56C4CEEB;
	Wed, 28 May 2025 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419813;
	bh=n7Fd0CximPmTongnDQRpr8euc9lxQ5wvM8sWUUcg2Ms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nM34g3Pn7qJ+VcC5iqsHmIloOR4G1jSSDtHCkCUIo2tCS/0etvThzQpboKdTxSuxm
	 R95fI47bvt8Swt31JdoL+ZCQnDTlmVhfMaV7OBg6pMGXX1JVijDjRVa/KYwN4a8/Zf
	 Qdz6orzPxAh3YCNhIHLpRQ5GgwK//dL/p1WtKA1vusHyeJr2/S1HGliXn1ptro0zve
	 J3FWZLzw2NpUX59Ev3C+9yp9wTWuzA33vBHTQSMkj4NIrX4/sTGMxNGbmUcgDk/J66
	 cXnQBd92wQJOARz2b2sPKazZhhaM2cPGhbr+XL6dl8LDHTQPJSma10K8zpKJKQDHTU
	 pTDoH4CiLz2tA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 07/43] sched: Clean up and standardize #if/#else/#endif markers in sched/deadline.c
Date: Wed, 28 May 2025 10:08:48 +0200
Message-ID: <20250528080924.2273858-8-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - Use the standard #ifdef marker format for larger blocks,
   where appropriate:

        #if CONFIG_FOO
        ...
        #else /* !CONFIG_FOO: */
        ...
        #endif /* !CONFIG_FOO */

 - Fix whitespace noise and other inconsistencies.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/deadline.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..7df38ea4d650 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -51,7 +51,7 @@ static int __init sched_dl_sysctl_init(void)
 	return 0;
 }
 late_initcall(sched_dl_sysctl_init);
-#endif
+#endif /* CONFIG_SYSCTL */
 
 static bool dl_server(struct sched_dl_entity *dl_se)
 {
@@ -99,7 +99,7 @@ static inline bool is_dl_boosted(struct sched_dl_entity *dl_se)
 {
 	return pi_of(dl_se) != dl_se;
 }
-#else
+#else /* !CONFIG_RT_MUTEXES: */
 static inline struct sched_dl_entity *pi_of(struct sched_dl_entity *dl_se)
 {
 	return dl_se;
@@ -109,7 +109,7 @@ static inline bool is_dl_boosted(struct sched_dl_entity *dl_se)
 {
 	return false;
 }
-#endif
+#endif /* !CONFIG_RT_MUTEXES */
 
 #ifdef CONFIG_SMP
 static inline struct dl_bw *dl_bw_of(int i)
@@ -191,7 +191,7 @@ void __dl_update(struct dl_bw *dl_b, s64 bw)
 		rq->dl.extra_bw += bw;
 	}
 }
-#else
+#else /* !CONFIG_SMP: */
 static inline struct dl_bw *dl_bw_of(int i)
 {
 	return &cpu_rq(i)->dl.dl_bw;
@@ -219,7 +219,7 @@ void __dl_update(struct dl_bw *dl_b, s64 bw)
 
 	dl->extra_bw += bw;
 }
-#endif
+#endif /* !CONFIG_SMP */
 
 static inline
 void __dl_sub(struct dl_bw *dl_b, u64 tsk_bw, int cpus)
@@ -753,7 +753,7 @@ static struct rq *dl_task_offline_migration(struct rq *rq, struct task_struct *p
 	return later_rq;
 }
 
-#else
+#else /* !CONFIG_SMP: */
 
 static inline
 void enqueue_pushable_dl_task(struct rq *rq, struct task_struct *p)
@@ -782,7 +782,7 @@ static inline void deadline_queue_push_tasks(struct rq *rq)
 static inline void deadline_queue_pull_task(struct rq *rq)
 {
 }
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 static void
 enqueue_dl_entity(struct sched_dl_entity *dl_se, int flags);
@@ -1209,7 +1209,7 @@ static void __push_dl_task(struct rq *rq, struct rq_flags *rf)
 		push_dl_task(rq);
 		rq_repin_lock(rq, rf);
 	}
-#endif
+#endif /* CONFIG_SMP */
 }
 
 /* a defer timer will not be reset if the runtime consumed was < dl_server_min_res */
@@ -1356,7 +1356,7 @@ static enum hrtimer_restart dl_task_timer(struct hrtimer *timer)
 		 * there.
 		 */
 	}
-#endif
+#endif /* CONFIG_SMP */
 
 	enqueue_task_dl(rq, p, ENQUEUE_REPLENISH);
 	if (dl_task(rq->donor))
@@ -1598,7 +1598,7 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 			rt_rq->rt_time += delta_exec;
 		raw_spin_unlock(&rt_rq->rt_runtime_lock);
 	}
-#endif
+#endif /* CONFIG_RT_GROUP_SCHED */
 }
 
 /*
@@ -1881,12 +1881,12 @@ static void dec_dl_deadline(struct dl_rq *dl_rq, u64 deadline)
 	}
 }
 
-#else
+#else /* !CONFIG_SMP: */
 
 static inline void inc_dl_deadline(struct dl_rq *dl_rq, u64 deadline) {}
 static inline void dec_dl_deadline(struct dl_rq *dl_rq, u64 deadline) {}
 
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 static inline
 void inc_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
@@ -2375,11 +2375,11 @@ static void start_hrtick_dl(struct rq *rq, struct sched_dl_entity *dl_se)
 {
 	hrtick_start(rq, dl_se->runtime);
 }
-#else /* !CONFIG_SCHED_HRTICK */
+#else /* !CONFIG_SCHED_HRTICK: */
 static void start_hrtick_dl(struct rq *rq, struct sched_dl_entity *dl_se)
 {
 }
-#endif
+#endif /* !CONFIG_SCHED_HRTICK */
 
 static void set_next_task_dl(struct rq *rq, struct task_struct *p, bool first)
 {
@@ -3121,13 +3121,13 @@ static void prio_changed_dl(struct rq *rq, struct task_struct *p,
 		    dl_time_before(p->dl.deadline, rq->curr->dl.deadline))
 			resched_curr(rq);
 	}
-#else
+#else /* !CONFIG_SMP: */
 	/*
 	 * We don't know if p has a earlier or later deadline, so let's blindly
 	 * set a (maybe not needed) rescheduling point.
 	 */
 	resched_curr(rq);
-#endif
+#endif /* !CONFIG_SMP */
 }
 
 #ifdef CONFIG_SCHED_CORE
@@ -3158,7 +3158,7 @@ DEFINE_SCHED_CLASS(dl) = {
 	.rq_offline             = rq_offline_dl,
 	.task_woken		= task_woken_dl,
 	.find_lock_rq		= find_lock_later_rq,
-#endif
+#endif /* CONFIG_SMP */
 
 	.task_tick		= task_tick_dl,
 	.task_fork              = task_fork_dl,
@@ -3570,7 +3570,7 @@ void dl_bw_free(int cpu, u64 dl_bw)
 {
 	dl_bw_manage(dl_bw_req_free, cpu, dl_bw);
 }
-#endif
+#endif /* CONFIG_SMP */
 
 void print_dl_stats(struct seq_file *m, int cpu)
 {
-- 
2.45.2

