Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA862571CB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153587; cv=none; b=fvKfxWKumgnwHQ1LNZiNi9agby1nmvc5lzPn/yQd74GTK8e6KawkhGVrPHF/GN8lLCEueqKojUrNI9ZQhQD2SSVPX/3rZKfJKEJLlOVnXJhzfQbclhrPbSV257dE9NhTmITXH2EMLNbeOoO1ZgdU3aUdHiMO2k1jiBSrgiaIC+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153587; c=relaxed/simple;
	bh=MwUh9wgj4BSAO3hkljwOQYcZ/WkMGOQtuReP6QEs0Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctLvd17dFSy/dJmree9U3RLH9a3dEKKbNR8/FAzsCbx6xMK1y2n00rzG34ADJIbKnM/Bl35H1kdPzUDrRDdNLJbMcJh8HzXePBNgqS4QxjwbhPmgQ+GS7D3rHCbqEY48ofpBriFCCHG18B7Hh67FhdWMu9VHPu0P+vq7a/Q4kh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGK5+8Cx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGK5+8Cx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D036C4CEE7;
	Tue,  8 Apr 2025 23:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744153586;
	bh=MwUh9wgj4BSAO3hkljwOQYcZ/WkMGOQtuReP6QEs0Qg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KGK5+8CxVjw+sx3a4PUXUFKaH7BfWxGLlPMp3JVzFBYfnXZXOEWsTIDSxuP3nJt8W
	 FED+d2GahSYjVGkxIj/rgVksCVBt85jZnkhSYE3Cqar3Yocqo9Z3m56WpUzx4W/6Br
	 TaIbtFw0/kRJsYM203JNUF518BLoI/16Janzo+fLcdUvT8/JwcG9Vuo156pmCleV/O
	 51phteWiMXRJXWDA+hWp3rIpbN+uwYV7d7qT3GTWPuTcNJkRIxPHPN+76jaOg1I5Yj
	 M+WDyxNnEE/EsHDb4RSBp78sF3hp6M1meC5oMIN0nnVl9NjP2d4jzSIICebsq7uNWB
	 IGCj/fA1jP58g==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 5/5] sched_ext: Make scx_has_op a bitmap
Date: Tue,  8 Apr 2025 13:06:05 -1000
Message-ID: <20250408230616.2369765-6-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408230616.2369765-1-tj@kernel.org>
References: <20250408230616.2369765-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scx_has_op is used to encode which ops are implemented by the BPF scheduler
into an array of static_keys. While this saves a bit of branching overhead,
that is unlikely to be noticeable compared to the overall cost. As the
global static_keys can't work with the planned hierarchical multiple
scheduler support, replace the static_key array with a bitmap.

In repeated hackbench runs before and after static_keys removal on an AMD
Ryzen 3900X, I couldn't tell any measurable performance difference.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index f0ed0cec4c98..8ae85ec6d9a2 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -928,8 +928,7 @@ DEFINE_STATIC_KEY_FALSE(__scx_switched_all);
 static struct sched_ext_ops scx_ops;
 static bool scx_warned_zero_slice;
 
-static struct static_key_false scx_has_op[SCX_OPI_END] =
-	{ [0 ... SCX_OPI_END-1] = STATIC_KEY_FALSE_INIT };
+static DECLARE_BITMAP(scx_has_op, SCX_OPI_END);
 
 static atomic_t scx_exit_kind = ATOMIC_INIT(SCX_EXIT_DONE);
 static struct scx_exit_info *scx_exit_info;
@@ -1055,7 +1054,7 @@ static __printf(3, 4) void __scx_exit(enum scx_exit_kind kind, s64 exit_code,
 #define scx_error(fmt, args...)							\
 	__scx_error(SCX_EXIT_ERROR, fmt, ##args)
 
-#define SCX_HAS_OP(op)	static_branch_likely(&scx_has_op[SCX_OP_IDX(op)])
+#define SCX_HAS_OP(op)	test_bit(SCX_OP_IDX(op), scx_has_op)
 
 static long jiffies_delta_msecs(unsigned long at, unsigned long now)
 {
@@ -1774,7 +1773,7 @@ static void touch_core_sched_dispatch(struct rq *rq, struct task_struct *p)
 	lockdep_assert_rq_held(rq);
 
 #ifdef CONFIG_SCHED_CORE
-	if (SCX_HAS_OP(core_sched_before))
+	if (unlikely(SCX_HAS_OP(core_sched_before)))
 		touch_core_sched(rq, p);
 #endif
 }
@@ -2156,7 +2155,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 		goto local;
 	}
 
-	if (!SCX_HAS_OP(enqueue))
+	if (unlikely(!SCX_HAS_OP(enqueue)))
 		goto global;
 
 	/* DSQ bypass didn't trigger, enqueue on the BPF scheduler */
@@ -2972,7 +2971,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	if (consume_global_dsq(rq))
 		goto has_tasks;
 
-	if (!SCX_HAS_OP(dispatch) || scx_rq_bypassing(rq) || !scx_rq_online(rq))
+	if (unlikely(!SCX_HAS_OP(dispatch)) || scx_rq_bypassing(rq) || !scx_rq_online(rq))
 		goto no_tasks;
 
 	dspc->rq = rq;
@@ -3373,7 +3372,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		return prev_cpu;
 
 	rq_bypass = scx_rq_bypassing(task_rq(p));
-	if (SCX_HAS_OP(select_cpu) && !rq_bypass) {
+	if (likely(SCX_HAS_OP(select_cpu)) && !rq_bypass) {
 		s32 cpu;
 		struct task_struct **ddsp_taskp;
 
@@ -4638,7 +4637,7 @@ static void scx_disable_workfn(struct kthread_work *work)
 	struct task_struct *p;
 	struct rhashtable_iter rht_iter;
 	struct scx_dispatch_q *dsq;
-	int i, kind, cpu;
+	int kind, cpu;
 
 	kind = atomic_read(&scx_exit_kind);
 	while (true) {
@@ -4731,8 +4730,7 @@ static void scx_disable_workfn(struct kthread_work *work)
 
 	/* no task is on scx, turn off all the switches and flush in-progress calls */
 	static_branch_disable(&__scx_enabled);
-	for (i = SCX_OPI_BEGIN; i < SCX_OPI_END; i++)
-		static_branch_disable(&scx_has_op[i]);
+	bitmap_zero(scx_has_op, SCX_OPI_END);
 	scx_idle_disable();
 	synchronize_rcu();
 
@@ -5328,7 +5326,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	for (i = SCX_OPI_CPU_HOTPLUG_BEGIN; i < SCX_OPI_CPU_HOTPLUG_END; i++)
 		if (((void (**)(void))ops)[i])
-			static_branch_enable_cpuslocked(&scx_has_op[i]);
+			set_bit(i, scx_has_op);
 
 	check_hotplug_seq(ops);
 	scx_idle_update_selcpu_topology(ops);
@@ -5369,7 +5367,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 
 	for (i = SCX_OPI_NORMAL_BEGIN; i < SCX_OPI_NORMAL_END; i++)
 		if (((void (**)(void))ops)[i])
-			static_branch_enable(&scx_has_op[i]);
+			set_bit(i, scx_has_op);
 
 	if (scx_ops.cpu_acquire || scx_ops.cpu_release)
 		scx_ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
-- 
2.49.0

