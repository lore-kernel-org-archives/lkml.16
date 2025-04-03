Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FDE1E1E1D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720638; cv=none; b=hemwZ6QMoDfn+pshBB4NUc7c4HHt2PXJiEoY4l49tXaELzkzledHNzNKJHXs7NBtM49vmVas46ZM/spglefOZCD6Sr92r+rGYPDw1Q7YSPsELG2MXOgzlsuG+iTBHfwgrJ0XhceWSBjBzA+omnrvICIle+OsLsLdIYL1lcQDnPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720638; c=relaxed/simple;
	bh=8VrFlCxe930rDjKJxtgwz2mw6EJxOLWZHd/ju77uzxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqJW1pPtTg9HjWanRnRQyMkv34jUgqdA6w1bJt+o9c4hCld3vLDruSOBYhYYlBXReCEP12pl0oyqxtXzIt1nveFV7910ZKqyC9Cc6/2mBy7wNE3RqT44+vzMz6sudDJV/HslIlHOBg5VCit6C0T91ShcOZAi5Z72tdMMZhFMd+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1C6Dyqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1C6Dyqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320E2C4CEEA;
	Thu,  3 Apr 2025 22:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743720638;
	bh=8VrFlCxe930rDjKJxtgwz2mw6EJxOLWZHd/ju77uzxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1C6Dyqt4AqLjCEvqn5RbKJaeb5yBsD7pIyMXzNw14DP8G7qxHCdRHrNH2dAPPPhe
	 Mz7/wPc/1yh9NW1CGOQG1yi3TYrRcVrLG/9Xa6kVaUsoViz3i6ZBy6CAle2TJYnVSm
	 PugIKXDp8NA68icdfVf/v3m41rqda/TZiB0vBLhAHyR89PSZIo4DvmenBrzV2KM1vl
	 TORUes0IrTs8Cg4K/gAny0CGAAWPlRTFW+xr4Qesjhmj07/rOdxHA3Q1BxL8agaIEa
	 aG47y9dvTPvjm/c/thfoMuC/6ILBOLnY8y18YSC/rlPxiSwz1847pDI67+45TIxBX9
	 WWZ568UjdzzZQ==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 5/5] sched_ext: Drop "ops" from scx_ops_{init|exit|enable|disable}[_task]() and friends
Date: Thu,  3 Apr 2025 12:49:47 -1000
Message-ID: <20250403225026.838987-6-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403225026.838987-1-tj@kernel.org>
References: <20250403225026.838987-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tag "ops" is used for two different purposes. First, to indicate that
the entity is directly related to the operations such as flags carried in
sched_ext_ops. Second, to indicate that the entity applies to something
global such as enable or bypass states. The second usage is historical and
causes confusion rather than clarifying anything. For example,
scx_ops_enable_state enums are named SCX_OPS_* and thus conflict with
scx_ops_flags. Let's drop the second usages.

Drop "ops" from scx_ops_{init|exit|enable|disable}[_task]() and friends.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 92 +++++++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 580e4ab33e8f..d15b45b3eb71 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -915,7 +915,7 @@ static atomic_t scx_enable_state_var = ATOMIC_INIT(SCX_DISABLED);
 static unsigned long scx_in_softlockup;
 static atomic_t scx_breather_depth = ATOMIC_INIT(0);
 static int scx_bypass_depth;
-static bool scx_ops_init_task_enabled;
+static bool scx_init_task_enabled;
 static bool scx_switching_all;
 DEFINE_STATIC_KEY_FALSE(__scx_switched_all);
 
@@ -2956,8 +2956,8 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 		 * scheduler wants to handle this explicitly, it should
 		 * implement ->cpu_release().
 		 *
-		 * See scx_ops_disable_workfn() for the explanation on the
-		 * bypassing test.
+		 * See scx_disable_workfn() for the explanation on the bypassing
+		 * test.
 		 */
 		if (prev_on_rq && prev->scx.slice && !scx_rq_bypassing(rq)) {
 			rq->scx.flags |= SCX_RQ_BAL_KEEP;
@@ -3611,7 +3611,7 @@ static void scx_set_task_state(struct task_struct *p, enum scx_task_state state)
 	p->scx.flags |= state << SCX_TASK_STATE_SHIFT;
 }
 
