Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6681024BBEE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419841; cv=none; b=pTOKosEhcOC+k4fSV8Y5kO/F51UBwfJM/Sb7iIZJn9OV7lYrYujTk6A5mu8YVZuCLySUFSb5LqaVXeFktJj4ESk5DX25E3kYJtzaXP3NYRXlT1CwKikUkADTwsVTP4AeWbfUw4DE8whS80CJ/1AMnPa2BNaaRD3QVLo5Lq/DLAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419841; c=relaxed/simple;
	bh=u+72SrfGUPAKyn9eEe9IZIM4gVlxh2Bgyzf8yIigbn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6rmNwdM40AdvptqKSKqiMMZimJzs3GUHHHyBb+x15k4YV0jKuU8tQ8wnawBg6UuqSQqZ68VnkJA7pyDHfimUekK6Kez/EVND99+IA6yipfLEhcl/T7mu6lhA4dtr4WG/i+9iOXEpkeRmpNN7XIVFrDKAG8nbyrqncXDQ/sZBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C78Ux+ss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C78Ux+ss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4318CC4CEEB;
	Wed, 28 May 2025 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419841;
	bh=u+72SrfGUPAKyn9eEe9IZIM4gVlxh2Bgyzf8yIigbn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C78Ux+ss50FSa/ZWGYok8zqjMLhvFXXqOMlI70tvcaXmfTcTLZvrbLiAbYU2JMgMO
	 KS+EFGVqHlMKg+1/XP9qR8SpPvah7P//PdvqRJSf6ULmuUhILdbc0cy1Q6J3H++QdA
	 0fWvN9sDveULIEXBlu+bKlRKmmw8+a+B/ZXBYpu01ldWxxjKYTMwXkybngohnmczz7
	 /8OmCnriaaPSI70cBi4JcFJGJkceJtJGK7wgv19qtxXUZKfS2BLxmfS9+WrxyUu0VL
	 xNrDBlvNCaoK5WCCDigiB8SArEXBH6ESBZ/O9qt/LU2ucfEcXV4ciylMdWgMrvwsCf
	 tPVsEr8ifLeSA==
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
Subject: [PATCH 15/43] sched: Clean up and standardize #if/#else/#endif markers in sched/sched.h
Date: Wed, 28 May 2025 10:08:56 +0200
Message-ID: <20250528080924.2273858-16-mingo@kernel.org>
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
 kernel/sched/sched.h | 82 +++++++++++++++++++++++++++-------------------------
 1 file changed, 42 insertions(+), 40 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c5a6a503eb6d..aec0c8253c1c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -424,7 +424,7 @@ struct cfs_bandwidth {
 	int			nr_burst;
 	u64			throttled_time;
 	u64			burst_time;
-#endif
+#endif /* CONFIG_CFS_BANDWIDTH */
 };
 
 /* Task group related information */
@@ -442,15 +442,15 @@ struct task_group {
 	/* runqueue "owned" by this group on each CPU */
 	struct cfs_rq		**cfs_rq;
 	unsigned long		shares;
-#ifdef	CONFIG_SMP
+#ifdef CONFIG_SMP
 	/*
 	 * load_avg can be heavily contended at clock tick time, so put
 	 * it in its own cache-line separated from the fields above which
 	 * will also be accessed at each tick.
 	 */
 	atomic_long_t		load_avg ____cacheline_aligned;
-#endif
-#endif
+#endif /* CONFIG_SMP */
+#endif /* CONFIG_FAIR_GROUP_SCHED */
 
 #ifdef CONFIG_RT_GROUP_SCHED
 	struct sched_rt_entity	**rt_se;
@@ -531,7 +531,7 @@ extern void free_fair_sched_group(struct task_group *tg);
 extern int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent);
 extern void online_fair_sched_group(struct task_group *tg);
 extern void unregister_fair_sched_group(struct task_group *tg);
