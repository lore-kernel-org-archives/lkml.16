Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80DC1DE8B6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720637; cv=none; b=qZwUopWJtD9fxQjm2uUF/lC7c+tBu1ty7TErb3dlwNjGqWKb73LKhbagK728nI0SIadC3wcRpylM7sOvt9juz6hFeHszqatNHmsqkZnT/JTQ1qUGdTPdSZ2k0gwt5BTgTj51syXqdFCK49eyCCvRhwvmOy/YoC6lmX54xZrdv+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720637; c=relaxed/simple;
	bh=b7/r7DaQ64jJMR6w3uxIgKltU/SSwzOt/EQiiofZm8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGFCCPu4imKS3y/jZqVlXRVfuQaerJ1TTBhpPh/8zr1diCC0f6Gw78oP1qhB9K3ycSB0dUtu0fNMidQxtT/D+I7fWS5DAhzZR5PSBes87pvN7HUMH+STownQg2A1GBXTF+ggao5aulwkWuLeyZNWC+3UB/rrgtz5bl/TDVAYSwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BluC2Cwh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BluC2Cwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19709C4CEEC;
	Thu,  3 Apr 2025 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743720637;
	bh=b7/r7DaQ64jJMR6w3uxIgKltU/SSwzOt/EQiiofZm8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BluC2Cwh8cbFOZgMElp9U9AIl2bYwQGB3xIQXWfuIKYvZH2KUEDgEMbsjjmyFTiQg
	 Ig74sYVuhlHuvVYWdfl2K4lYcSG2ZduL5d0Kgbt4OQnRxowMimql2T+6cSKcF94pxR
	 1csC1kgLB5oESwexJnpa3X4v1h8D2y1BC7UTCGhnI+d1VJ5ytU4JQFCgd+uMH5dxnE
	 5Np0oTMiSr+iIvYwSZM4plYlt2B18Z4faaOCqDoH0CghkuNLMy+ijLeeK9LUEFI/qu
	 1Q8U8lgEv2bCUtaiWYZ6Q20UPWNMpW+g2VkcQ+c1N1d12vvvJDYFmNws+i6ypUmr/F
	 um70/WPitP3YQ==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 4/5] sched_ext: Drop "ops" from scx_ops_exit(), scx_ops_error() and friends
Date: Thu,  3 Apr 2025 12:49:46 -1000
Message-ID: <20250403225026.838987-5-tj@kernel.org>
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

Drop "ops" from scx_ops_exit(), scx_ops_error() and friends.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c      | 175 +++++++++++++++++++---------------------
 kernel/sched/ext_idle.c |  20 ++---
 2 files changed, 93 insertions(+), 102 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index a837b24244a5..580e4ab33e8f 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -44,9 +44,9 @@ enum scx_exit_kind {
 };
 
 /*
- * An exit code can be specified when exiting with scx_bpf_exit() or
- * scx_ops_exit(), corresponding to exit_kind UNREG_BPF and UNREG_KERN
- * respectively. The codes are 64bit of the format:
+ * An exit code can be specified when exiting with scx_bpf_exit() or scx_exit(),
+ * corresponding to exit_kind UNREG_BPF and UNREG_KERN respectively. The codes
+ * are 64bit of the format:
  *
  *   Bits: [63  ..  48 47   ..  32 31 .. 0]
  *         [ SYS ACT ] [ SYS RSN ] [ USR  ]
@@ -947,7 +947,7 @@ static atomic_long_t scx_enable_seq = ATOMIC_LONG_INIT(0);
 /*
  * The maximum amount of time in jiffies that a task may be runnable without
  * being scheduled on a CPU. If this timeout is exceeded, it will trigger
- * scx_ops_error().
+ * scx_error().
  */
 static unsigned long scx_watchdog_timeout;
 
@@ -1043,18 +1043,17 @@ static struct kobject *scx_root_kobj;
 
 static void process_ddsp_deferred_locals(struct rq *rq);
 static void scx_bpf_kick_cpu(s32 cpu, u64 flags);
