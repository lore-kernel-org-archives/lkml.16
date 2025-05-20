Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862225D1FE
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736336; cv=none; b=gSncfCfa//tejyi7KwZxQvyVu1Y3uBxTOuR1l9fkZAMb+6bQai00Y86/5zzMzYDuUfqCfIuUDAEEGECAm05cG869s1xRppXgx6j4QwkCPQsAPZcJPcINOqbLqN5GVxi99hU7wYVdYI4rFvVORNAKit65ceUAL1y5zbX8NT5/ATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736336; c=relaxed/simple;
	bh=DjCg4de6F6zvhnjqMUtjzu/zF3gFtaQubS7XUIlgSQ0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=BIii8kAj8lIFp+8TMazZS+NtY/BgRk3VkOgzWX3pMem+wAA4MzKXRZdL7aOPzEKRRiVqvPtgstwD4rGS0KEMRW0rdMvmW3qQ2ppewoPlwwVTXsAC712kco4PhdFXDLJPXnG59tb+KnaXA9pPmL7Hh27rXkIMYsq+mWXysiuQbo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SeQZO8K1; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SeQZO8K1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=8OICcTtnMnbM3sponDMK3LjLnM7Jffrw8obBl5w4ZwI=; b=SeQZO8K1wGGYiEHG5L8xkA6pFr
	lfLsZwFochRd6QdCZe5ACEjQ5iSea6PaLqWuznrkGkb72DCl7TNjUY/teXjbrwEs7GKADbEajKK93
	RFWh9nG7hwsnW7KrOhpvutOIA6zXlWw8EpkZZ0RfcfrYjsD+o79pl+ZrWsg2OVFm//kEuHwCfyl95
	H4zD32WviOymWClbknls6mDHyG5WD0treHNOwgbQGvdyepXFrcjNkeHRxXBt4I9g7rcp0ds46KKep
	uXTaIRo+p97FxrHKeamse2VjsyXz4O8UBbaolhWPkeIwmJQQbQqYXo3NbaXyeD7riyGGb4WdKaw5/
	lqezpOjA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHK3Z-00000000lL4-3lyl;
	Tue, 20 May 2025 10:18:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id BA9F73007CD; Tue, 20 May 2025 12:18:44 +0200 (CEST)
Message-ID: <20250520101727.620602459@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 20 May 2025 11:45:40 +0200
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
Subject: [RFC][PATCH 2/5] sched: Optimize ttwu() / select_task_rq()
References: <20250520094538.086709102@infradead.org>
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
---
 kernel/sched/core.c     |    3 ++-
 kernel/sched/syscalls.c |    3 ---
 2 files changed, 2 insertions(+), 4 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4305,6 +4305,8 @@ int try_to_wake_up(struct task_struct *p
 		    ttwu_queue_wakelist(p, task_cpu(p), wake_flags))
 			break;
 
+		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
+
 		/*
 		 * If the owning (remote) CPU is still in the middle of schedule() with
 		 * this task as prev, wait until it's done referencing the task.
@@ -4316,7 +4318,6 @@ int try_to_wake_up(struct task_struct *p
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
 


