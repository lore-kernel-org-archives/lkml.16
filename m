Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D94255E31
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153585; cv=none; b=j+XkXaLs9hjDonvmHuQ5QxrmXf6MOpocxrKplCngS8DSRjmFD6fDw2+pAgau42QHrNeHdj/Yxa/FngturmGysr8mdkkTYHLbFVXVxT1SwAFSw6qY5cVzVnL4xRuAEEUijJ3f2KvMPaJbSw94tTsEXGtGKbIK6/36whD07GYp0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153585; c=relaxed/simple;
	bh=o70De11W/n8lSRKzGVooizY/b0DBWiKqbWk0eYOT+ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDGOgn4Scf9/vtRaiR41sEjA02Yf9iBWOlAb6i8FT7zVohd9dxK1dhDjwQaGUiLt4iEeg8lPdLb6/0tXpBQH4WBKv/bcFH6YdpvEJ7ngaLm9MJZxDk8prdpa1wdVT7C3Y5Q+q4tR18c59F4btNjabzNx3xpFC/jrpbGC+rNzcZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stx74oVn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stx74oVn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A2DC4CEE5;
	Tue,  8 Apr 2025 23:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744153584;
	bh=o70De11W/n8lSRKzGVooizY/b0DBWiKqbWk0eYOT+ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=stx74oVn7YESoRARDsKsRjRdpvABZSsZ8zhBCJv9sEAUPU/UBZ8BFph4xpu8c+wM7
	 iXu8JYNv2VJDLzUHB66z/X7I4m0KijQeNAGRGuXIPUMky1JepZvV6k0zzhHuOsPQtH
	 NfWcFAmJtLIXi7+6e16C8LsLFvrlixTbtPOBztlHw5bH76SbBMnZOh5eSK/zAv8XJ2
	 GcNgxUDSz43lk/7ukmvBeOSKe5WlAeq+2T73QLCGGlICWHB8Uqmc+y6tYLW/ZuYB4W
	 WXsg08nC0gC/QWmkDL6ZcsTLxjJRniqenYjs1MQasZrnobUmNKSb3RvHarBLgYnvF9
	 w8OUNFfjsNong==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 3/5] sched_ext: Remove scx_ops_cpu_preempt static_key
Date: Tue,  8 Apr 2025 13:06:03 -1000
Message-ID: <20250408230616.2369765-4-tj@kernel.org>
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

scx_ops_cpu_preempt is used to encode whether ops.cpu_acquire/release() are
implemented into a static_key. These tests aren't hot enough for static_key
usage to make any meaningful difference and are made to use a static_key
mostly because there was no reason not to. However, global static_keys can't
work with the planned hierarchical multiple scheduler support. Remove the
static_key and instead use an internal ops flag SCX_OPS_HAS_CPU_PREEMPT to
record and test whether ops.cpu_acquire/release() are implemented.

In repeated hackbench runs before and after static_keys removal on an AMD
Ryzen 3900X, I couldn't tell any measurable performance difference.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 1e685e77b5e4..1adf5c299cce 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -173,6 +173,11 @@ enum scx_ops_flags {
 					  SCX_OPS_SWITCH_PARTIAL |
 					  SCX_OPS_BUILTIN_IDLE_PER_NODE |
 					  SCX_OPS_HAS_CGROUP_WEIGHT,
+
+	/* high 8 bits are internal, don't include in SCX_OPS_ALL_FLAGS */
+	__SCX_OPS_INTERNAL_MASK		= 0xffLLU << 56,
+
+	SCX_OPS_HAS_CPU_PREEMPT		= 1LLU << 56,
 };
 
 /* argument container for ops.init_task() */
@@ -924,7 +929,6 @@ static struct sched_ext_ops scx_ops;
 static bool scx_warned_zero_slice;
 
 DEFINE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
-static DEFINE_STATIC_KEY_FALSE(scx_ops_cpu_preempt);
 
 static struct static_key_false scx_has_op[SCX_OPI_END] =
 	{ [0 ... SCX_OPI_END-1] = STATIC_KEY_FALSE_INIT };
@@ -2931,7 +2935,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	rq->scx.flags |= SCX_RQ_IN_BALANCE;
 	rq->scx.flags &= ~(SCX_RQ_BAL_PENDING | SCX_RQ_BAL_KEEP);
 
-	if (static_branch_unlikely(&scx_ops_cpu_preempt) &&
+	if ((scx_ops.flags & SCX_OPS_HAS_CPU_PREEMPT) &&
 	    unlikely(rq->scx.cpu_released)) {
 		/*
 		 * If the previous sched_class for the current CPU was not SCX,
@@ -3160,7 +3164,7 @@ static void switch_class(struct rq *rq, struct task_struct *next)
 	 */
 	smp_store_release(&rq->scx.pnt_seq, rq->scx.pnt_seq + 1);
 #endif
-	if (!static_branch_unlikely(&scx_ops_cpu_preempt))
+	if (!(scx_ops.flags & SCX_OPS_HAS_CPU_PREEMPT))
 		return;
 
 	/*
@@ -4725,7 +4729,6 @@ static void scx_disable_workfn(struct kthread_work *work)
 	for (i = SCX_OPI_BEGIN; i < SCX_OPI_END; i++)
 		static_branch_disable(&scx_has_op[i]);
 	static_branch_disable(&scx_ops_allow_queued_wakeup);
-	static_branch_disable(&scx_ops_cpu_preempt);
 	scx_idle_disable();
 	synchronize_rcu();
 
@@ -5367,7 +5370,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	if (ops->flags & SCX_OPS_ALLOW_QUEUED_WAKEUP)
 		static_branch_enable(&scx_ops_allow_queued_wakeup);
 	if (scx_ops.cpu_acquire || scx_ops.cpu_release)
-		static_branch_enable(&scx_ops_cpu_preempt);
+		scx_ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
 
 	/*
 	 * Lock out forks, cgroup on/offlining and moves before opening the
-- 
2.49.0

