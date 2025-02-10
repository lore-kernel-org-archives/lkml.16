Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA552566F3
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739215631; cv=none; b=H4dD/OrODfyYKWg0tlofcFm+UqvYULGajbQbGt65OcSpYK6K6DCd0lbCy2SY4RqI+gTwaBJXVIkPWdu1oAwdfcbHC+4nYsRHLO2Dj7YF8CK/QlKiHj7HlpIqROW/a2e2SQglghTScc7tE86EeiM/8HHizwxleT1AQeg0GrUwvk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739215631; c=relaxed/simple;
	bh=qWXsTZWtCG87Tpj3zeHcU5Gv7oaxQmZwiPgwvU6NQk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K9ISYwVGhW/pS1E2D7K6PD88zE6FjewjXJj2PNnzSRf1qRyjybprnQM63qDyageFcpBdwtvelFT45rlKaahdoUW7/ymqv0e7b2dju06ZKc44sSYl79afTdKHjQbxERwFL79s6C67ARiNm9qRZPmm9L2huPmPESg21YsfJorEZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLI5aCga; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLI5aCga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B51C4CED1;
	Mon, 10 Feb 2025 19:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739215631;
	bh=qWXsTZWtCG87Tpj3zeHcU5Gv7oaxQmZwiPgwvU6NQk0=;
	h=Date:From:To:Cc:Subject:From;
	b=XLI5aCgahZ5bhgiXWVHOuQUvt3pNF34vuQKjeG5vLPaDsw7r+BEuStMoPbj2CoJUA
	 z6AH5iahY6NAU9MTGPW0TOWbQ3cOipPOBWp6x69B5xjAXnjuRLAe+SbMoQq/hndRF4
	 A+TDuPFDSqsQbXqIcsSgf3+I0DMRhw85sORXv1MqVpip6jA0sBhlgoBTp557iiFPa0
	 X8IKw0I1VvrXx+bTIF0FE7GPTbwPZpjQUHjgfNRfyA72TdwWgNVwd9kXIV5YS+Zs24
	 UQq7g8qgAF84BkgntZ+S1mgOMbdYQV1TQ0muYtE7FzoqBfARoBwZ7PeeZ394HgAroW
	 CS4QD7ngUZiFA==
Date: Mon, 10 Feb 2025 09:27:09 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com,
	Jake Hillion <jakehillion@meta.com>
Subject: [PATCH sched_ext/for-6.14-fixes] sched_ext: Fix incorrect assumption
 about migration disabled tasks in task_can_run_on_remote_rq()
Message-ID: <Z6pTDc_TfujiHW5v@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

While fixing migration disabled task handling, 32966821574c ("sched_ext: Fix
migration disabled handling in targeted dispatches") assumed that a
migration disabled task's ->cpus_ptr would only have the pinned CPU. While
this is eventually true for migration disabled tasks that are switched out,
->cpus_ptr update is performed by migrate_disable_switch() which is called
right before context_switch() in __scheduler(). However, the task is
enqueued earlier during pick_next_task() via put_prev_task_scx(), so there
is a race window where another CPU can see the task on a DSQ.

If the CPU tries to dispatch the migration disabled task while in that
window, task_allowed_on_cpu() will succeed and task_can_run_on_remote_rq()
will subsequently trigger SCHED_WARN(is_migration_disabled()).

  WARNING: CPU: 8 PID: 1837 at kernel/sched/ext.c:2466 task_can_run_on_remote_rq+0x12e/0x140
  Sched_ext: layered (enabled+all), task: runnable_at=-10ms
  RIP: 0010:task_can_run_on_remote_rq+0x12e/0x140
  ...
   <TASK>
   consume_dispatch_q+0xab/0x220
   scx_bpf_dsq_move_to_local+0x58/0xd0
   bpf_prog_84dd17b0654b6cf0_layered_dispatch+0x290/0x1cfa
   bpf__sched_ext_ops_dispatch+0x4b/0xab
   balance_one+0x1fe/0x3b0
   balance_scx+0x61/0x1d0
   prev_balance+0x46/0xc0
   __pick_next_task+0x73/0x1c0
   __schedule+0x206/0x1730
   schedule+0x3a/0x160
   __do_sys_sched_yield+0xe/0x20
   do_syscall_64+0xbb/0x1e0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fix it by converting the SCHED_WARN() back to a regular failure path. Also,
perform the migration disabled test before task_allowed_on_cpu() test so
that BPF schedulers which fail to handle migration disabled tasks can be
noticed easily.

While at it, adjust scx_ops_error() message for !task_allowed_on_cpu() case
for brevity and consistency.

Signed-off-by: Tejun Heo <tj@kernel.org>
Fixes: 32966821574c ("sched_ext: Fix migration disabled handling in targeted dispatches")
Reported-by: Jake Hillion <jakehillion@meta.com>
---
 kernel/sched/ext.c |   29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index e01144340d67..54edd0e2132a 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -2343,6 +2343,25 @@ static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
 
 	SCHED_WARN_ON(task_cpu(p) == cpu);
 
+	/*
+	 * If @p has migration disabled, @p->cpus_ptr is updated to contain only
+	 * the pinned CPU in migrate_disable_switch() while @p is being switched
+	 * out. However, put_prev_task_scx() is called before @p->cpus_ptr is
+	 * updated and thus another CPU may see @p on a DSQ inbetween leading to
+	 * @p passing the below task_allowed_on_cpu() check while migration is
+	 * disabled.
+	 *
+	 * Test the migration disabled state first as the race window is narrow
+	 * and the BPF scheduler failing to check migration disabled state can
+	 * easily be masked if task_allowed_on_cpu() is done first.
+	 */
+	if (unlikely(is_migration_disabled(p))) {
+		if (trigger_error)
+			scx_ops_error("SCX_DSQ_LOCAL[_ON] cannot move migration disabled %s[%d] from CPU %d to %d",
+				      p->comm, p->pid, task_cpu(p), cpu);
+		return false;
+	}
+
 	/*
 	 * We don't require the BPF scheduler to avoid dispatching to offline
 	 * CPUs mostly for convenience but also because CPUs can go offline
@@ -2351,17 +2370,11 @@ static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
 	 */
 	if (!task_allowed_on_cpu(p, cpu)) {
 		if (trigger_error)
-			scx_ops_error("SCX_DSQ_LOCAL[_ON] verdict target cpu %d not allowed for %s[%d]",
-				      cpu_of(rq), p->comm, p->pid);
+			scx_ops_error("SCX_DSQ_LOCAL[_ON] target CPU %d not allowed for %s[%d]",
+				      cpu, p->comm, p->pid);
 		return false;
 	}
 
-	/*
-	 * If @p has migration disabled, @p->cpus_ptr only contains its current
-	 * CPU and the above task_allowed_on_cpu() test should have failed.
-	 */
-	SCHED_WARN_ON(is_migration_disabled(p));
-
 	if (!scx_rq_online(rq))
 		return false;
 
