Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE8922AE75
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751138; cv=none; b=T88W7jNnZ+j5yqkVyF0lMxJoGeozj3tNMn3LcouTgNm1ZCbfmqeax3dRgzJ8QbmxAQGYWpS0oe9l55rVO2d4WIPZVDpvZrWnEDkOG0rO4yGdgAw/7yW23eb8ummALw+fLPyqeornnr+avgeDyD0MgIh0nYuzDLuhTLRz6oFpI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751138; c=relaxed/simple;
	bh=9OBLsNR3PYTymWxQWcmGEQSr3TQ3Y8EXhcc7Z+5g7ms=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=e+hPLtPmUQm2sx7WgNqzzJ6j9UAnsyed9vxoPYEtpLq9T3qbQDwVB2wLYfL5oc6qHplSAUGGTs1/Jrig+sRr0rl2XwU+coKwL2tQ89PZerfPknMtmh67zOyNKmyyioadHIj4enBbSFhTeGiHMxfil4MSpNwmHJ2FpZy2S88qWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bQ9GDGbp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bQ9GDGbp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=agZeE/nn7pvItqKMTgeZGYABvMsC9TD7nkyisRSC2e8=; b=bQ9GDGbpTRB8Ro8j26IWApg/uU
	bv9UR8wl+51h38ilFEeY4T3xVVJxp3xBtNno0VwdGl2XQYpmhhyno/V3nRCrnLkc74z73ignOQE2T
	QzzXeo0QvDJU46TRBoklvdmDghC9giSEinsyNqu1ND5e8eNj3r3zo4Z/0MFosDiEkzNsZknYI8/+M
	5Ip4mRTO64G45zbe1mcSQG7i59sDOOpsSIi2L2c2LkHyQ5ugOcx8+EjVLQXo1UgbzBXN7n4KUZRvV
	9fxnNxq19JJawMl9wevZrAc7lB+jBb8Nzqt82BpXMcWrHAjgMYRe9KI34MIQCQl7YXT8rGt4vZHyz
	UXhji26A==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb4-00000004GQB-2Wd7;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 115F8308607; Wed,  5 Feb 2025 11:25:28 +0100 (CET)
Message-ID: <20250205102450.888979808@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 ravi.bangoria@amd.com,
 lucas.demarchi@intel.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 willy@infradead.org,
 acme@kernel.org,
 namhyung@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 irogers@google.com,
 adrian.hunter@intel.com,
 kan.liang@linux.intel.com
Subject: [PATCH v2 24/24] perf: Make perf_pmu_unregister() useable
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Previously it was only safe to call perf_pmu_unregister() if there
were no active events of that pmu around -- which was impossible to
guarantee since it races all sorts against perf_init_event().

Rework the whole thing by:

 - keeping track of all events for a given pmu

 - 'hiding' the pmu from perf_init_event()

 - waiting for the appropriate (s)rcu grace periods such that all
   prior references to the PMU will be completed

 - detaching all still existing events of that pmu (see first point)
   and moving them to a new REVOKED state.

 - actually freeing the pmu data.

Where notably the new REVOKED state must inhibit all event actions
from reaching code that wants to use event->pmu.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/perf_event.h |   15 +-
 kernel/events/core.c       |  266 ++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 249 insertions(+), 32 deletions(-)

