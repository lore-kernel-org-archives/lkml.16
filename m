Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F7302073
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403804; cv=none; b=h/y4BkieTtcmjfRA6/QR9TlWQbO8UU6IyXSAbfzBthjyDhr7amYJWiqI3QJdM+KlRwbd9pTYGJCznPYJ2QGV5XA4+tl1wq+cMvslOsfHH9QyDTMitC+04ttlNeWIc18bh4ziW4C9GUXwq49r68sH7/v16tkGHsDAxMlWPPDXbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403804; c=relaxed/simple;
	bh=iMdEmbqqWv/mctVDH0cm5IBO7GWi/Jx0pS5fSB9u014=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iIX4WR62pxXvZkKrpRsF+jciFqLovUkBta7hsTLKlJpZm08nVfLkLFv6RcpfQO90VKPWMOJwW21Zxgn7PKjYaCUd+eCERljnft/hu+5GRZawoPcl5nARGEHZc3WMYLBAtf+QQ6jsIhZ2dmwOFWIixW46I+AqNcJnD6xGQgtLm+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hg2hnucQ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hg2hnucQ"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-7151c64e0a2so50150397b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751403801; x=1752008601; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tD4uncLzktAbG/AuX+h8OA+SvR06kudvrM8EhJ99BOQ=;
        b=hg2hnucQIoglRy/0A0viCq5cDu3CLiceSogzB4MS2ALstOC+QgTfD5UGwOU5uqGeHt
         5WpTESkEqnFj5+Xp+jynb1jhigLQ/ZeXHnbV3CYxeoL3W8Pyy3j7vJawsJfpeg5rEc9l
         ZWalfMZUjpF3cKc3tRv7PwaeGFIa9NrVIXFDCcT+ioK/4W1JV8MROOrnhEKy8k4BrTEB
         5X2t1jlmN1LOLg+c9S99ZCctaQT7gth97Emym3fZaUKx/xjn7tvrtxmlr8Xzj+lPKDtL
         4AkvKqH8I2qJAeYXP2KCDDlFUQrzrB4rHqz8fObp5kTUdMx75DY9SSq+r5wwx+qY4CiQ
         JtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403801; x=1752008601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tD4uncLzktAbG/AuX+h8OA+SvR06kudvrM8EhJ99BOQ=;
        b=gJEuDvxeSFtD2Rc3neU33ulLV8tpRHuy9Ybw7YlzbRgqBTLk8Ihv20kH85QIgDTEQL
         T1y9hQfYuYCcKJtcJvv6YI96asFelO4F8qjU9z1XYqV4gGg6df3XZyvn6eSvfYKNRa3/
         D/t1iAKIKZw6agSLKxpHIfVDppF3Gekplz5pcpi4iDBtlPj3sTKpwkWfbScp/3cUQaBC
         1etVUWk/9VocObFGmRkfdLe5wKLlvGqjD5msczhBBlV9ZRTQt7mJqtArpKPSUMKVmyNi
         EFJm/G6MxfLSTJVsveZrxy9SK2E/WUwARXLk6Xh5InizkjrqWkPANQA1jztE/hJ/MKUD
         U2yw==
X-Forwarded-Encrypted: i=1; AJvYcCXF4UkvAqFjGnJ3qVm5MYGs1yJqQgvFHNSP4HfUjyePYMaAkFnJqBe2zTeKpRR4SwoSUx1ILJcLFmKYxBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkAJ+axqCM8gR2iC2mJVryki2TF1TqAYo5YV2yMN1LiVqiBUde
	F0Di0ncNE8DefCFGJOMFRe19pp/F5FyakU67whScGS5EU6VKcJMSvBeOzrDcVJxj9+HO2FT75DC
	s26MTt2olmA==
X-Google-Smtp-Source: AGHT+IHjJGLOCr68mOyM3hy66j1Fm1HZYpf7uSn2yYGyAhQySZ7Q7LZGH3caQE/gw7TaZATbcSkCTPW01KeX
X-Received: from ybbed6.prod.google.com ([2002:a05:6902:2806:b0:e82:3cde:855f])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6902:1b89:b0:e87:a485:b426
 with SMTP id 3f1490d57ef6-e897e140effmr527758276.4.1751403801505; Tue, 01 Jul
 2025 14:03:21 -0700 (PDT)
