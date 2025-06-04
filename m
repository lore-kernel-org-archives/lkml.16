Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD82920E03C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067161; cv=none; b=KXIv8qsOKXNvZNelqq+WA4VuiB8ElYOxlbzMOCaKwlyOWeSy6GodIajFlIhv339t2IQf7tn4EAGedg5dcS/njXKyGStS2bzb8+77fKbSNf7PXe892T+QgjI2CYctiumOz53p4slvqmMzlB3cEUCnT987n3oC84ij1UVu7Mk3zsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067161; c=relaxed/simple;
	bh=2t5xI/r8YaZBaRR2ISnIAM7jtJeOC1IcuXA6QDOgn9M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZbSD3OO4Otp96jPpfFREaAts8uxOwfnPRaGb7/1Wt5VyXcoPfOjrSybjovNDQXPMAUdjdTrSVfkXV21akieWfEKt/z3d54u4E4D3S9hPlFsgc7e2oFitlMvNmOOlil3PBUAOyyP4wNcu1c/PuwRGvsX7tfmbV0hycRZMBmk3AeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RVuFC88R; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RVuFC88R"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7caef20a527so61540985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 12:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749067156; x=1749671956; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f78ZscsKSpFWV6dTx9y/j3qK5rp5OV9Rq4/XVxh/80I=;
        b=RVuFC88RXAJbp+dAwF+aMXXExfK2cFSscr6StlFHPZJBcTRmn83RCUv9tyP0or7GgU
         FyPXH2tAz+biNsYnUKp2K3BTxOefyC8RfhpdihsqvHisON5eyHCNGb5ssuumtp/+T6XM
         pURbE33JwNQYu0/3scNmJI8o6L6DNNxQmZT+OwRqY2GPna1WMyFW6pBrhZcY4w25SE2r
         CcrHOujKn/5jrmQyEBR4MSUjO84iAKa8UJAthxN5Z9jEaqAcZqgJqu+Keh0SnWmfUV7S
         btdMywTUpSDutQNNxLOdm63WqoPfE/HDora3KUFEnWBx23onlQxCVF5dZQsTNB6d0Bkl
         q8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067156; x=1749671956;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f78ZscsKSpFWV6dTx9y/j3qK5rp5OV9Rq4/XVxh/80I=;
        b=wYovm3wjFYoeNOw6xNhqrDLgORycyawVSViem2tIWLutOHMG4hWps6PO7zpX9iBVL9
         KMW9FbUTf/HehqGKuIY2yZjdFEgJk8iZimknE/+CWqSJSFuubl9PVjzTCoyQNQ6EU3wG
         2kklvdlaOd1rTjiAZAe/74Mm4ezu4kUkVAAI0jeYIK0t6owpGD4jvfQ5QTNF8qAxfnG/
         /1DEac7MJulMMf8wVpny5HWESzBD9eBw8HxXWVuAGUzbYBvP9KyL9lLF6UU951ADpMW7
         bKtbWVEJi+TjWXNs5y9EUZrKNIjzTbJZsz9sgKYsyNvS5/40pV1kiuioKBCg2BWYJMth
         HF1g==
X-Forwarded-Encrypted: i=1; AJvYcCURx4wN59CLZVaDIEceQV/TO0+70NMl+qUUNlgcKv++fq4A2HozGlNlGJfTYskM8X6c8oJbo+2gDIO7MDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH2+2JA7WnoLikuezQUc1ZgAK5YoOh3qXXU6Zq9iXFHbFiGgsf
	ag2lXj4Np3/w1zUkl0KwYTiTKkHI2Cox1oe61vVE49uOdNMCr3H48mY3T1cXbteEICM9Bx5aPIY
	kjOEnGorMvQ==
X-Google-Smtp-Source: AGHT+IFr3L/gUo2bR8ALKh0dNSXaLNajS3pPxoM+DNqZ2wmbqixEYCL0TA2jjTQOA0C97KZEe7Hb1MRrcQ+o
X-Received: from qvbng3.prod.google.com ([2002:a05:6214:3bc3:b0:6fb:52:fe2e])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:ad4:5f85:0:b0:6fa:aaf1:7abb
 with SMTP id 6a1803df08f44-6faf704bd1cmr52611676d6.40.1749067156532; Wed, 04
 Jun 2025 12:59:16 -0700 (PDT)
Date: Wed,  4 Jun 2025 19:58:42 +0000
In-Reply-To: <20250604195846.193159-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604195846.193159-1-zecheng@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250604195846.193159-3-zecheng@google.com>
Subject: [RFC PATCH 2/3] sched/fair: Remove task_group->se pointer
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

Following the embedding of sched_entity into cfs_rq, the task_group->se
pointer array is now redundant. All accesses to sched_entity should go
via cfs_rq.

This patch performs the access conversion:

- Adds a macro is_root_task_group(tg) as to check if a task group is the
root task group. This helper compares the task group's address with the
global root_task_group variable.

- Adds a helper tg_se(tg, cpu) which retrieves the cfs_rq and returns
the address of the embedded se. This function checks if tg is the
root task group to ensure behaving the same of previous tg->se[cpu].
Replaces all accesses that use the tg->se[cpu] pointer array with calls
to the new tg_se(tg, cpu) accessor.