--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -325,6 +325,9 @@ struct perf_output_handle;
 struct pmu {
 	struct list_head		entry;
 
+	spinlock_t			events_lock;
+	struct list_head		events;
+
 	struct module			*module;
 	struct device			*dev;
 	struct device			*parent;
@@ -632,9 +635,10 @@ struct perf_addr_filter_range {
  * enum perf_event_state - the states of an event:
  */
 enum perf_event_state {
-	PERF_EVENT_STATE_DEAD		= -4,
-	PERF_EVENT_STATE_EXIT		= -3,
-	PERF_EVENT_STATE_ERROR		= -2,
+	PERF_EVENT_STATE_DEAD		= -5,
+	PERF_EVENT_STATE_REVOKED	= -4, /* pmu gone, must not touch */
+	PERF_EVENT_STATE_EXIT		= -3, /* task died, still inherit */
+	PERF_EVENT_STATE_ERROR		= -2, /* scheduling error, can enable */
 	PERF_EVENT_STATE_OFF		= -1,
 	PERF_EVENT_STATE_INACTIVE	=  0,
 	PERF_EVENT_STATE_ACTIVE		=  1,
@@ -875,6 +879,7 @@ struct perf_event {
 	void *security;
 #endif
 	struct list_head		sb_list;
+	struct list_head		pmu_list;
 
 	/*
 	 * Certain events gets forwarded to another pmu internally by over-
@@ -1126,7 +1131,7 @@ extern void perf_aux_output_flag(struct
 extern void perf_event_itrace_started(struct perf_event *event);
 
 extern int perf_pmu_register(struct pmu *pmu, const char *name, int type);
-extern void perf_pmu_unregister(struct pmu *pmu);
+extern int perf_pmu_unregister(struct pmu *pmu);
 
 extern void __perf_event_task_sched_in(struct task_struct *prev,
 				       struct task_struct *task);
@@ -1737,7 +1742,7 @@ static inline bool needs_branch_stack(st
 
 static inline bool has_aux(struct perf_event *event)
 {
-	return event->pmu->setup_aux;
+	return event->pmu && event->pmu->setup_aux;
 }
 
 static inline bool has_aux_action(struct perf_event *event)
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2418,7 +2418,9 @@ ctx_time_update_event(struct perf_event_
 
 #define DETACH_GROUP	0x01UL
 #define DETACH_CHILD	0x02UL
-#define DETACH_DEAD	0x04UL
+#define DETACH_EXIT	0x04UL
+#define DETACH_REVOKE	0x08UL
+#define DETACH_DEAD	0x10UL
 
 /*
  * Cross CPU call to remove a performance event
@@ -2433,6 +2435,7 @@ __perf_remove_from_context(struct perf_e
 			   void *info)
 {
 	struct perf_event_pmu_context *pmu_ctx = event->pmu_ctx;
+	enum perf_event_state state = PERF_EVENT_STATE_OFF;
 	unsigned long flags = (unsigned long)info;
 
 	ctx_time_update(cpuctx, ctx);
@@ -2441,16 +2444,22 @@ __perf_remove_from_context(struct perf_e
 	 * Ensure event_sched_out() switches to OFF, at the very least
 	 * this avoids raising perf_pending_task() at this time.
 	 */
-	if (flags & DETACH_DEAD)
+	if (flags & DETACH_EXIT)
+		state = PERF_EVENT_STATE_EXIT;
+	if (flags & DETACH_REVOKE)
+		state = PERF_EVENT_STATE_REVOKED;
+	if (flags & DETACH_DEAD) {
 		event->pending_disable = 1;
+		state = PERF_EVENT_STATE_DEAD;
+	}
 	event_sched_out(event, ctx);
 	if (flags & DETACH_GROUP)
 		perf_group_detach(event);
 	if (flags & DETACH_CHILD)
 		perf_child_detach(event);
 	list_del_event(event, ctx);
-	if (flags & DETACH_DEAD)
-		event->state = PERF_EVENT_STATE_DEAD;
+
+	event->state = min(event->state, state);
 
 	if (!pmu_ctx->nr_events) {
 		pmu_ctx->rotate_necessary = 0;
@@ -4510,7 +4519,8 @@ static void perf_event_enable_on_exec(st
 
 static void perf_remove_from_owner(struct perf_event *event);
 static void perf_event_exit_event(struct perf_event *event,
-				  struct perf_event_context *ctx);
+				  struct perf_event_context *ctx,
+				  bool revoke);
 
 /*
  * Removes all events from the current task that have been marked
@@ -4537,7 +4547,7 @@ static void perf_event_remove_on_exec(st
 
 		modified = true;
 
-		perf_event_exit_event(event, ctx);
+		perf_event_exit_event(event, ctx, false);
 	}
 
 	raw_spin_lock_irqsave(&ctx->lock, flags);
@@ -5137,6 +5147,7 @@ static bool is_sb_event(struct perf_even
 	    attr->context_switch || attr->text_poke ||
 	    attr->bpf_event)
 		return true;
+
 	return false;
 }
 
@@ -5338,6 +5349,8 @@ static void perf_pending_task_sync(struc
 /* vs perf_event_alloc() error */
 static void __free_event(struct perf_event *event)
 {
+	struct pmu *pmu = event->pmu;
+
 	if (event->attach_state & PERF_ATTACH_CALLCHAIN)
 		put_callchain_buffers();
 
@@ -5364,6 +5377,7 @@ static void __free_event(struct perf_eve
 		 * put_pmu_ctx() needs an event->ctx reference, because of
 		 * epc->ctx.
 		 */
+		WARN_ON_ONCE(!pmu);
 		WARN_ON_ONCE(!event->ctx);
 		WARN_ON_ONCE(event->pmu_ctx->ctx != event->ctx);
 		put_pmu_ctx(event->pmu_ctx);
@@ -5376,8 +5390,13 @@ static void __free_event(struct perf_eve
 	if (event->ctx)
 		put_ctx(event->ctx);
 
-	if (event->pmu)
-		module_put(event->pmu->module);
+	if (pmu) {
+		module_put(pmu->module);
+		scoped_guard (spinlock, &pmu->events_lock) {
+			list_del(&event->pmu_list);
+			wake_up_var(pmu);
+		}
+	}
 
 	call_rcu(&event->rcu_head, free_event_rcu);
 }
@@ -5525,7 +5544,11 @@ int perf_event_release_kernel(struct per
 	 * Thus this guarantees that we will in fact observe and kill _ALL_
 	 * child events.
 	 */
-	perf_remove_from_context(event, DETACH_GROUP|DETACH_DEAD);
+	if (event->state > PERF_EVENT_STATE_REVOKED) {
+		perf_remove_from_context(event, DETACH_GROUP|DETACH_DEAD);
+	} else {
+		event->state = PERF_EVENT_STATE_DEAD;
+	}
 
 	perf_event_ctx_unlock(event, ctx);
 
@@ -5578,7 +5601,7 @@ int perf_event_release_kernel(struct per
 		mutex_unlock(&ctx->mutex);
 
 		if (child)
-			free_event(child);
+			put_event(child);
 		put_ctx(ctx);
 
 		goto again;
@@ -5813,7 +5836,7 @@ __perf_read(struct perf_event *event, ch
 	 * error state (i.e. because it was pinned but it couldn't be
 	 * scheduled on to the CPU at some point).
 	 */
-	if (event->state == PERF_EVENT_STATE_ERROR)
+	if (event->state <= PERF_EVENT_STATE_ERROR)
 		return 0;
 
 	if (count < event->read_size)
@@ -5852,8 +5875,14 @@ static __poll_t perf_poll(struct file *f
 	struct perf_buffer *rb;
 	__poll_t events = EPOLLHUP;
 
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return EPOLLERR;
+
 	poll_wait(file, &event->waitq, wait);
 
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return EPOLLERR;
+
 	if (is_event_hup(event))
 		return events;
 
@@ -6027,6 +6056,9 @@ static long _perf_ioctl(struct perf_even
 	void (*func)(struct perf_event *);
 	u32 flags = arg;
 
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return -ENODEV;
+
 	switch (cmd) {
 	case PERF_EVENT_IOC_ENABLE:
 		func = _perf_event_enable;
@@ -6412,7 +6444,7 @@ static void perf_mmap_open(struct vm_are
 	if (vma->vm_pgoff)
 		atomic_inc(&event->rb->aux_mmap_count);
 
-	if (event->pmu->event_mapped)
+	if (event->pmu && event->pmu->event_mapped)
 		event->pmu->event_mapped(event, vma->vm_mm);
 }
 
@@ -6435,7 +6467,8 @@ static void perf_mmap_close(struct vm_ar
 	unsigned long size = perf_data_size(rb);
 	bool detach_rest = false;
 
-	if (event->pmu->event_unmapped)
+	/* FIXIES vs perf_pmu_unregister() */
+	if (event->pmu && event->pmu->event_unmapped)
 		event->pmu->event_unmapped(event, vma->vm_mm);
 
 	/*
@@ -6659,6 +6692,16 @@ static int perf_mmap(struct file *file,
 	mutex_lock(&event->mmap_mutex);
 	ret = -EINVAL;
 
+	/*
+	 * This relies on __pmu_detach_event() taking mmap_mutex after marking
+	 * the event REVOKED. Either we observe the state, or __pmu_detach_event()
+	 * will detach the rb created here.
+	 */
+	if (event->state <= PERF_EVENT_STATE_REVOKED) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
 	if (vma->vm_pgoff == 0) {
 		nr_pages -= 1;
 
@@ -6837,7 +6880,7 @@ static int perf_mmap(struct file *file,
 	if (!ret)
 		ret = map_range(rb, vma);
 
-	if (!ret && event->pmu->event_mapped)
+	if (!ret && event->pmu && event->pmu->event_mapped)
 		event->pmu->event_mapped(event, vma->vm_mm);
 
 	return ret;
@@ -6849,6 +6892,9 @@ static int perf_fasync(int fd, struct fi
 	struct perf_event *event = filp->private_data;
 	int retval;
 
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return -ENODEV;
+
 	inode_lock(inode);
 	retval = fasync_helper(fd, filp, on, &event->fasync);
 	inode_unlock(inode);
@@ -10813,6 +10859,9 @@ static int __perf_event_set_bpf_prog(str
 {
 	bool is_kprobe, is_uprobe, is_tracepoint, is_syscall_tp;
 
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return -ENODEV;
+
 	if (!perf_event_is_tracing(event))
 		return perf_event_set_bpf_handler(event, prog, bpf_cookie);
 
@@ -11997,6 +12046,9 @@ int perf_pmu_register(struct pmu *_pmu,
 	if (!pmu->event_idx)
 		pmu->event_idx = perf_event_idx_default;
 
+	INIT_LIST_HEAD(&pmu->events);
+	spin_lock_init(&pmu->events_lock);
+
 	/*
 	 * Now that the PMU is complete, make it visible to perf_try_init_event().
 	 */
@@ -12010,21 +12062,143 @@ int perf_pmu_register(struct pmu *_pmu,
 }
 EXPORT_SYMBOL_GPL(perf_pmu_register);
 
-void perf_pmu_unregister(struct pmu *pmu)
+static void __pmu_detach_event(struct pmu *pmu, struct perf_event *event,
+			       struct perf_event_context *ctx)
+{
+	/*
+	 * De-schedule the event and mark it REVOKED.
+	 */
+	perf_event_exit_event(event, ctx, true);
+
+	/*
+	 * All _free_event() bits that rely on event->pmu:
+	 *
+	 * Notably, perf_mmap() relies on the ordering here.
+	 */
+	scoped_guard (mutex, &event->mmap_mutex) {
+		WARN_ON_ONCE(pmu->event_unmapped);
+		/*
+		 * Mostly an empty lock sequence, such that perf_mmap(), which
+		 * relies on mmap_mutex, is sure to observe the state change.
+		 */
+	}
+
+	perf_event_free_bpf_prog(event);
+	perf_free_addr_filters(event);
+
+	if (event->destroy) {
+		event->destroy(event);
+		event->destroy = NULL;
+	}
+
+	if (event->pmu_ctx) {
+		put_pmu_ctx(event->pmu_ctx);
+		event->pmu_ctx = NULL;
+	}
+
+	exclusive_event_destroy(event);
+	module_put(pmu->module);
+
+	event->pmu = NULL; /* force fault instead of UAF */
+}
+
+static void pmu_detach_event(struct pmu *pmu, struct perf_event *event)
+{
+	struct perf_event_context *ctx;
+
+	ctx = perf_event_ctx_lock(event);
+	__pmu_detach_event(pmu, event, ctx);
+	perf_event_ctx_unlock(event, ctx);
+
+	scoped_guard (spinlock, &pmu->events_lock)
+		list_del(&event->pmu_list);
+}
+
+static struct perf_event *pmu_get_event(struct pmu *pmu)
+{
+	struct perf_event *event;
+
+	guard(spinlock)(&pmu->events_lock);
+	list_for_each_entry(event, &pmu->events, pmu_list) {
+		if (atomic_long_inc_not_zero(&event->refcount))
+			return event;
+	}
+
+	return NULL;
+}
+
+static bool pmu_empty(struct pmu *pmu)
+{
+	guard(spinlock)(&pmu->events_lock);
+	return list_empty(&pmu->events);
+}
+
+static void pmu_detach_events(struct pmu *pmu)
+{
+	struct perf_event *event;
+
+	for (;;) {
+		event = pmu_get_event(pmu);
+		if (!event)
+			break;
+
+		pmu_detach_event(pmu, event);
+		put_event(event);
+	}
+
+	/*
+	 * wait for pending _free_event()s
+	 */
+	wait_var_event(pmu, pmu_empty(pmu));
+}
+
+int perf_pmu_unregister(struct pmu *pmu)
 {
 	scoped_guard (mutex, &pmus_lock) {
+		if (!idr_cmpxchg(&pmu_idr, pmu->type, pmu, NULL))
+			return -EINVAL;
+
 		list_del_rcu(&pmu->entry);
-		idr_remove(&pmu_idr, pmu->type);
 	}
 
 	/*
 	 * We dereference the pmu list under both SRCU and regular RCU, so
 	 * synchronize against both of those.
+	 *
+	 * Notably, the entirety of event creation, from perf_init_event()
+	 * (which will now fail, because of the above) until
+	 * perf_install_in_context() should be under SRCU such that
+	 * this synchronizes against event creation. This avoids trying to
+	 * detach events that are not fully formed.
 	 */
 	synchronize_srcu(&pmus_srcu);
 	synchronize_rcu();
 
+	if (pmu->event_unmapped && !pmu_empty(pmu)) {
+		/*
+		 * Can't force remove events when pmu::event_unmapped()
+		 * is used in perf_mmap_close().
+		 */
+		guard(mutex)(&pmus_lock);
+		idr_cmpxchg(&pmu_idr, pmu->type, NULL, pmu);
+		list_add_rcu(&pmu->entry, &pmus);
+		return -EBUSY;
+	}
+
+	scoped_guard (mutex, &pmus_lock)
+		idr_remove(&pmu_idr, pmu->type);
+
+	/*
+	 * PMU is removed from the pmus list, so no new events will
+	 * be created, now take care of the existing ones.
+	 */
+	pmu_detach_events(pmu);
+
+	/*
+	 * PMU is unused, make it go away.
+	 */
 	perf_pmu_free(pmu);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_pmu_unregister);
 
@@ -12107,7 +12281,7 @@ static struct pmu *perf_init_event(struc
 	struct pmu *pmu;
 	int type, ret;
 
-	guard(srcu)(&pmus_srcu);
+	guard(srcu)(&pmus_srcu); /* pmu idr/list access */
 
 	/*
 	 * Save original type before calling pmu->event_init() since certain
@@ -12331,6 +12505,7 @@ perf_event_alloc(struct perf_event_attr
 	INIT_LIST_HEAD(&event->active_entry);
 	INIT_LIST_HEAD(&event->addr_filters.list);
 	INIT_HLIST_NODE(&event->hlist_entry);
+	INIT_LIST_HEAD(&event->pmu_list);
 
 
 	init_waitqueue_head(&event->waitq);
@@ -12498,6 +12673,13 @@ perf_event_alloc(struct perf_event_attr
 	/* symmetric to unaccount_event() in _free_event() */
 	account_event(event);
 
+	/*
+	 * Event creation should be under SRCU, see perf_pmu_unregister().
+	 */
+	lockdep_assert_held(&pmus_srcu);
+	scoped_guard (spinlock, &pmu->events_lock)
+		list_add(&event->pmu_list, &pmu->events);
+
 	return_ptr(event);
 }
 
@@ -12697,6 +12879,9 @@ perf_event_set_output(struct perf_event
 		goto unlock;
 
 	if (output_event) {
+		if (output_event->state <= PERF_EVENT_STATE_REVOKED)
+			goto unlock;
+
 		/* get the rb we want to redirect to */
 		rb = ring_buffer_get(output_event);
 		if (!rb)
@@ -12878,6 +13063,11 @@ SYSCALL_DEFINE5(perf_event_open,
 	if (event_fd < 0)
 		return event_fd;
 
+	/*
+	 * Event creation should be under SRCU, see perf_pmu_unregister().
+	 */
+	guard(srcu)(&pmus_srcu);
+
 	CLASS(fd, group)(group_fd);     // group_fd == -1 => empty
 	if (group_fd != -1) {
 		if (!is_perf_file(group)) {
@@ -12885,6 +13075,10 @@ SYSCALL_DEFINE5(perf_event_open,
 			goto err_fd;
 		}
 		group_leader = fd_file(group)->private_data;
+		if (group_leader->state <= PERF_EVENT_STATE_REVOKED) {
+			err = -ENODEV;
+			goto err_fd;
+		}
 		if (flags & PERF_FLAG_FD_OUTPUT)
 			output_event = group_leader;
 		if (flags & PERF_FLAG_FD_NO_GROUP)
@@ -13218,6 +13412,11 @@ perf_event_create_kernel_counter(struct
 	if (attr->aux_output || attr->aux_action)
 		return ERR_PTR(-EINVAL);
 
+	/*
+	 * Event creation should be under SRCU, see perf_pmu_unregister().
+	 */
+	guard(srcu)(&pmus_srcu);
+
 	event = perf_event_alloc(attr, cpu, task, NULL, NULL,
 				 overflow_handler, context, -1);
 	if (IS_ERR(event)) {
@@ -13429,10 +13628,11 @@ static void sync_child_event(struct perf
 }
 
 static void
-perf_event_exit_event(struct perf_event *event, struct perf_event_context *ctx)
+perf_event_exit_event(struct perf_event *event,
+		      struct perf_event_context *ctx, bool revoke)
 {
 	struct perf_event *parent_event = event->parent;
-	unsigned long detach_flags = 0;
+	unsigned long detach_flags = DETACH_EXIT;
 
 	if (parent_event) {
 		/*
@@ -13447,16 +13647,14 @@ perf_event_exit_event(struct perf_event
 		 * Do destroy all inherited groups, we don't care about those
 		 * and being thorough is better.
 		 */
-		detach_flags = DETACH_GROUP | DETACH_CHILD;
+		detach_flags |= DETACH_GROUP | DETACH_CHILD;
 		mutex_lock(&parent_event->child_mutex);
 	}
 
-	perf_remove_from_context(event, detach_flags);
+	if (revoke)
+		detach_flags |= DETACH_GROUP | DETACH_REVOKE;
 
-	raw_spin_lock_irq(&ctx->lock);
-	if (event->state > PERF_EVENT_STATE_EXIT)
-		perf_event_set_state(event, PERF_EVENT_STATE_EXIT);
-	raw_spin_unlock_irq(&ctx->lock);
+	perf_remove_from_context(event, detach_flags);
 
 	/*
 	 * Child events can be freed.
@@ -13467,7 +13665,13 @@ perf_event_exit_event(struct perf_event
 		 * Kick perf_poll() for is_event_hup();
 		 */
 		perf_event_wakeup(parent_event);
-		free_event(event);
+		/*
+		 * pmu_detach_event() will have an extra refcount.
+		 */
+		if (revoke)
+			put_event(event);
+		else
+			free_event(event);
 		put_event(parent_event);
 		return;
 	}
@@ -13532,7 +13736,7 @@ static void perf_event_exit_task_context
 	perf_event_task(child, child_ctx, 0);
 
 	list_for_each_entry_safe(child_event, next, &child_ctx->event_list, event_entry)
-		perf_event_exit_event(child_event, child_ctx);
+		perf_event_exit_event(child_event, child_ctx, false);
 
 	mutex_unlock(&child_ctx->mutex);
 
@@ -13722,6 +13926,14 @@ inherit_event(struct perf_event *parent_
 	if (parent_event->parent)
 		parent_event = parent_event->parent;
 
+	if (parent_event->state <= PERF_EVENT_STATE_REVOKED)
+		return NULL;
+
+	/*
+	 * Event creation should be under SRCU, see perf_pmu_unregister().
+	 */
+	guard(srcu)(&pmus_srcu);
+
 	child_event = perf_event_alloc(&parent_event->attr,
 					   parent_event->cpu,
 					   child,