-static int scx_ops_init_task(struct task_struct *p, struct task_group *tg, bool fork)
+static int scx_init_task(struct task_struct *p, struct task_group *tg, bool fork)
 {
 	int ret;
 
@@ -3662,7 +3662,7 @@ static int scx_ops_init_task(struct task_struct *p, struct task_group *tg, bool
 	return 0;
 }
 
-static void scx_ops_enable_task(struct task_struct *p)
+static void scx_enable_task(struct task_struct *p)
 {
 	u32 weight;
 
@@ -3687,7 +3687,7 @@ static void scx_ops_enable_task(struct task_struct *p)
 		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, p, p->scx.weight);
 }
 
-static void scx_ops_disable_task(struct task_struct *p)
+static void scx_disable_task(struct task_struct *p)
 {
 	lockdep_assert_rq_held(task_rq(p));
 	WARN_ON_ONCE(scx_get_task_state(p) != SCX_TASK_ENABLED);
@@ -3697,7 +3697,7 @@ static void scx_ops_disable_task(struct task_struct *p)
 	scx_set_task_state(p, SCX_TASK_READY);
 }
 
-static void scx_ops_exit_task(struct task_struct *p)
+static void scx_exit_task(struct task_struct *p)
 {
 	struct scx_exit_task_args args = {
 		.cancelled = false,
@@ -3714,7 +3714,7 @@ static void scx_ops_exit_task(struct task_struct *p)
 	case SCX_TASK_READY:
 		break;
 	case SCX_TASK_ENABLED:
-		scx_ops_disable_task(p);
+		scx_disable_task(p);
 		break;
 	default:
 		WARN_ON_ONCE(true);
@@ -3754,15 +3754,15 @@ int scx_fork(struct task_struct *p)
 {
 	percpu_rwsem_assert_held(&scx_fork_rwsem);
 
-	if (scx_ops_init_task_enabled)
-		return scx_ops_init_task(p, task_group(p), true);
+	if (scx_init_task_enabled)
+		return scx_init_task(p, task_group(p), true);
 	else
 		return 0;
 }
 
 void scx_post_fork(struct task_struct *p)
 {
-	if (scx_ops_init_task_enabled) {
+	if (scx_init_task_enabled) {
 		scx_set_task_state(p, SCX_TASK_READY);
 
 		/*
@@ -3775,7 +3775,7 @@ void scx_post_fork(struct task_struct *p)
 			struct rq *rq;
 
 			rq = task_rq_lock(p, &rf);
-			scx_ops_enable_task(p);
+			scx_enable_task(p);
 			task_rq_unlock(rq, p, &rf);
 		}
 	}
@@ -3795,7 +3795,7 @@ void scx_cancel_fork(struct task_struct *p)
 
 		rq = task_rq_lock(p, &rf);
 		WARN_ON_ONCE(scx_get_task_state(p) >= SCX_TASK_READY);
-		scx_ops_exit_task(p);
+		scx_exit_task(p);
 		task_rq_unlock(rq, p, &rf);
 	}
 
@@ -3811,15 +3811,15 @@ void sched_ext_free(struct task_struct *p)
 	spin_unlock_irqrestore(&scx_tasks_lock, flags);
 
 	/*
-	 * @p is off scx_tasks and wholly ours. scx_ops_enable()'s READY ->
-	 * ENABLED transitions can't race us. Disable ops for @p.
+	 * @p is off scx_tasks and wholly ours. scx_enable()'s READY -> ENABLED
+	 * transitions can't race us. Disable ops for @p.
 	 */
 	if (scx_get_task_state(p) != SCX_TASK_NONE) {
 		struct rq_flags rf;
 		struct rq *rq;
 
 		rq = task_rq_lock(p, &rf);
-		scx_ops_exit_task(p);
+		scx_exit_task(p);
 		task_rq_unlock(rq, p, &rf);
 	}
 }
@@ -3840,7 +3840,7 @@ static void prio_changed_scx(struct rq *rq, struct task_struct *p, int oldprio)
 
 static void switching_to_scx(struct rq *rq, struct task_struct *p)
 {
-	scx_ops_enable_task(p);
+	scx_enable_task(p);
 
 	/*
 	 * set_cpus_allowed_scx() is not called while @p is associated with a
@@ -3853,7 +3853,7 @@ static void switching_to_scx(struct rq *rq, struct task_struct *p)
 
 static void switched_from_scx(struct rq *rq, struct task_struct *p)
 {
-	scx_ops_disable_task(p);
+	scx_disable_task(p);
 }
 
 static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p,int wake_flags) {}
@@ -4662,7 +4662,7 @@ static const char *scx_exit_reason(enum scx_exit_kind kind)
 	}
 }
 
-static void scx_ops_disable_workfn(struct kthread_work *work)
+static void scx_disable_workfn(struct kthread_work *work)
 {
 	struct scx_exit_info *ei = scx_exit_info;
 	struct scx_task_iter sti;
@@ -4714,7 +4714,7 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 
 	/*
 	 * Shut down cgroup support before tasks so that the cgroup attach path
-	 * doesn't race against scx_ops_exit_task().
+	 * doesn't race against scx_exit_task().
 	 */
 	scx_cgroup_lock();
 	scx_cgroup_exit();
@@ -4726,7 +4726,7 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 	 */
 	percpu_down_write(&scx_fork_rwsem);
 
-	scx_ops_init_task_enabled = false;
+	scx_init_task_enabled = false;
 
 	scx_task_iter_start(&sti);
 	while ((p = scx_task_iter_next_locked(&sti))) {
@@ -4746,7 +4746,7 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 		sched_enq_and_set_task(&ctx);
 
 		check_class_changed(task_rq(p), p, old_class, p->prio);
-		scx_ops_exit_task(p);
+		scx_exit_task(p);
 	}
 	scx_task_iter_stop(&sti);
 	percpu_up_write(&scx_fork_rwsem);
@@ -4828,9 +4828,9 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 	scx_bypass(false);
 }
 
-static DEFINE_KTHREAD_WORK(scx_ops_disable_work, scx_ops_disable_workfn);
+static DEFINE_KTHREAD_WORK(scx_disable_work, scx_disable_workfn);
 
-static void schedule_scx_ops_disable_work(void)
+static void schedule_scx_disable_work(void)
 {
 	struct kthread_worker *helper = READ_ONCE(scx_helper);
 
@@ -4839,10 +4839,10 @@ static void schedule_scx_ops_disable_work(void)
 	 * scx_helper isn't set up yet, there's nothing to do.
 	 */
 	if (helper)
-		kthread_queue_work(helper, &scx_ops_disable_work);
+		kthread_queue_work(helper, &scx_disable_work);
 }
 
-static void scx_ops_disable(enum scx_exit_kind kind)
+static void scx_disable(enum scx_exit_kind kind)
 {
 	int none = SCX_EXIT_NONE;
 
@@ -4851,7 +4851,7 @@ static void scx_ops_disable(enum scx_exit_kind kind)
 
 	atomic_try_cmpxchg(&scx_exit_kind, &none, kind);
 
-	schedule_scx_ops_disable_work();
+	schedule_scx_disable_work();
 }
 
 static void dump_newline(struct seq_buf *s)
@@ -5156,7 +5156,7 @@ static void scx_error_irq_workfn(struct irq_work *irq_work)
 	if (ei->kind >= SCX_EXIT_ERROR)
 		scx_dump_state(ei, scx_ops.exit_dump_len);
 
-	schedule_scx_ops_disable_work();
+	schedule_scx_disable_work();
 }
 
 static DEFINE_IRQ_WORK(scx_error_irq_work, scx_error_irq_workfn);
@@ -5182,7 +5182,7 @@ static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
 
 	/*
 	 * Set ei->kind and ->reason for scx_dump_state(). They'll be set again
-	 * in scx_ops_disable_workfn().
+	 * in scx_disable_workfn().
 	 */
 	ei->kind = kind;
 	ei->reason = scx_exit_reason(ei->kind);
@@ -5243,7 +5243,7 @@ static int validate_ops(const struct sched_ext_ops *ops)
 	return 0;
 }
 
-static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
+static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 {
 	struct scx_task_iter sti;
 	struct task_struct *p;
@@ -5421,8 +5421,8 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 */
 	percpu_down_write(&scx_fork_rwsem);
 
-	WARN_ON_ONCE(scx_ops_init_task_enabled);
-	scx_ops_init_task_enabled = true;
+	WARN_ON_ONCE(scx_init_task_enabled);
+	scx_init_task_enabled = true;
 
 	/*
 	 * Enable ops for every task. Fork is excluded by scx_fork_rwsem
@@ -5431,11 +5431,11 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 * tasks. Prep all tasks first and then enable them with preemption
 	 * disabled.
 	 *
-	 * All cgroups should be initialized before scx_ops_init_task() so that
-	 * the BPF scheduler can reliably track each task's cgroup membership
-	 * from scx_ops_init_task(). Lock out cgroup on/offlining and task
-	 * migrations while tasks are being initialized so that
-	 * scx_cgroup_can_attach() never sees uninitialized tasks.
+	 * All cgroups should be initialized before scx_init_task() so that the
+	 * BPF scheduler can reliably track each task's cgroup membership from
+	 * scx_init_task(). Lock out cgroup on/offlining and task migrations
+	 * while tasks are being initialized so that scx_cgroup_can_attach()
+	 * never sees uninitialized tasks.
 	 */
 	scx_cgroup_lock();
 	ret = scx_cgroup_init();
@@ -5454,7 +5454,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 		scx_task_iter_unlock(&sti);
 
-		ret = scx_ops_init_task(p, task_group(p), false);
+		ret = scx_init_task(p, task_group(p), false);
 		if (ret) {
 			put_task_struct(p);
 			scx_task_iter_relock(&sti);
@@ -5553,11 +5553,11 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 * wasn't already invoked and exit indicating success so that the error
 	 * is notified through ops.exit() with all the details.
 	 *
-	 * Flush scx_ops_disable_work to ensure that error is reported before
-	 * init completion.
+	 * Flush scx_disable_work to ensure that error is reported before init
+	 * completion.
 	 */
-	scx_error("scx_ops_enable() failed (%d)", ret);
-	kthread_flush_work(&scx_ops_disable_work);
+	scx_error("scx_enable() failed (%d)", ret);
+	kthread_flush_work(&scx_disable_work);
 	return 0;
 }
 
@@ -5701,13 +5701,13 @@ static int bpf_scx_check_member(const struct btf_type *t,
 
 static int bpf_scx_reg(void *kdata, struct bpf_link *link)
 {
-	return scx_ops_enable(kdata, link);
+	return scx_enable(kdata, link);
 }
 
 static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
 {
-	scx_ops_disable(SCX_EXIT_UNREG);
-	kthread_flush_work(&scx_ops_disable_work);
+	scx_disable(SCX_EXIT_UNREG);
+	kthread_flush_work(&scx_disable_work);
 }
 
 static int bpf_scx_init(struct btf *btf)
@@ -5830,7 +5830,7 @@ static struct bpf_struct_ops bpf_sched_ext_ops = {
 static void sysrq_handle_sched_ext_reset(u8 key)
 {
 	if (scx_helper)
-		scx_ops_disable(SCX_EXIT_SYSRQ);
+		scx_disable(SCX_EXIT_SYSRQ);
 	else
 		pr_info("sched_ext: BPF scheduler not yet used\n");
 }
-- 
2.49.0