- Adds a helper cfs_rq_se(cfs_rq) to change access paths like
cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))] to use the direct embedded
cfs_rq->se. This function also checks if tg is the root task group to
ensure same behavior.

- Removes the se field (struct sched_entity **se) from struct
task_group.

Since tg_se is not in very hot code paths, and the branch is a register
comparison with an immediate value (`&root_task_group`), it is expected
to have a low-performance impact.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/core.c  |  7 ++-----
 kernel/sched/debug.c |  2 +-
 kernel/sched/fair.c  | 27 ++++++++++-----------------
 kernel/sched/sched.h | 25 ++++++++++++++++++++-----
 4 files changed, 33 insertions(+), 28 deletions(-)

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
index c2af9896eef4..2ca01587f956 100644
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
 
@@ -13346,7 +13344,6 @@ void free_fair_sched_group(struct task_group *tg)
 	}
 
 	kfree(tg->cfs_rq);
-	kfree(tg->se);
 }
 
 int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
@@ -13358,9 +13355,6 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 	tg->cfs_rq = kcalloc(nr_cpu_ids, sizeof(cfs_rq), GFP_KERNEL);
 	if (!tg->cfs_rq)
 		goto err;
-	tg->se = kcalloc(nr_cpu_ids, sizeof(se), GFP_KERNEL);
-	if (!tg->se)
-		goto err;
 
 	tg->shares = NICE_0_LOAD;
 
@@ -13374,7 +13368,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 
 		se = &cfs_rq->se;
 		init_cfs_rq(cfs_rq);
-		init_tg_cfs_entry(tg, cfs_rq, se, i, parent->se[i]);
+		init_tg_cfs_entry(tg, cfs_rq, se, i, tg_se(parent, i));
 		init_entity_runnable_average(se);
 	}
 
@@ -13393,7 +13387,7 @@ void online_fair_sched_group(struct task_group *tg)
 
 	for_each_possible_cpu(i) {
 		rq = cpu_rq(i);
-		se = tg->se[i];
+		se = tg_se(tg, i);
 		rq_lock_irq(rq, &rf);
 		update_rq_clock(rq);
 		attach_entity_cfs_rq(se);
@@ -13410,7 +13404,7 @@ void unregister_fair_sched_group(struct task_group *tg)
 
 	for_each_possible_cpu(cpu) {
 		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu];
-		struct sched_entity *se = tg->se[cpu];
+		struct sched_entity *se = tg_se(tg, cpu);
 		struct rq *rq = cpu_rq(cpu);
 
 		if (se) {
@@ -13447,7 +13441,6 @@ void init_tg_cfs_entry(struct task_group *tg, struct cfs_rq *cfs_rq,
 	init_cfs_rq_runtime(cfs_rq);
 
 	tg->cfs_rq[cpu] = cfs_rq;
-	tg->se[cpu] = se;
 
 	/* se could be NULL for root_task_group */
 	if (!se)
@@ -13478,7 +13471,7 @@ static int __sched_group_set_shares(struct task_group *tg, unsigned long shares)
 	/*
 	 * We can't change the weight of the root cgroup.
 	 */
-	if (!tg->se[0])
+	if (is_root_task_group(tg))
 		return -EINVAL;
 
 	shares = clamp(shares, scale_load(MIN_SHARES), scale_load(MAX_SHARES));
@@ -13489,7 +13482,7 @@ static int __sched_group_set_shares(struct task_group *tg, unsigned long shares)
 	tg->shares = shares;
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
-		struct sched_entity *se = tg->se[i];
+		struct sched_entity *se = tg_se(tg, i);
 		struct rq_flags rf;
 
 		/* Propagate contribution to hierarchy */
@@ -13540,7 +13533,7 @@ int sched_group_set_idle(struct task_group *tg, long idle)
 
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
-		struct sched_entity *se = tg->se[i];
+		struct sched_entity *se = tg_se(tg, i);
 		struct cfs_rq *grp_cfs_rq = tg->cfs_rq[i];
 		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
 		long idle_task_delta;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6e26b7d59c13..644e19476c83 100644
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
@@ -897,7 +895,8 @@ struct dl_rq {
 };
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-
+/* Check whether a task group is root tg */
+#define is_root_task_group(tg) ((tg) == &root_task_group)
 /* An entity is a task if it doesn't "own" a runqueue */
 #define entity_is_task(se)	(!se->my_q)
 
@@ -1571,6 +1570,22 @@ static inline struct task_struct *task_of(struct sched_entity *se)
 	return container_of(se, struct task_struct, se);
 }
 
+static inline struct sched_entity *tg_se(struct task_group *tg, int cpu)
+{
+	if (is_root_task_group(tg))
+		return NULL;
+
+	return &tg->cfs_rq[cpu]->se;
+}
+
+static inline struct sched_entity *cfs_rq_se(struct cfs_rq *cfs_rq)
+{
+	if (is_root_task_group(cfs_rq->tg))
+		return NULL;
+
+	return &cfs_rq->se;
+}
+
 static inline struct cfs_rq *task_cfs_rq(struct task_struct *p)
 {
 	return p->se.cfs_rq;
@@ -2145,8 +2160,8 @@ static inline void set_task_rq(struct task_struct *p, unsigned int cpu)
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
2.50.0

