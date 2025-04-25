Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266F82288F4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618337; cv=none; b=EoEmX7X5+sLewh++L80fEIxj/yhOTKDnrYaF/v2ken/WA7lLAIP62cMIdYg9J26F5+rubX6yzKSCjFpT81hOHO3QFnGKFDdOhCQ/tcgxblQ1pNdx5NoO0skwVeK1YS31jMMU/apEDqY4NeHi9iC3wo5pT02OzxDZs7L2d5kw4Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618337; c=relaxed/simple;
	bh=i35djFKE7u7cXMY/Zz7C7JTSM9N6tp3NpptpqLhcxeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8+8/RM8cIKcn9Kr8PlghJivEXRDU8BD7FdIdRy/D9E1lTGxoIWM5oX5wOXRWy/h+qXiDEUX9c+VGQJozTzJixr2Ixb6kFbStTbMEWPputMJW1lgQBrEYLaT6CaE1I91Ymy+WRan+438yHnO94S+OjrVc8/ZHJT76WzkRcnbzQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iC8I7MhT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iC8I7MhT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E6FC4CEE9;
	Fri, 25 Apr 2025 21:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618335;
	bh=i35djFKE7u7cXMY/Zz7C7JTSM9N6tp3NpptpqLhcxeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iC8I7MhTMrk3Oh0CqvFXsMooLbHJs9zVxbiByFdlkwdlydo2sF3OU4Udm9uTygXh5
	 jf5vtbjJTiskCXfNgUUKKbX/v+OGtfkKpZxtxG+C4pZprVzfs30lt69QY2K3jXzGCY
	 gJgVEW5qaF4iJ5VNfco1m3dK5/N9O+fLujR6H6xYNtaMp8SvdozulJMXac+d8EVFEH
	 LcbJ0RJZShmprlKVKDIKDAXXuJt6hZZ3Assk79ZkZhXi1ciVTwUigX9A6Xp9NB5iye
	 897LQAxwA1G5ABirfqhGlaJzeysy5M32jFFWFuw2lEb9bddpZvCGXCLfU/PIt+D7SV
	 krCc+7dFbgAYQ==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 10/12] sched_ext: Move event_stats_cpu into scx_sched
Date: Fri, 25 Apr 2025 11:58:25 -1000
Message-ID: <20250425215840.2334972-11-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425215840.2334972-1-tj@kernel.org>
References: <20250425215840.2334972-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event counters are going to become per scheduler instance. Move
event_stats_cpu into scx_sched.

- [__]scx_add_event() are updated to take @sch. While at it, add missing
  parentheses around @cnt expansions.

- scx_read_events() is updated to take @sch.

- scx_bpf_events() accesses scx_root under RCU read lock.

v2: - Replace stale scx_bpf_get_event_stat() reference in a comment with
      scx_bpf_events().

    - Trivial goto label rename.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 100 ++++++++++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 42 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 885cd71a847e..154c354856fc 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -838,6 +838,13 @@ struct scx_sched {
 	struct rhashtable	dsq_hash;
 	struct scx_dispatch_q	**global_dsqs;
 
+	/*
+	 * The event counters are in a per-CPU variable to minimize the
+	 * accounting overhead. A system-wide view on the event counter is
+	 * constructed when requested by scx_bpf_events().
+	 */
+	struct scx_event_stats __percpu *event_stats_cpu;
+
 	bool			warned_zero_slice;
 
 	atomic_t		exit_kind;
@@ -1599,34 +1606,29 @@ static struct task_struct *scx_task_iter_next_locked(struct scx_task_iter *iter)
 	return p;
 }
 
-/*
- * The event counter is organized by a per-CPU variable to minimize the
- * accounting overhead without synchronization. A system-wide view on the
- * event counter is constructed when requested by scx_bpf_get_event_stat().
- */
-static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
-
 /**
  * scx_add_event - Increase an event counter for 'name' by 'cnt'
+ * @sch: scx_sched to account events for
  * @name: an event name defined in struct scx_event_stats
  * @cnt: the number of the event occured
  *
  * This can be used when preemption is not disabled.
  */
-#define scx_add_event(name, cnt) do {						\
-	this_cpu_add(event_stats_cpu.name, cnt);				\
-	trace_sched_ext_event(#name, cnt);					\
+#define scx_add_event(sch, name, cnt) do {					\
+	this_cpu_add((sch)->event_stats_cpu->name, (cnt));			\
+	trace_sched_ext_event(#name, (cnt));					\
 } while(0)
 
 /**
  * __scx_add_event - Increase an event counter for 'name' by 'cnt'
+ * @sch: scx_sched to account events for
  * @name: an event name defined in struct scx_event_stats
  * @cnt: the number of the event occured
  *
  * This should be used only when preemption is disabled.
  */
-#define __scx_add_event(name, cnt) do {						\
-	__this_cpu_add(event_stats_cpu.name, cnt);				\
+#define __scx_add_event(sch, name, cnt) do {					\
+	__this_cpu_add((sch)->event_stats_cpu->name, (cnt));			\
 	trace_sched_ext_event(#name, cnt);					\
 } while(0)
 
@@ -1651,7 +1653,8 @@ static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
 } while (0)
 
 
