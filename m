Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF72302CA0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403806; cv=none; b=nd4N57PqbPLNy+h3KgjAFSFM89RfOrT0uF9gBMXTSLOSr6zjfsaWPPv/jwsjU/cvYml2okuN8cCM2eXUWf227wWUNSKEgKXXXZiADgV4l6M9hoNoeE8O3aGoWPM7tIIQHACtJdckai+k0toOdAwsSQfvXxIsu3RGMWe9hMiTp5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403806; c=relaxed/simple;
	bh=Ue3SCAEdWkLPW6OAVsDp0Sxn9ZP2EGlzvmPr0joTd78=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sGBoSnM2jnf4h9IRN/G++7ZcOHXWtjC6PSUNBD/qs9n1IIHfbf4GLSIEtIw3PLEiIKLbaH3eM0OGYaPaw0UTcOoRoi9FAcXXvw2Wj46Nlv2Pgd9QrYkftOObLkhr6NE/F053wxhWU2wlDaAYHNp3FN84CWHjxQtUYtNC/W8294s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xltoAX2m; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xltoAX2m"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7d44ff55c98so729686685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751403803; x=1752008603; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWvV9IB3LWilvDOqw9mRlW4vvOFk9V2aST9191hrxn4=;
        b=xltoAX2mJEhvldsvAsZTz0pXtNlypbHKHVABeI46fni4ROFRH4c7l3CcwRmB8k/R6/
         FGRbYksWwT6klTkLShAymenW6lOw9GYmFxu0dCWs2KJLLf0lCzSWduwyW66afbnx3wvy
         q2U45MsD7H8iuyvMPhXF1kIdt/xMwHzv5xdBgnn2QVzOGdXrSqy7R48wzhuw7VLH5BX7
         K1t305tHMgAXDQy46vYRvP0mQ6EIEcldC7mt54IaiWraByLNHM/1h6xQE1nboX6W0hHa
         DLHRVtuIMkh6KtOGNx6gkrrmk8/UbfmqyExuCrRkeQk7a4F3V+gxcbLdQ3A8Mkdqzh0h
         CIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403803; x=1752008603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWvV9IB3LWilvDOqw9mRlW4vvOFk9V2aST9191hrxn4=;
        b=n+g4LNh53PgvLXtGhW803J746Fy2GCys/qA+nVQcBmexoBFo0QHUTJg9QLPE9WViYa
         NyOEe3Kqgwo3fQBXiZWJU+wKdMSeDp5pQWlLTFid+CEUpZh+F+Lpf0PB4FjXheVJLOUs
         O/WHaDaClY7QmQruDdMFOoyPDQkcNWcitZkOkpCFCQvLOdp37EWExY8PauEIeNT0K+AC
         xhoWwss4m2Wf71nyztBqv9kbNpnKPVPAXJ1Tl6cJPKyn+qCLI1dTTkXYs67LlSafAgq3
         1qsPvDOMmlU8MBpSK3n4lB0vonPGX4Ot9v/y7B1eJH0SnKQYq/62lqU5bWROJ93pwrzG
         DF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1UJNjVFZxu4ePCJxJAOc99wjoudsz0DddC7Hsw3T1W2XfO87t+LfKruGb0oeqtyE5NPXdRI041l+Xjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoE7wx8taWX0WSlBCpDuinga4Sa1+/bV5dtlq7l0weAF4M7GLL
	G/qBCXhptDXlgL2DOi1dQ7pikTcn1y0+Fpzx7d+O+ttdh03VENPwcYkaEsl1//yuSo7QDXywZPN
	j5VMuKpgZsw==
X-Google-Smtp-Source: AGHT+IEX9ow6rH8hzYurHsyQQT+iv8ojy7bt0rVKqcgaEZTQc7d9rmWg0PQKxUv4mPFOYGh4mJ7HGn9gYn1a
X-Received: from qkni19.prod.google.com ([2002:a05:620a:2493:b0:7ce:c274:8d6])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:3181:b0:7d3:b8eb:b32f
 with SMTP id af79cd13be357-7d5c478e870mr57422585a.37.1751403803365; Tue, 01
 Jul 2025 14:03:23 -0700 (PDT)
Date: Tue,  1 Jul 2025 21:02:29 +0000
In-Reply-To: <20250701210230.2985885-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250701210230.2985885-1-zecheng@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250701210230.2985885-4-zecheng@google.com>
Subject: [PATCH v3 3/3] sched/fair: Allocate both cfs_rq and sched_entity with per-cpu
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Namhyung Kim <namhyung@kernel.org>, 
	Josh Don <joshdon@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

To remove the cfs_rq pointer array in task_group, allocate the combined
cfs_rq and sched_entity using the per-cpu allocator.

