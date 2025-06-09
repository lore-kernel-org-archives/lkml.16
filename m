Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD78220687
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749497928; cv=none; b=et47EAEIfoc3Im2rt7sjSVHkhp23fOuRzjknAhgWmUz7HLRgM/qJaQlvex+3U+pLv6LxX3t1gwq5sUn4PG61iK1OPftmxEG+p/fhHT6gpNBu1W5BOzP3UhSN/RISjSbbmPGG27e+y7VtuIuHl3HCnMXgnpCcq/NEnerWevEGeM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749497928; c=relaxed/simple;
	bh=U+Kw6x8qmp3LshTvMCt9FBP7tAj+XoKmLWJu4PMkBGY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JL89KdnQmfVieCac6qKUbJ26Eg31NUm7ZdA7h1Jbw5XLenhMCvDJpfjJaxFi14J46si3oVyOlnO6ycz1DgAgL/pwUmNrXS2GcVayh+/XKPBfW1eO272g8ypO+Cdhakzdk6M2L318PkmrBu8pk78rEVzBIYOM/+TuIuXTLlhKKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4c7aZN4o; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4c7aZN4o"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7d2107d6b30so610197885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749497925; x=1750102725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6r6LyQxv7yHS0Evlv6qjLlVV3mfViVsaSLBe6y6ldGM=;
        b=4c7aZN4ogD5ESIQr3cN9lrRnG7FZh+TMf2b3ErFx9uYt+3k9odzf3lYssZjGtS7a5Q
         MndyHpyYHTOupzseTXTnYIzBDep6XCiFOj8yfzyo3q661DJcz3fwvs5VvWuhpBYGYwi8
         i/RD59Rbv9q/xUNuFiRx/CxlFhrGIwlesuY8wOmruhp5EzW9ej9Z6vlCOue/3ST0E3a/
         BLJudG2OnME7LKATpHVpW8/UKfI9ZnDS7yAjOKwJTPoMmDtK2+CUCEFu+CxU7jXaR+XL
         ozrjgyp3NqCK5mFNBG9PmdB8zDJqpeH9brqrNwjvcYZIyVWO7IR19YafxdZpxLG1V8c5
         JUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749497925; x=1750102725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6r6LyQxv7yHS0Evlv6qjLlVV3mfViVsaSLBe6y6ldGM=;
        b=RfOClopFi4cHLa1Fn6ITz942kppg/Kzr1Ws/LZWdD4qdU/E2yPAZ9necw5sF9TdxC2
         Zbs7I5cAPeEBImPqmsk22aDgoGhRRAtft47bFnlckHjI+aYZ5WPYuCih0hdCIMwktooy
         3GfIFRLm3mOIJk2bPySiEypUwy/Bm5CFBXD7EVMAfTBFHsGQ6JKfCkYu8uWILxtNb6hv
         HVufvfDt92Pq6ZE6/Hdil/fSH+FT9oglBmiqxyrw+L+zylT5nKsKU/wC+KfS2pdVlRfy
         ySANwaoejCiw6KVJEFst7yGm0wBuTPGtLzBW4sfGpsoOGkNnE4veN4W/BwvQRwtc2Mve
         qggg==
X-Forwarded-Encrypted: i=1; AJvYcCXqH4h9yKEiHz2tPZjNnvp2tLb2qSLdiEc2zvsArrrGVjlxk43/ogG9GaOMg1ZKL6avE56+68FAXN0HxrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YynmEsQodeh6uUeCfqOYVi1uDhSMRBJMvYnRcBV5oXWRDfWrPzC
	MljmRxvwepR7kXHZIJVFogyBTO7d6kNDEOKTjcjGLeTzcQZGCxnRjhNvO9zrgIFYeu96SXvY7uD
	5ONCaqNFl7w==
X-Google-Smtp-Source: AGHT+IGHlDBbgwB0RAV7hNhoHEw5p79bM22KwWMV7dzoKxjsX3k/liUaIdntZWo8uMKplhJVr8UhJ2PeKK+2
X-Received: from qkas22.prod.google.com ([2002:a05:620a:ab16:b0:7ce:c1d9:a92a])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:29d4:b0:7d3:9109:4472
 with SMTP id af79cd13be357-7d391094763mr990689485a.37.1749497925008; Mon, 09
 Jun 2025 12:38:45 -0700 (PDT)
Date: Mon,  9 Jun 2025 19:38:32 +0000
In-Reply-To: <20250609193834.2556866-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250609193834.2556866-1-zecheng@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609193834.2556866-3-zecheng@google.com>
Subject: [RFC PATCH v2 2/3] sched/fair: Remove task_group->se pointer array
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that struct sched_entity is co-located with struct cfs_rq for
non-root task groups, the task_group->se pointer array is redundant. The
associated sched_entity can be loaded directly from the cfs_rq.

This patch performs the access conversion with the helpers:

- is_root_task_group(tg): checks if a task group is the root task group.
It compares the task group's address with the global root_task_group
variable.

