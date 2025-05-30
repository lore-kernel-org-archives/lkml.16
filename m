Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25427230BD0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597688; cv=none; b=j2JSK9iu/p4cBtoknOzAG/c8mi0AqY5dkz6aa406dOFSIpA73Tijd3lfJy8R7kwbdM9HcSkUIGwmFkvEn8nM4wamzO8pF002JoZrM3ok8kR7PixNew59G0duMevNeJwEyGqdt2i4c6xkLtcMRrmleCC7dTnfwAia6/vBcRYdre4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597688; c=relaxed/simple;
	bh=EoT2dKpjRWSuMyiN59l+2L7JeKYfQR+Tq6keNX2utZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bp9iDoJB+WclVoOR/agzVoReH6xeO584rgkEnMWMs1TB5XsaoetGt4Ikz73EM/yZu+z4AKOViDEOGmoznUdihQqmAx9RB3dqEAk4RJ/T3GbwCtJ+x66nyaBE4kpUrKURuRkmw/vVTBdZZLrjq+MjA+OX0kbWl1bfQ25GvAlYY98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=ra1IbCWz; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="ra1IbCWz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tSBVL+2tXg2frEyJDCxYdCIb+/FbCVTtW/DFFR+NWi4=; b=ra1IbCWzYjXAeGcf5LUjRsW/Tc
	d31sOF+bs/BjFXRTAkEwHpsUvISLMde6zzUb1/w00iMMuNcYJYwB4GnG/qZBfBHvdwCu5R+OQ9PPk
	cyEeHjR9m0XLb6IEsd4T2sNXOqcDB9Zl66vakwjnM92cIdlZn9jmyIWEJGJCRwv1PAquvZY2V5Bvo
	dqH2Sh4p0VT0inNUlXKw898NXJy1LiC0bYMZZNJ3yMqKTDODjitNgkFviOk1zbGHXak4rHHg4sQCn
	YHtL9PUsGyThmsmAlDdia+aE6L6/odL1XBluYB1+xKLyBY8plqN7FpcRsjStA8Ca1u7lcvKO8fOkO
	ZlSZD+1Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uKw8H-009kfY-1N;
	Fri, 30 May 2025 17:34:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 30 May 2025 17:34:33 +0800
Date: Fri, 30 May 2025 17:34:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
	torvalds@linux-foundation.org, peterz@infradead.org,
	sshegde@linux.ibm.com, tglx@linutronix.de, vschneid@redhat.com,
	rostedt@goodmis.org, mgorman@suse.de, vincent.guittot@linaro.org,
	bigeasy@linutronix.de, mingo@kernel.org
Subject: [PATCH] sched: Break dependency loop between sched.h and preempt.h
Message-ID: <aDl7qWiO94tGz6X9@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
X-Newsgroups: apana.lists.os.linux.kernel

Ingo Molnar <mingo@kernel.org> wrote:
>
> The latest version of this series can be found at:
> 
>        git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/core

I'm trying to break a dependency loop between linux/sched.h and
linux/preempt.h and your tree seems to be a good base for my
patch.

---8<---
There is a dependency loop between linux/preempt.h and
linux/sched.h:

https://patchwork.kernel.org/project/linux-crypto/patch/20250530041658.909576-1-chenhuacai@loongson.cn/

In particular, sched.h relies on PREEMPT_LOCK_OFFSET from preempt.h,
introduced by commit fe32d3cd5e8e; while preempt.h relies on sched.h
for current->softirq_disable_cnt, introduced by commit 728b478d2d35.

sched.h actually includes preempt.h, while preempt.h does not include
sched.h which causes build failures in users who include preempt.h
without sched.h.

Fix this by splitting struct task_struct out of sched.h and into
sched/types.h.  Then preempt.h can include sched/types.h and sched.h
can continue to include preempt.h without creating a loop.

Note that the struct seq_file forward declaration has been kept
in linux/sched.h despite there being no users in either sched.h
or sched/types.h.  This is because multiple header files are
relying on that forward declaration.

Reported-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 1fad1c8a4c76..abb0d982396b 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -7,8 +7,10 @@
  * preempt_count (used for kernel preemption, interrupt count, etc.)
  */
 
+#include <asm/current.h>
 #include <linux/linkage.h>
 #include <linux/cleanup.h>
+#include <linux/sched/types.h>
 #include <linux/types.h>
 
 /*
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8d3167059675..44bfd980f620 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -10,80 +10,21 @@
 #include <uapi/linux/sched.h>
 
 #include <asm/current.h>
-#include <asm/processor.h>
 #include <linux/thread_info.h>
 #include <linux/preempt.h>
 #include <linux/cpumask_types.h>
 
-#include <linux/cache.h>
-#include <linux/irqflags_types.h>
-#include <linux/smp_types.h>
-#include <linux/pid_types.h>
-#include <linux/sem_types.h>
-#include <linux/shm.h>
-#include <linux/kmsan_types.h>
-#include <linux/mutex_types.h>
-#include <linux/plist_types.h>
-#include <linux/hrtimer_types.h>
-#include <linux/timer_types.h>
-#include <linux/seccomp_types.h>
-#include <linux/nodemask_types.h>
-#include <linux/refcount_types.h>
 #include <linux/resource.h>
-#include <linux/latencytop.h>
 #include <linux/sched/prio.h>
 #include <linux/sched/types.h>
-#include <linux/signal_types.h>
-#include <linux/syscall_user_dispatch_types.h>
-#include <linux/mm_types_task.h>
-#include <linux/netdevice_xmit.h>
-#include <linux/task_io_accounting.h>
-#include <linux/posix-timers_types.h>
-#include <linux/restart_block.h>
-#include <uapi/linux/rseq.h>
-#include <linux/seqlock_types.h>
-#include <linux/kcsan.h>
-#include <linux/rv.h>
-#include <linux/uidgid_types.h>
 #include <linux/tracepoint-defs.h>
 #include <asm/kmap_size.h>
 
-/* task_struct member predeclarations (sorted alphabetically): */
-struct audit_context;
-struct bio_list;
-struct blk_plug;
-struct bpf_local_storage;
-struct bpf_run_ctx;
-struct bpf_net_context;
-struct capture_control;
-struct cfs_rq;
-struct fs_struct;
-struct futex_pi_state;
-struct io_context;
-struct io_uring_task;
-struct mempolicy;
-struct nameidata;
-struct nsproxy;
-struct perf_event_context;
-struct perf_ctx_data;
+/* struct predeclarations (sorted alphabetically): */
 struct pid_namespace;
-struct pipe_inode_info;
-struct rcu_node;
-struct reclaim_state;
-struct robust_list_head;
 struct root_domain;
-struct rq;
 struct sched_attr;
-struct sched_dl_entity;
 struct seq_file;
-struct sighand_struct;
-struct signal_struct;
-struct task_delay_info;
-struct task_group;
-struct task_struct;
-struct user_event_mm;
-
-#include <linux/sched/ext.h>
 
 /*
  * Task state bitmask. NOTE! These bits are also
@@ -310,14 +251,6 @@ struct user_event_mm;
 
 #define get_current_state()	READ_ONCE(current->__state)
 
-/*
- * Define the task command name length as enum, then it can be visible to
- * BPF programs.
- */
-enum {
-	TASK_COMM_LEN = 16,
-};
-
 extern void sched_tick(void);
 
 #define	MAX_SCHEDULE_TIMEOUT		LONG_MAX
@@ -343,46 +276,6 @@ extern void io_schedule(void);
 DECLARE_TRACEPOINT(sched_set_state_tp);
 extern void __trace_set_current_state(int state_value);
 
