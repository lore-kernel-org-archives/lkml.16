Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B8267B6B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451960; cv=none; b=BCX/IIDlx/a1zYMR0zminQKhRm0+k+d+D24UjiLW7DWV1K54tbofRcpl7FU92+fask5ytaFFdCxXN6AtxJ983gyrKzjkqX4yKvd35b3Ca++XGxY9tomLsmm2MYF9jVOtru5JcmDzfmOIUp+0rVm8lebbjG49UoIas/kx/8WOFyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451960; c=relaxed/simple;
	bh=txmxjKtDkNR38sCV1sa/OTuK1A7EtuBPd/H/0eD08/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAN98KkV72EFS9XDaONBriIk1l/LwUNdF6qTIuV95bOWooVa5FOh9fhenojdef2XX0P8WYDm8mvJsFZ7Gy7wI5hlOT2zH20F7ifqAo9Wk2mP9t987tfG2s93xbKS1nsVqZZldwBYXAvPuXdBTTPuz6ymhUoVbs6+8Ub+kMh73Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0Ldl0oi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0Ldl0oi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8669EC4CEE2;
	Wed, 23 Apr 2025 23:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451959;
	bh=txmxjKtDkNR38sCV1sa/OTuK1A7EtuBPd/H/0eD08/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o0Ldl0oiemCBWxT4hqWDQuUdDPiu06JHUiFIiHDtW6Ggs4BD7qUpXTUTY6uctKLvT
	 XVVFYf5ENidwUQAI4t+RIynWNu7Rofxu/zBromMB7EAXWeyGej2lzpTjN0ej5tQHmC
	 tO5e3DZRg9Zzs7Aq0is0OUpIBR0ea3ASgOub4MvXueSUY1Z4Wwe8TRhxPkQO7tv0r1
	 /vXqxUBO9k4I1hAzUJlnS7OZWs4HMazUgQ7LoY2tir/fcxPDUetjX4+HFJFt593X/M
	 fwHtbiq03kSlq2sc9sxpW8kMEsNdo2VX76Cn0aEG6BfoGnr2fuxUa9V+bBy1iqbUtN
	 AlrYkiLvt25Bw==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 11/12] sched_ext: Move disable machinery into scx_sched
Date: Wed, 23 Apr 2025 13:44:49 -1000
Message-ID: <20250423234542.1890867-12-tj@kernel.org>
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

Because disable can be triggered from any place and the scheduler cannot be
trusted, disable path uses an irq_work to bounce and a kthread_work which is
executed on an RT helper kthread to perform disable. These must be per
scheduler instance to guarantee forward progress. Move them into scx_sched.

- If an scx_sched is accessible, its helper kthread is always valid making
  the `helper` check in schedule_scx_disable_work() unnecessary. As the
  function becomes trivial after the removal of the test, inline it.

- scx_create_rt_helper() has only one user - creation of the disable helper
  kthread. Inline it into scx_alloc_and_add_sched().

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 73 ++++++++++++++++------------------------------
 1 file changed, 25 insertions(+), 48 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 75c91b58430c..d27193010b6a 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -848,6 +848,10 @@ struct scx_sched {
 	struct scx_exit_info	*exit_info;
 
 	struct kobject		kobj;
+
+	struct kthread_worker	*helper;
+	struct irq_work		error_irq_work;
+	struct kthread_work	disable_work;
 	struct rcu_work		rcu_work;
 };
 
@@ -1021,7 +1025,6 @@ static DEFINE_SPINLOCK(scx_tasks_lock);
 static LIST_HEAD(scx_tasks);
 
 /* ops enable/disable */
-static struct kthread_worker *scx_helper;
 static DEFINE_MUTEX(scx_enable_mutex);
 DEFINE_STATIC_KEY_FALSE(__scx_enabled);
 DEFINE_STATIC_PERCPU_RWSEM(scx_fork_rwsem);
@@ -4415,6 +4418,7 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
 	struct scx_dispatch_q *dsq;
 	int node;
 
+	kthread_stop(sch->helper->task);
 	free_percpu(sch->event_stats_cpu);
 
 	for_each_node_state(node, N_POSSIBLE)
@@ -4737,7 +4741,7 @@ static const char *scx_exit_reason(enum scx_exit_kind kind)
 
 static void scx_disable_workfn(struct kthread_work *work)
 {
-	struct scx_sched *sch = scx_root;
+	struct scx_sched *sch = container_of(work, struct scx_sched, disable_work);
 	struct scx_exit_info *ei = sch->exit_info;
 	struct scx_task_iter sti;
 	struct task_struct *p;
@@ -4883,20 +4887,6 @@ static void scx_disable_workfn(struct kthread_work *work)
 	scx_bypass(false);
 }
 
