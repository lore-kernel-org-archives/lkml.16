Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D12246776
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419799; cv=none; b=Fr9zQHC03B4xVNmwTCHd7l9ZhjSmYeHNdCUsknVTF5SRNdqU1UFF5fdFWG/5o4VgGp6PTTII0fFX+vGwBljhef2Qqaz0VpemBmMpn2OVFsnqbAcl5VJgj8cdWFPZ265mLFwqSQX4Yeoe8xucNdKXUFCvLmRR91tZfL1MV/2gtbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419799; c=relaxed/simple;
	bh=9oM9khvttOQss4/2+9tZ2ORsA+VPp+9MA1k64OXpZ2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFh0xgST9CEJER8dkkvlXwaSf/a1kEzhWQG3q3UJYAOlo3HcMEnMnfNo0EjzgtSOormYF+nM+Lz7nqm7s3f+t7RRPZTcRWk4z95A/5Zbt3agRTIYoQW371MvEgkP6I3Gkk5iFkuEsr43Y/4KlO8SappQwnNgqFA3Yg/d+rRSVSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KttRv5MX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KttRv5MX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04205C4CEF1;
	Wed, 28 May 2025 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419799;
	bh=9oM9khvttOQss4/2+9tZ2ORsA+VPp+9MA1k64OXpZ2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KttRv5MXMGa7qjdTGOpYNWeV3IixN0gqzUe+0B/DXZcB39+KlOncfOqH3Gv75INdD
	 lsOoovXyVkZc2JzKoiESbtbUbpf4PMjlOTaeOlZf79cpMTeDqueMtAMVyD7TFQzJG4
	 WoKP7TLTnAPoVz6SIzcthZOLaM1sLH53rB5Q3USQsBIbo+16GmBupuRTyduOTrKayo
	 nhHpcAj2q2w6P/TxVRL4ABnFIjSouS3EeHjocugFHy950klExR9Ndo9czS1ULkyBFb
	 0jfAAIPL3q0hVgidkSmNLIBZOPrKS9FjRLzQwJgvM6mHe6EQJUcgxgN5Nbo70joUKc
	 yc/PMPKgYRL2g==
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
Subject: [PATCH 03/43] sched: Clean up and standardize #if/#else/#endif markers in sched/core.c
Date: Wed, 28 May 2025 10:08:44 +0200
Message-ID: <20250528080924.2273858-4-mingo@kernel.org>
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

 - Apply this simplification:

	-#if defined(CONFIG_FOO)
	+#ifdef CONFIG_FOO

 - Fix whitespace noise.

 - Use vertical alignment to better visualize nested #ifdef blocks,
   where appropriate:

	#ifdef CONFIG_FOO
	# ifdef CONFIG_BAR
	...
	# endif
	#endif

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
 kernel/sched/core.c | 186 ++++++++++++++++++++++++++--------------------------
 1 file changed, 93 insertions(+), 93 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 62b3416f5e43..21cf5809b2d8 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -481,13 +481,13 @@ void sched_core_put(void)
 		schedule_work(&_work);
 }
 
-#else /* !CONFIG_SCHED_CORE */
+#else /* !CONFIG_SCHED_CORE: */
 
 static inline void sched_core_enqueue(struct rq *rq, struct task_struct *p) { }
 static inline void
 sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags) { }
 
-#endif /* CONFIG_SCHED_CORE */
+#endif /* !CONFIG_SCHED_CORE */
 
 /* need a wrapper since we may need to trace from modules */
 EXPORT_TRACEPOINT_SYMBOL(sched_set_state_tp);
@@ -667,7 +667,7 @@ void double_rq_lock(struct rq *rq1, struct rq *rq2)
 
 	double_rq_clock_clear_update(rq1, rq2);
 }
