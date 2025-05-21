Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80136148827
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866188; cv=none; b=XIsY/jKazjHET1LEVqzK5Ce8ArVq2VHLeNUMqtO555o8n/md38FjiSCwIaVYJlG1Rw15Mhup6U6wJI1am3dOwRdMaj8J6Sr0H88uxtcn1gCsq9XuECHQLS3sKhldH1yKvpIp7Pyp4Vd6rnau5mOWG3bgaJBuJDDtwMnv2/NlmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866188; c=relaxed/simple;
	bh=E8fFqQqE525xY+QVgCJpy1LfHJBHBczw2+/HTsgOt1s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vut2+2QIu9m443xUQMBjIsp40Bzu9sscPrjZINYWIpFI+BSBaSOHUjBIEUG3qEkPFVjTOn1TADMy28LyP1ui+/JI/iANU51sMx0/lAIE0Uwhrtyjp2U019+m9Z6aCptu/BaP6JAEVesSi2H8IfYYrN0Kow2KAU/lNDF1grcZw7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mvj08rVu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mvj08rVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21A8C4CEE4;
	Wed, 21 May 2025 22:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866187;
	bh=E8fFqQqE525xY+QVgCJpy1LfHJBHBczw2+/HTsgOt1s=;
	h=Date:From:To:Subject:From;
	b=Mvj08rVuYE6oRvK9a+ob+SC83qs/hJlpkArxeKTmIQnbX8SQVwpFlr3kLpubbsYlD
	 JNjhNOeBHnrCwxGTTvfSU7E/aQ50qsN1u7NHUJrrVEDIxjh53Q67u/P0sOJOC9AEOj
	 cMtfAT27UYJB7ZCRcTdZac6g44TS6p4ncsSSbUpmQPLChqrynbF7/LSFegodPMzxai
	 f0T0m3GqA30qbkP1vFNCXSdnGZiHUvGF3StpC1N/Ej/PyxqVyHpJ1YIalPu+IypmKk
	 VXnqop9sCg2mRk5KPw51DpvL3VSrCeMtDnYWLNc0csrsbeGoIVYvred8SRgpX7TkAl
	 YmpfYJYPRD57w==
Date: Wed, 21 May 2025 12:23:06 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: [PATCH sched_ext/for-6.16] sched_ext: Call ops.update_idle() after
 updating builtin idle bits
Message-ID: <aC5SSv5Ne5IZPPl0@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BPF schedulers that use both builtin CPU idle mechanism and
ops.update_idle() may want to use the latter to create interlocking between
ops.enqueue() and CPU idle transitions so that either ops.enqueue() sees the
idle bit or ops.update_idle() sees the task queued somewhere. This can
prevent race conditions where CPUs go idle while tasks are waiting in DSQs.

For such interlocking to work, ops.update_idle() must be called after
builtin CPU masks are updated. Relocate the invocation. Currently, there are
no ordering requirements on transitions from idle and this relocation isn't
expected to make meaningful differences in that direction.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext_idle.c |   25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index ae30de383913..66da03cc0b33 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -738,16 +738,6 @@ void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
 
 	lockdep_assert_rq_held(rq);
 
-	/*
-	 * Trigger ops.update_idle() only when transitioning from a task to
-	 * the idle thread and vice versa.
-	 *
-	 * Idle transitions are indicated by do_notify being set to true,
-	 * managed by put_prev_task_idle()/set_next_task_idle().
-	 */
-	if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
-		SCX_CALL_OP(sch, SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
-
 	/*
 	 * Update the idle masks:
 	 * - for real idle transitions (do_notify == true)
@@ -765,6 +755,21 @@ void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
 	if (static_branch_likely(&scx_builtin_idle_enabled))
 		if (do_notify || is_idle_task(rq->curr))
 			update_builtin_idle(cpu, idle);
+
+	/*
+	 * Trigger ops.update_idle() only when transitioning from a task to
+	 * the idle thread and vice versa.
+	 *
+	 * Idle transitions are indicated by do_notify being set to true,
+	 * managed by put_prev_task_idle()/set_next_task_idle().
+	 *
+	 * This must come after builtin idle update so that BPF schedulers can
+	 * create interlocking between ops.update_idle() and ops.enqueue() -
+	 * either enqueue() sees the idle bit or update_idle() sees the task
+	 * that enqueue() queued.
+	 */
+	if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
+		SCX_CALL_OP(sch, SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
 }
 
 static void reset_idle_masks(struct sched_ext_ops *ops)

