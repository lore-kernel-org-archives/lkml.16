Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B6C265611
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451958; cv=none; b=eN/iMHL1TwJwll30ngj/jzdLhNGD5hpYmytJQ/pV4/fothPYoR/chiJns+Ily9jQt7rzoRSsKJeBwLcdl49co2HZbhTGgb57m6RffGhFNefvlqDVf00y1N2sdJ76g5GHodlXhbSuXU+sIDZB20GSWpqy+yLtEjzhtkEpoF6gJQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451958; c=relaxed/simple;
	bh=c6pLvWYXNpbWXV6kUxB4zJ45M21PcftzhSZ+kWhwDks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bekHnx/s/f8VIMgnNqazjX4NMUoP5bxW85MiYbnit4fHeXohLB13fDUGIj8g2Yn0KidsDif+8/HIWoOekHAqBZdZ3YtK3DQ/KOkhasuMxHF6BhHTOYttMeUQY3onDSPE3L6rWA3OAUg89WMVCUHAzOKpKmVNVgCqaQblyIPWxgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQXlgV+5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQXlgV+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FF9C4AF09;
	Wed, 23 Apr 2025 23:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451958;
	bh=c6pLvWYXNpbWXV6kUxB4zJ45M21PcftzhSZ+kWhwDks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HQXlgV+5RXBjga33b7H/hUj9Y2llZhiz9BeZtTXvu7P48g0bBdT9wLcDtvcca1ZTS
	 XwZTQGvAxT+fqW22ug2KCYrcnf95v2asUj+hbhAubiM7yV9yDTotBnr6TamkAVaJko
	 jLJwbGvhrqoXbn1Y0HsR94w8sXdr6mVTDoB/bGsB/VdxoQPDLS9O992XC07zFjrHeD
	 bB9DHR3TC6hCGvxtC5rYKkL2TfpsGzZAaV+45lw390uo6D8VTdIXJ2TZH2KjEGP8jk
	 +4DGMUG9x8aqHzy4PLUvw4KjZdwY7UmfNKd2/lCcC/AIO7AJ2NMhweMC+wGpjgo7/1
	 ppU8bCpTl6ySg==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 10/12] sched_ext: Move event_stats_cpu into scx_sched
Date: Wed, 23 Apr 2025 13:44:48 -1000
Message-ID: <20250423234542.1890867-11-tj@kernel.org>
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

The event counters are going to become per scheduler instance. Move
event_stats_cpu into scx_sched.

- [__]scx_add_event() are updated to take @sch. While at it, add missing
  parentheses around @cnt expansions.

- scx_read_events() is updated to take @sch.

- scx_bpf_events() accesses scx_root under RCU read lock.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 100 ++++++++++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 42 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 4d2866db8cbe..75c91b58430c 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -835,6 +835,13 @@ struct scx_sched {
 	struct rhashtable	dsq_hash;
 	struct scx_dispatch_q	**global_dsqs;
 
+	/*
+	 * The event counters are in a per-CPU variable to minimize the
+	 * accounting overhead. A system-wide view on the event counter is
+	 * constructed when requested by scx_bpf_get_event_stat().
+	 */
+	struct scx_event_stats __percpu *event_stats_cpu;
+
 	bool			warned_zero_slice;
 
 	atomic_t		exit_kind;
@@ -1596,34 +1603,29 @@ static struct task_struct *scx_task_iter_next_locked(struct scx_task_iter *iter)
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
 
@@ -1648,7 +1650,8 @@ static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
 } while (0)
 
 
-static void scx_read_events(struct scx_event_stats *events);
+static void scx_read_events(struct scx_sched *sch,
+			    struct scx_event_stats *events);
 
 static enum scx_enable_state scx_enable_state(void)
 {
@@ -1874,7 +1877,7 @@ static void dsq_mod_nr(struct scx_dispatch_q *dsq, s32 delta)
 static void refill_task_slice_dfl(struct task_struct *p)
 {
 	p->scx.slice = SCX_SLICE_DFL;
-	__scx_add_event(SCX_EV_REFILL_SLICE_DFL, 1);
+	__scx_add_event(scx_root, SCX_EV_REFILL_SLICE_DFL, 1);
 }
 
 static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
@@ -2203,7 +2206,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 		goto local;
 
 	if (scx_rq_bypassing(rq)) {
-		__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
+		__scx_add_event(sch, SCX_EV_BYPASS_DISPATCH, 1);
 		goto global;
 	}
 
@@ -2213,14 +2216,14 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
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
 
@@ -2343,7 +2346,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 
 	if ((enq_flags & SCX_ENQ_CPU_SELECTED) &&
 	    unlikely(cpu_of(rq) != p->scx.selected_cpu))
-		__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);
+		__scx_add_event(scx_root, SCX_EV_SELECT_CPU_FALLBACK, 1);
 }
 
 static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
