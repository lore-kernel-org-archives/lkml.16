Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA0423B615
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152135; cv=none; b=L8S5W+GQ68aV9yePZcHlWINkwVFuRkzwooMafl1lzYFLrOknhve30cvkzJZ+bBuOFx5O2e45+zfIJ5PSWdMDCXh6iLj9urIXTpdUt0rnZRhgZIfmq8F+5e029SZxbSCJYKG5DIuJY3jMI6wApCRgJ2NrffP5CAvST+HF/ghit7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152135; c=relaxed/simple;
	bh=gGXB13lrWUQFhPpL4EL6VOeiUO/5hI1oH05EdZE0p1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iunszms0g6TuVpUCi4jxx3zDLH0cmq0vzmdLjoKvCK9tQSXbQ5A5HeRJOtfRPLO+Zgq9U02jsJL8onmFOBoecplSJgIrQCRQksXIYWUd4FcDJSLWLSbaxzyPGOgsEuMvqY7S+RQQPMezZEf5TKE07C8zXX7reeTxChUue53ndsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eS8MSOHi; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eS8MSOHi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R+yEvGkOHGBrwFRPP1Ra1mW4ovud5RNj/OYyQHzRHXo=; b=eS8MSOHiRgu8WYA19ZchHIHnL9
	ceDla4/ANUkOCpysaIhPAILO0gHJIgShcOnhyesXcytG9v5o3rBqpR8hRRbfj90T2EjxYy6OpHwwa
	1fY2r5z8A+eF+yf7hPISaPqKIB0PWC7u3hH8D+df4Toa+OpFWJaAr3zBtasnZYI4IMy24Xz/tCjUi
	p1hYFH4Oyg+0t2QdD9y5cSIne+qcfvhjD5AMD0BDQ2pnB7A9JJfmlXmEuiJCQh5tbAShi/l/aeu9c
	1ZPi9ya6pQf2wz7vhOY2Q+16FW4PINi//kaZgaEm+8WSfXq6iI0WEttVSLaUOst0TJs0d3Plh0XpE
	jN6Bkvag==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSW9-00000003kqp-2gHm;
	Tue, 17 Jun 2025 09:22:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 363BD30BDAD; Tue, 17 Jun 2025 11:22:08 +0200 (CEST)
Date: Tue, 17 Jun 2025 11:22:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] sched/fair: Manage lag and run to parity with
 different slices
Message-ID: <20250617092208.GQ1613376@noisy.programming.kicks-ass.net>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="dg8YfIraIgJZAKwm"
Content-Disposition: inline
In-Reply-To: <20250613140514.2781138-1-vincent.guittot@linaro.org>


--dg8YfIraIgJZAKwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2025 at 04:05:10PM +0200, Vincent Guittot wrote:
> Vincent Guittot (3):
>   sched/fair: Use protect_slice() instead of direct comparison
>   sched/fair: Limit run to parity to the min slice of enqueued entities
>   sched/fair: Improve NO_RUN_TO_PARITY

Ah. I wrote these here patches and then totally forgot about them :/.
They take a different approach.

The approach I took was to move decision to stick with curr after pick,
instead of before it. That way we can evaluate the tree at the time of
preemption.



--dg8YfIraIgJZAKwm
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="peterz-sched-fair-fix-delayed-requeue.patch"

Subject: sched/fair: Fix requeue_delayed_entity()
From: Peter Zijlstra <peterz@infradead.org>
Date: Fri Apr  4 11:23:00 CEST 2025

Since enqueue_task_fair() doesn't call update_curr() before calling
requeue_delayed_entity(), which means that update_entity_lag() uses a
slightly out-of-date avg_vruntime() -- which includes current.

