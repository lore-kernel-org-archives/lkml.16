Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F5E244666
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451951; cv=none; b=jY/TQSK6VgO9oAOFlpjG9hM/QUhF4eoxz2aNZvVNZRBUwCDIlIqqavZyZsAYN1bhA/DRaFbEWXk65ROyUawTjBFi8Lt/wClVSgxZxeSxUyxtzxx7vLzLX93fT4vyK+MRmMVtlQjiQiKQ+graX7DdfyqwY+YyLr+7XMTdyRP7bGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451951; c=relaxed/simple;
	bh=ZCP2b3DU6nbnc8czMF6rUTxHpPakxRGjSHfnaJXM970=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3sAbVbu3Qrue+QDD94WRpBbfuIgBiBCo4vj4GfF5UB25BvN/MShqFRKtxPhV7OCIhr6ViyKEM2DYb2MBMqEk+GyXGTyu2u/WHjd2f6GYE+2RVFSWVhm+fcoJ1BKL6X49Ye1dHUngv2JyoLktXo3D9Sq0pYWe9wqVVOFkiRalaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i91O51nw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i91O51nw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C9EC4CEE2;
	Wed, 23 Apr 2025 23:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451951;
	bh=ZCP2b3DU6nbnc8czMF6rUTxHpPakxRGjSHfnaJXM970=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i91O51nwi+Ead43IxeQ09++4wj7+P3uv75ZjGP1gakaF5l4kOVhInM/E7ZLEuCtsr
	 fyoqJiMHePk9qN1uCeY4PhHEyrndnEKrD1EadoNV32J5N8ihCh4n309Dm/UnOuS/TU
	 Vd5whPw4rM0XMD7Op5YHprzxfO2+C2ILFmMFUzaPH59vwwtVVhaLvdEldk+xei1X52
	 50VvawR/jh1PtRMJMzRW5rp/BoX4KCU22VQZ5DrLfqP7Q54SisXqLFvSX5qdLof/HD
	 lp7Q4znD5LNgDFXC5iyNy1izw+ar/7T0BmWbndLs0OYAPRvkBPdJW7K5Sst9JDqtIe
	 FQCg6R8Ekh90Q==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 03/12] sched_ext: Use dynamic allocation for scx_sched
Date: Wed, 23 Apr 2025 13:44:41 -1000
Message-ID: <20250423234542.1890867-4-tj@kernel.org>
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

To prepare for supporting multiple schedulers, make scx_sched allocated
dynamically. scx_sched->kobj is now an embedded field and the kobj's
lifetime determines the lifetime of the containing scx_sched.

- Enable path is updated so that kobj init and addition are performed later.

- scx_sched freeing is initiated in scx_kobj_release() and also goes through
  an rcu_work so that scx_root can be accessed from an unsynchronized path -
  scx_disable().

