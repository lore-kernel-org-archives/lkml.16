Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7BB2BE7C8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897696; cv=none; b=gjqiNOeaHlm4FXbbXpku8kzRtSanH+iUYubOZFyxcyxvSCufIX5RRcP7hRtLsL1fDJSdIwJqO72dyqf27P+5/IxkipVysQCZYYkfRYlpMUGwiJR4/FR9UIUkvfJTSW++dXs/62NZzV083fKAEgTPuCLw4jU+ABv8usbfWQqlES4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897696; c=relaxed/simple;
	bh=f3vDGUfr/K0NLAPPU4VKw2rDAEi3+ik8Sta91v9w8N8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FW0q0000FVm2RB/dOwzKO4P/BKVxSxn7iqqyqhXN438E6PGdYOHfTEK4VKoXPMLmUWYKeOaYpjco2wdpI9Pkl5NPmJF5ihP1jiifWCMnCLZHLMn2kDip2cM7mOHR5l/Kh5u97MGNTuvZAAtweXBf4+pf+MM89EACBFJF2hZuq14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Xr88XP5t; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xr88XP5t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PzRBiyK/Tja7fxyCyCvByclVfaFZRVub5SyjZCkEFu8=; b=Xr88XP5t/iax+NIJ49j8OCX0w4
	sCNUgwDE3qB3i88Jl4UwNJn32bZvMiJlPFJ8mrH+QoflDXbnkSTTnEku4sr1z8c0jd0y5mENMnZL2
	D2gkOvU65YfGheMFi2ByFzGmoj+095Q/EHLV3hyvatD6CXEr+dZgwcCuzkO6KcEZqLB+ds2uyqIme
	qDPryBmNS8rU+sFl7LeEE6wfCc4yulsIbaZmw78v+PWPdUMopGQwzyd1iHlDG3hoR3kfbFNX/Q8Ws
	Vz8VOCACwIbahf5MQFfBqiyBETrP3fBt1Q03+o7JtsJZHLSts4roZCSy4HoElr6vAfswCZ57SSSJ8
	e9kOvAdw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmcF-0000000DN0k-01S6;
	Mon, 07 Jul 2025 14:14:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C7449300399; Mon, 07 Jul 2025 16:14:41 +0200 (CEST)
Date: Mon, 7 Jul 2025 16:14:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, dhaval@gianis.ca, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] sched/fair: Manage lag and run to parity with
 different slices
Message-ID: <20250707141441.GG1613200@noisy.programming.kicks-ass.net>
References: <20250704143612.998419-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704143612.998419-1-vincent.guittot@linaro.org>

On Fri, Jul 04, 2025 at 04:36:06PM +0200, Vincent Guittot wrote:
> This follows the attempt to better track maximum lag of tasks in presence
> of different slices duration:
> [1]  https://lore.kernel.org/all/20250418151225.3006867-1-vincent.guittot@linaro.org/
> 
> Since v1, tracking of the max slice has been removed from the patchset
> because we now ensure that the lag of an entity remains in the range of:
>    
>   [-(slice + tick) : (slice + tick)] with run_to_parity
> and
>   [max(-slice, -(0.7+tick) : max(slice , (0.7+tick)] without run to parity
>   
> As a result, there is no need the max slice of enqueued entities anymore.
> 
> Patch 1 is a simple cleanup to ease following changes.
> 
> Patch 2 fixes the lag for NO_RUN_TO_PARITY. It has been put 1st because of
> its simplicity. The running task has a minimum protection of 0.7ms before
> eevdf looks for another task.

The usage of min() on vruntimes is broken; it doesn't work right in the
face of wrapping; use min_vruntime().

Also, perhaps it is time to better document this vlag abuse.

> Patch 3 ensures that the protection is canceled only if the waking task
> will be selected by pick_task_fair. This case has been mentionned by Peter
> will reviewing v1.
> 
> Patch 4 modifes the duration of the protection to take into account the
> shortest slice of enqueued tasks instead of the slice of the running task.
> 
> Patch 5 fixes the case of tasks not being eligible at wakeup or after
> migrating  but with a shorter slice. We need to update the duration of the
> protection to not exceed the lag.

This has issues with non-determinism; specifically,
update_protected_slice() will use the current ->vruntime, and as such
can unduly push forward the protection window.

> Patch 6 fixes the case of tasks still being eligible after the protected
> period but others must run to no exceed lag limit. This has been
> highlighted in a test with delayed entities being dequeued with a positive
> lag larger than their slice but it can happen for delayed dequeue entity
> too.

At this point resched_next_quantum() becomes !protec_slice() and can be
removed.

How about something like so? I've probably wrecked the whole
!RUN_TO_PARITY thing -- so that needs to be put back in.

--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -579,7 +579,15 @@ struct sched_entity {
 	u64				sum_exec_runtime;
 	u64				prev_sum_exec_runtime;
 	u64				vruntime;
-	s64				vlag;
+	union {
+		/*
+		 * When !@on_rq this field is vlag.
+		 * When cfs_rq->curr == se (which implies @on_rq)
+		 * this field is vprot. See protect_slice().
+		 */
+		s64			vlag;
+		u64			vprot;
+	};
 	u64				slice;
 
 	u64				nr_migrations;
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -882,45 +882,36 @@ struct sched_entity *__pick_first_entity
 }
 
 /*
- * HACK, Set the vruntime up to which an entity can run before picking another
- * one, in vlag, which isn't used until dequeue.
- * In case of run to parity, we use the shortest slice of the enqueued entities
- * to define the longest runtime.
- * When run to parity is disabled, we give a minimum quantum to the running
- * entity to ensure progress.
+ * Take a snapshot of the vruntime at the point the task gets scheduled.
  */
 static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	u64 quantum;
-
-	if (sched_feat(RUN_TO_PARITY))
-		quantum = cfs_rq_min_slice(cfs_rq);
-	else
-		quantum = normalized_sysctl_sched_base_slice;
-	quantum = min(quantum, se->slice);
-
-	if (quantum != se->slice)
-		se->vlag = min(se->deadline, se->vruntime + calc_delta_fair(quantum, se));
-	else
-		se->vlag = se->deadline;
+	se->vprot = se->vruntime;
 }
 
-static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
+/*
+ * Should we still run @se? It is allowed to run until either se->deadline or
+ * until se->vprot + min_vslice, whichever comes first.
+ */
+static inline bool protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	u64 quantum = cfs_rq_min_slice(cfs_rq);
+	u64 min_vslice, deadline = se->deadline;
+	u64 min_slice = cfs_rq_min_slice(cfs_rq);
 
-	se->vlag = min(se->vlag, (s64)(se->vruntime + calc_delta_fair(quantum, se)));
-}
+	if (min_slice != se->slice) {
+		min_vslice = calc_delta_fair(min_slice, se);
+		deadline = min_vruntime(se->deadline, se->vprot + min_vslice);
+	}
 