- tg_se(tg, cpu): retrieves the cfs_rq and returns the address of the
co-located se. This function checks if tg is the root task group to
ensure behaving the same of previous tg->se[cpu]. Replaces all accesses
that use the tg->se[cpu] pointer array with calls to the new tg_se(tg,
cpu) accessor.

- cfs_rq_se(cfs_rq): simplifies access paths like cfs_rq->tg->se[...] to
use the co-located sched_entity. This function also checks if tg is the
root task group to ensure same behavior.

Since tg_se is not in very hot code paths, and the branch is a register
comparison with an immediate value (`&root_task_group`), the performance
impact is expected to be negligible.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/core.c  |  7 ++-----
 kernel/sched/debug.c |  2 +-
 kernel/sched/fair.c  | 27 ++++++++++-----------------
 kernel/sched/sched.h | 29 ++++++++++++++++++++++++-----
 4 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba0..8598492854fc 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8544,7 +8544,7 @@ void __init sched_init(void)
 	wait_bit_init();
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	ptr += 2 * nr_cpu_ids * sizeof(void **);
+	ptr += nr_cpu_ids * sizeof(void **);
 #endif
 #ifdef CONFIG_RT_GROUP_SCHED
 	ptr += 2 * nr_cpu_ids * sizeof(void **);
@@ -8553,9 +8553,6 @@ void __init sched_init(void)
 		ptr = (unsigned long)kzalloc(ptr, GFP_NOWAIT);
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-		root_task_group.se = (struct sched_entity **)ptr;
-		ptr += nr_cpu_ids * sizeof(void **);
-
 		root_task_group.cfs_rq = (struct cfs_rq **)ptr;
 		ptr += nr_cpu_ids * sizeof(void **);
 
@@ -9743,7 +9740,7 @@ static int cpu_cfs_stat_show(struct seq_file *sf, void *v)
 		int i;
 
 		for_each_possible_cpu(i) {
-			stats = __schedstats_from_se(tg->se[i]);
+			stats = __schedstats_from_se(tg_se(tg, i));
 			ws += schedstat_val(stats->wait_sum);
 		}
 
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 56ae54e0ce6a..385076d5741c 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -653,7 +653,7 @@ void dirty_sched_domain_sysctl(int cpu)
 #ifdef CONFIG_FAIR_GROUP_SCHED
 static void print_cfs_group_stats(struct seq_file *m, int cpu, struct task_group *tg)
 {
-	struct sched_entity *se = tg->se[cpu];
+	struct sched_entity *se = tg_se(tg, cpu);
 
 #define P(F)		SEQ_printf(m, "  .%-30s: %lld\n",	#F, (long long)F)
 #define P_SCHEDSTAT(F)	SEQ_printf(m, "  .%-30s: %lld\n",	\
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cd090ceec633..b099b593f364 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5907,7 +5907,7 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
 	if (!dequeue)
 		return false;  /* Throttle no longer required. */
 
-	se = cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
+	se = cfs_rq_se(cfs_rq);
 
 	/* freeze hierarchy runnable averages while throttled */
 	rcu_read_lock();
@@ -5992,7 +5992,7 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 	long queued_delta, runnable_delta, idle_delta;
 	long rq_h_nr_queued = rq->cfs.h_nr_queued;
 
-	se = cfs_rq->tg->se[cpu_of(rq)];
+	se = cfs_rq_se(cfs_rq);
 
 	cfs_rq->throttled = 0;
 
@@ -9787,7 +9787,6 @@ static bool __update_blocked_fair(struct rq *rq, bool *done)
 {
 	struct cfs_rq *cfs_rq, *pos;
 	bool decayed = false;
-	int cpu = cpu_of(rq);
 
 	/*
 	 * Iterates the task_group tree in a bottom up fashion, see
@@ -9807,7 +9806,7 @@ static bool __update_blocked_fair(struct rq *rq, bool *done)
 		}
 
 		/* Propagate pending load changes to the parent, if any: */
-		se = cfs_rq->tg->se[cpu];
+		se = cfs_rq_se(cfs_rq);
 		if (se && !skip_blocked_update(se))
 			update_load_avg(cfs_rq_of(se), se, UPDATE_TG);
 
@@ -9833,8 +9832,7 @@ static bool __update_blocked_fair(struct rq *rq, bool *done)
  */
 static void update_cfs_rq_h_load(struct cfs_rq *cfs_rq)
 {
-	struct rq *rq = rq_of(cfs_rq);
-	struct sched_entity *se = cfs_rq->tg->se[cpu_of(rq)];
+	struct sched_entity *se = cfs_rq_se(cfs_rq);
 	unsigned long now = jiffies;
 	unsigned long load;
 
@@ -13349,7 +13347,6 @@ void free_fair_sched_group(struct task_group *tg)
 	}
 
 	kfree(tg->cfs_rq);
-	kfree(tg->se);
 }
 
 int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
@@ -13362,9 +13359,6 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 	tg->cfs_rq = kcalloc(nr_cpu_ids, sizeof(cfs_rq), GFP_KERNEL);
 	if (!tg->cfs_rq)
 		goto err;
-	tg->se = kcalloc(nr_cpu_ids, sizeof(se), GFP_KERNEL);
-	if (!tg->se)
-		goto err;
 
 	tg->shares = NICE_0_LOAD;
 
@@ -13379,7 +13373,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 		cfs_rq = &combined->cfs_rq;
 		se = &combined->se;
 		init_cfs_rq(cfs_rq);
-		init_tg_cfs_entry(tg, cfs_rq, se, i, parent->se[i]);
+		init_tg_cfs_entry(tg, cfs_rq, se, i, tg_se(parent, i));
 		init_entity_runnable_average(se);
 	}
 
