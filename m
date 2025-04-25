Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000BB2343BE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618334; cv=none; b=T1VU+k+iSP4u4aTmjbOirJ3ugUAuUgv0AJGZlxXgVqQUL9/lxpAsjb972ZXdkCXz49aGu3DP3aR+fqPJbkQYfMiDJ7bMXA20iwssDlX8aHGWpH7ofwEK3/XuQg1VNRPuwIfnjYtTEsEIWAmDxtjnDezbME4dmkyLoZ9tEAi55sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618334; c=relaxed/simple;
	bh=6533aGJm/53ftgbVaY9L98RwqQPS7FMFd1/u9stkNHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFBnpj3/S0JYhb2pmVdX5hmDKTPUHOly9qV9MCmtkrKj9UlYFu44NZB8leXxwl7Vy0BLkyI3VQj+aiilrcIrikjoTdoZjgc7XdnW6j8+DNE9YwKIBv4UORClx4DgNi655jd4PXz6vw1KaVAkHWfS5mHaZ8DQohyQ19LHIc7Wem0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOD24qT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOD24qT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DB0C4CEEE;
	Fri, 25 Apr 2025 21:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618332;
	bh=6533aGJm/53ftgbVaY9L98RwqQPS7FMFd1/u9stkNHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UOD24qT40PNE3gYROdm7ojMQyiRkEaOTV9NBu4B9iuJGcw7BI6NtkXGUfdKEzL6QJ
	 ilae/JsJrpqPzLTYUTL9RtpQeZWDRh4ds3uicWyZSyUMjEwGh0ySB+HKSe08b4QIDq
	 YbwvlohqjSUmSA+q3T9ESo+1np5GKkb8NODdebnDuwN4L9OssVcQl0caX6JA3Xu5Yk
	 fJoMRe6NZSurvjiDT/jJv0NAlF4oTg1ik3YL4QRghT505HqGsjqzFWNIn6EPTBUuci
	 PcvU7h0qoSZu8UllknTUf1/474azjaRNksjoNG+sA4udUaHI0mmFIAcoQVEuYOTS+b
	 wq3oy2M4AvPjQ==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 07/12] sched_ext: Move global_dsqs into scx_sched
Date: Fri, 25 Apr 2025 11:58:22 -1000
Message-ID: <20250425215840.2334972-8-tj@kernel.org>
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

Global DSQs are going to become per scheduler instance. Move global_dsqs
into scx_sched. find_global_dsq() already takes a task_struct pointer as an
argument and should later be able to determine the scx_sched to use from
that. For now, assume scx_root.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 95 ++++++++++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 46 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 8fe95faae7ef..a6dd096add3d 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -770,7 +770,17 @@ struct scx_sched {
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
@@ -1001,16 +1011,6 @@ static unsigned long __percpu *scx_kick_cpus_pnt_seqs;
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
@@ -1111,7 +1111,9 @@ static bool u32_before(u32 a, u32 b)
 
 static struct scx_dispatch_q *find_global_dsq(struct task_struct *p)
 {
-	return global_dsqs[cpu_to_node(task_cpu(p))];
+	struct scx_sched *sch = scx_root;
+
+	return sch->global_dsqs[cpu_to_node(task_cpu(p))];
 }
 
 static struct scx_dispatch_q *find_user_dsq(struct scx_sched *sch, u64 dsq_id)
@@ -2788,11 +2790,11 @@ static bool consume_dispatch_q(struct rq *rq, struct scx_dispatch_q *dsq)
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
@@ -3038,7 +3040,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	if (rq->scx.local_dsq.nr)
 		goto has_tasks;
 
-	if (consume_global_dsq(rq))
+	if (consume_global_dsq(sch, rq))
 		goto has_tasks;
 
 	if (unlikely(!SCX_HAS_OP(scx_root, dispatch)) ||
@@ -3068,7 +3070,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 		}
 		if (rq->scx.local_dsq.nr)
 			goto has_tasks;
-		if (consume_global_dsq(rq))
+		if (consume_global_dsq(sch, rq))
 			goto has_tasks;
 
 		/*
@@ -4409,6 +4411,11 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
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
@@ -5247,7 +5254,7 @@ static struct kthread_worker *scx_create_rt_helper(const char *name)
 static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
 {
 	struct scx_sched *sch;
-	int ret;
+	int node, ret;
 
 	sch = kzalloc(sizeof(*sch), GFP_KERNEL);
 	if (!sch)
@@ -5263,6 +5270,26 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
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
 	ops->priv = sch;
@@ -5270,10 +5297,14 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
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
@@ -5335,7 +5366,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	struct scx_task_iter sti;
 	struct task_struct *p;
 	unsigned long timeout;
-	int i, cpu, node, ret;
+	int i, cpu, ret;
 
 	if (!cpumask_equal(housekeeping_cpumask(HK_TYPE_DOMAIN),
 			   cpu_possible_mask)) {
@@ -5362,34 +5393,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
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