No behavior changes intended.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 151 ++++++++++++++++++++++++++-------------------
 1 file changed, 86 insertions(+), 65 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index ad392890d2dd..612232c66d13 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -772,7 +772,8 @@ struct scx_sched {
 	atomic_t		exit_kind;
 	struct scx_exit_info	*exit_info;
 
-	struct kobject		*kobj;
+	struct kobject		kobj;
+	struct rcu_work		rcu_work;
 };
 
 enum scx_wake_flags {
@@ -933,11 +934,7 @@ enum scx_ops_state {
 #define SCX_OPSS_STATE_MASK	((1LU << SCX_OPSS_QSEQ_SHIFT) - 1)
 #define SCX_OPSS_QSEQ_MASK	(~SCX_OPSS_STATE_MASK)
 
-static struct scx_sched __scx_root = {
-	.exit_kind		= ATOMIC_INIT(SCX_EXIT_DONE),
-};
-
-static struct scx_sched *scx_root = &__scx_root;
+static struct scx_sched __rcu *scx_root;
 
 /*
  * During exit, a task may schedule after losing its PIDs. When disabling the
@@ -4417,9 +4414,23 @@ static const struct attribute_group scx_global_attr_group = {
 	.attrs = scx_global_attrs,
 };
 
+static void free_exit_info(struct scx_exit_info *ei);
+
+static void scx_sched_free_rcu_work(struct work_struct *work)
+{
+	struct rcu_work *rcu_work = to_rcu_work(work);
+	struct scx_sched *sch = container_of(rcu_work, struct scx_sched, rcu_work);
+
+	free_exit_info(sch->exit_info);
+	kfree(sch);
+}
+
 static void scx_kobj_release(struct kobject *kobj)
 {
-	kfree(kobj);
+	struct scx_sched *sch = container_of(kobj, struct scx_sched, kobj);
+
+	INIT_RCU_WORK(&sch->rcu_work, scx_sched_free_rcu_work);
+	queue_rcu_work(system_unbound_wq, &sch->rcu_work);
 }
 
 static ssize_t scx_attr_ops_show(struct kobject *kobj,
@@ -4709,14 +4720,15 @@ static const char *scx_exit_reason(enum scx_exit_kind kind)
 
 static void scx_disable_workfn(struct kthread_work *work)
 {
-	struct scx_exit_info *ei = scx_root->exit_info;
+	struct scx_sched *sch = scx_root;
+	struct scx_exit_info *ei = sch->exit_info;
 	struct scx_task_iter sti;
 	struct task_struct *p;
 	struct rhashtable_iter rht_iter;
 	struct scx_dispatch_q *dsq;
 	int kind, cpu;
 
-	kind = atomic_read(&scx_root->exit_kind);
+	kind = atomic_read(&sch->exit_kind);
 	while (true) {
 		/*
 		 * NONE indicates that a new scx_ops has been registered since
@@ -4725,7 +4737,7 @@ static void scx_disable_workfn(struct kthread_work *work)
 		 */
 		if (kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE)
 			return;
-		if (atomic_try_cmpxchg(&scx_root->exit_kind, &kind, SCX_EXIT_DONE))
+		if (atomic_try_cmpxchg(&sch->exit_kind, &kind, SCX_EXIT_DONE))
 			break;
 	}
 	ei->kind = kind;
@@ -4740,7 +4752,7 @@ static void scx_disable_workfn(struct kthread_work *work)
 		break;
 	case SCX_DISABLED:
 		pr_warn("sched_ext: ops error detected without ops (%s)\n",
-			scx_root->exit_info->msg);
+			sch->exit_info->msg);
 		WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
 		goto done;
 	default:
@@ -4807,41 +4819,43 @@ static void scx_disable_workfn(struct kthread_work *work)
 
 	/* no task is on scx, turn off all the switches and flush in-progress calls */
 	static_branch_disable(&__scx_enabled);
-	bitmap_zero(scx_root->has_op, SCX_OPI_END);
+	bitmap_zero(sch->has_op, SCX_OPI_END);
 	scx_idle_disable();
 	synchronize_rcu();
 
 	if (ei->kind >= SCX_EXIT_ERROR) {
 		pr_err("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
-		       scx_root->ops.name, ei->reason);
+		       sch->ops.name, ei->reason);
 
 		if (ei->msg[0] != '\0')
-			pr_err("sched_ext: %s: %s\n",
-			       scx_root->ops.name, ei->msg);
+			pr_err("sched_ext: %s: %s\n", sch->ops.name, ei->msg);
 #ifdef CONFIG_STACKTRACE
 		stack_trace_print(ei->bt, ei->bt_len, 2);
 #endif
 	} else {
 		pr_info("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
-			scx_root->ops.name, ei->reason);
+			sch->ops.name, ei->reason);
 	}
 
-	if (scx_root->ops.exit)
+	if (sch->ops.exit)
 		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, NULL, ei);
 
 	cancel_delayed_work_sync(&scx_watchdog_work);
 
 	/*
-	 * Delete the kobject from the hierarchy eagerly in addition to just
-	 * dropping a reference. Otherwise, if the object is deleted
-	 * asynchronously, sysfs could observe an object of the same name still
-	 * in the hierarchy when another scheduler is loaded.
+	 * scx_root clearing must be inside cpus_read_lock(). See
+	 * handle_hotplug().
 	 */
