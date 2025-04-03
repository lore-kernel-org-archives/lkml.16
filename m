Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFF81C8613
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720635; cv=none; b=BqnWgLOG20kSFTRpWuEB2OvGq6YddS2iGJgcmEJzjYa5ghToC4WdpeqZc3nMbuk+3grINkv9Hz3O8VdglWfa8vIJPhfiLmIjxCEmEGCP2A4v0lI4D0GIY3IcqjUA0ko9k7OJsbmNjRBWep6J+a6Qgksep5uUkhvvBBEEyZXrGK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720635; c=relaxed/simple;
	bh=e3PTII4fONMvjAuoGc88nz2i8pD4qQ7MvaDLqNiXFH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIZzBPn9yiRcNgYDSI/hMDW3C2vZCpTD1a6N51n5gdt41FxNfl9iommEZ86JelgGkePqOv9g5meeNEkHNfzvcOmCK9eL1OxKGF5Kn/LLV4XaT7cFzydZk/Kr4IZe5A7CGDDBpCkYPecrRSzJgoLe7vJX7EFxH6qNVp3dfeN+Ueg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8kw10Ky; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8kw10Ky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A9FC4CEE8;
	Thu,  3 Apr 2025 22:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743720635;
	bh=e3PTII4fONMvjAuoGc88nz2i8pD4qQ7MvaDLqNiXFH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H8kw10KyA/MauOrhLmueAqNLcKSvOJMfNQ/miNJLCbrHP41gSKPbt2ykidsZz3C19
	 MUDH5HCeC74AfJ/Svisit38r1TGR0gZJt6kHitG+8wKVVbuPQxDBKknMjYT/5KCEol
	 kneSwgZ60JkelixI3yphifhA1tIG2Vjhd/1Pf4BznyarTEJCi+6Sp0S6vJNTjOs1E4
	 HOxMNBP9ODlQ2YG9sriGjgM8tLIaVgqhwicm/HihvOWFleuJAm7fx/J0H74IEkduIG
	 iLIxTsdJmA6V+M8hSG8zdtpOlRjl89bdDmzaWCmjpXz7mRXR/q5a5LnbrKe4WVGMWk
	 qOnbSh3jnI+Bg==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 2/5] sched_ext: Drop "ops" from scx_ops_helper, scx_ops_enable_mutex and __scx_ops_enabled
Date: Thu,  3 Apr 2025 12:49:44 -1000
Message-ID: <20250403225026.838987-3-tj@kernel.org>
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

Drop "ops" from scx_ops_helper, scx_ops_enable_mutex and __scx_ops_enabled.
Update scx_show_state.py accordingly.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c                | 43 +++++++++++++++----------------
 kernel/sched/sched.h              |  4 +--
 tools/sched_ext/scx_show_state.py |  2 +-
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 07b07e89a578..51c875aee5ec 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -907,9 +907,9 @@ static DEFINE_SPINLOCK(scx_tasks_lock);
 static LIST_HEAD(scx_tasks);
 
 /* ops enable/disable */
-static struct kthread_worker *scx_ops_helper;
-static DEFINE_MUTEX(scx_ops_enable_mutex);
-DEFINE_STATIC_KEY_FALSE(__scx_ops_enabled);
+static struct kthread_worker *scx_helper;
+static DEFINE_MUTEX(scx_enable_mutex);
+DEFINE_STATIC_KEY_FALSE(__scx_enabled);
 DEFINE_STATIC_PERCPU_RWSEM(scx_fork_rwsem);
 static atomic_t scx_enable_state_var = ATOMIC_INIT(SCX_DISABLED);
 static unsigned long scx_in_softlockup;
@@ -4712,7 +4712,7 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 	 * we can safely use blocking synchronization constructs. Actually
 	 * disable ops.
 	 */
-	mutex_lock(&scx_ops_enable_mutex);
+	mutex_lock(&scx_enable_mutex);
 
 	static_branch_disable(&__scx_switched_all);
 	WRITE_ONCE(scx_switching_all, false);
@@ -4766,7 +4766,7 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 	}
 
 	/* no task is on scx, turn off all the switches and flush in-progress calls */
-	static_branch_disable(&__scx_ops_enabled);
+	static_branch_disable(&__scx_enabled);
 	for (i = SCX_OPI_BEGIN; i < SCX_OPI_END; i++)
 		static_branch_disable(&scx_has_op[i]);
 	static_branch_disable(&scx_ops_allow_queued_wakeup);
@@ -4826,7 +4826,7 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 	free_exit_info(scx_exit_info);
 	scx_exit_info = NULL;
 
-	mutex_unlock(&scx_ops_enable_mutex);
+	mutex_unlock(&scx_enable_mutex);
 
 	WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
 done:
@@ -4837,11 +4837,11 @@ static DEFINE_KTHREAD_WORK(scx_ops_disable_work, scx_ops_disable_workfn);
 
 static void schedule_scx_ops_disable_work(void)
 {
-	struct kthread_worker *helper = READ_ONCE(scx_ops_helper);
+	struct kthread_worker *helper = READ_ONCE(scx_helper);
 
 	/*
 	 * We may be called spuriously before the first bpf_sched_ext_reg(). If
-	 * scx_ops_helper isn't set up yet, there's nothing to do.
+	 * scx_helper isn't set up yet, there's nothing to do.
 	 */
 	if (helper)
 		kthread_queue_work(helper, &scx_ops_disable_work);
@@ -5262,7 +5262,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		return -EINVAL;
 	}
 
