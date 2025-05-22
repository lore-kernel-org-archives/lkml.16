Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A451531F0
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747942004; cv=none; b=k0BIirRSDkz3QtruHOmv0c58nlwl7qaHGWNozG73yXIWraqBXdOevWCOdxZUZIpRg7/4VSPlSIe9MwmnkRcyHIhSs0bQ2YKDreF88+6+H+1D7/zpCssFv91O5/71WI2Gqm2G7sGY1d5qla/LlHlP+sGBrNpxEevoKwSv2E+XLB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747942004; c=relaxed/simple;
	bh=GR9Ta8RLtW3ec58AWnv5ZHpgKed7tcJ1vlm98PMGDj8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxqCwjGf+F/V+4GYDEagjDfwjBBhEZPGYUde8aGw/zblvxpXKNDgCa9gGuoNJyb3NAYSknFUULCCWw98uvNWYXu8XgnHgZTYa9UuiWrxXQr8Gm6jyY1ZXaADpfSGv5EvfRaOy3HbMzQhMMO9mV2K9sr2u+YbzArWw9FH1Hd/dgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9irluPp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9irluPp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E69EC4CEE4;
	Thu, 22 May 2025 19:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747942001;
	bh=GR9Ta8RLtW3ec58AWnv5ZHpgKed7tcJ1vlm98PMGDj8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=A9irluPpe/Rd3C/KVtELdoQJ64TcXWma8t6mIOivyCFZ8Y7mwN5eVOR78QDs4PuDl
	 nTlYWbjR3n6c5OVulHFICtW9Nwwzagndw94B/G9Y+y6s1SS0HaD/QDJBDRhUjPDPEK
	 YNuFADjdSIiyulv7aIxo1wqZt9enocxbmYyTjBQLr7S2Esd1LkVLj7X7ekjw/uLv8s
	 DMT5nFqA6xVN9CsC5L4HnAKgrf74ZkP2cymnxdsYwSCyu1Cbbfe7HeoX7oGuMW1wtt
	 yacFH9VdZq6glh1Bzvp9KSrEi5+825PmrYMb7hSMREU9VvWMEidOKLDCtiPxOTs6fQ
	 QB7aWbz7x8d0Q==
Date: Thu, 22 May 2025 09:26:40 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Call ops.update_idle()
 after updating builtin idle bits
Message-ID: <aC96cDLJmqt1Mjlx@slm.duckdns.org>
References: <aC5SSv5Ne5IZPPl0@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC5SSv5Ne5IZPPl0@slm.duckdns.org>

Applied to sched_ext/for-6.16 with commit message update suggested by
Andrea.

------ 8< ------
From 273cc949655c70001778eb0b9e7db993df845912 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Wed, 21 May 2025 12:23:06 -1000
Subject: [PATCH] sched_ext: Call ops.update_idle() after updating builtin idle
 bits

BPF schedulers that use both builtin CPU idle mechanism and
ops.update_idle() may want to use the latter to create interlocking between
ops.enqueue() and CPU idle transitions so that either ops.enqueue() sees the
idle bit or ops.update_idle() sees the task queued somewhere. This can
prevent race conditions where CPUs go idle while tasks are waiting in DSQs.

For such interlocking to work, ops.update_idle() must be called after
builtin CPU masks are updated. Relocate the invocation. Currently, there are
no ordering requirements on transitions from idle and this relocation isn't
expected to make meaningful differences in that direction.

This also makes the ops.update_idle() behavior semantically consistent:
any action performed in this callback should be able to override the
builtin idle state, not the other way around.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reviewed-and-tested-by: Andrea Righi <arighi@nvidia.com>
Acked-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext_idle.c | 25 +++++++++++++++----------
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
-- 
2.49.0

