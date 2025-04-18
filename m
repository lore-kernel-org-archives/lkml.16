Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A54433C4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744991403; cv=none; b=tZIQKWbnIUQNBkba7xq2gDEnUbvIVpz1W5a0MgxUf7EOA5IKldgRau+AkrITxnWAFaJl/1wSihVxDilaWlRF7nCmRu9xiVOgVOtbhP+4uEyioA3netF/Itr/XfWhNQgsoLRaXy3KxG1CUaU4pjCfoBXjx2ZjydCBNxPssN6psWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744991403; c=relaxed/simple;
	bh=N8mkOXk0kH6hDj8MPsX07tFD7kqOt36htwk5Wp4xIqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbdyhgdqDxvOMU32lotCwwjn+jFmLNA5y1Cy6Rh2Nv7X0VAzpKlCfPZFLmZrltQg4osGjKVd2rmMmISez45ncXy5RPKorTKUZU6QvyyXd/gFnFHc4PI41rEgs1hqvtlVPdWSfwU7zyPPUqwK/6TWNWkst4Y33C1Wt1dWsFXOK5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WeUG3+00; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WeUG3+00"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GLHjw5tK/2kAcrM7JjXlY8I1pAd0NTlcN5vebBU0ug0=; b=WeUG3+00rsKWASlnOi6Kv2bzxK
	1tAj0J7IFndLVUbYLyyKbM8HT4D8HgVHqe2oCh6OQlgUJbMR+rJmLM+XFRkj+rbMhNpu0iR32jUiJ
	Z/11r/SASrWXAq6cDZStkz4c5ifEWbff2s3IoWu5spFP4/nX0Iu7fXc/N15MdZYtOe9yQZg9TYQhp
	Q7SMnDxWS2xaqF02lfP1TMqnmJsmYlWD/ZwfqHqtBrlpihR/KPZvgbB4HzbksHfo6JtYU77txZyI1
	/uZI9ZycFnJeCJDhETReft/SAHLfL2Cg4oGBwE0Z/zIT6lh2mnhT0Cb2NYjpecSErIOYTW7tVJfcd
	mFLfrZ7Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5nyL-0000000AXFx-1vje;
	Fri, 18 Apr 2025 15:49:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 52ADA300619; Fri, 18 Apr 2025 17:44:38 +0200 (CEST)
Date: Fri, 18 Apr 2025 17:44:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: Chris Mason <clm@meta.com>, Pat Cody <pat@patcody.io>, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	patcody@meta.com, kernel-team@meta.com,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
Message-ID: <20250418154438.GH17910@noisy.programming.kicks-ass.net>
References: <20250320205310.779888-1-pat@patcody.io>
 <20250324115613.GD14944@noisy.programming.kicks-ass.net>
 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
 <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>

On Wed, Apr 16, 2025 at 10:19:42AM -0400, Rik van Riel wrote:

> The most common warning by far, hitting
> about 90% of the time we hit anything
> in avg_vruntime_validate is the
> WARN_ON_ONCE(cfs_rq->avg_vruntime != vruntime)
> 
> The most common code path to getting there,
> covering about 85% of the cases:
> 
> avg_vruntime_validate
> avg_vruntime_sub
> __dequeue_entity
> set_next_entity
> pick_task_fair
> pick_next_task_fair
> __pick_next_task
> pick_next_task
> __schedule
> schedule

(I'm assuming zero_vruntime patch here, the stock kernel has more
problems vs min_vruntime getting stuck in the future etc..)

So I have a theory about this. Key is that you're running a PREEMPT-NONE
kernel.

There is one important site the overflow patch does not cover:
avg_vruntime_update().

However, due to PREEMPT_NONE, it is possible (Chris mentioned direct
reclaim and OOM) to have very long (in-kernel) runtimes without
scheduling.

(I suppose this should be visible by tracing sched_switch)

Were this to happen, then avg_vruntime_add() gets to deal with 'key *
weight' for a relatively large key. But per the overflow checks there,
this isn't hitting (much).

