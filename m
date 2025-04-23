Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77848238C1E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451949; cv=none; b=T+GKIWdIAmLBXhm0HV2/rvC8vi6LUoflmCOFYYc98HniMolyOATqrueiOb/FK/MTGYqfkiTKihziq0nfmJG5hNn5u5++iiaytpPYWYWdhm8Ynsa68ay8JIpHoN/Vi5KtNi3a7q5ZfzsggjbahQh3DZARimjpKDlVuUP+c8h51LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451949; c=relaxed/simple;
	bh=7KdWaUdRO6l7U4M3bTrZUHg+Yo8eLW4j5h2e8y0q3Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+00iF9pUHF4MqGfbScIL3hwCihhH+CT8fdgpQpRKpRxy26fuOrt5KbPN25Jgf8sDISNTc0ywwYy6qW1z6y/Sprnn6GswswTHZrxJoikaP7cHi2NlrmdziWacAid2LIIWyiIcark/ChETPuNE4BWjjXF+8MOnwl/hmmhsG9WmDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7kMxlvL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7kMxlvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0385C4CEE2;
	Wed, 23 Apr 2025 23:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451949;
	bh=7KdWaUdRO6l7U4M3bTrZUHg+Yo8eLW4j5h2e8y0q3Eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J7kMxlvLxCBkVYkDnJAEKotY70T5QXDIlxk9LWil53eFJAvK2ugDZgPG0Bm/EEk4U
	 8sys/+8s2W9Ck8tQSCyN9Ruja31jv/N/fhJiqQSvGAuu0BQ+8VxrJozMnITNeCJkPE
	 yQLtuxXsZfjsiri9gqhoaNoCkaw340CfcT7wWIkKc9yj5x/DEY0bupqhr+zGozaO+R
	 Dns4k+k1W6Ehv2bt4qkU1a9sXCQs35haum9nPXkWQ5CZzTEltwPw/yYwzkcRp35teZ
	 K/Iyz/uGJ2kOD34KW+LN1gQeM6Z8XmgaStHi5+IxO5PI6SqKeCOmUHZAAZWnLwUBCs
	 n1Q1+m0RTJbPg==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 01/12] sched_ext: Introduce scx_sched
Date: Wed, 23 Apr 2025 13:44:39 -1000
Message-ID: <20250423234542.1890867-2-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423234542.1890867-1-tj@kernel.org>
References: <20250423234542.1890867-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support multiple scheduler instances, collect some of the global
variables that should be specific to a scheduler instance into the new
struct scx_sched. scx_root is the root scheduler instance and points to a
static instance of struct scx_sched. Except for an extra dereference through
the scx_root pointer, this patch makes no functional changes.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c      | 243 +++++++++++++++++++++-------------------
 kernel/sched/ext_idle.c |   3 +-
 2 files changed, 131 insertions(+), 115 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 6e530a91e944..975f6963a01b 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -763,6 +763,18 @@ enum scx_opi {
 	SCX_OPI_END			= SCX_OP_IDX(init),
 };
 
