Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB024A07C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419838; cv=none; b=Sq2LHvJTceVkvYIGcsSzd7JMrqcPm3bZnXhDZnSQne1NLn4SYNz6eTwt1z4HDp/CSwBBq0z5YFGuvLWlmY45747SwxeIpps7CsD7aWW5wnLvRCA0yU8mYcZ5IIInL/liHuDjYN1pe0ETvEEXh1LABm4fVh+AGkS6aX1huwdo8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419838; c=relaxed/simple;
	bh=OMqjZ/k+TIxk2pcXS6Tt2oHRwQ8oYjlx5iJo+lWD9KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtOlpVGZZaBP4QykdfYICzvGR496BIVkKFjfnPsvBF/nUeAndPujJFH12rxI6Ps4gByzTFYqNKpdiQNenfxNXaZHlEzNaNvP3dqwJojnSM2HZQkrP28vcKZtkyjOhYVg12HxYqj7555j8hf0ng3/+P8xSUHvWg2Ky5GKJnD8yYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFpMVfpY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFpMVfpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB306C4CEE7;
	Wed, 28 May 2025 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419837;
	bh=OMqjZ/k+TIxk2pcXS6Tt2oHRwQ8oYjlx5iJo+lWD9KY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hFpMVfpY4szmSyDM4mTjNEh30JOXJZYurgu5QOhWCF1G0m9uL0LKtFQXqYvbKLcuq
	 SjFnMkab1C4VIk5SdchQuRZdA+xWC91aVEb12q9O3e2NkwfStV+YFnTbKwR4lGRSdF
	 fvAAtATMKhPouZFU8d/ltHbzkWRs51lg1Ucv0WX91QJxFdbtI5KWmko4fSztr0aifL
	 NxlGQPYtuUXln6ii32NdwXGxmXEP+W6kYgF7TVLJ0o0bbwzVKLMXw3nQ8MIqkg7Zs6
	 DbVNUbsUMdYqu5GiZM2nndiyKhToOnhnKyWkjPBzgzsYBxNRHp27JAxBKU1q8fWGnf
	 ED+xmEYOrGzXA==
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
Subject: [PATCH 14/43] sched: Clean up and standardize #if/#else/#endif markers in sched/rt.c
Date: Wed, 28 May 2025 10:08:55 +0200
Message-ID: <20250528080924.2273858-15-mingo@kernel.org>
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
 kernel/sched/rt.c | 54 +++++++++++++++++++++++++++---------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e40422c37033..85768c81531c 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -60,7 +60,7 @@ static int __init sched_rt_sysctl_init(void)
 	return 0;
 }
 late_initcall(sched_rt_sysctl_init);
-#endif
+#endif /* CONFIG_SYSCTL */
 
 void init_rt_rq(struct rt_rq *rt_rq)
 {
@@ -291,7 +291,7 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 	return 0;
 }
 
-#else /* CONFIG_RT_GROUP_SCHED */
+#else /* !CONFIG_RT_GROUP_SCHED: */
 
 #define rt_entity_is_task(rt_se) (1)
 
@@ -327,7 +327,7 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 {
 	return 1;
 }
-#endif /* CONFIG_RT_GROUP_SCHED */
+#endif /* !CONFIG_RT_GROUP_SCHED */
 
 #ifdef CONFIG_SMP
 
@@ -430,7 +430,7 @@ static void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
 	}
 }
 
-#else
+#else /* !CONFIG_SMP: */
 
 static inline void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
 {
@@ -443,7 +443,7 @@ static inline void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
 static inline void rt_queue_push_tasks(struct rq *rq)
 {
 }
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 static void enqueue_top_rt_rq(struct rt_rq *rt_rq);
 static void dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count);
@@ -485,12 +485,12 @@ static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
 
 	return cpu_cap >= min(min_cap, max_cap);
 }
-#else
+#else /* !CONFIG_UCLAMP_TASK: */
 static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
 {
 	return true;
 }
-#endif
+#endif /* !CONFIG_UCLAMP_TASK */
 
 #ifdef CONFIG_RT_GROUP_SCHED
 
@@ -798,9 +798,9 @@ static void balance_runtime(struct rt_rq *rt_rq)
 		raw_spin_lock(&rt_rq->rt_runtime_lock);
 	}
 }
-#else /* !CONFIG_SMP */
+#else /* !CONFIG_SMP: */
 static inline void balance_runtime(struct rt_rq *rt_rq) {}
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 static int do_sched_rt_period_timer(struct rt_bandwidth *rt_b, int overrun)
 {
@@ -930,7 +930,7 @@ static int sched_rt_runtime_exceeded(struct rt_rq *rt_rq)
 	return 0;
 }
 
-#else /* !CONFIG_RT_GROUP_SCHED */
+#else /* !CONFIG_RT_GROUP_SCHED: */
 
 typedef struct rt_rq *rt_rq_iter_t;
 
@@ -982,7 +982,7 @@ static void __enable_runtime(struct rq *rq) { }
 static void __disable_runtime(struct rq *rq) { }
 #endif
 