Fixes: 54a58a787791 ("sched/fair: Implement DELAY_ZERO")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6893,6 +6893,8 @@ requeue_delayed_entity(struct sched_enti
 {
 	struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
+	update_curr(cfs_rq);
+
 	/*
 	 * se->sched_delayed should imply: se->on_rq == 1.
 	 * Because a delayed entity is one that is still on

--dg8YfIraIgJZAKwm
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="peterz-sched-fair-fix-preempt-short.patch"

Subject: sched/eevdf: Re-arrange current protection in pick_eevdf()
From: Peter Zijlstra <peterz@infradead.org>
Date: Fri Apr 4 10:15:15 CEST 2025

The way pick_eevdf() limits preemption is by explicitly picking
current if it is still eligible. It does this without consideration of
the best in-tree task.

Move current protection to after the tree selection such that a follow
up patch can change the conditions.

Should be an semantics no-op at this point.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c |   33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -903,6 +903,26 @@ static inline void cancel_protect_slice(
 		se->vlag = se->deadline + 1;
 }
 
+static inline bool __pick_eevdf_curr(struct cfs_rq *cfs_rq, struct sched_entity *best)
+{
+	struct sched_entity *curr = cfs_rq->curr;
+
+	/* only called when this is already checked */
+	WARN_ON_ONCE(!curr || !curr->on_rq);
+
+	/*
+	 * Strictly speaking we should allow current to run until its
+	 * deadline. However allow (wakeup) preemption once it is no longer
+	 * eligible.
+	 */
+	if (sched_feat(RUN_TO_PARITY) &&
+	    protect_slice(curr) &&
+	    entity_eligible(cfs_rq, curr))
+		return true;
+
+	return entity_before(curr, best);
+}
+
 /*
  * Earliest Eligible Virtual Deadline First
  *
@@ -929,18 +949,15 @@ static struct sched_entity *pick_eevdf(s
 	struct sched_entity *curr = cfs_rq->curr;
 	struct sched_entity *best = NULL;
 
+	if (curr && !curr->on_rq)
+		curr = NULL;
+
 	/*
 	 * We can safely skip eligibility check if there is only one entity
 	 * in this cfs_rq, saving some cycles.
 	 */
 	if (cfs_rq->nr_queued == 1)
-		return curr && curr->on_rq ? curr : se;
-
-	if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
-		curr = NULL;
-
-	if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
-		return curr;
+		return curr ?: se;
 
 	/* Pick the leftmost entity if it's eligible */
 	if (se && entity_eligible(cfs_rq, se)) {
@@ -977,7 +994,7 @@ static struct sched_entity *pick_eevdf(s
 		node = node->rb_right;
 	}
 found:
-	if (!best || (curr && entity_before(curr, best)))
+	if (!best || (curr && __pick_eevdf_curr(cfs_rq, best)))
 		best = curr;
 
 	return best;

--dg8YfIraIgJZAKwm
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="peterz-sched-fair-fix-preempt-short-2.patch"

Subject: sched/eevdf: Fix RUN_TO_PARITY vs PREEMPT_SHORT
From: Peter Zijlstra <peterz@infradead.org>
Date: Fri Apr 4 10:25:03 CEST 2025

Vincent noted that RUN_TO_PARITY can prevent preemption by a shorter
slice under some conditions.

Reported-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -918,7 +918,7 @@ static inline bool __pick_eevdf_curr(str
 	if (sched_feat(RUN_TO_PARITY) &&
 	    protect_slice(curr) &&
 	    entity_eligible(cfs_rq, curr))
-		return true;
+		return !sched_feat(PREEMPT_SHORT) || curr->slice < best->slice;
 
 	return entity_before(curr, best);
 }
@@ -1195,7 +1195,7 @@ static inline bool did_preempt_short(str
 	if (!sched_feat(PREEMPT_SHORT))
 		return false;
 
-	if (curr->vlag == curr->deadline)
+	if (protect_slice(curr))
 		return false;
 
 	return !entity_eligible(cfs_rq, curr);

--dg8YfIraIgJZAKwm--