But then we try and update zero_vruntime, and that is doing 'delta *
cfs_rq->avg_load', and avg_load is a larger number and might just cause
overflow. We don't have a check there.

If that overflows then avg_vruntime is buggered, but none of the
individual tree entities hit overflow, exactly as you observe.

I've modified the zero_vruntime patch a little (new one below) to update
zero_vruntime in update_curr(). Additionally, I have every tick re-align
it with the tree avg (the update and the tree can drift due to numerical
funnies).

This should ensure these very long in-kernel runtimes are broken up in
at most tick sized chunks, and by keeping zero_vruntime more or less
around the actual 0-lag point, the key values are minimized.

I should probably go play with a kernel module that spins for a few
seconds with preemption disabled, see if I can make it go BOOM :-) But
I've not yet done so.

FWIW, you can add something like:

Index: linux-2.6/kernel/sched/fair.c
===================================================================
--- linux-2.6.orig/kernel/sched/fair.c
+++ linux-2.6/kernel/sched/fair.c
@@ -652,6 +652,9 @@ avg_vruntime_sub(struct cfs_rq *cfs_rq,
 static inline
 void avg_vruntime_update(struct cfs_rq *cfs_rq, s64 delta)
 {
+	s64 tmp;
+	WARN_ON_ONCE(__builtin_mul_overflow(cfs_rq->avg_load, delta, &tmp);
+
 	/*
 	 * v' = v + d ==> avg_vruntime' = avg_runtime - d*avg_load
 	 */


To the overflow patch, to see if this mult goes splat.


New zero_vruntime patch here:

---
 kernel/sched/debug.c |    8 ++--
 kernel/sched/fair.c  |   92 +++++++--------------------------------------------
 kernel/sched/sched.h |    2 -
 3 files changed, 19 insertions(+), 83 deletions(-)

Index: linux-2.6/kernel/sched/debug.c
===================================================================
--- linux-2.6.orig/kernel/sched/debug.c
+++ linux-2.6/kernel/sched/debug.c
@@ -807,7 +807,7 @@ static void print_rq(struct seq_file *m,
 
 void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
 {
-	s64 left_vruntime = -1, min_vruntime, right_vruntime = -1, left_deadline = -1, spread;
+	s64 left_vruntime = -1, zero_vruntime, right_vruntime = -1, left_deadline = -1, spread;
 	struct sched_entity *last, *first, *root;
 	struct rq *rq = cpu_rq(cpu);
 	unsigned long flags;
@@ -830,15 +830,15 @@ void print_cfs_rq(struct seq_file *m, in
 	last = __pick_last_entity(cfs_rq);
 	if (last)
 		right_vruntime = last->vruntime;
-	min_vruntime = cfs_rq->min_vruntime;
+	zero_vruntime = cfs_rq->zero_vruntime;
 	raw_spin_rq_unlock_irqrestore(rq, flags);
 
 	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "left_deadline",
 			SPLIT_NS(left_deadline));
 	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "left_vruntime",
 			SPLIT_NS(left_vruntime));
-	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "min_vruntime",
-			SPLIT_NS(min_vruntime));
+	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "zero_vruntime",
+			SPLIT_NS(zero_vruntime));
 	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "avg_vruntime",
 			SPLIT_NS(avg_vruntime(cfs_rq)));
 	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "right_vruntime",
Index: linux-2.6/kernel/sched/fair.c
===================================================================
--- linux-2.6.orig/kernel/sched/fair.c
+++ linux-2.6/kernel/sched/fair.c
@@ -526,24 +526,6 @@ void account_cfs_rq_runtime(struct cfs_r
  * Scheduling class tree data structure manipulation methods:
  */
 
-static inline __maybe_unused u64 max_vruntime(u64 max_vruntime, u64 vruntime)
-{
-	s64 delta = (s64)(vruntime - max_vruntime);
-	if (delta > 0)
-		max_vruntime = vruntime;
-
-	return max_vruntime;
-}
-
-static inline __maybe_unused u64 min_vruntime(u64 min_vruntime, u64 vruntime)
-{
-	s64 delta = (s64)(vruntime - min_vruntime);
-	if (delta < 0)
-		min_vruntime = vruntime;
-
-	return min_vruntime;
-}
-
 static inline bool entity_before(const struct sched_entity *a,
 				 const struct sched_entity *b)
 {
@@ -556,7 +538,7 @@ static inline bool entity_before(const s
 
 static inline s64 entity_key(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
-	return (s64)(se->vruntime - cfs_rq->min_vruntime);
+	return (s64)(se->vruntime - cfs_rq->zero_vruntime);
 }
 
 #define __node_2_se(node) \
@@ -608,13 +590,13 @@ static inline s64 entity_key(struct cfs_
  *
  * Which we track using:
  *
- *                    v0 := cfs_rq->min_vruntime
+ *                    v0 := cfs_rq->zero_vruntime
  * \Sum (v_i - v0) * w_i := cfs_rq->avg_vruntime
  *              \Sum w_i := cfs_rq->avg_load
  *
- * Since min_vruntime is a monotonic increasing variable that closely tracks
- * the per-task service, these deltas: (v_i - v), will be in the order of the
- * maximal (virtual) lag induced in the system due to quantisation.
+ * Since zero_vruntime closely tracks the per-task service, these
+ * deltas: (v_i - v), will be in the order of the maximal (virtual) lag
+ * induced in the system due to quantisation.
  *
  * Also, we use scale_load_down() to reduce the size.
  *
@@ -673,7 +655,7 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
 		avg = div_s64(avg, load);
 	}
 
-	return cfs_rq->min_vruntime + avg;
+	return cfs_rq->zero_vruntime + avg;
 }
 
 /*
@@ -734,7 +716,7 @@ static int vruntime_eligible(struct cfs_
 		load += weight;
 	}
 
-	return avg >= (s64)(vruntime - cfs_rq->min_vruntime) * load;
+	return avg >= (s64)(vruntime - cfs_rq->zero_vruntime) * load;
 }
 
 int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *se)
@@ -742,42 +724,21 @@ int entity_eligible(struct cfs_rq *cfs_r
 	return vruntime_eligible(cfs_rq, se->vruntime);
 }
 
-static u64 __update_min_vruntime(struct cfs_rq *cfs_rq, u64 vruntime)
+static void __update_zero_vruntime(struct cfs_rq *cfs_rq, s64 delta)
 {
-	u64 min_vruntime = cfs_rq->min_vruntime;
-	/*
-	 * open coded max_vruntime() to allow updating avg_vruntime
-	 */
-	s64 delta = (s64)(vruntime - min_vruntime);
-	if (delta > 0) {
-		avg_vruntime_update(cfs_rq, delta);
-		min_vruntime = vruntime;
-	}
-	return min_vruntime;
+	if (!delta)
+		return;
+
+	avg_vruntime_update(cfs_rq, delta);
+	cfs_rq->zero_vruntime += delta;
 }
 
-static void update_min_vruntime(struct cfs_rq *cfs_rq)
+static void update_zero_vruntime(struct cfs_rq *cfs_rq)
 {
-	struct sched_entity *se = __pick_root_entity(cfs_rq);
-	struct sched_entity *curr = cfs_rq->curr;
-	u64 vruntime = cfs_rq->min_vruntime;
+	u64 vruntime = avg_vruntime(cfs_rq);
+	s64 delta = (s64)(vruntime - cfs_rq->zero_vruntime);
 
-	if (curr) {
-		if (curr->on_rq)
-			vruntime = curr->vruntime;
-		else
-			curr = NULL;
-	}
-
-	if (se) {
-		if (!curr)
-			vruntime = se->min_vruntime;
-		else
-			vruntime = min_vruntime(vruntime, se->min_vruntime);
-	}
-
-	/* ensure we never gain time by being placed backwards. */
-	cfs_rq->min_vruntime = __update_min_vruntime(cfs_rq, vruntime);
+	__update_zero_vruntime(cfs_rq, delta);
 }
 
 static inline u64 cfs_rq_min_slice(struct cfs_rq *cfs_rq)
@@ -850,6 +811,7 @@ RB_DECLARE_CALLBACKS(static, min_vruntim
 static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
 	avg_vruntime_add(cfs_rq, se);
+	update_zero_vruntime(cfs_rq);
 	se->min_vruntime = se->vruntime;
 	se->min_slice = se->slice;
 	rb_add_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
@@ -861,6 +823,7 @@ static void __dequeue_entity(struct cfs_
 	rb_erase_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
 				  &min_vruntime_cb);
 	avg_vruntime_sub(cfs_rq, se);
+	update_zero_vruntime(cfs_rq);
 }
 
 struct sched_entity *__pick_root_entity(struct cfs_rq *cfs_rq)
@@ -1238,8 +1201,15 @@ static void update_curr(struct cfs_rq *c
 		return;
 
 	curr->vruntime += calc_delta_fair(delta_exec, curr);
+
+	/*
+	 * The 0-lag point will progress at cfs_rq->load rate.
+	 * Move along in order to keep the deltas minimal.
+	 */
+	__update_zero_vruntime(cfs_rq,
+			       __calc_delta(delta_exec, NICE_0_LOAD, &cfs_rq->load));
+
 	resched = update_deadline(cfs_rq, curr);
-	update_min_vruntime(cfs_rq);
 
 	if (entity_is_task(curr)) {
 		struct task_struct *p = task_of(curr);
@@ -3825,15 +3795,6 @@ static void reweight_entity(struct cfs_r
 		place_entity(cfs_rq, se, 0);
 		if (!curr)
 			__enqueue_entity(cfs_rq, se);
-
-		/*
-		 * The entity's vruntime has been adjusted, so let's check
-		 * whether the rq-wide min_vruntime needs updated too. Since
-		 * the calculations above require stable min_vruntime rather
-		 * than up-to-date one, we do the update at the end of the
-		 * reweight process.
-		 */
-		update_min_vruntime(cfs_rq);
 	}
 }
 
@@ -5504,15 +5465,6 @@ dequeue_entity(struct cfs_rq *cfs_rq, st
 
 	update_cfs_group(se);
 
-	/*
-	 * Now advance min_vruntime if @se was the entity holding it back,
-	 * except when: DEQUEUE_SAVE && !DEQUEUE_MOVE, in this case we'll be
-	 * put back on, and if we advance min_vruntime, we'll be placed back
-	 * further than we started -- i.e. we'll be penalized.
-	 */
-	if ((flags & (DEQUEUE_SAVE | DEQUEUE_MOVE)) != DEQUEUE_SAVE)
-		update_min_vruntime(cfs_rq);
-
 	if (flags & DEQUEUE_DELAYED)
 		finish_delayed_dequeue_entity(se);
 
@@ -5630,6 +5582,7 @@ entity_tick(struct cfs_rq *cfs_rq, struc
 	 * Update run-time statistics of the 'current'.
 	 */
 	update_curr(cfs_rq);
+	update_zero_vruntime(cfs_rq);
 
 	/*
 	 * Ensure that runnable average is periodically updated.
@@ -13305,7 +13258,7 @@ static void set_next_task_fair(struct rq
 void init_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	cfs_rq->tasks_timeline = RB_ROOT_CACHED;
-	cfs_rq->min_vruntime = (u64)(-(1LL << 20));
+	cfs_rq->zero_vruntime = (u64)(-(1LL << 20));
 #ifdef CONFIG_SMP
 	raw_spin_lock_init(&cfs_rq->removed.lock);
 #endif
Index: linux-2.6/kernel/sched/sched.h
===================================================================
--- linux-2.6.orig/kernel/sched/sched.h
+++ linux-2.6/kernel/sched/sched.h
@@ -652,7 +652,7 @@ struct cfs_rq {
 	s64			avg_vruntime;
 	u64			avg_load;
 
-	u64			min_vruntime;
+	u64			zero_vruntime;
 #ifdef CONFIG_SCHED_CORE
 	unsigned int		forceidle_seq;
 	u64			min_vruntime_fi;
