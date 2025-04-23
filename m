Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1325C82A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451954; cv=none; b=FaSMJhNOqU61n1zy0k3Y/0Sdy4czUqzbxigNsnAct8iLgJ6EzqkrLAPSRTZOsKfHuq3Oew7f2ry4MpnT2tYect7z7H5azkIFT+7GV1rm7sWFkkEsx+TOcPJ6rHFo9iTk2VEaYYRDEXNaSPF91k6hIh4wwNEPF6tDaRVX8tNHdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451954; c=relaxed/simple;
	bh=p4sY6aLd6ILTIJ5izrnNEjKvKh/BHJWeiuPdDr8oetg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWxWi6bXksyJl4ZtLnp84s9W++asbNYV2ewiN+mO0h0MU3JSyZ+AHdKbgQdTpjNTu6VlQjQIm21Xs/s2IE0UmbQ8GTThlikpS2sigmT93vbzYl/SIBLRAUrhkdIhzDKoU/duCdDX+4MXTMeUKIfubNaY2MFc2S3dQ7hFnhNq3O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERpKY+oG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERpKY+oG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F2CC4CEEC;
	Wed, 23 Apr 2025 23:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451954;
	bh=p4sY6aLd6ILTIJ5izrnNEjKvKh/BHJWeiuPdDr8oetg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ERpKY+oGxI2wffSXKrFJ902r3P0A0zNpJTp6hu4vlfUZW+QLYjKfvHm+bkj84+bcD
	 o9MaZkktPbUwF7sGjoULcCH1yRckte92H6hGek1bdZd68t1duq33TFmI/rM1cJsbYY
	 ctcy6q9QqrGweO+hK5R4L6JbR76JwJ7I6B2kN7T4ON8cE4KgvP0lUFBkV71fDnL3S8
	 jO1ZARWeteeP3i2KP18QtSNbIDs+jSK+CkExglaluSER6PVdhyF35h6j+gH38I89nr
	 sDa7VGagJCiNKMX5M8kUTxg8qzZE85+3F5g74uT0QaPaMVKj8TWRT49/DgUk4PGFBX
	 fvvgldu9maV6A==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 06/12] sched_ext: Move dsq_hash into scx_sched
Date: Wed, 23 Apr 2025 13:44:44 -1000
Message-ID: <20250423234542.1890867-7-tj@kernel.org>
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

User DSQs are going to become per scheduler instance. Move dsq_hash into
scx_sched. This shifts the code that assumes scx_root to be the only
scx_sched instance up the call stack but doesn't remove them yet.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 120 ++++++++++++++++++++++++++++++---------------
 1 file changed, 80 insertions(+), 40 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 88a0f6d9cb1e..a086b024301f 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -767,6 +767,7 @@ struct scx_sched {
 	struct sched_ext_ops	ops;
 	DECLARE_BITMAP(has_op, SCX_OPI_END);
 
+	struct rhashtable	dsq_hash;
 	bool			warned_zero_slice;
 
 	atomic_t		exit_kind;
@@ -1013,7 +1014,6 @@ static const struct rhashtable_params dsq_hash_params = {
 	.head_offset		= offsetof(struct scx_dispatch_q, hash_node),
 };
 
-static struct rhashtable dsq_hash;
 static LLIST_HEAD(dsqs_to_free);
 
 /* dispatch buf */
@@ -1111,9 +1111,9 @@ static struct scx_dispatch_q *find_global_dsq(struct task_struct *p)
 	return global_dsqs[cpu_to_node(task_cpu(p))];
 }
 