-static __printf(3, 4) void scx_ops_exit_kind(enum scx_exit_kind kind,
-					     s64 exit_code,
-					     const char *fmt, ...);
+static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
+				      const char *fmt, ...);
 
-#define scx_ops_error_kind(err, fmt, args...)					\
-	scx_ops_exit_kind((err), 0, fmt, ##args)
+#define __scx_error(err, fmt, args...)						\
+	__scx_exit((err), 0, fmt, ##args)
 
-#define scx_ops_exit(code, fmt, args...)					\
-	scx_ops_exit_kind(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
+#define scx_exit(code, fmt, args...)						\
+	__scx_exit(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
 
-#define scx_ops_error(fmt, args...)						\
-	scx_ops_error_kind(SCX_EXIT_ERROR, fmt, ##args)
+#define scx_error(fmt, args...)							\
+	__scx_error(SCX_EXIT_ERROR, fmt, ##args)
 
 #define SCX_HAS_OP(op)	static_branch_likely(&scx_has_op[SCX_OP_IDX(op)])
 
@@ -1187,8 +1186,8 @@ do {										\
 static __always_inline bool scx_kf_allowed(u32 mask)
 {
 	if (unlikely(!(current->scx.kf_mask & mask))) {
-		scx_ops_error("kfunc with mask 0x%x called from an operation only allowing 0x%x",
-			      mask, current->scx.kf_mask);
+		scx_error("kfunc with mask 0x%x called from an operation only allowing 0x%x",
+			  mask, current->scx.kf_mask);
 		return false;
 	}
 
@@ -1201,13 +1200,13 @@ static __always_inline bool scx_kf_allowed(u32 mask)
 	 */
 	if (unlikely(highest_bit(mask) == SCX_KF_CPU_RELEASE &&
 		     (current->scx.kf_mask & higher_bits(SCX_KF_CPU_RELEASE)))) {
-		scx_ops_error("cpu_release kfunc called from a nested operation");
+		scx_error("cpu_release kfunc called from a nested operation");
 		return false;
 	}
 
 	if (unlikely(highest_bit(mask) == SCX_KF_DISPATCH &&
 		     (current->scx.kf_mask & higher_bits(SCX_KF_DISPATCH)))) {
-		scx_ops_error("dispatch kfunc called from a nested operation");
+		scx_error("dispatch kfunc called from a nested operation");
 		return false;
 	}
 
@@ -1223,7 +1222,7 @@ static __always_inline bool scx_kf_allowed_on_arg_tasks(u32 mask,
 
 	if (unlikely((p != current->scx.kf_tasks[0] &&
 		      p != current->scx.kf_tasks[1]))) {
-		scx_ops_error("called on a task not being operated on");
+		scx_error("called on a task not being operated on");
 		return false;
 	}
 
@@ -1646,8 +1645,7 @@ static bool ops_cpu_valid(s32 cpu, const char *where)
 	if (likely(cpu >= 0 && cpu < nr_cpu_ids && cpu_possible(cpu))) {
 		return true;
 	} else {
-		scx_ops_error("invalid CPU %d%s%s", cpu,
-			      where ? " " : "", where ?: "");
+		scx_error("invalid CPU %d%s%s", cpu, where ? " " : "", where ?: "");
 		return false;
 	}
 }
@@ -1657,7 +1655,7 @@ static bool ops_cpu_valid(s32 cpu, const char *where)
  * @ops_name: operation to blame on failure
  * @err: -errno value to sanitize
  *
- * Verify @err is a valid -errno. If not, trigger scx_ops_error() and return
+ * Verify @err is a valid -errno. If not, trigger scx_error() and return
  * -%EPROTO. This is necessary because returning a rogue -errno up the chain can
  * cause misbehaviors. For an example, a large negative return from
  * ops.init_task() triggers an oops when passed up the call chain because the
@@ -1669,7 +1667,7 @@ static int ops_sanitize_err(const char *ops_name, s32 err)
 	if (err < 0 && err >= -MAX_ERRNO)
 		return err;
 
-	scx_ops_error("ops.%s() returned an invalid errno %d", ops_name, err);
+	scx_error("ops.%s() returned an invalid errno %d", ops_name, err);
 	return -EPROTO;
 }
 
@@ -1826,7 +1824,7 @@ static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
 	if (!is_local) {
 		raw_spin_lock(&dsq->lock);
 		if (unlikely(dsq->id == SCX_DSQ_INVALID)) {
-			scx_ops_error("attempting to dispatch to a destroyed dsq");
+			scx_error("attempting to dispatch to a destroyed dsq");
 			/* fall back to the global dsq */
 			raw_spin_unlock(&dsq->lock);
 			dsq = find_global_dsq(p);
@@ -1843,7 +1841,7 @@ static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
 		 * disallow any internal DSQ from doing vtime ordering of
 		 * tasks.
 		 */
-		scx_ops_error("cannot use vtime ordering for built-in DSQs");
+		scx_error("cannot use vtime ordering for built-in DSQs");
 		enq_flags &= ~SCX_ENQ_DSQ_PRIQ;
 	}
 
@@ -1857,8 +1855,8 @@ static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
 		 */
 		if (unlikely(RB_EMPTY_ROOT(&dsq->priq) &&
 			     nldsq_next_task(dsq, NULL, false)))
-			scx_ops_error("DSQ ID 0x%016llx already had FIFO-enqueued tasks",
-				      dsq->id);
+			scx_error("DSQ ID 0x%016llx already had FIFO-enqueued tasks",
+				  dsq->id);
 
 		p->scx.dsq_flags |= SCX_TASK_DSQ_ON_PRIQ;
 		rb_add(&p->scx.dsq_priq, &dsq->priq, scx_dsq_priq_less);
@@ -1879,8 +1877,8 @@ static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
 	} else {
 		/* a FIFO DSQ shouldn't be using PRIQ enqueuing */
 		if (unlikely(!RB_EMPTY_ROOT(&dsq->priq)))
-			scx_ops_error("DSQ ID 0x%016llx already had PRIQ-enqueued tasks",
-				      dsq->id);
+			scx_error("DSQ ID 0x%016llx already had PRIQ-enqueued tasks",
+				  dsq->id);
 
 		if (enq_flags & (SCX_ENQ_HEAD | SCX_ENQ_PREEMPT))
 			list_add(&p->scx.dsq_list.node, &dsq->list);
@@ -2018,8 +2016,8 @@ static struct scx_dispatch_q *find_dsq_for_dispatch(struct rq *rq, u64 dsq_id,
 		dsq = find_user_dsq(dsq_id);
 
 	if (unlikely(!dsq)) {
-		scx_ops_error("non-existent DSQ 0x%llx for %s[%d]",
-			      dsq_id, p->comm, p->pid);
+		scx_error("non-existent DSQ 0x%llx for %s[%d]",
+			  dsq_id, p->comm, p->pid);
 		return find_global_dsq(p);
 	}
 
@@ -2040,12 +2038,12 @@ static void mark_direct_dispatch(struct task_struct *ddsp_task,
 	/* @p must match the task on the enqueue path */
 	if (unlikely(p != ddsp_task)) {
 		if (IS_ERR(ddsp_task))
-			scx_ops_error("%s[%d] already direct-dispatched",
-				      p->comm, p->pid);
+			scx_error("%s[%d] already direct-dispatched",
+				  p->comm, p->pid);
 		else
-			scx_ops_error("scheduling for %s[%d] but trying to direct-dispatch %s[%d]",
-				      ddsp_task->comm, ddsp_task->pid,
-				      p->comm, p->pid);
+			scx_error("scheduling for %s[%d] but trying to direct-dispatch %s[%d]",
+				  ddsp_task->comm, ddsp_task->pid,
+				  p->comm, p->pid);
 		return;
 	}
 
@@ -2487,8 +2485,8 @@ static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
 	 */
 	if (unlikely(is_migration_disabled(p))) {
 		if (enforce)
-			scx_ops_error("SCX_DSQ_LOCAL[_ON] cannot move migration disabled %s[%d] from CPU %d to %d",
-				      p->comm, p->pid, task_cpu(p), cpu);
+			scx_error("SCX_DSQ_LOCAL[_ON] cannot move migration disabled %s[%d] from CPU %d to %d",
+				  p->comm, p->pid, task_cpu(p), cpu);
 		return false;
 	}
 
@@ -2500,8 +2498,8 @@ static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
 	 */
 	if (!task_allowed_on_cpu(p, cpu)) {
 		if (enforce)
-			scx_ops_error("SCX_DSQ_LOCAL[_ON] target CPU %d not allowed for %s[%d]",
-				      cpu, p->comm, p->pid);
+			scx_error("SCX_DSQ_LOCAL[_ON] target CPU %d not allowed for %s[%d]",
+				  cpu, p->comm, p->pid);
 		return false;
 	}
 
@@ -3447,9 +3445,9 @@ static void handle_hotplug(struct rq *rq, bool online)
 	else if (!online && SCX_HAS_OP(cpu_offline))
 		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, cpu);
 	else
-		scx_ops_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
-			     "cpu %d going %s, exiting scheduler", cpu,
-			     online ? "online" : "offline");
+		scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
+			 "cpu %d going %s, exiting scheduler", cpu,
+			 online ? "online" : "offline");
 }
 
 void scx_rq_activate(struct rq *rq)
@@ -3488,10 +3486,9 @@ static bool check_rq_for_timeouts(struct rq *rq)
 					last_runnable + scx_watchdog_timeout))) {
 			u32 dur_ms = jiffies_to_msecs(jiffies - last_runnable);
 
-			scx_ops_error_kind(SCX_EXIT_ERROR_STALL,
-					   "%s[%d] failed to run for %u.%03us",
-					   p->comm, p->pid,
-					   dur_ms / 1000, dur_ms % 1000);
+			__scx_error(SCX_EXIT_ERROR_STALL,
+				    "%s[%d] failed to run for %u.%03us",
+				    p->comm, p->pid, dur_ms / 1000, dur_ms % 1000);
 			timed_out = true;
 			break;
 		}
@@ -3529,9 +3526,9 @@ void scx_tick(struct rq *rq)
 				last_check + READ_ONCE(scx_watchdog_timeout)))) {
 		u32 dur_ms = jiffies_to_msecs(jiffies - last_check);
 
-		scx_ops_error_kind(SCX_EXIT_ERROR_STALL,
-				   "watchdog failed to check in for %u.%03us",
-				   dur_ms / 1000, dur_ms % 1000);
+		__scx_error(SCX_EXIT_ERROR_STALL,
+			    "watchdog failed to check in for %u.%03us",
+			    dur_ms / 1000, dur_ms % 1000);
 	}
 
 	update_other_load_avgs(rq);