-	mutex_lock(&scx_ops_enable_mutex);
+	mutex_lock(&scx_enable_mutex);
 
 	/*
 	 * Clear event counters so a new scx scheduler gets
@@ -5273,10 +5273,9 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		memset(e, 0, sizeof(*e));
 	}
 
-	if (!scx_ops_helper) {
-		WRITE_ONCE(scx_ops_helper,
-			   scx_create_rt_helper("sched_ext_ops_helper"));
-		if (!scx_ops_helper) {
+	if (!scx_helper) {
+		WRITE_ONCE(scx_helper, scx_create_rt_helper("sched_ext_helper"));
+		if (!scx_helper) {
 			ret = -ENOMEM;
 			goto err_unlock;
 		}
@@ -5400,10 +5399,10 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 			   scx_watchdog_timeout / 2);
 
 	/*
-	 * Once __scx_ops_enabled is set, %current can be switched to SCX
-	 * anytime. This can lead to stalls as some BPF schedulers (e.g.
-	 * userspace scheduling) may not function correctly before all tasks are
-	 * switched. Init in bypass mode to guarantee forward progress.
+	 * Once __scx_enabled is set, %current can be switched to SCX anytime.
+	 * This can lead to stalls as some BPF schedulers (e.g. userspace
+	 * scheduling) may not function correctly before all tasks are switched.
+	 * Init in bypass mode to guarantee forward progress.
 	 */
 	scx_ops_bypass(true);
 
@@ -5485,7 +5484,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 * all eligible tasks.
 	 */
 	WRITE_ONCE(scx_switching_all, !(ops->flags & SCX_OPS_SWITCH_PARTIAL));
-	static_branch_enable(&__scx_ops_enabled);
+	static_branch_enable(&__scx_enabled);
 
 	/*
 	 * We're fully committed and can't fail. The task READY -> ENABLED
@@ -5529,7 +5528,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	pr_info("sched_ext: BPF scheduler \"%s\" enabled%s\n",
 		scx_ops.name, scx_switched_all() ? "" : " (partial)");
 	kobject_uevent(scx_root_kobj, KOBJ_ADD);
-	mutex_unlock(&scx_ops_enable_mutex);
+	mutex_unlock(&scx_enable_mutex);
 
 	atomic_long_inc(&scx_enable_seq);
 
@@ -5545,7 +5544,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		scx_exit_info = NULL;
 	}
 err_unlock:
-	mutex_unlock(&scx_ops_enable_mutex);
+	mutex_unlock(&scx_enable_mutex);
 	return ret;
 
 err_disable_unlock_all:
@@ -5553,7 +5552,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	percpu_up_write(&scx_fork_rwsem);
 	scx_ops_bypass(false);
 err_disable:
-	mutex_unlock(&scx_ops_enable_mutex);
+	mutex_unlock(&scx_enable_mutex);
 	/*
 	 * Returning an error code here would not pass all the error information
 	 * to userspace. Record errno using scx_ops_error() for cases
@@ -5836,7 +5835,7 @@ static struct bpf_struct_ops bpf_sched_ext_ops = {
 
 static void sysrq_handle_sched_ext_reset(u8 key)
 {
-	if (scx_ops_helper)
+	if (scx_helper)
 		scx_ops_disable(SCX_EXIT_SYSRQ);
 	else
 		pr_info("sched_ext: BPF scheduler not yet used\n");
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 47972f34ea70..ac07f64c8f39 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1717,10 +1717,10 @@ extern struct balance_callback balance_push_callback;
 #ifdef CONFIG_SCHED_CLASS_EXT
 extern const struct sched_class ext_sched_class;
 
-DECLARE_STATIC_KEY_FALSE(__scx_ops_enabled);	/* SCX BPF scheduler loaded */
+DECLARE_STATIC_KEY_FALSE(__scx_enabled);	/* SCX BPF scheduler loaded */
 DECLARE_STATIC_KEY_FALSE(__scx_switched_all);	/* all fair class tasks on SCX */
 
-#define scx_enabled()		static_branch_unlikely(&__scx_ops_enabled)
+#define scx_enabled()		static_branch_unlikely(&__scx_enabled)
 #define scx_switched_all()	static_branch_unlikely(&__scx_switched_all)
 
 static inline void scx_rq_clock_update(struct rq *rq, u64 clock)
diff --git a/tools/sched_ext/scx_show_state.py b/tools/sched_ext/scx_show_state.py
index 9c658171c16b..d3c81b92248a 100644
--- a/tools/sched_ext/scx_show_state.py
+++ b/tools/sched_ext/scx_show_state.py
@@ -31,7 +31,7 @@ ops = prog['scx_ops']
 enable_state = read_atomic("scx_enable_state_var")
 
 print(f'ops           : {ops.name.string_().decode()}')
-print(f'enabled       : {read_static_key("__scx_ops_enabled")}')
+print(f'enabled       : {read_static_key("__scx_enabled")}')
 print(f'switching_all : {read_int("scx_switching_all")}')
 print(f'switched_all  : {read_static_key("__scx_switched_all")}')
 print(f'enable_state  : {state_str(enable_state)} ({enable_state})')
-- 
2.49.0