Date: Tue,  1 Jul 2025 21:02:28 +0000
In-Reply-To: <20250701210230.2985885-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250701210230.2985885-1-zecheng@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250701210230.2985885-3-zecheng@google.com>
Subject: [PATCH v3 2/3] sched/fair: Remove task_group->se pointer array
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
index 8988d38d46a3..2efa7e9590c7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8526,7 +8526,7 @@ void __init sched_init(void)
 	wait_bit_init();
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	ptr += 2 * nr_cpu_ids * sizeof(void **);
+	ptr += nr_cpu_ids * sizeof(void **);
 #endif
 #ifdef CONFIG_RT_GROUP_SCHED
 	ptr += 2 * nr_cpu_ids * sizeof(void **);
@@ -8535,9 +8535,6 @@ void __init sched_init(void)
 		ptr = (unsigned long)kzalloc(ptr, GFP_NOWAIT);
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-		root_task_group.se = (struct sched_entity **)ptr;
-		ptr += nr_cpu_ids * sizeof(void **);
-
 		root_task_group.cfs_rq = (struct cfs_rq **)ptr;
 		ptr += nr_cpu_ids * sizeof(void **);
 
@@ -9729,7 +9726,7 @@ static int cpu_cfs_stat_show(struct seq_file *sf, void *v)
 		int i;
 
 		for_each_possible_cpu(i) {
-			stats = __schedstats_from_se(tg->se[i]);
+			stats = __schedstats_from_se(tg_se(tg, i));
 			ws += schedstat_val(stats->wait_sum);
 		}
 
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9d71baf08075..c2868367e17e 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -657,7 +657,7 @@ void dirty_sched_domain_sysctl(int cpu)
 #ifdef CONFIG_FAIR_GROUP_SCHED
 static void print_cfs_group_stats(struct seq_file *m, int cpu, struct task_group *tg)
 {
-	struct sched_entity *se = tg->se[cpu];
+	struct sched_entity *se = tg_se(tg, cpu);
 
 #define P(F)		SEQ_printf(m, "  .%-30s: %lld\n",	#F, (long long)F)
 #define P_SCHEDSTAT(F)	SEQ_printf(m, "  .%-30s: %lld\n",	\
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3a1b55b74203..244b20222eb5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5912,7 +5912,7 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
 	if (!dequeue)
 		return false;  /* Throttle no longer required. */
 
-	se = cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
+	se = cfs_rq_se(cfs_rq);
 
 	/* freeze hierarchy runnable averages while throttled */
 	rcu_read_lock();
@@ -5997,7 +5997,7 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 	long queued_delta, runnable_delta, idle_delta;
 	long rq_h_nr_queued = rq->cfs.h_nr_queued;
 
-	se = cfs_rq->tg->se[cpu_of(rq)];
+	se = cfs_rq_se(cfs_rq);
 
 	cfs_rq->throttled = 0;
 
@@ -9801,7 +9801,6 @@ static bool __update_blocked_fair(struct rq *rq, bool *done)
 {
 	struct cfs_rq *cfs_rq, *pos;
 	bool decayed = false;
-	int cpu = cpu_of(rq);
 
 	/*
 	 * Iterates the task_group tree in a bottom up fashion, see
@@ -9821,7 +9820,7 @@ static bool __update_blocked_fair(struct rq *rq, bool *done)
 		}
 
 		/* Propagate pending load changes to the parent, if any: */
-		se = cfs_rq->tg->se[cpu];
+		se = cfs_rq_se(cfs_rq);
 		if (se && !skip_blocked_update(se))
 			update_load_avg(cfs_rq_of(se), se, UPDATE_TG);
 
@@ -9847,8 +9846,7 @@ static bool __update_blocked_fair(struct rq *rq, bool *done)
  */
 static void update_cfs_rq_h_load(struct cfs_rq *cfs_rq)
 {
-	struct rq *rq = rq_of(cfs_rq);
-	struct sched_entity *se = cfs_rq->tg->se[cpu_of(rq)];
+	struct sched_entity *se = cfs_rq_se(cfs_rq);
 	unsigned long now = jiffies;
 	unsigned long load;
 
@@ -13364,7 +13362,6 @@ void free_fair_sched_group(struct task_group *tg)
 	}
 
 	kfree(tg->cfs_rq);
-	kfree(tg->se);
 }
 
 int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
@@ -13377,9 +13374,6 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 	tg->cfs_rq = kcalloc(nr_cpu_ids, sizeof(cfs_rq), GFP_KERNEL);
 	if (!tg->cfs_rq)
 		goto err;
-	tg->se = kcalloc(nr_cpu_ids, sizeof(se), GFP_KERNEL);
-	if (!tg->se)
-		goto err;
 
 	tg->shares = NICE_0_LOAD;
 
@@ -13394,7 +13388,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 		cfs_rq = &combined->cfs_rq;
 		se = &combined->se;
 		init_cfs_rq(cfs_rq);
-		init_tg_cfs_entry(tg, cfs_rq, se, i, parent->se[i]);
+		init_tg_cfs_entry(tg, cfs_rq, se, i, tg_se(parent, i));
 		init_entity_runnable_average(se);
 	}
 