+struct scx_sched {
+	struct sched_ext_ops	ops;
+	DECLARE_BITMAP(has_op, SCX_OPI_END);
+
+	bool			warned_zero_slice;
+
+	atomic_t		exit_kind;
+	struct scx_exit_info	*exit_info;
+
+	struct kobject		*kobj;
+};
+
 enum scx_wake_flags {
 	/* expose select WF_* flags as enums */
 	SCX_WAKE_FORK		= WF_FORK,
@@ -921,6 +933,12 @@ enum scx_ops_state {
 #define SCX_OPSS_STATE_MASK	((1LU << SCX_OPSS_QSEQ_SHIFT) - 1)
 #define SCX_OPSS_QSEQ_MASK	(~SCX_OPSS_STATE_MASK)
 
+static struct scx_sched __scx_root = {
+	.exit_kind		= ATOMIC_INIT(SCX_EXIT_DONE),
+};
+
+static struct scx_sched *scx_root = &__scx_root;
+
 /*
  * During exit, a task may schedule after losing its PIDs. When disabling the
  * BPF scheduler, we need to be able to iterate tasks in every state to
@@ -943,14 +961,6 @@ static bool scx_init_task_enabled;
 static bool scx_switching_all;
 DEFINE_STATIC_KEY_FALSE(__scx_switched_all);
 
-static struct sched_ext_ops scx_ops;
-static bool scx_warned_zero_slice;
-
-static DECLARE_BITMAP(scx_has_op, SCX_OPI_END);
-
-static atomic_t scx_exit_kind = ATOMIC_INIT(SCX_EXIT_DONE);
-static struct scx_exit_info *scx_exit_info;
-
 static atomic_long_t scx_nr_rejected = ATOMIC_LONG_INIT(0);
 static atomic_long_t scx_hotplug_seq = ATOMIC_LONG_INIT(0);
 
@@ -1053,7 +1063,6 @@ static struct scx_dump_data scx_dump_data = {
 
 /* /sys/kernel/sched_ext interface */
 static struct kset *scx_kset;
-static struct kobject *scx_root_kobj;
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/sched_ext.h>
@@ -1072,7 +1081,7 @@ static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
 #define scx_error(fmt, args...)							\
 	__scx_error(SCX_EXIT_ERROR, fmt, ##args)
 
-#define SCX_HAS_OP(op)	test_bit(SCX_OP_IDX(op), scx_has_op)
+#define SCX_HAS_OP(sch, op)	test_bit(SCX_OP_IDX(op), (sch)->has_op)
 
 static long jiffies_delta_msecs(unsigned long at, unsigned long now)
 {
@@ -1168,25 +1177,25 @@ do {										\
 	update_locked_rq(rq);							\
 	if (mask) {								\
 		scx_kf_allow(mask);						\
-		scx_ops.op(args);						\
+		scx_root->ops.op(args);						\
 		scx_kf_disallow(mask);						\
 	} else {								\
-		scx_ops.op(args);						\
+		scx_root->ops.op(args);						\
 	}									\
 	update_locked_rq(NULL);							\
 } while (0)
 
 #define SCX_CALL_OP_RET(mask, op, rq, args...)					\
 ({										\
-	__typeof__(scx_ops.op(args)) __ret;					\
+	__typeof__(scx_root->ops.op(args)) __ret;				\
 										\
 	update_locked_rq(rq);							\
 	if (mask) {								\
 		scx_kf_allow(mask);						\
-		__ret = scx_ops.op(args);					\
+		__ret = scx_root->ops.op(args);					\
 		scx_kf_disallow(mask);						\
 	} else {								\
-		__ret = scx_ops.op(args);					\
+		__ret = scx_root->ops.op(args);					\
 	}									\
 	update_locked_rq(NULL);							\
 	__ret;									\
@@ -1213,7 +1222,7 @@ do {										\
 
 #define SCX_CALL_OP_TASK_RET(mask, op, rq, task, args...)			\
 ({										\
-	__typeof__(scx_ops.op(task, ##args)) __ret;				\
+	__typeof__(scx_root->ops.op(task, ##args)) __ret;			\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task;					\
 	__ret = SCX_CALL_OP_RET(mask, op, rq, task, ##args);			\
@@ -1223,7 +1232,7 @@ do {										\
 
 #define SCX_CALL_OP_2TASKS_RET(mask, op, rq, task0, task1, args...)		\
 ({										\
-	__typeof__(scx_ops.op(task0, task1, ##args)) __ret;			\
+	__typeof__(scx_root->ops.op(task0, task1, ##args)) __ret;		\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task0;					\
 	current->scx.kf_tasks[1] = task1;					\
@@ -1825,7 +1834,7 @@ static void touch_core_sched_dispatch(struct rq *rq, struct task_struct *p)
 	lockdep_assert_rq_held(rq);
 
 #ifdef CONFIG_SCHED_CORE
-	if (unlikely(SCX_HAS_OP(core_sched_before)))
+	if (unlikely(SCX_HAS_OP(scx_root, core_sched_before)))
 		touch_core_sched(rq, p);
 #endif
 }
@@ -2200,20 +2209,20 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 		goto direct;
 
 	/* see %SCX_OPS_ENQ_EXITING */
-	if (!(scx_ops.flags & SCX_OPS_ENQ_EXITING) &&
+	if (!(scx_root->ops.flags & SCX_OPS_ENQ_EXITING) &&
 	    unlikely(p->flags & PF_EXITING)) {
 		__scx_add_event(SCX_EV_ENQ_SKIP_EXITING, 1);
 		goto local;
 	}
 
 	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
-	if (!(scx_ops.flags & SCX_OPS_ENQ_MIGRATION_DISABLED) &&
+	if (!(scx_root->ops.flags & SCX_OPS_ENQ_MIGRATION_DISABLED) &&
 	    is_migration_disabled(p)) {
 		__scx_add_event(SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
 		goto local;
 	}
 
-	if (unlikely(!SCX_HAS_OP(enqueue)))
+	if (unlikely(!SCX_HAS_OP(scx_root, enqueue)))
 		goto global;
 
 	/* DSQ bypass didn't trigger, enqueue on the BPF scheduler */
@@ -2320,7 +2329,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 	rq->scx.nr_running++;
 	add_nr_running(rq, 1);
 
-	if (SCX_HAS_OP(runnable) && !task_on_rq_migrating(p))
+	if (SCX_HAS_OP(scx_root, runnable) && !task_on_rq_migrating(p))
 		SCX_CALL_OP_TASK(SCX_KF_REST, runnable, rq, p, enq_flags);
 
 	if (enq_flags & SCX_ENQ_WAKEUP)
@@ -2355,7 +2364,7 @@ static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
 		 */
 		BUG();
 	case SCX_OPSS_QUEUED:
-		if (SCX_HAS_OP(dequeue))
+		if (SCX_HAS_OP(scx_root, dequeue))
 			SCX_CALL_OP_TASK(SCX_KF_REST, dequeue, rq, p, deq_flags);
 
 		if (atomic_long_try_cmpxchg(&p->scx.ops_state, &opss,
@@ -2403,12 +2412,12 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
 	 * information meaningful to the BPF scheduler and can be suppressed by
 	 * skipping the callbacks if the task is !QUEUED.
 	 */
-	if (SCX_HAS_OP(stopping) && task_current(rq, p)) {
+	if (SCX_HAS_OP(scx_root, stopping) && task_current(rq, p)) {
 		update_curr_scx(rq);
 		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, false);
 	}
 
-	if (SCX_HAS_OP(quiescent) && !task_on_rq_migrating(p))
+	if (SCX_HAS_OP(scx_root, quiescent) && !task_on_rq_migrating(p))
 		SCX_CALL_OP_TASK(SCX_KF_REST, quiescent, rq, p, deq_flags);
 
 	if (deq_flags & SCX_DEQ_SLEEP)
@@ -2428,7 +2437,7 @@ static void yield_task_scx(struct rq *rq)
 {
 	struct task_struct *p = rq->curr;
 
-	if (SCX_HAS_OP(yield))
+	if (SCX_HAS_OP(scx_root, yield))
 		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, p, NULL);
 	else
 		p->scx.slice = 0;
@@ -2438,7 +2447,7 @@ static bool yield_to_task_scx(struct rq *rq, struct task_struct *to)
 {
 	struct task_struct *from = rq->curr;
 
-	if (SCX_HAS_OP(yield))
+	if (SCX_HAS_OP(scx_root, yield))
 		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, from, to);
 	else
 		return false;
@@ -2988,7 +2997,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	rq->scx.flags |= SCX_RQ_IN_BALANCE;
 	rq->scx.flags &= ~(SCX_RQ_BAL_PENDING | SCX_RQ_BAL_KEEP);
 
-	if ((scx_ops.flags & SCX_OPS_HAS_CPU_PREEMPT) &&
+	if ((scx_root->ops.flags & SCX_OPS_HAS_CPU_PREEMPT) &&
 	    unlikely(rq->scx.cpu_released)) {
 		/*
 		 * If the previous sched_class for the current CPU was not SCX,
@@ -2996,7 +3005,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 		 * core. This callback complements ->cpu_release(), which is
 		 * emitted in switch_class().
 		 */
-		if (SCX_HAS_OP(cpu_acquire))
+		if (SCX_HAS_OP(scx_root, cpu_acquire))
 			SCX_CALL_OP(SCX_KF_REST, cpu_acquire, rq, cpu_of(rq), NULL);
 		rq->scx.cpu_released = false;
 	}
@@ -3027,7 +3036,8 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	if (consume_global_dsq(rq))
 		goto has_tasks;
 
-	if (unlikely(!SCX_HAS_OP(dispatch)) || scx_rq_bypassing(rq) || !scx_rq_online(rq))
+	if (unlikely(!SCX_HAS_OP(scx_root, dispatch)) ||
+	    scx_rq_bypassing(rq) || !scx_rq_online(rq))
 		goto no_tasks;
 
 	dspc->rq = rq;
@@ -3077,7 +3087,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	 * %SCX_OPS_ENQ_LAST is in effect.
 	 */
 	if (prev_on_rq &&
-	    (!(scx_ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
+	    (!(scx_root->ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
 		rq->scx.flags |= SCX_RQ_BAL_KEEP;
 		__scx_add_event(SCX_EV_DISPATCH_KEEP_LAST, 1);
 		goto has_tasks;
@@ -3163,7 +3173,7 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 	p->se.exec_start = rq_clock_task(rq);
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
-	if (SCX_HAS_OP(running) && (p->scx.flags & SCX_TASK_QUEUED))
+	if (SCX_HAS_OP(scx_root, running) && (p->scx.flags & SCX_TASK_QUEUED))
 		SCX_CALL_OP_TASK(SCX_KF_REST, running, rq, p);
 
 	clr_task_runnable(p, true);
@@ -3217,7 +3227,7 @@ static void switch_class(struct rq *rq, struct task_struct *next)
 	 */
 	smp_store_release(&rq->scx.pnt_seq, rq->scx.pnt_seq + 1);
 #endif
-	if (!(scx_ops.flags & SCX_OPS_HAS_CPU_PREEMPT))
+	if (!(scx_root->ops.flags & SCX_OPS_HAS_CPU_PREEMPT))
 		return;
 
 	/*
@@ -3239,7 +3249,7 @@ static void switch_class(struct rq *rq, struct task_struct *next)
 	 *  next time that balance_scx() is invoked.
 	 */
 	if (!rq->scx.cpu_released) {
-		if (SCX_HAS_OP(cpu_release)) {
+		if (SCX_HAS_OP(scx_root, cpu_release)) {
 			struct scx_cpu_release_args args = {
 				.reason = preempt_reason_from_class(next_class),
 				.task = next,
@@ -3257,7 +3267,7 @@ static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
 	update_curr_scx(rq);
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
-	if (SCX_HAS_OP(stopping) && (p->scx.flags & SCX_TASK_QUEUED))
+	if (SCX_HAS_OP(scx_root, stopping) && (p->scx.flags & SCX_TASK_QUEUED))
 		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, true);
 
 	if (p->scx.flags & SCX_TASK_QUEUED) {
@@ -3281,7 +3291,7 @@ static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
 		 * which should trigger an explicit follow-up scheduling event.
 		 */
 		if (sched_class_above(&ext_sched_class, next->sched_class)) {
-			WARN_ON_ONCE(!(scx_ops.flags & SCX_OPS_ENQ_LAST));
+			WARN_ON_ONCE(!(scx_root->ops.flags & SCX_OPS_ENQ_LAST));
 			do_enqueue_task(rq, p, SCX_ENQ_LAST, -1);
 		} else {
 			do_enqueue_task(rq, p, 0, -1);
@@ -3356,10 +3366,10 @@ static struct task_struct *pick_task_scx(struct rq *rq)
 		}
 
 		if (unlikely(!p->scx.slice)) {
-			if (!scx_rq_bypassing(rq) && !scx_warned_zero_slice) {
+			if (!scx_rq_bypassing(rq) && !scx_root->warned_zero_slice) {
 				printk_deferred(KERN_WARNING "sched_ext: %s[%d] has zero slice in %s()\n",
 						p->comm, p->pid, __func__);
-				scx_warned_zero_slice = true;
+				scx_root->warned_zero_slice = true;
 			}
 			refill_task_slice_dfl(p);
 		}
@@ -3395,7 +3405,8 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 	 * calling ops.core_sched_before(). Accesses are controlled by the
 	 * verifier.
 	 */
-	if (SCX_HAS_OP(core_sched_before) && !scx_rq_bypassing(task_rq(a)))
+	if (SCX_HAS_OP(scx_root, core_sched_before) &&
+	    !scx_rq_bypassing(task_rq(a)))
 		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, core_sched_before, NULL,
 					      (struct task_struct *)a,
 					      (struct task_struct *)b);
@@ -3424,7 +3435,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		return prev_cpu;
 
 	rq_bypass = scx_rq_bypassing(task_rq(p));
-	if (likely(SCX_HAS_OP(select_cpu)) && !rq_bypass) {
+	if (likely(SCX_HAS_OP(scx_root, select_cpu)) && !rq_bypass) {
 		s32 cpu;
 		struct task_struct **ddsp_taskp;
 
@@ -3476,7 +3487,7 @@ static void set_cpus_allowed_scx(struct task_struct *p,
 	 * Fine-grained memory write control is enforced by BPF making the const
 	 * designation pointless. Cast it away when calling the operation.
 	 */
-	if (SCX_HAS_OP(set_cpumask))
+	if (SCX_HAS_OP(scx_root, set_cpumask))
 		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, NULL,
 				 p, (struct cpumask *)p->cpus_ptr);
 }
@@ -3488,11 +3499,11 @@ static void handle_hotplug(struct rq *rq, bool online)
 	atomic_long_inc(&scx_hotplug_seq);
 
 	if (scx_enabled())
-		scx_idle_update_selcpu_topology(&scx_ops);
+		scx_idle_update_selcpu_topology(&scx_root->ops);
 
-	if (online && SCX_HAS_OP(cpu_online))
+	if (online && SCX_HAS_OP(scx_root, cpu_online))
 		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, rq, cpu);
-	else if (!online && SCX_HAS_OP(cpu_offline))
+	else if (!online && SCX_HAS_OP(scx_root, cpu_offline))
 		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, rq, cpu);
 	else
 		scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
@@ -3595,7 +3606,7 @@ static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
 	if (scx_rq_bypassing(rq)) {
 		curr->scx.slice = 0;
 		touch_core_sched(rq, curr);
-	} else if (SCX_HAS_OP(tick)) {
+	} else if (SCX_HAS_OP(scx_root, tick)) {
 		SCX_CALL_OP_TASK(SCX_KF_REST, tick, rq, curr);
 	}
 
@@ -3667,7 +3678,7 @@ static int scx_init_task(struct task_struct *p, struct task_group *tg, bool fork
 
 	p->scx.disallow = false;
 
-	if (SCX_HAS_OP(init_task)) {
+	if (SCX_HAS_OP(scx_root, init_task)) {
 		struct scx_init_task_args args = {
 			SCX_INIT_TASK_ARGS_CGROUP(tg)
 			.fork = fork,
@@ -3730,11 +3741,11 @@ static void scx_enable_task(struct task_struct *p)
 
 	p->scx.weight = sched_weight_to_cgroup(weight);
 
-	if (SCX_HAS_OP(enable))
+	if (SCX_HAS_OP(scx_root, enable))
 		SCX_CALL_OP_TASK(SCX_KF_REST, enable, rq, p);
 	scx_set_task_state(p, SCX_TASK_ENABLED);
 
-	if (SCX_HAS_OP(set_weight))
+	if (SCX_HAS_OP(scx_root, set_weight))
 		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
 }
 
@@ -3745,7 +3756,7 @@ static void scx_disable_task(struct task_struct *p)
 	lockdep_assert_rq_held(rq);
 	WARN_ON_ONCE(scx_get_task_state(p) != SCX_TASK_ENABLED);
 
-	if (SCX_HAS_OP(disable))
+	if (SCX_HAS_OP(scx_root, disable))
 		SCX_CALL_OP_TASK(SCX_KF_REST, disable, rq, p);
 	scx_set_task_state(p, SCX_TASK_READY);
 }
@@ -3774,7 +3785,7 @@ static void scx_exit_task(struct task_struct *p)
 		return;
 	}
 
-	if (SCX_HAS_OP(exit_task))
+	if (SCX_HAS_OP(scx_root, exit_task))
 		SCX_CALL_OP_TASK(SCX_KF_REST, exit_task, task_rq(p), p, &args);
 	scx_set_task_state(p, SCX_TASK_NONE);
 }
@@ -3883,7 +3894,7 @@ static void reweight_task_scx(struct rq *rq, struct task_struct *p,
 	lockdep_assert_rq_held(task_rq(p));
 
 	p->scx.weight = sched_weight_to_cgroup(scale_load_down(lw->weight));
-	if (SCX_HAS_OP(set_weight))
+	if (SCX_HAS_OP(scx_root, set_weight))
 		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
 }
 
@@ -3899,7 +3910,7 @@ static void switching_to_scx(struct rq *rq, struct task_struct *p)
 	 * set_cpus_allowed_scx() is not called while @p is associated with a
 	 * different scheduler class. Keep the BPF scheduler up-to-date.
 	 */
-	if (SCX_HAS_OP(set_cpumask))
+	if (SCX_HAS_OP(scx_root, set_cpumask))
 		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, rq,
 				 p, (struct cpumask *)p->cpus_ptr);
 }
@@ -3958,7 +3969,7 @@ int scx_tg_online(struct task_group *tg)
 	percpu_down_read(&scx_cgroup_rwsem);
 
 	if (scx_cgroup_enabled) {
-		if (SCX_HAS_OP(cgroup_init)) {
+		if (SCX_HAS_OP(scx_root, cgroup_init)) {
 			struct scx_cgroup_init_args args =
 				{ .weight = tg->scx_weight };
 
@@ -3983,7 +3994,7 @@ void scx_tg_offline(struct task_group *tg)
 
 	percpu_down_read(&scx_cgroup_rwsem);
 
-	if (SCX_HAS_OP(cgroup_exit) && (tg->scx_flags & SCX_TG_INITED))
+	if (SCX_HAS_OP(scx_root, cgroup_exit) && (tg->scx_flags & SCX_TG_INITED))
 		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, NULL, tg->css.cgroup);
 	tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
 
@@ -4016,7 +4027,7 @@ int scx_cgroup_can_attach(struct cgroup_taskset *tset)
 		if (from == to)
 			continue;
 
-		if (SCX_HAS_OP(cgroup_prep_move)) {
+		if (SCX_HAS_OP(scx_root, cgroup_prep_move)) {
 			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_prep_move, NULL,
 					      p, from, css->cgroup);
 			if (ret)
@@ -4030,7 +4041,8 @@ int scx_cgroup_can_attach(struct cgroup_taskset *tset)
 
 err:
 	cgroup_taskset_for_each(p, css, tset) {
-		if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
+		if (SCX_HAS_OP(scx_root, cgroup_cancel_move) &&
+		    p->scx.cgrp_moving_from)
 			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
 				    p, p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
@@ -4049,7 +4061,8 @@ void scx_cgroup_move_task(struct task_struct *p)
 	 * @p must have ops.cgroup_prep_move() called on it and thus
 	 * cgrp_moving_from set.
 	 */
-	if (SCX_HAS_OP(cgroup_move) && !WARN_ON_ONCE(!p->scx.cgrp_moving_from))
+	if (SCX_HAS_OP(scx_root, cgroup_move) &&
+	    !WARN_ON_ONCE(!p->scx.cgrp_moving_from))
 		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, cgroup_move, NULL,
 				 p, p->scx.cgrp_moving_from, tg_cgrp(task_group(p)));
 	p->scx.cgrp_moving_from = NULL;
@@ -4069,7 +4082,8 @@ void scx_cgroup_cancel_attach(struct cgroup_taskset *tset)
 		goto out_unlock;
 
 	cgroup_taskset_for_each(p, css, tset) {
-		if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
+		if (SCX_HAS_OP(scx_root, cgroup_cancel_move) &&
+		    p->scx.cgrp_moving_from)
 			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
 				    p, p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
@@ -4083,7 +4097,7 @@ void scx_group_set_weight(struct task_group *tg, unsigned long weight)
 	percpu_down_read(&scx_cgroup_rwsem);
 
 	if (scx_cgroup_enabled && tg->scx_weight != weight) {
-		if (SCX_HAS_OP(cgroup_set_weight))
+		if (SCX_HAS_OP(scx_root, cgroup_set_weight))
 			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_set_weight, NULL,
 				    tg_cgrp(tg), weight);
 		tg->scx_weight = weight;
@@ -4266,7 +4280,7 @@ static void scx_cgroup_exit(void)
 			continue;
 		tg->scx_flags &= ~SCX_TG_INITED;
 
-		if (!scx_ops.cgroup_exit)
+		if (!scx_root->ops.cgroup_exit)
 			continue;
 
 		if (WARN_ON_ONCE(!css_tryget(css)))
@@ -4301,7 +4315,7 @@ static int scx_cgroup_init(void)
 		     (SCX_TG_ONLINE | SCX_TG_INITED)) != SCX_TG_ONLINE)
 			continue;
 
-		if (!scx_ops.cgroup_init) {
+		if (!scx_root->ops.cgroup_init) {
 			tg->scx_flags |= SCX_TG_INITED;
 			continue;
 		}
@@ -4402,7 +4416,7 @@ static void scx_kobj_release(struct kobject *kobj)
 static ssize_t scx_attr_ops_show(struct kobject *kobj,
 				 struct kobj_attribute *ka, char *buf)
 {
-	return sysfs_emit(buf, "%s\n", scx_ops.name);
+	return sysfs_emit(buf, "%s\n", scx_root->ops.name);
 }
 SCX_ATTR(ops);
 
@@ -4445,7 +4459,7 @@ static const struct kobj_type scx_ktype = {
 
 static int scx_uevent(const struct kobject *kobj, struct kobj_uevent_env *env)
 {
-	return add_uevent_var(env, "SCXOPS=%s", scx_ops.name);
+	return add_uevent_var(env, "SCXOPS=%s", scx_root->ops.name);
 }
 
 static const struct kset_uevent_ops scx_uevent_ops = {
@@ -4468,7 +4482,7 @@ bool task_should_scx(int policy)
 bool scx_allow_ttwu_queue(const struct task_struct *p)
 {
 	return !scx_enabled() ||
-		(scx_ops.flags & SCX_OPS_ALLOW_QUEUED_WAKEUP) ||
+		(scx_root->ops.flags & SCX_OPS_ALLOW_QUEUED_WAKEUP) ||
 		p->sched_class != &ext_sched_class;
 }
 
@@ -4497,7 +4511,7 @@ void scx_softlockup(u32 dur_s)
 		return;
 
 	printk_deferred(KERN_ERR "sched_ext: Soft lockup - CPU%d stuck for %us, disabling \"%s\"\n",
-			smp_processor_id(), dur_s, scx_ops.name);
+			smp_processor_id(), dur_s, scx_root->ops.name);
 
 	/*
 	 * Some CPUs may be trapped in the dispatch paths. Enable breather
@@ -4686,14 +4700,14 @@ static const char *scx_exit_reason(enum scx_exit_kind kind)
 
 static void scx_disable_workfn(struct kthread_work *work)
 {
-	struct scx_exit_info *ei = scx_exit_info;
+	struct scx_exit_info *ei = scx_root->exit_info;
 	struct scx_task_iter sti;
 	struct task_struct *p;
 	struct rhashtable_iter rht_iter;
 	struct scx_dispatch_q *dsq;
 	int kind, cpu;
 
-	kind = atomic_read(&scx_exit_kind);
+	kind = atomic_read(&scx_root->exit_kind);
 	while (true) {
 		/*
 		 * NONE indicates that a new scx_ops has been registered since
@@ -4702,7 +4716,7 @@ static void scx_disable_workfn(struct kthread_work *work)
 		 */
 		if (kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE)
 			return;
-		if (atomic_try_cmpxchg(&scx_exit_kind, &kind, SCX_EXIT_DONE))
+		if (atomic_try_cmpxchg(&scx_root->exit_kind, &kind, SCX_EXIT_DONE))
 			break;
 	}
 	ei->kind = kind;
@@ -4717,7 +4731,7 @@ static void scx_disable_workfn(struct kthread_work *work)
 		break;
 	case SCX_DISABLED:
 		pr_warn("sched_ext: ops error detected without ops (%s)\n",
-			scx_exit_info->msg);
+			scx_root->exit_info->msg);
 		WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
 		goto done;
 	default:
@@ -4784,25 +4798,26 @@ static void scx_disable_workfn(struct kthread_work *work)
 
 	/* no task is on scx, turn off all the switches and flush in-progress calls */
 	static_branch_disable(&__scx_enabled);
-	bitmap_zero(scx_has_op, SCX_OPI_END);
+	bitmap_zero(scx_root->has_op, SCX_OPI_END);
 	scx_idle_disable();
 	synchronize_rcu();
 
 	if (ei->kind >= SCX_EXIT_ERROR) {
 		pr_err("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
-		       scx_ops.name, ei->reason);
+		       scx_root->ops.name, ei->reason);
 
 		if (ei->msg[0] != '\0')
-			pr_err("sched_ext: %s: %s\n", scx_ops.name, ei->msg);
+			pr_err("sched_ext: %s: %s\n",
+			       scx_root->ops.name, ei->msg);
 #ifdef CONFIG_STACKTRACE
 		stack_trace_print(ei->bt, ei->bt_len, 2);
 #endif
 	} else {
 		pr_info("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
-			scx_ops.name, ei->reason);
+			scx_root->ops.name, ei->reason);
 	}
 
-	if (scx_ops.exit)
+	if (scx_root->ops.exit)
 		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, NULL, ei);
 
 	cancel_delayed_work_sync(&scx_watchdog_work);
@@ -4813,11 +4828,11 @@ static void scx_disable_workfn(struct kthread_work *work)
 	 * asynchronously, sysfs could observe an object of the same name still
 	 * in the hierarchy when another scheduler is loaded.
 	 */
-	kobject_del(scx_root_kobj);
-	kobject_put(scx_root_kobj);
-	scx_root_kobj = NULL;
+	kobject_del(scx_root->kobj);
+	kobject_put(scx_root->kobj);
+	scx_root->kobj = NULL;
 
-	memset(&scx_ops, 0, sizeof(scx_ops));
+	memset(&scx_root->ops, 0, sizeof(scx_root->ops));
 
 	rhashtable_walk_enter(&dsq_hash, &rht_iter);
 	do {
@@ -4834,8 +4849,8 @@ static void scx_disable_workfn(struct kthread_work *work)
 	scx_dsp_ctx = NULL;
 	scx_dsp_max_batch = 0;
 
-	free_exit_info(scx_exit_info);
-	scx_exit_info = NULL;
+	free_exit_info(scx_root->exit_info);
+	scx_root->exit_info = NULL;
 
 	mutex_unlock(&scx_enable_mutex);
 
@@ -4865,7 +4880,7 @@ static void scx_disable(enum scx_exit_kind kind)
 	if (WARN_ON_ONCE(kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE))
 		kind = SCX_EXIT_ERROR;
 
-	atomic_try_cmpxchg(&scx_exit_kind, &none, kind);
+	atomic_try_cmpxchg(&scx_root->exit_kind, &none, kind);
 
 	schedule_scx_disable_work();
 }
@@ -5007,7 +5022,7 @@ static void scx_dump_task(struct seq_buf *s, struct scx_dump_ctx *dctx,
 		  p->scx.dsq_vtime, p->scx.slice, p->scx.weight);
 	dump_line(s, "      cpus=%*pb", cpumask_pr_args(p->cpus_ptr));
 
-	if (SCX_HAS_OP(dump_task)) {
+	if (SCX_HAS_OP(scx_root, dump_task)) {
 		ops_dump_init(s, "    ");
 		SCX_CALL_OP(SCX_KF_REST, dump_task, NULL, dctx, p);
 		ops_dump_exit();
@@ -5054,7 +5069,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 		dump_stack_trace(&s, "  ", ei->bt, ei->bt_len);
 	}
 
-	if (SCX_HAS_OP(dump)) {
+	if (SCX_HAS_OP(scx_root, dump)) {
 		ops_dump_init(&s, "");
 		SCX_CALL_OP(SCX_KF_UNLOCKED, dump, NULL, &dctx);
 		ops_dump_exit();
@@ -5077,7 +5092,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 		idle = list_empty(&rq->scx.runnable_list) &&
 			rq->curr->sched_class == &idle_sched_class;
 
-		if (idle && !SCX_HAS_OP(dump_cpu))
+		if (idle && !SCX_HAS_OP(scx_root, dump_cpu))
 			goto next;
 
 		/*
@@ -5111,7 +5126,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 				  cpumask_pr_args(rq->scx.cpus_to_wait));
 
 		used = seq_buf_used(&ns);
-		if (SCX_HAS_OP(dump_cpu)) {
+		if (SCX_HAS_OP(scx_root, dump_cpu)) {
 			ops_dump_init(&ns, "  ");
 			SCX_CALL_OP(SCX_KF_REST, dump_cpu, NULL, &dctx, cpu, idle);
 			ops_dump_exit();
@@ -5167,10 +5182,10 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 
 static void scx_error_irq_workfn(struct irq_work *irq_work)
 {
-	struct scx_exit_info *ei = scx_exit_info;
+	struct scx_exit_info *ei = scx_root->exit_info;
 
 	if (ei->kind >= SCX_EXIT_ERROR)
-		scx_dump_state(ei, scx_ops.exit_dump_len);
+		scx_dump_state(ei, scx_root->ops.exit_dump_len);
 
 	schedule_scx_disable_work();
 }
@@ -5180,11 +5195,11 @@ static DEFINE_IRQ_WORK(scx_error_irq_work, scx_error_irq_workfn);
 static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
 				      const char *fmt, ...)
 {
-	struct scx_exit_info *ei = scx_exit_info;
+	struct scx_exit_info *ei = scx_root->exit_info;
 	int none = SCX_EXIT_NONE;
 	va_list args;
 
-	if (!atomic_try_cmpxchg(&scx_exit_kind, &none, kind))
+	if (!atomic_try_cmpxchg(&scx_root->exit_kind, &none, kind))
 		return;
 
 	ei->exit_code = exit_code;
@@ -5327,19 +5342,19 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		goto err_unlock;
 	}
 
-	scx_root_kobj = kzalloc(sizeof(*scx_root_kobj), GFP_KERNEL);
-	if (!scx_root_kobj) {
+	scx_root->kobj = kzalloc(sizeof(*scx_root->kobj), GFP_KERNEL);
+	if (!scx_root->kobj) {
 		ret = -ENOMEM;
 		goto err_unlock;
 	}
 
-	scx_root_kobj->kset = scx_kset;
-	ret = kobject_init_and_add(scx_root_kobj, &scx_ktype, NULL, "root");
+	scx_root->kobj->kset = scx_kset;
+	ret = kobject_init_and_add(scx_root->kobj, &scx_ktype, NULL, "root");
 	if (ret < 0)
 		goto err;
 
-	scx_exit_info = alloc_exit_info(ops->exit_dump_len);
-	if (!scx_exit_info) {
+	scx_root->exit_info = alloc_exit_info(ops->exit_dump_len);
+	if (!scx_root->exit_info) {
 		ret = -ENOMEM;
 		goto err_del;
 	}
@@ -5348,12 +5363,12 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 * Set scx_ops, transition to ENABLING and clear exit info to arm the
 	 * disable path. Failure triggers full disabling from here on.
 	 */
-	scx_ops = *ops;
+	scx_root->ops = *ops;
 
 	WARN_ON_ONCE(scx_set_enable_state(SCX_ENABLING) != SCX_DISABLED);
 
-	atomic_set(&scx_exit_kind, SCX_EXIT_NONE);
-	scx_warned_zero_slice = false;
+	atomic_set(&scx_root->exit_kind, SCX_EXIT_NONE);
+	scx_root->warned_zero_slice = false;
 
 	atomic_long_set(&scx_nr_rejected, 0);
 
@@ -5368,7 +5383,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	scx_idle_enable(ops);
 
-	if (scx_ops.init) {
+	if (scx_root->ops.init) {
 		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init, NULL);
 		if (ret) {
 			ret = ops_sanitize_err("init", ret);
@@ -5380,7 +5395,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	for (i = SCX_OPI_CPU_HOTPLUG_BEGIN; i < SCX_OPI_CPU_HOTPLUG_END; i++)
 		if (((void (**)(void))ops)[i])
-			set_bit(i, scx_has_op);
+			set_bit(i, scx_root->has_op);
 
 	check_hotplug_seq(ops);
 	scx_idle_update_selcpu_topology(ops);
@@ -5421,10 +5436,10 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	for (i = SCX_OPI_NORMAL_BEGIN; i < SCX_OPI_NORMAL_END; i++)
 		if (((void (**)(void))ops)[i])
-			set_bit(i, scx_has_op);
+			set_bit(i, scx_root->has_op);
 
-	if (scx_ops.cpu_acquire || scx_ops.cpu_release)
-		scx_ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
+	if (scx_root->ops.cpu_acquire || scx_root->ops.cpu_release)
+		scx_root->ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
 
 	/*
 	 * Lock out forks, cgroup on/offlining and moves before opening the
@@ -5523,7 +5538,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	scx_bypass(false);
 
 	if (!scx_tryset_enable_state(SCX_ENABLED, SCX_ENABLING)) {
-		WARN_ON_ONCE(atomic_read(&scx_exit_kind) == SCX_EXIT_NONE);
+		WARN_ON_ONCE(atomic_read(&scx_root->exit_kind) == SCX_EXIT_NONE);
 		goto err_disable;
 	}
 
@@ -5531,8 +5546,8 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		static_branch_enable(&__scx_switched_all);
 
 	pr_info("sched_ext: BPF scheduler \"%s\" enabled%s\n",
-		scx_ops.name, scx_switched_all() ? "" : " (partial)");
-	kobject_uevent(scx_root_kobj, KOBJ_ADD);
+		scx_root->ops.name, scx_switched_all() ? "" : " (partial)");
+	kobject_uevent(scx_root->kobj, KOBJ_ADD);
 	mutex_unlock(&scx_enable_mutex);
 
 	atomic_long_inc(&scx_enable_seq);
@@ -5540,13 +5555,13 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	return 0;
 
 err_del:
-	kobject_del(scx_root_kobj);
+	kobject_del(scx_root->kobj);
 err:
-	kobject_put(scx_root_kobj);
-	scx_root_kobj = NULL;
-	if (scx_exit_info) {
-		free_exit_info(scx_exit_info);
-		scx_exit_info = NULL;
+	kobject_put(scx_root->kobj);
+	scx_root->kobj = NULL;
+	if (scx_root->exit_info) {
+		free_exit_info(scx_root->exit_info);
+		scx_root->exit_info = NULL;
 	}
 err_unlock:
 	mutex_unlock(&scx_enable_mutex);
@@ -6006,7 +6021,7 @@ void print_scx_info(const char *log_lvl, struct task_struct *p)
 	 */
 	if (copy_from_kernel_nofault(&class, &p->sched_class, sizeof(class)) ||
 	    class != &ext_sched_class) {
-		printk("%sSched_ext: %s (%s%s)", log_lvl, scx_ops.name,
+		printk("%sSched_ext: %s (%s%s)", log_lvl, scx_root->ops.name,
 		       scx_enable_state_str[state], all);
 		return;
 	}
@@ -6018,7 +6033,7 @@ void print_scx_info(const char *log_lvl, struct task_struct *p)
 
 	/* print everything onto one line to conserve console space */
 	printk("%sSched_ext: %s (%s%s), task: runnable_at=%s",
-	       log_lvl, scx_ops.name, scx_enable_state_str[state], all,
+	       log_lvl, scx_root->ops.name, scx_enable_state_str[state], all,
 	       runnable_at_buf);
 }
 
diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 35aa309c9584..6915685cd3d6 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -744,7 +744,8 @@ void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
 	 * Idle transitions are indicated by do_notify being set to true,
 	 * managed by put_prev_task_idle()/set_next_task_idle().
 	 */
-	if (SCX_HAS_OP(update_idle) && do_notify && !scx_rq_bypassing(rq))
+	if (SCX_HAS_OP(scx_root, update_idle) &&
+	    do_notify && !scx_rq_bypassing(rq))
 		SCX_CALL_OP(SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
 
 	/*
-- 
2.49.0

