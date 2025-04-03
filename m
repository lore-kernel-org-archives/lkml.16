Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841311CDFAC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720635; cv=none; b=oNdvA007cUUclbDVlsREqMzYObGw+2ETn60xnwbs7gHIptYK1wJb1TnRy/bpLHJR+J8t20lvSi516gwTVL8CPc09QHdffwbUTVnqxkeEVe5rQbEvg8fY8bGpFZ6LWbbHXwIpDYTAZo4IgYwI7btRzyjkIppXLDSvsvC4IVSem4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720635; c=relaxed/simple;
	bh=BiQp5jjE7HbPFjcVTSHj/wwYyrJK8x5941YUevOD/dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PToZjI1BmMU/1aD6sJ4CiDHofjoWaJUIUioNtWV0AOmzldlAYYOYH2CM2Q5bYhXCd5Kh/3jq3wsdZtN+jdEw5PXDGYCWKOgD3YA4najHYa7gzZwt3qMIiToIwHPehEQ96CWcice/u58XuM3/gIAqkXrX2xED1/qHZBuYlKO7mWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmJIIXxK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmJIIXxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC1EC4CEE3;
	Thu,  3 Apr 2025 22:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743720634;
	bh=BiQp5jjE7HbPFjcVTSHj/wwYyrJK8x5941YUevOD/dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gmJIIXxKz3RVoBsJtBKzNCMzTdHaBOE/FQlv7dWv8GZCe2PDFkfX0Tiqs5rWszGON
	 l0SYWlenZC/fsMCk+bEyN9EdPSqAOfEiKp62ukyffM+5fyYNNCIyy39TdPgIvPc79H
	 qFN1HxmbI3Ro4+wK3aw79VL55W1+bYdNqu4J6Ox7RQj6rf5vavs1RtxGQ5DVez39pG
	 t9fMOiQIREykzSRM855VegtSdKkyt4x1wCsgFrmPz985nEiVJ19O2HssuKC/hlUic/
	 9JRs7MP2zaHQr/ffiB3csQHFhUJ/txbypvQ4KyvwLZ86SOOR/aALJY+NGTasQBbUO5
	 5k9YpCj004BGw==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 1/5] sched_ext: Drop "ops" from scx_ops_enable_state and friends
Date: Thu,  3 Apr 2025 12:49:43 -1000
Message-ID: <20250403225026.838987-2-tj@kernel.org>
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

Drop "ops" from scx_ops_enable_state and friends. Update scx_show_state.py
accordingly.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c                | 81 ++++++++++++++-----------------
 tools/sched_ext/scx_show_state.py |  8 +--
 2 files changed, 41 insertions(+), 48 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 66bcd40a28ca..07b07e89a578 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -838,18 +838,18 @@ enum scx_tg_flags {
 	SCX_TG_INITED		= 1U << 1,
 };
 
