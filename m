Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848D521FF32
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749497930; cv=none; b=Ys7CS12a5Xhgi0WElIZELzXKUDH6AzN2GzZUIewNyCYjQE/d+GKnq9ix+2J3GE0TLzYGYwrpodyZZI1ogwRV+ZOCHDJYN7m5ANyl/QUKzEBud8Pxwj0uNJNcU2srJtGLJ7XwbBi+tv+w7y+IlfpnwJrtIKhcmo/v0BU/gzh5GJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749497930; c=relaxed/simple;
	bh=XT+xOfxp+zk7aYzY1PgCkIwDnRk94iFwzLmud4f/pz8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q0OsnC+7MRdbAzWvBAwlqehnelJaAGUovXFAxtD92sKDh5Jgd8Xathm4x26e9KbtH4wsKtJ/ECZoGaDbBcqW100PehzUH8/dX+QuEQ2EdQPjywYSpgtW+L74qiqxBmQqg30E+Lai/wE0bBmeB1wZ7ElSHe0HfKUPjoV1m6F1bs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RqGz4HbU; arc=none smtp.client-ip=209.85.219.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RqGz4HbU"
Received: by mail-qv1-f73.google.com with SMTP id 6a1803df08f44-6fae0df0b35so77688896d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749497927; x=1750102727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Og2ihHkaCSEHzMEHGiD5gGPxuZp1iaPyPdhon+l+rWU=;
        b=RqGz4HbUXSZxs/T+pYMTQAmxLI6QKj5uQpSZfhuC8eWPfsHEgHfYcU2vZFAvtbesuR
         Z8Kw8Fh6u5CstQujczSCX0+uekX2owa4y/c58p1pGapqBE6HN7TubD5WlOrkfCsp3NOj
         z4zalgQ2c9QUMD1UTnz6ZH3i2pKK+gscVwAQM1jXn6SBuoZZG7b2o+UyvA01ogFZUARy
         49x/g2xCKblRGbyr/dEUUxWUeXTfa9N73rIL3HBsq99QMkSQ3sI1sb0shy5O8RvYZ/HO
         spfsTHDtAqjU9XYvhDhqnMbXHlSn49wbqCKZuhIc2H1cZb+Qi9aJDZjVmrDk5TB1s5dT
         1Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749497927; x=1750102727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Og2ihHkaCSEHzMEHGiD5gGPxuZp1iaPyPdhon+l+rWU=;
        b=ftp7piBDt0n/hudtNA1Tq9ojQs8JgIFhAKfOcErsx1NK4FlXS1t0iVKu0gCCL8EDbd
         YvNscxIFZsnAm6V11KuvDC428PNnmsh9LWsTQc4yuMpX0EgNOkUPVKGWJ4fVtLpwO9w9
         7awQoBKcRNDaLHsMof48xn48b83LEuiHBVd8ByzngH6TVCjbPX1XCBdnX2zO6d5K/6xd
         ndLlJ+4fx19hXu4xwhdwg4V3J/aHlzAYYRrmJVy7ofRZzM+bAYugSqozXFbYPBbqk8Gs
         uRvJSIUm84odWfLhbd+i+OUqRFPEdRx1U+R0iU3dkyPEo+1PeHgiTTZkLPsV41/40SuZ
         /mjg==
X-Forwarded-Encrypted: i=1; AJvYcCXITHTOrBNIfm133R6lPUXcezPaAowXyXh2a89LpgI/4rNmUXqnWVVA0on/t1S2BmY9w66wdW/90g+zSGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+3EpZx/5rSW+RVAxjXkX84UzyG56lxCmZWETk6HD3Fs0rrt8c
	Xt/xMD85QklrW7RwI/YOnb9AcX7Yx64H8uyBABQM37KKfu2BxHqjf5TcVnpevi2UOdxrKMvhRZM
	+XftL7hJUWg==