@@ -3656,8 +3653,8 @@ static int scx_ops_init_task(struct task_struct *p, struct task_group *tg, bool
 
 			task_rq_unlock(rq, p, &rf);
 		} else if (p->policy == SCHED_EXT) {
-			scx_ops_error("ops.init_task() set task->scx.disallow for %s[%d] during fork",
-				      p->comm, p->pid);
+			scx_error("ops.init_task() set task->scx.disallow for %s[%d] during fork",
+				  p->comm, p->pid);
 		}
 	}
 
@@ -4203,8 +4200,8 @@ static void destroy_dsq(u64 dsq_id)
 	raw_spin_lock_irqsave(&dsq->lock, flags);
 
 	if (dsq->nr) {
-		scx_ops_error("attempting to destroy in-use dsq 0x%016llx (nr=%u)",
-			      dsq->id, dsq->nr);
+		scx_error("attempting to destroy in-use dsq 0x%016llx (nr=%u)",
+			  dsq->id, dsq->nr);
 		goto out_unlock_dsq;
 	}
 
@@ -4302,7 +4299,7 @@ static int scx_cgroup_init(void)
 				      css->cgroup, &args);
 		if (ret) {
 			css_put(css);
-			scx_ops_error("ops.cgroup_init() failed (%d)", ret);
+			scx_error("ops.cgroup_init() failed (%d)", ret);
 			return ret;
 		}
 		tg->scx_flags |= SCX_TG_INITED;
