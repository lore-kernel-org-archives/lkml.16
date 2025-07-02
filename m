Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529382741C2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458383; cv=none; b=ENc6C8FHf0d1ZN4KYjqyIbJRBRlvd33NzZ/lsa9FwopWGiQ+2wfUlcWxcV+Z0pO990K2E1XDkPhtDdmN7a++zl2n6HKMxXoWkMGcpdXYHWMXeqwPwCO/A+DO+JSXdLYus/0DG6gDQXwnOe9PTlET9PSXkff7eVuoUZJ4/9E9qUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458383; c=relaxed/simple;
	bh=J3pXaPLLZcksnCZhDxc8yeL5D5Q4Iphi1855xC+UhSE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=n5ue8jey3I+S+QC8VZGUaBmj43drTxp65+Eh0AkiMxPaSRHFY6b4jkKkmKFtXgm1XH8fI8K2vKRkeNndtzgwa4aPjI+j2GJsfXzszC46iXSJ6nAX/gbJ6+BdxF2qIm//A2hiXm8DysUVjho40zkPoh0nUmmIjddCyzwVOM4jKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jrb8Lu05; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jrb8Lu05"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=WehO0N/doWNKmSVaorZhtP5NEdHamhAqluYVdptD3h0=; b=jrb8Lu05VSzkOsQb4ZTL12XcDh
	9LONe8K1xgIWpgM229M+/Wcn7Sf6lxHd7k812Ac+5EBSxvfLvJujvTFTJtqKR0o7w/4vSgP69MnJE
	xk4RHLDZjMtViSbHWnBdx2DLoRQncRPUOmZOFVvi5kFo1i2pR56TYcK98ONEdxo1TwozK5b/mu0b2
	U/zjH5ByTTuhcPPZfh9xoSPR/9LZV+0tbE0YdB3wojPg0yPPxO84kXrMyqNqkapWVGy7eR1IzSeWX
	p8O2IaUE8zOLSeYcnI3aonIqIZStAdIW/Rw9YultwW4/tCmy0pqyxs6rO4ZZGuA84i7DCpFYUStgU
	GFWcXXww==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKV-00000009lF3-3Thw;
	Wed, 02 Jul 2025 12:12:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C3F4430017D; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121158.582321755@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@redhat.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 clm@meta.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org
Subject: [PATCH v2 03/12] sched: Optimize ttwu() / select_task_rq()
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Optimize ttwu() by pushing select_idle_siblings() up above waiting for
on_cpu(). This allows making use of the cycles otherwise spend waiting
to search for an idle CPU.

One little detail is that since the task we're looking for an idle CPU
for might still be on the CPU, that CPU won't report as running the
idle task, and thus won't find his own CPU idle, even when it is.

To compensate, remove the 'rq->curr == rq->idle' condition from
idle_cpu() -- it doesn't really make sense anyway.

Additionally, Chris found (concurrently) that perf-c2c reported that
test as being a cache-miss monster.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/20250520101727.620602459@infradead.org
---
 kernel/sched/core.c     |    5 +++--
 kernel/sched/syscalls.c |    3 ---
 2 files changed, 3 insertions(+), 5 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3593,7 +3593,7 @@ int select_task_rq(struct task_struct *p
 		cpu = p->sched_class->select_task_rq(p, cpu, *wake_flags);
 		*wake_flags |= WF_RQ_SELECTED;
 	} else {
-		cpu = cpumask_any(p->cpus_ptr);
+		cpu = task_cpu(p);
 	}
 
 	/*
@@ -4309,6 +4309,8 @@ int try_to_wake_up(struct task_struct *p
 		    ttwu_queue_wakelist(p, task_cpu(p), wake_flags))
 			break;
 
+		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
+
 		/*
 		 * If the owning (remote) CPU is still in the middle of schedule() with
 		 * this task as prev, wait until it's done referencing the task.
@@ -4320,7 +4322,6 @@ int try_to_wake_up(struct task_struct *p
 		 */
 		smp_cond_load_acquire(&p->on_cpu, !VAL);
 
-		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
 		if (task_cpu(p) != cpu) {
 			if (p->in_iowait) {
 				delayacct_blkio_end(p);
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -203,9 +203,6 @@ int idle_cpu(int cpu)
 {
 	struct rq *rq = cpu_rq(cpu);
 
-	if (rq->curr != rq->idle)
-		return 0;
-
 	if (rq->nr_running)
 		return 0;
 