-static struct scx_dispatch_q *find_user_dsq(u64 dsq_id)
+static struct scx_dispatch_q *find_user_dsq(struct scx_sched *sch, u64 dsq_id)
 {
-	return rhashtable_lookup_fast(&dsq_hash, &dsq_id, dsq_hash_params);
+	return rhashtable_lookup_fast(&sch->dsq_hash, &dsq_id, dsq_hash_params);
 }
 
 /*
@@ -2056,7 +2056,8 @@ static void dispatch_dequeue(struct rq *rq, struct task_struct *p)
 		raw_spin_unlock(&dsq->lock);
 }
 
-static struct scx_dispatch_q *find_dsq_for_dispatch(struct rq *rq, u64 dsq_id,
+static struct scx_dispatch_q *find_dsq_for_dispatch(struct scx_sched *sch,
+						    struct rq *rq, u64 dsq_id,
 						    struct task_struct *p)
 {
 	struct scx_dispatch_q *dsq;
@@ -2076,7 +2077,7 @@ static struct scx_dispatch_q *find_dsq_for_dispatch(struct rq *rq, u64 dsq_id,
 	if (dsq_id == SCX_DSQ_GLOBAL)
 		dsq = find_global_dsq(p);
 	else
-		dsq = find_user_dsq(dsq_id);
+		dsq = find_user_dsq(sch, dsq_id);
 
 	if (unlikely(!dsq)) {
 		scx_error("non-existent DSQ 0x%llx for %s[%d]",
@@ -2117,11 +2118,12 @@ static void mark_direct_dispatch(struct task_struct *ddsp_task,
 	p->scx.ddsp_enq_flags = enq_flags;
 }
 
-static void direct_dispatch(struct task_struct *p, u64 enq_flags)
+static void direct_dispatch(struct scx_sched *sch, struct task_struct *p,
+			    u64 enq_flags)
 {
 	struct rq *rq = task_rq(p);
 	struct scx_dispatch_q *dsq =
-		find_dsq_for_dispatch(rq, p->scx.ddsp_dsq_id, p);
+		find_dsq_for_dispatch(sch, rq, p->scx.ddsp_dsq_id, p);
 
 	touch_core_sched_dispatch(rq, p);
 
@@ -2180,6 +2182,7 @@ static bool scx_rq_online(struct rq *rq)
 static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 			    int sticky_cpu)
 {
+	struct scx_sched *sch = scx_root;
 	struct task_struct **ddsp_taskp;
 	unsigned long qseq;
 
@@ -2246,7 +2249,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 	return;
 
 direct:
-	direct_dispatch(p, enq_flags);
+	direct_dispatch(sch, p, enq_flags);
 	return;
 
 local:
@@ -2906,7 +2909,8 @@ static void dispatch_to_local_dsq(struct rq *rq, struct scx_dispatch_q *dst_dsq,
  * was valid in the first place. Make sure that the task is still owned by the
  * BPF scheduler and claim the ownership before dispatching.
  */
