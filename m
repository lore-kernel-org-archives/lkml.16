Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F9238C3B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451956; cv=none; b=d21j0p+maSsFRBScO8Hn5HVB8EtPt7VwnoUQ893+sgYmPO5/5o3htKwkrW2YkBGFvsonDsFFjtaReGgXDpndPUjrui6lsiuRH9IeluSJqcJn2VoGti3s1dfPMqdIx5XilBPXxzNZMe4tivF6omGefjXxQutNR2eF2sZObXiNCoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451956; c=relaxed/simple;
	bh=x6NrtwdNtLnBFOpOdGrx+xkfceVTGm3Et04NTYLcIRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXcLzdYp3uvsHGyhEie0NiIqO6fA35rNjXSsp0KefnjZ86bqYoKLrQBweY5GqMT+fSfKfh+06vzmjXIcso2PDFgnhMP5OAJ17LBGf3txL/7FdyYYdJZYAPv335FaO+x9zDnxDcopHLpZgHxTGTgmoG+1uu9L7aG00t68DrG4PVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBDQmxkl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBDQmxkl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B12C4CEE2;
	Wed, 23 Apr 2025 23:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451955;
	bh=x6NrtwdNtLnBFOpOdGrx+xkfceVTGm3Et04NTYLcIRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OBDQmxklcuykedHnrDtM57RinczpzrEM1rBXQEJg2dITM2TTz9moqVE2Vkb8k6TZA
	 tV/sxue6scVgkYEbZbXOSvJuCzW+gfUjUJ+6dnYBaEnVZQppecFWOvV+URTOqPcteu
	 yNyAS84m9jZOUpmmiruZks+qOGPZiRTBEnwEbmZZEPimtKOVWOANksFdx0Po+aNzOF
	 l9jYiVb/UM9cXqqq4DZyAJ7uA088NawYzLSQ1pzAnOi8vGC86PPVNJHZLuuKLfwDJ/
	 u5v1Bz2qmRmr4jonV1OKQmch3Ahw49HJx0iY0eFPJzhrr1VzRt6VQ4BznTJv3tgoNZ
	 PtZyQiIXrjQ0w==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 07/12] sched_ext: Move global_dsqs into scx_sched
Date: Wed, 23 Apr 2025 13:44:45 -1000
Message-ID: <20250423234542.1890867-8-tj@kernel.org>
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

