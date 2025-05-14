Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABF81D63C3
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747198067; cv=none; b=ZgjkoF6W3bn3Ox8XrMkuNnS9p/dUrAxtPlJISknJ6gCDq+Q8FeC8KE3svS5XwOckEXuGT2fSQ5NeYHvErjW5NoVdBlbBpZfsBL7ryFFHlfGAJH6LfsOKD3m5nwszrp1s260lzHPgvuewYLbEGmYTb8dNk0VpbRpsNWjIkYSmkwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747198067; c=relaxed/simple;
	bh=FhLoY+PyrmHt8zibP34j3xBZtI+4VRQeKOmyGg3oCnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O6Fb+2xvBmMXARSI+TXgBQy4A7V2AYPyroHRkh05Z8yITUdnOEBGlRS+HqhwsikKD9JWW9jNjpdRaRfxUmb/bVFmHNqA9CotBCIGhC5q4oDEPXiCNfGJMVO1DRpQ7Uc7hGb1P9tUCrLm28Q6v00ipEHKsK/E8ePrvhEkEBD2CAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpUBDKLQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpUBDKLQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849B8C4CEED;
	Wed, 14 May 2025 04:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747198067;
	bh=FhLoY+PyrmHt8zibP34j3xBZtI+4VRQeKOmyGg3oCnY=;
	h=Date:From:To:Cc:Subject:From;
	b=DpUBDKLQXOJtL6DbjjdjChbmdVRs0Yi+Xk078SFf8Yn7/mCuQT5f5u5a0Qn3yCWOX
	 60oY6cvgAGb4VU6dOw8+pAwvYb0NeiAPqHBtmjEAizdTpcJgHKSXbkbBIGVqj0w6D6
	 TkDyNg+bB4ojH5U6euBRsgzCrHzKVEnefgtkgvCbBzTVFNwM1MfZ2laBq86h1uj55d
	 abm0CXTpCgb/YxLjhd77Aapb/cus7iZ03m9fwZzIgqJfC3bnkeX1ZiWH6z053kmfmC
	 F+SvJJDE5phLWl2lPj0wCkVvLj8GSlUxlRO4UJmSnUM9ACZjp/0TEiPJssjdTNuuvp
	 x6PMYhitYWr0Q==
Date: Wed, 14 May 2025 00:47:46 -0400
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4 sched_ext/for-6.16] sched_ext: Clean up scx_root usages
Message-ID: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

- Always cache scx_root into local variable sch before using.

- Don't use scx_root if cached sch is available.

- Wrap !sch test with unlikely().

- Pass @scx into scx_cgroup_init/exit().