@@ -4486,8 +4483,7 @@ void scx_softlockup(u32 dur_s)
 	 */
 	atomic_inc(&scx_breather_depth);
 
-	scx_ops_error("soft lockup - CPU#%d stuck for %us",
-		      smp_processor_id(), dur_s);
+	scx_error("soft lockup - CPU#%d stuck for %us", smp_processor_id(), dur_s);
 }
 
 static void scx_clear_softlockup(void)
@@ -5153,7 +5149,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	spin_unlock_irqrestore(&dump_lock, flags);
 }
 
-static void scx_ops_error_irq_workfn(struct irq_work *irq_work)
+static void scx_error_irq_workfn(struct irq_work *irq_work)
 {
 	struct scx_exit_info *ei = scx_exit_info;
 
@@ -5163,11 +5159,10 @@ static void scx_ops_error_irq_workfn(struct irq_work *irq_work)
 	schedule_scx_ops_disable_work();
 }
 
-static DEFINE_IRQ_WORK(scx_ops_error_irq_work, scx_ops_error_irq_workfn);
+static DEFINE_IRQ_WORK(scx_error_irq_work, scx_error_irq_workfn);
 
-static __printf(3, 4) void scx_ops_exit_kind(enum scx_exit_kind kind,
-					     s64 exit_code,
-					     const char *fmt, ...)
+static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
+				      const char *fmt, ...)
 {
 	struct scx_exit_info *ei = scx_exit_info;
 	int none = SCX_EXIT_NONE;
@@ -5192,7 +5187,7 @@ static __printf(3, 4) void scx_ops_exit_kind(enum scx_exit_kind kind,
 	ei->kind = kind;
 	ei->reason = scx_exit_reason(ei->kind);
 
-	irq_work_queue(&scx_ops_error_irq_work);
+	irq_work_queue(&scx_error_irq_work);
 }
 
 static struct kthread_worker *scx_create_rt_helper(const char *name)
@@ -5217,9 +5212,9 @@ static void check_hotplug_seq(const struct sched_ext_ops *ops)
 	if (ops->hotplug_seq) {
 		global_hotplug_seq = atomic_long_read(&scx_hotplug_seq);
 		if (ops->hotplug_seq != global_hotplug_seq) {
-			scx_ops_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
-				     "expected hotplug seq %llu did not match actual %llu",
-				     ops->hotplug_seq, global_hotplug_seq);
+			scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
+				 "expected hotplug seq %llu did not match actual %llu",
+				 ops->hotplug_seq, global_hotplug_seq);
 		}
 	}
 }
@@ -5231,7 +5226,7 @@ static int validate_ops(const struct sched_ext_ops *ops)
 	 * ops.enqueue() callback isn't implemented.
 	 */
 	if ((ops->flags & SCX_OPS_ENQ_LAST) && !ops->enqueue) {
-		scx_ops_error("SCX_OPS_ENQ_LAST requires ops.enqueue() to be implemented");
+		scx_error("SCX_OPS_ENQ_LAST requires ops.enqueue() to be implemented");
 		return -EINVAL;
 	}
 
@@ -5241,7 +5236,7 @@ static int validate_ops(const struct sched_ext_ops *ops)
 	 */
 	if ((ops->flags & SCX_OPS_BUILTIN_IDLE_PER_NODE) &&
 	    (ops->update_idle && !(ops->flags & SCX_OPS_KEEP_BUILTIN_IDLE))) {
-		scx_ops_error("SCX_OPS_BUILTIN_IDLE_PER_NODE requires CPU idle selection enabled");
+		scx_error("SCX_OPS_BUILTIN_IDLE_PER_NODE requires CPU idle selection enabled");
 		return -EINVAL;
 	}
 
@@ -5359,7 +5354,7 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 		if (ret) {
 			ret = ops_sanitize_err("init", ret);
 			cpus_read_unlock();
-			scx_ops_error("ops.init() failed (%d)", ret);
+			scx_error("ops.init() failed (%d)", ret);
 			goto err_disable;
 		}
 	}