-static DEFINE_KTHREAD_WORK(scx_disable_work, scx_disable_workfn);
-
-static void schedule_scx_disable_work(void)
-{
-	struct kthread_worker *helper = READ_ONCE(scx_helper);
-
-	/*
-	 * We may be called spuriously before the first bpf_sched_ext_reg(). If
-	 * scx_helper isn't set up yet, there's nothing to do.
-	 */
-	if (helper)
-		kthread_queue_work(helper, &scx_disable_work);
-}
-
 static void scx_disable(enum scx_exit_kind kind)
 {
 	int none = SCX_EXIT_NONE;
@@ -4909,7 +4899,7 @@ static void scx_disable(enum scx_exit_kind kind)
 	sch = rcu_dereference(scx_root);
 	if (sch) {
 		atomic_try_cmpxchg(&sch->exit_kind, &none, kind);
-		schedule_scx_disable_work();
+		kthread_queue_work(sch->helper, &sch->disable_work);
 	}
 	rcu_read_unlock();
 }
@@ -5211,16 +5201,15 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 
 static void scx_error_irq_workfn(struct irq_work *irq_work)
 {
-	struct scx_exit_info *ei = scx_root->exit_info;
+	struct scx_sched *sch = container_of(irq_work, struct scx_sched, error_irq_work);
+	struct scx_exit_info *ei = sch->exit_info;
 
 	if (ei->kind >= SCX_EXIT_ERROR)
-		scx_dump_state(ei, scx_root->ops.exit_dump_len);
+		scx_dump_state(ei, sch->ops.exit_dump_len);
 
-	schedule_scx_disable_work();
+	kthread_queue_work(sch->helper, &sch->disable_work);
 }
 
-static DEFINE_IRQ_WORK(scx_error_irq_work, scx_error_irq_workfn);
-
 static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
 				      const char *fmt, ...)
 {
@@ -5247,17 +5236,7 @@ static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
 	ei->kind = kind;
 	ei->reason = scx_exit_reason(ei->kind);
 
-	irq_work_queue(&scx_error_irq_work);
-}
-
-static struct kthread_worker *scx_create_rt_helper(const char *name)
-{
-	struct kthread_worker *helper;
-
-	helper = kthread_run_worker(0, name);
-	if (helper)
-		sched_set_fifo(helper->task);
-	return helper;
+	irq_work_queue(&scx_root->error_irq_work);
 }
 
 static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
@@ -5303,16 +5282,25 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
 	if (!sch->event_stats_cpu)
 		goto err_free_gdsqs;
 
+	sch->helper = kthread_run_worker(0, "sched_ext_helper");
+	if (!sch->helper)
+		goto err_event_stats;
+	sched_set_fifo(sch->helper->task);
+
 	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
+	init_irq_work(&sch->error_irq_work, scx_error_irq_workfn);
+	kthread_init_work(&sch->disable_work, scx_disable_workfn);
 	sch->ops = *ops;
 
 	sch->kobj.kset = scx_kset;
 	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
 	if (ret < 0)
-		goto err_event_stats;
+		goto err_stop_helper;
 
 	return sch;
 
+err_stop_helper:
+	kthread_stop(sch->helper->task);
 err_event_stats:
 	free_percpu(sch->event_stats_cpu);
 err_free_gdsqs:
@@ -5390,14 +5378,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	mutex_lock(&scx_enable_mutex);
 
-	if (!scx_helper) {
-		WRITE_ONCE(scx_helper, scx_create_rt_helper("sched_ext_helper"));
-		if (!scx_helper) {
-			ret = -ENOMEM;
-			goto err_unlock;
-		}
-	}
-
 	if (scx_enable_state() != SCX_DISABLED) {
 		ret = -EBUSY;
 		goto err_unlock;
@@ -5626,7 +5606,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 * completion.
 	 */
 	scx_error("scx_enable() failed (%d)", ret);
-	kthread_flush_work(&scx_disable_work);
+	kthread_flush_work(&sch->disable_work);
 	kobject_put(&sch->kobj);
 	return 0;
 }
@@ -5779,7 +5759,7 @@ static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
 	struct scx_sched *sch = scx_root;
 
 	scx_disable(SCX_EXIT_UNREG);
-	kthread_flush_work(&scx_disable_work);
+	kthread_flush_work(&sch->disable_work);
 	kobject_put(&sch->kobj);
 }
 
@@ -5902,10 +5882,7 @@ static struct bpf_struct_ops bpf_sched_ext_ops = {
 
 static void sysrq_handle_sched_ext_reset(u8 key)
 {
-	if (scx_helper)
-		scx_disable(SCX_EXIT_SYSRQ);
-	else
-		pr_info("sched_ext: BPF scheduler not yet used\n");
+	scx_disable(SCX_EXIT_SYSRQ);
 }
 
 static const struct sysrq_key_op sysrq_sched_ext_reset_op = {
-- 
2.49.0

