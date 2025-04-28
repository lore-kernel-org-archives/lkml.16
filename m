Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD91D2FB2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873008; cv=none; b=GV3pDwDsRQts9km1yWO518VQX55EUSFn2tTgrdW6aymGvaaZeAc3huc9+nYIckrT79EKhg/W/7ECaQURHqLW17f+xoyXxQe9/loXeKRWf/kJA0mOeZHXLE+M/FKaD67tlbCzwdFCivBDZFYRDffFq1NGolr2hq8RgI95n8OGnFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873008; c=relaxed/simple;
	bh=ReqmuHoaJo8MOgAQQTvQoLJLP1leV6oDKvEEBVYKFaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGUElQqffYCfFIzpGUk6ql1VGiDt93Rm+WF5zYLW0P1uo7Y4g9wIB+My8VPSUM2eIYmU82lD3SKGoTYF+gIxsWzFxZLjB6MzJdUb8PZjrdB2XHlTOQMpL8lH/ztmmsi9jXZCJh1WAwoeRrMEamlPJMQsVOtDNdqf6D6SpneWbH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDKK7I76; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDKK7I76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F477C4CEE4;
	Mon, 28 Apr 2025 20:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745873008;
	bh=ReqmuHoaJo8MOgAQQTvQoLJLP1leV6oDKvEEBVYKFaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDKK7I764PXafwwfG5wfhG2WGn1/tA0USWPNx7h6lDE4pV7fZfOsNF9t0F8gBE9ns
	 JIXMxJa9G6+qwxf0pIBp4t7/8NjgIQJPg1QwWO/LHPH8rQfak8M0sqYXV54kie8znW
	 KWI3d5vKSwZ1MhFo2FTRMPWtKB8YUDYo0LQXCos2zorEX+lVRcadmK7JTjBwqd0udC
	 UnWRb6Wk27tCjl0WJ5iLkeI7+MHclV1wYYA1YYyxt3zJnqKl6G1GJXQabNVwHFD0Fk
	 U/WQkEzCC5ZqemHQVW0wF4Pu4C9cIHxFACjppxuE89EYj4c/trXym990Epxjvd/vjj
	 rfnltWC2CHIFA==
Date: Mon, 28 Apr 2025 10:43:27 -1000
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com, arighi@nvidia.com, multics69@gmail.com
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: [PATCH v2 06/12] sched_ext: Move dsq_hash into scx_sched
Message-ID: <aA_obyL9LiVwYHEp@slm.duckdns.org>
References: <20250425215840.2334972-1-tj@kernel.org>
 <20250425215840.2334972-7-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425215840.2334972-7-tj@kernel.org>

User DSQs are going to become per scheduler instance. Move dsq_hash into
scx_sched. This shifts the code that assumes scx_root to be the only
scx_sched instance up the call stack but doesn't remove them yet.

v2: Add missing rcu_read_lock() in scx_bpf_destroy_dsq() as per Andrea.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c |  122 +++++++++++++++++++++++++++++++++++------------------
 1 file changed, 82 insertions(+), 40 deletions(-)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -770,6 +770,7 @@ struct scx_sched {
 	struct sched_ext_ops	ops;
 	DECLARE_BITMAP(has_op, SCX_OPI_END);
 
+	struct rhashtable	dsq_hash;
 	bool			warned_zero_slice;
 
 	atomic_t		exit_kind;
@@ -1016,7 +1017,6 @@ static const struct rhashtable_params ds
 	.head_offset		= offsetof(struct scx_dispatch_q, hash_node),
 };
 
-static struct rhashtable dsq_hash;
 static LLIST_HEAD(dsqs_to_free);
 
 /* dispatch buf */
@@ -1114,9 +1114,9 @@ static struct scx_dispatch_q *find_globa
 	return global_dsqs[cpu_to_node(task_cpu(p))];
 }
 
