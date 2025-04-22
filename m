Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FD1EE008
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316997; cv=none; b=ETZ33mEf1/DHSiBbHbO1i4szWhoywFikW9s4893zg/i9nNUhWA1MglmqUG0kwnrwShimmtyCh1qu7DnRvXd51/LbGz3GfOkAMmk53rqJvYMI7WkX/sfbZRUxKnmM88ztWGUPlvlFcRaVX2MBqR3veeWJRF3fAAux9sqYfUzkw8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316997; c=relaxed/simple;
	bh=F9H2K2tjYeiDKV8dvRE1TU8gJMZgqCVV9Ac4KFLEGHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+OH4FABGLMDzohxAe0Kw92Zw6E6m9ujnj+smBPr13vwEEK8X0JtZdv6s0IEg/9SQuh3Dl9gQqYdhFy+47AKuMwieNGArwyTnzJs4YuoRN/570+iCEAGVFTUUiBrHpJU+2Y1iA7tkXFw486Pk6kLRxRpu15Tx/T1HDzlXkj4HHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hZw5bpC9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hZw5bpC9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ziTWfcWORwWRFTKn2us+ueAEOexAXCnjQZ5dh0LGgF8=; b=hZw5bpC9NZIjmuht1zrXsMOyHO
	AjEz3Po86Aw01F+JVq6sD0kLQ71FmRqMwYnhDelJzxjpE9clW+FdrA+8NVfbjy27MXSCSsS3skaDN
	GM57zKfmP31EMg6hUy2GioaNZtf3vNSl14sfBD2ASe7qB/lfSDhzlOq+irrlxJaF1BmK2weYn11nx
	5Wr4NNl4dFVIifqJUBgXxHrQCTsM0XvgyGOCcZj7HwiKJJfZlNAqV11zvTE24pxruXsMd/9taUAwK
	5XGF3WpbkH5b7xcClp6Tih7OJDai8M+/I++3f8WkyhwNFfc051E0NYMl4Nmgh4ujQn5m0WHXj9a70
	FWUIJG8g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ag1-00000004N13-0DY7;
	Tue, 22 Apr 2025 10:16:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4737D3003C4; Tue, 22 Apr 2025 12:16:28 +0200 (CEST)
Date: Tue, 22 Apr 2025 12:16:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org, dhaval@gianis.ca
Subject: Re: [PATCH] sched/fair: Increase max lag clamping
Message-ID: <20250422101628.GA33555@noisy.programming.kicks-ass.net>
References: <20250418151225.3006867-1-vincent.guittot@linaro.org>
 <20250418155115.GI17910@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418155115.GI17910@noisy.programming.kicks-ass.net>

On Fri, Apr 18, 2025 at 05:51:15PM +0200, Peter Zijlstra wrote:
> On Fri, Apr 18, 2025 at 05:12:25PM +0200, Vincent Guittot wrote:
> > sched_entity lag is currently limited to the maximum between the tick and
> > twice the slice. This is too short compared to the maximum custom slice
> > that can be set and accumulated by other tasks.
> > Clamp the lag to the maximum slice that a task can set. A task A can
> > accumulate up to its slice of negative lag while running to parity and
> > the other runnable tasks can accumulate the same positive lag while
> > waiting to run. This positive lag could be lost during dequeue when
> > clamping it to twice task's slice if task A's slice is 100ms and others
> > use a smaller value like the default 2.8ms.
> > 
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index a0c4cd26ee07..1c2c70decb20 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -683,15 +683,17 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
> >   * is possible -- by addition/removal/reweight to the tree -- to move V around
> >   * and end up with a larger lag than we started with.
> >   *
> > - * Limit this to either double the slice length with a minimum of TICK_NSEC
> > - * since that is the timing granularity.
> > - *
> > - * EEVDF gives the following limit for a steady state system:
> > + * Limit this to the max allowed custom slice length which is higher than the
> > + * timing granularity (the tick) and EEVDF gives the following limit for
> > + * a steady state system:
> >   *
> >   *   -r_max < lag < max(r_max, q)
> >   *
> >   * XXX could add max_slice to the augmented data to track this.
> >   */
> 
> Right, its that max_slice XXX there.
> 
> I think I've actually done that patch at some point, but I'm not sure
> where I've placed it :-)

