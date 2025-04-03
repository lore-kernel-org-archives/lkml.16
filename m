Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511F21DB128
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720636; cv=none; b=Z8GFp16PGZ4W+8k2a1yI83U61DVpvBTXZPmIrzVyckCUOqZqJzb5CM3rYEeJapMxqjYkWfhOPGAfvJtuGZuMx5DqeS9ua5GmNo3oF5+v/AmbSXWuojDt4bpPL7+cdg1CToQZBzSZLEamWKXBg6+iPEo3rvfBT54+haErknBCjaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720636; c=relaxed/simple;
	bh=tnkhR4AjuZtNa1tFBwycGb/O9DZrGh6UGyCMwNvt0H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvvFIUIoTv14YuysAtJC8vaC5JxF+MU8+mtChrKgLKZ65FrLgOXPU/y+tbd/UUrN39jPvuN4i+6umF/LkH7mr+jQW4VD+liKeY9MNHNGDMQ6fYOE7HoqROdcX5vVDmcCb0dAaFqHjafp+iS3HsB5aR/fBGhcQvGzZfkvYvS3oqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hM6LClTB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hM6LClTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0762CC4CEE3;
	Thu,  3 Apr 2025 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743720636;
	bh=tnkhR4AjuZtNa1tFBwycGb/O9DZrGh6UGyCMwNvt0H8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hM6LClTBNeYm4K65DrR6SEaOQoCfnb/Xd3SNsU4ISsAb6hR5GOC/Zl0c9zPhV5PNH
	 w+JgHnbGbR+G0SHc7Ws03N6uxjuenU1ZeWOm8UwgqRvbOkJdkjGR+Cc9VA1b0MHDIk
	 sYJSi2RiQzv+XPDq+mmql0l7ewTbCvGryOHrNOxxt8adB0zLXQ4hA3cYWJ+zY2FLEu
	 fegn5NPtsAfv9/156MhrSi/7RMi6AAwGcYxi4cma54E7DU6WdvBm1RCr/pXGdDOxx5
	 DrFD9z8yZ6vCLIPXXKOrXmhRP7GFjRvnGvJ02qf1NAF5WhSRiONRhFiGjAnZ7hxI35
	 4wYcybBwFi1cg==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 3/5] sched_ext: Drop "ops" from scx_ops_bypass(), scx_ops_breather() and friends
Date: Thu,  3 Apr 2025 12:49:45 -1000
Message-ID: <20250403225026.838987-4-tj@kernel.org>
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

Drop "ops" from scx_ops_bypass(), scx_ops_breather() and friends. Update
scx_show_state.py accordingly.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c                | 69 +++++++++++++++----------------
 tools/sched_ext/scx_show_state.py |  4 +-
 2 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 51c875aee5ec..a837b24244a5 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -913,8 +913,8 @@ DEFINE_STATIC_KEY_FALSE(__scx_enabled);
 DEFINE_STATIC_PERCPU_RWSEM(scx_fork_rwsem);
 static atomic_t scx_enable_state_var = ATOMIC_INIT(SCX_DISABLED);
 static unsigned long scx_in_softlockup;
-static atomic_t scx_ops_breather_depth = ATOMIC_INIT(0);
-static int scx_ops_bypass_depth;
+static atomic_t scx_breather_depth = ATOMIC_INIT(0);
+static int scx_bypass_depth;
 static bool scx_ops_init_task_enabled;
 static bool scx_switching_all;
 DEFINE_STATIC_KEY_FALSE(__scx_switched_all);
@@ -2223,7 +2223,7 @@ static void set_task_runnable(struct rq *rq, struct task_struct *p)
 	}
 
 	/*
-	 * list_add_tail() must be used. scx_ops_bypass() depends on tasks being
+	 * list_add_tail() must be used. scx_bypass() depends on tasks being
 	 * appended to the runnable_list.
 	 */
 	list_add_tail(&p->scx.runnable_node, &rq->scx.runnable_list);
