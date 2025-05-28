Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DD22561A7
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419820; cv=none; b=AcNJbxiGlRGq6Uoml7T2GuzCfXaX4zWyklOfvIhFATwtK9ifeA9oin9V5622ZUjXru2ExqRmtSZiPW0BK8xHGgcGS1Ck7QPYCMoCAP/DqScvwNuQ7H1QBfkF6QJuEtZ2j8b9w79OJWiY+EL3xPYSOC5EcGtCuMEifeysfqbFBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419820; c=relaxed/simple;
	bh=2GwVlWP3kyZi+qRaDCBa96mEqEKFz+u49EgTaZyIqCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZ9DK3utW3qjLwFzEZ6AmXLhPxWRAwbEZBnrpOzhBi9fKzU4WSyQ4T30/LNITkr47+kCN9/8GTr9OI7cunRoON45HgnOKn1UvwTdmoHrnmdwDl+Kx69oddKagruq4wjva817GCSDE9Vc7XAsvslLiaQS0Sy5ltjQFH3xQI3TpzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SybNsy+7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SybNsy+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB2AC4CEE7;
	Wed, 28 May 2025 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419820;
	bh=2GwVlWP3kyZi+qRaDCBa96mEqEKFz+u49EgTaZyIqCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SybNsy+73QApF5u/lQ4sDtJ73EptyWVnjCBMVa1YKNkVZEK7MBmMDpz0GV+MmqUt0
	 0bDGPHUJptThSiW3dxVibDdbWzXKqYkK6Mo2+DSQEhmOzT16ZmBOY9jyeP4b+Wc8Be
	 e1YteUxYBswlGLtWuNVh88/ArpZUw2vwH2Q3rA4yyW0fCEQtgxiDHqHobxdH/JHvCX
	 k+VYod60vZjoiYDeUgZ1cojA+t3H9Lw2Ek04BR/Jhni+ZnFK4D0gTBn1AHJyZdkdtZ
	 tvU0uKC8HDfw19+9Oe05vb8if85kgYVquLsXGJFZCY2Lf6JxED7ydaUAWe2NBsmvZf
	 RtZrSm+9OmaqA==
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
Subject: [PATCH 09/43] sched: Clean up and standardize #if/#else/#endif markers in sched/fair.c
Date: Wed, 28 May 2025 10:08:50 +0200
Message-ID: <20250528080924.2273858-10-mingo@kernel.org>
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
 kernel/sched/fair.c | 111 ++++++++++++++++++++++++++--------------------------
 1 file changed, 56 insertions(+), 55 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 125912c0e9dd..92ae3da8ca37 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -111,7 +111,7 @@ int __weak arch_asym_cpu_priority(int cpu)
  * (default: ~5%)
  */
 #define capacity_greater(cap1, cap2) ((cap1) * 1024 > (cap2) * 1078)
-#endif
+#endif /* CONFIG_SMP */
 
 #ifdef CONFIG_CFS_BANDWIDTH
 /*
@@ -162,7 +162,7 @@ static int __init sched_fair_sysctl_init(void)
 	return 0;
 }
 late_initcall(sched_fair_sysctl_init);
-#endif
+#endif /* CONFIG_SYSCTL */
 
 static inline void update_load_add(struct load_weight *lw, unsigned long inc)
 {
@@ -471,7 +471,7 @@ static int se_is_idle(struct sched_entity *se)
 	return cfs_rq_is_idle(group_cfs_rq(se));
 }
 
-#else	/* !CONFIG_FAIR_GROUP_SCHED */
+#else /* !CONFIG_FAIR_GROUP_SCHED: */
 
 #define for_each_sched_entity(se) \
 		for (; se; se = NULL)
@@ -517,7 +517,7 @@ static int se_is_idle(struct sched_entity *se)
 	return task_has_idle_policy(task_of(se));
 }
 
-#endif	/* CONFIG_FAIR_GROUP_SCHED */
+#endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 static __always_inline
 void account_cfs_rq_runtime(struct cfs_rq *cfs_rq, u64 delta_exec);
