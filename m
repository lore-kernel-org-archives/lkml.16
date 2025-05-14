Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6520165EFC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747198203; cv=none; b=WiWK04dqbKaj9uPqXzhDD/DrLpU/ru5xGWD3SpVib7acvVzpjtTgadd/k3TSLOe9QIws1WDjmMdiMP1G2qqVu8YvlmvOfRjILJ0LgOR70QB1csQprCDYAOA5+imgj1jtGT6Q+g1Y5xgR00jPRcsfAOzscCCnVF2CJ5EWFQvvpwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747198203; c=relaxed/simple;
	bh=+tLWkEJn6RY341dsZHxLUMWh34xm/sI8O8ISXwkD8Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sq/kVngIG9Sk1q0oMI8ucHZkp3heyBnIrMf93eWDZ/H3B8nazTblT/MJRoKZcEknnQpF0gJBjw/8YkEvGK0o5Cvm5bbGlMYa2NNUpV8RkIcm4mFqQCVCrXLnakwbO6IZ4QtZicfejHo2sNUCDP+1hw7pmMosqaO/MlUsDir7OOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gyv6MVKx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gyv6MVKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5465C4CEEF;
	Wed, 14 May 2025 04:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747198203;
	bh=+tLWkEJn6RY341dsZHxLUMWh34xm/sI8O8ISXwkD8Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gyv6MVKx8O8s9ym+YyOwlTLZ35D6Po0DXuBRUslIETYqH3gliI/4NloqCGF6rYefQ
	 35IVNlNl/SF5Ra7ZuxxYPHMGJ1oBGpkQotzbj0bvXIbHVuhjbEBCy70UK3zRdm3fxa
	 hllc8T8UHyFr1JwK1iaaKjIRHymQCH6Jy1bW7bNPZRtn4wiZYpYttFr//dlM03Zs3q
	 kcq9x8wiApXzjtJ+dub0MRHmk8OZChjhCCFwas6Iocisw48gHUjDJ4eek+U3wSsTdY
	 sXRGyWEiB8hV85uUCIhap36RWOyA9858ixlqtSsqDpYdfnZShgkVL+x+bVBZKD/0RQ
	 FYi+Nl3u2IwqA==
Date: Wed, 14 May 2025 00:50:01 -0400
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4 sched_ext/for-6.16] sched_ext: Add @sch to SCX_CALL_OP*()
Message-ID: <aCQg-YetkU2W0nPS@mtj.duckdns.org>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
 <aCQgqDY02LgevzFP@mtj.duckdns.org>
 <aCQg1Zg4Gkc-n1q5@mtj.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCQg1Zg4Gkc-n1q5@mtj.duckdns.org>

In preparation of hierarchical scheduling support, add @sch to scx_exit()
and friends:

- scx_exit/error() updated to take explicit @sch instead of assuming
  scx_root.

- scx_kf_exit/error() added. These are to be used from kfuncs, don't take
  @sch and internally determine the scx_sched instance to abort. Currently,
  it's always scx_root but once multiple scheduler support is in place, it
  will be the scx_sched instance that invoked the kfunc. This simplifies
  many callsites and defers scx_sched lookup until error is triggered.

- @sch is propagated to ops_cpu_valid() and ops_sanitize_err(). The CPU
  validity conditions in ops_cpu_valid() are factored into __cpu_valid() to
  implement kf_cpu_valid() which is the counterpart to scx_kf_exit/error().

- All users are converted. Most conversions are straightforward.
  check_rq_for_timeouts() and scx_softlockup() are updated to use explicit
  rcu_dereference*(scx_root) for safety as they may execute asynchronous to
  the exit path. scx_tick() is also updated to use rcu_dereference(). While
  not strictly necessary due to the preceding scx_enabled() test and IRQ
  disabled context, this removes the subtlety at no noticeable cost.

No behavior changes intended.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c      |  284 +++++++++++++++++++++++++++++-------------------
 kernel/sched/ext_idle.c |   24 ++--
 2 files changed, 187 insertions(+), 121 deletions(-)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1136,20 +1136,38 @@ static struct kset *scx_kset;
 
 static void process_ddsp_deferred_locals(struct rq *rq);
 static void scx_bpf_kick_cpu(s32 cpu, u64 flags);
-static void scx_vexit(enum scx_exit_kind kind, s64 exit_code, const char *fmt,
-		      va_list args);
+static void scx_vexit(struct scx_sched *sch, enum scx_exit_kind kind,
+		      s64 exit_code, const char *fmt, va_list args);
 