This patch implements the following:

- Changes task_group->cfs_rq from struct cfs_rq ** to struct cfs_rq
__percpu *.

- Updates memory allocation in alloc_fair_sched_group() and
free_fair_sched_group() to use alloc_percpu() and free_percpu()
respectively.

- Uses the inline accessor tg_cfs_rq(tg, cpu) with per_cpu_ptr() to
retrieve the pointer to cfs_rq for the given task group and CPU.

- Replaces direct accesses tg->cfs_rq[cpu] with calls to the new
tg_cfs_rq(tg, cpu) helper.

- Handles the root_task_group: since struct rq is already a per-cpu
variable (runqueues), its embedded cfs_rq (rq->cfs) is also per-cpu.
Therefore, we assign root_task_group.cfs_rq = &runqueues.cfs.

- Cleanup the code in initializing the root task group.

This change places each CPU's cfs_rq and sched_entity in its local
per-cpu memory area to remove the per-task_group pointer arrays.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/core.c  | 35 ++++++++++----------------
 kernel/sched/fair.c  | 59 +++++++++++++++++---------------------------
 kernel/sched/sched.h | 13 +++++++---
 3 files changed, 45 insertions(+), 62 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2efa7e9590c7..377361fae8e8 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8508,7 +8508,7 @@ static struct kmem_cache *task_group_cache __ro_after_init;
 
 void __init sched_init(void)
 {
-	unsigned long ptr = 0;
+	unsigned long __maybe_unused ptr = 0;
 	int i;
 
 	/* Make sure the linker didn't screw up */
@@ -8526,33 +8526,24 @@ void __init sched_init(void)
 	wait_bit_init();
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	ptr += nr_cpu_ids * sizeof(void **);
-#endif
-#ifdef CONFIG_RT_GROUP_SCHED
-	ptr += 2 * nr_cpu_ids * sizeof(void **);
-#endif
-	if (ptr) {
-		ptr = (unsigned long)kzalloc(ptr, GFP_NOWAIT);
+	root_task_group.cfs_rq = &runqueues.cfs;
 
-#ifdef CONFIG_FAIR_GROUP_SCHED
-		root_task_group.cfs_rq = (struct cfs_rq **)ptr;
-		ptr += nr_cpu_ids * sizeof(void **);
-
-		root_task_group.shares = ROOT_TASK_GROUP_LOAD;
-		init_cfs_bandwidth(&root_task_group.cfs_bandwidth, NULL);
+	root_task_group.shares = ROOT_TASK_GROUP_LOAD;
+	init_cfs_bandwidth(&root_task_group.cfs_bandwidth, NULL);
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 #ifdef CONFIG_EXT_GROUP_SCHED
-		scx_tg_init(&root_task_group);
+	scx_tg_init(&root_task_group);
 #endif /* CONFIG_EXT_GROUP_SCHED */
 #ifdef CONFIG_RT_GROUP_SCHED
-		root_task_group.rt_se = (struct sched_rt_entity **)ptr;
-		ptr += nr_cpu_ids * sizeof(void **);
+	ptr += 2 * nr_cpu_ids * sizeof(void **);
+	ptr = (unsigned long)kzalloc(ptr, GFP_NOWAIT);
+	root_task_group.rt_se = (struct sched_rt_entity **)ptr;
+	ptr += nr_cpu_ids * sizeof(void **);
 
-		root_task_group.rt_rq = (struct rt_rq **)ptr;
-		ptr += nr_cpu_ids * sizeof(void **);
+	root_task_group.rt_rq = (struct rt_rq **)ptr;
+	ptr += nr_cpu_ids * sizeof(void **);
 
 #endif /* CONFIG_RT_GROUP_SCHED */
-	}
 
 #ifdef CONFIG_SMP
 	init_defrootdomain();
@@ -9497,7 +9488,7 @@ static int tg_set_cfs_bandwidth(struct task_group *tg, u64 period, u64 quota,
 	}
 
 	for_each_online_cpu(i) {
-		struct cfs_rq *cfs_rq = tg->cfs_rq[i];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, i);
 		struct rq *rq = cfs_rq->rq;
 
 		guard(rq_lock_irq)(rq);
@@ -9745,7 +9736,7 @@ static u64 throttled_time_self(struct task_group *tg)
 	u64 total = 0;
 
 	for_each_possible_cpu(i) {
-		total += READ_ONCE(tg->cfs_rq[i]->throttled_clock_self_time);
+		total += READ_ONCE(tg_cfs_rq(tg, i)->throttled_clock_self_time);
 	}
 
 	return total;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 244b20222eb5..37d6b00b3a3b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -329,7 +329,7 @@ static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 	 * to a tree or when we reach the top of the tree
 	 */
 	if (cfs_rq->tg->parent &&
-	    cfs_rq->tg->parent->cfs_rq[cpu]->on_list) {
+	    tg_cfs_rq(cfs_rq->tg->parent, cpu)->on_list) {
 		/*
 		 * If parent is already on the list, we add the child
 		 * just before. Thanks to circular linked property of
@@ -337,7 +337,7 @@ static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 		 * of the list that starts by parent.
 		 */
 		list_add_tail_rcu(&cfs_rq->leaf_cfs_rq_list,
-			&(cfs_rq->tg->parent->cfs_rq[cpu]->leaf_cfs_rq_list));
+			&(tg_cfs_rq(cfs_rq->tg->parent, cpu)->leaf_cfs_rq_list));
 		/*
 		 * The branch is now connected to its tree so we can
 		 * reset tmp_alone_branch to the beginning of the
@@ -4180,7 +4180,7 @@ static void __maybe_unused clear_tg_offline_cfs_rqs(struct rq *rq)
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(tg, &task_groups, list) {
-		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 		clear_tg_load_avg(cfs_rq);
 	}
@@ -5828,8 +5828,8 @@ static inline int throttled_lb_pair(struct task_group *tg,
 {
 	struct cfs_rq *src_cfs_rq, *dest_cfs_rq;
 
-	src_cfs_rq = tg->cfs_rq[src_cpu];
-	dest_cfs_rq = tg->cfs_rq[dest_cpu];
+	src_cfs_rq = tg_cfs_rq(tg, src_cpu);
+	dest_cfs_rq = tg_cfs_rq(tg, dest_cpu);
 
 	return throttled_hierarchy(src_cfs_rq) ||
 	       throttled_hierarchy(dest_cfs_rq);
@@ -5838,7 +5838,7 @@ static inline int throttled_lb_pair(struct task_group *tg,
 static int tg_unthrottle_up(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
-	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+	struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 	cfs_rq->throttle_count--;
 	if (!cfs_rq->throttle_count) {
@@ -5867,7 +5867,7 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
 static int tg_throttle_down(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
-	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+	struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 	/* group is entering throttled state, stop time */
 	if (!cfs_rq->throttle_count) {
@@ -6454,8 +6454,8 @@ static void sync_throttle(struct task_group *tg, int cpu)
 	if (!tg->parent)
 		return;
 
-	cfs_rq = tg->cfs_rq[cpu];
-	pcfs_rq = tg->parent->cfs_rq[cpu];
+	cfs_rq = tg_cfs_rq(tg, cpu);
+	pcfs_rq = tg_cfs_rq(tg->parent, cpu);
 
 	cfs_rq->throttle_count = pcfs_rq->throttle_count;
 	cfs_rq->throttled_clock_pelt = rq_clock_pelt(cpu_rq(cpu));
@@ -6640,7 +6640,7 @@ static void __maybe_unused update_runtime_enabled(struct rq *rq)
 	rcu_read_lock();
 	list_for_each_entry_rcu(tg, &task_groups, list) {
 		struct cfs_bandwidth *cfs_b = &tg->cfs_bandwidth;
-		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 		raw_spin_lock(&cfs_b->lock);
 		cfs_rq->runtime_enabled = cfs_b->quota != RUNTIME_INF;
@@ -6669,7 +6669,7 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(tg, &task_groups, list) {
-		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 		if (!cfs_rq->runtime_enabled)
 			continue;
@@ -9378,7 +9378,7 @@ static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_
 	struct cfs_rq *dst_cfs_rq;
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	dst_cfs_rq = task_group(p)->cfs_rq[dest_cpu];
+	dst_cfs_rq = tg_cfs_rq(task_group(p), dest_cpu);
 #else
 	dst_cfs_rq = &cpu_rq(dest_cpu)->cfs;
 #endif
@@ -13095,7 +13095,7 @@ static int task_is_throttled_fair(struct task_struct *p, int cpu)
 	struct cfs_rq *cfs_rq;
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	cfs_rq = task_group(p)->cfs_rq[cpu];
+	cfs_rq = tg_cfs_rq(task_group(p), cpu);
 #else
 	cfs_rq = &cpu_rq(cpu)->cfs;
 #endif
@@ -13351,42 +13351,31 @@ static void task_change_group_fair(struct task_struct *p)
 
 void free_fair_sched_group(struct task_group *tg)
 {
-	int i;
-
-	for_each_possible_cpu(i) {
-		if (tg->cfs_rq && tg->cfs_rq[i]) {
-			struct cfs_rq_with_se *combined =
-				container_of(tg->cfs_rq[i], struct cfs_rq_with_se, cfs_rq);
-			kfree(combined);
-		}
-	}
-
-	kfree(tg->cfs_rq);
+	free_percpu(tg->cfs_rq);
 }
 
 int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 {
-	struct cfs_rq_with_se *combined;
+	struct cfs_rq_with_se __percpu *combined;
 	struct sched_entity *se;
 	struct cfs_rq *cfs_rq;
 	int i;
 
-	tg->cfs_rq = kcalloc(nr_cpu_ids, sizeof(cfs_rq), GFP_KERNEL);
-	if (!tg->cfs_rq)
+	combined = alloc_percpu_gfp(struct cfs_rq_with_se, GFP_KERNEL);
+	if (!combined)
 		goto err;
 
+	tg->cfs_rq = &combined->cfs_rq;
 	tg->shares = NICE_0_LOAD;
 
 	init_cfs_bandwidth(tg_cfs_bandwidth(tg), tg_cfs_bandwidth(parent));
 
 	for_each_possible_cpu(i) {
-		combined = kzalloc_node(sizeof(struct cfs_rq_with_se),
-				      GFP_KERNEL, cpu_to_node(i));
-		if (!combined)
+		cfs_rq = tg_cfs_rq(tg, i);
+		if (!cfs_rq)
 			goto err;
 
-		cfs_rq = &combined->cfs_rq;
-		se = &combined->se;
+		se = tg_se(tg, i);
 		init_cfs_rq(cfs_rq);
 		init_tg_cfs_entry(tg, cfs_rq, se, i, tg_se(parent, i));
 		init_entity_runnable_average(se);
@@ -13423,7 +13412,7 @@ void unregister_fair_sched_group(struct task_group *tg)
 	destroy_cfs_bandwidth(tg_cfs_bandwidth(tg));
 
 	for_each_possible_cpu(cpu) {
-		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu);
 		struct sched_entity *se = tg_se(tg, cpu);
 		struct rq *rq = cpu_rq(cpu);
 
@@ -13460,8 +13449,6 @@ void init_tg_cfs_entry(struct task_group *tg, struct cfs_rq *cfs_rq,
 	cfs_rq->rq = rq;
 	init_cfs_rq_runtime(cfs_rq);
 
-	tg->cfs_rq[cpu] = cfs_rq;
-
 	/* se could be NULL for root_task_group */
 	if (!se)
 		return;
@@ -13554,7 +13541,7 @@ int sched_group_set_idle(struct task_group *tg, long idle)
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
 		struct sched_entity *se = tg_se(tg, i);
-		struct cfs_rq *grp_cfs_rq = tg->cfs_rq[i];
+		struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
 		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
 		long idle_task_delta;
 		struct rq_flags rf;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 3fdcdcdab76c..a794bec99604 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -438,7 +438,7 @@ struct task_group {
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	/* runqueue "owned" by this group on each CPU */
-	struct cfs_rq		**cfs_rq;
+	struct cfs_rq __percpu	*cfs_rq;
 	unsigned long		shares;
 #ifdef	CONFIG_SMP
 	/*
@@ -1592,6 +1592,11 @@ static inline struct task_struct *task_of(struct sched_entity *se)
 	WARN_ON_ONCE(!entity_is_task(se));
 	return container_of(se, struct task_struct, se);
 }
+/* Access a specific CPU's cfs_rq from a task group */
+static inline struct cfs_rq *tg_cfs_rq(struct task_group *tg, int cpu)
+{
+	return per_cpu_ptr(tg->cfs_rq, cpu);
+}
 
 static inline struct sched_entity *tg_se(struct task_group *tg, int cpu)
 {
@@ -1599,7 +1604,7 @@ static inline struct sched_entity *tg_se(struct task_group *tg, int cpu)
 		return NULL;
 
 	struct cfs_rq_with_se *combined =
-		container_of(tg->cfs_rq[cpu], struct cfs_rq_with_se, cfs_rq);
+		container_of(tg_cfs_rq(tg, cpu), struct cfs_rq_with_se, cfs_rq);
 	return &combined->se;
 }
 
@@ -2185,8 +2190,8 @@ static inline void set_task_rq(struct task_struct *p, unsigned int cpu)
 #endif
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	set_task_rq_fair(&p->se, p->se.cfs_rq, tg->cfs_rq[cpu]);
-	p->se.cfs_rq = tg->cfs_rq[cpu];
+	set_task_rq_fair(&p->se, p->se.cfs_rq, tg_cfs_rq(tg, cpu));
+	p->se.cfs_rq = tg_cfs_rq(tg, cpu);
 	p->se.parent = tg_se(tg, cpu);
 	p->se.depth = p->se.parent ? p->se.parent->depth + 1 : 0;
 #endif
-- 
2.50.0

