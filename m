Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A2D4400
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747198122; cv=none; b=IwMXqnRho0H3as8QZ9xCWLX8bvt+sMfyqrHpRopjNwko69k/sGsyMqCSWvdnBsif76kYMmwH/KgFq3gXmrM4jzSuDsXRlRX4deK7C/h4wEpHwPKsy78QAQquhtwbNesr+CpVoBxeIgI3Z6wOv868kaxuHgp6LGTTqUJgLwtI/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747198122; c=relaxed/simple;
	bh=zHdedxcs6CVyhwkVEdeWMgXCJI7jrrH3BMcNUOL4UCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFgTHVHGJoukhiC1i38CjGgHZcjiPIoDeMJqfFv7rvYM07uxXU37gbdaiGsBbVlX4avGVaGQPMysJ/MMGQMFpDnmrGL0DZPryTSnqRT2zMgeHbXH8a7bgtW9e9u/1ECUC41wbmjUk8EoS2RNaYTr0vszdsHWilnrDfX1txvjtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3q3VqWo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3q3VqWo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B172C4CEED;
	Wed, 14 May 2025 04:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747198121;
	bh=zHdedxcs6CVyhwkVEdeWMgXCJI7jrrH3BMcNUOL4UCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3q3VqWo6wQZmxpDViAj0xsGTNO8uviOdo7KXsNEK5Fi3b8xVhmO+BigYnSy8anDZ
	 Qq2lO0z7ofOBfHgZeIFFqOYzvJKOAfXBCVaLGt0u0dnILhttBIXlnA/G540fw4CA8j
	 XaZwRsFAbCnWwbFGoIWddnjgqdIq2mJItBLfYb2vpCYWkA1dz2AkPNjRYCpACb3r1Z
	 e/EMb4uwPeR+eSnjw2wgArNKVpYxQX5G0Nc1DhQ1UZpNkEmuJUt29u17+7od01t+7X
	 Nnq73MPlknmbt7FKD/7M12rKzBPcYwE8xq0cfXMewMxrcI9fN/bHTNJGsX/ZL2m4IE
	 d3pwuxUKWnmKQ==
Date: Wed, 14 May 2025 00:48:40 -0400
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4 sched_ext/for-6.16] sched_ext: Add @sch to SCX_CALL_OP*()
Message-ID: <aCQgqDY02LgevzFP@mtj.duckdns.org>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>

In preparation of hierarchical scheduling support, make SCX_CALL_OP*() take
explicit @sch instead of assuming scx_root. As scx_root is still the only
scheduler instance, this patch doesn't make any functional changes.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c      |  132 ++++++++++++++++++++++++++----------------------
 kernel/sched/ext_idle.c |    2 
 2 files changed, 75 insertions(+), 59 deletions(-)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1241,30 +1241,30 @@ static inline struct rq *scx_locked_rq(v
 	return __this_cpu_read(locked_rq);
 }
 
-#define SCX_CALL_OP(mask, op, rq, args...)					\
+#define SCX_CALL_OP(sch, mask, op, rq, args...)					\
 do {										\
 	update_locked_rq(rq);							\
 	if (mask) {								\
 		scx_kf_allow(mask);						\
-		scx_root->ops.op(args);						\
+		(sch)->ops.op(args);						\
 		scx_kf_disallow(mask);						\
 	} else {								\
-		scx_root->ops.op(args);						\
+		(sch)->ops.op(args);						\
 	}									\
 	update_locked_rq(NULL);							\
 } while (0)
 