-enum scx_ops_enable_state {
-	SCX_OPS_ENABLING,
-	SCX_OPS_ENABLED,
-	SCX_OPS_DISABLING,
-	SCX_OPS_DISABLED,
+enum scx_enable_state {
+	SCX_ENABLING,
+	SCX_ENABLED,
+	SCX_DISABLING,
+	SCX_DISABLED,
 };
 
-static const char *scx_ops_enable_state_str[] = {
-	[SCX_OPS_ENABLING]	= "enabling",
-	[SCX_OPS_ENABLED]	= "enabled",
-	[SCX_OPS_DISABLING]	= "disabling",
-	[SCX_OPS_DISABLED]	= "disabled",
+static const char *scx_enable_state_str[] = {
+	[SCX_ENABLING]		= "enabling",
+	[SCX_ENABLED]		= "enabled",
+	[SCX_DISABLING]		= "disabling",
+	[SCX_DISABLED]		= "disabled",
 };
 
 /*
@@ -911,7 +911,7 @@ static struct kthread_worker *scx_ops_helper;
 static DEFINE_MUTEX(scx_ops_enable_mutex);
 DEFINE_STATIC_KEY_FALSE(__scx_ops_enabled);
 DEFINE_STATIC_PERCPU_RWSEM(scx_fork_rwsem);
-static atomic_t scx_ops_enable_state_var = ATOMIC_INIT(SCX_OPS_DISABLED);
+static atomic_t scx_enable_state_var = ATOMIC_INIT(SCX_DISABLED);
 static unsigned long scx_in_softlockup;
 static atomic_t scx_ops_breather_depth = ATOMIC_INIT(0);
 static int scx_ops_bypass_depth;
@@ -1592,23 +1592,22 @@ static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
 
 static void scx_bpf_events(struct scx_event_stats *events, size_t events__sz);
 
-static enum scx_ops_enable_state scx_ops_enable_state(void)
+static enum scx_enable_state scx_enable_state(void)
 {
-	return atomic_read(&scx_ops_enable_state_var);
+	return atomic_read(&scx_enable_state_var);
 }
 
-static enum scx_ops_enable_state
-scx_ops_set_enable_state(enum scx_ops_enable_state to)
+static enum scx_enable_state scx_set_enable_state(enum scx_enable_state to)
 {
-	return atomic_xchg(&scx_ops_enable_state_var, to);
+	return atomic_xchg(&scx_enable_state_var, to);
 }
 
-static bool scx_ops_tryset_enable_state(enum scx_ops_enable_state to,
-					enum scx_ops_enable_state from)
+static bool scx_tryset_enable_state(enum scx_enable_state to,
+				    enum scx_enable_state from)
 {
 	int from_v = from;
 
-	return atomic_try_cmpxchg(&scx_ops_enable_state_var, &from_v, to);
+	return atomic_try_cmpxchg(&scx_enable_state_var, &from_v, to);
 }
 
 static bool scx_rq_bypassing(struct rq *rq)
@@ -3283,7 +3282,7 @@ static struct task_struct *pick_task_scx(struct rq *rq)
 		 * Can happen while enabling as SCX_RQ_BAL_PENDING assertion is
 		 * conditional on scx_enabled() and may have been skipped.
 		 */
-		WARN_ON_ONCE(scx_ops_enable_state() == SCX_OPS_ENABLED);
+		WARN_ON_ONCE(scx_enable_state() == SCX_ENABLED);
 		keep_prev = false;
 	}
 
@@ -3904,8 +3903,7 @@ static bool cgroup_warned_missing_idle;
 
 static void scx_cgroup_warn_missing_weight(struct task_group *tg)
 {
-	if (scx_ops_enable_state() == SCX_OPS_DISABLED ||
-	    cgroup_warned_missing_weight)
+	if (scx_enable_state() == SCX_DISABLED || cgroup_warned_missing_weight)
 		return;
 
 	if ((scx_ops.flags & SCX_OPS_HAS_CGROUP_WEIGHT) || !tg->css.parent)
@@ -4339,8 +4337,7 @@ static int scx_cgroup_init(void) { return 0; }
 static ssize_t scx_attr_state_show(struct kobject *kobj,
 				   struct kobj_attribute *ka, char *buf)
 {
-	return sysfs_emit(buf, "%s\n",
-			  scx_ops_enable_state_str[scx_ops_enable_state()]);
+	return sysfs_emit(buf, "%s\n", scx_enable_state_str[scx_enable_state()]);
 }
 SCX_ATTR(state);
 
@@ -4449,8 +4446,7 @@ static const struct kset_uevent_ops scx_uevent_ops = {
  */
 bool task_should_scx(int policy)
 {
-	if (!scx_enabled() ||
-	    unlikely(scx_ops_enable_state() == SCX_OPS_DISABLING))
+	if (!scx_enabled() || unlikely(scx_enable_state() == SCX_DISABLING))
 		return false;
 	if (READ_ONCE(scx_switching_all))
 		return true;
@@ -4469,9 +4465,9 @@ bool task_should_scx(int policy)
  */
 void scx_softlockup(u32 dur_s)
 {
-	switch (scx_ops_enable_state()) {
-	case SCX_OPS_ENABLING:
-	case SCX_OPS_ENABLED:
+	switch (scx_enable_state()) {
+	case SCX_ENABLING:
+	case SCX_ENABLED:
 		break;
 	default:
 		return;
@@ -4698,15 +4694,14 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 	/* guarantee forward progress by bypassing scx_ops */
 	scx_ops_bypass(true);
 
-	switch (scx_ops_set_enable_state(SCX_OPS_DISABLING)) {
-	case SCX_OPS_DISABLING:
+	switch (scx_set_enable_state(SCX_DISABLING)) {
+	case SCX_DISABLING:
 		WARN_ONCE(true, "sched_ext: duplicate disabling instance?");
 		break;
-	case SCX_OPS_DISABLED:
+	case SCX_DISABLED:
 		pr_warn("sched_ext: ops error detected without ops (%s)\n",
 			scx_exit_info->msg);
-		WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_DISABLED) !=
-			     SCX_OPS_DISABLING);
+		WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
 		goto done;
 	default:
 		break;
@@ -4833,8 +4828,7 @@ static void scx_ops_disable_workfn(struct kthread_work *work)
 
 	mutex_unlock(&scx_ops_enable_mutex);
 
-	WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_DISABLED) !=
-		     SCX_OPS_DISABLING);
+	WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
 done:
 	scx_ops_bypass(false);
 }
@@ -5316,7 +5310,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		global_dsqs = dsqs;
 	}
 
-	if (scx_ops_enable_state() != SCX_OPS_DISABLED) {
+	if (scx_enable_state() != SCX_DISABLED) {
 		ret = -EBUSY;
 		goto err_unlock;
 	}
@@ -5344,8 +5338,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	 */
 	scx_ops = *ops;
 
-	WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_ENABLING) !=
-		     SCX_OPS_DISABLED);
+	WARN_ON_ONCE(scx_set_enable_state(SCX_ENABLING) != SCX_DISABLED);
 
 	atomic_set(&scx_exit_kind, SCX_EXIT_NONE);
 	scx_warned_zero_slice = false;
@@ -5525,7 +5518,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	scx_ops_bypass(false);
 
-	if (!scx_ops_tryset_enable_state(SCX_OPS_ENABLED, SCX_OPS_ENABLING)) {
+	if (!scx_tryset_enable_state(SCX_ENABLED, SCX_ENABLING)) {
 		WARN_ON_ONCE(atomic_read(&scx_exit_kind) == SCX_EXIT_NONE);
 		goto err_disable;
 	}
@@ -5994,13 +5987,13 @@ static void kick_cpus_irq_workfn(struct irq_work *irq_work)
  */
 void print_scx_info(const char *log_lvl, struct task_struct *p)
 {
-	enum scx_ops_enable_state state = scx_ops_enable_state();
+	enum scx_enable_state state = scx_enable_state();
 	const char *all = READ_ONCE(scx_switching_all) ? "+all" : "";
 	char runnable_at_buf[22] = "?";
 	struct sched_class *class;
 	unsigned long runnable_at;
 
-	if (state == SCX_OPS_DISABLED)
+	if (state == SCX_DISABLED)
 		return;
 
 	/*
@@ -6010,7 +6003,7 @@ void print_scx_info(const char *log_lvl, struct task_struct *p)
 	if (copy_from_kernel_nofault(&class, &p->sched_class, sizeof(class)) ||
 	    class != &ext_sched_class) {
 		printk("%sSched_ext: %s (%s%s)", log_lvl, scx_ops.name,
-		       scx_ops_enable_state_str[state], all);
+		       scx_enable_state_str[state], all);
 		return;
 	}
 
@@ -6021,7 +6014,7 @@ void print_scx_info(const char *log_lvl, struct task_struct *p)
 
 	/* print everything onto one line to conserve console space */
 	printk("%sSched_ext: %s (%s%s), task: runnable_at=%s",
-	       log_lvl, scx_ops.name, scx_ops_enable_state_str[state], all,
+	       log_lvl, scx_ops.name, scx_enable_state_str[state], all,
 	       runnable_at_buf);
 }
 
diff --git a/tools/sched_ext/scx_show_state.py b/tools/sched_ext/scx_show_state.py
index b800d4f5f2e9..9c658171c16b 100644
--- a/tools/sched_ext/scx_show_state.py
+++ b/tools/sched_ext/scx_show_state.py
@@ -24,17 +24,17 @@ import sys
 def read_static_key(name):
     return prog[name].key.enabled.counter.value_()
 
-def ops_state_str(state):
-    return prog['scx_ops_enable_state_str'][state].string_().decode()
+def state_str(state):
+    return prog['scx_enable_state_str'][state].string_().decode()
 
 ops = prog['scx_ops']
-enable_state = read_atomic("scx_ops_enable_state_var")
+enable_state = read_atomic("scx_enable_state_var")
 
 print(f'ops           : {ops.name.string_().decode()}')
 print(f'enabled       : {read_static_key("__scx_ops_enabled")}')
 print(f'switching_all : {read_int("scx_switching_all")}')
 print(f'switched_all  : {read_static_key("__scx_switched_all")}')
-print(f'enable_state  : {ops_state_str(enable_state)} ({enable_state})')
+print(f'enable_state  : {state_str(enable_state)} ({enable_state})')
 print(f'in_softlockup : {prog["scx_in_softlockup"].value_()}')
 print(f'breather_depth: {read_atomic("scx_ops_breather_depth")}')
 print(f'bypass_depth  : {prog["scx_ops_bypass_depth"].value_()}')
-- 
2.49.0