No matter, I've redone it by copy-paste from min_slice.

How's something like this then?

---
diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac1982893..9e90cd9023db 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -573,6 +573,7 @@ struct sched_entity {
 	u64				deadline;
 	u64				min_vruntime;
 	u64				min_slice;
+	u64				max_slice;
 
 	struct list_head		group_node;
 	unsigned char			on_rq;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 84916c865377..7c3c95f5cabd 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -676,6 +676,8 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
 	return cfs_rq->min_vruntime + avg;
 }
 
+static inline u64 cfs_rq_max_slice(struct cfs_rq *cfs_rq);
+
 /*
  * lag_i = S - s_i = w_i * (V - v_i)
  *
@@ -689,17 +691,16 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
  * EEVDF gives the following limit for a steady state system:
  *
  *   -r_max < lag < max(r_max, q)
- *
- * XXX could add max_slice to the augmented data to track this.
  */
 static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
+	u64 max_slice = cfs_rq_max_slice(cfs_rq) + TICK_NSEC;
 	s64 vlag, limit;
 
 	WARN_ON_ONCE(!se->on_rq);
 
 	vlag = avg_vruntime(cfs_rq) - se->vruntime;
-	limit = calc_delta_fair(max_t(u64, 2*se->slice, TICK_NSEC), se);
+	limit = calc_delta_fair(max_slice, se);
 
 	se->vlag = clamp(vlag, -limit, limit);
 }
@@ -795,6 +796,21 @@ static inline u64 cfs_rq_min_slice(struct cfs_rq *cfs_rq)
 	return min_slice;
 }
 
+static inline u64 cfs_rq_max_slice(struct cfs_rq *cfs_rq)
+{
+	struct sched_entity *root = __pick_root_entity(cfs_rq);
+	struct sched_entity *curr = cfs_rq->curr;
+	u64 max_slice = 0ULL;
+
+	if (curr && curr->on_rq)
+		max_slice = curr->slice;
+
+	if (root)
+		max_slice = min(max_slice, root->max_slice);
+
+	return max_slice;
+}
+
 static inline bool __entity_less(struct rb_node *a, const struct rb_node *b)
 {
 	return entity_before(__node_2_se(a), __node_2_se(b));
@@ -820,6 +836,15 @@ static inline void __min_slice_update(struct sched_entity *se, struct rb_node *n
 	}
 }
 
+static inline void __max_slice_update(struct sched_entity *se, struct rb_node *node)
+{
+	if (node) {
+		struct sched_entity *rse = __node_2_se(node);
+		if (rse->max_slice < se->max_slice)
+			se->max_slice = rse->max_slice;
+	}
+}
+
 /*
  * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
  */
@@ -827,6 +852,7 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
 {
 	u64 old_min_vruntime = se->min_vruntime;
 	u64 old_min_slice = se->min_slice;
+	u64 old_max_slice = se->max_slice;
 	struct rb_node *node = &se->run_node;
 
 	se->min_vruntime = se->vruntime;
@@ -837,8 +863,13 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
 	__min_slice_update(se, node->rb_right);
 	__min_slice_update(se, node->rb_left);
 
+	se->max_slice = se->slice;
+	__max_slice_update(se, node->rb_right);
+	__max_slice_update(se, node->rb_left);
+
 	return se->min_vruntime == old_min_vruntime &&
-	       se->min_slice == old_min_slice;
+	       se->min_slice == old_min_slice &&
+	       se->max_slice == old_max_slice;
 }
 
 RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
@@ -852,6 +883,7 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 	avg_vruntime_add(cfs_rq, se);
 	se->min_vruntime = se->vruntime;
 	se->min_slice = se->slice;
+	se->max_slice = se->slice;
 	rb_add_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
 				__entity_less, &min_vruntime_cb);
 }
