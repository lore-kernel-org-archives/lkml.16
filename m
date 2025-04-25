Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AFE233735
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618333; cv=none; b=OTEdxzGFzGK8AU0ydH42hzbMtJH8iJP8PkCmUfoIWtwqxVSEXQPvPZSVoBBHHStDBo94NttVFUfePqk+NZGzEtYF2FbBp/YYf8lUH0cUZzStk7BNNyoJChfOHizJrohohKDD7zwx+V9bXsoDInfo7ghPoApW/vCEl0kTbA0FTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618333; c=relaxed/simple;
	bh=yqAY6V0hjKFKmIR/TI3g9ywCN2zwYuzs6Ha9lCJsNRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRY3WfMYigiG95e4K67RL6Nd83+8ZlwlFGTV//HtNjilHYoLU9svZULz0qt7q34GbOND61euPU/XVjFLFnRB0XNAjP9lwjUDMb+ukH8sHWJMhEYhYW/x2YMcGPcBwtG5cA9vEHttH8E/4vyro6JteYShaI5VxBPps1kY3O043vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNw7A0DH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNw7A0DH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C672C4CEEB;
	Fri, 25 Apr 2025 21:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618333;
	bh=yqAY6V0hjKFKmIR/TI3g9ywCN2zwYuzs6Ha9lCJsNRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNw7A0DHzt0Ur4oeEo8wj+4KHY6ohgUxx3MZ8kwJqk+ZjAvebgPfxwlWfvHaFLob2
	 yVaRUDu2tN/sqTnsyTh68NLIxexDVPNdkGSpXSCLbzD86xAKXOgsLaG/Rt5gO2Bea9
	 im2kKj6/Rn1PkJivtFUsEiayMY3vHjfoWby+D744NQcIF5hreLO+kVLq8paMEP7ssi
	 jatLiuicOjHXbQ4ihnrhk60+oVZ/vj4HMGeFsrL1QBjpyBzrgYjJ6DypQDnwxF3JNv
	 oiDYDfh5P+dl2wdEfrA33QJJEONNc8SyV+Yiv49xxbPTCVPraam0RbSmd3r+zLBioA
	 2eHN2LFb0ck7w==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 08/12] sched_ext: Relocate scx_event_stats definition
Date: Fri, 25 Apr 2025 11:58:23 -1000
Message-ID: <20250425215840.2334972-9-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425215840.2334972-1-tj@kernel.org>
References: <20250425215840.2334972-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In prepration of moving event_stats_cpu into scx_sched, move scx_event_stats
definitions above scx_sched definition. No functional changes.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 114 ++++++++++++++++++++++-----------------------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index a6dd096add3d..bbcd7c0f561e 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -766,6 +766,63 @@ enum scx_opi {
 	SCX_OPI_END			= SCX_OP_IDX(init),
 };
 
+/*
+ * Collection of event counters. Event types are placed in descending order.
+ */
+struct scx_event_stats {
+	/*
+	 * If ops.select_cpu() returns a CPU which can't be used by the task,
+	 * the core scheduler code silently picks a fallback CPU.
+	 */
+	s64		SCX_EV_SELECT_CPU_FALLBACK;
+
+	/*
+	 * When dispatching to a local DSQ, the CPU may have gone offline in
+	 * the meantime. In this case, the task is bounced to the global DSQ.
+	 */
+	s64		SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE;
+
+	/*
+	 * If SCX_OPS_ENQ_LAST is not set, the number of times that a task
+	 * continued to run because there were no other tasks on the CPU.
+	 */
+	s64		SCX_EV_DISPATCH_KEEP_LAST;
+
+	/*
+	 * If SCX_OPS_ENQ_EXITING is not set, the number of times that a task
+	 * is dispatched to a local DSQ when exiting.
+	 */
+	s64		SCX_EV_ENQ_SKIP_EXITING;
+
+	/*
+	 * If SCX_OPS_ENQ_MIGRATION_DISABLED is not set, the number of times a
+	 * migration disabled task skips ops.enqueue() and is dispatched to its
+	 * local DSQ.
+	 */
+	s64		SCX_EV_ENQ_SKIP_MIGRATION_DISABLED;
+
+	/*
+	 * Total number of times a task's time slice was refilled with the
+	 * default value (SCX_SLICE_DFL).
+	 */
+	s64		SCX_EV_REFILL_SLICE_DFL;
+
+	/*
+	 * The total duration of bypass modes in nanoseconds.
+	 */
+	s64		SCX_EV_BYPASS_DURATION;
+
+	/*
+	 * The number of tasks dispatched in the bypassing mode.
+	 */
+	s64		SCX_EV_BYPASS_DISPATCH;
+
+	/*
+	 * The number of times the bypassing mode has been activated.
+	 */
+	s64		SCX_EV_BYPASS_ACTIVATE;
+};
+
 struct scx_sched {
 	struct sched_ext_ops	ops;
 	DECLARE_BITMAP(has_op, SCX_OPI_END);
@@ -1542,63 +1599,6 @@ static struct task_struct *scx_task_iter_next_locked(struct scx_task_iter *iter)
 	return p;
 }
 
-/*
- * Collection of event counters. Event types are placed in descending order.
- */
-struct scx_event_stats {
-	/*
-	 * If ops.select_cpu() returns a CPU which can't be used by the task,
-	 * the core scheduler code silently picks a fallback CPU.
-	 */
-	s64		SCX_EV_SELECT_CPU_FALLBACK;
-
-	/*
-	 * When dispatching to a local DSQ, the CPU may have gone offline in
-	 * the meantime. In this case, the task is bounced to the global DSQ.
-	 */
-	s64		SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE;
-
-	/*
-	 * If SCX_OPS_ENQ_LAST is not set, the number of times that a task
-	 * continued to run because there were no other tasks on the CPU.
-	 */
-	s64		SCX_EV_DISPATCH_KEEP_LAST;
-
-	/*
-	 * If SCX_OPS_ENQ_EXITING is not set, the number of times that a task
-	 * is dispatched to a local DSQ when exiting.
-	 */
-	s64		SCX_EV_ENQ_SKIP_EXITING;
-
-	/*
-	 * If SCX_OPS_ENQ_MIGRATION_DISABLED is not set, the number of times a
-	 * migration disabled task skips ops.enqueue() and is dispatched to its
-	 * local DSQ.
-	 */
-	s64		SCX_EV_ENQ_SKIP_MIGRATION_DISABLED;
-
-	/*
-	 * Total number of times a task's time slice was refilled with the
-	 * default value (SCX_SLICE_DFL).
-	 */
-	s64		SCX_EV_REFILL_SLICE_DFL;
-
-	/*
-	 * The total duration of bypass modes in nanoseconds.
-	 */
-	s64		SCX_EV_BYPASS_DURATION;
-
-	/*
-	 * The number of tasks dispatched in the bypassing mode.
-	 */
-	s64		SCX_EV_BYPASS_DISPATCH;
-
-	/*
-	 * The number of times the bypassing mode has been activated.
-	 */
-	s64		SCX_EV_BYPASS_ACTIVATE;
-};
-
 /*
  * The event counter is organized by a per-CPU variable to minimize the
  * accounting overhead without synchronization. A system-wide view on the
-- 
2.49.0