-#endif
+#endif /* CONFIG_SMP */
 
 /*
  * __task_rq_lock - lock the rq @p resides on.
@@ -899,7 +899,7 @@ void hrtick_start(struct rq *rq, u64 delay)
 		smp_call_function_single_async(cpu_of(rq), &rq->hrtick_csd);
 }
 
-#else
+#else /* !CONFIG_SMP: */
 /*
  * Called to set the hrtick timer state.
  *
@@ -916,7 +916,7 @@ void hrtick_start(struct rq *rq, u64 delay)
 		      HRTIMER_MODE_REL_PINNED_HARD);
 }
 
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 static void hrtick_rq_init(struct rq *rq)
 {
@@ -925,7 +925,7 @@ static void hrtick_rq_init(struct rq *rq)
 #endif
 	hrtimer_setup(&rq->hrtick_timer, hrtick, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 }
-#else	/* CONFIG_SCHED_HRTICK */
+#else /* !CONFIG_SCHED_HRTICK: */
 static inline void hrtick_clear(struct rq *rq)
 {
 }
@@ -933,7 +933,7 @@ static inline void hrtick_clear(struct rq *rq)
 static inline void hrtick_rq_init(struct rq *rq)
 {
 }
-#endif	/* CONFIG_SCHED_HRTICK */
+#endif /* !CONFIG_SCHED_HRTICK */
 
 /*
  * try_cmpxchg based fetch_or() macro so it works for different integer types:
@@ -1971,7 +1971,7 @@ static int sysctl_sched_uclamp_handler(const struct ctl_table *table, int write,
 	sysctl_sched_uclamp_util_min_rt_default = old_min_rt;
 	return result;
 }
-#endif
+#endif /* CONFIG_SYSCTL */
 
 static void uclamp_fork(struct task_struct *p)
 {
@@ -2037,13 +2037,13 @@ static void __init init_uclamp(void)
 	}
 }
 
-#else /* !CONFIG_UCLAMP_TASK */
+#else /* !CONFIG_UCLAMP_TASK: */
 static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags) { }
 static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
 static inline void uclamp_fork(struct task_struct *p) { }
 static inline void uclamp_post_fork(struct task_struct *p) { }
 static inline void init_uclamp(void) { }
-#endif /* CONFIG_UCLAMP_TASK */
+#endif /* !CONFIG_UCLAMP_TASK */
 
 bool sched_task_on_rq(struct task_struct *p)
 {
@@ -3657,7 +3657,7 @@ void sched_set_stop_task(int cpu, struct task_struct *stop)
 	}
 }
 
-#else /* CONFIG_SMP */
+#else /* !CONFIG_SMP: */
 
 static inline void migrate_disable_switch(struct rq *rq, struct task_struct *p) { }
 
@@ -3766,7 +3766,7 @@ ttwu_do_activate(struct rq *rq, struct task_struct *p, int wake_flags,
 
 		rq->idle_stamp = 0;
 	}
-#endif
+#endif /* CONFIG_SMP */
 }
 
 /*
@@ -3988,14 +3988,14 @@ static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
 	return false;
 }
 
-#else /* !CONFIG_SMP */
+#else /* !CONFIG_SMP: */
 
 static inline bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
 {
 	return false;
 }
 
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 static void ttwu_queue(struct task_struct *p, int cpu, int wake_flags)
 {
@@ -4331,9 +4331,9 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 			psi_ttwu_dequeue(p);
 			set_task_cpu(p, cpu);
 		}
-#else
+#else /* !CONFIG_SMP: */
 		cpu = task_cpu(p);
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 		ttwu_queue(p, cpu, wake_flags);
 	}
@@ -4595,8 +4595,8 @@ static int sysctl_numa_balancing(const struct ctl_table *table, int write,
 	}
 	return err;
 }
-#endif
-#endif
+#endif /* CONFIG_PROC_SYSCTL */
+#endif /* CONFIG_NUMA_BALANCING */
 
 #ifdef CONFIG_SCHEDSTATS
 
@@ -4783,7 +4783,7 @@ int sched_fork(unsigned long clone_flags, struct task_struct *p)
 	if (likely(sched_info_on()))
 		memset(&p->sched_info, 0, sizeof(p->sched_info));
 #endif
-#if defined(CONFIG_SMP)
+#ifdef CONFIG_SMP
 	p->on_cpu = 0;
 #endif
 	init_task_preempt_count(p);
@@ -4974,7 +4974,7 @@ fire_sched_out_preempt_notifiers(struct task_struct *curr,
 		__fire_sched_out_preempt_notifiers(curr, next);
 }
 
-#else /* !CONFIG_PREEMPT_NOTIFIERS */
+#else /* !CONFIG_PREEMPT_NOTIFIERS: */
 
 static inline void fire_sched_in_preempt_notifiers(struct task_struct *curr)
 {
@@ -4986,7 +4986,7 @@ fire_sched_out_preempt_notifiers(struct task_struct *curr,
 {
 }
 
-#endif /* CONFIG_PREEMPT_NOTIFIERS */
+#endif /* !CONFIG_PREEMPT_NOTIFIERS */
 
 static inline void prepare_task(struct task_struct *next)
 {
@@ -5103,13 +5103,13 @@ void balance_callbacks(struct rq *rq, struct balance_callback *head)
 	}
 }
 
-#else
+#else /* !CONFIG_SMP: */
 
 static inline void __balance_callbacks(struct rq *rq)
 {
 }
 
-#endif
+#endif /* !CONFIG_SMP */
 
 static inline void
 prepare_lock_switch(struct rq *rq, struct task_struct *next, struct rq_flags *rf)
@@ -5523,7 +5523,7 @@ void sched_exec(void)
 	stop_one_cpu(task_cpu(p), migration_cpu_stop, &arg);
 }
 
-#endif
+#endif /* CONFIG_SMP */
 
 DEFINE_PER_CPU(struct kernel_stat, kstat);
 DEFINE_PER_CPU(struct kernel_cpustat, kernel_cpustat);
@@ -5831,10 +5831,10 @@ int __init sched_tick_offload_init(void)
 	return 0;
 }
 
-#else /* !CONFIG_NO_HZ_FULL */
+#else /* !CONFIG_NO_HZ_FULL: */
 static inline void sched_tick_start(int cpu) { }
 static inline void sched_tick_stop(int cpu) { }
-#endif
+#endif /* !CONFIG_NO_HZ_FULL */
 
 #if defined(CONFIG_PREEMPTION) && (defined(CONFIG_DEBUG_PREEMPT) || \
 				defined(CONFIG_TRACE_PREEMPT_TOGGLE))
@@ -6549,7 +6549,7 @@ static inline void sched_core_cpu_dying(unsigned int cpu)
 		rq->core = rq;
 }
 
-#else /* !CONFIG_SCHED_CORE */
+#else /* !CONFIG_SCHED_CORE: */
 
 static inline void sched_core_cpu_starting(unsigned int cpu) {}
 static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
@@ -6561,7 +6561,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 	return __pick_next_task(rq, prev, rf);
 }
 
-#endif /* CONFIG_SCHED_CORE */
+#endif /* !CONFIG_SCHED_CORE */
 
 /*
  * Constants for the sched_mode argument of __schedule().
@@ -6988,14 +6988,14 @@ NOKPROBE_SYMBOL(preempt_schedule);
 EXPORT_SYMBOL(preempt_schedule);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
-#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-#ifndef preempt_schedule_dynamic_enabled
-#define preempt_schedule_dynamic_enabled	preempt_schedule
-#define preempt_schedule_dynamic_disabled	NULL
-#endif
+# ifdef CONFIG_HAVE_PREEMPT_DYNAMIC_CALL
+#  ifndef preempt_schedule_dynamic_enabled
+#   define preempt_schedule_dynamic_enabled	preempt_schedule
+#   define preempt_schedule_dynamic_disabled	NULL
+#  endif
 DEFINE_STATIC_CALL(preempt_schedule, preempt_schedule_dynamic_enabled);
 EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
-#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+# elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule);
 void __sched notrace dynamic_preempt_schedule(void)
 {
@@ -7005,8 +7005,8 @@ void __sched notrace dynamic_preempt_schedule(void)
 }
 NOKPROBE_SYMBOL(dynamic_preempt_schedule);
 EXPORT_SYMBOL(dynamic_preempt_schedule);
-#endif
-#endif
+# endif
+#endif /* CONFIG_PREEMPT_DYNAMIC */
 
 /**
  * preempt_schedule_notrace - preempt_schedule called by tracing
@@ -7061,14 +7061,14 @@ asmlinkage __visible void __sched notrace preempt_schedule_notrace(void)
 EXPORT_SYMBOL_GPL(preempt_schedule_notrace);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
-#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-#ifndef preempt_schedule_notrace_dynamic_enabled
-#define preempt_schedule_notrace_dynamic_enabled	preempt_schedule_notrace
-#define preempt_schedule_notrace_dynamic_disabled	NULL
-#endif
+# if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
+#  ifndef preempt_schedule_notrace_dynamic_enabled
+#   define preempt_schedule_notrace_dynamic_enabled	preempt_schedule_notrace
+#   define preempt_schedule_notrace_dynamic_disabled	NULL
+#  endif
 DEFINE_STATIC_CALL(preempt_schedule_notrace, preempt_schedule_notrace_dynamic_enabled);
 EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
-#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+# elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule_notrace);
 void __sched notrace dynamic_preempt_schedule_notrace(void)
 {
@@ -7078,7 +7078,7 @@ void __sched notrace dynamic_preempt_schedule_notrace(void)
 }
 NOKPROBE_SYMBOL(dynamic_preempt_schedule_notrace);
 EXPORT_SYMBOL(dynamic_preempt_schedule_notrace);
-#endif
+# endif
 #endif
 
 #endif /* CONFIG_PREEMPTION */
@@ -7297,7 +7297,7 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
 
 	preempt_enable();
 }
-#endif
+#endif /* CONFIG_RT_MUTEXES */
 
 #if !defined(CONFIG_PREEMPTION) || defined(CONFIG_PREEMPT_DYNAMIC)
 int __sched __cond_resched(void)
@@ -7328,17 +7328,17 @@ EXPORT_SYMBOL(__cond_resched);
 #endif
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
-#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-#define cond_resched_dynamic_enabled	__cond_resched
-#define cond_resched_dynamic_disabled	((void *)&__static_call_return0)
+# ifdef CONFIG_HAVE_PREEMPT_DYNAMIC_CALL
+#  define cond_resched_dynamic_enabled	__cond_resched
+#  define cond_resched_dynamic_disabled	((void *)&__static_call_return0)
 DEFINE_STATIC_CALL_RET0(cond_resched, __cond_resched);
 EXPORT_STATIC_CALL_TRAMP(cond_resched);
 
-#define might_resched_dynamic_enabled	__cond_resched
-#define might_resched_dynamic_disabled	((void *)&__static_call_return0)
+#  define might_resched_dynamic_enabled	__cond_resched
+#  define might_resched_dynamic_disabled ((void *)&__static_call_return0)
 DEFINE_STATIC_CALL_RET0(might_resched, __cond_resched);
 EXPORT_STATIC_CALL_TRAMP(might_resched);
-#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+# elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 static DEFINE_STATIC_KEY_FALSE(sk_dynamic_cond_resched);
 int __sched dynamic_cond_resched(void)
 {
@@ -7356,8 +7356,8 @@ int __sched dynamic_might_resched(void)
 	return __cond_resched();
 }
 EXPORT_SYMBOL(dynamic_might_resched);