Global DSQs are going to become per scheduler instance. Move global_dsqs
into scx_sched. find_global_dsq() already takes a task_struct pointer as an
argument and should later be able to determine the scx_sched to use from
that. For now, assume scx_root.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 95 ++++++++++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 46 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index a086b024301f..5beb2dd868ad 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -767,7 +767,17 @@ struct scx_sched {
 	struct sched_ext_ops	ops;
 	DECLARE_BITMAP(has_op, SCX_OPI_END);
 
+	/*
+	 * Dispatch queues.
+	 *
+	 * The global DSQ (%SCX_DSQ_GLOBAL) is split per-node for scalability.
+	 * This is to avoid live-locking in bypass mode where all tasks are
+	 * dispatched to %SCX_DSQ_GLOBAL and all CPUs consume from it. If
+	 * per-node split isn't sufficient, it can be further split.
+	 */
 	struct rhashtable	dsq_hash;
+	struct scx_dispatch_q	**global_dsqs;
+
 	bool			warned_zero_slice;
 
 	atomic_t		exit_kind;
@@ -998,16 +1008,6 @@ static unsigned long __percpu *scx_kick_cpus_pnt_seqs;
  */
 static DEFINE_PER_CPU(struct task_struct *, direct_dispatch_task);
 
-/*
- * Dispatch queues.
- *
- * The global DSQ (%SCX_DSQ_GLOBAL) is split per-node for scalability. This is
- * to avoid live-locking in bypass mode where all tasks are dispatched to
- * %SCX_DSQ_GLOBAL and all CPUs consume from it. If per-node split isn't
- * sufficient, it can be further split.
- */
-static struct scx_dispatch_q **global_dsqs;
-
 static const struct rhashtable_params dsq_hash_params = {
 	.key_len		= sizeof_field(struct scx_dispatch_q, id),
 	.key_offset		= offsetof(struct scx_dispatch_q, id),
@@ -1108,7 +1108,9 @@ static bool u32_before(u32 a, u32 b)
 
 static struct scx_dispatch_q *find_global_dsq(struct task_struct *p)
 {
-	return global_dsqs[cpu_to_node(task_cpu(p))];
+	struct scx_sched *sch = scx_root;
+
+	return sch->global_dsqs[cpu_to_node(task_cpu(p))];
 }
 
 static struct scx_dispatch_q *find_user_dsq(struct scx_sched *sch, u64 dsq_id)
@@ -2785,11 +2787,11 @@ static bool consume_dispatch_q(struct rq *rq, struct scx_dispatch_q *dsq)
 	return false;
 }
 
-static bool consume_global_dsq(struct rq *rq)
+static bool consume_global_dsq(struct scx_sched *sch, struct rq *rq)
 {
 	int node = cpu_to_node(cpu_of(rq));
 
-	return consume_dispatch_q(rq, global_dsqs[node]);
+	return consume_dispatch_q(rq, sch->global_dsqs[node]);
 }
 
 /**
@@ -3035,7 +3037,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	if (rq->scx.local_dsq.nr)
 		goto has_tasks;
 
-	if (consume_global_dsq(rq))
+	if (consume_global_dsq(sch, rq))
 		goto has_tasks;
 
 	if (unlikely(!SCX_HAS_OP(scx_root, dispatch)) ||
@@ -3065,7 +3067,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 		}
 		if (rq->scx.local_dsq.nr)
 			goto has_tasks;
-		if (consume_global_dsq(rq))
+		if (consume_global_dsq(sch, rq))
 			goto has_tasks;
 
 		/*
@@ -4406,6 +4408,11 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
 	struct scx_sched *sch = container_of(rcu_work, struct scx_sched, rcu_work);
 	struct rhashtable_iter rht_iter;
 	struct scx_dispatch_q *dsq;
+	int node;
+
+	for_each_node_state(node, N_POSSIBLE)
+		kfree(sch->global_dsqs[node]);
+	kfree(sch->global_dsqs);
 
 	rhashtable_walk_enter(&sch->dsq_hash, &rht_iter);
 	do {
@@ -5244,7 +5251,7 @@ static struct kthread_worker *scx_create_rt_helper(const char *name)
 static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
 {
 	struct scx_sched *sch;
-	int ret;
+	int node, ret;
 
 	sch = kzalloc(sizeof(*sch), GFP_KERNEL);
 	if (!sch)
@@ -5260,16 +5267,40 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
 	if (ret < 0)
 		goto err_free_ei;
 
+	sch->global_dsqs = kcalloc(nr_node_ids, sizeof(sch->global_dsqs[0]),
+				   GFP_KERNEL);
+	if (!sch->global_dsqs) {
+		ret = -ENOMEM;
+		goto err_free_hash;
+	}
+
+	for_each_node_state(node, N_POSSIBLE) {
+		struct scx_dispatch_q *dsq;
+
+		dsq = kzalloc_node(sizeof(*dsq), GFP_KERNEL, node);
+		if (!dsq) {
+			ret = -ENOMEM;
+			goto err_free_gdsqs;
+		}
+
+		init_dsq(dsq, SCX_DSQ_GLOBAL);
+		sch->global_dsqs[node] = dsq;
+	}
+
 	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
 	sch->ops = *ops;
 
 	sch->kobj.kset = scx_kset;
 	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
 	if (ret < 0)
-		goto err_free_hash;
+		goto err_free_gdsqs;
 
 	return sch;
 
+err_free_gdsqs:
+	for_each_node_state(node, N_POSSIBLE)
+		kfree(sch->global_dsqs[node]);
+	kfree(sch->global_dsqs);
 err_free_hash:
 	rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
 err_free_ei:
@@ -5331,7 +5362,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	struct scx_task_iter sti;
 	struct task_struct *p;
 	unsigned long timeout;
-	int i, cpu, node, ret;
+	int i, cpu, ret;
 
 	if (!cpumask_equal(housekeeping_cpumask(HK_TYPE_DOMAIN),
 			   cpu_possible_mask)) {
@@ -5358,34 +5389,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		}
 	}
 
-	if (!global_dsqs) {
-		struct scx_dispatch_q **dsqs;
-
-		dsqs = kcalloc(nr_node_ids, sizeof(dsqs[0]), GFP_KERNEL);
-		if (!dsqs) {
-			ret = -ENOMEM;
-			goto err_unlock;
-		}
-
-		for_each_node_state(node, N_POSSIBLE) {
-			struct scx_dispatch_q *dsq;
-
-			dsq = kzalloc_node(sizeof(*dsq), GFP_KERNEL, node);
-			if (!dsq) {
-				for_each_node_state(node, N_POSSIBLE)
-					kfree(dsqs[node]);
-				kfree(dsqs);
-				ret = -ENOMEM;
-				goto err_unlock;
-			}
-
-			init_dsq(dsq, SCX_DSQ_GLOBAL);
-			dsqs[node] = dsq;
-		}
-
-		global_dsqs = dsqs;
-	}
-
 	if (scx_enable_state() != SCX_DISABLED) {
 		ret = -EBUSY;
 		goto err_unlock;
-- 
2.49.0

