Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7671219C57C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738961905; cv=none; b=CKAJ1rZLN1s6Z6B9JXuZRfjf1LHSlMVLHVePIkCoa2aqOD20Bx3jZUG/947YXxgEGLE52uRtuFEcXtHqGkTSCM/Sk6jg6tNMwmz9WVyOHv9q7dsn5Z2FnrCDQTbMO39wA0jnxUUhwyIhyzGD3Is0kXTNl1vqUsloM4lu49vbhnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738961905; c=relaxed/simple;
	bh=QiuQnx28cJB0ahNmGnfzVmE5WhzlI4cl3/aFIyRBfmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJJXSsx6weWhzx2ZFlenokYaMUE4r3aKOZc+ub6/rNSsnGH7ATDTaG/Bn1Vdrj+7sZSvioDH8vmP2FLrrRf7d5PFSY1LAp/Fdi96I2R3c1n4ILjiogi3tVtb011geRu+ipLg1jCV2SrhLhR4nRs44apLjDFUPYs9uTXqfVE2cVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtLpxp99; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtLpxp99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40A6C4CED1;
	Fri,  7 Feb 2025 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738961905;
	bh=QiuQnx28cJB0ahNmGnfzVmE5WhzlI4cl3/aFIyRBfmg=;
	h=Date:From:To:Cc:Subject:From;
	b=jtLpxp99jpvq0C0hgjgMCD1DSGsutO1pgmqoR8Oikhj5RbTKbXOEn65C0qItmV0ZK
	 1EoP5DG25wX+A/T4Qcmhe/isZvN2w1kAQN7qY99LLuWNb25HehhXF90zHwhvZRuv8K
	 jF3d4ZWhtR8S8ysNDTlkQD+eySdszD5Vj11pUKez5t8dvhaqsBsUXX+2VVkdnhFuTj
	 RiKrTK3Y35dhSLiLjHKio9QrucoQmIdCZG/PkTk2qSNqwwr06f3iSq6Kk4TdV3+0AR
	 MvcwTrIAb2wd6BzO9NG0bz6Z2mA0m2PEfUQPvd3bmy2BmPAoYUSIdv0BuYX2QO0kf9
	 LeF1hxMEgukRA==
Date: Fri, 7 Feb 2025 10:58:23 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: [PATCH sched_ext/for-6.14-fixes 1/2] sched_ext: Implement auto local
 dispatching of migration disabled tasks
Message-ID: <Z6Zz79AUub1YuHwD@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Migration disabled tasks are special and pinned to their previous CPUs. They
tripped up some unsuspecting BPF schedulers as their ->nr_cpus_allowed may
not agree with the bits set in ->cpus_ptr. Make it easier for BPF schedulers
by automatically dispatching them to the pinned local DSQs by default. If a
BPF scheduler wants to handle migration disabled tasks explicitly, it can
set SCX_OPS_ENQ_MIGRATION_DISABLED.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -123,6 +123,19 @@ enum scx_ops_flags {
 	SCX_OPS_SWITCH_PARTIAL	= 1LLU << 3,
 
 	/*
+	 * A migration disabled task can only execute on its current CPU. By
+	 * default, such tasks are automatically put on the CPU's local DSQ with
+	 * the default slice on enqueue. If this ops flag is set, they also go
+	 * through ops.enqueue().
+	 *
+	 * A migration disabled task never invokes ops.select_cpu() as it can
+	 * only select the current CPU. Also, p->cpus_ptr will only contain its
+	 * current CPU while p->nr_cpus_allowed keeps tracking p->user_cpus_ptr
+	 * and thus may disagree with cpumask_weight(p->cpus_ptr).
+	 */
+	SCX_OPS_ENQ_MIGRATION_DISABLED = 1LLU << 4,
+
+	/*
 	 * CPU cgroup support flags
 	 */
 	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* cpu.weight */
@@ -130,6 +143,7 @@ enum scx_ops_flags {
 	SCX_OPS_ALL_FLAGS	= SCX_OPS_KEEP_BUILTIN_IDLE |
 				  SCX_OPS_ENQ_LAST |
 				  SCX_OPS_ENQ_EXITING |
+				  SCX_OPS_ENQ_MIGRATION_DISABLED |
 				  SCX_OPS_SWITCH_PARTIAL |
 				  SCX_OPS_HAS_CGROUP_WEIGHT,
 };
@@ -882,6 +896,7 @@ static bool scx_warned_zero_slice;
 
 static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_last);
 static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_exiting);
+static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_migration_disabled);
 static DEFINE_STATIC_KEY_FALSE(scx_ops_cpu_preempt);
 static DEFINE_STATIC_KEY_FALSE(scx_builtin_idle_enabled);
 
@@ -2014,6 +2029,11 @@ static void do_enqueue_task(struct rq *r
 	    unlikely(p->flags & PF_EXITING))
 		goto local;
 
+	/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
+	if (!static_branch_unlikely(&scx_ops_enq_migration_disabled) &&
+	    is_migration_disabled(p))
+		goto local;
+
 	if (!SCX_HAS_OP(enqueue))
 		goto global;
 
@@ -5052,6 +5072,7 @@ static void scx_ops_disable_workfn(struc
 		static_branch_disable(&scx_has_op[i]);
 	static_branch_disable(&scx_ops_enq_last);
 	static_branch_disable(&scx_ops_enq_exiting);
+	static_branch_disable(&scx_ops_enq_migration_disabled);
 	static_branch_disable(&scx_ops_cpu_preempt);
 	static_branch_disable(&scx_builtin_idle_enabled);
 	synchronize_rcu();
@@ -5661,6 +5682,8 @@ static int scx_ops_enable(struct sched_e
 
 	if (ops->flags & SCX_OPS_ENQ_EXITING)
 		static_branch_enable(&scx_ops_enq_exiting);
+	if (ops->flags & SCX_OPS_ENQ_MIGRATION_DISABLED)
+		static_branch_enable(&scx_ops_enq_migration_disabled);
 	if (scx_ops.cpu_acquire || scx_ops.cpu_release)
 		static_branch_enable(&scx_ops_cpu_preempt);
 