@@ -5464,8 +5459,8 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 			put_task_struct(p);
 			scx_task_iter_relock(&sti);
 			scx_task_iter_stop(&sti);
-			scx_ops_error("ops.init_task() failed (%d) for %s[%d]",
-				      ret, p->comm, p->pid);
+			scx_error("ops.init_task() failed (%d) for %s[%d]",
+				  ret, p->comm, p->pid);
 			goto err_disable_unlock_all;
 		}
 
@@ -5554,14 +5549,14 @@ static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	mutex_unlock(&scx_enable_mutex);
 	/*
 	 * Returning an error code here would not pass all the error information
-	 * to userspace. Record errno using scx_ops_error() for cases
-	 * scx_ops_error() wasn't already invoked and exit indicating success so
-	 * that the error is notified through ops.exit() with all the details.
+	 * to userspace. Record errno using scx_error() for cases scx_error()
+	 * wasn't already invoked and exit indicating success so that the error
+	 * is notified through ops.exit() with all the details.
 	 *
 	 * Flush scx_ops_disable_work to ensure that error is reported before
 	 * init completion.
 	 */
-	scx_ops_error("scx_ops_enable() failed (%d)", ret);
+	scx_error("scx_ops_enable() failed (%d)", ret);
 	kthread_flush_work(&scx_ops_disable_work);
 	return 0;
 }
@@ -6100,12 +6095,12 @@ static bool scx_dsq_insert_preamble(struct task_struct *p, u64 enq_flags)
 	lockdep_assert_irqs_disabled();
 
 	if (unlikely(!p)) {
-		scx_ops_error("called with NULL task");
+		scx_error("called with NULL task");
 		return false;
 	}
 
 	if (unlikely(enq_flags & __SCX_ENQ_INTERNAL_MASK)) {
-		scx_ops_error("invalid enq_flags 0x%llx", enq_flags);
+		scx_error("invalid enq_flags 0x%llx", enq_flags);
 		return false;
 	}
 
@@ -6125,7 +6120,7 @@ static void scx_dsq_insert_commit(struct task_struct *p, u64 dsq_id,
 	}
 
 	if (unlikely(dspc->cursor >= scx_dsp_max_batch)) {
-		scx_ops_error("dispatch buffer overflow");
+		scx_error("dispatch buffer overflow");
 		return;
 	}
 
@@ -6370,7 +6365,7 @@ __bpf_kfunc void scx_bpf_dispatch_cancel(void)
 	if (dspc->cursor > 0)
 		dspc->cursor--;
 	else