-#endif /* CONFIG_RT_GROUP_SCHED */
+#endif /* !CONFIG_RT_GROUP_SCHED */
 
 static inline int rt_se_prio(struct sched_rt_entity *rt_se)
 {
@@ -1033,7 +1033,7 @@ static void update_curr_rt(struct rq *rq)
 				do_start_rt_bandwidth(sched_rt_bandwidth(rt_rq));
 		}
 	}
-#endif
+#endif /* CONFIG_RT_GROUP_SCHED */
 }
 
 static void
@@ -1107,14 +1107,14 @@ dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 		cpupri_set(&rq->rd->cpupri, rq->cpu, rt_rq->highest_prio.curr);
 }
 
-#else /* CONFIG_SMP */
+#else /* !CONFIG_SMP: */
 
 static inline
 void inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio) {}
 static inline
 void dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio) {}
 
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 #if defined CONFIG_SMP || defined CONFIG_RT_GROUP_SCHED
 static void
@@ -1155,12 +1155,12 @@ dec_rt_prio(struct rt_rq *rt_rq, int prio)
 	dec_rt_prio_smp(rt_rq, prio, prev_prio);
 }
 
-#else
+#else /* !(CONFIG_SMP || CONFIG_RT_GROUP_SCHED): */
 
 static inline void inc_rt_prio(struct rt_rq *rt_rq, int prio) {}
 static inline void dec_rt_prio(struct rt_rq *rt_rq, int prio) {}
 
-#endif /* CONFIG_SMP || CONFIG_RT_GROUP_SCHED */
+#endif /* !(CONFIG_SMP || CONFIG_RT_GROUP_SCHED) */
 
 #ifdef CONFIG_RT_GROUP_SCHED
 
@@ -1182,7 +1182,7 @@ dec_rt_group(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 	WARN_ON(!rt_rq->rt_nr_running && rt_rq->rt_nr_boosted);
 }
 
-#else /* CONFIG_RT_GROUP_SCHED */
+#else /* !CONFIG_RT_GROUP_SCHED: */
 
 static void
 inc_rt_group(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
@@ -1192,7 +1192,7 @@ inc_rt_group(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 static inline
 void dec_rt_group(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq) {}
 
-#endif /* CONFIG_RT_GROUP_SCHED */
+#endif /* !CONFIG_RT_GROUP_SCHED */
 
 static inline
 unsigned int rt_se_nr_running(struct sched_rt_entity *rt_se)
@@ -1682,7 +1682,7 @@ static void wakeup_preempt_rt(struct rq *rq, struct task_struct *p, int flags)
 	 */
 	if (p->prio == donor->prio && !test_tsk_need_resched(rq->curr))
 		check_preempt_equal_prio(rq, p);
-#endif
+#endif /* CONFIG_SMP */
 }
 
 static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool first)
@@ -2509,11 +2509,11 @@ prio_changed_rt(struct rq *rq, struct task_struct *p, int oldprio)
 		 */
 		if (p->prio > rq->rt.highest_prio.curr)
 			resched_curr(rq);
-#else
+#else /* !CONFIG_SMP: */
 		/* For UP simply resched on drop of prio */
 		if (oldprio < p->prio)
 			resched_curr(rq);
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 	} else {
 		/*
 		 * This task is not running, but if it is
@@ -2549,9 +2549,9 @@ static void watchdog(struct rq *rq, struct task_struct *p)
 		}
 	}
 }
-#else
+#else /* !CONFIG_POSIX_TIMERS: */
 static inline void watchdog(struct rq *rq, struct task_struct *p) { }
-#endif
+#endif /* !CONFIG_POSIX_TIMERS */
 
 /*
  * scheduler tick hitting a task of our scheduling class.
@@ -2620,7 +2620,7 @@ static int task_is_throttled_rt(struct task_struct *p, int cpu)
 
 	return rt_rq_throttled(rt_rq);
 }
-#endif
+#endif /* CONFIG_SCHED_CORE */
 
 DEFINE_SCHED_CLASS(rt) = {
 
@@ -2643,7 +2643,7 @@ DEFINE_SCHED_CLASS(rt) = {
 	.task_woken		= task_woken_rt,
 	.switched_from		= switched_from_rt,
 	.find_lock_rq		= find_lock_lowest_rq,
-#endif
+#endif /* !CONFIG_SMP */
 
 	.task_tick		= task_tick_rt,
 
@@ -2887,7 +2887,7 @@ int sched_rt_can_attach(struct task_group *tg, struct task_struct *tsk)
 	return 1;
 }
 
-#else /* !CONFIG_RT_GROUP_SCHED */
+#else /* !CONFIG_RT_GROUP_SCHED: */
 
 #ifdef CONFIG_SYSCTL
 static int sched_rt_global_constraints(void)
@@ -2895,7 +2895,7 @@ static int sched_rt_global_constraints(void)
 	return 0;
 }
 #endif /* CONFIG_SYSCTL */
-#endif /* CONFIG_RT_GROUP_SCHED */
+#endif /* !CONFIG_RT_GROUP_SCHED */
 
 #ifdef CONFIG_SYSCTL
 static int sched_rt_global_validate(void)
-- 
2.45.2