@@ -1008,7 +1008,7 @@ int sched_update_scaling(void)
 
 	return 0;
 }
-#endif
+#endif /* CONFIG_SMP */
 
 static void clear_buddies(struct cfs_rq *cfs_rq, struct sched_entity *se);
 
@@ -1041,6 +1041,7 @@ static bool update_deadline(struct cfs_rq *cfs_rq, struct sched_entity *se)
 }
 
 #include "pelt.h"
+
 #ifdef CONFIG_SMP
 
 static int select_idle_sibling(struct task_struct *p, int prev_cpu, int cpu);
@@ -1131,7 +1132,7 @@ void post_init_entity_util_avg(struct task_struct *p)
 	sa->runnable_avg = sa->util_avg;
 }
 
-#else /* !CONFIG_SMP */
+#else /* !CONFIG_SMP: */
 void init_entity_runnable_average(struct sched_entity *se)
 {
 }
@@ -1141,7 +1142,7 @@ void post_init_entity_util_avg(struct task_struct *p)
 static void update_tg_load_avg(struct cfs_rq *cfs_rq)
 {
 }
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
 {
@@ -2114,12 +2115,12 @@ static inline int numa_idle_core(int idle_core, int cpu)
 
 	return idle_core;
 }
-#else
+#else /* !CONFIG_SCHED_SMT: */
 static inline int numa_idle_core(int idle_core, int cpu)
 {
 	return idle_core;
 }
-#endif
+#endif /* !CONFIG_SCHED_SMT */
 
 /*
  * Gather all necessary information to make NUMA balancing placement
@@ -3663,7 +3664,8 @@ static void update_scan_period(struct task_struct *p, int new_cpu)
 	p->numa_scan_period = task_scan_start(p);
 }
 
-#else
+#else /* !CONFIG_NUMA_BALANCING: */
+
 static void task_tick_numa(struct rq *rq, struct task_struct *curr)
 {
 }
@@ -3680,7 +3682,7 @@ static inline void update_scan_period(struct task_struct *p, int new_cpu)
 {
 }
 
-#endif /* CONFIG_NUMA_BALANCING */
+#endif /* !CONFIG_NUMA_BALANCING */
 
 static void
 account_entity_enqueue(struct cfs_rq *cfs_rq, struct sched_entity *se)
@@ -3775,12 +3777,12 @@ dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
 	cfs_rq->avg.load_sum = max_t(u32, cfs_rq->avg.load_sum,
 					  cfs_rq->avg.load_avg * PELT_MIN_DIVIDER);
 }
-#else
+#else /* !CONFIG_SMP: */
 static inline void
 enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se) { }
 static inline void
 dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se) { }
-#endif
+#endif /* !CONFIG_SMP */
 
 static void place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags);
 
@@ -3990,11 +3992,11 @@ static void update_cfs_group(struct sched_entity *se)
 		reweight_entity(cfs_rq_of(se), se, shares);
 }
 
-#else /* CONFIG_FAIR_GROUP_SCHED */
+#else /* !CONFIG_FAIR_GROUP_SCHED: */
 static inline void update_cfs_group(struct sched_entity *se)
 {
 }
-#endif /* CONFIG_FAIR_GROUP_SCHED */
+#endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 static inline void cfs_rq_util_change(struct cfs_rq *cfs_rq, int flags)
 {
@@ -4471,7 +4473,7 @@ static inline bool skip_blocked_update(struct sched_entity *se)
 	return true;
 }
 
-#else /* CONFIG_FAIR_GROUP_SCHED */
+#else /* !CONFIG_FAIR_GROUP_SCHED: */
 
 static inline void update_tg_load_avg(struct cfs_rq *cfs_rq) {}
 
@@ -4484,7 +4486,7 @@ static inline int propagate_entity_load_avg(struct sched_entity *se)
 
 static inline void add_tg_cfs_propagate(struct cfs_rq *cfs_rq, long runnable_sum) {}
 