-#else
+#else /* !CONFIG_FAIR_GROUP_SCHED: */
 static inline void free_fair_sched_group(struct task_group *tg) { }
 static inline int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 {
@@ -539,7 +539,7 @@ static inline int alloc_fair_sched_group(struct task_group *tg, struct task_grou
 }
 static inline void online_fair_sched_group(struct task_group *tg) { }
 static inline void unregister_fair_sched_group(struct task_group *tg) { }
-#endif
+#endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 extern void init_tg_cfs_entry(struct task_group *tg, struct cfs_rq *cfs_rq,
 			struct sched_entity *se, int cpu,
@@ -576,22 +576,22 @@ extern int sched_group_set_idle(struct task_group *tg, long idle);
 #ifdef CONFIG_SMP
 extern void set_task_rq_fair(struct sched_entity *se,
 			     struct cfs_rq *prev, struct cfs_rq *next);
-#else /* !CONFIG_SMP */
+#else /* !CONFIG_SMP: */
 static inline void set_task_rq_fair(struct sched_entity *se,
 			     struct cfs_rq *prev, struct cfs_rq *next) { }
-#endif /* CONFIG_SMP */
-#else /* !CONFIG_FAIR_GROUP_SCHED */
+#endif /* !CONFIG_SMP */
+#else /* !CONFIG_FAIR_GROUP_SCHED: */
 static inline int sched_group_set_shares(struct task_group *tg, unsigned long shares) { return 0; }
 static inline int sched_group_set_idle(struct task_group *tg, long idle) { return 0; }
-#endif /* CONFIG_FAIR_GROUP_SCHED */
+#endif /* !CONFIG_FAIR_GROUP_SCHED */
 
-#else /* CONFIG_CGROUP_SCHED */
+#else /* !CONFIG_CGROUP_SCHED: */
 
 struct cfs_bandwidth { };
 
 static inline bool cfs_task_bw_constrained(struct task_struct *p) { return false; }
 
-#endif	/* CONFIG_CGROUP_SCHED */
+#endif /* !CONFIG_CGROUP_SCHED */
 
 extern void unregister_rt_sched_group(struct task_group *tg);
 extern void free_rt_sched_group(struct task_group *tg);
@@ -859,9 +859,9 @@ struct dl_rq {
 	 * of the leftmost (earliest deadline) element.
 	 */
 	struct rb_root_cached	pushable_dl_tasks_root;
-#else
+#else /* !CONFIG_SMP: */
 	struct dl_bw		dl_bw;
-#endif
+#endif /* !CONFIG_SMP */
 	/*
 	 * "Active utilization" for this runqueue: increased when a
 	 * task wakes up (becomes TASK_RUNNING) and decreased when a
@@ -1008,7 +1008,7 @@ struct root_domain {
 	/* These atomics are updated outside of a lock */
 	atomic_t		rto_loop_next;
 	atomic_t		rto_loop_start;
-#endif
+#endif /* HAVE_RT_PUSH_IPI */
 	/*
 	 * The "RT overload" flag: it gets set if a CPU has more than
 	 * one runnable RT task.
@@ -1294,7 +1294,7 @@ struct rq {
 	unsigned int		core_forceidle_seq;
 	unsigned int		core_forceidle_occupation;
 	u64			core_forceidle_start;
-#endif
+#endif /* CONFIG_SCHED_CORE */
 
 	/* Scratch cpumask to be temporarily used under rq_lock */
 	cpumask_var_t		scratch_mask;
@@ -1313,13 +1313,13 @@ static inline struct rq *rq_of(struct cfs_rq *cfs_rq)
 	return cfs_rq->rq;
 }
 
-#else
+#else /* !CONFIG_FAIR_GROUP_SCHED: */
 
 static inline struct rq *rq_of(struct cfs_rq *cfs_rq)
 {
 	return container_of(cfs_rq, struct rq, cfs);
 }
-#endif
+#endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 static inline int cpu_of(struct rq *rq)
 {
@@ -1500,6 +1500,7 @@ static inline bool sched_group_cookie_match(struct rq *rq,
 }
 
 #endif /* !CONFIG_SCHED_CORE */
+
 #ifdef CONFIG_RT_GROUP_SCHED
 # ifdef CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED
 DECLARE_STATIC_KEY_FALSE(rt_group_sched);
@@ -1507,16 +1508,16 @@ static inline bool rt_group_sched_enabled(void)
 {
 	return static_branch_unlikely(&rt_group_sched);
 }
-# else
+# else /* !CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED: */
 DECLARE_STATIC_KEY_TRUE(rt_group_sched);
 static inline bool rt_group_sched_enabled(void)
 {
 	return static_branch_likely(&rt_group_sched);
 }
-# endif /* CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED */
-#else
+# endif /* !CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED */
+#else /* !CONFIG_RT_GROUP_SCHED: */
 # define rt_group_sched_enabled()	false
-#endif /* CONFIG_RT_GROUP_SCHED */
+#endif /* !CONFIG_RT_GROUP_SCHED */
 
 static inline void lockdep_assert_rq_held(struct rq *rq)
 {
@@ -1574,9 +1575,9 @@ static inline void update_idle_core(struct rq *rq)
 		__update_idle_core(rq);
 }
 
-#else
+#else /* !CONFIG_SCHED_SMT: */
 static inline void update_idle_core(struct rq *rq) { }
-#endif
+#endif /* !CONFIG_SCHED_SMT */
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
 
@@ -1757,7 +1758,7 @@ static inline void scx_rq_clock_invalidate(struct rq *rq)
 	WRITE_ONCE(rq->scx.flags, rq->scx.flags & ~SCX_RQ_CLK_VALID);
 }
 
-#else /* !CONFIG_SCHED_CLASS_EXT */
+#else /* !CONFIG_SCHED_CLASS_EXT: */
 #define scx_enabled()		false
 #define scx_switched_all()	false
 
@@ -2174,7 +2175,7 @@ static inline void set_task_rq(struct task_struct *p, unsigned int cpu)
 		tg = &root_task_group;
 	p->rt.rt_rq  = tg->rt_rq[cpu];
 	p->rt.parent = tg->rt_se[cpu];
-#endif
+#endif /* CONFIG_RT_GROUP_SCHED */
 }
 
 #else /* !CONFIG_CGROUP_SCHED: */