-/**
- * struct prev_cputime - snapshot of system and user cputime
- * @utime: time spent in user mode
- * @stime: time spent in system mode
- * @lock: protects the above two fields
- *
- * Stores previous user/system time values such that we can guarantee
- * monotonicity.
- */
-struct prev_cputime {
-#ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
-	u64				utime;
-	u64				stime;
-	raw_spinlock_t			lock;
-#endif
-};
-
-enum vtime_state {
-	/* Task is sleeping or running in a CPU with VTIME inactive: */
-	VTIME_INACTIVE = 0,
-	/* Task is idle */
-	VTIME_IDLE,
-	/* Task runs in kernelspace in a CPU with VTIME active: */
-	VTIME_SYS,
-	/* Task runs in userspace in a CPU with VTIME active: */
-	VTIME_USER,
-	/* Task runs as guests in a CPU with VTIME active: */
-	VTIME_GUEST,
-};
-
-struct vtime {
-	seqcount_t		seqcount;
-	unsigned long long	starttime;
-	enum vtime_state	state;
-	unsigned int		cpu;
-	u64			utime;
-	u64			stime;
-	u64			gtime;
-};
-
 /*
  * Utilization clamp constraints.
  * @UCLAMP_MIN:	Minimum utilization
@@ -404,380 +297,6 @@ struct sched_param {
 	int sched_priority;
 };
 
-struct sched_info {
-#ifdef CONFIG_SCHED_INFO
-	/* Cumulative counters: */
-
-	/* # of times we have run on this CPU: */
-	unsigned long			pcount;
-
-	/* Time spent waiting on a runqueue: */
-	unsigned long long		run_delay;
-
-	/* Max time spent waiting on a runqueue: */
-	unsigned long long		max_run_delay;
-
-	/* Min time spent waiting on a runqueue: */
-	unsigned long long		min_run_delay;
-
-	/* Timestamps: */
-
-	/* When did we last run on a CPU? */
-	unsigned long long		last_arrival;
-
-	/* When were we last queued to run? */
-	unsigned long long		last_queued;
-
-#endif /* CONFIG_SCHED_INFO */
-};
-
-/*
- * Integer metrics need fixed point arithmetic, e.g., sched/fair
- * has a few: load, load_avg, util_avg, freq, and capacity.
- *
- * We define a basic fixed point arithmetic range, and then formalize
- * all these metrics based on that basic range.
- */
-# define SCHED_FIXEDPOINT_SHIFT		10
-# define SCHED_FIXEDPOINT_SCALE		(1L << SCHED_FIXEDPOINT_SHIFT)
-
-/* Increase resolution of cpu_capacity calculations */
-# define SCHED_CAPACITY_SHIFT		SCHED_FIXEDPOINT_SHIFT
-# define SCHED_CAPACITY_SCALE		(1L << SCHED_CAPACITY_SHIFT)
-
-struct load_weight {
-	unsigned long			weight;
-	u32				inv_weight;
-};
-
-/*
- * The load/runnable/util_avg accumulates an infinite geometric series
- * (see __update_load_avg_cfs_rq() in kernel/sched/pelt.c).
- *
- * [load_avg definition]
- *
- *   load_avg = runnable% * scale_load_down(load)
- *
- * [runnable_avg definition]
- *
- *   runnable_avg = runnable% * SCHED_CAPACITY_SCALE
- *
- * [util_avg definition]
- *
- *   util_avg = running% * SCHED_CAPACITY_SCALE
- *
- * where runnable% is the time ratio that a sched_entity is runnable and
- * running% the time ratio that a sched_entity is running.
- *
- * For cfs_rq, they are the aggregated values of all runnable and blocked
- * sched_entities.
- *
- * The load/runnable/util_avg doesn't directly factor frequency scaling and CPU
- * capacity scaling. The scaling is done through the rq_clock_pelt that is used
- * for computing those signals (see update_rq_clock_pelt())
- *
- * N.B., the above ratios (runnable% and running%) themselves are in the
- * range of [0, 1]. To do fixed point arithmetics, we therefore scale them
- * to as large a range as necessary. This is for example reflected by
- * util_avg's SCHED_CAPACITY_SCALE.
- *
- * [Overflow issue]
- *
- * The 64-bit load_sum can have 4353082796 (=2^64/47742/88761) entities
- * with the highest load (=88761), always runnable on a single cfs_rq,
- * and should not overflow as the number already hits PID_MAX_LIMIT.
- *
- * For all other cases (including 32-bit kernels), struct load_weight's
- * weight will overflow first before we do, because:
- *
- *    Max(load_avg) <= Max(load.weight)
- *
- * Then it is the load_weight's responsibility to consider overflow
- * issues.
- */
-struct sched_avg {
-	u64				last_update_time;
-	u64				load_sum;
-	u64				runnable_sum;
-	u32				util_sum;
-	u32				period_contrib;
-	unsigned long			load_avg;
-	unsigned long			runnable_avg;
-	unsigned long			util_avg;
-	unsigned int			util_est;
-} ____cacheline_aligned;
-
-/*
- * The UTIL_AVG_UNCHANGED flag is used to synchronize util_est with util_avg
- * updates. When a task is dequeued, its util_est should not be updated if its
- * util_avg has not been updated in the meantime.
- * This information is mapped into the MSB bit of util_est at dequeue time.
- * Since max value of util_est for a task is 1024 (PELT util_avg for a task)
- * it is safe to use MSB.
- */
-#define UTIL_EST_WEIGHT_SHIFT		2
-#define UTIL_AVG_UNCHANGED		0x80000000
-
-struct sched_statistics {
-#ifdef CONFIG_SCHEDSTATS
-	u64				wait_start;
-	u64				wait_max;
-	u64				wait_count;
-	u64				wait_sum;
-	u64				iowait_count;
-	u64				iowait_sum;
-
-	u64				sleep_start;
-	u64				sleep_max;
-	s64				sum_sleep_runtime;
-
-	u64				block_start;
-	u64				block_max;
-	s64				sum_block_runtime;
-
-	s64				exec_max;
-	u64				slice_max;
-
-	u64				nr_migrations_cold;
-	u64				nr_failed_migrations_affine;
-	u64				nr_failed_migrations_running;
-	u64				nr_failed_migrations_hot;
-	u64				nr_forced_migrations;
-
-	u64				nr_wakeups;
-	u64				nr_wakeups_sync;
-	u64				nr_wakeups_migrate;
-	u64				nr_wakeups_local;
-	u64				nr_wakeups_remote;
-	u64				nr_wakeups_affine;
-	u64				nr_wakeups_affine_attempts;
-	u64				nr_wakeups_passive;
-	u64				nr_wakeups_idle;
-
-#ifdef CONFIG_SCHED_CORE
-	u64				core_forceidle_sum;
-#endif
-#endif /* CONFIG_SCHEDSTATS */
-} ____cacheline_aligned;
-
-struct sched_entity {
-	/* For load-balancing: */
-	struct load_weight		load;
-	struct rb_node			run_node;
-	u64				deadline;
-	u64				min_vruntime;
-	u64				min_slice;
-
-	struct list_head		group_node;
-	unsigned char			on_rq;
-	unsigned char			sched_delayed;
-	unsigned char			rel_deadline;
-	unsigned char			custom_slice;
-					/* hole */
-
-	u64				exec_start;
-	u64				sum_exec_runtime;
-	u64				prev_sum_exec_runtime;
-	u64				vruntime;
-	s64				vlag;
-	u64				slice;
-
-	u64				nr_migrations;
-
-#ifdef CONFIG_FAIR_GROUP_SCHED
-	int				depth;
-	struct sched_entity		*parent;
-	/* rq on which this entity is (to be) queued: */
-	struct cfs_rq			*cfs_rq;
-	/* rq "owned" by this entity/group: */
-	struct cfs_rq			*my_q;
-	/* cached value of my_q->h_nr_running */
-	unsigned long			runnable_weight;
-#endif
-
-	/*
-	 * Per entity load average tracking.
-	 *
-	 * Put into separate cache line so it does not
-	 * collide with read-mostly values above.
-	 */
-	struct sched_avg		avg;
-};
-
-struct sched_rt_entity {
-	struct list_head		run_list;
-	unsigned long			timeout;
-	unsigned long			watchdog_stamp;
-	unsigned int			time_slice;
-	unsigned short			on_rq;
-	unsigned short			on_list;
-
-	struct sched_rt_entity		*back;
-#ifdef CONFIG_RT_GROUP_SCHED
-	struct sched_rt_entity		*parent;
-	/* rq on which this entity is (to be) queued: */
-	struct rt_rq			*rt_rq;
-	/* rq "owned" by this entity/group: */
-	struct rt_rq			*my_q;
-#endif
-} __randomize_layout;
-
-typedef bool (*dl_server_has_tasks_f)(struct sched_dl_entity *);
-typedef struct task_struct *(*dl_server_pick_f)(struct sched_dl_entity *);
-
-struct sched_dl_entity {
-	struct rb_node			rb_node;
-
-	/*
-	 * Original scheduling parameters. Copied here from sched_attr
-	 * during sched_setattr(), they will remain the same until
-	 * the next sched_setattr().
-	 */
-	u64				dl_runtime;	/* Maximum runtime for each instance	*/
-	u64				dl_deadline;	/* Relative deadline of each instance	*/
-	u64				dl_period;	/* Separation of two instances (period) */
-	u64				dl_bw;		/* dl_runtime / dl_period		*/
-	u64				dl_density;	/* dl_runtime / dl_deadline		*/
-
-	/*
-	 * Actual scheduling parameters. Initialized with the values above,
-	 * they are continuously updated during task execution. Note that
-	 * the remaining runtime could be < 0 in case we are in overrun.
-	 */
-	s64				runtime;	/* Remaining runtime for this instance	*/
-	u64				deadline;	/* Absolute deadline for this instance	*/
-	unsigned int			flags;		/* Specifying the scheduler behaviour	*/
-
-	/*
-	 * Some bool flags:
-	 *
-	 * @dl_throttled tells if we exhausted the runtime. If so, the
-	 * task has to wait for a replenishment to be performed at the
-	 * next firing of dl_timer.
-	 *
-	 * @dl_yielded tells if task gave up the CPU before consuming
-	 * all its available runtime during the last job.
-	 *
-	 * @dl_non_contending tells if the task is inactive while still
-	 * contributing to the active utilization. In other words, it
-	 * indicates if the inactive timer has been armed and its handler
-	 * has not been executed yet. This flag is useful to avoid race
-	 * conditions between the inactive timer handler and the wakeup
-	 * code.
-	 *
-	 * @dl_overrun tells if the task asked to be informed about runtime
-	 * overruns.
-	 *
-	 * @dl_server tells if this is a server entity.
-	 *
-	 * @dl_defer tells if this is a deferred or regular server. For
-	 * now only defer server exists.
-	 *
-	 * @dl_defer_armed tells if the deferrable server is waiting
-	 * for the replenishment timer to activate it.
-	 *
-	 * @dl_server_active tells if the dlserver is active(started).
-	 * dlserver is started on first cfs enqueue on an idle runqueue
-	 * and is stopped when a dequeue results in 0 cfs tasks on the
-	 * runqueue. In other words, dlserver is active only when cpu's
-	 * runqueue has atleast one cfs task.
-	 *
-	 * @dl_defer_running tells if the deferrable server is actually
-	 * running, skipping the defer phase.
-	 */
-	unsigned int			dl_throttled      : 1;
-	unsigned int			dl_yielded        : 1;
-	unsigned int			dl_non_contending : 1;
-	unsigned int			dl_overrun	  : 1;
-	unsigned int			dl_server         : 1;
-	unsigned int			dl_server_active  : 1;
-	unsigned int			dl_defer	  : 1;
-	unsigned int			dl_defer_armed	  : 1;
-	unsigned int			dl_defer_running  : 1;
-
-	/*
-	 * Bandwidth enforcement timer. Each -deadline task has its
-	 * own bandwidth to be enforced, thus we need one timer per task.
-	 */
-	struct hrtimer			dl_timer;
-
-	/*
-	 * Inactive timer, responsible for decreasing the active utilization
-	 * at the "0-lag time". When a -deadline task blocks, it contributes
-	 * to GRUB's active utilization until the "0-lag time", hence a
-	 * timer is needed to decrease the active utilization at the correct
-	 * time.
-	 */
-	struct hrtimer			inactive_timer;
-
-	/*
-	 * Bits for DL-server functionality. Also see the comment near
-	 * dl_server_update().
-	 *
-	 * @rq the runqueue this server is for
-	 *
-	 * @server_has_tasks() returns true if @server_pick return a
-	 * runnable task.
-	 */
-	struct rq			*rq;
-	dl_server_has_tasks_f		server_has_tasks;
-	dl_server_pick_f		server_pick_task;
-
-#ifdef CONFIG_RT_MUTEXES
-	/*
-	 * Priority Inheritance. When a DEADLINE scheduling entity is boosted
-	 * pi_se points to the donor, otherwise points to the dl_se it belongs
-	 * to (the original one/itself).
-	 */
-	struct sched_dl_entity *pi_se;
-#endif
-};
-
-#ifdef CONFIG_UCLAMP_TASK
-/* Number of utilization clamp buckets (shorter alias) */
-#define UCLAMP_BUCKETS CONFIG_UCLAMP_BUCKETS_COUNT
-
-/*
- * Utilization clamp for a scheduling entity
- * @value:		clamp value "assigned" to a se
- * @bucket_id:		bucket index corresponding to the "assigned" value
- * @active:		the se is currently refcounted in a rq's bucket
- * @user_defined:	the requested clamp value comes from user-space
- *
- * The bucket_id is the index of the clamp bucket matching the clamp value
- * which is pre-computed and stored to avoid expensive integer divisions from
- * the fast path.
- *
- * The active bit is set whenever a task has got an "effective" value assigned,
- * which can be different from the clamp value "requested" from user-space.
- * This allows to know a task is refcounted in the rq's bucket corresponding
- * to the "effective" bucket_id.
- *
- * The user_defined bit is set whenever a task has got a task-specific clamp
- * value requested from userspace, i.e. the system defaults apply to this task
- * just as a restriction. This allows to relax default clamps when a less
- * restrictive task-specific value has been requested, thus allowing to
- * implement a "nice" semantic. For example, a task running with a 20%
- * default boost can still drop its own boosting to 0%.
- */
-struct uclamp_se {
-	unsigned int value		: bits_per(SCHED_CAPACITY_SCALE);
-	unsigned int bucket_id		: bits_per(UCLAMP_BUCKETS);
-	unsigned int active		: 1;
-	unsigned int user_defined	: 1;
-};
-#endif /* CONFIG_UCLAMP_TASK */
-
-union rcu_special {
-	struct {
-		u8			blocked;
-		u8			need_qs;
-		u8			exp_hint; /* Hint for performance. */
-		u8			need_mb; /* Readers need smp_mb(). */
-	} b; /* Bits. */
-	u32 s; /* Set of bits. */
-};
-
 enum perf_event_task_context {
 	perf_invalid_context = -1,
 	perf_hw_context = 0,
@@ -785,863 +304,6 @@ enum perf_event_task_context {
 	perf_nr_task_contexts,
 };
 
-/*
- * Number of contexts where an event can trigger:
- *      task, softirq, hardirq, nmi.
- */
-#define PERF_NR_CONTEXTS	4
-
-struct wake_q_node {
-	struct wake_q_node *next;
-};
-
-struct kmap_ctrl {
-#ifdef CONFIG_KMAP_LOCAL
-	int				idx;
-	pte_t				pteval[KM_MAX_IDX];
-#endif
-};
-
-struct task_struct {
-#ifdef CONFIG_THREAD_INFO_IN_TASK
-	/*
-	 * For reasons of header soup (see current_thread_info()), this
-	 * must be the first element of task_struct.
-	 */
-	struct thread_info		thread_info;
-#endif
-	unsigned int			__state;
-
-	/* saved state for "spinlock sleepers" */
-	unsigned int			saved_state;
-
-	/*
-	 * This begins the randomizable portion of task_struct. Only
-	 * scheduling-critical items should be added above here.
-	 */
-	randomized_struct_fields_start
-
-	void				*stack;
-	refcount_t			usage;
-	/* Per task flags (PF_*), defined further below: */
-	unsigned int			flags;
-	unsigned int			ptrace;
-
-#ifdef CONFIG_MEM_ALLOC_PROFILING
-	struct alloc_tag		*alloc_tag;
-#endif
-
-	int				on_cpu;
-	struct __call_single_node	wake_entry;
-	unsigned int			wakee_flips;
-	unsigned long			wakee_flip_decay_ts;
-	struct task_struct		*last_wakee;
-
-	/*
-	 * recent_used_cpu is initially set as the last CPU used by a task
-	 * that wakes affine another task. Waker/wakee relationships can
-	 * push tasks around a CPU where each wakeup moves to the next one.
-	 * Tracking a recently used CPU allows a quick search for a recently
-	 * used CPU that may be idle.
-	 */
-	int				recent_used_cpu;
-	int				wake_cpu;
-	int				on_rq;
-
-	int				prio;
-	int				static_prio;
-	int				normal_prio;
-	unsigned int			rt_priority;
-
-	struct sched_entity		se;
-	struct sched_rt_entity		rt;
-	struct sched_dl_entity		dl;
-	struct sched_dl_entity		*dl_server;
-#ifdef CONFIG_SCHED_CLASS_EXT
-	struct sched_ext_entity		scx;
-#endif
-	const struct sched_class	*sched_class;
-
-#ifdef CONFIG_SCHED_CORE
-	struct rb_node			core_node;
-	unsigned long			core_cookie;
-	unsigned int			core_occupation;
-#endif
-
-#ifdef CONFIG_CGROUP_SCHED
-	struct task_group		*sched_task_group;
-#endif
-
-
-#ifdef CONFIG_UCLAMP_TASK
-	/*
-	 * Clamp values requested for a scheduling entity.
-	 * Must be updated with task_rq_lock() held.
-	 */
-	struct uclamp_se		uclamp_req[UCLAMP_CNT];
-	/*
-	 * Effective clamp values used for a scheduling entity.
-	 * Must be updated with task_rq_lock() held.
-	 */
-	struct uclamp_se		uclamp[UCLAMP_CNT];
-#endif
-
-	struct sched_statistics         stats;
-
-#ifdef CONFIG_PREEMPT_NOTIFIERS
-	/* List of struct preempt_notifier: */
-	struct hlist_head		preempt_notifiers;
-#endif
-
-#ifdef CONFIG_BLK_DEV_IO_TRACE
-	unsigned int			btrace_seq;
-#endif
-
-	unsigned int			policy;
-	unsigned long			max_allowed_capacity;
-	int				nr_cpus_allowed;
-	const cpumask_t			*cpus_ptr;
-	cpumask_t			*user_cpus_ptr;
-	cpumask_t			cpus_mask;
-	void				*migration_pending;
-	unsigned short			migration_disabled;
-	unsigned short			migration_flags;
-
-#ifdef CONFIG_PREEMPT_RCU
-	int				rcu_read_lock_nesting;
-	union rcu_special		rcu_read_unlock_special;
-	struct list_head		rcu_node_entry;
-	struct rcu_node			*rcu_blocked_node;
-#endif /* #ifdef CONFIG_PREEMPT_RCU */
-
-#ifdef CONFIG_TASKS_RCU
-	unsigned long			rcu_tasks_nvcsw;
-	u8				rcu_tasks_holdout;
-	u8				rcu_tasks_idx;
-	int				rcu_tasks_idle_cpu;
-	struct list_head		rcu_tasks_holdout_list;
-	int				rcu_tasks_exit_cpu;
-	struct list_head		rcu_tasks_exit_list;
-#endif /* #ifdef CONFIG_TASKS_RCU */
-
-#ifdef CONFIG_TASKS_TRACE_RCU
-	int				trc_reader_nesting;
-	int				trc_ipi_to_cpu;
-	union rcu_special		trc_reader_special;
-	struct list_head		trc_holdout_list;
-	struct list_head		trc_blkd_node;
-	int				trc_blkd_cpu;
-#endif /* #ifdef CONFIG_TASKS_TRACE_RCU */
-
-	struct sched_info		sched_info;
-
-	struct list_head		tasks;
-	struct plist_node		pushable_tasks;
-	struct rb_node			pushable_dl_tasks;
-
-	struct mm_struct		*mm;
-	struct mm_struct		*active_mm;
-	struct address_space		*faults_disabled_mapping;
-
-	int				exit_state;
-	int				exit_code;
-	int				exit_signal;
-	/* The signal sent when the parent dies: */
-	int				pdeath_signal;
-	/* JOBCTL_*, siglock protected: */
-	unsigned long			jobctl;
-
-	/* Used for emulating ABI behavior of previous Linux versions: */
-	unsigned int			personality;
-
-	/* Scheduler bits, serialized by scheduler locks: */
-	unsigned			sched_reset_on_fork:1;
-	unsigned			sched_contributes_to_load:1;
-	unsigned			sched_migrated:1;
-	unsigned			sched_task_hot:1;
-
-	/* Force alignment to the next boundary: */
-	unsigned			:0;
-
-	/* Unserialized, strictly 'current' */
-
-	/*
-	 * This field must not be in the scheduler word above due to wakelist
-	 * queueing no longer being serialized by p->on_cpu. However:
-	 *
-	 * p->XXX = X;			ttwu()
-	 * schedule()			  if (p->on_rq && ..) // false
-	 *   smp_mb__after_spinlock();	  if (smp_load_acquire(&p->on_cpu) && //true
-	 *   deactivate_task()		      ttwu_queue_wakelist())
-	 *     p->on_rq = 0;			p->sched_remote_wakeup = Y;
-	 *
-	 * guarantees all stores of 'current' are visible before
-	 * ->sched_remote_wakeup gets used, so it can be in this word.
-	 */
-	unsigned			sched_remote_wakeup:1;
-#ifdef CONFIG_RT_MUTEXES
-	unsigned			sched_rt_mutex:1;
-#endif
-
-	/* Bit to tell TOMOYO we're in execve(): */
-	unsigned			in_execve:1;
-	unsigned			in_iowait:1;
-#ifndef TIF_RESTORE_SIGMASK
-	unsigned			restore_sigmask:1;
-#endif
-#ifdef CONFIG_MEMCG_V1
-	unsigned			in_user_fault:1;
-#endif
-#ifdef CONFIG_LRU_GEN
-	/* whether the LRU algorithm may apply to this access */
-	unsigned			in_lru_fault:1;
-#endif
-#ifdef CONFIG_COMPAT_BRK
-	unsigned			brk_randomized:1;
-#endif
-#ifdef CONFIG_CGROUPS
-	/* disallow userland-initiated cgroup migration */
-	unsigned			no_cgroup_migration:1;
-	/* task is frozen/stopped (used by the cgroup freezer) */
-	unsigned			frozen:1;
-#endif
-#ifdef CONFIG_BLK_CGROUP
-	unsigned			use_memdelay:1;
-#endif
-#ifdef CONFIG_PSI
-	/* Stalled due to lack of memory */
-	unsigned			in_memstall:1;
-#endif
-#ifdef CONFIG_PAGE_OWNER
-	/* Used by page_owner=on to detect recursion in page tracking. */
-	unsigned			in_page_owner:1;
-#endif
-#ifdef CONFIG_EVENTFD
-	/* Recursion prevention for eventfd_signal() */
-	unsigned			in_eventfd:1;
-#endif
-#ifdef CONFIG_ARCH_HAS_CPU_PASID
-	unsigned			pasid_activated:1;
-#endif
-#ifdef CONFIG_X86_BUS_LOCK_DETECT
-	unsigned			reported_split_lock:1;
-#endif
-#ifdef CONFIG_TASK_DELAY_ACCT
-	/* delay due to memory thrashing */
-	unsigned                        in_thrashing:1;
-#endif
-#ifdef CONFIG_PREEMPT_RT
-	struct netdev_xmit		net_xmit;
-#endif
-	unsigned long			atomic_flags; /* Flags requiring atomic access. */
-
-	struct restart_block		restart_block;
-
-	pid_t				pid;
-	pid_t				tgid;
-
-#ifdef CONFIG_STACKPROTECTOR
-	/* Canary value for the -fstack-protector GCC feature: */
-	unsigned long			stack_canary;
-#endif
-	/*
-	 * Pointers to the (original) parent process, youngest child, younger sibling,
-	 * older sibling, respectively.  (p->father can be replaced with
-	 * p->real_parent->pid)
-	 */
-
-	/* Real parent process: */
-	struct task_struct __rcu	*real_parent;
-
-	/* Recipient of SIGCHLD, wait4() reports: */
-	struct task_struct __rcu	*parent;
-
-	/*
-	 * Children/sibling form the list of natural children:
-	 */
-	struct list_head		children;
-	struct list_head		sibling;
-	struct task_struct		*group_leader;
-
-	/*
-	 * 'ptraced' is the list of tasks this task is using ptrace() on.
-	 *
-	 * This includes both natural children and PTRACE_ATTACH targets.
-	 * 'ptrace_entry' is this task's link on the p->parent->ptraced list.
-	 */
-	struct list_head		ptraced;
-	struct list_head		ptrace_entry;
-
-	/* PID/PID hash table linkage. */
-	struct pid			*thread_pid;
-	struct hlist_node		pid_links[PIDTYPE_MAX];
-	struct list_head		thread_node;
-
-	struct completion		*vfork_done;
-
-	/* CLONE_CHILD_SETTID: */
-	int __user			*set_child_tid;
-
-	/* CLONE_CHILD_CLEARTID: */
-	int __user			*clear_child_tid;
-
-	/* PF_KTHREAD | PF_IO_WORKER */
-	void				*worker_private;
-
-	u64				utime;
-	u64				stime;
-#ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
-	u64				utimescaled;
-	u64				stimescaled;
-#endif
-	u64				gtime;
-	struct prev_cputime		prev_cputime;
-#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
-	struct vtime			vtime;
-#endif
-
-#ifdef CONFIG_NO_HZ_FULL
-	atomic_t			tick_dep_mask;
-#endif
-	/* Context switch counts: */
-	unsigned long			nvcsw;
-	unsigned long			nivcsw;
-
-	/* Monotonic time in nsecs: */
-	u64				start_time;
-
-	/* Boot based time in nsecs: */
-	u64				start_boottime;
-
-	/* MM fault and swap info: this can arguably be seen as either mm-specific or thread-specific: */
-	unsigned long			min_flt;
-	unsigned long			maj_flt;
-
-	/* Empty if CONFIG_POSIX_CPUTIMERS=n */
-	struct posix_cputimers		posix_cputimers;
-
-#ifdef CONFIG_POSIX_CPU_TIMERS_TASK_WORK
-	struct posix_cputimers_work	posix_cputimers_work;
-#endif
-
-	/* Process credentials: */
-
-	/* Tracer's credentials at attach: */
-	const struct cred __rcu		*ptracer_cred;
-
-	/* Objective and real subjective task credentials (COW): */
-	const struct cred __rcu		*real_cred;
-
-	/* Effective (overridable) subjective task credentials (COW): */
-	const struct cred __rcu		*cred;
-
-#ifdef CONFIG_KEYS
-	/* Cached requested key. */
-	struct key			*cached_requested_key;
-#endif
-
-	/*
-	 * executable name, excluding path.
-	 *
-	 * - normally initialized begin_new_exec()
-	 * - set it with set_task_comm()
-	 *   - strscpy_pad() to ensure it is always NUL-terminated and
-	 *     zero-padded
-	 *   - task_lock() to ensure the operation is atomic and the name is
-	 *     fully updated.
-	 */
-	char				comm[TASK_COMM_LEN];
-
-	struct nameidata		*nameidata;
-
-#ifdef CONFIG_SYSVIPC
-	struct sysv_sem			sysvsem;
-	struct sysv_shm			sysvshm;
-#endif
-#ifdef CONFIG_DETECT_HUNG_TASK
-	unsigned long			last_switch_count;
-	unsigned long			last_switch_time;
-#endif
-	/* Filesystem information: */
-	struct fs_struct		*fs;
-
-	/* Open file information: */
-	struct files_struct		*files;
-
-#ifdef CONFIG_IO_URING
-	struct io_uring_task		*io_uring;
-#endif
-
-	/* Namespaces: */
-	struct nsproxy			*nsproxy;
-
-	/* Signal handlers: */
-	struct signal_struct		*signal;
-	struct sighand_struct __rcu		*sighand;
-	sigset_t			blocked;
-	sigset_t			real_blocked;
-	/* Restored if set_restore_sigmask() was used: */
-	sigset_t			saved_sigmask;
-	struct sigpending		pending;
-	unsigned long			sas_ss_sp;
-	size_t				sas_ss_size;
-	unsigned int			sas_ss_flags;
-
-	struct callback_head		*task_works;
-
-#ifdef CONFIG_AUDIT
-#ifdef CONFIG_AUDITSYSCALL
-	struct audit_context		*audit_context;
-#endif
-	kuid_t				loginuid;
-	unsigned int			sessionid;
-#endif
-	struct seccomp			seccomp;
-	struct syscall_user_dispatch	syscall_dispatch;
-
-	/* Thread group tracking: */
-	u64				parent_exec_id;
-	u64				self_exec_id;
-
-	/* Protection against (de-)allocation: mm, files, fs, tty, keyrings, mems_allowed, mempolicy: */
-	spinlock_t			alloc_lock;
-
-	/* Protection of the PI data structures: */
-	raw_spinlock_t			pi_lock;
-
-	struct wake_q_node		wake_q;
-
-#ifdef CONFIG_RT_MUTEXES
-	/* PI waiters blocked on a rt_mutex held by this task: */
-	struct rb_root_cached		pi_waiters;
-	/* Updated under owner's pi_lock and rq lock */
-	struct task_struct		*pi_top_task;
-	/* Deadlock detection and priority inheritance handling: */
-	struct rt_mutex_waiter		*pi_blocked_on;
-#endif
-
-#ifdef CONFIG_DEBUG_MUTEXES
-	/* Mutex deadlock detection: */
-	struct mutex_waiter		*blocked_on;
-#endif
-
-#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-	struct mutex			*blocker_mutex;
-#endif
-
-#ifdef CONFIG_DEBUG_ATOMIC_SLEEP
-	int				non_block_count;
-#endif
-
-#ifdef CONFIG_TRACE_IRQFLAGS
-	struct irqtrace_events		irqtrace;
-	unsigned int			hardirq_threaded;
-	u64				hardirq_chain_key;
-	int				softirqs_enabled;
-	int				softirq_context;
-	int				irq_config;
-#endif
-#ifdef CONFIG_PREEMPT_RT
-	int				softirq_disable_cnt;
-#endif
-
-#ifdef CONFIG_LOCKDEP
-# define MAX_LOCK_DEPTH			48UL
-	u64				curr_chain_key;
-	int				lockdep_depth;
-	unsigned int			lockdep_recursion;
-	struct held_lock		held_locks[MAX_LOCK_DEPTH];
-#endif
-
-#if defined(CONFIG_UBSAN) && !defined(CONFIG_UBSAN_TRAP)
-	unsigned int			in_ubsan;
-#endif
-
-	/* Journalling filesystem info: */
-	void				*journal_info;
-
-	/* Stacked block device info: */
-	struct bio_list			*bio_list;
-
-	/* Stack plugging: */
-	struct blk_plug			*plug;
-
-	/* VM state: */
-	struct reclaim_state		*reclaim_state;
-
-	struct io_context		*io_context;
-
-#ifdef CONFIG_COMPACTION
-	struct capture_control		*capture_control;
-#endif
-	/* Ptrace state: */
-	unsigned long			ptrace_message;
-	kernel_siginfo_t		*last_siginfo;
-
-	struct task_io_accounting	ioac;
-#ifdef CONFIG_PSI
-	/* Pressure stall state */
-	unsigned int			psi_flags;
-#endif
-#ifdef CONFIG_TASK_XACCT
-	/* Accumulated RSS usage: */
-	u64				acct_rss_mem1;
-	/* Accumulated virtual memory usage: */
-	u64				acct_vm_mem1;
-	/* stime + utime since last update: */
-	u64				acct_timexpd;
-#endif
-#ifdef CONFIG_CPUSETS
-	/* Protected by ->alloc_lock: */
-	nodemask_t			mems_allowed;
-	/* Sequence number to catch updates: */
-	seqcount_spinlock_t		mems_allowed_seq;
-	int				cpuset_mem_spread_rotor;
-#endif
-#ifdef CONFIG_CGROUPS
-	/* Control Group info protected by css_set_lock: */
-	struct css_set __rcu		*cgroups;
-	/* cg_list protected by css_set_lock and tsk->alloc_lock: */
-	struct list_head		cg_list;
-#endif
-#ifdef CONFIG_X86_CPU_RESCTRL
-	u32				closid;
-	u32				rmid;
-#endif
-#ifdef CONFIG_FUTEX
-	struct robust_list_head __user	*robust_list;
-#ifdef CONFIG_COMPAT
-	struct compat_robust_list_head __user *compat_robust_list;
-#endif
-	struct list_head		pi_state_list;
-	struct futex_pi_state		*pi_state_cache;
-	struct mutex			futex_exit_mutex;
-	unsigned int			futex_state;
-#endif
-#ifdef CONFIG_PERF_EVENTS
-	u8				perf_recursion[PERF_NR_CONTEXTS];
-	struct perf_event_context	*perf_event_ctxp;
-	struct mutex			perf_event_mutex;
-	struct list_head		perf_event_list;
-	struct perf_ctx_data __rcu	*perf_ctx_data;
-#endif
-#ifdef CONFIG_DEBUG_PREEMPT
-	unsigned long			preempt_disable_ip;
-#endif
-#ifdef CONFIG_NUMA
-	/* Protected by alloc_lock: */
-	struct mempolicy		*mempolicy;
-	short				il_prev;
-	u8				il_weight;
-	short				pref_node_fork;
-#endif
-#ifdef CONFIG_NUMA_BALANCING
-	int				numa_scan_seq;
-	unsigned int			numa_scan_period;
-	unsigned int			numa_scan_period_max;
-	int				numa_preferred_nid;
-	unsigned long			numa_migrate_retry;
-	/* Migration stamp: */
-	u64				node_stamp;
-	u64				last_task_numa_placement;
-	u64				last_sum_exec_runtime;
-	struct callback_head		numa_work;
-
-	/*
-	 * This pointer is only modified for current in syscall and
-	 * pagefault context (and for tasks being destroyed), so it can be read
-	 * from any of the following contexts:
-	 *  - RCU read-side critical section
-	 *  - current->numa_group from everywhere
-	 *  - task's runqueue locked, task not running
-	 */
-	struct numa_group __rcu		*numa_group;
-
-	/*
-	 * numa_faults is an array split into four regions:
-	 * faults_memory, faults_cpu, faults_memory_buffer, faults_cpu_buffer
-	 * in this precise order.
-	 *
-	 * faults_memory: Exponential decaying average of faults on a per-node
-	 * basis. Scheduling placement decisions are made based on these
-	 * counts. The values remain static for the duration of a PTE scan.
-	 * faults_cpu: Track the nodes the process was running on when a NUMA
-	 * hinting fault was incurred.
-	 * faults_memory_buffer and faults_cpu_buffer: Record faults per node
-	 * during the current scan window. When the scan completes, the counts
-	 * in faults_memory and faults_cpu decay and these values are copied.
-	 */
-	unsigned long			*numa_faults;
-	unsigned long			total_numa_faults;
-
-	/*
-	 * numa_faults_locality tracks if faults recorded during the last
-	 * scan window were remote/local or failed to migrate. The task scan
-	 * period is adapted based on the locality of the faults with different
-	 * weights depending on whether they were shared or private faults
-	 */
-	unsigned long			numa_faults_locality[3];
-
-	unsigned long			numa_pages_migrated;
-#endif /* CONFIG_NUMA_BALANCING */
-
-#ifdef CONFIG_RSEQ
-	struct rseq __user *rseq;
-	u32 rseq_len;
-	u32 rseq_sig;
-	/*
-	 * RmW on rseq_event_mask must be performed atomically
-	 * with respect to preemption.
-	 */
-	unsigned long rseq_event_mask;
-# ifdef CONFIG_DEBUG_RSEQ
-	/*
-	 * This is a place holder to save a copy of the rseq fields for
-	 * validation of read-only fields. The struct rseq has a
-	 * variable-length array at the end, so it cannot be used
-	 * directly. Reserve a size large enough for the known fields.
-	 */
-	char				rseq_fields[sizeof(struct rseq)];
-# endif
-#endif
-
-#ifdef CONFIG_SCHED_MM_CID
-	int				mm_cid;		/* Current cid in mm */
-	int				last_mm_cid;	/* Most recent cid in mm */
-	int				migrate_from_cpu;
-	int				mm_cid_active;	/* Whether cid bitmap is active */
-	struct callback_head		cid_work;
-#endif
-
-	struct tlbflush_unmap_batch	tlb_ubc;
-
-	/* Cache last used pipe for splice(): */
-	struct pipe_inode_info		*splice_pipe;
-
-	struct page_frag		task_frag;
-
-#ifdef CONFIG_TASK_DELAY_ACCT
-	struct task_delay_info		*delays;
-#endif
-
-#ifdef CONFIG_FAULT_INJECTION
-	int				make_it_fail;
-	unsigned int			fail_nth;
-#endif
-	/*
-	 * When (nr_dirtied >= nr_dirtied_pause), it's time to call
-	 * balance_dirty_pages() for a dirty throttling pause:
-	 */
-	int				nr_dirtied;
-	int				nr_dirtied_pause;
-	/* Start of a write-and-pause period: */
-	unsigned long			dirty_paused_when;
-
-#ifdef CONFIG_LATENCYTOP
-	int				latency_record_count;
-	struct latency_record		latency_record[LT_SAVECOUNT];
-#endif
-	/*
-	 * Time slack values; these are used to round up poll() and
-	 * select() etc timeout values. These are in nanoseconds.
-	 */
-	u64				timer_slack_ns;
-	u64				default_timer_slack_ns;
-
-#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
-	unsigned int			kasan_depth;
-#endif
-
-#ifdef CONFIG_KCSAN
-	struct kcsan_ctx		kcsan_ctx;
-#ifdef CONFIG_TRACE_IRQFLAGS
-	struct irqtrace_events		kcsan_save_irqtrace;
-#endif
-#ifdef CONFIG_KCSAN_WEAK_MEMORY
-	int				kcsan_stack_depth;
-#endif
-#endif
-
-#ifdef CONFIG_KMSAN
-	struct kmsan_ctx		kmsan_ctx;
-#endif
-
-#if IS_ENABLED(CONFIG_KUNIT)
-	struct kunit			*kunit_test;
-#endif
-
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	/* Index of current stored address in ret_stack: */
-	int				curr_ret_stack;
-	int				curr_ret_depth;
-
-	/* Stack of return addresses for return function tracing: */
-	unsigned long			*ret_stack;
-
-	/* Timestamp for last schedule: */
-	unsigned long long		ftrace_timestamp;
-	unsigned long long		ftrace_sleeptime;
-
-	/*
-	 * Number of functions that haven't been traced
-	 * because of depth overrun:
-	 */
-	atomic_t			trace_overrun;
-
-	/* Pause tracing: */
-	atomic_t			tracing_graph_pause;
-#endif
-
-#ifdef CONFIG_TRACING
-	/* Bitmask and counter of trace recursion: */
-	unsigned long			trace_recursion;
-#endif /* CONFIG_TRACING */
-
-#ifdef CONFIG_KCOV
-	/* See kernel/kcov.c for more details. */
-
-	/* Coverage collection mode enabled for this task (0 if disabled): */
-	unsigned int			kcov_mode;
-
-	/* Size of the kcov_area: */
-	unsigned int			kcov_size;
-
-	/* Buffer for coverage collection: */
-	void				*kcov_area;
-
-	/* KCOV descriptor wired with this task or NULL: */
-	struct kcov			*kcov;
-
-	/* KCOV common handle for remote coverage collection: */
-	u64				kcov_handle;
-
-	/* KCOV sequence number: */
-	int				kcov_sequence;
-
-	/* Collect coverage from softirq context: */
-	unsigned int			kcov_softirq;
-#endif
-
-#ifdef CONFIG_MEMCG_V1
-	struct mem_cgroup		*memcg_in_oom;
-#endif
-
-#ifdef CONFIG_MEMCG
-	/* Number of pages to reclaim on returning to userland: */
-	unsigned int			memcg_nr_pages_over_high;
-
-	/* Used by memcontrol for targeted memcg charge: */
-	struct mem_cgroup		*active_memcg;
-
-	/* Cache for current->cgroups->memcg->objcg lookups: */
-	struct obj_cgroup		*objcg;
-#endif
-
-#ifdef CONFIG_BLK_CGROUP
-	struct gendisk			*throttle_disk;
-#endif
-
-#ifdef CONFIG_UPROBES
-	struct uprobe_task		*utask;
-#endif
-#if defined(CONFIG_BCACHE) || defined(CONFIG_BCACHE_MODULE)
-	unsigned int			sequential_io;
-	unsigned int			sequential_io_avg;
-#endif
-	struct kmap_ctrl		kmap_ctrl;
-#ifdef CONFIG_DEBUG_ATOMIC_SLEEP
-	unsigned long			task_state_change;
-# ifdef CONFIG_PREEMPT_RT
-	unsigned long			saved_state_change;
-# endif
-#endif
-	struct rcu_head			rcu;
-	refcount_t			rcu_users;
-	int				pagefault_disabled;
-#ifdef CONFIG_MMU
-	struct task_struct		*oom_reaper_list;
-	struct timer_list		oom_reaper_timer;
-#endif
-#ifdef CONFIG_VMAP_STACK
-	struct vm_struct		*stack_vm_area;
-#endif
-#ifdef CONFIG_THREAD_INFO_IN_TASK
-	/* A live task holds one reference: */
-	refcount_t			stack_refcount;
-#endif
-#ifdef CONFIG_LIVEPATCH
-	int patch_state;
-#endif
-#ifdef CONFIG_SECURITY
-	/* Used by LSM modules for access restriction: */
-	void				*security;
-#endif
-#ifdef CONFIG_BPF_SYSCALL
-	/* Used by BPF task local storage */
-	struct bpf_local_storage __rcu	*bpf_storage;
-	/* Used for BPF run context */
-	struct bpf_run_ctx		*bpf_ctx;
-#endif
-	/* Used by BPF for per-TASK xdp storage */
-	struct bpf_net_context		*bpf_net_context;
-
-#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
-	unsigned long			lowest_stack;
-	unsigned long			prev_lowest_stack;
-#endif
-
-#ifdef CONFIG_X86_MCE
-	void __user			*mce_vaddr;
-	__u64				mce_kflags;
-	u64				mce_addr;
-	__u64				mce_ripv : 1,
-					mce_whole_page : 1,
-					__mce_reserved : 62;
-	struct callback_head		mce_kill_me;
-	int				mce_count;
-#endif
-
-#ifdef CONFIG_KRETPROBES
-	struct llist_head               kretprobe_instances;
-#endif
-#ifdef CONFIG_RETHOOK
-	struct llist_head               rethooks;
-#endif
-
-#ifdef CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH
-	/*
-	 * If L1D flush is supported on mm context switch
-	 * then we use this callback head to queue kill work
-	 * to kill tasks that are not running on SMT disabled
-	 * cores
-	 */
-	struct callback_head		l1d_flush_kill;
-#endif
-
-#ifdef CONFIG_RV
-	/*
-	 * Per-task RV monitor. Nowadays fixed in RV_PER_TASK_MONITORS.
-	 * If we find justification for more monitors, we can think
-	 * about adding more or developing a dynamic method. So far,
-	 * none of these are justified.
-	 */
-	union rv_task_monitor		rv[RV_PER_TASK_MONITORS];
-#endif
-
-#ifdef CONFIG_USER_EVENTS
-	struct user_event_mm		*user_event_mm;
-#endif
-
-	/* CPU-specific state of this task: */
-	struct thread_struct		thread;
-
-	/*
-	 * New fields for task_struct should be added above here, so that
-	 * they are included in the randomized portion of task_struct.
-	 */
-	randomized_struct_fields_end
-} __attribute__ ((aligned (64)));
-
 #define TASK_REPORT_IDLE	(TASK_REPORT + 1)
 #define TASK_REPORT_MAX		(TASK_REPORT_IDLE << 1)
 
diff --git a/include/linux/sched/types.h b/include/linux/sched/types.h
index 969aaf5ef9d6..e99751be1c15 100644
--- a/include/linux/sched/types.h
+++ b/include/linux/sched/types.h
@@ -2,7 +2,72 @@
 #ifndef _LINUX_SCHED_TYPES_H
 #define _LINUX_SCHED_TYPES_H
 
+#include <asm/processor.h>
+#include <linux/cache.h>
+#include <linux/compiler_types.h>
+#include <linux/cpumask_types.h>
+#include <linux/hrtimer_types.h>
+#include <linux/irqflags_types.h>
+#include <linux/kcsan.h>
+#include <linux/kmsan_types.h>
+#include <linux/latencytop.h>
+#include <linux/llist.h>
+#include <linux/lockdep_types.h>
+#include <linux/mm_types_task.h>
+#include <linux/mutex_types.h>
+#include <linux/netdevice_xmit.h>
+#include <linux/nodemask_types.h>
+#include <linux/pid_types.h>
+#include <linux/plist_types.h>
+#include <linux/posix-timers_types.h>
+#include <linux/rbtree_types.h>
+#include <linux/refcount_types.h>
+#include <linux/restart_block.h>
+#include <linux/rv.h>
+#include <linux/sched/ext.h>
+#include <linux/seccomp_types.h>
+#include <linux/sem_types.h>
+#include <linux/seqlock_types.h>
+#include <linux/shm.h>
+#include <linux/signal_types.h>
+#include <linux/smp_types.h>
+#include <linux/spinlock_types.h>
+#include <linux/syscall_user_dispatch_types.h>
+#include <linux/task_io_accounting.h>
+#include <linux/thread_info.h>
+#include <linux/timer_types.h>
 #include <linux/types.h>
+#include <linux/uidgid_types.h>
+#include <uapi/linux/rseq.h>
+
+/* task_struct member predeclarations (sorted alphabetically): */
+struct audit_context;
+struct bio_list;
+struct blk_plug;
+struct bpf_local_storage;
+struct bpf_net_context;
+struct bpf_run_ctx;
+struct capture_control;
+struct cfs_rq;
+struct fs_struct;
+struct futex_pi_state;
+struct io_context;
+struct io_uring_task;
+struct mempolicy;
+struct nameidata;
+struct nsproxy;
+struct perf_ctx_data;
+struct perf_event_context;
+struct pipe_inode_info;
+struct reclaim_state;
+struct robust_list_head;
+struct rq;
+struct sched_dl_entity;
+struct sighand_struct;
+struct signal_struct;
+struct task_delay_info;
+struct task_struct;
+struct user_event_mm;
 
 /**
  * struct task_cputime - collected CPU time counts
@@ -20,4 +85,1283 @@ struct task_cputime {
 	unsigned long long		sum_exec_runtime;
 };
 
+/*
+ * Define the task command name length as enum, then it can be visible to
+ * BPF programs.
+ */
+enum {
+	TASK_COMM_LEN = 16,
+};
+
+/**
+ * struct prev_cputime - snapshot of system and user cputime
+ * @utime: time spent in user mode
+ * @stime: time spent in system mode
+ * @lock: protects the above two fields
+ *
+ * Stores previous user/system time values such that we can guarantee
+ * monotonicity.
+ */
+struct prev_cputime {
+#ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+	u64				utime;
+	u64				stime;
+	raw_spinlock_t			lock;
+#endif
+};
+
+enum vtime_state {
+	/* Task is sleeping or running in a CPU with VTIME inactive: */
+	VTIME_INACTIVE = 0,
+	/* Task is idle */
+	VTIME_IDLE,
+	/* Task runs in kernelspace in a CPU with VTIME active: */
+	VTIME_SYS,
+	/* Task runs in userspace in a CPU with VTIME active: */
+	VTIME_USER,
+	/* Task runs as guests in a CPU with VTIME active: */
+	VTIME_GUEST,
+};
+
+struct vtime {
+	seqcount_t		seqcount;
+	unsigned long long	starttime;
+	enum vtime_state	state;
+	unsigned int		cpu;
+	u64			utime;
+	u64			stime;
+	u64			gtime;
+};
+
+struct sched_info {
+#ifdef CONFIG_SCHED_INFO
+	/* Cumulative counters: */
+
+	/* # of times we have run on this CPU: */
+	unsigned long			pcount;
+
+	/* Time spent waiting on a runqueue: */
+	unsigned long long		run_delay;
+
+	/* Max time spent waiting on a runqueue: */
+	unsigned long long		max_run_delay;
+
+	/* Min time spent waiting on a runqueue: */
+	unsigned long long		min_run_delay;
+
+	/* Timestamps: */
+
+	/* When did we last run on a CPU? */
+	unsigned long long		last_arrival;
+
+	/* When were we last queued to run? */
+	unsigned long long		last_queued;
+
+#endif /* CONFIG_SCHED_INFO */
+};
+
+/*
+ * Integer metrics need fixed point arithmetic, e.g., sched/fair
+ * has a few: load, load_avg, util_avg, freq, and capacity.
+ *
+ * We define a basic fixed point arithmetic range, and then formalize
+ * all these metrics based on that basic range.
+ */
+# define SCHED_FIXEDPOINT_SHIFT		10
+# define SCHED_FIXEDPOINT_SCALE		(1L << SCHED_FIXEDPOINT_SHIFT)
+
+/* Increase resolution of cpu_capacity calculations */
+# define SCHED_CAPACITY_SHIFT		SCHED_FIXEDPOINT_SHIFT
+# define SCHED_CAPACITY_SCALE		(1L << SCHED_CAPACITY_SHIFT)
+
+struct load_weight {
+	unsigned long			weight;
+	u32				inv_weight;
+};
+
+/*
+ * The load/runnable/util_avg accumulates an infinite geometric series
+ * (see __update_load_avg_cfs_rq() in kernel/sched/pelt.c).
+ *
+ * [load_avg definition]
+ *
+ *   load_avg = runnable% * scale_load_down(load)
+ *
+ * [runnable_avg definition]
+ *
+ *   runnable_avg = runnable% * SCHED_CAPACITY_SCALE
+ *
+ * [util_avg definition]
+ *
+ *   util_avg = running% * SCHED_CAPACITY_SCALE
+ *
+ * where runnable% is the time ratio that a sched_entity is runnable and
+ * running% the time ratio that a sched_entity is running.
+ *
+ * For cfs_rq, they are the aggregated values of all runnable and blocked
+ * sched_entities.
+ *
+ * The load/runnable/util_avg doesn't directly factor frequency scaling and CPU
+ * capacity scaling. The scaling is done through the rq_clock_pelt that is used
+ * for computing those signals (see update_rq_clock_pelt())
+ *
+ * N.B., the above ratios (runnable% and running%) themselves are in the
+ * range of [0, 1]. To do fixed point arithmetics, we therefore scale them
+ * to as large a range as necessary. This is for example reflected by
+ * util_avg's SCHED_CAPACITY_SCALE.
+ *
+ * [Overflow issue]
+ *
+ * The 64-bit load_sum can have 4353082796 (=2^64/47742/88761) entities
+ * with the highest load (=88761), always runnable on a single cfs_rq,
+ * and should not overflow as the number already hits PID_MAX_LIMIT.
+ *
+ * For all other cases (including 32-bit kernels), struct load_weight's
+ * weight will overflow first before we do, because:
+ *
+ *    Max(load_avg) <= Max(load.weight)
+ *
+ * Then it is the load_weight's responsibility to consider overflow
+ * issues.
+ */
+struct sched_avg {
+	u64				last_update_time;
+	u64				load_sum;
+	u64				runnable_sum;
+	u32				util_sum;
+	u32				period_contrib;
+	unsigned long			load_avg;
+	unsigned long			runnable_avg;
+	unsigned long			util_avg;
+	unsigned int			util_est;
+} ____cacheline_aligned;
+
+/*
+ * The UTIL_AVG_UNCHANGED flag is used to synchronize util_est with util_avg
+ * updates. When a task is dequeued, its util_est should not be updated if its
+ * util_avg has not been updated in the meantime.
+ * This information is mapped into the MSB bit of util_est at dequeue time.
+ * Since max value of util_est for a task is 1024 (PELT util_avg for a task)
+ * it is safe to use MSB.
+ */
+#define UTIL_EST_WEIGHT_SHIFT		2
+#define UTIL_AVG_UNCHANGED		0x80000000
+
+struct sched_statistics {
+#ifdef CONFIG_SCHEDSTATS
+	u64				wait_start;
+	u64				wait_max;
+	u64				wait_count;
+	u64				wait_sum;
+	u64				iowait_count;
+	u64				iowait_sum;
+
+	u64				sleep_start;
+	u64				sleep_max;
+	s64				sum_sleep_runtime;
+
+	u64				block_start;
+	u64				block_max;
+	s64				sum_block_runtime;
+
+	s64				exec_max;
+	u64				slice_max;
+
+	u64				nr_migrations_cold;
+	u64				nr_failed_migrations_affine;
+	u64				nr_failed_migrations_running;
+	u64				nr_failed_migrations_hot;
+	u64				nr_forced_migrations;
+
+	u64				nr_wakeups;
+	u64				nr_wakeups_sync;
+	u64				nr_wakeups_migrate;
+	u64				nr_wakeups_local;
+	u64				nr_wakeups_remote;
+	u64				nr_wakeups_affine;
+	u64				nr_wakeups_affine_attempts;
+	u64				nr_wakeups_passive;
+	u64				nr_wakeups_idle;
+
+#ifdef CONFIG_SCHED_CORE
+	u64				core_forceidle_sum;
+#endif
+#endif /* CONFIG_SCHEDSTATS */
+} ____cacheline_aligned;
+
+struct sched_entity {
+	/* For load-balancing: */
+	struct load_weight		load;
+	struct rb_node			run_node;
+	u64				deadline;
+	u64				min_vruntime;
+	u64				min_slice;
+
+	struct list_head		group_node;
+	unsigned char			on_rq;
+	unsigned char			sched_delayed;
+	unsigned char			rel_deadline;
+	unsigned char			custom_slice;
+					/* hole */
+
+	u64				exec_start;
+	u64				sum_exec_runtime;
+	u64				prev_sum_exec_runtime;
+	u64				vruntime;
+	s64				vlag;
+	u64				slice;
+
+	u64				nr_migrations;
+
+#ifdef CONFIG_FAIR_GROUP_SCHED
+	int				depth;
+	struct sched_entity		*parent;
+	/* rq on which this entity is (to be) queued: */
+	struct cfs_rq			*cfs_rq;
+	/* rq "owned" by this entity/group: */
+	struct cfs_rq			*my_q;
+	/* cached value of my_q->h_nr_running */
+	unsigned long			runnable_weight;
+#endif
+
+	/*
+	 * Per entity load average tracking.
+	 *
+	 * Put into separate cache line so it does not
+	 * collide with read-mostly values above.
+	 */
+	struct sched_avg		avg;
+};
+
+struct sched_rt_entity {
+	struct list_head		run_list;
+	unsigned long			timeout;
+	unsigned long			watchdog_stamp;
+	unsigned int			time_slice;
+	unsigned short			on_rq;
+	unsigned short			on_list;
+
+	struct sched_rt_entity		*back;
+#ifdef CONFIG_RT_GROUP_SCHED
+	struct sched_rt_entity		*parent;
+	/* rq on which this entity is (to be) queued: */
+	struct rt_rq			*rt_rq;
+	/* rq "owned" by this entity/group: */
+	struct rt_rq			*my_q;
+#endif
+} __randomize_layout;
+
+typedef bool (*dl_server_has_tasks_f)(struct sched_dl_entity *);
+typedef struct task_struct *(*dl_server_pick_f)(struct sched_dl_entity *);
+
+struct sched_dl_entity {
+	struct rb_node			rb_node;
+
+	/*
+	 * Original scheduling parameters. Copied here from sched_attr
+	 * during sched_setattr(), they will remain the same until
+	 * the next sched_setattr().
+	 */
+	u64				dl_runtime;	/* Maximum runtime for each instance	*/
+	u64				dl_deadline;	/* Relative deadline of each instance	*/
+	u64				dl_period;	/* Separation of two instances (period) */
+	u64				dl_bw;		/* dl_runtime / dl_period		*/
+	u64				dl_density;	/* dl_runtime / dl_deadline		*/
+
+	/*
+	 * Actual scheduling parameters. Initialized with the values above,
+	 * they are continuously updated during task execution. Note that
+	 * the remaining runtime could be < 0 in case we are in overrun.
+	 */
+	s64				runtime;	/* Remaining runtime for this instance	*/
+	u64				deadline;	/* Absolute deadline for this instance	*/
+	unsigned int			flags;		/* Specifying the scheduler behaviour	*/
+
+	/*
+	 * Some bool flags:
+	 *
+	 * @dl_throttled tells if we exhausted the runtime. If so, the
+	 * task has to wait for a replenishment to be performed at the
+	 * next firing of dl_timer.
+	 *
+	 * @dl_yielded tells if task gave up the CPU before consuming
+	 * all its available runtime during the last job.
+	 *
+	 * @dl_non_contending tells if the task is inactive while still
+	 * contributing to the active utilization. In other words, it
+	 * indicates if the inactive timer has been armed and its handler
+	 * has not been executed yet. This flag is useful to avoid race
+	 * conditions between the inactive timer handler and the wakeup
+	 * code.
+	 *
+	 * @dl_overrun tells if the task asked to be informed about runtime
+	 * overruns.
+	 *
+	 * @dl_server tells if this is a server entity.
+	 *
+	 * @dl_defer tells if this is a deferred or regular server. For
+	 * now only defer server exists.
+	 *
+	 * @dl_defer_armed tells if the deferrable server is waiting
+	 * for the replenishment timer to activate it.
+	 *
+	 * @dl_server_active tells if the dlserver is active(started).
+	 * dlserver is started on first cfs enqueue on an idle runqueue
+	 * and is stopped when a dequeue results in 0 cfs tasks on the
+	 * runqueue. In other words, dlserver is active only when cpu's
+	 * runqueue has atleast one cfs task.
+	 *
+	 * @dl_defer_running tells if the deferrable server is actually
+	 * running, skipping the defer phase.
+	 */
+	unsigned int			dl_throttled      : 1;
+	unsigned int			dl_yielded        : 1;
+	unsigned int			dl_non_contending : 1;
+	unsigned int			dl_overrun	  : 1;
+	unsigned int			dl_server         : 1;
+	unsigned int			dl_server_active  : 1;
+	unsigned int			dl_defer	  : 1;
+	unsigned int			dl_defer_armed	  : 1;
+	unsigned int			dl_defer_running  : 1;
+
+	/*
+	 * Bandwidth enforcement timer. Each -deadline task has its
+	 * own bandwidth to be enforced, thus we need one timer per task.
+	 */
+	struct hrtimer			dl_timer;
+
+	/*
+	 * Inactive timer, responsible for decreasing the active utilization
+	 * at the "0-lag time". When a -deadline task blocks, it contributes
+	 * to GRUB's active utilization until the "0-lag time", hence a
+	 * timer is needed to decrease the active utilization at the correct
+	 * time.
+	 */
+	struct hrtimer			inactive_timer;
+
+	/*
+	 * Bits for DL-server functionality. Also see the comment near
+	 * dl_server_update().
+	 *
+	 * @rq the runqueue this server is for
+	 *
+	 * @server_has_tasks() returns true if @server_pick return a
+	 * runnable task.
+	 */
+	struct rq			*rq;
+	dl_server_has_tasks_f		server_has_tasks;
+	dl_server_pick_f		server_pick_task;
+
+#ifdef CONFIG_RT_MUTEXES
+	/*
+	 * Priority Inheritance. When a DEADLINE scheduling entity is boosted
+	 * pi_se points to the donor, otherwise points to the dl_se it belongs
+	 * to (the original one/itself).
+	 */
+	struct sched_dl_entity *pi_se;
+#endif
+};
+
+#ifdef CONFIG_UCLAMP_TASK
+/* Number of utilization clamp buckets (shorter alias) */
+#define UCLAMP_BUCKETS CONFIG_UCLAMP_BUCKETS_COUNT
+
+/*
+ * Utilization clamp for a scheduling entity
+ * @value:		clamp value "assigned" to a se
+ * @bucket_id:		bucket index corresponding to the "assigned" value
+ * @active:		the se is currently refcounted in a rq's bucket
+ * @user_defined:	the requested clamp value comes from user-space
+ *
+ * The bucket_id is the index of the clamp bucket matching the clamp value
+ * which is pre-computed and stored to avoid expensive integer divisions from
+ * the fast path.
+ *
+ * The active bit is set whenever a task has got an "effective" value assigned,
+ * which can be different from the clamp value "requested" from user-space.
+ * This allows to know a task is refcounted in the rq's bucket corresponding
+ * to the "effective" bucket_id.
+ *
+ * The user_defined bit is set whenever a task has got a task-specific clamp
+ * value requested from userspace, i.e. the system defaults apply to this task
+ * just as a restriction. This allows to relax default clamps when a less
+ * restrictive task-specific value has been requested, thus allowing to
+ * implement a "nice" semantic. For example, a task running with a 20%
+ * default boost can still drop its own boosting to 0%.
+ */
+struct uclamp_se {
+	unsigned int value		: bits_per(SCHED_CAPACITY_SCALE);
+	unsigned int bucket_id		: bits_per(UCLAMP_BUCKETS);
+	unsigned int active		: 1;
+	unsigned int user_defined	: 1;
+};
+#endif /* CONFIG_UCLAMP_TASK */
+
+union rcu_special {
+	struct {
+		u8			blocked;
+		u8			need_qs;
+		u8			exp_hint; /* Hint for performance. */
+		u8			need_mb; /* Readers need smp_mb(). */
+	} b; /* Bits. */
+	u32 s; /* Set of bits. */
+};
+
+/*
+ * Number of contexts where an event can trigger:
+ *      task, softirq, hardirq, nmi.
+ */
+#define PERF_NR_CONTEXTS	4
+
+struct wake_q_node {
+	struct wake_q_node *next;
+};
+
+struct kmap_ctrl {
+#ifdef CONFIG_KMAP_LOCAL
+	int				idx;
+	pte_t				pteval[KM_MAX_IDX];
+#endif
+};
+
+struct task_struct {
+#ifdef CONFIG_THREAD_INFO_IN_TASK
+	/*
+	 * For reasons of header soup (see current_thread_info()), this
+	 * must be the first element of task_struct.
+	 */
+	struct thread_info		thread_info;
+#endif
+	unsigned int			__state;
+
+	/* saved state for "spinlock sleepers" */
+	unsigned int			saved_state;
+
+	/*
+	 * This begins the randomizable portion of task_struct. Only
+	 * scheduling-critical items should be added above here.
+	 */
+	randomized_struct_fields_start
+
+	void				*stack;
+	refcount_t			usage;
+	/* Per task flags (PF_*), defined further below: */
+	unsigned int			flags;
+	unsigned int			ptrace;
+
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+	struct alloc_tag		*alloc_tag;
+#endif
+
+	int				on_cpu;
+	struct __call_single_node	wake_entry;
+	unsigned int			wakee_flips;
+	unsigned long			wakee_flip_decay_ts;
+	struct task_struct		*last_wakee;
+
+	/*
+	 * recent_used_cpu is initially set as the last CPU used by a task
+	 * that wakes affine another task. Waker/wakee relationships can
+	 * push tasks around a CPU where each wakeup moves to the next one.
+	 * Tracking a recently used CPU allows a quick search for a recently
+	 * used CPU that may be idle.
+	 */
+	int				recent_used_cpu;
+	int				wake_cpu;
+	int				on_rq;
+
+	int				prio;
+	int				static_prio;
+	int				normal_prio;
+	unsigned int			rt_priority;
+
+	struct sched_entity		se;
+	struct sched_rt_entity		rt;
+	struct sched_dl_entity		dl;
+	struct sched_dl_entity		*dl_server;
+#ifdef CONFIG_SCHED_CLASS_EXT
+	struct sched_ext_entity		scx;
+#endif
+	const struct sched_class	*sched_class;
+
+#ifdef CONFIG_SCHED_CORE
+	struct rb_node			core_node;
+	unsigned long			core_cookie;
+	unsigned int			core_occupation;
+#endif
+
+#ifdef CONFIG_CGROUP_SCHED
+	struct task_group		*sched_task_group;
+#endif
+
+
+#ifdef CONFIG_UCLAMP_TASK
+	/*
+	 * Clamp values requested for a scheduling entity.
+	 * Must be updated with task_rq_lock() held.
+	 */
+	struct uclamp_se		uclamp_req[UCLAMP_CNT];
+	/*
+	 * Effective clamp values used for a scheduling entity.
+	 * Must be updated with task_rq_lock() held.
+	 */
+	struct uclamp_se		uclamp[UCLAMP_CNT];
+#endif
+
+	struct sched_statistics         stats;
+
+#ifdef CONFIG_PREEMPT_NOTIFIERS
+	/* List of struct preempt_notifier: */
+	struct hlist_head		preempt_notifiers;
+#endif
+
+#ifdef CONFIG_BLK_DEV_IO_TRACE
+	unsigned int			btrace_seq;
+#endif
+
+	unsigned int			policy;
+	unsigned long			max_allowed_capacity;
+	int				nr_cpus_allowed;
+	const cpumask_t			*cpus_ptr;
+	cpumask_t			*user_cpus_ptr;
+	cpumask_t			cpus_mask;
+	void				*migration_pending;
+	unsigned short			migration_disabled;
+	unsigned short			migration_flags;
+
+#ifdef CONFIG_PREEMPT_RCU
+	int				rcu_read_lock_nesting;
+	union rcu_special		rcu_read_unlock_special;
+	struct list_head		rcu_node_entry;
+	struct rcu_node			*rcu_blocked_node;
+#endif /* #ifdef CONFIG_PREEMPT_RCU */
+
+#ifdef CONFIG_TASKS_RCU
+	unsigned long			rcu_tasks_nvcsw;
+	u8				rcu_tasks_holdout;
+	u8				rcu_tasks_idx;
+	int				rcu_tasks_idle_cpu;
+	struct list_head		rcu_tasks_holdout_list;
+	int				rcu_tasks_exit_cpu;
+	struct list_head		rcu_tasks_exit_list;
+#endif /* #ifdef CONFIG_TASKS_RCU */
+
+#ifdef CONFIG_TASKS_TRACE_RCU
+	int				trc_reader_nesting;
+	int				trc_ipi_to_cpu;
+	union rcu_special		trc_reader_special;
+	struct list_head		trc_holdout_list;
+	struct list_head		trc_blkd_node;
+	int				trc_blkd_cpu;
+#endif /* #ifdef CONFIG_TASKS_TRACE_RCU */
+
+	struct sched_info		sched_info;
+
+	struct list_head		tasks;
+	struct plist_node		pushable_tasks;
+	struct rb_node			pushable_dl_tasks;
+
+	struct mm_struct		*mm;
+	struct mm_struct		*active_mm;
+	struct address_space		*faults_disabled_mapping;
+
+	int				exit_state;
+	int				exit_code;
+	int				exit_signal;
+	/* The signal sent when the parent dies: */
+	int				pdeath_signal;
+	/* JOBCTL_*, siglock protected: */
+	unsigned long			jobctl;
+
+	/* Used for emulating ABI behavior of previous Linux versions: */
+	unsigned int			personality;
+
+	/* Scheduler bits, serialized by scheduler locks: */
+	unsigned			sched_reset_on_fork:1;
+	unsigned			sched_contributes_to_load:1;
+	unsigned			sched_migrated:1;
+	unsigned			sched_task_hot:1;
+
+	/* Force alignment to the next boundary: */
+	unsigned			:0;
+
+	/* Unserialized, strictly 'current' */
+
+	/*
+	 * This field must not be in the scheduler word above due to wakelist
+	 * queueing no longer being serialized by p->on_cpu. However:
+	 *
+	 * p->XXX = X;			ttwu()
+	 * schedule()			  if (p->on_rq && ..) // false
+	 *   smp_mb__after_spinlock();	  if (smp_load_acquire(&p->on_cpu) && //true
+	 *   deactivate_task()		      ttwu_queue_wakelist())
+	 *     p->on_rq = 0;			p->sched_remote_wakeup = Y;
+	 *
+	 * guarantees all stores of 'current' are visible before
+	 * ->sched_remote_wakeup gets used, so it can be in this word.
+	 */
+	unsigned			sched_remote_wakeup:1;
+#ifdef CONFIG_RT_MUTEXES
+	unsigned			sched_rt_mutex:1;
+#endif
+
+	/* Bit to tell TOMOYO we're in execve(): */
+	unsigned			in_execve:1;
+	unsigned			in_iowait:1;
+#ifndef TIF_RESTORE_SIGMASK
+	unsigned			restore_sigmask:1;
+#endif
+#ifdef CONFIG_MEMCG_V1
+	unsigned			in_user_fault:1;
+#endif
+#ifdef CONFIG_LRU_GEN
+	/* whether the LRU algorithm may apply to this access */
+	unsigned			in_lru_fault:1;
+#endif
+#ifdef CONFIG_COMPAT_BRK
+	unsigned			brk_randomized:1;
+#endif
+#ifdef CONFIG_CGROUPS
+	/* disallow userland-initiated cgroup migration */
+	unsigned			no_cgroup_migration:1;
+	/* task is frozen/stopped (used by the cgroup freezer) */
+	unsigned			frozen:1;
+#endif
+#ifdef CONFIG_BLK_CGROUP
+	unsigned			use_memdelay:1;
+#endif
+#ifdef CONFIG_PSI
+	/* Stalled due to lack of memory */
+	unsigned			in_memstall:1;
+#endif
+#ifdef CONFIG_PAGE_OWNER
+	/* Used by page_owner=on to detect recursion in page tracking. */
+	unsigned			in_page_owner:1;
+#endif
+#ifdef CONFIG_EVENTFD
+	/* Recursion prevention for eventfd_signal() */
+	unsigned			in_eventfd:1;
+#endif
+#ifdef CONFIG_ARCH_HAS_CPU_PASID
+	unsigned			pasid_activated:1;
+#endif
+#ifdef CONFIG_X86_BUS_LOCK_DETECT
+	unsigned			reported_split_lock:1;
+#endif
+#ifdef CONFIG_TASK_DELAY_ACCT
+	/* delay due to memory thrashing */
+	unsigned                        in_thrashing:1;
+#endif
+#ifdef CONFIG_PREEMPT_RT
+	struct netdev_xmit		net_xmit;
+#endif
+	unsigned long			atomic_flags; /* Flags requiring atomic access. */
+
+	struct restart_block		restart_block;
+
+	pid_t				pid;
+	pid_t				tgid;
+
+#ifdef CONFIG_STACKPROTECTOR
+	/* Canary value for the -fstack-protector GCC feature: */
+	unsigned long			stack_canary;
+#endif
+	/*
+	 * Pointers to the (original) parent process, youngest child, younger sibling,
+	 * older sibling, respectively.  (p->father can be replaced with
+	 * p->real_parent->pid)
+	 */
+
+	/* Real parent process: */
+	struct task_struct __rcu	*real_parent;
+
+	/* Recipient of SIGCHLD, wait4() reports: */
+	struct task_struct __rcu	*parent;
+
+	/*
+	 * Children/sibling form the list of natural children:
+	 */
+	struct list_head		children;
+	struct list_head		sibling;
+	struct task_struct		*group_leader;
+
+	/*
+	 * 'ptraced' is the list of tasks this task is using ptrace() on.
+	 *
+	 * This includes both natural children and PTRACE_ATTACH targets.
+	 * 'ptrace_entry' is this task's link on the p->parent->ptraced list.
+	 */
+	struct list_head		ptraced;
+	struct list_head		ptrace_entry;
+
+	/* PID/PID hash table linkage. */
+	struct pid			*thread_pid;
+	struct hlist_node		pid_links[PIDTYPE_MAX];
+	struct list_head		thread_node;
+
+	struct completion		*vfork_done;
+
+	/* CLONE_CHILD_SETTID: */
+	int __user			*set_child_tid;
+
+	/* CLONE_CHILD_CLEARTID: */
+	int __user			*clear_child_tid;
+
+	/* PF_KTHREAD | PF_IO_WORKER */
+	void				*worker_private;
+
+	u64				utime;
+	u64				stime;
+#ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
+	u64				utimescaled;
+	u64				stimescaled;
+#endif
+	u64				gtime;
+	struct prev_cputime		prev_cputime;
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
+	struct vtime			vtime;
+#endif
+
+#ifdef CONFIG_NO_HZ_FULL
+	atomic_t			tick_dep_mask;
+#endif
+	/* Context switch counts: */
+	unsigned long			nvcsw;
+	unsigned long			nivcsw;
+
+	/* Monotonic time in nsecs: */
+	u64				start_time;
+
+	/* Boot based time in nsecs: */
+	u64				start_boottime;
+
+	/* MM fault and swap info: this can arguably be seen as either mm-specific or thread-specific: */
+	unsigned long			min_flt;
+	unsigned long			maj_flt;
+
+	/* Empty if CONFIG_POSIX_CPUTIMERS=n */
+	struct posix_cputimers		posix_cputimers;
+
+#ifdef CONFIG_POSIX_CPU_TIMERS_TASK_WORK
+	struct posix_cputimers_work	posix_cputimers_work;
+#endif
+
+	/* Process credentials: */
+
+	/* Tracer's credentials at attach: */
+	const struct cred __rcu		*ptracer_cred;
+
+	/* Objective and real subjective task credentials (COW): */
+	const struct cred __rcu		*real_cred;
+
+	/* Effective (overridable) subjective task credentials (COW): */
+	const struct cred __rcu		*cred;
+
+#ifdef CONFIG_KEYS
+	/* Cached requested key. */
+	struct key			*cached_requested_key;
+#endif
+
+	/*
+	 * executable name, excluding path.
+	 *
+	 * - normally initialized begin_new_exec()
+	 * - set it with set_task_comm()
+	 *   - strscpy_pad() to ensure it is always NUL-terminated and
+	 *     zero-padded
+	 *   - task_lock() to ensure the operation is atomic and the name is
+	 *     fully updated.
+	 */
+	char				comm[TASK_COMM_LEN];
+
+	struct nameidata		*nameidata;
+
+#ifdef CONFIG_SYSVIPC
+	struct sysv_sem			sysvsem;
+	struct sysv_shm			sysvshm;
+#endif
+#ifdef CONFIG_DETECT_HUNG_TASK
+	unsigned long			last_switch_count;
+	unsigned long			last_switch_time;
+#endif
+	/* Filesystem information: */
+	struct fs_struct		*fs;
+
+	/* Open file information: */
+	struct files_struct		*files;
+
+#ifdef CONFIG_IO_URING
+	struct io_uring_task		*io_uring;
+#endif
+
+	/* Namespaces: */
+	struct nsproxy			*nsproxy;
+
+	/* Signal handlers: */
+	struct signal_struct		*signal;
+	struct sighand_struct __rcu		*sighand;
+	sigset_t			blocked;
+	sigset_t			real_blocked;
+	/* Restored if set_restore_sigmask() was used: */
+	sigset_t			saved_sigmask;
+	struct sigpending		pending;
+	unsigned long			sas_ss_sp;
+	size_t				sas_ss_size;
+	unsigned int			sas_ss_flags;
+
+	struct callback_head		*task_works;
+
+#ifdef CONFIG_AUDIT
+#ifdef CONFIG_AUDITSYSCALL
+	struct audit_context		*audit_context;
+#endif
+	kuid_t				loginuid;
+	unsigned int			sessionid;
+#endif
+	struct seccomp			seccomp;
+	struct syscall_user_dispatch	syscall_dispatch;
+
+	/* Thread group tracking: */
+	u64				parent_exec_id;
+	u64				self_exec_id;
+
+	/* Protection against (de-)allocation: mm, files, fs, tty, keyrings, mems_allowed, mempolicy: */
+	spinlock_t			alloc_lock;
+
+	/* Protection of the PI data structures: */
+	raw_spinlock_t			pi_lock;
+
+	struct wake_q_node		wake_q;
+
+#ifdef CONFIG_RT_MUTEXES
+	/* PI waiters blocked on a rt_mutex held by this task: */
+	struct rb_root_cached		pi_waiters;
+	/* Updated under owner's pi_lock and rq lock */
+	struct task_struct		*pi_top_task;
+	/* Deadlock detection and priority inheritance handling: */
+	struct rt_mutex_waiter		*pi_blocked_on;
+#endif
+
+#ifdef CONFIG_DEBUG_MUTEXES
+	/* Mutex deadlock detection: */
+	struct mutex_waiter		*blocked_on;
+#endif
+
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+	struct mutex			*blocker_mutex;
+#endif
+
+#ifdef CONFIG_DEBUG_ATOMIC_SLEEP
+	int				non_block_count;
+#endif
+
+#ifdef CONFIG_TRACE_IRQFLAGS
+	struct irqtrace_events		irqtrace;
+	unsigned int			hardirq_threaded;
+	u64				hardirq_chain_key;
+	int				softirqs_enabled;
+	int				softirq_context;
+	int				irq_config;
+#endif
+#ifdef CONFIG_PREEMPT_RT
+	int				softirq_disable_cnt;
+#endif
+
+#ifdef CONFIG_LOCKDEP
+# define MAX_LOCK_DEPTH			48UL
+	u64				curr_chain_key;
+	int				lockdep_depth;
+	unsigned int			lockdep_recursion;
+	struct held_lock		held_locks[MAX_LOCK_DEPTH];
+#endif
+
+#if defined(CONFIG_UBSAN) && !defined(CONFIG_UBSAN_TRAP)
+	unsigned int			in_ubsan;
+#endif
+
+	/* Journalling filesystem info: */
+	void				*journal_info;
+
+	/* Stacked block device info: */
+	struct bio_list			*bio_list;
+
+	/* Stack plugging: */
+	struct blk_plug			*plug;
+
+	/* VM state: */
+	struct reclaim_state		*reclaim_state;
+
+	struct io_context		*io_context;
+
+#ifdef CONFIG_COMPACTION
+	struct capture_control		*capture_control;
+#endif
+	/* Ptrace state: */
+	unsigned long			ptrace_message;
+	kernel_siginfo_t		*last_siginfo;
+
+	struct task_io_accounting	ioac;
+#ifdef CONFIG_PSI
+	/* Pressure stall state */
+	unsigned int			psi_flags;
+#endif
+#ifdef CONFIG_TASK_XACCT
+	/* Accumulated RSS usage: */
+	u64				acct_rss_mem1;
+	/* Accumulated virtual memory usage: */
+	u64				acct_vm_mem1;
+	/* stime + utime since last update: */
+	u64				acct_timexpd;
+#endif
+#ifdef CONFIG_CPUSETS
+	/* Protected by ->alloc_lock: */
+	nodemask_t			mems_allowed;
+	/* Sequence number to catch updates: */
+	seqcount_spinlock_t		mems_allowed_seq;
+	int				cpuset_mem_spread_rotor;
+#endif
+#ifdef CONFIG_CGROUPS
+	/* Control Group info protected by css_set_lock: */
+	struct css_set __rcu		*cgroups;
+	/* cg_list protected by css_set_lock and tsk->alloc_lock: */
+	struct list_head		cg_list;
+#endif
+#ifdef CONFIG_X86_CPU_RESCTRL
+	u32				closid;
+	u32				rmid;
+#endif
+#ifdef CONFIG_FUTEX
+	struct robust_list_head __user	*robust_list;
+#ifdef CONFIG_COMPAT
+	struct compat_robust_list_head __user *compat_robust_list;
+#endif
+	struct list_head		pi_state_list;
+	struct futex_pi_state		*pi_state_cache;
+	struct mutex			futex_exit_mutex;
+	unsigned int			futex_state;
+#endif
+#ifdef CONFIG_PERF_EVENTS
+	u8				perf_recursion[PERF_NR_CONTEXTS];
+	struct perf_event_context	*perf_event_ctxp;
+	struct mutex			perf_event_mutex;
+	struct list_head		perf_event_list;
+	struct perf_ctx_data __rcu	*perf_ctx_data;
+#endif
+#ifdef CONFIG_DEBUG_PREEMPT
+	unsigned long			preempt_disable_ip;
+#endif
+#ifdef CONFIG_NUMA
+	/* Protected by alloc_lock: */
+	struct mempolicy		*mempolicy;
+	short				il_prev;
+	u8				il_weight;
+	short				pref_node_fork;
+#endif
+#ifdef CONFIG_NUMA_BALANCING
+	int				numa_scan_seq;
+	unsigned int			numa_scan_period;
+	unsigned int			numa_scan_period_max;
+	int				numa_preferred_nid;
+	unsigned long			numa_migrate_retry;
+	/* Migration stamp: */
+	u64				node_stamp;
+	u64				last_task_numa_placement;
+	u64				last_sum_exec_runtime;
+	struct callback_head		numa_work;
+
+	/*
+	 * This pointer is only modified for current in syscall and
+	 * pagefault context (and for tasks being destroyed), so it can be read
+	 * from any of the following contexts:
+	 *  - RCU read-side critical section
+	 *  - current->numa_group from everywhere
+	 *  - task's runqueue locked, task not running
+	 */
+	struct numa_group __rcu		*numa_group;
+
+	/*
+	 * numa_faults is an array split into four regions:
+	 * faults_memory, faults_cpu, faults_memory_buffer, faults_cpu_buffer
+	 * in this precise order.
+	 *
+	 * faults_memory: Exponential decaying average of faults on a per-node
+	 * basis. Scheduling placement decisions are made based on these
+	 * counts. The values remain static for the duration of a PTE scan.
+	 * faults_cpu: Track the nodes the process was running on when a NUMA
+	 * hinting fault was incurred.
+	 * faults_memory_buffer and faults_cpu_buffer: Record faults per node
+	 * during the current scan window. When the scan completes, the counts
+	 * in faults_memory and faults_cpu decay and these values are copied.
+	 */
+	unsigned long			*numa_faults;
+	unsigned long			total_numa_faults;
+
+	/*
+	 * numa_faults_locality tracks if faults recorded during the last
+	 * scan window were remote/local or failed to migrate. The task scan
+	 * period is adapted based on the locality of the faults with different
+	 * weights depending on whether they were shared or private faults
+	 */
+	unsigned long			numa_faults_locality[3];
+
+	unsigned long			numa_pages_migrated;
+#endif /* CONFIG_NUMA_BALANCING */
+
+#ifdef CONFIG_RSEQ
+	struct rseq __user *rseq;
+	u32 rseq_len;
+	u32 rseq_sig;
+	/*
+	 * RmW on rseq_event_mask must be performed atomically
+	 * with respect to preemption.
+	 */
+	unsigned long rseq_event_mask;
+# ifdef CONFIG_DEBUG_RSEQ
+	/*
+	 * This is a place holder to save a copy of the rseq fields for
+	 * validation of read-only fields. The struct rseq has a
+	 * variable-length array at the end, so it cannot be used
+	 * directly. Reserve a size large enough for the known fields.
+	 */
+	char				rseq_fields[sizeof(struct rseq)];
+# endif
+#endif
+
+#ifdef CONFIG_SCHED_MM_CID
+	int				mm_cid;		/* Current cid in mm */
+	int				last_mm_cid;	/* Most recent cid in mm */
+	int				migrate_from_cpu;
+	int				mm_cid_active;	/* Whether cid bitmap is active */
+	struct callback_head		cid_work;
+#endif
+
+	struct tlbflush_unmap_batch	tlb_ubc;
+
+	/* Cache last used pipe for splice(): */
+	struct pipe_inode_info		*splice_pipe;
+
+	struct page_frag		task_frag;
+
+#ifdef CONFIG_TASK_DELAY_ACCT
+	struct task_delay_info		*delays;
+#endif
+
+#ifdef CONFIG_FAULT_INJECTION
+	int				make_it_fail;
+	unsigned int			fail_nth;
+#endif
+	/*
+	 * When (nr_dirtied >= nr_dirtied_pause), it's time to call
+	 * balance_dirty_pages() for a dirty throttling pause:
+	 */
+	int				nr_dirtied;
+	int				nr_dirtied_pause;
+	/* Start of a write-and-pause period: */
+	unsigned long			dirty_paused_when;
+
+#ifdef CONFIG_LATENCYTOP
+	int				latency_record_count;
+	struct latency_record		latency_record[LT_SAVECOUNT];
+#endif
+	/*
+	 * Time slack values; these are used to round up poll() and
+	 * select() etc timeout values. These are in nanoseconds.
+	 */
+	u64				timer_slack_ns;
+	u64				default_timer_slack_ns;
+
+#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
+	unsigned int			kasan_depth;
+#endif
+
+#ifdef CONFIG_KCSAN
+	struct kcsan_ctx		kcsan_ctx;
+#ifdef CONFIG_TRACE_IRQFLAGS
+	struct irqtrace_events		kcsan_save_irqtrace;
+#endif
+#ifdef CONFIG_KCSAN_WEAK_MEMORY
+	int				kcsan_stack_depth;
+#endif
+#endif
+
+#ifdef CONFIG_KMSAN
+	struct kmsan_ctx		kmsan_ctx;
+#endif
+
+#if IS_ENABLED(CONFIG_KUNIT)
+	struct kunit			*kunit_test;
+#endif
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+	/* Index of current stored address in ret_stack: */
+	int				curr_ret_stack;
+	int				curr_ret_depth;
+
+	/* Stack of return addresses for return function tracing: */
+	unsigned long			*ret_stack;
+
+	/* Timestamp for last schedule: */
+	unsigned long long		ftrace_timestamp;
+	unsigned long long		ftrace_sleeptime;
+
+	/*
+	 * Number of functions that haven't been traced
+	 * because of depth overrun:
+	 */
+	atomic_t			trace_overrun;
+
+	/* Pause tracing: */
+	atomic_t			tracing_graph_pause;
+#endif
+
+#ifdef CONFIG_TRACING
+	/* Bitmask and counter of trace recursion: */
+	unsigned long			trace_recursion;
+#endif /* CONFIG_TRACING */
+
+#ifdef CONFIG_KCOV
+	/* See kernel/kcov.c for more details. */
+
+	/* Coverage collection mode enabled for this task (0 if disabled): */
+	unsigned int			kcov_mode;
+
+	/* Size of the kcov_area: */
+	unsigned int			kcov_size;
+
+	/* Buffer for coverage collection: */
+	void				*kcov_area;
+
+	/* KCOV descriptor wired with this task or NULL: */
+	struct kcov			*kcov;
+
+	/* KCOV common handle for remote coverage collection: */
+	u64				kcov_handle;
+
+	/* KCOV sequence number: */
+	int				kcov_sequence;
+
+	/* Collect coverage from softirq context: */
+	unsigned int			kcov_softirq;
+#endif
+
+#ifdef CONFIG_MEMCG_V1
+	struct mem_cgroup		*memcg_in_oom;
+#endif
+
+#ifdef CONFIG_MEMCG
+	/* Number of pages to reclaim on returning to userland: */
+	unsigned int			memcg_nr_pages_over_high;
+
+	/* Used by memcontrol for targeted memcg charge: */
+	struct mem_cgroup		*active_memcg;
+
+	/* Cache for current->cgroups->memcg->objcg lookups: */
+	struct obj_cgroup		*objcg;
+#endif
+
+#ifdef CONFIG_BLK_CGROUP
+	struct gendisk			*throttle_disk;
+#endif
+
+#ifdef CONFIG_UPROBES
+	struct uprobe_task		*utask;
+#endif
+#if defined(CONFIG_BCACHE) || defined(CONFIG_BCACHE_MODULE)
+	unsigned int			sequential_io;
+	unsigned int			sequential_io_avg;
+#endif
+	struct kmap_ctrl		kmap_ctrl;
+#ifdef CONFIG_DEBUG_ATOMIC_SLEEP
+	unsigned long			task_state_change;
+# ifdef CONFIG_PREEMPT_RT
+	unsigned long			saved_state_change;
+# endif
+#endif
+	struct rcu_head			rcu;
+	refcount_t			rcu_users;
+	int				pagefault_disabled;
+#ifdef CONFIG_MMU
+	struct task_struct		*oom_reaper_list;
+	struct timer_list		oom_reaper_timer;
+#endif
+#ifdef CONFIG_VMAP_STACK
+	struct vm_struct		*stack_vm_area;
+#endif
+#ifdef CONFIG_THREAD_INFO_IN_TASK
+	/* A live task holds one reference: */
+	refcount_t			stack_refcount;
+#endif
+#ifdef CONFIG_LIVEPATCH
+	int patch_state;
+#endif
+#ifdef CONFIG_SECURITY
+	/* Used by LSM modules for access restriction: */
+	void				*security;
+#endif
+#ifdef CONFIG_BPF_SYSCALL
+	/* Used by BPF task local storage */
+	struct bpf_local_storage __rcu	*bpf_storage;
+	/* Used for BPF run context */
+	struct bpf_run_ctx		*bpf_ctx;
+#endif
+	/* Used by BPF for per-TASK xdp storage */
+	struct bpf_net_context		*bpf_net_context;
+
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	unsigned long			lowest_stack;
+	unsigned long			prev_lowest_stack;
+#endif
+
+#ifdef CONFIG_X86_MCE
+	void __user			*mce_vaddr;
+	__u64				mce_kflags;
+	u64				mce_addr;
+	__u64				mce_ripv : 1,
+					mce_whole_page : 1,
+					__mce_reserved : 62;
+	struct callback_head		mce_kill_me;
+	int				mce_count;
+#endif
+
+#ifdef CONFIG_KRETPROBES
+	struct llist_head               kretprobe_instances;
+#endif
+#ifdef CONFIG_RETHOOK
+	struct llist_head               rethooks;
+#endif
+
+#ifdef CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH
+	/*
+	 * If L1D flush is supported on mm context switch
+	 * then we use this callback head to queue kill work
+	 * to kill tasks that are not running on SMT disabled
+	 * cores
+	 */
+	struct callback_head		l1d_flush_kill;
+#endif
+
+#ifdef CONFIG_RV
+	/*
+	 * Per-task RV monitor. Nowadays fixed in RV_PER_TASK_MONITORS.
+	 * If we find justification for more monitors, we can think
+	 * about adding more or developing a dynamic method. So far,
+	 * none of these are justified.
+	 */
+	union rv_task_monitor		rv[RV_PER_TASK_MONITORS];
+#endif
+
+#ifdef CONFIG_USER_EVENTS
+	struct user_event_mm		*user_event_mm;
+#endif
+
+	/* CPU-specific state of this task: */
+	struct thread_struct		thread;
+
+	/*
+	 * New fields for task_struct should be added above here, so that
+	 * they are included in the randomized portion of task_struct.
+	 */
+	randomized_struct_fields_end
+} __attribute__ ((aligned (64)));
+
 #endif /* _LINUX_SCHED_TYPES_H */
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