-#endif /* CONFIG_FAIR_GROUP_SCHED */
+#endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 #ifdef CONFIG_NO_HZ_COMMON
 static inline void migrate_se_pelt_lag(struct sched_entity *se)
@@ -4565,9 +4567,9 @@ static inline void migrate_se_pelt_lag(struct sched_entity *se)
 
 	__update_load_avg_blocked_se(now, se);
 }
-#else
+#else /* !CONFIG_NO_HZ_COMMON: */
 static void migrate_se_pelt_lag(struct sched_entity *se) {}
-#endif
+#endif /* !CONFIG_NO_HZ_COMMON */
 
 /**
  * update_cfs_rq_load_avg - update the cfs_rq's load/util averages
@@ -5134,7 +5136,7 @@ static inline void update_misfit_status(struct task_struct *p, struct rq *rq)
 	rq->misfit_task_load = max_t(unsigned long, task_h_load(p), 1);
 }
 
-#else /* CONFIG_SMP */
+#else /* !CONFIG_SMP: */
 
 static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
 {
@@ -5174,7 +5176,7 @@ util_est_update(struct cfs_rq *cfs_rq, struct task_struct *p,
 		bool task_sleep) {}
 static inline void update_misfit_status(struct task_struct *p, struct rq *rq) {}
 
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 void __setparam_fair(struct task_struct *p, const struct sched_attr *attr)
 {
@@ -5675,7 +5677,7 @@ void cfs_bandwidth_usage_dec(void)
 {
 	static_key_slow_dec_cpuslocked(&__cfs_bandwidth_used);
 }
-#else /* CONFIG_JUMP_LABEL */
+#else /* !CONFIG_JUMP_LABEL: */
 static bool cfs_bandwidth_used(void)
 {
 	return true;
@@ -5683,7 +5685,7 @@ static bool cfs_bandwidth_used(void)
 
 void cfs_bandwidth_usage_inc(void) {}
 void cfs_bandwidth_usage_dec(void) {}
-#endif /* CONFIG_JUMP_LABEL */
+#endif /* !CONFIG_JUMP_LABEL */
 
 /*
  * default period for cfs group bandwidth.
@@ -6137,12 +6139,12 @@ static inline void __unthrottle_cfs_rq_async(struct cfs_rq *cfs_rq)
 	if (first)
 		smp_call_function_single_async(cpu_of(rq), &rq->cfsb_csd);
 }
-#else
+#else /* !CONFIG_SMP: */
 static inline void __unthrottle_cfs_rq_async(struct cfs_rq *cfs_rq)
 {
 	unthrottle_cfs_rq(cfs_rq);
 }
-#endif
+#endif /* !CONFIG_SMP */
 
 static void unthrottle_cfs_rq_async(struct cfs_rq *cfs_rq)
 {
@@ -6723,9 +6725,9 @@ static void sched_fair_update_stop_tick(struct rq *rq, struct task_struct *p)
 	if (cfs_task_bw_constrained(p))
 		tick_nohz_dep_set_cpu(cpu, TICK_DEP_BIT_SCHED);
 }
-#endif
+#endif /* CONFIG_NO_HZ_FULL */
 
-#else /* CONFIG_CFS_BANDWIDTH */
+#else /* !CONFIG_CFS_BANDWIDTH: */
 
 static void account_cfs_rq_runtime(struct cfs_rq *cfs_rq, u64 delta_exec) {}
 static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
@@ -6767,7 +6769,7 @@ bool cfs_task_bw_constrained(struct task_struct *p)
 	return false;
 }
 #endif
-#endif /* CONFIG_CFS_BANDWIDTH */
+#endif /* !CONFIG_CFS_BANDWIDTH */
 
 #if !defined(CONFIG_CFS_BANDWIDTH) || !defined(CONFIG_NO_HZ_FULL)
 static inline void sched_fair_update_stop_tick(struct rq *rq, struct task_struct *p) {}
@@ -6812,7 +6814,7 @@ static void hrtick_update(struct rq *rq)
 
 	hrtick_start_fair(rq, donor);
 }
-#else /* !CONFIG_SCHED_HRTICK */
+#else /* !CONFIG_SCHED_HRTICK: */
 static inline void
 hrtick_start_fair(struct rq *rq, struct task_struct *p)
 {
@@ -6821,7 +6823,7 @@ hrtick_start_fair(struct rq *rq, struct task_struct *p)
 static inline void hrtick_update(struct rq *rq)
 {
 }
-#endif
+#endif /* !CONFIG_SCHED_HRTICK */
 
 #ifdef CONFIG_SMP
 static inline bool cpu_overutilized(int cpu)
@@ -6865,9 +6867,9 @@ static inline void check_update_overutilized_status(struct rq *rq)
 	if (!is_rd_overutilized(rq->rd) && cpu_overutilized(rq->cpu))
 		set_rd_overutilized(rq->rd, 1);
 }
-#else
+#else /* !CONFIG_SMP: */
 static inline void check_update_overutilized_status(struct rq *rq) { }
-#endif
+#endif /* !CONFIG_SMP */
 
 /* Runqueue only has SCHED_IDLE tasks enqueued */
 static int sched_idle_rq(struct rq *rq)
@@ -7667,7 +7669,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
 	return -1;
 }
 