-static __printf(3, 4) void scx_exit(enum scx_exit_kind kind, s64 exit_code,
+static __printf(4, 5) void scx_exit(struct scx_sched *sch,
+				    enum scx_exit_kind kind, s64 exit_code,
 				    const char *fmt, ...)
 {
 	va_list args;
 
 	va_start(args, fmt);
-	scx_vexit(kind, exit_code, fmt, args);
+	scx_vexit(sch, kind, exit_code, fmt, args);
 	va_end(args);
 }
 
-#define scx_error(fmt, args...)		scx_exit(SCX_EXIT_ERROR, 0, fmt, ##args)
+static __printf(3, 4) void scx_kf_exit(enum scx_exit_kind kind, s64 exit_code,
+				       const char *fmt, ...)
+{
+	struct scx_sched *sch;
+	va_list args;
+
+	rcu_read_lock();
+	sch = rcu_dereference(scx_root);
+	if (sch) {
+		va_start(args, fmt);
+		scx_vexit(sch, kind, exit_code, fmt, args);
+		va_end(args);
+	}
+	rcu_read_unlock();
+}
+
+#define scx_error(sch, fmt, args...)	scx_exit((sch), SCX_EXIT_ERROR, 0, fmt, ##args)
+#define scx_kf_error(fmt, args...)	scx_kf_exit(SCX_EXIT_ERROR, 0, fmt, ##args)
 
 #define SCX_HAS_OP(sch, op)	test_bit(SCX_OP_IDX(op), (sch)->has_op)
 
@@ -1318,8 +1336,8 @@ do {										\
 static __always_inline bool scx_kf_allowed(u32 mask)
 {
 	if (unlikely(!(current->scx.kf_mask & mask))) {
-		scx_error("kfunc with mask 0x%x called from an operation only allowing 0x%x",
-			  mask, current->scx.kf_mask);
+		scx_kf_error("kfunc with mask 0x%x called from an operation only allowing 0x%x",
+			     mask, current->scx.kf_mask);
 		return false;
 	}
 
@@ -1332,13 +1350,13 @@ static __always_inline bool scx_kf_allow
 	 */
 	if (unlikely(highest_bit(mask) == SCX_KF_CPU_RELEASE &&
 		     (current->scx.kf_mask & higher_bits(SCX_KF_CPU_RELEASE)))) {
-		scx_error("cpu_release kfunc called from a nested operation");
+		scx_kf_error("cpu_release kfunc called from a nested operation");
 		return false;
 	}
 
 	if (unlikely(highest_bit(mask) == SCX_KF_DISPATCH &&
 		     (current->scx.kf_mask & higher_bits(SCX_KF_DISPATCH)))) {
-		scx_error("dispatch kfunc called from a nested operation");
+		scx_kf_error("dispatch kfunc called from a nested operation");
 		return false;
 	}
 
@@ -1354,7 +1372,7 @@ static __always_inline bool scx_kf_allow
 
 	if (unlikely((p != current->scx.kf_tasks[0] &&
 		      p != current->scx.kf_tasks[1]))) {
-		scx_error("called on a task not being operated on");
+		scx_kf_error("called on a task not being operated on");
 		return false;
 	}
 
@@ -1702,8 +1720,14 @@ static void wait_ops_state(struct task_s
 	} while (atomic_long_read_acquire(&p->scx.ops_state) == opss);
 }
 
+static inline bool __cpu_valid(s32 cpu)
+{
+	return likely(cpu >= 0 && cpu < nr_cpu_ids && cpu_possible(cpu));
+}
+
 /**
- * ops_cpu_valid - Verify a cpu number
+ * ops_cpu_valid - Verify a cpu number, to be used on ops input args
+ * @sch: scx_sched to abort on error
  * @cpu: cpu number which came from a BPF ops
  * @where: extra information reported on error
  *
@@ -1711,18 +1735,36 @@ static void wait_ops_state(struct task_s
  * Verify that it is in range and one of the possible cpus. If invalid, trigger
  * an ops error.
  */
-static bool ops_cpu_valid(s32 cpu, const char *where)
+static bool ops_cpu_valid(struct scx_sched *sch, s32 cpu, const char *where)
+{
+	if (__cpu_valid(cpu)) {
+		return true;
+	} else {
+		scx_error(sch, "invalid CPU %d%s%s", cpu, where ? " " : "", where ?: "");
+		return false;
+	}
+}
+
+/**
+ * kf_cpu_valid - Verify a CPU number, to be used on kfunc input args
+ * @cpu: cpu number which came from a BPF ops
+ * @where: extra information reported on error
+ *
+ * The same as ops_cpu_valid() but @sch is implicit.
+ */
+static bool kf_cpu_valid(u32 cpu, const char *where)
 {
-	if (likely(cpu >= 0 && cpu < nr_cpu_ids && cpu_possible(cpu))) {
+	if (__cpu_valid(cpu)) {
 		return true;
 	} else {
-		scx_error("invalid CPU %d%s%s", cpu, where ? " " : "", where ?: "");
+		scx_kf_error("invalid CPU %d%s%s", cpu, where ? " " : "", where ?: "");
 		return false;
 	}
 }
 
 /**
  * ops_sanitize_err - Sanitize a -errno value
+ * @sch: scx_sched to error out on error
  * @ops_name: operation to blame on failure
  * @err: -errno value to sanitize
  *
@@ -1733,12 +1775,12 @@ static bool ops_cpu_valid(s32 cpu, const
  * value fails IS_ERR() test after being encoded with ERR_PTR() and then is
  * handled as a pointer.
  */
-static int ops_sanitize_err(const char *ops_name, s32 err)
+static int ops_sanitize_err(struct scx_sched *sch, const char *ops_name, s32 err)
 {
 	if (err < 0 && err >= -MAX_ERRNO)
 		return err;
 
-	scx_error("ops.%s() returned an invalid errno %d", ops_name, err);
+	scx_error(sch, "ops.%s() returned an invalid errno %d", ops_name, err);
 	return -EPROTO;
 }
 
@@ -1889,8 +1931,8 @@ static void refill_task_slice_dfl(struct
 	__scx_add_event(scx_root, SCX_EV_REFILL_SLICE_DFL, 1);
 }
 
-static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
-			     u64 enq_flags)
+static void dispatch_enqueue(struct scx_sched *sch, struct scx_dispatch_q *dsq,
+			     struct task_struct *p, u64 enq_flags)
 {
 	bool is_local = dsq->id == SCX_DSQ_LOCAL;
 
@@ -1901,7 +1943,7 @@ static void dispatch_enqueue(struct scx_
 	if (!is_local) {
 		raw_spin_lock(&dsq->lock);
 		if (unlikely(dsq->id == SCX_DSQ_INVALID)) {
-			scx_error("attempting to dispatch to a destroyed dsq");
+			scx_error(sch, "attempting to dispatch to a destroyed dsq");
 			/* fall back to the global dsq */
 			raw_spin_unlock(&dsq->lock);
 			dsq = find_global_dsq(p);
@@ -1918,7 +1960,7 @@ static void dispatch_enqueue(struct scx_
 		 * disallow any internal DSQ from doing vtime ordering of
 		 * tasks.
 		 */
-		scx_error("cannot use vtime ordering for built-in DSQs");
+		scx_error(sch, "cannot use vtime ordering for built-in DSQs");
 		enq_flags &= ~SCX_ENQ_DSQ_PRIQ;
 	}
 
@@ -1932,7 +1974,7 @@ static void dispatch_enqueue(struct scx_
 		 */
 		if (unlikely(RB_EMPTY_ROOT(&dsq->priq) &&
 			     nldsq_next_task(dsq, NULL, false)))
-			scx_error("DSQ ID 0x%016llx already had FIFO-enqueued tasks",
+			scx_error(sch, "DSQ ID 0x%016llx already had FIFO-enqueued tasks",
 				  dsq->id);
 
 		p->scx.dsq_flags |= SCX_TASK_DSQ_ON_PRIQ;
@@ -1954,7 +1996,7 @@ static void dispatch_enqueue(struct scx_
 	} else {
 		/* a FIFO DSQ shouldn't be using PRIQ enqueuing */
 		if (unlikely(!RB_EMPTY_ROOT(&dsq->priq)))
-			scx_error("DSQ ID 0x%016llx already had PRIQ-enqueued tasks",
+			scx_error(sch, "DSQ ID 0x%016llx already had PRIQ-enqueued tasks",
 				  dsq->id);
 
 		if (enq_flags & (SCX_ENQ_HEAD | SCX_ENQ_PREEMPT))
@@ -2082,7 +2124,7 @@ static struct scx_dispatch_q *find_dsq_f
 	if ((dsq_id & SCX_DSQ_LOCAL_ON) == SCX_DSQ_LOCAL_ON) {
 		s32 cpu = dsq_id & SCX_DSQ_LOCAL_CPU_MASK;
 
-		if (!ops_cpu_valid(cpu, "in SCX_DSQ_LOCAL_ON dispatch verdict"))
+		if (!ops_cpu_valid(sch, cpu, "in SCX_DSQ_LOCAL_ON dispatch verdict"))
 			return find_global_dsq(p);
 
 		return &cpu_rq(cpu)->scx.local_dsq;
@@ -2094,7 +2136,7 @@ static struct scx_dispatch_q *find_dsq_f
 		dsq = find_user_dsq(sch, dsq_id);
 
 	if (unlikely(!dsq)) {
-		scx_error("non-existent DSQ 0x%llx for %s[%d]",
+		scx_error(sch, "non-existent DSQ 0x%llx for %s[%d]",
 			  dsq_id, p->comm, p->pid);
 		return find_global_dsq(p);
 	}
@@ -2116,10 +2158,10 @@ static void mark_direct_dispatch(struct
 	/* @p must match the task on the enqueue path */
 	if (unlikely(p != ddsp_task)) {
 		if (IS_ERR(ddsp_task))
-			scx_error("%s[%d] already direct-dispatched",
+			scx_kf_error("%s[%d] already direct-dispatched",
 				  p->comm, p->pid);
 		else
-			scx_error("scheduling for %s[%d] but trying to direct-dispatch %s[%d]",
+			scx_kf_error("scheduling for %s[%d] but trying to direct-dispatch %s[%d]",
 				  ddsp_task->comm, ddsp_task->pid,
 				  p->comm, p->pid);
 		return;
@@ -2178,7 +2220,8 @@ static void direct_dispatch(struct scx_s
 		return;
 	}
 
-	dispatch_enqueue(dsq, p, p->scx.ddsp_enq_flags | SCX_ENQ_CLEAR_OPSS);
+	dispatch_enqueue(sch, dsq, p,
+			 p->scx.ddsp_enq_flags | SCX_ENQ_CLEAR_OPSS);
 }
 
 static bool scx_rq_online(struct rq *rq)
@@ -2275,13 +2318,13 @@ local:
 	touch_core_sched(rq, p);
 	refill_task_slice_dfl(p);
 local_norefill:
-	dispatch_enqueue(&rq->scx.local_dsq, p, enq_flags);
+	dispatch_enqueue(sch, &rq->scx.local_dsq, p, enq_flags);
 	return;
 
 global:
 	touch_core_sched(rq, p);	/* see the comment in local: */
 	refill_task_slice_dfl(p);
-	dispatch_enqueue(find_global_dsq(p), p, enq_flags);
+	dispatch_enqueue(sch, find_global_dsq(p), p, enq_flags);
 }
 
 static bool task_runnable(const struct task_struct *p)
@@ -2550,7 +2593,8 @@ static void move_remote_task_to_local_ds
  *
  * The caller must ensure that @p and @rq are on different CPUs.
  */
-static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
+static bool task_can_run_on_remote_rq(struct scx_sched *sch,
+				      struct task_struct *p, struct rq *rq,
 				      bool enforce)
 {
 	int cpu = cpu_of(rq);
@@ -2571,7 +2615,7 @@ static bool task_can_run_on_remote_rq(st
 	 */
 	if (unlikely(is_migration_disabled(p))) {
 		if (enforce)
-			scx_error("SCX_DSQ_LOCAL[_ON] cannot move migration disabled %s[%d] from CPU %d to %d",
+			scx_error(sch, "SCX_DSQ_LOCAL[_ON] cannot move migration disabled %s[%d] from CPU %d to %d",
 				  p->comm, p->pid, task_cpu(p), cpu);
 		return false;
 	}
@@ -2584,7 +2628,7 @@ static bool task_can_run_on_remote_rq(st
 	 */
 	if (!task_allowed_on_cpu(p, cpu)) {
 		if (enforce)
-			scx_error("SCX_DSQ_LOCAL[_ON] target CPU %d not allowed for %s[%d]",
+			scx_error(sch, "SCX_DSQ_LOCAL[_ON] target CPU %d not allowed for %s[%d]",
 				  cpu, p->comm, p->pid);
 		return false;
 	}
@@ -2664,12 +2708,13 @@ static bool consume_remote_task(struct r
 }
 #else	/* CONFIG_SMP */
 static inline void move_remote_task_to_local_dsq(struct task_struct *p, u64 enq_flags, struct rq *src_rq, struct rq *dst_rq) { WARN_ON_ONCE(1); }
-static inline bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq, bool enforce) { return false; }
+static inline bool task_can_run_on_remote_rq(struct scx_sched *sch, struct task_struct *p, struct rq *rq, bool enforce) { return false; }
 static inline bool consume_remote_task(struct rq *this_rq, struct task_struct *p, struct scx_dispatch_q *dsq, struct rq *task_rq) { return false; }
 #endif	/* CONFIG_SMP */
 
 /**
  * move_task_between_dsqs() - Move a task from one DSQ to another
+ * @sch: scx_sched being operated on
  * @p: target task
  * @enq_flags: %SCX_ENQ_*
  * @src_dsq: DSQ @p is currently on, must not be a local DSQ
@@ -2683,7 +2728,8 @@ static inline bool consume_remote_task(s
  * On return, @src_dsq is unlocked and only @p's new task_rq, which is the
  * return value, is locked.
  */
-static struct rq *move_task_between_dsqs(struct task_struct *p, u64 enq_flags,
+static struct rq *move_task_between_dsqs(struct scx_sched *sch,
+					 struct task_struct *p, u64 enq_flags,
 					 struct scx_dispatch_q *src_dsq,
 					 struct scx_dispatch_q *dst_dsq)
 {
@@ -2696,7 +2742,7 @@ static struct rq *move_task_between_dsqs
 	if (dst_dsq->id == SCX_DSQ_LOCAL) {
 		dst_rq = container_of(dst_dsq, struct rq, scx.local_dsq);
 		if (src_rq != dst_rq &&
-		    unlikely(!task_can_run_on_remote_rq(p, dst_rq, true))) {
+		    unlikely(!task_can_run_on_remote_rq(sch, p, dst_rq, true))) {
 			dst_dsq = find_global_dsq(p);
 			dst_rq = src_rq;
 		}
@@ -2730,7 +2776,7 @@ static struct rq *move_task_between_dsqs
 		p->scx.dsq = NULL;
 		raw_spin_unlock(&src_dsq->lock);
 
-		dispatch_enqueue(dst_dsq, p, enq_flags);
+		dispatch_enqueue(sch, dst_dsq, p, enq_flags);
 	}
 
 	return dst_rq;
@@ -2765,7 +2811,8 @@ static void scx_breather(struct rq *rq)
 	raw_spin_rq_lock(rq);
 }
 
-static bool consume_dispatch_q(struct rq *rq, struct scx_dispatch_q *dsq)
+static bool consume_dispatch_q(struct scx_sched *sch, struct rq *rq,
+			       struct scx_dispatch_q *dsq)
 {
 	struct task_struct *p;
 retry:
@@ -2797,7 +2844,7 @@ retry:
 			return true;
 		}
 
-		if (task_can_run_on_remote_rq(p, rq, false)) {
+		if (task_can_run_on_remote_rq(sch, p, rq, false)) {
 			if (likely(consume_remote_task(rq, p, dsq, task_rq)))
 				return true;
 			goto retry;
@@ -2812,11 +2859,12 @@ static bool consume_global_dsq(struct sc
 {
 	int node = cpu_to_node(cpu_of(rq));
 
-	return consume_dispatch_q(rq, sch->global_dsqs[node]);
+	return consume_dispatch_q(sch, rq, sch->global_dsqs[node]);
 }
 
 /**
  * dispatch_to_local_dsq - Dispatch a task to a local dsq
+ * @sch: scx_sched being operated on
  * @rq: current rq which is locked
  * @dst_dsq: destination DSQ
  * @p: task to dispatch
@@ -2829,7 +2877,8 @@ static bool consume_global_dsq(struct sc
  * The caller must have exclusive ownership of @p (e.g. through
  * %SCX_OPSS_DISPATCHING).
  */
-static void dispatch_to_local_dsq(struct rq *rq, struct scx_dispatch_q *dst_dsq,
+static void dispatch_to_local_dsq(struct scx_sched *sch, struct rq *rq,
+				  struct scx_dispatch_q *dst_dsq,
 				  struct task_struct *p, u64 enq_flags)
 {
 	struct rq *src_rq = task_rq(p);
@@ -2845,14 +2894,15 @@ static void dispatch_to_local_dsq(struct
 	 * If dispatching to @rq that @p is already on, no lock dancing needed.
 	 */
 	if (rq == src_rq && rq == dst_rq) {
-		dispatch_enqueue(dst_dsq, p, enq_flags | SCX_ENQ_CLEAR_OPSS);
+		dispatch_enqueue(sch, dst_dsq, p,
+				 enq_flags | SCX_ENQ_CLEAR_OPSS);
 		return;
 	}
 
 #ifdef CONFIG_SMP
 	if (src_rq != dst_rq &&
-	    unlikely(!task_can_run_on_remote_rq(p, dst_rq, true))) {
-		dispatch_enqueue(find_global_dsq(p), p,
+	    unlikely(!task_can_run_on_remote_rq(sch, p, dst_rq, true))) {
+		dispatch_enqueue(sch, find_global_dsq(p), p,
 				 enq_flags | SCX_ENQ_CLEAR_OPSS);
 		return;
 	}
@@ -2890,7 +2940,8 @@ static void dispatch_to_local_dsq(struct
 		 */
 		if (src_rq == dst_rq) {
 			p->scx.holding_cpu = -1;
-			dispatch_enqueue(&dst_rq->scx.local_dsq, p, enq_flags);
+			dispatch_enqueue(sch, &dst_rq->scx.local_dsq, p,
+					 enq_flags);
 		} else {
 			move_remote_task_to_local_dsq(p, enq_flags,
 						      src_rq, dst_rq);
@@ -2989,9 +3040,9 @@ retry:
 	dsq = find_dsq_for_dispatch(sch, this_rq(), dsq_id, p);
 
 	if (dsq->id == SCX_DSQ_LOCAL)
-		dispatch_to_local_dsq(rq, dsq, p, enq_flags);
+		dispatch_to_local_dsq(sch, rq, dsq, p, enq_flags);
 	else
-		dispatch_enqueue(dsq, p, enq_flags | SCX_ENQ_CLEAR_OPSS);
+		dispatch_enqueue(sch, dsq, p, enq_flags | SCX_ENQ_CLEAR_OPSS);
 }
 
 static void flush_dispatch_buf(struct scx_sched *sch, struct rq *rq)
@@ -3182,7 +3233,8 @@ static void process_ddsp_deferred_locals
 
 		dsq = find_dsq_for_dispatch(sch, rq, p->scx.ddsp_dsq_id, p);
 		if (!WARN_ON_ONCE(dsq->id != SCX_DSQ_LOCAL))
-			dispatch_to_local_dsq(rq, dsq, p, p->scx.ddsp_enq_flags);
+			dispatch_to_local_dsq(sch, rq, dsq, p,
+					      p->scx.ddsp_enq_flags);
 	}
 }
 
@@ -3312,7 +3364,8 @@ static void put_prev_task_scx(struct rq
 		 * DSQ.
 		 */
 		if (p->scx.slice && !scx_rq_bypassing(rq)) {
-			dispatch_enqueue(&rq->scx.local_dsq, p, SCX_ENQ_HEAD);
+			dispatch_enqueue(sch, &rq->scx.local_dsq, p,
+					 SCX_ENQ_HEAD);
 			goto switch_class;
 		}
 
@@ -3487,7 +3540,7 @@ static int select_task_rq_scx(struct tas
 					   wake_flags);
 		p->scx.selected_cpu = cpu;
 		*ddsp_taskp = NULL;
-		if (ops_cpu_valid(cpu, "from ops.select_cpu()"))
+		if (ops_cpu_valid(sch, cpu, "from ops.select_cpu()"))
 			return cpu;
 		else
 			return prev_cpu;
@@ -3557,7 +3610,7 @@ static void handle_hotplug(struct rq *rq
 	else if (!online && SCX_HAS_OP(sch, cpu_offline))
 		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cpu_offline, NULL, cpu);
 	else
-		scx_exit(SCX_EXIT_UNREG_KERN,
+		scx_exit(sch, SCX_EXIT_UNREG_KERN,
 			 SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
 			 "cpu %d going %s, exiting scheduler", cpu,
 			 online ? "online" : "offline");
@@ -3587,11 +3640,16 @@ static void rq_offline_scx(struct rq *rq
 
 static bool check_rq_for_timeouts(struct rq *rq)
 {
+	struct scx_sched *sch;
 	struct task_struct *p;
 	struct rq_flags rf;
 	bool timed_out = false;
 
 	rq_lock_irqsave(rq, &rf);
+	sch = rcu_dereference_bh(scx_root);
+	if (unlikely(!sch))
+		goto out_unlock;
+
 	list_for_each_entry(p, &rq->scx.runnable_list, scx.runnable_node) {
 		unsigned long last_runnable = p->scx.runnable_at;
 
@@ -3599,15 +3657,15 @@ static bool check_rq_for_timeouts(struct
 					last_runnable + scx_watchdog_timeout))) {
 			u32 dur_ms = jiffies_to_msecs(jiffies - last_runnable);
 
-			scx_exit(SCX_EXIT_ERROR_STALL, 0,
+			scx_exit(sch, SCX_EXIT_ERROR_STALL, 0,
 				 "%s[%d] failed to run for %u.%03us",
 				 p->comm, p->pid, dur_ms / 1000, dur_ms % 1000);
 			timed_out = true;
 			break;
 		}
 	}
+out_unlock:
 	rq_unlock_irqrestore(rq, &rf);
-
 	return timed_out;
 }
 
@@ -3629,17 +3687,22 @@ static void scx_watchdog_workfn(struct w
 
 void scx_tick(struct rq *rq)
 {
+	struct scx_sched *sch;
 	unsigned long last_check;
 
 	if (!scx_enabled())
 		return;
 
+	sch = rcu_dereference_bh(scx_root);
+	if (unlikely(!sch))
+		return;
+
 	last_check = READ_ONCE(scx_watchdog_timestamp);
 	if (unlikely(time_after(jiffies,
 				last_check + READ_ONCE(scx_watchdog_timeout)))) {
 		u32 dur_ms = jiffies_to_msecs(jiffies - last_check);
 
-		scx_exit(SCX_EXIT_ERROR_STALL, 0,
+		scx_exit(sch, SCX_EXIT_ERROR_STALL, 0,
 			 "watchdog failed to check in for %u.%03us",
 			 dur_ms / 1000, dur_ms % 1000);
 	}
@@ -3742,7 +3805,7 @@ static int scx_init_task(struct task_str
 		ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED, init_task, NULL,
 				      p, &args);
 		if (unlikely(ret)) {
-			ret = ops_sanitize_err("init_task", ret);
+			ret = ops_sanitize_err(sch, "init_task", ret);
 			return ret;
 		}
 	}
@@ -3770,7 +3833,7 @@ static int scx_init_task(struct task_str
 
 			task_rq_unlock(rq, p, &rf);
 		} else if (p->policy == SCHED_EXT) {
-			scx_error("ops.init_task() set task->scx.disallow for %s[%d] during fork",
+			scx_error(sch, "ops.init_task() set task->scx.disallow for %s[%d] during fork",
 				  p->comm, p->pid);
 		}
 	}
@@ -4043,7 +4106,7 @@ int scx_tg_online(struct task_group *tg)
 			ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED, cgroup_init,
 					      NULL, tg->css.cgroup, &args);
 			if (ret)
-				ret = ops_sanitize_err("cgroup_init", ret);
+				ret = ops_sanitize_err(sch, "cgroup_init", ret);
 		}
 		if (ret == 0)
 			tg->scx_flags |= SCX_TG_ONLINE | SCX_TG_INITED;
@@ -4122,7 +4185,7 @@ err:
 	}
 
 	percpu_up_read(&scx_cgroup_rwsem);
-	return ops_sanitize_err("cgroup_prep_move", ret);
+	return ops_sanitize_err(sch, "cgroup_prep_move", ret);
 }
 
 void scx_cgroup_move_task(struct task_struct *p)
@@ -4291,7 +4354,7 @@ static void destroy_dsq(struct scx_sched
 	raw_spin_lock_irqsave(&dsq->lock, flags);
 
 	if (dsq->nr) {
-		scx_error("attempting to destroy in-use dsq 0x%016llx (nr=%u)",
+		scx_error(sch, "attempting to destroy in-use dsq 0x%016llx (nr=%u)",
 			  dsq->id, dsq->nr);
 		goto out_unlock_dsq;
 	}
@@ -4386,7 +4449,7 @@ static int scx_cgroup_init(struct scx_sc
 				      css->cgroup, &args);
 		if (ret) {
 			css_put(css);
-			scx_error("ops.cgroup_init() failed (%d)", ret);
+			scx_error(sch, "ops.cgroup_init() failed (%d)", ret);
 			return ret;
 		}
 		tg->scx_flags |= SCX_TG_INITED;
@@ -4593,17 +4656,25 @@ bool scx_allow_ttwu_queue(const struct t
  */
 void scx_softlockup(u32 dur_s)
 {
+	struct scx_sched *sch;
+
+	rcu_read_lock();
+
+	sch = rcu_dereference(scx_root);
+	if (unlikely(!sch))
+		goto out_unlock;
+
 	switch (scx_enable_state()) {
 	case SCX_ENABLING:
 	case SCX_ENABLED:
 		break;
 	default:
-		return;
+		goto out_unlock;
 	}
 
 	/* allow only one instance, cleared at the end of scx_bypass() */
 	if (test_and_set_bit(0, &scx_in_softlockup))
-		return;
+		goto out_unlock;
 
 	printk_deferred(KERN_ERR "sched_ext: Soft lockup - CPU%d stuck for %us, disabling \"%s\"\n",
 			smp_processor_id(), dur_s, scx_root->ops.name);
@@ -4614,7 +4685,9 @@ void scx_softlockup(u32 dur_s)
 	 */
 	atomic_inc(&scx_breather_depth);
 
-	scx_error("soft lockup - CPU#%d stuck for %us", smp_processor_id(), dur_s);
+	scx_error(sch, "soft lockup - CPU#%d stuck for %us", smp_processor_id(), dur_s);
+out_unlock:
+	rcu_read_unlock();
 }
 
 static void scx_clear_softlockup(void)
@@ -5267,21 +5340,15 @@ static void scx_error_irq_workfn(struct
 	kthread_queue_work(sch->helper, &sch->disable_work);
 }
 
-static void scx_vexit(enum scx_exit_kind kind, s64 exit_code, const char *fmt,
-		      va_list args)
+static void scx_vexit(struct scx_sched *sch,
+		      enum scx_exit_kind kind, s64 exit_code,
+		      const char *fmt, va_list args)
 {
-	struct scx_sched *sch;
-	struct scx_exit_info *ei;
+	struct scx_exit_info *ei = sch->exit_info;
 	int none = SCX_EXIT_NONE;
 
-	rcu_read_lock();
-	sch = rcu_dereference(scx_root);
-	if (!sch)
-		goto out_unlock;
-	ei = sch->exit_info;
-
 	if (!atomic_try_cmpxchg(&sch->exit_kind, &none, kind))
-		goto out_unlock;
+		return;
 
 	ei->exit_code = exit_code;
 #ifdef CONFIG_STACKTRACE
@@ -5298,8 +5365,6 @@ static void scx_vexit(enum scx_exit_kind
 	ei->reason = scx_exit_reason(ei->kind);
 
 	irq_work_queue(&sch->error_irq_work);
-out_unlock:
-	rcu_read_unlock();
 }
 
 static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
@@ -5380,7 +5445,8 @@ err_free_sch:
 	return ERR_PTR(ret);
 }
 
-static void check_hotplug_seq(const struct sched_ext_ops *ops)
+static void check_hotplug_seq(struct scx_sched *sch,
+			      const struct sched_ext_ops *ops)
 {
 	unsigned long long global_hotplug_seq;
 
@@ -5392,7 +5458,7 @@ static void check_hotplug_seq(const stru
 	if (ops->hotplug_seq) {
 		global_hotplug_seq = atomic_long_read(&scx_hotplug_seq);
 		if (ops->hotplug_seq != global_hotplug_seq) {
-			scx_exit(SCX_EXIT_UNREG_KERN,
+			scx_exit(sch, SCX_EXIT_UNREG_KERN,
 				 SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
 				 "expected hotplug seq %llu did not match actual %llu",
 				 ops->hotplug_seq, global_hotplug_seq);
@@ -5400,14 +5466,14 @@ static void check_hotplug_seq(const stru
 	}
 }
 
-static int validate_ops(const struct sched_ext_ops *ops)
+static int validate_ops(struct scx_sched *sch, const struct sched_ext_ops *ops)
 {
 	/*
 	 * It doesn't make sense to specify the SCX_OPS_ENQ_LAST flag if the
 	 * ops.enqueue() callback isn't implemented.
 	 */
 	if ((ops->flags & SCX_OPS_ENQ_LAST) && !ops->enqueue) {
-		scx_error("SCX_OPS_ENQ_LAST requires ops.enqueue() to be implemented");
+		scx_error(sch, "SCX_OPS_ENQ_LAST requires ops.enqueue() to be implemented");
 		return -EINVAL;
 	}
 
@@ -5417,7 +5483,7 @@ static int validate_ops(const struct sch
 	 */
 	if ((ops->flags & SCX_OPS_BUILTIN_IDLE_PER_NODE) &&
 	    (ops->update_idle && !(ops->flags & SCX_OPS_KEEP_BUILTIN_IDLE))) {
-		scx_error("SCX_OPS_BUILTIN_IDLE_PER_NODE requires CPU idle selection enabled");
+		scx_error(sch, "SCX_OPS_BUILTIN_IDLE_PER_NODE requires CPU idle selection enabled");
 		return -EINVAL;
 	}
 
@@ -5483,9 +5549,9 @@ static int scx_enable(struct sched_ext_o
 	if (sch->ops.init) {
 		ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED, init, NULL);
 		if (ret) {
-			ret = ops_sanitize_err("init", ret);
+			ret = ops_sanitize_err(sch, "init", ret);
 			cpus_read_unlock();
-			scx_error("ops.init() failed (%d)", ret);
+			scx_error(sch, "ops.init() failed (%d)", ret);
 			goto err_disable;
 		}
 	}
@@ -5494,12 +5560,12 @@ static int scx_enable(struct sched_ext_o
 		if (((void (**)(void))ops)[i])
 			set_bit(i, sch->has_op);
 
-	check_hotplug_seq(ops);
+	check_hotplug_seq(sch, ops);
 	scx_idle_update_selcpu_topology(ops);
 
 	cpus_read_unlock();
 
-	ret = validate_ops(ops);
+	ret = validate_ops(sch, ops);
 	if (ret)
 		goto err_disable;
 
@@ -5582,7 +5648,7 @@ static int scx_enable(struct sched_ext_o
 			put_task_struct(p);
 			scx_task_iter_relock(&sti);
 			scx_task_iter_stop(&sti);
-			scx_error("ops.init_task() failed (%d) for %s[%d]",
+			scx_error(sch, "ops.init_task() failed (%d) for %s[%d]",
 				  ret, p->comm, p->pid);
 			goto err_disable_unlock_all;
 		}
@@ -5670,7 +5736,7 @@ err_disable:
 	 * Flush scx_disable_work to ensure that error is reported before init
 	 * completion. sch's base reference will be put by bpf_scx_unreg().
 	 */
-	scx_error("scx_enable() failed (%d)", ret);
+	scx_error(sch, "scx_enable() failed (%d)", ret);
 	kthread_flush_work(&sch->disable_work);
 	return 0;
 }
@@ -6210,12 +6276,12 @@ static bool scx_dsq_insert_preamble(stru
 	lockdep_assert_irqs_disabled();
 
 	if (unlikely(!p)) {
-		scx_error("called with NULL task");
+		scx_kf_error("called with NULL task");
 		return false;
 	}
 
 	if (unlikely(enq_flags & __SCX_ENQ_INTERNAL_MASK)) {
-		scx_error("invalid enq_flags 0x%llx", enq_flags);
+		scx_kf_error("invalid enq_flags 0x%llx", enq_flags);
 		return false;
 	}
 
@@ -6235,7 +6301,7 @@ static void scx_dsq_insert_commit(struct
 	}
 
 	if (unlikely(dspc->cursor >= scx_dsp_max_batch)) {
-		scx_error("dispatch buffer overflow");
+		scx_kf_error("dispatch buffer overflow");
 		return;
 	}
 
@@ -6433,7 +6499,7 @@ static bool scx_dsq_move(struct bpf_iter
 		p->scx.slice = kit->slice;
 
 	/* execute move */
-	locked_rq = move_task_between_dsqs(p, enq_flags, src_dsq, dst_dsq);
+	locked_rq = move_task_between_dsqs(sch, p, enq_flags, src_dsq, dst_dsq);
 	dispatched = true;
 out:
 	if (in_balance) {
@@ -6481,7 +6547,7 @@ __bpf_kfunc void scx_bpf_dispatch_cancel
 	if (dspc->cursor > 0)
 		dspc->cursor--;
 	else
-		scx_error("dispatch buffer underflow");
+		scx_kf_error("dispatch buffer underflow");
 }
 
 /**
@@ -6511,11 +6577,11 @@ __bpf_kfunc bool scx_bpf_dsq_move_to_loc
 
 	dsq = find_user_dsq(sch, dsq_id);
 	if (unlikely(!dsq)) {
-		scx_error("invalid DSQ ID 0x%016llx", dsq_id);
+		scx_error(sch, "invalid DSQ ID 0x%016llx", dsq_id);
 		return false;
 	}
 
-	if (consume_dispatch_q(dspc->rq, dsq)) {
+	if (consume_dispatch_q(sch, dspc->rq, dsq)) {
 		/*
 		 * A successfully consumed task can be dequeued before it starts
 		 * running while the CPU is trying to migrate other dispatched
@@ -6837,7 +6903,7 @@ __bpf_kfunc void scx_bpf_kick_cpu(s32 cp
 	struct rq *this_rq;
 	unsigned long irq_flags;
 
-	if (!ops_cpu_valid(cpu, NULL))
+	if (!kf_cpu_valid(cpu, NULL))
 		return;
 
 	local_irq_save(irq_flags);
@@ -6861,7 +6927,7 @@ __bpf_kfunc void scx_bpf_kick_cpu(s32 cp
 		struct rq *target_rq = cpu_rq(cpu);
 
 		if (unlikely(flags & (SCX_KICK_PREEMPT | SCX_KICK_WAIT)))
-			scx_error("PREEMPT/WAIT cannot be used with SCX_KICK_IDLE");
+			scx_kf_error("PREEMPT/WAIT cannot be used with SCX_KICK_IDLE");
 
 		if (raw_spin_rq_trylock(target_rq)) {
 			if (can_skip_idle_kick(target_rq)) {
@@ -6912,7 +6978,7 @@ __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u6
 	} else if ((dsq_id & SCX_DSQ_LOCAL_ON) == SCX_DSQ_LOCAL_ON) {
 		s32 cpu = dsq_id & SCX_DSQ_LOCAL_CPU_MASK;
 
-		if (ops_cpu_valid(cpu, NULL)) {
+		if (ops_cpu_valid(sch, cpu, NULL)) {
 			ret = READ_ONCE(cpu_rq(cpu)->scx.local_dsq.nr);
 			goto out;
 		}
@@ -7073,20 +7139,20 @@ static s32 __bstr_format(u64 *data_buf,
 
 	if (data__sz % 8 || data__sz > MAX_BPRINTF_VARARGS * 8 ||
 	    (data__sz && !data)) {
-		scx_error("invalid data=%p and data__sz=%u", (void *)data, data__sz);
+		scx_kf_error("invalid data=%p and data__sz=%u", (void *)data, data__sz);
 		return -EINVAL;
 	}
 
 	ret = copy_from_kernel_nofault(data_buf, data, data__sz);
 	if (ret < 0) {
-		scx_error("failed to read data fields (%d)", ret);
+		scx_kf_error("failed to read data fields (%d)", ret);
 		return ret;
 	}
 
 	ret = bpf_bprintf_prepare(fmt, UINT_MAX, data_buf, data__sz / 8,
 				  &bprintf_data);
 	if (ret < 0) {
-		scx_error("format preparation failed (%d)", ret);
+		scx_kf_error("format preparation failed (%d)", ret);
 		return ret;
 	}
 
@@ -7094,7 +7160,7 @@ static s32 __bstr_format(u64 *data_buf,
 			  bprintf_data.bin_args);
 	bpf_bprintf_cleanup(&bprintf_data);
 	if (ret < 0) {
-		scx_error("(\"%s\", %p, %u) failed to format", fmt, data, data__sz);
+		scx_kf_error("(\"%s\", %p, %u) failed to format", fmt, data, data__sz);
 		return ret;
 	}
 
@@ -7127,7 +7193,7 @@ __bpf_kfunc void scx_bpf_exit_bstr(s64 e
 
 	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
 	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
-		scx_exit(SCX_EXIT_UNREG_BPF, exit_code, "%s", scx_exit_bstr_buf.line);
+		scx_kf_exit(SCX_EXIT_UNREG_BPF, exit_code, "%s", scx_exit_bstr_buf.line);
 	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
 }
 
@@ -7147,7 +7213,7 @@ __bpf_kfunc void scx_bpf_error_bstr(char
 
 	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
 	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
-		scx_exit(SCX_EXIT_ERROR_BPF, 0, "%s", scx_exit_bstr_buf.line);
+		scx_kf_exit(SCX_EXIT_ERROR_BPF, 0, "%s", scx_exit_bstr_buf.line);
 	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
 }
 
@@ -7171,7 +7237,7 @@ __bpf_kfunc void scx_bpf_dump_bstr(char
 	s32 ret;
 
 	if (raw_smp_processor_id() != dd->cpu) {
-		scx_error("scx_bpf_dump() must only be called from ops.dump() and friends");
+		scx_kf_error("scx_bpf_dump() must only be called from ops.dump() and friends");
 		return;
 	}
 
@@ -7212,7 +7278,7 @@ __bpf_kfunc void scx_bpf_dump_bstr(char
  */
 __bpf_kfunc u32 scx_bpf_cpuperf_cap(s32 cpu)
 {
-	if (ops_cpu_valid(cpu, NULL))
+	if (kf_cpu_valid(cpu, NULL))
 		return arch_scale_cpu_capacity(cpu);
 	else
 		return SCX_CPUPERF_ONE;
@@ -7234,7 +7300,7 @@ __bpf_kfunc u32 scx_bpf_cpuperf_cap(s32
  */
 __bpf_kfunc u32 scx_bpf_cpuperf_cur(s32 cpu)
 {
-	if (ops_cpu_valid(cpu, NULL))
+	if (kf_cpu_valid(cpu, NULL))
 		return arch_scale_freq_capacity(cpu);
 	else
 		return SCX_CPUPERF_ONE;
@@ -7257,11 +7323,11 @@ __bpf_kfunc u32 scx_bpf_cpuperf_cur(s32
 __bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
 {
 	if (unlikely(perf > SCX_CPUPERF_ONE)) {
-		scx_error("Invalid cpuperf target %u for CPU %d", perf, cpu);
+		scx_kf_error("Invalid cpuperf target %u for CPU %d", perf, cpu);
 		return;
 	}
 
-	if (ops_cpu_valid(cpu, NULL)) {
+	if (kf_cpu_valid(cpu, NULL)) {
 		struct rq *rq = cpu_rq(cpu), *locked_rq = scx_locked_rq();
 		struct rq_flags rf;
 
@@ -7270,7 +7336,7 @@ __bpf_kfunc void scx_bpf_cpuperf_set(s32
 		 * to the corresponding CPU to prevent ABBA deadlocks.
 		 */
 		if (locked_rq && rq != locked_rq) {
-			scx_error("Invalid target CPU %d", cpu);
+			scx_kf_error("Invalid target CPU %d", cpu);
 			return;
 		}
 
@@ -7365,7 +7431,7 @@ __bpf_kfunc s32 scx_bpf_task_cpu(const s
  */
 __bpf_kfunc struct rq *scx_bpf_cpu_rq(s32 cpu)
 {
-	if (!ops_cpu_valid(cpu, NULL))
+	if (!kf_cpu_valid(cpu, NULL))
 		return NULL;
 
 	return cpu_rq(cpu);
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -820,7 +820,7 @@ void scx_idle_disable(void)
 static int validate_node(int node)
 {
 	if (!static_branch_likely(&scx_builtin_idle_per_node)) {
-		scx_error("per-node idle tracking is disabled");
+		scx_kf_error("per-node idle tracking is disabled");
 		return -EOPNOTSUPP;
 	}
 
@@ -830,13 +830,13 @@ static int validate_node(int node)
 
 	/* Make sure node is in a valid range */
 	if (node < 0 || node >= nr_node_ids) {
-		scx_error("invalid node %d", node);
+		scx_kf_error("invalid node %d", node);
 		return -EINVAL;
 	}
 
 	/* Make sure the node is part of the set of possible nodes */
 	if (!node_possible(node)) {
-		scx_error("unavailable node %d", node);
+		scx_kf_error("unavailable node %d", node);
 		return -EINVAL;
 	}
 
@@ -850,7 +850,7 @@ static bool check_builtin_idle_enabled(v
 	if (static_branch_likely(&scx_builtin_idle_enabled))
 		return true;
 
-	scx_error("built-in idle tracking is disabled");
+	scx_kf_error("built-in idle tracking is disabled");
 	return false;
 }
 
@@ -862,7 +862,7 @@ static bool check_builtin_idle_enabled(v
 __bpf_kfunc int scx_bpf_cpu_node(s32 cpu)
 {
 #ifdef CONFIG_NUMA
-	if (!ops_cpu_valid(cpu, NULL))
+	if (!kf_cpu_valid(cpu, NULL))
 		return NUMA_NO_NODE;
 
 	return cpu_to_node(cpu);
@@ -891,7 +891,7 @@ __bpf_kfunc s32 scx_bpf_select_cpu_dfl(s
 #ifdef CONFIG_SMP
 	s32 cpu;
 #endif
-	if (!ops_cpu_valid(prev_cpu, NULL))
+	if (!kf_cpu_valid(prev_cpu, NULL))
 		goto prev_cpu;
 
 	if (!check_builtin_idle_enabled())
@@ -937,7 +937,7 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(s
 {
 	s32 cpu;
 
-	if (!ops_cpu_valid(prev_cpu, NULL))
+	if (!kf_cpu_valid(prev_cpu, NULL))
 		return -EINVAL;
 
 	if (!check_builtin_idle_enabled())
@@ -999,7 +999,7 @@ __bpf_kfunc const struct cpumask *scx_bp
 __bpf_kfunc const struct cpumask *scx_bpf_get_idle_cpumask(void)
 {
 	if (static_branch_unlikely(&scx_builtin_idle_per_node)) {
-		scx_error("SCX_OPS_BUILTIN_IDLE_PER_NODE enabled");
+		scx_kf_error("SCX_OPS_BUILTIN_IDLE_PER_NODE enabled");
 		return cpu_none_mask;
 	}
 
@@ -1050,7 +1050,7 @@ __bpf_kfunc const struct cpumask *scx_bp
 __bpf_kfunc const struct cpumask *scx_bpf_get_idle_smtmask(void)
 {
 	if (static_branch_unlikely(&scx_builtin_idle_per_node)) {
-		scx_error("SCX_OPS_BUILTIN_IDLE_PER_NODE enabled");
+		scx_kf_error("SCX_OPS_BUILTIN_IDLE_PER_NODE enabled");
 		return cpu_none_mask;
 	}
 
@@ -1097,7 +1097,7 @@ __bpf_kfunc bool scx_bpf_test_and_clear_
 	if (!check_builtin_idle_enabled())
 		return false;
 
-	if (ops_cpu_valid(cpu, NULL))
+	if (kf_cpu_valid(cpu, NULL))
 		return scx_idle_test_and_clear_cpu(cpu);
 	else
 		return false;
@@ -1158,7 +1158,7 @@ __bpf_kfunc s32 scx_bpf_pick_idle_cpu(co
 				      u64 flags)
 {
 	if (static_branch_maybe(CONFIG_NUMA, &scx_builtin_idle_per_node)) {
-		scx_error("per-node idle tracking is enabled");
+		scx_kf_error("per-node idle tracking is enabled");
 		return -EBUSY;
 	}
 
@@ -1235,7 +1235,7 @@ __bpf_kfunc s32 scx_bpf_pick_any_cpu(con
 	s32 cpu;
 
 	if (static_branch_maybe(CONFIG_NUMA, &scx_builtin_idle_per_node)) {
-		scx_error("per-node idle tracking is enabled");
+		scx_kf_error("per-node idle tracking is enabled");
 		return -EBUSY;
 	}
 