-#endif
-#endif
+# endif
+#endif /* CONFIG_PREEMPT_DYNAMIC */
 
 /*
  * __cond_resched_lock() - if a reschedule is pending, drop the given lock,
@@ -7423,9 +7423,9 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 
-#ifdef CONFIG_GENERIC_ENTRY
-#include <linux/entry-common.h>
-#endif
+# ifdef CONFIG_GENERIC_ENTRY
+#  include <linux/entry-common.h>
+# endif
 
 /*
  * SC:cond_resched
@@ -7480,37 +7480,37 @@ int preempt_dynamic_mode = preempt_dynamic_undefined;
 
 int sched_dynamic_mode(const char *str)
 {
-#ifndef CONFIG_PREEMPT_RT
+# ifndef CONFIG_PREEMPT_RT
 	if (!strcmp(str, "none"))
 		return preempt_dynamic_none;
 
 	if (!strcmp(str, "voluntary"))
 		return preempt_dynamic_voluntary;
-#endif
+# endif
 
 	if (!strcmp(str, "full"))
 		return preempt_dynamic_full;
 
-#ifdef CONFIG_ARCH_HAS_PREEMPT_LAZY
+# ifdef CONFIG_ARCH_HAS_PREEMPT_LAZY
 	if (!strcmp(str, "lazy"))
 		return preempt_dynamic_lazy;
-#endif
+# endif
 
 	return -EINVAL;
 }
 
-#define preempt_dynamic_key_enable(f)	static_key_enable(&sk_dynamic_##f.key)
-#define preempt_dynamic_key_disable(f)	static_key_disable(&sk_dynamic_##f.key)
+# define preempt_dynamic_key_enable(f)	static_key_enable(&sk_dynamic_##f.key)
+# define preempt_dynamic_key_disable(f)	static_key_disable(&sk_dynamic_##f.key)
 
-#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-#define preempt_dynamic_enable(f)	static_call_update(f, f##_dynamic_enabled)
-#define preempt_dynamic_disable(f)	static_call_update(f, f##_dynamic_disabled)
-#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-#define preempt_dynamic_enable(f)	preempt_dynamic_key_enable(f)
-#define preempt_dynamic_disable(f)	preempt_dynamic_key_disable(f)
-#else
-#error "Unsupported PREEMPT_DYNAMIC mechanism"
-#endif
+# if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
+#  define preempt_dynamic_enable(f)	static_call_update(f, f##_dynamic_enabled)
+#  define preempt_dynamic_disable(f)	static_call_update(f, f##_dynamic_disabled)
+# elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+#  define preempt_dynamic_enable(f)	preempt_dynamic_key_enable(f)
+#  define preempt_dynamic_disable(f)	preempt_dynamic_key_disable(f)
+# else
+#  error "Unsupported PREEMPT_DYNAMIC mechanism"
+# endif
 
 static DEFINE_MUTEX(sched_dynamic_mutex);
 
@@ -7614,7 +7614,7 @@ static void __init preempt_dynamic_init(void)
 	}
 }
 
-#define PREEMPT_MODEL_ACCESSOR(mode) \
+# define PREEMPT_MODEL_ACCESSOR(mode) \
 	bool preempt_model_##mode(void)						 \
 	{									 \
 		WARN_ON_ONCE(preempt_dynamic_mode == preempt_dynamic_undefined); \
@@ -8118,7 +8118,7 @@ static void balance_hotplug_wait(void)
 			   TASK_UNINTERRUPTIBLE);
 }
 
-#else
+#else /* !CONFIG_HOTPLUG_CPU: */
 
 static inline void balance_push(struct rq *rq)
 {
@@ -8132,7 +8132,7 @@ static inline void balance_hotplug_wait(void)
 {
 }
 
-#endif /* CONFIG_HOTPLUG_CPU */
+#endif /* !CONFIG_HOTPLUG_CPU */
 
 void set_rq_online(struct rq *rq)
 {
@@ -8441,7 +8441,7 @@ int sched_cpu_dying(unsigned int cpu)
 	sched_core_cpu_dying(cpu);
 	return 0;
 }
-#endif
+#endif /* CONFIG_HOTPLUG_CPU */
 
 void __init sched_init_smp(void)
 {
@@ -8475,12 +8475,12 @@ static int __init migration_init(void)
 }
 early_initcall(migration_init);
 
-#else
+#else /* !CONFIG_SMP: */
 void __init sched_init_smp(void)
 {
 	sched_init_granularity();
 }
-#endif /* CONFIG_SMP */
+#endif /* !CONFIG_SMP */
 
 int in_sched_functions(unsigned long addr)
 {
@@ -8632,15 +8632,15 @@ void __init sched_init(void)
 		INIT_LIST_HEAD(&rq->cfs_tasks);
 
 		rq_attach_root(rq, &def_root_domain);
-#ifdef CONFIG_NO_HZ_COMMON
+# ifdef CONFIG_NO_HZ_COMMON
 		rq->last_blocked_load_update_tick = jiffies;
 		atomic_set(&rq->nohz_flags, 0);
 
 		INIT_CSD(&rq->nohz_csd, nohz_csd_func, rq);
-#endif
-#ifdef CONFIG_HOTPLUG_CPU
+# endif
+# ifdef CONFIG_HOTPLUG_CPU
 		rcuwait_init(&rq->hotplug_wait);
-#endif
+# endif
 #endif /* CONFIG_SMP */
 		hrtick_rq_init(rq);
 		atomic_set(&rq->nr_iowait, 0);
@@ -8825,7 +8825,7 @@ void __cant_sleep(const char *file, int line, int preempt_offset)
 }
 EXPORT_SYMBOL_GPL(__cant_sleep);
 
-#ifdef CONFIG_SMP
+# ifdef CONFIG_SMP
 void __cant_migrate(const char *file, int line)
 {
 	static unsigned long prev_jiffy;
@@ -8856,8 +8856,8 @@ void __cant_migrate(const char *file, int line)
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
 }
 EXPORT_SYMBOL_GPL(__cant_migrate);
-#endif
-#endif
+# endif /* CONFIG_SMP */
+#endif /* CONFIG_DEBUG_ATOMIC_SLEEP */
 
 #ifdef CONFIG_MAGIC_SYSRQ
 void normalize_rt_tasks(void)
@@ -8897,7 +8897,7 @@ void normalize_rt_tasks(void)
 
 #endif /* CONFIG_MAGIC_SYSRQ */
 
-#if defined(CONFIG_KGDB_KDB)
+#ifdef CONFIG_KGDB_KDB
 /*
  * These functions are only useful for KDB.
  *
@@ -8921,7 +8921,7 @@ struct task_struct *curr_task(int cpu)
 	return cpu_curr(cpu);
 }
 
-#endif /* defined(CONFIG_KGDB_KDB) */
+#endif /* CONFIG_KGDB_KDB */
 
 #ifdef CONFIG_CGROUP_SCHED
 /* task_group_lock serializes the addition/removal of task groups */
@@ -9802,7 +9802,7 @@ static int cpu_idle_write_s64(struct cgroup_subsys_state *css,
 		scx_group_set_idle(css_tg(css), idle);
 	return ret;
 }
-#endif
+#endif /* CONFIG_GROUP_SCHED_WEIGHT */
 
 static struct cftype cpu_legacy_files[] = {
 #ifdef CONFIG_GROUP_SCHED_WEIGHT
@@ -9930,7 +9930,7 @@ static int cpu_extra_stat_show(struct seq_file *sf,
 			   cfs_b->nr_periods, cfs_b->nr_throttled,
 			   throttled_usec, cfs_b->nr_burst, burst_usec);
 	}
-#endif
+#endif /* CONFIG_CFS_BANDWIDTH */
 	return 0;
 }
 