-#define SCX_CALL_OP_RET(mask, op, rq, args...)					\
+#define SCX_CALL_OP_RET(sch, mask, op, rq, args...)				\
 ({										\
-	__typeof__(scx_root->ops.op(args)) __ret;				\
+	__typeof__((sch)->ops.op(args)) __ret;					\
 										\
 	update_locked_rq(rq);							\
 	if (mask) {								\
 		scx_kf_allow(mask);						\
-		__ret = scx_root->ops.op(args);					\
+		__ret = (sch)->ops.op(args);					\
 		scx_kf_disallow(mask);						\
 	} else {								\
-		__ret = scx_root->ops.op(args);					\
+		__ret = (sch)->ops.op(args);					\
 	}									\
 	update_locked_rq(NULL);							\
 	__ret;									\
@@ -1281,31 +1281,31 @@ do {										\
  * scx_kf_allowed_on_arg_tasks() to test whether the invocation is allowed on
  * the specific task.
  */
-#define SCX_CALL_OP_TASK(mask, op, rq, task, args...)				\
+#define SCX_CALL_OP_TASK(sch, mask, op, rq, task, args...)			\
 do {										\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task;					\
-	SCX_CALL_OP(mask, op, rq, task, ##args);				\
+	SCX_CALL_OP((sch), mask, op, rq, task, ##args);				\
 	current->scx.kf_tasks[0] = NULL;					\
 } while (0)
 
-#define SCX_CALL_OP_TASK_RET(mask, op, rq, task, args...)			\
+#define SCX_CALL_OP_TASK_RET(sch, mask, op, rq, task, args...)			\
 ({										\
-	__typeof__(scx_root->ops.op(task, ##args)) __ret;			\
+	__typeof__((sch)->ops.op(task, ##args)) __ret;				\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task;					\
-	__ret = SCX_CALL_OP_RET(mask, op, rq, task, ##args);			\
+	__ret = SCX_CALL_OP_RET((sch), mask, op, rq, task, ##args);		\
 	current->scx.kf_tasks[0] = NULL;					\
 	__ret;									\
 })
 
-#define SCX_CALL_OP_2TASKS_RET(mask, op, rq, task0, task1, args...)		\
+#define SCX_CALL_OP_2TASKS_RET(sch, mask, op, rq, task0, task1, args...)	\
 ({										\
-	__typeof__(scx_root->ops.op(task0, task1, ##args)) __ret;		\
+	__typeof__((sch)->ops.op(task0, task1, ##args)) __ret;			\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task0;					\
 	current->scx.kf_tasks[1] = task1;					\
-	__ret = SCX_CALL_OP_RET(mask, op, rq, task0, task1, ##args);		\
+	__ret = SCX_CALL_OP_RET((sch), mask, op, rq, task0, task1, ##args);	\
 	current->scx.kf_tasks[0] = NULL;					\
 	current->scx.kf_tasks[1] = NULL;					\
 	__ret;									\
@@ -2246,7 +2246,7 @@ static void do_enqueue_task(struct rq *r
 	WARN_ON_ONCE(*ddsp_taskp);
 	*ddsp_taskp = p;
 
-	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, enqueue, rq, p, enq_flags);
+	SCX_CALL_OP_TASK(sch, SCX_KF_ENQUEUE, enqueue, rq, p, enq_flags);
 
 	*ddsp_taskp = NULL;
 	if (p->scx.ddsp_dsq_id != SCX_DSQ_INVALID)
@@ -2342,7 +2342,7 @@ static void enqueue_task_scx(struct rq *
 	add_nr_running(rq, 1);
 
 	if (SCX_HAS_OP(sch, runnable) && !task_on_rq_migrating(p))
-		SCX_CALL_OP_TASK(SCX_KF_REST, runnable, rq, p, enq_flags);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, runnable, rq, p, enq_flags);
 
 	if (enq_flags & SCX_ENQ_WAKEUP)
 		touch_core_sched(rq, p);
@@ -2378,7 +2378,8 @@ static void ops_dequeue(struct rq *rq, s
 		BUG();
 	case SCX_OPSS_QUEUED:
 		if (SCX_HAS_OP(sch, dequeue))
-			SCX_CALL_OP_TASK(SCX_KF_REST, dequeue, rq, p, deq_flags);
+			SCX_CALL_OP_TASK(sch, SCX_KF_REST, dequeue, rq,
+					 p, deq_flags);
 
 		if (atomic_long_try_cmpxchg(&p->scx.ops_state, &opss,
 					    SCX_OPSS_NONE))
@@ -2429,11 +2430,11 @@ static bool dequeue_task_scx(struct rq *
 	 */
 	if (SCX_HAS_OP(sch, stopping) && task_current(rq, p)) {
 		update_curr_scx(rq);
-		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, false);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, stopping, rq, p, false);
 	}
 
 	if (SCX_HAS_OP(sch, quiescent) && !task_on_rq_migrating(p))
-		SCX_CALL_OP_TASK(SCX_KF_REST, quiescent, rq, p, deq_flags);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, quiescent, rq, p, deq_flags);
 
 	if (deq_flags & SCX_DEQ_SLEEP)
 		p->scx.flags |= SCX_TASK_DEQD_FOR_SLEEP;
@@ -2454,7 +2455,7 @@ static void yield_task_scx(struct rq *rq
 	struct task_struct *p = rq->curr;
 
 	if (SCX_HAS_OP(sch, yield))
-		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, p, NULL);
+		SCX_CALL_OP_2TASKS_RET(sch, SCX_KF_REST, yield, rq, p, NULL);
 	else
 		p->scx.slice = 0;
 }
@@ -2465,7 +2466,8 @@ static bool yield_to_task_scx(struct rq
 	struct task_struct *from = rq->curr;
 
 	if (SCX_HAS_OP(sch, yield))
-		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, from, to);
+		return SCX_CALL_OP_2TASKS_RET(sch, SCX_KF_REST, yield, rq,
+					      from, to);
 	else
 		return false;
 }
@@ -3026,7 +3028,8 @@ static int balance_one(struct rq *rq, st
 		 * emitted in switch_class().
 		 */
 		if (SCX_HAS_OP(sch, cpu_acquire))
-			SCX_CALL_OP(SCX_KF_REST, cpu_acquire, rq, cpu_of(rq), NULL);
+			SCX_CALL_OP(sch, SCX_KF_REST, cpu_acquire, rq,
+				    cpu_of(rq), NULL);
 		rq->scx.cpu_released = false;
 	}
 
@@ -3072,8 +3075,8 @@ static int balance_one(struct rq *rq, st
 	do {
 		dspc->nr_tasks = 0;
 
-		SCX_CALL_OP(SCX_KF_DISPATCH, dispatch, rq, cpu_of(rq),
-			    prev_on_scx ? prev : NULL);
+		SCX_CALL_OP(sch, SCX_KF_DISPATCH, dispatch, rq,
+			    cpu_of(rq), prev_on_scx ? prev : NULL);
 
 		flush_dispatch_buf(sch, rq);
 
@@ -3197,7 +3200,7 @@ static void set_next_task_scx(struct rq
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
 	if (SCX_HAS_OP(sch, running) && (p->scx.flags & SCX_TASK_QUEUED))
-		SCX_CALL_OP_TASK(SCX_KF_REST, running, rq, p);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, running, rq, p);
 
 	clr_task_runnable(p, true);
 
@@ -3279,7 +3282,8 @@ static void switch_class(struct rq *rq,
 				.task = next,
 			};
 
-			SCX_CALL_OP(SCX_KF_CPU_RELEASE, cpu_release, rq, cpu_of(rq), &args);
+			SCX_CALL_OP(sch, SCX_KF_CPU_RELEASE, cpu_release, rq,
+				    cpu_of(rq), &args);
 		}
 		rq->scx.cpu_released = true;
 	}
@@ -3293,7 +3297,7 @@ static void put_prev_task_scx(struct rq
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
 	if (SCX_HAS_OP(sch, stopping) && (p->scx.flags & SCX_TASK_QUEUED))
-		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, true);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, stopping, rq, p, true);
 
 	if (p->scx.flags & SCX_TASK_QUEUED) {
 		set_task_runnable(rq, p);
@@ -3436,7 +3440,8 @@ bool scx_prio_less(const struct task_str
 	 */
 	if (SCX_HAS_OP(sch, core_sched_before) &&
 	    !scx_rq_bypassing(task_rq(a)))
-		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, core_sched_before, NULL,
+		return SCX_CALL_OP_2TASKS_RET(sch, SCX_KF_REST, core_sched_before,
+					      NULL,
 					      (struct task_struct *)a,
 					      (struct task_struct *)b);
 	else
@@ -3473,8 +3478,10 @@ static int select_task_rq_scx(struct tas
 		WARN_ON_ONCE(*ddsp_taskp);
 		*ddsp_taskp = p;
 
-		cpu = SCX_CALL_OP_TASK_RET(SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU,
-					   select_cpu, NULL, p, prev_cpu, wake_flags);
+		cpu = SCX_CALL_OP_TASK_RET(sch,
+					   SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU,
+					   select_cpu, NULL, p, prev_cpu,
+					   wake_flags);
 		p->scx.selected_cpu = cpu;
 		*ddsp_taskp = NULL;
 		if (ops_cpu_valid(cpu, "from ops.select_cpu()"))
@@ -3520,7 +3527,7 @@ static void set_cpus_allowed_scx(struct
 	 * designation pointless. Cast it away when calling the operation.
 	 */
 	if (SCX_HAS_OP(sch, set_cpumask))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, NULL,
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, set_cpumask, NULL,
 				 p, (struct cpumask *)p->cpus_ptr);
 }
 
@@ -3543,9 +3550,9 @@ static void handle_hotplug(struct rq *rq
 		scx_idle_update_selcpu_topology(&sch->ops);
 
 	if (online && SCX_HAS_OP(sch, cpu_online))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, NULL, cpu);
+		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cpu_online, NULL, cpu);
 	else if (!online && SCX_HAS_OP(sch, cpu_offline))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, NULL, cpu);
+		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cpu_offline, NULL, cpu);
 	else
 		scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
 			 "cpu %d going %s, exiting scheduler", cpu,
@@ -3650,7 +3657,7 @@ static void task_tick_scx(struct rq *rq,
 		curr->scx.slice = 0;
 		touch_core_sched(rq, curr);
 	} else if (SCX_HAS_OP(sch, tick)) {
-		SCX_CALL_OP_TASK(SCX_KF_REST, tick, rq, curr);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, tick, rq, curr);
 	}
 
 	if (!curr->scx.slice)
@@ -3728,7 +3735,8 @@ static int scx_init_task(struct task_str
 			.fork = fork,
 		};
 
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init_task, NULL, p, &args);
+		ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED, init_task, NULL,
+				      p, &args);
 		if (unlikely(ret)) {
 			ret = ops_sanitize_err("init_task", ret);
 			return ret;
@@ -3787,11 +3795,12 @@ static void scx_enable_task(struct task_
 	p->scx.weight = sched_weight_to_cgroup(weight);
 
 	if (SCX_HAS_OP(sch, enable))
-		SCX_CALL_OP_TASK(SCX_KF_REST, enable, rq, p);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, enable, rq, p);
 	scx_set_task_state(p, SCX_TASK_ENABLED);
 
 	if (SCX_HAS_OP(sch, set_weight))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, set_weight, rq,
+				 p, p->scx.weight);
 }
 
 static void scx_disable_task(struct task_struct *p)
@@ -3803,7 +3812,7 @@ static void scx_disable_task(struct task
 	WARN_ON_ONCE(scx_get_task_state(p) != SCX_TASK_ENABLED);
 
 	if (SCX_HAS_OP(sch, disable))
-		SCX_CALL_OP_TASK(SCX_KF_REST, disable, rq, p);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, disable, rq, p);
 	scx_set_task_state(p, SCX_TASK_READY);
 }
 
@@ -3833,7 +3842,8 @@ static void scx_exit_task(struct task_st
 	}
 
 	if (SCX_HAS_OP(sch, exit_task))
-		SCX_CALL_OP_TASK(SCX_KF_REST, exit_task, task_rq(p), p, &args);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, exit_task, task_rq(p),
+				 p, &args);
 	scx_set_task_state(p, SCX_TASK_NONE);
 }
 
@@ -3944,7 +3954,8 @@ static void reweight_task_scx(struct rq
 
 	p->scx.weight = sched_weight_to_cgroup(scale_load_down(lw->weight));
 	if (SCX_HAS_OP(sch, set_weight))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, set_weight, rq,
+				 p, p->scx.weight);
 }
 
 static void prio_changed_scx(struct rq *rq, struct task_struct *p, int oldprio)
@@ -3962,7 +3973,7 @@ static void switching_to_scx(struct rq *
 	 * different scheduler class. Keep the BPF scheduler up-to-date.
 	 */
 	if (SCX_HAS_OP(sch, set_cpumask))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, rq,
+		SCX_CALL_OP_TASK(sch, SCX_KF_REST, set_cpumask, rq,
 				 p, (struct cpumask *)p->cpus_ptr);
 }
 
@@ -4025,8 +4036,8 @@ int scx_tg_online(struct task_group *tg)
 			struct scx_cgroup_init_args args =
 				{ .weight = tg->scx_weight };
 
-			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init, NULL,
-					      tg->css.cgroup, &args);
+			ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED, cgroup_init,
+					      NULL, tg->css.cgroup, &args);
 			if (ret)
 				ret = ops_sanitize_err("cgroup_init", ret);
 		}
@@ -4050,7 +4061,8 @@ void scx_tg_offline(struct task_group *t
 
 	if (scx_cgroup_enabled && SCX_HAS_OP(sch, cgroup_exit) &&
 	    (tg->scx_flags & SCX_TG_INITED))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, NULL, tg->css.cgroup);
+		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cgroup_exit, NULL,
+			    tg->css.cgroup);
 	tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
 
 	percpu_up_read(&scx_cgroup_rwsem);
@@ -4084,7 +4096,8 @@ int scx_cgroup_can_attach(struct cgroup_
 			continue;
 
 		if (SCX_HAS_OP(sch, cgroup_prep_move)) {
-			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_prep_move, NULL,
+			ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED,
+					      cgroup_prep_move, NULL,
 					      p, from, css->cgroup);
 			if (ret)
 				goto err;
@@ -4099,7 +4112,7 @@ err:
 	cgroup_taskset_for_each(p, css, tset) {
 		if (SCX_HAS_OP(sch, cgroup_cancel_move) &&
 		    p->scx.cgrp_moving_from)
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
+			SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
 				    p, p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
 	}
@@ -4121,8 +4134,9 @@ void scx_cgroup_move_task(struct task_st
 	 */
 	if (SCX_HAS_OP(sch, cgroup_move) &&
 	    !WARN_ON_ONCE(!p->scx.cgrp_moving_from))
-		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, cgroup_move, NULL,
-				 p, p->scx.cgrp_moving_from, tg_cgrp(task_group(p)));
+		SCX_CALL_OP_TASK(sch, SCX_KF_UNLOCKED, cgroup_move, NULL,
+				 p, p->scx.cgrp_moving_from,
+				 tg_cgrp(task_group(p)));
 	p->scx.cgrp_moving_from = NULL;
 }
 
@@ -4143,7 +4157,7 @@ void scx_cgroup_cancel_attach(struct cgr
 	cgroup_taskset_for_each(p, css, tset) {
 		if (SCX_HAS_OP(sch, cgroup_cancel_move) &&
 		    p->scx.cgrp_moving_from)
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
+			SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
 				    p, p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
 	}
@@ -4159,7 +4173,7 @@ void scx_group_set_weight(struct task_gr
 
 	if (scx_cgroup_enabled && tg->scx_weight != weight) {
 		if (SCX_HAS_OP(sch, cgroup_set_weight))
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_set_weight, NULL,
+			SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cgroup_set_weight, NULL,
 				    tg_cgrp(tg), weight);
 		tg->scx_weight = weight;
 	}
@@ -4326,7 +4340,8 @@ static void scx_cgroup_exit(struct scx_s
 			continue;
 		rcu_read_unlock();
 
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, NULL, css->cgroup);
+		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cgroup_exit, NULL,
+			    css->cgroup);
 
 		rcu_read_lock();
 		css_put(css);
@@ -4363,7 +4378,7 @@ static int scx_cgroup_init(struct scx_sc
 			continue;
 		rcu_read_unlock();
 
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init, NULL,
+		ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED, cgroup_init, NULL,
 				      css->cgroup, &args);
 		if (ret) {
 			css_put(css);
@@ -4892,7 +4907,7 @@ static void scx_disable_workfn(struct kt
 	}
 
 	if (sch->ops.exit)
-		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, NULL, ei);
+		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, exit, NULL, ei);
 
 	cancel_delayed_work_sync(&scx_watchdog_work);
 
@@ -5079,7 +5094,7 @@ static void scx_dump_task(struct seq_buf
 
 	if (SCX_HAS_OP(sch, dump_task)) {
 		ops_dump_init(s, "    ");
-		SCX_CALL_OP(SCX_KF_REST, dump_task, NULL, dctx, p);
+		SCX_CALL_OP(sch, SCX_KF_REST, dump_task, NULL, dctx, p);
 		ops_dump_exit();
 	}
 
@@ -5127,7 +5142,7 @@ static void scx_dump_state(struct scx_ex
 
 	if (SCX_HAS_OP(sch, dump)) {
 		ops_dump_init(&s, "");
-		SCX_CALL_OP(SCX_KF_UNLOCKED, dump, NULL, &dctx);
+		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, dump, NULL, &dctx);
 		ops_dump_exit();
 	}
 
@@ -5184,7 +5199,8 @@ static void scx_dump_state(struct scx_ex
 		used = seq_buf_used(&ns);
 		if (SCX_HAS_OP(sch, dump_cpu)) {
 			ops_dump_init(&ns, "  ");
-			SCX_CALL_OP(SCX_KF_REST, dump_cpu, NULL, &dctx, cpu, idle);
+			SCX_CALL_OP(sch, SCX_KF_REST, dump_cpu, NULL,
+				    &dctx, cpu, idle);
 			ops_dump_exit();
 		}
 
@@ -5463,7 +5479,7 @@ static int scx_enable(struct sched_ext_o
 	scx_idle_enable(ops);
 
 	if (sch->ops.init) {
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init, NULL);
+		ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED, init, NULL);
 		if (ret) {
 			ret = ops_sanitize_err("init", ret);
 			cpus_read_unlock();
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -746,7 +746,7 @@ void __scx_update_idle(struct rq *rq, bo
 	 * managed by put_prev_task_idle()/set_next_task_idle().
 	 */
 	if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
-		SCX_CALL_OP(SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
+		SCX_CALL_OP(sch, SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
 
 	/*
 	 * Update the idle masks:
