Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2D2741D6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458382; cv=none; b=ut5nViOgJRxFIZYkV69dVtJRVjwB0Tg+2Of3G1kaaK+cWE0kqnljsycI6hU5p+1ayw7C5G3GkGSmib0uvZUxdaAuNf+ADHedhmztbeoSN0XllOglpyD1oXk1bZ5c77977K4k+mN2v9SI1j3s+DMA4YesIooI0CaoKt8jYDMIXJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458382; c=relaxed/simple;
	bh=sn/9YguX9wsJ7H743gFTLgL75AEOpC28E9r9+nFp4LY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=nT17xFfU13DYZVJcsTT0WHZsr+tfsM73iLRUEWfuPdTibI5f3WGbzIvNXK6aeh7bhrkS8V/3/aeysfbFoOYTLR3+EOuWiAmUXYvoKqm7aeNSzy0G87ViSm+0ejcvrHP3U5p2FAarFG5joT9Ssk9i2v+69EAPSHNO21Su8FydT6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=l0ZaEpv2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l0ZaEpv2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Dw8xA6ngL28O6QU6IT+BVPABKR27cDANTRoGcxg6l5Y=; b=l0ZaEpv23O9u00BzRxhV7qxG6Z
	IQb+McSra8y/t/KNYhzzlv9fQAISdT+8hLgsxfUEieTQFOPYYT7QJkBrCLKi4eW3nV3MZ2NjsMG2P
	icLgMMNVHdz2NLdwWHrds5ccCfR4qifhAB2vgmoU0KcylUNdFyoZLQoHv8CwUc1Ja6svhof/Fj/1H
	MrLpr7zM4V1J1ZJm3sjPBauPBu6KQDOVX/rAVb1De3cBD9bDu3TfHa1X+oRZKzdzsBXdcriIS4fXv
	pCQTt5aUOu3ojwctF65f4sQAdmqn3r8OlQfBmU2Gmq602Mj71PKq5WU14IQVWsZFvSxGtRCat/Ver
	7tBgTGUA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKV-00000009lF4-3VbW;
	Wed, 02 Jul 2025 12:12:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C7DD23001C0; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121158.703344062@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:28 +0200
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
Subject: [PATCH v2 04/12] sched: Use lock guard in ttwu_runnable()
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Reflow and get rid of 'ret' variable.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/20250520101727.732703833@infradead.org
---
 kernel/sched/core.c  |   36 ++++++++++++++++--------------------
 kernel/sched/sched.h |    5 +++++
 2 files changed, 21 insertions(+), 20 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3754,28 +3754,24 @@ ttwu_do_activate(struct rq *rq, struct t
  */
 static int ttwu_runnable(struct task_struct *p, int wake_flags)
 {
-	struct rq_flags rf;
-	struct rq *rq;
-	int ret = 0;
+	CLASS(__task_rq_lock, guard)(p);
+	struct rq *rq = guard.rq;
 
-	rq = __task_rq_lock(p, &rf);
-	if (task_on_rq_queued(p)) {
-		update_rq_clock(rq);
-		if (p->se.sched_delayed)
-			enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
-		if (!task_on_cpu(rq, p)) {
-			/*
-			 * When on_rq && !on_cpu the task is preempted, see if
-			 * it should preempt the task that is current now.
-			 */
-			wakeup_preempt(rq, p, wake_flags);
-		}
-		ttwu_do_wakeup(p);
-		ret = 1;
-	}
-	__task_rq_unlock(rq, &rf);
+	if (!task_on_rq_queued(p))
+		return 0;
 
-	return ret;
+	update_rq_clock(rq);
+	if (p->se.sched_delayed)
+		enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
+	if (!task_on_cpu(rq, p)) {
+		/*
+		 * When on_rq && !on_cpu the task is preempted, see if
+		 * it should preempt the task that is current now.
+		 */
+		wakeup_preempt(rq, p, wake_flags);
+	}
+	ttwu_do_wakeup(p);
+	return 1;
 }
 
 void sched_ttwu_pending(void *arg)
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1806,6 +1806,11 @@ task_rq_unlock(struct rq *rq, struct tas
 	raw_spin_unlock_irqrestore(&p->pi_lock, rf->flags);
 }
 
+DEFINE_LOCK_GUARD_1(__task_rq_lock, struct task_struct,
+		    _T->rq = __task_rq_lock(_T->lock, &_T->rf),
+		    __task_rq_unlock(_T->rq, &_T->rf),
+		    struct rq *rq; struct rq_flags rf)
+
 DEFINE_LOCK_GUARD_1(task_rq_lock, struct task_struct,
 		    _T->rq = task_rq_lock(_T->lock, &_T->rf),
 		    task_rq_unlock(_T->rq, _T->lock, &_T->rf),