-	kobject_del(scx_root->kobj);
-	kobject_put(scx_root->kobj);
-	scx_root->kobj = NULL;
+	cpus_read_lock();
+	RCU_INIT_POINTER(scx_root, NULL);
+	cpus_read_unlock();
 
-	memset(&scx_root->ops, 0, sizeof(scx_root->ops));
+	/*
+	 * Delete the kobject from the hierarchy synchronously. Otherwise, sysfs
+	 * could observe an object of the same name still in the hierarchy when
+	 * the next scheduler is loaded.
+	 */
+	kobject_del(&sch->kobj);
 
 	rhashtable_walk_enter(&dsq_hash, &rht_iter);
 	do {
@@ -4858,9 +4872,6 @@ static void scx_disable_workfn(struct kthread_work *work)
 	scx_dsp_ctx = NULL;
 	scx_dsp_max_batch = 0;
 
-	free_exit_info(scx_root->exit_info);
-	scx_root->exit_info = NULL;
-
 	mutex_unlock(&scx_enable_mutex);
 
 	WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
@@ -4885,13 +4896,18 @@ static void schedule_scx_disable_work(void)
 static void scx_disable(enum scx_exit_kind kind)
 {
 	int none = SCX_EXIT_NONE;
+	struct scx_sched *sch;
 
 	if (WARN_ON_ONCE(kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE))
 		kind = SCX_EXIT_ERROR;
 
-	atomic_try_cmpxchg(&scx_root->exit_kind, &none, kind);
-
-	schedule_scx_disable_work();
+	rcu_read_lock();
+	sch = rcu_dereference(scx_root);
+	if (sch) {
+		atomic_try_cmpxchg(&sch->exit_kind, &none, kind);
+		schedule_scx_disable_work();
+	}
+	rcu_read_unlock();
 }
 
 static void dump_newline(struct seq_buf *s)
@@ -5288,6 +5304,7 @@ static int validate_ops(const struct sched_ext_ops *ops)
 
 static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 {
+	struct scx_sched *sch;
 	struct scx_task_iter sti;
 	struct task_struct *p;
 	unsigned long timeout;
@@ -5351,33 +5368,32 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		goto err_unlock;
 	}
 
-	scx_root->kobj = kzalloc(sizeof(*scx_root->kobj), GFP_KERNEL);
-	if (!scx_root->kobj) {
+	sch = kzalloc(sizeof(*sch), GFP_KERNEL);
+	if (!sch) {
 		ret = -ENOMEM;
 		goto err_unlock;
 	}
 
-	scx_root->kobj->kset = scx_kset;
-	ret = kobject_init_and_add(scx_root->kobj, &scx_ktype, NULL, "root");
-	if (ret < 0)
-		goto err;
-
-	scx_root->exit_info = alloc_exit_info(ops->exit_dump_len);
-	if (!scx_root->exit_info) {
+	sch->exit_info = alloc_exit_info(ops->exit_dump_len);
+	if (!sch->exit_info) {
 		ret = -ENOMEM;
-		goto err_del;
+		goto err_free;
 	}
 
+	sch->kobj.kset = scx_kset;
+	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
+	if (ret < 0)
+		goto err_free;
+
+	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
+	sch->ops = *ops;
+
 	/*
-	 * Set scx_ops, transition to ENABLING and clear exit info to arm the
-	 * disable path. Failure triggers full disabling from here on.
+	 * Transition to ENABLING and clear exit info to arm the disable path.
+	 * Failure triggers full disabling from here on.
 	 */
-	scx_root->ops = *ops;
-
 	WARN_ON_ONCE(scx_set_enable_state(SCX_ENABLING) != SCX_DISABLED);
-
-	atomic_set(&scx_root->exit_kind, SCX_EXIT_NONE);
-	scx_root->warned_zero_slice = false;
+	WARN_ON_ONCE(scx_root);
 
 	atomic_long_set(&scx_nr_rejected, 0);
 
@@ -5390,9 +5406,15 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 */
 	cpus_read_lock();
 
+	/*
+	 * Make the scheduler instance visible. Must be inside cpus_read_lock().
+	 * See handle_hotplug().
+	 */
+	rcu_assign_pointer(scx_root, sch);
+
 	scx_idle_enable(ops);
 
-	if (scx_root->ops.init) {
+	if (sch->ops.init) {
 		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init, NULL);
 		if (ret) {
 			ret = ops_sanitize_err("init", ret);
@@ -5404,7 +5426,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	for (i = SCX_OPI_CPU_HOTPLUG_BEGIN; i < SCX_OPI_CPU_HOTPLUG_END; i++)
 		if (((void (**)(void))ops)[i])
-			set_bit(i, scx_root->has_op);
+			set_bit(i, sch->has_op);
 
 	check_hotplug_seq(ops);
 	scx_idle_update_selcpu_topology(ops);
@@ -5445,10 +5467,10 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	for (i = SCX_OPI_NORMAL_BEGIN; i < SCX_OPI_NORMAL_END; i++)
 		if (((void (**)(void))ops)[i])
-			set_bit(i, scx_root->has_op);
+			set_bit(i, sch->has_op);
 
-	if (scx_root->ops.cpu_acquire || scx_root->ops.cpu_release)
-		scx_root->ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
+	if (sch->ops.cpu_acquire || sch->ops.cpu_release)
+		sch->ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
 
 	/*
 	 * Lock out forks, cgroup on/offlining and moves before opening the
@@ -5547,7 +5569,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	scx_bypass(false);
 
 	if (!scx_tryset_enable_state(SCX_ENABLED, SCX_ENABLING)) {
-		WARN_ON_ONCE(atomic_read(&scx_root->exit_kind) == SCX_EXIT_NONE);
+		WARN_ON_ONCE(atomic_read(&sch->exit_kind) == SCX_EXIT_NONE);
 		goto err_disable;
 	}
 
@@ -5555,23 +5577,18 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		static_branch_enable(&__scx_switched_all);
 
 	pr_info("sched_ext: BPF scheduler \"%s\" enabled%s\n",
-		scx_root->ops.name, scx_switched_all() ? "" : " (partial)");
-	kobject_uevent(scx_root->kobj, KOBJ_ADD);
+		sch->ops.name, scx_switched_all() ? "" : " (partial)");
+	kobject_uevent(&sch->kobj, KOBJ_ADD);
 	mutex_unlock(&scx_enable_mutex);
 
 	atomic_long_inc(&scx_enable_seq);
 
 	return 0;
 
-err_del:
-	kobject_del(scx_root->kobj);
-err:
-	kobject_put(scx_root->kobj);
-	scx_root->kobj = NULL;
-	if (scx_root->exit_info) {
-		free_exit_info(scx_root->exit_info);
-		scx_root->exit_info = NULL;
-	}
+err_free:
+	if (sch->exit_info)
+		free_exit_info(sch->exit_info);
+	kfree(sch);
 err_unlock:
 	mutex_unlock(&scx_enable_mutex);
 	return ret;
@@ -5593,6 +5610,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 */
 	scx_error("scx_enable() failed (%d)", ret);
 	kthread_flush_work(&scx_disable_work);
+	kobject_put(&sch->kobj);
 	return 0;
 }
 
@@ -5741,8 +5759,11 @@ static int bpf_scx_reg(void *kdata, struct bpf_link *link)
 
 static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
 {
+	struct scx_sched *sch = scx_root;
+
 	scx_disable(SCX_EXIT_UNREG);
 	kthread_flush_work(&scx_disable_work);
+	kobject_put(&sch->kobj);
 }
 
 static int bpf_scx_init(struct btf *btf)
-- 
2.49.0