-static void finish_dispatch(struct rq *rq, struct task_struct *p,
+static void finish_dispatch(struct scx_sched *sch, struct rq *rq,
+			    struct task_struct *p,
 			    unsigned long qseq_at_dispatch,
 			    u64 dsq_id, u64 enq_flags)
 {
@@ -2959,7 +2963,7 @@ static void finish_dispatch(struct rq *rq, struct task_struct *p,
 
 	BUG_ON(!(p->scx.flags & SCX_TASK_QUEUED));
 
-	dsq = find_dsq_for_dispatch(this_rq(), dsq_id, p);
+	dsq = find_dsq_for_dispatch(sch, this_rq(), dsq_id, p);
 
 	if (dsq->id == SCX_DSQ_LOCAL)
 		dispatch_to_local_dsq(rq, dsq, p, enq_flags);
@@ -2967,7 +2971,7 @@ static void finish_dispatch(struct rq *rq, struct task_struct *p,
 		dispatch_enqueue(dsq, p, enq_flags | SCX_ENQ_CLEAR_OPSS);
 }
 
-static void flush_dispatch_buf(struct rq *rq)
+static void flush_dispatch_buf(struct scx_sched *sch, struct rq *rq)
 {
 	struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
 	u32 u;
@@ -2975,7 +2979,7 @@ static void flush_dispatch_buf(struct rq *rq)
 	for (u = 0; u < dspc->cursor; u++) {
 		struct scx_dsp_buf_ent *ent = &dspc->buf[u];
 
-		finish_dispatch(rq, ent->task, ent->qseq, ent->dsq_id,
+		finish_dispatch(sch, rq, ent->task, ent->qseq, ent->dsq_id,
 				ent->enq_flags);
 	}
 
@@ -2985,6 +2989,7 @@ static void flush_dispatch_buf(struct rq *rq)
 
 static int balance_one(struct rq *rq, struct task_struct *prev)
 {
+	struct scx_sched *sch = scx_root;
 	struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
 	bool prev_on_scx = prev->sched_class == &ext_sched_class;
 	bool prev_on_rq = prev->scx.flags & SCX_TASK_QUEUED;
@@ -3052,7 +3057,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 		SCX_CALL_OP(SCX_KF_DISPATCH, dispatch, rq, cpu_of(rq),
 			    prev_on_scx ? prev : NULL);
 
-		flush_dispatch_buf(rq);
+		flush_dispatch_buf(sch, rq);
 
 		if (prev_on_rq && prev->scx.slice) {
 			rq->scx.flags |= SCX_RQ_BAL_KEEP;
@@ -3146,11 +3151,12 @@ static void process_ddsp_deferred_locals(struct rq *rq)
 	 */
 	while ((p = list_first_entry_or_null(&rq->scx.ddsp_deferred_locals,
 				struct task_struct, scx.dsq_list.node))) {
+		struct scx_sched *sch = scx_root;
 		struct scx_dispatch_q *dsq;
 
 		list_del_init(&p->scx.dsq_list.node);
 
-		dsq = find_dsq_for_dispatch(rq, p->scx.ddsp_dsq_id, p);
+		dsq = find_dsq_for_dispatch(sch, rq, p->scx.ddsp_dsq_id, p);
 		if (!WARN_ON_ONCE(dsq->id != SCX_DSQ_LOCAL))
 			dispatch_to_local_dsq(rq, dsq, p, p->scx.ddsp_enq_flags);
 	}
@@ -4204,14 +4210,14 @@ static void free_dsq_irq_workfn(struct irq_work *irq_work)
 
 static DEFINE_IRQ_WORK(free_dsq_irq_work, free_dsq_irq_workfn);
 
-static void destroy_dsq(u64 dsq_id)
+static void destroy_dsq(struct scx_sched *sch, u64 dsq_id)
 {
 	struct scx_dispatch_q *dsq;
 	unsigned long flags;
 
 	rcu_read_lock();
 
-	dsq = find_user_dsq(dsq_id);
+	dsq = find_user_dsq(sch, dsq_id);
 	if (!dsq)
 		goto out_unlock_rcu;
 
@@ -4223,7 +4229,8 @@ static void destroy_dsq(u64 dsq_id)
 		goto out_unlock_dsq;
 	}
 
-	if (rhashtable_remove_fast(&dsq_hash, &dsq->hash_node, dsq_hash_params))
+	if (rhashtable_remove_fast(&sch->dsq_hash, &dsq->hash_node,
+				   dsq_hash_params))
 		goto out_unlock_dsq;
 
 	/*
@@ -4397,7 +4404,21 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
 {
 	struct rcu_work *rcu_work = to_rcu_work(work);
 	struct scx_sched *sch = container_of(rcu_work, struct scx_sched, rcu_work);
+	struct rhashtable_iter rht_iter;
+	struct scx_dispatch_q *dsq;
+
+	rhashtable_walk_enter(&sch->dsq_hash, &rht_iter);
+	do {
+		rhashtable_walk_start(&rht_iter);
+
+		while ((dsq = rhashtable_walk_next(&rht_iter)) && !IS_ERR(dsq))
+			destroy_dsq(sch, dsq->id);
+
+		rhashtable_walk_stop(&rht_iter);
+	} while (dsq == ERR_PTR(-EAGAIN));
+	rhashtable_walk_exit(&rht_iter);
 
+	rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
 	free_exit_info(sch->exit_info);
 	kfree(sch);
 }
@@ -4701,8 +4722,6 @@ static void scx_disable_workfn(struct kthread_work *work)
 	struct scx_exit_info *ei = sch->exit_info;
 	struct scx_task_iter sti;
 	struct task_struct *p;
-	struct rhashtable_iter rht_iter;
-	struct scx_dispatch_q *dsq;
 	int kind, cpu;
 
 	kind = atomic_read(&sch->exit_kind);
@@ -4834,17 +4853,6 @@ static void scx_disable_workfn(struct kthread_work *work)
 	 */
 	kobject_del(&sch->kobj);
 
-	rhashtable_walk_enter(&dsq_hash, &rht_iter);
-	do {
-		rhashtable_walk_start(&rht_iter);
-
-		while ((dsq = rhashtable_walk_next(&rht_iter)) && !IS_ERR(dsq))
-			destroy_dsq(dsq->id);
-
-		rhashtable_walk_stop(&rht_iter);
-	} while (dsq == ERR_PTR(-EAGAIN));
-	rhashtable_walk_exit(&rht_iter);
-
 	free_percpu(scx_dsp_ctx);
 	scx_dsp_ctx = NULL;
 	scx_dsp_max_batch = 0;
@@ -5248,16 +5256,22 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
 		goto err_free_sch;
 	}
 
+	ret = rhashtable_init(&sch->dsq_hash, &dsq_hash_params);
+	if (ret < 0)
+		goto err_free_ei;
+
 	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
 	sch->ops = *ops;
 
 	sch->kobj.kset = scx_kset;
 	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
 	if (ret < 0)
-		goto err_free_ei;
+		goto err_free_hash;
 
 	return sch;
 
+err_free_hash:
+	rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
 err_free_ei:
 	free_exit_info(sch->exit_info);
 err_free_sch:
@@ -6098,7 +6112,6 @@ void __init init_sched_ext_class(void)
 	WRITE_ONCE(v, SCX_ENQ_WAKEUP | SCX_DEQ_SLEEP | SCX_KICK_PREEMPT |
 		   SCX_TG_ONLINE);
 
-	BUG_ON(rhashtable_init(&dsq_hash, &dsq_hash_params));
 	scx_idle_init_masks();
 
 	scx_kick_cpus_pnt_seqs =
@@ -6299,6 +6312,7 @@ static const struct btf_kfunc_id_set scx_kfunc_set_enqueue_dispatch = {
 static bool scx_dsq_move(struct bpf_iter_scx_dsq_kern *kit,
 			 struct task_struct *p, u64 dsq_id, u64 enq_flags)
 {
+	struct scx_sched *sch = scx_root;
 	struct scx_dispatch_q *src_dsq = kit->dsq, *dst_dsq;
 	struct rq *this_rq, *src_rq, *locked_rq;
 	bool dispatched = false;
@@ -6351,7 +6365,7 @@ static bool scx_dsq_move(struct bpf_iter_scx_dsq_kern *kit,
 	}
 
 	/* @p is still on $src_dsq and stable, determine the destination */
-	dst_dsq = find_dsq_for_dispatch(this_rq, dsq_id, p);
+	dst_dsq = find_dsq_for_dispatch(sch, this_rq, dsq_id, p);
 
 	/*
 	 * Apply vtime and slice updates before moving so that the new time is
@@ -6431,15 +6445,16 @@ __bpf_kfunc void scx_bpf_dispatch_cancel(void)
  */
 __bpf_kfunc bool scx_bpf_dsq_move_to_local(u64 dsq_id)
 {
+	struct scx_sched *sch = scx_root;
 	struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
 	struct scx_dispatch_q *dsq;
 
 	if (!scx_kf_allowed(SCX_KF_DISPATCH))
 		return false;
 
-	flush_dispatch_buf(dspc->rq);
+	flush_dispatch_buf(sch, dspc->rq);
 
-	dsq = find_user_dsq(dsq_id);
+	dsq = find_user_dsq(sch, dsq_id);
 	if (unlikely(!dsq)) {
 		scx_error("invalid DSQ ID 0x%016llx", dsq_id);
 		return false;
@@ -6700,6 +6715,7 @@ __bpf_kfunc_start_defs();
 __bpf_kfunc s32 scx_bpf_create_dsq(u64 dsq_id, s32 node)
 {
 	struct scx_dispatch_q *dsq;
+	struct scx_sched *sch;
 	s32 ret;
 
 	if (unlikely(node >= (int)nr_node_ids ||
@@ -6715,8 +6731,16 @@ __bpf_kfunc s32 scx_bpf_create_dsq(u64 dsq_id, s32 node)
 
 	init_dsq(dsq, dsq_id);
 
-	ret = rhashtable_lookup_insert_fast(&dsq_hash, &dsq->hash_node,
-					    dsq_hash_params);
+	rcu_read_lock();
+
+	sch = rcu_dereference(scx_root);
+	if (sch)
+		ret = rhashtable_lookup_insert_fast(&sch->dsq_hash, &dsq->hash_node,
+						    dsq_hash_params);
+	else
+		ret = -ENODEV;
+
+	rcu_read_unlock();
 	if (ret)
 		kfree(dsq);
 	return ret;
@@ -6815,11 +6839,18 @@ __bpf_kfunc void scx_bpf_kick_cpu(s32 cpu, u64 flags)
  */
 __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u64 dsq_id)
 {
+	struct scx_sched *sch;
 	struct scx_dispatch_q *dsq;
 	s32 ret;
 
 	preempt_disable();
 
+	sch = rcu_dereference_sched(scx_root);
+	if (!sch) {
+		ret = -ENODEV;
+		goto out;
+	}
+
 	if (dsq_id == SCX_DSQ_LOCAL) {
 		ret = READ_ONCE(this_rq()->scx.local_dsq.nr);
 		goto out;
@@ -6831,7 +6862,7 @@ __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u64 dsq_id)
 			goto out;
 		}
 	} else {
-		dsq = find_user_dsq(dsq_id);
+		dsq = find_user_dsq(sch, dsq_id);
 		if (dsq) {
 			ret = READ_ONCE(dsq->nr);
 			goto out;
@@ -6854,7 +6885,11 @@ __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u64 dsq_id)
  */
 __bpf_kfunc void scx_bpf_destroy_dsq(u64 dsq_id)
 {
-	destroy_dsq(dsq_id);
+	struct scx_sched *sch;
+
+	sch = rcu_dereference(scx_root);
+	if (sch)
+		destroy_dsq(sch, dsq_id);
 }
 
 /**
@@ -6871,16 +6906,21 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id,
 				     u64 flags)
 {
 	struct bpf_iter_scx_dsq_kern *kit = (void *)it;
+	struct scx_sched *sch;
 
 	BUILD_BUG_ON(sizeof(struct bpf_iter_scx_dsq_kern) >
 		     sizeof(struct bpf_iter_scx_dsq));
 	BUILD_BUG_ON(__alignof__(struct bpf_iter_scx_dsq_kern) !=
 		     __alignof__(struct bpf_iter_scx_dsq));
 
+	sch = rcu_dereference(scx_root);
+	if (!sch)
+		return -ENODEV;
+
 	if (flags & ~__SCX_DSQ_ITER_USER_FLAGS)
 		return -EINVAL;
 
-	kit->dsq = find_user_dsq(dsq_id);
+	kit->dsq = find_user_dsq(sch, dsq_id);
 	if (!kit->dsq)
 		return -ENOENT;
 
-- 
2.49.0