@@ -10071,7 +10071,7 @@ static ssize_t cpu_max_write(struct kernfs_open_file *of,
 		ret = tg_set_cfs_bandwidth(tg, period, quota, burst);
 	return ret ?: nbytes;
 }
-#endif
+#endif /* CONFIG_CFS_BANDWIDTH */
 
 static struct cftype cpu_files[] = {
 #ifdef CONFIG_GROUP_SCHED_WEIGHT
@@ -10107,7 +10107,7 @@ static struct cftype cpu_files[] = {
 		.read_u64 = cpu_cfs_burst_read_u64,
 		.write_u64 = cpu_cfs_burst_write_u64,
 	},
-#endif
+#endif /* CONFIG_CFS_BANDWIDTH */
 #ifdef CONFIG_UCLAMP_TASK_GROUP
 	{
 		.name = "uclamp.min",
@@ -10121,7 +10121,7 @@ static struct cftype cpu_files[] = {
 		.seq_show = cpu_uclamp_max_show,
 		.write = cpu_uclamp_max_write,
 	},
-#endif
+#endif /* CONFIG_UCLAMP_TASK_GROUP */
 	{ }	/* terminate */
 };
 
@@ -10142,7 +10142,7 @@ struct cgroup_subsys cpu_cgrp_subsys = {
 	.threaded	= true,
 };
 
-#endif	/* CONFIG_CGROUP_SCHED */
+#endif /* CONFIG_CGROUP_SCHED */
 
 void dump_cpu_task(int cpu)
 {
@@ -10728,7 +10728,7 @@ void sched_mm_cid_fork(struct task_struct *t)
 	WARN_ON_ONCE(!t->mm || t->mm_cid != -1);
 	t->mm_cid_active = 1;
 }
-#endif
+#endif /* CONFIG_SCHED_MM_CID */
 
 #ifdef CONFIG_SCHED_CLASS_EXT
 void sched_deq_and_put_task(struct task_struct *p, int queue_flags,
@@ -10763,4 +10763,4 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx)
 	if (ctx->running)
 		set_next_task(rq, ctx->p);
 }
-#endif	/* CONFIG_SCHED_CLASS_EXT */
+#endif /* CONFIG_SCHED_CLASS_EXT */
-- 
2.45.2