@@ -2657,13 +2657,13 @@ static struct rq *move_task_between_dsqs(struct task_struct *p, u64 enq_flags,
  * to the bypass mode can take a long time. Inject artificial delays while the
  * bypass mode is switching to guarantee timely completion.
  */
-static void scx_ops_breather(struct rq *rq)
+static void scx_breather(struct rq *rq)
 {
 	u64 until;
 
 	lockdep_assert_rq_held(rq);
 
-	if (likely(!atomic_read(&scx_ops_breather_depth)))
+	if (likely(!atomic_read(&scx_breather_depth)))
 		return;
 
 	raw_spin_rq_unlock(rq);
@@ -2672,9 +2672,9 @@ static void scx_ops_breather(struct rq *rq)
 
 	do {
 		int cnt = 1024;
-		while (atomic_read(&scx_ops_breather_depth) && --cnt)
+		while (atomic_read(&scx_breather_depth) && --cnt)
 			cpu_relax();
-	} while (atomic_read(&scx_ops_breather_depth) &&
+	} while (atomic_read(&scx_breather_depth) &&
 		 time_before64(ktime_get_ns(), until));
 
 	raw_spin_rq_lock(rq);
@@ -2685,12 +2685,12 @@ static bool consume_dispatch_q(struct rq *rq, struct scx_dispatch_q *dsq)
 	struct task_struct *p;
 retry:
 	/*
-	 * This retry loop can repeatedly race against scx_ops_bypass()
-	 * dequeueing tasks from @dsq trying to put the system into the bypass
-	 * mode. On some multi-socket machines (e.g. 2x Intel 8480c), this can
-	 * live-lock the machine into soft lockups. Give a breather.
+	 * This retry loop can repeatedly race against scx_bypass() dequeueing
+	 * tasks from @dsq trying to put the system into the bypass mode. On
+	 * some multi-socket machines (e.g. 2x Intel 8480c), this can live-lock
+	 * the machine into soft lockups. Give a breather.
 	 */
-	scx_ops_breather(rq);
+	scx_breather(rq);
 
 	/*
 	 * The caller can't expect to successfully consume a task if the task's
@@ -4473,7 +4473,7 @@ void scx_softlockup(u32 dur_s)
 		return;
 	}
 
-	/* allow only one instance, cleared at the end of scx_ops_bypass() */
+	/* allow only one instance, cleared at the end of scx_bypass() */
 	if (test_and_set_bit(0, &scx_in_softlockup))
 		return;
 
@@ -4482,10 +4482,9 @@ void scx_softlockup(u32 dur_s)
 
 	/*
 	 * Some CPUs may be trapped in the dispatch paths. Enable breather
-	 * immediately; otherwise, we might even be able to get to
-	 * scx_ops_bypass().
+	 * immediately; otherwise, we might even be able to get to scx_bypass().
 	 */
-	atomic_inc(&scx_ops_breather_depth);
+	atomic_inc(&scx_breather_depth);
 
 	scx_ops_error("soft lockup - CPU#%d stuck for %us",
 		      smp_processor_id(), dur_s);
@@ -4494,11 +4493,11 @@ void scx_softlockup(u32 dur_s)
 static void scx_clear_softlockup(void)
 {
 	if (test_and_clear_bit(0, &scx_in_softlockup))
-		atomic_dec(&scx_ops_breather_depth);
+		atomic_dec(&scx_breather_depth);
 }
 
 /**
- * scx_ops_bypass - [Un]bypass scx_ops and guarantee forward progress
+ * scx_bypass - [Un]bypass scx_ops and guarantee forward progress
  * @bypass: true for bypass, false for unbypass
  *
  * Bypassing guarantees that all runnable tasks make forward progress without
@@ -4528,7 +4527,7 @@ static void scx_clear_softlockup(void)
  *
  * - scx_prio_less() reverts to the default core_sched_at order.
  */
-static void scx_ops_bypass(bool bypass)
+static void scx_bypass(bool bypass)
 {
 	static DEFINE_RAW_SPINLOCK(bypass_lock);
 	static unsigned long bypass_timestamp;
@@ -4538,22 +4537,22 @@ static void scx_ops_bypass(bool bypass)
 
 	raw_spin_lock_irqsave(&bypass_lock, flags);
 	if (bypass) {
-		scx_ops_bypass_depth++;
-		WARN_ON_ONCE(scx_ops_bypass_depth <= 0);
-		if (scx_ops_bypass_depth != 1)
+		scx_bypass_depth++;
+		WARN_ON_ONCE(scx_bypass_depth <= 0);
+		if (scx_bypass_depth != 1)
 			goto unlock;
 		bypass_timestamp = ktime_get_ns();
 		scx_add_event(SCX_EV_BYPASS_ACTIVATE, 1);
 	} else {
-		scx_ops_bypass_depth--;
-		WARN_ON_ONCE(scx_ops_bypass_depth < 0);
-		if (scx_ops_bypass_depth != 0)
+		scx_bypass_depth--;
+		WARN_ON_ONCE(scx_bypass_depth < 0);
+		if (scx_bypass_depth != 0)
 			goto unlock;
 		scx_add_event(SCX_EV_BYPASS_DURATION,
 			      ktime_get_ns() - bypass_timestamp);
 	}
 
-	atomic_inc(&scx_ops_breather_depth);
+	atomic_inc(&scx_breather_depth);
 
 	/*
 	 * No task property is changing. We just need to make sure all currently
@@ -4611,7 +4610,7 @@ static void scx_ops_bypass(bool bypass)
 		raw_spin_rq_unlock(rq);
 	}
 
-	atomic_dec(&scx_ops_breather_depth);
+	atomic_dec(&scx_breather_depth);
 unlock:
 	raw_spin_unlock_irqrestore(&bypass_lock, flags);
 	scx_clear_softlockup();
@@ -4692,7 +4691,7 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 	ei->reason = scx_exit_reason(ei->kind);
 
 	/* guarantee forward progress by bypassing scx_ops */
-	scx_ops_bypass(true);
+	scx_bypass(true);
 
 	switch (scx_set_enable_state(SCX_DISABLING)) {
 	case SCX_DISABLING:
@@ -4830,7 +4829,7 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 
 	WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
 done:
-	scx_ops_bypass(false);
+	scx_bypass(false);
 }
 
 static DEFINE_KTHREAD_WORK(scx_ops_disable_work, scx_ops_disable_workfn);
@@ -5404,7 +5403,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 * scheduling) may not function correctly before all tasks are switched.
 	 * Init in bypass mode to guarantee forward progress.
 	 */
-	scx_ops_bypass(true);
+	scx_bypass(true);
 
 	for (i = SCX_OPI_NORMAL_BEGIN; i < SCX_OPI_NORMAL_END; i++)
 		if (((void (**)(void))ops)[i])
@@ -5515,7 +5514,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	scx_task_iter_stop(&sti);
 	percpu_up_write(&scx_fork_rwsem);
 
-	scx_ops_bypass(false);
+	scx_bypass(false);
 
 	if (!scx_tryset_enable_state(SCX_ENABLED, SCX_ENABLING)) {
 		WARN_ON_ONCE(atomic_read(&scx_exit_kind) == SCX_EXIT_NONE);
@@ -5550,7 +5549,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 err_disable_unlock_all:
 	scx_cgroup_unlock();
 	percpu_up_write(&scx_fork_rwsem);
-	scx_ops_bypass(false);
+	scx_bypass(false);
 err_disable:
 	mutex_unlock(&scx_enable_mutex);
 	/*
@@ -6029,12 +6028,12 @@ static int scx_pm_handler(struct notifier_block *nb, unsigned long event, void *
 	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
 	case PM_RESTORE_PREPARE:
-		scx_ops_bypass(true);
+		scx_bypass(true);
 		break;
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
 	case PM_POST_RESTORE:
-		scx_ops_bypass(false);
+		scx_bypass(false);
 		break;
 	}
 
@@ -6292,7 +6291,7 @@ static bool scx_dsq_move(struct bpf_iter_scx_dsq_kern *kit,
 	 * cause similar live-lock conditions as consume_dispatch_q(). Insert a
 	 * breather if necessary.
 	 */
-	scx_ops_breather(src_rq);
+	scx_breather(src_rq);
 
 	locked_rq = src_rq;
 	raw_spin_lock(&src_dsq->lock);
diff --git a/tools/sched_ext/scx_show_state.py b/tools/sched_ext/scx_show_state.py
index d3c81b92248a..7cdcc6729ea4 100644
--- a/tools/sched_ext/scx_show_state.py
+++ b/tools/sched_ext/scx_show_state.py
@@ -36,7 +36,7 @@ print(f'switching_all : {read_int("scx_switching_all")}')
 print(f'switched_all  : {read_static_key("__scx_switched_all")}')
 print(f'enable_state  : {state_str(enable_state)} ({enable_state})')
 print(f'in_softlockup : {prog["scx_in_softlockup"].value_()}')
-print(f'breather_depth: {read_atomic("scx_ops_breather_depth")}')
-print(f'bypass_depth  : {prog["scx_ops_bypass_depth"].value_()}')
+print(f'breather_depth: {read_atomic("scx_breather_depth")}')
+print(f'bypass_depth  : {prog["scx_bypass_depth"].value_()}')
 print(f'nr_rejected   : {read_atomic("scx_nr_rejected")}')
 print(f'enable_seq    : {read_atomic("scx_enable_seq")}')
-- 
2.49.0

