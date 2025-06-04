Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712B520E6F3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067163; cv=none; b=X0dV0aLwOQ8WCrUK051af6h6E0yJAo6EZcgqH3DF8HqUn/wDIjDOreCcPJbIfuSKXRis8hh6RboLiZR6F+K3At1K36q8VUl/cPoW+DiohQsDntAz6cFv4L7BH6dz9GxKuWlOPFgJxPKJcGfPNgoiN/b36vctyQwjARpX9WjpdTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067163; c=relaxed/simple;
	bh=c/nZGGckp6ZKne1GPTY+t47qEifWzxHNrqpvpWNeMqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pa4v3Xpe4Rsu6UMe8/B5QA/Ryj6DEtN3Pw/cXIyDt7ZfCEAfMDaVMY2CChEOIMBhZsdXEwsqZdC9EAleM46sI+WAGU0arG/c3IkmQJUrO2BRT07YEpDiJZtaDiUioiwrIIFiw7ypL7ob3vWZzv+PmgZzTofNa/b+chyL83Lh7Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0r+HKCml; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0r+HKCml"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7c5750ca8b2so41600985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749067160; x=1749671960; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1LsQOH7nnUdVDkVGgb3K2OOng/x5+9Xo0meB9pgEAk=;
        b=0r+HKCmlbfTADjkG3Q1BqF6citwwBg/pKcarTnqhEkDz8+EhM1SgM74c9RQnVCfWnS
         POG5cLEdvRcS0GvkkUUBdzBtIYnbHqlHeugrsKUxv0a3vjdnC2qLMy9f+nchqR0qtlMH
         lRkRofHYAwO63sF0ASHK0NpyG+/zDwNXf5hvTQxQjw+lmMvSAlQaJeuXJdeh1wsYZ1+o
         OMY6z+zj6hZkaHPfCdQsMiCaLqoVFNxKE9u9GSDVWJ/pTqGnq1mVwi2nVtUitAKS1adT
         Q1uf3Wj+0SHk4tjWkoxAZwFx7XUYv3tOJg5FI+O8K4oKK50cy2yCr9jYbqnOY1UvgrWE
         808w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067160; x=1749671960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1LsQOH7nnUdVDkVGgb3K2OOng/x5+9Xo0meB9pgEAk=;
        b=MCTrTZXAAWHD2s9bJ5mYMSv+Fn3QAHIyHDI+W2J2WVbqWPTRoJOv0TfgJhllm7Ctjx
         g9pl96ArM2XRjYGw6WlGRvpcFnvjgZpKuIYuhO0lmsXHS90c8tnZRRTem4eJDopYdfH8
         RR/e7lGPUpGxliQnqDSJ3I8/wviv5/C/8h9drmN7S4a2P6+ftE5dlcWHuIX8sPTHXEhJ
         35sCecYlA+fSW8dJ3pX3IHfDXRMMOlCFyZO2baNupJXpMjk8PxMzBxEd6VhDC+ZQsL1K
         u6xHKBiayQu93B3n/PMCWT+g02e8edPpDCriRUGPVwVxPyfsPKvwetBvdff/7ZPOpwJI
         0MJA==
X-Forwarded-Encrypted: i=1; AJvYcCUEnigOK6O/1BBz3QYdsrvPLTs2+53QOqT8lquPLNBJBJAy8Dexp4n8Zp1QrouhgjbpBibKmYyCVmDSz10=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu4mhcokJt0rTSmX+h3cE22x594drTrlpNI8JoGkyCmD9yoqyb
	hiWpsGY8F0coqMxM+Vlx2Z9CliVcgISDkCnLvRIrIFoBLhHBrxYTxhTQ1yQ+oc269zI7TxPhPs+
	/WZLq5ANGOQ==
X-Google-Smtp-Source: AGHT+IF+T8Lm/PUcvSU1r4qeXz1oENU3EAIttcjYxwYkBraJ6bUJip03Zp03VNSlkuZx09sn4Hea7A2lH2KR
X-Received: from qvbmy2.prod.google.com ([2002:a05:6214:2e42:b0:6fa:c315:4cb7])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:4447:b0:7cd:4dbf:3c4c
 with SMTP id af79cd13be357-7d2199b3276mr592589885a.38.1749067160249; Wed, 04
 Jun 2025 12:59:20 -0700 (PDT)
Date: Wed,  4 Jun 2025 19:58:43 +0000
In-Reply-To: <20250604195846.193159-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604195846.193159-1-zecheng@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250604195846.193159-4-zecheng@google.com>
Subject: [RFC PATCH 3/3] sched/fair: Allocate cfs_rq structs per-cpu
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

