Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26692227EB2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618337; cv=none; b=Bjepac+6ScbjyYmHf8DZ1WgShfE9JTlVEWkCyUpRAM9B4/VRbP+VnNALL4vojy9Vebg1/vEPeRH1bYF5xqtXhkptKz+D3IMUcTouXto+gzEIfld81Baapo4GjGce51/nOov1Xww/wZFvSJQZNVNtoHKec4gNBdk3tUKvaRekn3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618337; c=relaxed/simple;
	bh=O9Vx0j9eOk777eDnVPHjoXawUqffTlg4+FsKrKptopw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1JJOmC3MCBitAviEhzfrMreXXX7frEXSb6R/sWt7vefKpsvmvUsumR7ZFImOphbG0cRpwmoFZIoi+/D39iUMLzCqvG8bWElVVmNOPyD6qZmww3E/j7RG/lAGV/azS/EADtKzZP0W9faFQEgIMWzjc1ANyeLEE6iljOS+qbJxfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVU/+VlS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVU/+VlS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939F9C4CEEC;
	Fri, 25 Apr 2025 21:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618336;
	bh=O9Vx0j9eOk777eDnVPHjoXawUqffTlg4+FsKrKptopw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LVU/+VlSftdREQnR0D8jAxKDfE6ITMcNmsTPGzC7o6LYDyu1iylRAdOkumnNmNpRJ
	 7kxk1yuxRPqXjFPLaahfsbL3KTsrvUCC5MnD1M/lp46yyFNjwV0bmh9EkSUIc3qtNO
	 gT5UUTHFVeUrZtL7vRiE2xAwK7x2HruLOXQ8WEndYX6ve3aE/GHnVaxrRg1cRhKD+Q
	 Ns6aqXU2BHiFOHOauRehI66417HgIYKg5PnXWGldlM4r20JqKZQ9unufKMegbaVI13
	 YRi0d9Z8s2582hfU5bi74bCsGoSFDBiJBDFp7gmdv+hwKWzugqzZ1cfbHSsb1iWJLi
	 iju/jRUP6H6MA==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 11/12] sched_ext: Move disable machinery into scx_sched
Date: Fri, 25 Apr 2025 11:58:26 -1000
Message-ID: <20250425215840.2334972-12-tj@kernel.org>
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
index 154c354856fc..06973ec6177a 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -851,6 +851,10 @@ struct scx_sched {
 	struct scx_exit_info	*exit_info;
 
 	struct kobject		kobj;
+
+	struct kthread_worker	*helper;
+	struct irq_work		error_irq_work;
+	struct kthread_work	disable_work;
 	struct rcu_work		rcu_work;
 };
 
@@ -1024,7 +1028,6 @@ static DEFINE_SPINLOCK(scx_tasks_lock);
 static LIST_HEAD(scx_tasks);
 
 /* ops enable/disable */
-static struct kthread_worker *scx_helper;
 static DEFINE_MUTEX(scx_enable_mutex);
 DEFINE_STATIC_KEY_FALSE(__scx_enabled);
 DEFINE_STATIC_PERCPU_RWSEM(scx_fork_rwsem);
@@ -4418,6 +4421,7 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
 	struct scx_dispatch_q *dsq;
 	int node;
 
+	kthread_stop(sch->helper->task);
 	free_percpu(sch->event_stats_cpu);
 
 	for_each_node_state(node, N_POSSIBLE)
@@ -4740,7 +4744,7 @@ static const char *scx_exit_reason(enum scx_exit_kind kind)
 
 static void scx_disable_workfn(struct kthread_work *work)
 {
-	struct scx_sched *sch = scx_root;
+	struct scx_sched *sch = container_of(work, struct scx_sched, disable_work);
 	struct scx_exit_info *ei = sch->exit_info;
 	struct scx_task_iter sti;
 	struct task_struct *p;
@@ -4886,20 +4890,6 @@ static void scx_disable_workfn(struct kthread_work *work)
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
@@ -4912,7 +4902,7 @@ static void scx_disable(enum scx_exit_kind kind)
 	sch = rcu_dereference(scx_root);
 	if (sch) {
 		atomic_try_cmpxchg(&sch->exit_kind, &none, kind);
-		schedule_scx_disable_work();
+		kthread_queue_work(sch->helper, &sch->disable_work);
 	}
 	rcu_read_unlock();
 }
@@ -5214,16 +5204,15 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 
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
@@ -5250,17 +5239,7 @@ static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
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
@@ -5306,17 +5285,26 @@ static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
 	if (!sch->event_stats_cpu)
 		goto err_free_gdsqs;
 
+	sch->helper = kthread_run_worker(0, "sched_ext_helper");
+	if (!sch->helper)
+		goto err_free_event_stats;
+	sched_set_fifo(sch->helper->task);
+
 	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
+	init_irq_work(&sch->error_irq_work, scx_error_irq_workfn);
+	kthread_init_work(&sch->disable_work, scx_disable_workfn);
 	sch->ops = *ops;
 	ops->priv = sch;
 
 	sch->kobj.kset = scx_kset;
 	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
 	if (ret < 0)
-		goto err_free_event_stats;
+		goto err_stop_helper;
 
 	return sch;
 
+err_stop_helper:
+	kthread_stop(sch->helper->task);
 err_free_event_stats:
 	free_percpu(sch->event_stats_cpu);
 err_free_gdsqs:
@@ -5394,14 +5382,6 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
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
@@ -5630,7 +5610,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 * completion. sch's base reference will be put by bpf_scx_unreg().
 	 */
 	scx_error("scx_enable() failed (%d)", ret);
-	kthread_flush_work(&scx_disable_work);
+	kthread_flush_work(&sch->disable_work);
 	return 0;
 }
 
@@ -5783,7 +5763,7 @@ static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
 	struct scx_sched *sch = ops->priv;
 
 	scx_disable(SCX_EXIT_UNREG);
-	kthread_flush_work(&scx_disable_work);
+	kthread_flush_work(&sch->disable_work);
 	kobject_put(&sch->kobj);
 }
 
@@ -5906,10 +5886,7 @@ static struct bpf_struct_ops bpf_sched_ext_ops = {
 
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