-static void scx_read_events(struct scx_event_stats *events);
+static void scx_read_events(struct scx_sched *sch,
+			    struct scx_event_stats *events);
 
 static enum scx_enable_state scx_enable_state(void)
 {
@@ -1877,7 +1880,7 @@ static void dsq_mod_nr(struct scx_dispatch_q *dsq, s32 delta)
 static void refill_task_slice_dfl(struct task_struct *p)
 {
 	p->scx.slice = SCX_SLICE_DFL;
-	__scx_add_event(SCX_EV_REFILL_SLICE_DFL, 1);
+	__scx_add_event(scx_root, SCX_EV_REFILL_SLICE_DFL, 1);
 }
 
 static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
@@ -2206,7 +2209,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 		goto local;
 
 	if (scx_rq_bypassing(rq)) {
-		__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
+		__scx_add_event(sch, SCX_EV_BYPASS_DISPATCH, 1);
 		goto global;
 	}
 
@@ -2216,14 +2219,14 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 	/* see %SCX_OPS_ENQ_EXITING */
 	if (!(scx_root->ops.flags & SCX_OPS_ENQ_EXITING) &&
 	    unlikely(p->flags & PF_EXITING)) {
-		__scx_add_event(SCX_EV_ENQ_SKIP_EXITING, 1);
+		__scx_add_event(sch, SCX_EV_ENQ_SKIP_EXITING, 1);
 		goto local;
 	}
 
 	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
 	if (!(scx_root->ops.flags & SCX_OPS_ENQ_MIGRATION_DISABLED) &&
 	    is_migration_disabled(p)) {
-		__scx_add_event(SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
+		__scx_add_event(sch, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
 		goto local;
 	}
 
@@ -2346,7 +2349,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 
 	if ((enq_flags & SCX_ENQ_CPU_SELECTED) &&
 	    unlikely(cpu_of(rq) != p->scx.selected_cpu))
-		__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);
+		__scx_add_event(scx_root, SCX_EV_SELECT_CPU_FALLBACK, 1);
 }
 
 static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
@@ -2574,7 +2577,8 @@ static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
 
 	if (!scx_rq_online(rq)) {
 		if (enforce)
-			__scx_add_event(SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
+			__scx_add_event(scx_root,
+					SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
 		return false;
 	}
 
@@ -3096,7 +3100,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	if (prev_on_rq &&
 	    (!(scx_root->ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
 		rq->scx.flags |= SCX_RQ_BAL_KEEP;
-		__scx_add_event(SCX_EV_DISPATCH_KEEP_LAST, 1);
+		__scx_add_event(sch, SCX_EV_DISPATCH_KEEP_LAST, 1);
 		goto has_tasks;
 	}
 	rq->scx.flags &= ~SCX_RQ_IN_BALANCE;
@@ -3427,6 +3431,7 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 
 static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flags)
 {
+	struct scx_sched *sch = scx_root;
 	bool rq_bypass;
 
 	/*
@@ -3443,7 +3448,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		return prev_cpu;
 
 	rq_bypass = scx_rq_bypassing(task_rq(p));
-	if (likely(SCX_HAS_OP(scx_root, select_cpu)) && !rq_bypass) {
+	if (likely(SCX_HAS_OP(sch, select_cpu)) && !rq_bypass) {
 		s32 cpu;
 		struct task_struct **ddsp_taskp;
 
@@ -3472,7 +3477,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		p->scx.selected_cpu = cpu;
 
 		if (rq_bypass)
-			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
+			__scx_add_event(sch, SCX_EV_BYPASS_DISPATCH, 1);
 		return cpu;
 	}
 }
@@ -4413,6 +4418,8 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
 	struct scx_dispatch_q *dsq;
 	int node;
 
+	free_percpu(sch->event_stats_cpu);
+
 	for_each_node_state(node, N_POSSIBLE)
 		kfree(sch->global_dsqs[node]);
 	kfree(sch->global_dsqs);
@@ -4455,10 +4462,11 @@ SCX_ATTR(ops);
 static ssize_t scx_attr_events_show(struct kobject *kobj,
 				    struct kobj_attribute *ka, char *buf)
 {
+	struct scx_sched *sch = container_of(kobj, struct scx_sched, kobj);
 	struct scx_event_stats events;
 	int at = 0;
 
-	scx_read_events(&events);
+	scx_read_events(sch, &events);
 	at += scx_attr_event_show(buf, at, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_KEEP_LAST);
@@ -4591,25 +4599,29 @@ static void scx_bypass(bool bypass)
 {
 	static DEFINE_RAW_SPINLOCK(bypass_lock);
 	static unsigned long bypass_timestamp;
-
-	int cpu;
+	struct scx_sched *sch;
 	unsigned long flags;
+	int cpu;
 
 	raw_spin_lock_irqsave(&bypass_lock, flags);
+	sch = rcu_dereference_bh(scx_root);
+
 	if (bypass) {
 		scx_bypass_depth++;
 		WARN_ON_ONCE(scx_bypass_depth <= 0);
 		if (scx_bypass_depth != 1)
 			goto unlock;
 		bypass_timestamp = ktime_get_ns();
-		scx_add_event(SCX_EV_BYPASS_ACTIVATE, 1);
+		if (sch)
+			scx_add_event(sch, SCX_EV_BYPASS_ACTIVATE, 1);
 	} else {
 		scx_bypass_depth--;
 		WARN_ON_ONCE(scx_bypass_depth < 0);
 		if (scx_bypass_depth != 0)
 			goto unlock;
-		scx_add_event(SCX_EV_BYPASS_DURATION,
-			      ktime_get_ns() - bypass_timestamp);
+		if (sch)
+			scx_add_event(sch, SCX_EV_BYPASS_DURATION,
+				      ktime_get_ns() - bypass_timestamp);
 	}
 
 	atomic_inc(&scx_breather_depth);
@@ -5182,7 +5194,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	dump_line(&s, "Event counters");
 	dump_line(&s, "--------------");
 
-	scx_read_events(&events);
+	scx_read_events(scx_root, &events);
 	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
@@ -5290,6 +5302,10 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
 		sch->global_dsqs[node] = dsq;
 	}
 
+	sch->event_stats_cpu = alloc_percpu(struct scx_event_stats);
+	if (!sch->event_stats_cpu)
+		goto err_free_gdsqs;
+
 	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
 	sch->ops = *ops;
 	ops->priv = sch;
@@ -5297,10 +5313,12 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
 	sch->kobj.kset = scx_kset;
 	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
 	if (ret < 0)
-		goto err_free_gdsqs;
+		goto err_free_event_stats;
 
 	return sch;
 
+err_free_event_stats:
+	free_percpu(sch->event_stats_cpu);
 err_free_gdsqs:
 	for_each_node_state(node, N_POSSIBLE)
 		kfree(sch->global_dsqs[node]);
@@ -5376,15 +5394,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	mutex_lock(&scx_enable_mutex);
 
-	/*
-	 * Clear event counters so a new scx scheduler gets
-	 * fresh event counter values.
-	 */
-	for_each_possible_cpu(cpu) {
-		struct scx_event_stats *e = per_cpu_ptr(&event_stats_cpu, cpu);
-		memset(e, 0, sizeof(*e));
-	}
-
 	if (!scx_helper) {
 		WRITE_ONCE(scx_helper, scx_create_rt_helper("sched_ext_helper"));
 		if (!scx_helper) {
@@ -7405,7 +7414,7 @@ __bpf_kfunc u64 scx_bpf_now(void)
 	return clock;
 }
 
-static void scx_read_events(struct scx_event_stats *events)
+static void scx_read_events(struct scx_sched *sch, struct scx_event_stats *events)
 {
 	struct scx_event_stats *e_cpu;
 	int cpu;
@@ -7413,7 +7422,7 @@ static void scx_read_events(struct scx_event_stats *events)
 	/* Aggregate per-CPU event counters into @events. */
 	memset(events, 0, sizeof(*events));
 	for_each_possible_cpu(cpu) {
-		e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
+		e_cpu = per_cpu_ptr(sch->event_stats_cpu, cpu);
 		scx_agg_event(events, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
 		scx_agg_event(events, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(events, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
@@ -7434,9 +7443,16 @@ static void scx_read_events(struct scx_event_stats *events)
 __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 				size_t events__sz)
 {
+	struct scx_sched *sch;
 	struct scx_event_stats e_sys;
 
-	scx_read_events(&e_sys);
+	rcu_read_lock();
+	sch = rcu_dereference(scx_root);
+	if (sch)
+		scx_read_events(sch, &e_sys);
+	else
+		memset(&e_sys, 0, sizeof(e_sys));
+	rcu_read_unlock();
 
 	/*
 	 * We cannot entirely trust a BPF-provided size since a BPF program
-- 
2.49.0