No behavior changes intended.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c      |  157 +++++++++++++++++++++++++++++-------------------
 kernel/sched/ext_idle.c |    4 -
 2 files changed, 100 insertions(+), 61 deletions(-)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -2220,20 +2220,20 @@ static void do_enqueue_task(struct rq *r
 		goto direct;
 
 	/* see %SCX_OPS_ENQ_EXITING */
-	if (!(scx_root->ops.flags & SCX_OPS_ENQ_EXITING) &&
+	if (!(sch->ops.flags & SCX_OPS_ENQ_EXITING) &&
 	    unlikely(p->flags & PF_EXITING)) {
 		__scx_add_event(sch, SCX_EV_ENQ_SKIP_EXITING, 1);
 		goto local;
 	}
 
 	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
-	if (!(scx_root->ops.flags & SCX_OPS_ENQ_MIGRATION_DISABLED) &&
+	if (!(sch->ops.flags & SCX_OPS_ENQ_MIGRATION_DISABLED) &&
 	    is_migration_disabled(p)) {
 		__scx_add_event(sch, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
 		goto local;
 	}
 
-	if (unlikely(!SCX_HAS_OP(scx_root, enqueue)))
+	if (unlikely(!SCX_HAS_OP(sch, enqueue)))
 		goto global;
 
 	/* DSQ bypass didn't trigger, enqueue on the BPF scheduler */
@@ -2311,6 +2311,7 @@ static void clr_task_runnable(struct tas
 
 static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags)
 {
+	struct scx_sched *sch = scx_root;
 	int sticky_cpu = p->scx.sticky_cpu;
 
 	if (enq_flags & ENQUEUE_WAKEUP)
@@ -2340,7 +2341,7 @@ static void enqueue_task_scx(struct rq *
 	rq->scx.nr_running++;
 	add_nr_running(rq, 1);
 
-	if (SCX_HAS_OP(scx_root, runnable) && !task_on_rq_migrating(p))
+	if (SCX_HAS_OP(sch, runnable) && !task_on_rq_migrating(p))
 		SCX_CALL_OP_TASK(SCX_KF_REST, runnable, rq, p, enq_flags);
 
 	if (enq_flags & SCX_ENQ_WAKEUP)
@@ -2352,11 +2353,12 @@ out:
 
 	if ((enq_flags & SCX_ENQ_CPU_SELECTED) &&
 	    unlikely(cpu_of(rq) != p->scx.selected_cpu))
-		__scx_add_event(scx_root, SCX_EV_SELECT_CPU_FALLBACK, 1);
+		__scx_add_event(sch, SCX_EV_SELECT_CPU_FALLBACK, 1);
 }
 
 static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
 {
+	struct scx_sched *sch = scx_root;
 	unsigned long opss;
 
 	/* dequeue is always temporary, don't reset runnable_at */
@@ -2375,7 +2377,7 @@ static void ops_dequeue(struct rq *rq, s
 		 */
 		BUG();
 	case SCX_OPSS_QUEUED:
-		if (SCX_HAS_OP(scx_root, dequeue))
+		if (SCX_HAS_OP(sch, dequeue))
 			SCX_CALL_OP_TASK(SCX_KF_REST, dequeue, rq, p, deq_flags);
 
 		if (atomic_long_try_cmpxchg(&p->scx.ops_state, &opss,
@@ -2404,6 +2406,8 @@ static void ops_dequeue(struct rq *rq, s
 
 static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags)
 {
+	struct scx_sched *sch = scx_root;
+
 	if (!(p->scx.flags & SCX_TASK_QUEUED)) {
 		WARN_ON_ONCE(task_runnable(p));
 		return true;
@@ -2423,12 +2427,12 @@ static bool dequeue_task_scx(struct rq *
 	 * information meaningful to the BPF scheduler and can be suppressed by
 	 * skipping the callbacks if the task is !QUEUED.
 	 */
-	if (SCX_HAS_OP(scx_root, stopping) && task_current(rq, p)) {
+	if (SCX_HAS_OP(sch, stopping) && task_current(rq, p)) {
 		update_curr_scx(rq);
 		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, false);
 	}
 
-	if (SCX_HAS_OP(scx_root, quiescent) && !task_on_rq_migrating(p))
+	if (SCX_HAS_OP(sch, quiescent) && !task_on_rq_migrating(p))
 		SCX_CALL_OP_TASK(SCX_KF_REST, quiescent, rq, p, deq_flags);
 
 	if (deq_flags & SCX_DEQ_SLEEP)
@@ -2446,9 +2450,10 @@ static bool dequeue_task_scx(struct rq *
 
 static void yield_task_scx(struct rq *rq)
 {
+	struct scx_sched *sch = scx_root;
 	struct task_struct *p = rq->curr;
 
-	if (SCX_HAS_OP(scx_root, yield))
+	if (SCX_HAS_OP(sch, yield))
 		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, p, NULL);
 	else
 		p->scx.slice = 0;
@@ -2456,9 +2461,10 @@ static void yield_task_scx(struct rq *rq
 
 static bool yield_to_task_scx(struct rq *rq, struct task_struct *to)
 {
+	struct scx_sched *sch = scx_root;
 	struct task_struct *from = rq->curr;
 
-	if (SCX_HAS_OP(scx_root, yield))
+	if (SCX_HAS_OP(sch, yield))
 		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, from, to);
 	else
 		return false;
@@ -3011,7 +3017,7 @@ static int balance_one(struct rq *rq, st
 	rq->scx.flags |= SCX_RQ_IN_BALANCE;
 	rq->scx.flags &= ~(SCX_RQ_BAL_PENDING | SCX_RQ_BAL_KEEP);
 
-	if ((scx_root->ops.flags & SCX_OPS_HAS_CPU_PREEMPT) &&
+	if ((sch->ops.flags & SCX_OPS_HAS_CPU_PREEMPT) &&
 	    unlikely(rq->scx.cpu_released)) {
 		/*
 		 * If the previous sched_class for the current CPU was not SCX,
@@ -3019,7 +3025,7 @@ static int balance_one(struct rq *rq, st
 		 * core. This callback complements ->cpu_release(), which is
 		 * emitted in switch_class().
 		 */
-		if (SCX_HAS_OP(scx_root, cpu_acquire))
+		if (SCX_HAS_OP(sch, cpu_acquire))
 			SCX_CALL_OP(SCX_KF_REST, cpu_acquire, rq, cpu_of(rq), NULL);
 		rq->scx.cpu_released = false;
 	}
@@ -3050,7 +3056,7 @@ static int balance_one(struct rq *rq, st
 	if (consume_global_dsq(sch, rq))
 		goto has_tasks;
 
-	if (unlikely(!SCX_HAS_OP(scx_root, dispatch)) ||
+	if (unlikely(!SCX_HAS_OP(sch, dispatch)) ||
 	    scx_rq_bypassing(rq) || !scx_rq_online(rq))
 		goto no_tasks;
 
@@ -3101,7 +3107,7 @@ no_tasks:
 	 * %SCX_OPS_ENQ_LAST is in effect.
 	 */
 	if (prev_on_rq &&
-	    (!(scx_root->ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
+	    (!(sch->ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
 		rq->scx.flags |= SCX_RQ_BAL_KEEP;
 		__scx_add_event(sch, SCX_EV_DISPATCH_KEEP_LAST, 1);
 		goto has_tasks;
@@ -3176,6 +3182,8 @@ static void process_ddsp_deferred_locals
 
 static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 {
+	struct scx_sched *sch = scx_root;
+
 	if (p->scx.flags & SCX_TASK_QUEUED) {
 		/*
 		 * Core-sched might decide to execute @p before it is
@@ -3188,7 +3196,7 @@ static void set_next_task_scx(struct rq
 	p->se.exec_start = rq_clock_task(rq);
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
-	if (SCX_HAS_OP(scx_root, running) && (p->scx.flags & SCX_TASK_QUEUED))
+	if (SCX_HAS_OP(sch, running) && (p->scx.flags & SCX_TASK_QUEUED))
 		SCX_CALL_OP_TASK(SCX_KF_REST, running, rq, p);
 
 	clr_task_runnable(p, true);
@@ -3232,6 +3240,7 @@ preempt_reason_from_class(const struct s
 
 static void switch_class(struct rq *rq, struct task_struct *next)
 {
+	struct scx_sched *sch = scx_root;
 	const struct sched_class *next_class = next->sched_class;
 
 #ifdef CONFIG_SMP
@@ -3242,7 +3251,7 @@ static void switch_class(struct rq *rq,
 	 */
 	smp_store_release(&rq->scx.pnt_seq, rq->scx.pnt_seq + 1);
 #endif
-	if (!(scx_root->ops.flags & SCX_OPS_HAS_CPU_PREEMPT))
+	if (!(sch->ops.flags & SCX_OPS_HAS_CPU_PREEMPT))
 		return;
 
 	/*
@@ -3264,7 +3273,7 @@ static void switch_class(struct rq *rq,
 	 *  next time that balance_scx() is invoked.
 	 */
 	if (!rq->scx.cpu_released) {
-		if (SCX_HAS_OP(scx_root, cpu_release)) {
+		if (SCX_HAS_OP(sch, cpu_release)) {
 			struct scx_cpu_release_args args = {
 				.reason = preempt_reason_from_class(next_class),
 				.task = next,
@@ -3279,10 +3288,11 @@ static void switch_class(struct rq *rq,
 static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
 			      struct task_struct *next)
 {
+	struct scx_sched *sch = scx_root;
 	update_curr_scx(rq);
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
-	if (SCX_HAS_OP(scx_root, stopping) && (p->scx.flags & SCX_TASK_QUEUED))
+	if (SCX_HAS_OP(sch, stopping) && (p->scx.flags & SCX_TASK_QUEUED))
 		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, true);
 
 	if (p->scx.flags & SCX_TASK_QUEUED) {
@@ -3306,7 +3316,7 @@ static void put_prev_task_scx(struct rq
 		 * which should trigger an explicit follow-up scheduling event.
 		 */
 		if (sched_class_above(&ext_sched_class, next->sched_class)) {
-			WARN_ON_ONCE(!(scx_root->ops.flags & SCX_OPS_ENQ_LAST));
+			WARN_ON_ONCE(!(sch->ops.flags & SCX_OPS_ENQ_LAST));
 			do_enqueue_task(rq, p, SCX_ENQ_LAST, -1);
 		} else {
 			do_enqueue_task(rq, p, 0, -1);
@@ -3381,10 +3391,12 @@ static struct task_struct *pick_task_scx
 		}
 
 		if (unlikely(!p->scx.slice)) {
-			if (!scx_rq_bypassing(rq) && !scx_root->warned_zero_slice) {
+			struct scx_sched *sch = scx_root;
+
+			if (!scx_rq_bypassing(rq) && !sch->warned_zero_slice) {
 				printk_deferred(KERN_WARNING "sched_ext: %s[%d] has zero slice in %s()\n",
 						p->comm, p->pid, __func__);
-				scx_root->warned_zero_slice = true;
+				sch->warned_zero_slice = true;
 			}
 			refill_task_slice_dfl(p);
 		}
@@ -3415,12 +3427,14 @@ static struct task_struct *pick_task_scx
 bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 		   bool in_fi)
 {
+	struct scx_sched *sch = scx_root;
+
 	/*
 	 * The const qualifiers are dropped from task_struct pointers when
 	 * calling ops.core_sched_before(). Accesses are controlled by the
 	 * verifier.
 	 */
-	if (SCX_HAS_OP(scx_root, core_sched_before) &&
+	if (SCX_HAS_OP(sch, core_sched_before) &&
 	    !scx_rq_bypassing(task_rq(a)))
 		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, core_sched_before, NULL,
 					      (struct task_struct *)a,
@@ -3493,6 +3507,8 @@ static void task_woken_scx(struct rq *rq
 static void set_cpus_allowed_scx(struct task_struct *p,
 				 struct affinity_context *ac)
 {
+	struct scx_sched *sch = scx_root;
+
 	set_cpus_allowed_common(p, ac);
 
 	/*
@@ -3503,13 +3519,14 @@ static void set_cpus_allowed_scx(struct
 	 * Fine-grained memory write control is enforced by BPF making the const
 	 * designation pointless. Cast it away when calling the operation.
 	 */
-	if (SCX_HAS_OP(scx_root, set_cpumask))
+	if (SCX_HAS_OP(sch, set_cpumask))
 		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, NULL,
 				 p, (struct cpumask *)p->cpus_ptr);
 }
 
 static void handle_hotplug(struct rq *rq, bool online)
 {
+	struct scx_sched *sch = scx_root;
 	int cpu = cpu_of(rq);
 
 	atomic_long_inc(&scx_hotplug_seq);
@@ -3519,15 +3536,15 @@ static void handle_hotplug(struct rq *rq
 	 * stable here. Note that we can't depend on scx_enabled() test as the
 	 * hotplug ops need to be enabled before __scx_enabled is set.
 	 */
-	if (!scx_root)
+	if (unlikely(!sch))
 		return;
 
 	if (scx_enabled())
-		scx_idle_update_selcpu_topology(&scx_root->ops);
+		scx_idle_update_selcpu_topology(&sch->ops);
 
-	if (online && SCX_HAS_OP(scx_root, cpu_online))
+	if (online && SCX_HAS_OP(sch, cpu_online))
 		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, NULL, cpu);
-	else if (!online && SCX_HAS_OP(scx_root, cpu_offline))
+	else if (!online && SCX_HAS_OP(sch, cpu_offline))
 		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, NULL, cpu);
 	else
 		scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
@@ -3621,6 +3638,8 @@ void scx_tick(struct rq *rq)
 
 static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
 {
+	struct scx_sched *sch = scx_root;
+
 	update_curr_scx(rq);
 
 	/*
@@ -3630,7 +3649,7 @@ static void task_tick_scx(struct rq *rq,
 	if (scx_rq_bypassing(rq)) {
 		curr->scx.slice = 0;
 		touch_core_sched(rq, curr);
-	} else if (SCX_HAS_OP(scx_root, tick)) {
+	} else if (SCX_HAS_OP(sch, tick)) {
 		SCX_CALL_OP_TASK(SCX_KF_REST, tick, rq, curr);
 	}
 
@@ -3698,11 +3717,12 @@ static void scx_set_task_state(struct ta
 
 static int scx_init_task(struct task_struct *p, struct task_group *tg, bool fork)
 {
+	struct scx_sched *sch = scx_root;
 	int ret;
 
 	p->scx.disallow = false;
 
-	if (SCX_HAS_OP(scx_root, init_task)) {
+	if (SCX_HAS_OP(sch, init_task)) {
 		struct scx_init_task_args args = {
 			SCX_INIT_TASK_ARGS_CGROUP(tg)
 			.fork = fork,
@@ -3749,6 +3769,7 @@ static int scx_init_task(struct task_str
 
 static void scx_enable_task(struct task_struct *p)
 {
+	struct scx_sched *sch = scx_root;
 	struct rq *rq = task_rq(p);
 	u32 weight;
 
@@ -3765,28 +3786,30 @@ static void scx_enable_task(struct task_
 
 	p->scx.weight = sched_weight_to_cgroup(weight);
 
-	if (SCX_HAS_OP(scx_root, enable))
+	if (SCX_HAS_OP(sch, enable))
 		SCX_CALL_OP_TASK(SCX_KF_REST, enable, rq, p);
 	scx_set_task_state(p, SCX_TASK_ENABLED);
 
-	if (SCX_HAS_OP(scx_root, set_weight))
+	if (SCX_HAS_OP(sch, set_weight))
 		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
 }
 
 static void scx_disable_task(struct task_struct *p)
 {
+	struct scx_sched *sch = scx_root;
 	struct rq *rq = task_rq(p);
 
 	lockdep_assert_rq_held(rq);
 	WARN_ON_ONCE(scx_get_task_state(p) != SCX_TASK_ENABLED);
 
-	if (SCX_HAS_OP(scx_root, disable))
+	if (SCX_HAS_OP(sch, disable))
 		SCX_CALL_OP_TASK(SCX_KF_REST, disable, rq, p);
 	scx_set_task_state(p, SCX_TASK_READY);
 }
 
 static void scx_exit_task(struct task_struct *p)
 {
+	struct scx_sched *sch = scx_root;
 	struct scx_exit_task_args args = {
 		.cancelled = false,
 	};
@@ -3809,7 +3832,7 @@ static void scx_exit_task(struct task_st
 		return;
 	}
 
-	if (SCX_HAS_OP(scx_root, exit_task))
+	if (SCX_HAS_OP(sch, exit_task))
 		SCX_CALL_OP_TASK(SCX_KF_REST, exit_task, task_rq(p), p, &args);
 	scx_set_task_state(p, SCX_TASK_NONE);
 }
@@ -3915,10 +3938,12 @@ void sched_ext_free(struct task_struct *
 static void reweight_task_scx(struct rq *rq, struct task_struct *p,
 			      const struct load_weight *lw)
 {
+	struct scx_sched *sch = scx_root;
+
 	lockdep_assert_rq_held(task_rq(p));
 
 	p->scx.weight = sched_weight_to_cgroup(scale_load_down(lw->weight));
-	if (SCX_HAS_OP(scx_root, set_weight))
+	if (SCX_HAS_OP(sch, set_weight))
 		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
 }
 
@@ -3928,13 +3953,15 @@ static void prio_changed_scx(struct rq *
 
 static void switching_to_scx(struct rq *rq, struct task_struct *p)
 {
+	struct scx_sched *sch = scx_root;
+
 	scx_enable_task(p);
 
 	/*
 	 * set_cpus_allowed_scx() is not called while @p is associated with a
 	 * different scheduler class. Keep the BPF scheduler up-to-date.
 	 */
-	if (SCX_HAS_OP(scx_root, set_cpumask))
+	if (SCX_HAS_OP(sch, set_cpumask))
 		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, rq,
 				 p, (struct cpumask *)p->cpus_ptr);
 }
@@ -3986,6 +4013,7 @@ static bool scx_cgroup_enabled;
 
 int scx_tg_online(struct task_group *tg)
 {
+	struct scx_sched *sch = scx_root;
 	int ret = 0;
 
 	WARN_ON_ONCE(tg->scx_flags & (SCX_TG_ONLINE | SCX_TG_INITED));
@@ -3993,7 +4021,7 @@ int scx_tg_online(struct task_group *tg)
 	percpu_down_read(&scx_cgroup_rwsem);
 
 	if (scx_cgroup_enabled) {
-		if (SCX_HAS_OP(scx_root, cgroup_init)) {
+		if (SCX_HAS_OP(sch, cgroup_init)) {
 			struct scx_cgroup_init_args args =
 				{ .weight = tg->scx_weight };
 
@@ -4014,11 +4042,13 @@ int scx_tg_online(struct task_group *tg)
 
 void scx_tg_offline(struct task_group *tg)
 {
+	struct scx_sched *sch = scx_root;
+
 	WARN_ON_ONCE(!(tg->scx_flags & SCX_TG_ONLINE));
 
 	percpu_down_read(&scx_cgroup_rwsem);
 
-	if (scx_cgroup_enabled && SCX_HAS_OP(scx_root, cgroup_exit) &&
+	if (scx_cgroup_enabled && SCX_HAS_OP(sch, cgroup_exit) &&
 	    (tg->scx_flags & SCX_TG_INITED))
 		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, NULL, tg->css.cgroup);
 	tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
@@ -4028,6 +4058,7 @@ void scx_tg_offline(struct task_group *t
 
 int scx_cgroup_can_attach(struct cgroup_taskset *tset)
 {
+	struct scx_sched *sch = scx_root;
 	struct cgroup_subsys_state *css;
 	struct task_struct *p;
 	int ret;
@@ -4052,7 +4083,7 @@ int scx_cgroup_can_attach(struct cgroup_
 		if (from == to)
 			continue;
 
-		if (SCX_HAS_OP(scx_root, cgroup_prep_move)) {
+		if (SCX_HAS_OP(sch, cgroup_prep_move)) {
 			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_prep_move, NULL,
 					      p, from, css->cgroup);
 			if (ret)
@@ -4066,7 +4097,7 @@ int scx_cgroup_can_attach(struct cgroup_
 
 err:
 	cgroup_taskset_for_each(p, css, tset) {
-		if (SCX_HAS_OP(scx_root, cgroup_cancel_move) &&
+		if (SCX_HAS_OP(sch, cgroup_cancel_move) &&
 		    p->scx.cgrp_moving_from)
 			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
 				    p, p->scx.cgrp_moving_from, css->cgroup);
@@ -4079,6 +4110,8 @@ err:
 
 void scx_cgroup_move_task(struct task_struct *p)
 {
+	struct scx_sched *sch = scx_root;
+
 	if (!scx_cgroup_enabled)
 		return;
 
@@ -4086,7 +4119,7 @@ void scx_cgroup_move_task(struct task_st
 	 * @p must have ops.cgroup_prep_move() called on it and thus
 	 * cgrp_moving_from set.
 	 */
-	if (SCX_HAS_OP(scx_root, cgroup_move) &&
+	if (SCX_HAS_OP(sch, cgroup_move) &&
 	    !WARN_ON_ONCE(!p->scx.cgrp_moving_from))
 		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, cgroup_move, NULL,
 				 p, p->scx.cgrp_moving_from, tg_cgrp(task_group(p)));
@@ -4100,6 +4133,7 @@ void scx_cgroup_finish_attach(void)
 
 void scx_cgroup_cancel_attach(struct cgroup_taskset *tset)
 {
+	struct scx_sched *sch = scx_root;
 	struct cgroup_subsys_state *css;
 	struct task_struct *p;
 
@@ -4107,7 +4141,7 @@ void scx_cgroup_cancel_attach(struct cgr
 		goto out_unlock;
 
 	cgroup_taskset_for_each(p, css, tset) {
-		if (SCX_HAS_OP(scx_root, cgroup_cancel_move) &&
+		if (SCX_HAS_OP(sch, cgroup_cancel_move) &&
 		    p->scx.cgrp_moving_from)
 			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
 				    p, p->scx.cgrp_moving_from, css->cgroup);
@@ -4119,10 +4153,12 @@ out_unlock:
 
 void scx_group_set_weight(struct task_group *tg, unsigned long weight)
 {
+	struct scx_sched *sch = scx_root;
+
 	percpu_down_read(&scx_cgroup_rwsem);
 
 	if (scx_cgroup_enabled && tg->scx_weight != weight) {
-		if (SCX_HAS_OP(scx_root, cgroup_set_weight))
+		if (SCX_HAS_OP(sch, cgroup_set_weight))
 			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_set_weight, NULL,
 				    tg_cgrp(tg), weight);
 		tg->scx_weight = weight;
@@ -4263,7 +4299,7 @@ out_unlock_rcu:
 }
 
 #ifdef CONFIG_EXT_GROUP_SCHED
-static void scx_cgroup_exit(void)
+static void scx_cgroup_exit(struct scx_sched *sch)
 {
 	struct cgroup_subsys_state *css;
 
@@ -4283,7 +4319,7 @@ static void scx_cgroup_exit(void)
 			continue;
 		tg->scx_flags &= ~SCX_TG_INITED;
 
-		if (!scx_root->ops.cgroup_exit)
+		if (!sch->ops.cgroup_exit)
 			continue;
 
 		if (WARN_ON_ONCE(!css_tryget(css)))
@@ -4298,7 +4334,7 @@ static void scx_cgroup_exit(void)
 	rcu_read_unlock();
 }
 
-static int scx_cgroup_init(void)
+static int scx_cgroup_init(struct scx_sched *sch)
 {
 	struct cgroup_subsys_state *css;
 	int ret;
@@ -4318,7 +4354,7 @@ static int scx_cgroup_init(void)
 		     (SCX_TG_ONLINE | SCX_TG_INITED)) != SCX_TG_ONLINE)
 			continue;
 
-		if (!scx_root->ops.cgroup_init) {
+		if (!sch->ops.cgroup_init) {
 			tg->scx_flags |= SCX_TG_INITED;
 			continue;
 		}
@@ -4348,8 +4384,8 @@ static int scx_cgroup_init(void)
 }
 
 #else
-static void scx_cgroup_exit(void) {}
-static int scx_cgroup_init(void) { return 0; }
+static void scx_cgroup_exit(struct scx_sched *sch) {}
+static int scx_cgroup_init(struct scx_sched *sch) { return 0; }
 #endif
 
 
@@ -4792,7 +4828,7 @@ static void scx_disable_workfn(struct kt
 	 * doesn't race against scx_exit_task().
 	 */
 	scx_cgroup_lock();
-	scx_cgroup_exit();
+	scx_cgroup_exit(sch);
 	scx_cgroup_unlock();
 
 	/*
@@ -5018,6 +5054,7 @@ static void scx_dump_task(struct seq_buf
 			  struct task_struct *p, char marker)
 {
 	static unsigned long bt[SCX_EXIT_BT_LEN];
+	struct scx_sched *sch = scx_root;
 	char dsq_id_buf[19] = "(n/a)";
 	unsigned long ops_state = atomic_long_read(&p->scx.ops_state);
 	unsigned int bt_len = 0;
@@ -5040,7 +5077,7 @@ static void scx_dump_task(struct seq_buf
 		  p->scx.dsq_vtime, p->scx.slice, p->scx.weight);
 	dump_line(s, "      cpus=%*pb", cpumask_pr_args(p->cpus_ptr));
 
-	if (SCX_HAS_OP(scx_root, dump_task)) {
+	if (SCX_HAS_OP(sch, dump_task)) {
 		ops_dump_init(s, "    ");
 		SCX_CALL_OP(SCX_KF_REST, dump_task, NULL, dctx, p);
 		ops_dump_exit();
@@ -5059,6 +5096,7 @@ static void scx_dump_state(struct scx_ex
 {
 	static DEFINE_SPINLOCK(dump_lock);
 	static const char trunc_marker[] = "\n\n~~~~ TRUNCATED ~~~~\n";
+	struct scx_sched *sch = scx_root;
 	struct scx_dump_ctx dctx = {
 		.kind = ei->kind,
 		.exit_code = ei->exit_code,
@@ -5087,7 +5125,7 @@ static void scx_dump_state(struct scx_ex
 		dump_stack_trace(&s, "  ", ei->bt, ei->bt_len);
 	}
 
-	if (SCX_HAS_OP(scx_root, dump)) {
+	if (SCX_HAS_OP(sch, dump)) {
 		ops_dump_init(&s, "");
 		SCX_CALL_OP(SCX_KF_UNLOCKED, dump, NULL, &dctx);
 		ops_dump_exit();
@@ -5110,7 +5148,7 @@ static void scx_dump_state(struct scx_ex
 		idle = list_empty(&rq->scx.runnable_list) &&
 			rq->curr->sched_class == &idle_sched_class;
 
-		if (idle && !SCX_HAS_OP(scx_root, dump_cpu))
+		if (idle && !SCX_HAS_OP(sch, dump_cpu))
 			goto next;
 
 		/*
@@ -5144,7 +5182,7 @@ static void scx_dump_state(struct scx_ex
 				  cpumask_pr_args(rq->scx.cpus_to_wait));
 
 		used = seq_buf_used(&ns);
-		if (SCX_HAS_OP(scx_root, dump_cpu)) {
+		if (SCX_HAS_OP(sch, dump_cpu)) {
 			ops_dump_init(&ns, "  ");
 			SCX_CALL_OP(SCX_KF_REST, dump_cpu, NULL, &dctx, cpu, idle);
 			ops_dump_exit();
@@ -5180,7 +5218,7 @@ static void scx_dump_state(struct scx_ex
 	dump_line(&s, "Event counters");
 	dump_line(&s, "--------------");
 
-	scx_read_events(scx_root, &events);
+	scx_read_events(sch, &events);
 	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
@@ -5505,7 +5543,7 @@ static int scx_enable(struct sched_ext_o
 	 * never sees uninitialized tasks.
 	 */
 	scx_cgroup_lock();
-	ret = scx_cgroup_init();
+	ret = scx_cgroup_init(sch);
 	if (ret)
 		goto err_disable_unlock_all;
 
@@ -6039,6 +6077,7 @@ static void kick_cpus_irq_workfn(struct
  */
 void print_scx_info(const char *log_lvl, struct task_struct *p)
 {
+	struct scx_sched *sch = scx_root;
 	enum scx_enable_state state = scx_enable_state();
 	const char *all = READ_ONCE(scx_switching_all) ? "+all" : "";
 	char runnable_at_buf[22] = "?";
@@ -6054,7 +6093,7 @@ void print_scx_info(const char *log_lvl,
 	 */
 	if (copy_from_kernel_nofault(&class, &p->sched_class, sizeof(class)) ||
 	    class != &ext_sched_class) {
-		printk("%sSched_ext: %s (%s%s)", log_lvl, scx_root->ops.name,
+		printk("%sSched_ext: %s (%s%s)", log_lvl, sch->ops.name,
 		       scx_enable_state_str[state], all);
 		return;
 	}
@@ -6066,7 +6105,7 @@ void print_scx_info(const char *log_lvl,
 
 	/* print everything onto one line to conserve console space */
 	printk("%sSched_ext: %s (%s%s), task: runnable_at=%s",
-	       log_lvl, scx_root->ops.name, scx_enable_state_str[state], all,
+	       log_lvl, sch->ops.name, scx_enable_state_str[state], all,
 	       runnable_at_buf);
 }
 
@@ -6844,7 +6883,7 @@ __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u6
 	preempt_disable();
 
 	sch = rcu_dereference_sched(scx_root);
-	if (!sch) {
+	if (unlikely(!sch)) {
 		ret = -ENODEV;
 		goto out;
 	}
@@ -6920,7 +6959,7 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(str
 	kit->dsq = NULL;
 
 	sch = rcu_dereference_check(scx_root, rcu_read_lock_bh_held());
-	if (!sch)
+	if (unlikely(!sch))
 		return -ENODEV;
 
 	if (flags & ~__SCX_DSQ_ITER_USER_FLAGS)
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -733,6 +733,7 @@ static void update_builtin_idle(int cpu,
  */
 void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
 {
+	struct scx_sched *sch = scx_root;
 	int cpu = cpu_of(rq);
 
 	lockdep_assert_rq_held(rq);
@@ -744,8 +745,7 @@ void __scx_update_idle(struct rq *rq, bo
 	 * Idle transitions are indicated by do_notify being set to true,
 	 * managed by put_prev_task_idle()/set_next_task_idle().
 	 */
-	if (SCX_HAS_OP(scx_root, update_idle) &&
-	    do_notify && !scx_rq_bypassing(rq))
+	if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
 		SCX_CALL_OP(SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
 
 	/*