-#else /* CONFIG_SCHED_SMT */
+#else /* !CONFIG_SCHED_SMT: */
 
 static inline void set_idle_cores(int cpu, int val)
 {
@@ -7688,7 +7690,7 @@ static inline int select_idle_smt(struct task_struct *p, struct sched_domain *sd
 	return -1;
 }
 
-#endif /* CONFIG_SCHED_SMT */
+#endif /* !CONFIG_SCHED_SMT */
 
 /*
  * Scan the LLC domain for idle CPUs; this is dynamically regulated by
@@ -8733,9 +8735,9 @@ balance_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 
 	return sched_balance_newidle(rq, rf) != 0;
 }
-#else
+#else /* !CONFIG_SMP: */
 static inline void set_task_max_allowed_capacity(struct task_struct *p) {}
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 static void set_next_buddy(struct sched_entity *se)
 {
@@ -8929,7 +8931,7 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 	return p;
 
 simple:
-#endif
+#endif /* CONFIG_FAIR_GROUP_SCHED */
 	put_prev_set_next_task(rq, prev, p);
 	return p;
 
@@ -9347,13 +9349,13 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
 	return src_weight - dst_weight;
 }
 
-#else
+#else /* !CONFIG_NUMA_BALANCING: */
 static inline long migrate_degrades_locality(struct task_struct *p,
 					     struct lb_env *env)
 {
 	return 0;
 }
-#endif
+#endif /* !CONFIG_NUMA_BALANCING */
 
 /*
  * Check whether the task is ineligible on the destination cpu
@@ -9762,12 +9764,12 @@ static inline void update_blocked_load_status(struct rq *rq, bool has_blocked)
 	if (!has_blocked)
 		rq->has_blocked_load = 0;
 }
-#else
+#else /* !CONFIG_NO_HZ_COMMON: */
 static inline bool cfs_rq_has_blocked(struct cfs_rq *cfs_rq) { return false; }
 static inline bool others_have_blocked(struct rq *rq) { return false; }
 static inline void update_blocked_load_tick(struct rq *rq) {}
 static inline void update_blocked_load_status(struct rq *rq, bool has_blocked) {}
-#endif
+#endif /* !CONFIG_NO_HZ_COMMON */
 
 static bool __update_blocked_others(struct rq *rq, bool *done)
 {
@@ -9876,7 +9878,7 @@ static unsigned long task_h_load(struct task_struct *p)
 	return div64_ul(p->se.avg.load_avg * cfs_rq->h_load,
 			cfs_rq_load_avg(cfs_rq) + 1);
 }
-#else
+#else /* !CONFIG_FAIR_GROUP_SCHED: */
 static bool __update_blocked_fair(struct rq *rq, bool *done)
 {
 	struct cfs_rq *cfs_rq = &rq->cfs;
@@ -9893,7 +9895,7 @@ static unsigned long task_h_load(struct task_struct *p)
 {
 	return p->se.avg.load_avg;
 }
-#endif
+#endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 static void sched_balance_update_blocked_averages(int cpu)
 {
@@ -10606,7 +10608,7 @@ static inline enum fbq_type fbq_classify_rq(struct rq *rq)
 		return remote;
 	return all;
 }
-#else
+#else /* !CONFIG_NUMA_BALANCING: */
 static inline enum fbq_type fbq_classify_group(struct sg_lb_stats *sgs)
 {
 	return all;
@@ -10616,7 +10618,7 @@ static inline enum fbq_type fbq_classify_rq(struct rq *rq)
 {
 	return regular;
 }
-#endif /* CONFIG_NUMA_BALANCING */
+#endif /* !CONFIG_NUMA_BALANCING */
 
 
 struct sg_lb_stats;
@@ -12762,7 +12764,7 @@ static void nohz_newidle_balance(struct rq *this_rq)
 	atomic_or(NOHZ_NEWILB_KICK, nohz_flags(this_cpu));
 }
 
-#else /* !CONFIG_NO_HZ_COMMON */
+#else /* !CONFIG_NO_HZ_COMMON: */
 static inline void nohz_balancer_kick(struct rq *rq) { }
 
 static inline bool nohz_idle_balance(struct rq *this_rq, enum cpu_idle_type idle)
@@ -12771,7 +12773,7 @@ static inline bool nohz_idle_balance(struct rq *this_rq, enum cpu_idle_type idle
 }
 
 static inline void nohz_newidle_balance(struct rq *this_rq) { }
-#endif /* CONFIG_NO_HZ_COMMON */
+#endif /* !CONFIG_NO_HZ_COMMON */
 
 /*
  * sched_balance_newidle is called by schedule() if this_cpu is about to become
@@ -13066,10 +13068,10 @@ bool cfs_prio_less(const struct task_struct *a, const struct task_struct *b,
 
 	cfs_rqa = sea->cfs_rq;
 	cfs_rqb = seb->cfs_rq;
-#else
+#else /* !CONFIG_FAIR_GROUP_SCHED: */
 	cfs_rqa = &task_rq(a)->cfs;
 	cfs_rqb = &task_rq(b)->cfs;
-#endif
+#endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 	/*
 	 * Find delta after normalizing se's vruntime with its cfs_rq's
@@ -13093,9 +13095,9 @@ static int task_is_throttled_fair(struct task_struct *p, int cpu)
 #endif
 	return throttled_hierarchy(cfs_rq);
 }
-#else
+#else /* !CONFIG_SCHED_CORE: */
 static inline void task_tick_core(struct rq *rq, struct task_struct *curr) {}
-#endif
+#endif /* !CONFIG_SCHED_CORE */
 
 /*
  * scheduler tick hitting a task of our scheduling class.
@@ -13189,9 +13191,9 @@ static void propagate_entity_cfs_rq(struct sched_entity *se)
 			list_add_leaf_cfs_rq(cfs_rq);
 	}
 }
-#else
+#else /* !CONFIG_FAIR_GROUP_SCHED: */
 static void propagate_entity_cfs_rq(struct sched_entity *se) { }
-#endif
+#endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 static void detach_entity_cfs_rq(struct sched_entity *se)
 {
@@ -13727,6 +13729,5 @@ __init void init_sched_fair_class(void)
 	nohz.next_blocked = jiffies;
 	zalloc_cpumask_var(&nohz.idle_cpus_mask, GFP_NOWAIT);
 #endif
-#endif /* SMP */
-
+#endif /* CONFIG_SMP */
 }
-- 
2.45.2