@@ -2200,7 +2201,7 @@ static inline void __set_task_cpu(struct task_struct *p, unsigned int cpu)
 	smp_wmb();
 	WRITE_ONCE(task_thread_info(p)->cpu, cpu);
 	p->wake_cpu = cpu;
-#endif
+#endif /* CONFIG_SMP */
 }
 
 /*
@@ -2429,7 +2430,7 @@ struct sched_class {
 	void (*rq_offline)(struct rq *rq);
 
 	struct rq *(*find_lock_rq)(struct task_struct *p, struct rq *rq);
-#endif
+#endif /* CONFIG_SMP */
 
 	void (*task_tick)(struct rq *rq, struct task_struct *p, int queued);
 	void (*task_fork)(struct task_struct *p);
@@ -2954,7 +2955,7 @@ static inline bool rq_order_less(struct rq *rq1, struct rq *rq2)
 	/*
 	 * __sched_core_flip() relies on SMT having cpu-id lock order.
 	 */
-#endif
+#endif /* CONFIG_SCHED_CORE */
 	return rq1->cpu < rq2->cpu;
 }
 
@@ -3145,6 +3146,7 @@ extern void print_rt_rq(struct seq_file *m, int cpu, struct rt_rq *rt_rq);
 extern void print_dl_rq(struct seq_file *m, int cpu, struct dl_rq *dl_rq);
 
 extern void resched_latency_warn(int cpu, u64 latency);
+
 #ifdef CONFIG_NUMA_BALANCING
 extern void show_numa_stats(struct task_struct *p, struct seq_file *m);
 extern void
@@ -3254,14 +3256,14 @@ static inline u64 irq_time_read(int cpu)
 	return total;
 }
 
-#else
+#else /* !CONFIG_IRQ_TIME_ACCOUNTING: */
 
 static inline int irqtime_enabled(void)
 {
 	return 0;
 }
 
-#endif /* CONFIG_IRQ_TIME_ACCOUNTING */
+#endif /* !CONFIG_IRQ_TIME_ACCOUNTING */
 
 #ifdef CONFIG_CPU_FREQ
 
@@ -3355,9 +3357,9 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
 	return READ_ONCE(rq->avg_rt.util_avg);
 }
 
-#else /* !CONFIG_SMP */
+#else /* !CONFIG_SMP: */
 static inline bool update_other_load_avgs(struct rq *rq) { return false; }
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 #ifdef CONFIG_UCLAMP_TASK
 
@@ -3537,13 +3539,13 @@ static inline bool sched_energy_enabled(void)
 
 extern struct cpufreq_governor schedutil_gov;
 
-#else /* ! (CONFIG_ENERGY_MODEL && CONFIG_CPU_FREQ_GOV_SCHEDUTIL) */
+#else /* !(CONFIG_ENERGY_MODEL && CONFIG_CPU_FREQ_GOV_SCHEDUTIL): */
 
 #define perf_domain_span(pd) NULL
 
 static inline bool sched_energy_enabled(void) { return false; }
 
-#endif /* CONFIG_ENERGY_MODEL && CONFIG_CPU_FREQ_GOV_SCHEDUTIL */
+#endif /* !(CONFIG_ENERGY_MODEL && CONFIG_CPU_FREQ_GOV_SCHEDUTIL) */
 
 #ifdef CONFIG_MEMBARRIER
 
@@ -3569,7 +3571,7 @@ static inline void membarrier_switch_mm(struct rq *rq,
 	WRITE_ONCE(rq->membarrier_state, membarrier_state);
 }
 
-#else /* !CONFIG_MEMBARRIER :*/
+#else /* !CONFIG_MEMBARRIER: */
 
 static inline void membarrier_switch_mm(struct rq *rq,
 					struct mm_struct *prev_mm,
@@ -3590,7 +3592,7 @@ static inline bool is_per_cpu_kthread(struct task_struct *p)
 
 	return true;
 }
-#endif
+#endif /* CONFIG_SMP */
 
 extern void swake_up_all_locked(struct swait_queue_head *q);
 extern void __prepare_to_swait(struct swait_queue_head *q, struct swait_queue *wait);
@@ -3910,7 +3912,7 @@ bool task_is_pushable(struct rq *rq, struct task_struct *p, int cpu)
 
 	return false;
 }
-#endif
+#endif /* CONFIG_SMP */
 
 #ifdef CONFIG_RT_MUTEXES
 
@@ -3954,7 +3956,7 @@ extern void check_class_changed(struct rq *rq, struct task_struct *p,
 #ifdef CONFIG_SMP
 extern struct balance_callback *splice_balance_callbacks(struct rq *rq);
 extern void balance_callbacks(struct rq *rq, struct balance_callback *head);
-#else
+#else /* !CONFIG_SMP: */
 
 static inline struct balance_callback *splice_balance_callbacks(struct rq *rq)
 {
@@ -3965,7 +3967,7 @@ static inline void balance_callbacks(struct rq *rq, struct balance_callback *hea
 {
 }
 
-#endif
+#endif /* !CONFIG_SMP */
 
 #ifdef CONFIG_SCHED_CLASS_EXT
 /*
-- 
2.45.2