-static struct scx_dispatch_q *find_user_dsq(u64 dsq_id)
+static struct scx_dispatch_q *find_user_dsq(struct scx_sched *sch, u64 dsq_id)
 {
-	return rhashtable_lookup_fast(&dsq_hash, &dsq_id, dsq_hash_params);
+	return rhashtable_lookup_fast(&sch->dsq_hash, &dsq_id, dsq_hash_params);
 }
 
 /*
@@ -2059,7 +2059,8 @@ static void dispatch_dequeue(struct rq *
 		raw_spin_unlock(&dsq->lock);
 }
 
-static struct scx_dispatch_q *find_dsq_for_dispatch(struct rq *rq, u64 dsq_id,
+static struct scx_dispatch_q *find_dsq_for_dispatch(struct scx_sched *sch,
+						    struct rq *rq, u64 dsq_id,
 						    struct task_struct *p)
 {
 	struct scx_dispatch_q *dsq;
@@ -2079,7 +2080,7 @@ static struct scx_dispatch_q *find_dsq_f
 	if (dsq_id == SCX_DSQ_GLOBAL)
 		dsq = find_global_dsq(p);
 	else
-		dsq = find_user_dsq(dsq_id);
+		dsq = find_user_dsq(sch, dsq_id);
 
 	if (unlikely(!dsq)) {
 		scx_error("non-existent DSQ 0x%llx for %s[%d]",
@@ -2120,11 +2121,12 @@ static void mark_direct_dispatch(struct
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
 
@@ -2183,6 +2185,7 @@ static bool scx_rq_online(struct rq *rq)
 static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 			    int sticky_cpu)
 {
+	struct scx_sched *sch = scx_root;
 	struct task_struct **ddsp_taskp;
 	unsigned long qseq;
 
@@ -2249,7 +2252,7 @@ static void do_enqueue_task(struct rq *r
 	return;
 
 direct:
-	direct_dispatch(p, enq_flags);
+	direct_dispatch(sch, p, enq_flags);
 	return;
 
 local:
@@ -2909,7 +2912,8 @@ static void dispatch_to_local_dsq(struct
  * was valid in the first place. Make sure that the task is still owned by the
  * BPF scheduler and claim the ownership before dispatching.
  */