-static inline bool protect_slice(struct sched_entity *se)
-{
-	return ((s64)(se->vlag - se->vruntime) > 0);
+	WARN_ON_ONCE(!se->on_rq);
+
+	return ((s64)(deadline - se->vruntime) > 0);
 }
 
-static inline void cancel_protect_slice(struct sched_entity *se)
+static inline void cancel_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	if (protect_slice(se))
-		se->vlag = se->vruntime;
+	if (protect_slice(cfs_rq, se))
+		se->vprot = se->vruntime - calc_delta_fair(NSEC_PER_SEC, se);
 }
 
 /*
@@ -959,7 +950,7 @@ static struct sched_entity *__pick_eevdf
 	if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
 		curr = NULL;
 
-	if (curr && protect && protect_slice(curr))
+	if (curr && protect && protect_slice(cfs_rq, curr))
 		return curr;
 
 	/* Pick the leftmost entity if it's eligible */
@@ -1183,14 +1174,6 @@ static inline void update_curr_task(stru
 	cgroup_account_cputime(p, delta_exec);
 }
 
-static inline bool resched_next_quantum(struct cfs_rq *cfs_rq, struct sched_entity *curr)
-{
-	if (protect_slice(curr))
-		return false;
-
-	return true;
-}
-
 /*
  * Used by other classes to account runtime.
  */
@@ -1251,7 +1234,7 @@ static void update_curr(struct cfs_rq *c
 	if (cfs_rq->nr_queued == 1)
 		return;
 
-	if (resched || resched_next_quantum(cfs_rq, curr)) {
+	if (resched || !protect_slice(cfs_rq, curr)) {
 		resched_curr_lazy(rq);
 		clear_buddies(cfs_rq, curr);
 	}
@@ -8729,7 +8712,7 @@ static void check_preempt_wakeup_fair(st
 	 * If @p has a shorter slice than current and @p is eligible, override
 	 * current's slice protection in order to allow preemption.
 	 */
-	 do_preempt_short = sched_feat(PREEMPT_SHORT) && (pse->slice < se->slice);
+	do_preempt_short = sched_feat(PREEMPT_SHORT) && (pse->slice < se->slice);
 
 	/*
 	 * If @p has become the most eligible task, force preemption.
@@ -8737,14 +8720,11 @@ static void check_preempt_wakeup_fair(st
 	if (__pick_eevdf(cfs_rq, !do_preempt_short) == pse)
 		goto preempt;
 
-	if (sched_feat(RUN_TO_PARITY) && do_preempt_short)
-		update_protect_slice(cfs_rq, se);
-
 	return;
 
 preempt:
 	if (do_preempt_short)
-		cancel_protect_slice(se);
+		cancel_protect_slice(cfs_rq, se);
 
 	resched_curr_lazy(rq);
 }