X-Google-Smtp-Source: AGHT+IEGSTVOFL9QM3WE1NqlEm6D4m2SmCAAfF27vZROsTZ4xzZ05Cch4xPHBnFxrrgb9EQmU2pB5Jr7xO33
X-Received: from qvbop6.prod.google.com ([2002:a05:6214:4586:b0:6fa:ed93:152c])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:ad4:5bc8:0:b0:6fa:d976:197e
 with SMTP id 6a1803df08f44-6fb08f87e67mr249140906d6.33.1749497927679; Mon, 09
 Jun 2025 12:38:47 -0700 (PDT)
Date: Mon,  9 Jun 2025 19:38:33 +0000
In-Reply-To: <20250609193834.2556866-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250609193834.2556866-1-zecheng@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609193834.2556866-4-zecheng@google.com>
Subject: [RFC PATCH v2 3/3] sched/fair: Allocate the combined cfs_rq/se struct per-cpu
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
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
per-cpu memory area.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/core.c  | 35 ++++++++++----------------
 kernel/sched/fair.c  | 59 +++++++++++++++++---------------------------
 kernel/sched/sched.h | 13 +++++++---
 3 files changed, 45 insertions(+), 62 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8598492854fc..60b9872e4b01 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8526,7 +8526,7 @@ static struct kmem_cache *task_group_cache __ro_after_init;
 
 void __init sched_init(void)
 {
-	unsigned long ptr = 0;
+	unsigned long __maybe_unused ptr = 0;
 	int i;
 
 	/* Make sure the linker didn't screw up */
@@ -8544,33 +8544,24 @@ void __init sched_init(void)
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
-		root_task_group.scx_weight = CGROUP_WEIGHT_DFL;
+	root_task_group.scx_weight = CGROUP_WEIGHT_DFL;
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
@@ -9511,7 +9502,7 @@ static int tg_set_cfs_bandwidth(struct task_group *tg, u64 period, u64 quota,
 	}
 
 	for_each_online_cpu(i) {
-		struct cfs_rq *cfs_rq = tg->cfs_rq[i];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, i);
 		struct rq *rq = cfs_rq->rq;
 
 		guard(rq_lock_irq)(rq);
@@ -9759,7 +9750,7 @@ static u64 throttled_time_self(struct task_group *tg)
 	u64 total = 0;
 
 	for_each_possible_cpu(i) {
-		total += READ_ONCE(tg->cfs_rq[i]->throttled_clock_self_time);
+		total += READ_ONCE(tg_cfs_rq(tg, i)->throttled_clock_self_time);
 	}
 
 	return total;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b099b593f364..8c13bc1bbe08 100644
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
@@ -4168,7 +4168,7 @@ static void __maybe_unused clear_tg_offline_cfs_rqs(struct rq *rq)
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(tg, &task_groups, list) {
-		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 		clear_tg_load_avg(cfs_rq);
 	}
@@ -5823,8 +5823,8 @@ static inline int throttled_lb_pair(struct task_group *tg,
 {
 	struct cfs_rq *src_cfs_rq, *dest_cfs_rq;
 
-	src_cfs_rq = tg->cfs_rq[src_cpu];
-	dest_cfs_rq = tg->cfs_rq[dest_cpu];
+	src_cfs_rq = tg_cfs_rq(tg, src_cpu);
+	dest_cfs_rq = tg_cfs_rq(tg, dest_cpu);
 
 	return throttled_hierarchy(src_cfs_rq) ||
 	       throttled_hierarchy(dest_cfs_rq);
@@ -5833,7 +5833,7 @@ static inline int throttled_lb_pair(struct task_group *tg,
 static int tg_unthrottle_up(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
-	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+	struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 	cfs_rq->throttle_count--;
 	if (!cfs_rq->throttle_count) {
@@ -5862,7 +5862,7 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
 static int tg_throttle_down(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
-	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+	struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 	/* group is entering throttled state, stop time */
 	if (!cfs_rq->throttle_count) {
@@ -6449,8 +6449,8 @@ static void sync_throttle(struct task_group *tg, int cpu)
 	if (!tg->parent)
 		return;
 
-	cfs_rq = tg->cfs_rq[cpu];
-	pcfs_rq = tg->parent->cfs_rq[cpu];
+	cfs_rq = tg_cfs_rq(tg, cpu);
+	pcfs_rq = tg_cfs_rq(tg->parent, cpu);
 
 	cfs_rq->throttle_count = pcfs_rq->throttle_count;
 	cfs_rq->throttled_clock_pelt = rq_clock_pelt(cpu_rq(cpu));
@@ -6635,7 +6635,7 @@ static void __maybe_unused update_runtime_enabled(struct rq *rq)
 	rcu_read_lock();
 	list_for_each_entry_rcu(tg, &task_groups, list) {
 		struct cfs_bandwidth *cfs_b = &tg->cfs_bandwidth;
-		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 		raw_spin_lock(&cfs_b->lock);
 		cfs_rq->runtime_enabled = cfs_b->quota != RUNTIME_INF;
@@ -6664,7 +6664,7 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(tg, &task_groups, list) {
-		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu_of(rq));
 
 		if (!cfs_rq->runtime_enabled)
 			continue;
@@ -9364,7 +9364,7 @@ static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_
 	struct cfs_rq *dst_cfs_rq;
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	dst_cfs_rq = task_group(p)->cfs_rq[dest_cpu];
+	dst_cfs_rq = tg_cfs_rq(task_group(p), dest_cpu);
 #else
 	dst_cfs_rq = &cpu_rq(dest_cpu)->cfs;
 #endif
@@ -13080,7 +13080,7 @@ static int task_is_throttled_fair(struct task_struct *p, int cpu)
 	struct cfs_rq *cfs_rq;
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	cfs_rq = task_group(p)->cfs_rq[cpu];
+	cfs_rq = tg_cfs_rq(task_group(p), cpu);
 #else
 	cfs_rq = &cpu_rq(cpu)->cfs;
 #endif
@@ -13336,42 +13336,31 @@ static void task_change_group_fair(struct task_struct *p)
 
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
@@ -13408,7 +13397,7 @@ void unregister_fair_sched_group(struct task_group *tg)
 	destroy_cfs_bandwidth(tg_cfs_bandwidth(tg));
 
 	for_each_possible_cpu(cpu) {
-		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu);
 		struct sched_entity *se = tg_se(tg, cpu);
 		struct rq *rq = cpu_rq(cpu);
 
@@ -13445,8 +13434,6 @@ void init_tg_cfs_entry(struct task_group *tg, struct cfs_rq *cfs_rq,
 	cfs_rq->rq = rq;
 	init_cfs_rq_runtime(cfs_rq);
 
-	tg->cfs_rq[cpu] = cfs_rq;
-
 	/* se could be NULL for root_task_group */
 	if (!se)
 		return;
@@ -13539,7 +13526,7 @@ int sched_group_set_idle(struct task_group *tg, long idle)
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
 		struct sched_entity *se = tg_se(tg, i);
-		struct cfs_rq *grp_cfs_rq = tg->cfs_rq[i];
+		struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
 		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
 		long idle_task_delta;
 		struct rq_flags rf;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 08e17746ea01..a04d20fc9ff2 100644
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
@@ -1573,6 +1573,11 @@ static inline struct task_struct *task_of(struct sched_entity *se)
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
@@ -1580,7 +1585,7 @@ static inline struct sched_entity *tg_se(struct task_group *tg, int cpu)
 		return NULL;
 
 	struct cfs_rq_with_se *combined =
-		container_of(tg->cfs_rq[cpu], struct cfs_rq_with_se, cfs_rq);
+		container_of(tg_cfs_rq(tg, cpu), struct cfs_rq_with_se, cfs_rq);
 	return &combined->se;
 }
 
@@ -2166,8 +2171,8 @@ static inline void set_task_rq(struct task_struct *p, unsigned int cpu)
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
2.50.0.rc0.604.gd4ff7b7c86-goog