-static void finish_dispatch(struct rq *rq, struct task_struct *p,
+static void finish_dispatch(struct scx_sched *sch, struct rq *rq,
+			    struct task_struct *p,
 			    unsigned long qseq_at_dispatch,
 			    u64 dsq_id, u64 enq_flags)
 {
@@ -2962,7 +2966,7 @@ retry:
 
 	BUG_ON(!(p->scx.flags & SCX_TASK_QUEUED));
 
-	dsq = find_dsq_for_dispatch(this_rq(), dsq_id, p);
+	dsq = find_dsq_for_dispatch(sch, this_rq(), dsq_id, p);
 
 	if (dsq->id == SCX_DSQ_LOCAL)
 		dispatch_to_local_dsq(rq, dsq, p, enq_flags);
@@ -2970,7 +2974,7 @@ retry:
 		dispatch_enqueue(dsq, p, enq_flags | SCX_ENQ_CLEAR_OPSS);
 }
 
-static void flush_dispatch_buf(struct rq *rq)
+static void flush_dispatch_buf(struct scx_sched *sch, struct rq *rq)
 {
 	struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
 	u32 u;
@@ -2978,7 +2982,7 @@ static void flush_dispatch_buf(struct rq
 	for (u = 0; u < dspc->cursor; u++) {
 		struct scx_dsp_buf_ent *ent = &dspc->buf[u];
 
-		finish_dispatch(rq, ent->task, ent->qseq, ent->dsq_id,
+		finish_dispatch(sch, rq, ent->task, ent->qseq, ent->dsq_id,
 				ent->enq_flags);
 	}
 
@@ -2988,6 +2992,7 @@ static void flush_dispatch_buf(struct rq
 
 static int balance_one(struct rq *rq, struct task_struct *prev)
 {
+	struct scx_sched *sch = scx_root;
 	struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
 	bool prev_on_scx = prev->sched_class == &ext_sched_class;
 	bool prev_on_rq = prev->scx.flags & SCX_TASK_QUEUED;
@@ -3055,7 +3060,7 @@ static int balance_one(struct rq *rq, st
 		SCX_CALL_OP(SCX_KF_DISPATCH, dispatch, rq, cpu_of(rq),
 			    prev_on_scx ? prev : NULL);
 
-		flush_dispatch_buf(rq);
+		flush_dispatch_buf(sch, rq);
 
 		if (prev_on_rq && prev->scx.slice) {
 			rq->scx.flags |= SCX_RQ_BAL_KEEP;
@@ -3149,11 +3154,12 @@ static void process_ddsp_deferred_locals
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
@@ -4207,14 +4213,14 @@ static void free_dsq_irq_workfn(struct i
 
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
 
@@ -4226,7 +4232,8 @@ static void destroy_dsq(u64 dsq_id)
 		goto out_unlock_dsq;
 	}
 
-	if (rhashtable_remove_fast(&dsq_hash, &dsq->hash_node, dsq_hash_params))
+	if (rhashtable_remove_fast(&sch->dsq_hash, &dsq->hash_node,
+				   dsq_hash_params))
 		goto out_unlock_dsq;
 
 	/*
@@ -4400,7 +4407,21 @@ static void scx_sched_free_rcu_work(stru
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
@@ -4704,8 +4725,6 @@ static void scx_disable_workfn(struct kt
 	struct scx_exit_info *ei = sch->exit_info;
 	struct scx_task_iter sti;
 	struct task_struct *p;
-	struct rhashtable_iter rht_iter;
-	struct scx_dispatch_q *dsq;
 	int kind, cpu;
 
 	kind = atomic_read(&sch->exit_kind);
@@ -4837,17 +4856,6 @@ static void scx_disable_workfn(struct kt
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
@@ -5251,6 +5259,10 @@ static struct scx_sched *scx_alloc_and_a
 		goto err_free_sch;
 	}
 
+	ret = rhashtable_init(&sch->dsq_hash, &dsq_hash_params);
+	if (ret < 0)
+		goto err_free_ei;
+
 	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
 	sch->ops = *ops;
 	ops->priv = sch;
@@ -5258,10 +5270,12 @@ static struct scx_sched *scx_alloc_and_a
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
@@ -6102,7 +6116,6 @@ void __init init_sched_ext_class(void)
 	WRITE_ONCE(v, SCX_ENQ_WAKEUP | SCX_DEQ_SLEEP | SCX_KICK_PREEMPT |
 		   SCX_TG_ONLINE);
 
-	BUG_ON(rhashtable_init(&dsq_hash, &dsq_hash_params));
 	scx_idle_init_masks();
 
 	scx_kick_cpus_pnt_seqs =
@@ -6303,6 +6316,7 @@ static const struct btf_kfunc_id_set scx
 static bool scx_dsq_move(struct bpf_iter_scx_dsq_kern *kit,
 			 struct task_struct *p, u64 dsq_id, u64 enq_flags)
 {
+	struct scx_sched *sch = scx_root;
 	struct scx_dispatch_q *src_dsq = kit->dsq, *dst_dsq;
 	struct rq *this_rq, *src_rq, *locked_rq;
 	bool dispatched = false;
@@ -6355,7 +6369,7 @@ static bool scx_dsq_move(struct bpf_iter
 	}
 
 	/* @p is still on $src_dsq and stable, determine the destination */
-	dst_dsq = find_dsq_for_dispatch(this_rq, dsq_id, p);
+	dst_dsq = find_dsq_for_dispatch(sch, this_rq, dsq_id, p);
 
 	/*
 	 * Apply vtime and slice updates before moving so that the new time is
@@ -6435,15 +6449,16 @@ __bpf_kfunc void scx_bpf_dispatch_cancel
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
@@ -6704,6 +6719,7 @@ __bpf_kfunc_start_defs();
 __bpf_kfunc s32 scx_bpf_create_dsq(u64 dsq_id, s32 node)
 {
 	struct scx_dispatch_q *dsq;
+	struct scx_sched *sch;
 	s32 ret;
 
 	if (unlikely(node >= (int)nr_node_ids ||
@@ -6719,8 +6735,16 @@ __bpf_kfunc s32 scx_bpf_create_dsq(u64 d
 
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
@@ -6819,11 +6843,18 @@ out:
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
@@ -6835,7 +6866,7 @@ __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u6
 			goto out;
 		}
 	} else {
-		dsq = find_user_dsq(dsq_id);
+		dsq = find_user_dsq(sch, dsq_id);
 		if (dsq) {
 			ret = READ_ONCE(dsq->nr);
 			goto out;
@@ -6858,7 +6889,13 @@ out:
  */
 __bpf_kfunc void scx_bpf_destroy_dsq(u64 dsq_id)
 {
-	destroy_dsq(dsq_id);
+	struct scx_sched *sch;
+
+	rcu_read_lock();
+	sch = rcu_dereference(scx_root);
+	if (sch)
+		destroy_dsq(sch, dsq_id);
+	rcu_read_unlock();
 }
 
 /**
@@ -6875,16 +6912,21 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(str
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
 