@@ -2571,7 +2574,8 @@ static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
 
 	if (!scx_rq_online(rq)) {
 		if (enforce)
-			__scx_add_event(SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
+			__scx_add_event(scx_root,
+					SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
 		return false;
 	}
 
@@ -3093,7 +3097,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	if (prev_on_rq &&
 	    (!(scx_root->ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
 		rq->scx.flags |= SCX_RQ_BAL_KEEP;
-		__scx_add_event(SCX_EV_DISPATCH_KEEP_LAST, 1);
+		__scx_add_event(sch, SCX_EV_DISPATCH_KEEP_LAST, 1);
 		goto has_tasks;
 	}
 	rq->scx.flags &= ~SCX_RQ_IN_BALANCE;
@@ -3424,6 +3428,7 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 
 static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flags)
 {
+	struct scx_sched *sch = scx_root;
 	bool rq_bypass;
 
 	/*
@@ -3440,7 +3445,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		return prev_cpu;
 
 	rq_bypass = scx_rq_bypassing(task_rq(p));
-	if (likely(SCX_HAS_OP(scx_root, select_cpu)) && !rq_bypass) {
+	if (likely(SCX_HAS_OP(sch, select_cpu)) && !rq_bypass) {
 		s32 cpu;
 		struct task_struct **ddsp_taskp;
 
@@ -3469,7 +3474,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		p->scx.selected_cpu = cpu;
 
 		if (rq_bypass)
-			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
+			__scx_add_event(sch, SCX_EV_BYPASS_DISPATCH, 1);
 		return cpu;
 	}
 }
@@ -4410,6 +4415,8 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
 	struct scx_dispatch_q *dsq;
 	int node;
 
+	free_percpu(sch->event_stats_cpu);
+
 	for_each_node_state(node, N_POSSIBLE)
 		kfree(sch->global_dsqs[node]);
 	kfree(sch->global_dsqs);
@@ -4452,10 +4459,11 @@ SCX_ATTR(ops);
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
@@ -4588,25 +4596,29 @@ static void scx_bypass(bool bypass)
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
@@ -5179,7 +5191,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	dump_line(&s, "Event counters");
 	dump_line(&s, "--------------");
 
-	scx_read_events(&events);
+	scx_read_events(scx_root, &events);
 	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
@@ -5287,16 +5299,22 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
 		sch->global_dsqs[node] = dsq;
 	}
 
+	sch->event_stats_cpu = alloc_percpu(struct scx_event_stats);
+	if (!sch->event_stats_cpu)
+		goto err_free_gdsqs;
+
 	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
 	sch->ops = *ops;
 
 	sch->kobj.kset = scx_kset;
 	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
 	if (ret < 0)
-		goto err_free_gdsqs;
+		goto err_event_stats;
 
 	return sch;
 
+err_event_stats:
+	free_percpu(sch->event_stats_cpu);
 err_free_gdsqs:
 	for_each_node_state(node, N_POSSIBLE)
 		kfree(sch->global_dsqs[node]);
@@ -5372,15 +5390,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
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
@@ -7401,7 +7410,7 @@ __bpf_kfunc u64 scx_bpf_now(void)
 	return clock;
 }
 
-static void scx_read_events(struct scx_event_stats *events)
+static void scx_read_events(struct scx_sched *sch, struct scx_event_stats *events)
 {
 	struct scx_event_stats *e_cpu;
 	int cpu;
@@ -7409,7 +7418,7 @@ static void scx_read_events(struct scx_event_stats *events)
 	/* Aggregate per-CPU event counters into @events. */
 	memset(events, 0, sizeof(*events));
 	for_each_possible_cpu(cpu) {
-		e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
+		e_cpu = per_cpu_ptr(sch->event_stats_cpu, cpu);
 		scx_agg_event(events, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
 		scx_agg_event(events, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(events, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
@@ -7430,9 +7439,16 @@ static void scx_read_events(struct scx_event_stats *events)
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