-		scx_ops_error("dispatch buffer underflow");
+		scx_error("dispatch buffer underflow");
 }
 
 /**
@@ -6399,7 +6394,7 @@ __bpf_kfunc bool scx_bpf_dsq_move_to_local(u64 dsq_id)
 
 	dsq = find_user_dsq(dsq_id);
 	if (unlikely(!dsq)) {
-		scx_ops_error("invalid DSQ ID 0x%016llx", dsq_id);
+		scx_error("invalid DSQ ID 0x%016llx", dsq_id);
 		return false;
 	}
 
@@ -6723,7 +6718,7 @@ __bpf_kfunc void scx_bpf_kick_cpu(s32 cpu, u64 flags)
 		struct rq *target_rq = cpu_rq(cpu);
 
 		if (unlikely(flags & (SCX_KICK_PREEMPT | SCX_KICK_WAIT)))
-			scx_ops_error("PREEMPT/WAIT cannot be used with SCX_KICK_IDLE");
+			scx_error("PREEMPT/WAIT cannot be used with SCX_KICK_IDLE");
 
 		if (raw_spin_rq_trylock(target_rq)) {
 			if (can_skip_idle_kick(target_rq)) {
@@ -6911,21 +6906,20 @@ static s32 __bstr_format(u64 *data_buf, char *line_buf, size_t line_size,
 
 	if (data__sz % 8 || data__sz > MAX_BPRINTF_VARARGS * 8 ||
 	    (data__sz && !data)) {
-		scx_ops_error("invalid data=%p and data__sz=%u",
-			      (void *)data, data__sz);
+		scx_error("invalid data=%p and data__sz=%u", (void *)data, data__sz);
 		return -EINVAL;
 	}
 
 	ret = copy_from_kernel_nofault(data_buf, data, data__sz);
 	if (ret < 0) {
-		scx_ops_error("failed to read data fields (%d)", ret);
+		scx_error("failed to read data fields (%d)", ret);
 		return ret;
 	}
 
 	ret = bpf_bprintf_prepare(fmt, UINT_MAX, data_buf, data__sz / 8,
 				  &bprintf_data);
 	if (ret < 0) {
-		scx_ops_error("format preparation failed (%d)", ret);
+		scx_error("format preparation failed (%d)", ret);
 		return ret;
 	}
 
@@ -6933,8 +6927,7 @@ static s32 __bstr_format(u64 *data_buf, char *line_buf, size_t line_size,
 			  bprintf_data.bin_args);
 	bpf_bprintf_cleanup(&bprintf_data);
 	if (ret < 0) {
-		scx_ops_error("(\"%s\", %p, %u) failed to format",
-			      fmt, data, data__sz);
+		scx_error("(\"%s\", %p, %u) failed to format", fmt, data, data__sz);
 		return ret;
 	}
 
@@ -6967,8 +6960,7 @@ __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt,
 
 	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
 	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
-		scx_ops_exit_kind(SCX_EXIT_UNREG_BPF, exit_code, "%s",
-				  scx_exit_bstr_buf.line);
+		__scx_exit(SCX_EXIT_UNREG_BPF, exit_code, "%s", scx_exit_bstr_buf.line);
 	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
 }
 
@@ -6988,8 +6980,7 @@ __bpf_kfunc void scx_bpf_error_bstr(char *fmt, unsigned long long *data,
 
 	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
 	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
-		scx_ops_exit_kind(SCX_EXIT_ERROR_BPF, 0, "%s",
-				  scx_exit_bstr_buf.line);
+		__scx_exit(SCX_EXIT_ERROR_BPF, 0, "%s", scx_exit_bstr_buf.line);
 	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
 }
 
@@ -7013,7 +7004,7 @@ __bpf_kfunc void scx_bpf_dump_bstr(char *fmt, unsigned long long *data,
 	s32 ret;
 
 	if (raw_smp_processor_id() != dd->cpu) {
-		scx_ops_error("scx_bpf_dump() must only be called from ops.dump() and friends");
+		scx_error("scx_bpf_dump() must only be called from ops.dump() and friends");
 		return;
 	}
 
@@ -7099,7 +7090,7 @@ __bpf_kfunc u32 scx_bpf_cpuperf_cur(s32 cpu)
 __bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
 {
 	if (unlikely(perf > SCX_CPUPERF_ONE)) {
-		scx_ops_error("Invalid cpuperf target %u for CPU %d", perf, cpu);
+		scx_error("Invalid cpuperf target %u for CPU %d", perf, cpu);
 		return;
 	}
 
diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index cb343ca889e0..cce2746f9f34 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -748,7 +748,7 @@ void scx_idle_disable(void)
 static int validate_node(int node)
 {
 	if (!static_branch_likely(&scx_builtin_idle_per_node)) {
-		scx_ops_error("per-node idle tracking is disabled");
+		scx_error("per-node idle tracking is disabled");
 		return -EOPNOTSUPP;
 	}
 
@@ -758,13 +758,13 @@ static int validate_node(int node)
 
 	/* Make sure node is in a valid range */
 	if (node < 0 || node >= nr_node_ids) {
-		scx_ops_error("invalid node %d", node);
+		scx_error("invalid node %d", node);
 		return -EINVAL;
 	}
 
 	/* Make sure the node is part of the set of possible nodes */
 	if (!node_possible(node)) {
-		scx_ops_error("unavailable node %d", node);
+		scx_error("unavailable node %d", node);
 		return -EINVAL;
 	}
 