@@ -13413,7 +13407,7 @@ void online_fair_sched_group(struct task_group *tg)
 
 	for_each_possible_cpu(i) {
 		rq = cpu_rq(i);
-		se = tg->se[i];
+		se = tg_se(tg, i);
 		rq_lock_irq(rq, &rf);
 		update_rq_clock(rq);
 		attach_entity_cfs_rq(se);
@@ -13430,7 +13424,7 @@ void unregister_fair_sched_group(struct task_group *tg)
 
 	for_each_possible_cpu(cpu) {
 		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu];
-		struct sched_entity *se = tg->se[cpu];
+		struct sched_entity *se = tg_se(tg, cpu);
 		struct rq *rq = cpu_rq(cpu);
 
 		if (se) {
@@ -13467,7 +13461,6 @@ void init_tg_cfs_entry(struct task_group *tg, struct cfs_rq *cfs_rq,
 	init_cfs_rq_runtime(cfs_rq);
 
 	tg->cfs_rq[cpu] = cfs_rq;
-	tg->se[cpu] = se;
 
 	/* se could be NULL for root_task_group */
 	if (!se)
@@ -13498,7 +13491,7 @@ static int __sched_group_set_shares(struct task_group *tg, unsigned long shares)
 	/*
 	 * We can't change the weight of the root cgroup.
 	 */
-	if (!tg->se[0])
+	if (is_root_task_group(tg))
 		return -EINVAL;
 
 	shares = clamp(shares, scale_load(MIN_SHARES), scale_load(MAX_SHARES));
@@ -13509,7 +13502,7 @@ static int __sched_group_set_shares(struct task_group *tg, unsigned long shares)
 	tg->shares = shares;
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
-		struct sched_entity *se = tg->se[i];
+		struct sched_entity *se = tg_se(tg, i);
 		struct rq_flags rf;
 
 		/* Propagate contribution to hierarchy */
@@ -13560,7 +13553,7 @@ int sched_group_set_idle(struct task_group *tg, long idle)
 
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
-		struct sched_entity *se = tg->se[i];
+		struct sched_entity *se = tg_se(tg, i);
 		struct cfs_rq *grp_cfs_rq = tg->cfs_rq[i];
 		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
 		long idle_task_delta;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6f32a76d38c2..3fdcdcdab76c 100644
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
@@ -903,7 +901,8 @@ struct dl_rq {
 };
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-
+/* Check whether a task group is root tg */
+#define is_root_task_group(tg) ((tg) == &root_task_group)
 /* An entity is a task if it doesn't "own" a runqueue */
 #define entity_is_task(se)	(!se->my_q)
 
@@ -1594,6 +1593,26 @@ static inline struct task_struct *task_of(struct sched_entity *se)
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
@@ -2168,8 +2187,8 @@ static inline void set_task_rq(struct task_struct *p, unsigned int cpu)
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

