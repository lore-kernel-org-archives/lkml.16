Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5825FA10
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736335; cv=none; b=IXf5vaIIMUzzeiLVRckbLct/quwwk2SjbLMOtxhal8Ay+jRM0WGNxSU/XH4ZEqdiEwqkJ3QfSYWuxP4weUWh/VwBejOfbMK4MKI6srXUk9kO/q9z8r9K5Rok3g8wuAVJevca3O7nFInWu2NzL/xgkQRM+HG9Oj2yhedpLJkwHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736335; c=relaxed/simple;
	bh=a/MUVsZErBo9JFahoi2yE3aPodJX2QNyVjjkX/G7GbY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=kxKlRWvzASx4Q+pGHfiQNmh54CWrsuOwVMcU7QLtiOVlpn6rqYKEmOK0eG8PBN71MSDHTCxTRrQYPsxicaeylDPHHtpEqYsVjBgvFlq19qTlsMVyGEmt9z54nf9I7ntO9nTQE7R05Imtu2qQqIdq8YVqZJB4tRuRqvEENj6V1/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rHP2cvAH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rHP2cvAH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=kxcwxZ4VbmtKYSzZAeKBWZN0eOo9U7Z3p03L3HjcBBo=; b=rHP2cvAHPoDA0jbIZzB4U85+4c
	bZ22mCHr+fTN4hrtPufdzWYdb66XiIEpWdeDpOEc79hon26VARddwiYUGLWBX7zmtoX/SWxGLbVpL
	xuc2fSyMN6ufCeNZ5cpwcrLsHgeZRFaZXWg0EyH+lswqJoEozwCyO/6JSwTYQIbzrM5zEFATNoynH
	NeSOI9A4mYHoa+d/5O6bgqimmz1S0Kn/GO+mCr2xdfvTqBPvkVcguIVnykvcGte2dbz+0CwsPsymm
	WWTzmfhtW8CVaJ2N5ZvDb8uL6H9oPgAku258oWSQfbBuyoEazOcttY82R+00cOsJO8AgDXvc6rNZQ
	ez/6/MSg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHK3Z-000000038He-2Rzd;
	Tue, 20 May 2025 10:18:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id BE348300BDD; Tue, 20 May 2025 12:18:44 +0200 (CEST)
Message-ID: <20250520101727.732703833@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 20 May 2025 11:45:41 +0200
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
Subject: [RFC][PATCH 3/5] sched: Split up ttwu_runnable()
References: <20250520094538.086709102@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Split up ttwu_runnable() in preparation for more changes.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c  |   43 +++++++++++++++++++++----------------------
 kernel/sched/sched.h |    5 +++++
 2 files changed, 26 insertions(+), 22 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3765,6 +3765,25 @@ ttwu_do_activate(struct rq *rq, struct t
 #endif
 }
 
+static int __ttwu_runnable(struct rq *rq, struct task_struct *p, int wake_flags)
+{
+	if (!task_on_rq_queued(p))
+		return 0;
+
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
+}
+
 /*
  * Consider @p being inside a wait loop:
  *
@@ -3792,28 +3811,8 @@ ttwu_do_activate(struct rq *rq, struct t
  */
 static int ttwu_runnable(struct task_struct *p, int wake_flags)
 {
-	struct rq_flags rf;
-	struct rq *rq;
-	int ret = 0;
-
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
-
-	return ret;
+	CLASS(__task_rq_lock, guard)(p);
+	return __ttwu_runnable(guard.rq, p, wake_flags);
 }
 
 #ifdef CONFIG_SMP
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1831,6 +1831,11 @@ task_rq_unlock(struct rq *rq, struct tas
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