@@ -778,7 +778,7 @@ static bool check_builtin_idle_enabled(void)
 	if (static_branch_likely(&scx_builtin_idle_enabled))
 		return true;
 
-	scx_ops_error("built-in idle tracking is disabled");
+	scx_error("built-in idle tracking is disabled");
 	return false;
 }
 
@@ -848,7 +848,7 @@ __bpf_kfunc s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu,
  *
  * Returns an empty cpumask if idle tracking is not enabled, if @node is
  * not valid, or running on a UP kernel. In this case the actual error will
- * be reported to the BPF scheduler via scx_ops_error().
+ * be reported to the BPF scheduler via scx_error().
  */
 __bpf_kfunc const struct cpumask *scx_bpf_get_idle_cpumask_node(int node)
 {
@@ -873,7 +873,7 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_cpumask_node(int node)
 __bpf_kfunc const struct cpumask *scx_bpf_get_idle_cpumask(void)
 {
 	if (static_branch_unlikely(&scx_builtin_idle_per_node)) {
-		scx_ops_error("SCX_OPS_BUILTIN_IDLE_PER_NODE enabled");
+		scx_error("SCX_OPS_BUILTIN_IDLE_PER_NODE enabled");
 		return cpu_none_mask;
 	}
 
@@ -895,7 +895,7 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_cpumask(void)
  *
  * Returns an empty cpumask if idle tracking is not enabled, if @node is
  * not valid, or running on a UP kernel. In this case the actual error will
- * be reported to the BPF scheduler via scx_ops_error().
+ * be reported to the BPF scheduler via scx_error().
  */
 __bpf_kfunc const struct cpumask *scx_bpf_get_idle_smtmask_node(int node)
 {
@@ -924,7 +924,7 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_smtmask_node(int node)
 __bpf_kfunc const struct cpumask *scx_bpf_get_idle_smtmask(void)
 {
 	if (static_branch_unlikely(&scx_builtin_idle_per_node)) {
-		scx_ops_error("SCX_OPS_BUILTIN_IDLE_PER_NODE enabled");
+		scx_error("SCX_OPS_BUILTIN_IDLE_PER_NODE enabled");
 		return cpu_none_mask;
 	}
 
@@ -1032,7 +1032,7 @@ __bpf_kfunc s32 scx_bpf_pick_idle_cpu(const struct cpumask *cpus_allowed,
 				      u64 flags)
 {
 	if (static_branch_maybe(CONFIG_NUMA, &scx_builtin_idle_per_node)) {
-		scx_ops_error("per-node idle tracking is enabled");
+		scx_error("per-node idle tracking is enabled");
 		return -EBUSY;
 	}
 
@@ -1109,7 +1109,7 @@ __bpf_kfunc s32 scx_bpf_pick_any_cpu(const struct cpumask *cpus_allowed,
 	s32 cpu;
 
 	if (static_branch_maybe(CONFIG_NUMA, &scx_builtin_idle_per_node)) {
-		scx_ops_error("per-node idle tracking is enabled");
+		scx_error("per-node idle tracking is enabled");
 		return -EBUSY;
 	}
 
-- 
2.49.0