To remove the cfs_rq pointer array in task_group and improve cache
performance, allocate the cfs_rq structs (which now contain the embedded
sched_entity) using the per-cpu allocator.

This patch implements the following:

- Changes task_group->cfs_rq from struct cfs_rq ** to struct cfs_rq
__percpu *.

- Updates alloc_fair_sched_group() and free_fair_sched_group()
to use alloc_percpu() and free_percpu() respectively for the cfs_rq data
associated with a task group.

- Uses the inline accessor tg_cfs_rq(tg, cpu) with per_cpu_ptr() to
retrieve the pointer to cfs_rq for the given task group and CPU.

- Replaces direct accesses like the former tg->cfs_rq[cpu] with calls to
the new tg_cfs_rq(tg, cpu) helper.

- Handles the root_task_group: since struct rq is already a per-cpu
variable (runqueues), its embedded cfs_rq (rq->cfs) is also per-cpu.
Therefore, we assign root_task_group.cfs_rq = &runqueues.cfs.

- Cleanup the code in initializing the root task group.

This change places each CPU's cfs_rq and sched_entity in its local
per-cpu memory area.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/core.c  | 35 +++++++++++++--------------------
 kernel/sched/fair.c  | 46 +++++++++++++++++---------------------------
 kernel/sched/sched.h | 13 +++++++++----
 3 files changed, 40 insertions(+), 54 deletions(-)

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
index 2ca01587f956..c24d8f16ff54 100644
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
@@ -13336,14 +13336,7 @@ static void task_change_group_fair(struct task_struct *p)
 
 void free_fair_sched_group(struct task_group *tg)
 {
-	int i;
-
-	for_each_possible_cpu(i) {
-		if (tg->cfs_rq)
-			kfree(tg->cfs_rq[i]);
-	}
-
-	kfree(tg->cfs_rq);
+	free_percpu(tg->cfs_rq);
 }
 
 int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
@@ -13352,7 +13345,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 	struct cfs_rq *cfs_rq;
 	int i;
 
-	tg->cfs_rq = kcalloc(nr_cpu_ids, sizeof(cfs_rq), GFP_KERNEL);
+	tg->cfs_rq = alloc_percpu_gfp(struct cfs_rq, GFP_KERNEL);
 	if (!tg->cfs_rq)
 		goto err;
 
@@ -13361,8 +13354,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 	init_cfs_bandwidth(tg_cfs_bandwidth(tg), tg_cfs_bandwidth(parent));
 
 	for_each_possible_cpu(i) {
-		cfs_rq = kzalloc_node(sizeof(struct cfs_rq),
-				      GFP_KERNEL, cpu_to_node(i));
+		cfs_rq = tg_cfs_rq(tg, i);
 		if (!cfs_rq)
 			goto err;
 
@@ -13403,7 +13395,7 @@ void unregister_fair_sched_group(struct task_group *tg)
 	destroy_cfs_bandwidth(tg_cfs_bandwidth(tg));
 
 	for_each_possible_cpu(cpu) {
-		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu];
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, cpu);
 		struct sched_entity *se = tg_se(tg, cpu);
 		struct rq *rq = cpu_rq(cpu);
 
@@ -13440,8 +13432,6 @@ void init_tg_cfs_entry(struct task_group *tg, struct cfs_rq *cfs_rq,
 	cfs_rq->rq = rq;
 	init_cfs_rq_runtime(cfs_rq);
 
-	tg->cfs_rq[cpu] = cfs_rq;
-
 	/* se could be NULL for root_task_group */
 	if (!se)
 		return;
@@ -13534,7 +13524,7 @@ int sched_group_set_idle(struct task_group *tg, long idle)
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
 		struct sched_entity *se = tg_se(tg, i);
-		struct cfs_rq *grp_cfs_rq = tg->cfs_rq[i];
+		struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
 		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
 		long idle_task_delta;
 		struct rq_flags rf;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 644e19476c83..9b46b0bc9d3d 100644
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
@@ -1569,13 +1569,18 @@ static inline struct task_struct *task_of(struct sched_entity *se)
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
 	if (is_root_task_group(tg))
 		return NULL;
 
-	return &tg->cfs_rq[cpu]->se;
+	return &tg_cfs_rq(tg, cpu)->se;
 }
 
 static inline struct sched_entity *cfs_rq_se(struct cfs_rq *cfs_rq)
@@ -2158,8 +2163,8 @@ static inline void set_task_rq(struct task_struct *p, unsigned int cpu)
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