@@ -13398,7 +13392,7 @@ void online_fair_sched_group(struct task_group *tg)
 
 	for_each_possible_cpu(i) {
 		rq = cpu_rq(i);
-		se = tg->se[i];
+		se = tg_se(tg, i);
 		rq_lock_irq(rq, &rf);
 		update_rq_clock(rq);
 		attach_entity_cfs_rq(se);
@@ -13415,7 +13409,7 @@ void unregister_fair_sched_group(struct task_group *tg)
 
 	for_each_possible_cpu(cpu) {
 		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu];
-		struct sched_entity *se = tg->se[cpu];
+		struct sched_entity *se = tg_se(tg, cpu);
 		struct rq *rq = cpu_rq(cpu);
 
 		if (se) {
@@ -13452,7 +13446,6 @@ void init_tg_cfs_entry(struct task_group *tg, struct cfs_rq *cfs_rq,
 	init_cfs_rq_runtime(cfs_rq);
 
 	tg->cfs_rq[cpu] = cfs_rq;
-	tg->se[cpu] = se;
 
 	/* se could be NULL for root_task_group */
 	if (!se)
@@ -13483,7 +13476,7 @@ static int __sched_group_set_shares(struct task_group *tg, unsigned long shares)
 	/*
 	 * We can't change the weight of the root cgroup.
 	 */
-	if (!tg->se[0])
+	if (is_root_task_group(tg))
 		return -EINVAL;
 
 	shares = clamp(shares, scale_load(MIN_SHARES), scale_load(MAX_SHARES));
@@ -13494,7 +13487,7 @@ static int __sched_group_set_shares(struct task_group *tg, unsigned long shares)
 	tg->shares = shares;
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
-		struct sched_entity *se = tg->se[i];
+		struct sched_entity *se = tg_se(tg, i);
 		struct rq_flags rf;
 
 		/* Propagate contribution to hierarchy */
@@ -13545,7 +13538,7 @@ int sched_group_set_idle(struct task_group *tg, long idle)
 
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
-		struct sched_entity *se = tg->se[i];
+		struct sched_entity *se = tg_se(tg, i);
 		struct cfs_rq *grp_cfs_rq = tg->cfs_rq[i];
 		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
 		long idle_task_delta;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index af23917194fb..08e17746ea01 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -437,8 +437,6 @@ struct task_group {
 #endif
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	/* schedulable entities of this group on each CPU */
-	struct sched_entity	**se;
 	/* runqueue "owned" by this group on each CPU */
 	struct cfs_rq		**cfs_rq;
 	unsigned long		shares;
@@ -901,7 +899,8 @@ struct dl_rq {
 };
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-
+/* Check whether a task group is root tg */
+#define is_root_task_group(tg) ((tg) == &root_task_group)
 /* An entity is a task if it doesn't "own" a runqueue */
 #define entity_is_task(se)	(!se->my_q)
 
@@ -1575,6 +1574,26 @@ static inline struct task_struct *task_of(struct sched_entity *se)
 	return container_of(se, struct task_struct, se);
 }
 
+static inline struct sched_entity *tg_se(struct task_group *tg, int cpu)
+{
+	if (is_root_task_group(tg))
+		return NULL;
+
+	struct cfs_rq_with_se *combined =
+		container_of(tg->cfs_rq[cpu], struct cfs_rq_with_se, cfs_rq);
+	return &combined->se;
+}
+
+static inline struct sched_entity *cfs_rq_se(struct cfs_rq *cfs_rq)
+{
+	if (is_root_task_group(cfs_rq->tg))
+		return NULL;
+
+	struct cfs_rq_with_se *combined =
+		container_of(cfs_rq, struct cfs_rq_with_se, cfs_rq);
+	return &combined->se;
+}
+
 static inline struct cfs_rq *task_cfs_rq(struct task_struct *p)
 {
 	return p->se.cfs_rq;
@@ -2149,8 +2168,8 @@ static inline void set_task_rq(struct task_struct *p, unsigned int cpu)
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	set_task_rq_fair(&p->se, p->se.cfs_rq, tg->cfs_rq[cpu]);
 	p->se.cfs_rq = tg->cfs_rq[cpu];
-	p->se.parent = tg->se[cpu];
-	p->se.depth = tg->se[cpu] ? tg->se[cpu]->depth + 1 : 0;
+	p->se.parent = tg_se(tg, cpu);
+	p->se.depth = p->se.parent ? p->se.parent->depth + 1 : 0;
 #endif
 
 #ifdef CONFIG_RT_GROUP_SCHED
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

