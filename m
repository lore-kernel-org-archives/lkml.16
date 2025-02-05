Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D2922AE71
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751137; cv=none; b=qIeaQ5cP3xJy3/djMsKEfPM6Thls/TuS4ZTHwSiMnfqB6lt6o8PhrO7HulvK2YMM1kYGrkPfpPR6KkfNBwVBowBTRLocazlpudmKTb1DckDnJayeTUTPhN3jRndSiAoji8M7XZF9qpcvAVYDsnub4RkdEZpYL53fUntEI2lL6MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751137; c=relaxed/simple;
	bh=lYXRXPP6HLwg/Bp8nCAcHAAa3/kzpOc+P0uFm2dk0qY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rV1mjIjnbxU7lsTmdAHd/p+8Exz09vzZFapDS3z3pyVBYmQe2G006uDNu9EC8n0befL20q7fHoincTSfwJLM28uMQLPgagxjy4cgzGGpkZSXaIHKBFd/1//It8m6LpDZKmf/ngE/BOxBBxb8Qc3OjqD4YeINB96Ow0KOJ8KxTZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Sm8UQ8fQ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Sm8UQ8fQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=WAF72F0vl5OegJiTt7utxhY0fac2CVe/BE2y5cW/mMs=; b=Sm8UQ8fQ/WuHYbGLDVWldUILRR
	iX46Hm0IIvmdJb1HydK3ojcaZNuvazjyoFMGV4XM7RVepjF6oaw4Cw7P3ww43BYxZCUKi4IPmLO5a
	vS1w5BjeXEDrHJEL39m707GDY1AaW12KLdiPsddReCq+uquitbjqsof61dgYmqZxt8RCpu2e38gn0
	0qh/YpvCg0n81JRT6BtDGulK40wT8L9/yb5Znymmuw80SeUaUSxTbDyjGn49byZuZbanpjBlf9fB2
	lNjhijLaG/9weTj+M1WgwgM1RyFsoBFA2MnaaI2QzFm8WI1TNreDQb6j3pMP3zaz7BHqE525tkdqc
	IPDuWiug==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-0000000GbmD-2SoP;
	Wed, 05 Feb 2025 10:25:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id CFD153061E4; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102449.230417308@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:29 +0100
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
Subject: [PATCH v2 09/24] perf: Simplify perf_event_alloc() error path
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The error cleanup sequence in perf_event_alloc() is a subset of the
existing _free_event() function (it must of course be).

Split this out into __free_event() and simplify the error path.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/perf_event.h |   16 +++--
 kernel/events/core.c       |  134 ++++++++++++++++++++++-----------------------
 2 files changed, 75 insertions(+), 75 deletions(-)

--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -673,13 +673,15 @@ struct swevent_hlist {
 	struct rcu_head			rcu_head;
 };
 
-#define PERF_ATTACH_CONTEXT	0x01
-#define PERF_ATTACH_GROUP	0x02
-#define PERF_ATTACH_TASK	0x04
-#define PERF_ATTACH_TASK_DATA	0x08
-#define PERF_ATTACH_ITRACE	0x10
-#define PERF_ATTACH_SCHED_CB	0x20
-#define PERF_ATTACH_CHILD	0x40
+#define PERF_ATTACH_CONTEXT	0x0001
+#define PERF_ATTACH_GROUP	0x0002
+#define PERF_ATTACH_TASK	0x0004
+#define PERF_ATTACH_TASK_DATA	0x0008
+#define PERF_ATTACH_ITRACE	0x0010
+#define PERF_ATTACH_SCHED_CB	0x0020
+#define PERF_ATTACH_CHILD	0x0040
+#define PERF_ATTACH_EXCLUSIVE	0x0080
+#define PERF_ATTACH_CALLCHAIN	0x0100
 
 struct bpf_prog;
 struct perf_cgroup;
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5245,6 +5245,8 @@ static int exclusive_event_init(struct p
 			return -EBUSY;
 	}
 
+	event->attach_state |= PERF_ATTACH_EXCLUSIVE;
+
 	return 0;
 }
 
@@ -5252,14 +5254,13 @@ static void exclusive_event_destroy(stru
 {
 	struct pmu *pmu = event->pmu;
 
-	if (!is_exclusive_pmu(pmu))
-		return;
-
 	/* see comment in exclusive_event_init() */
 	if (event->attach_state & PERF_ATTACH_TASK)
 		atomic_dec(&pmu->exclusive_cnt);
 	else
 		atomic_inc(&pmu->exclusive_cnt);
+
+	event->attach_state &= ~PERF_ATTACH_EXCLUSIVE;
 }
 
 static bool exclusive_event_match(struct perf_event *e1, struct perf_event *e2)
@@ -5318,40 +5319,20 @@ static void perf_pending_task_sync(struc
 	rcuwait_wait_event(&event->pending_work_wait, !event->pending_work, TASK_UNINTERRUPTIBLE);
 }
 
-static void _free_event(struct perf_event *event)
+/* vs perf_event_alloc() error */
+static void __free_event(struct perf_event *event)
 {
-	irq_work_sync(&event->pending_irq);
-	irq_work_sync(&event->pending_disable_irq);
-	perf_pending_task_sync(event);
-
-	unaccount_event(event);
+	if (event->attach_state & PERF_ATTACH_CALLCHAIN)
+		put_callchain_buffers();
 
-	security_perf_event_free(event);
+	kfree(event->addr_filter_ranges);
 
-	if (event->rb) {
-		/*
-		 * Can happen when we close an event with re-directed output.
-		 *
-		 * Since we have a 0 refcount, perf_mmap_close() will skip
-		 * over us; possibly making our ring_buffer_put() the last.
-		 */
-		mutex_lock(&event->mmap_mutex);
-		ring_buffer_attach(event, NULL);
-		mutex_unlock(&event->mmap_mutex);
-	}
+	if (event->attach_state & PERF_ATTACH_EXCLUSIVE)
+		exclusive_event_destroy(event);
 
 	if (is_cgroup_event(event))
 		perf_detach_cgroup(event);
 
-	if (!event->parent) {
-		if (event->attr.sample_type & PERF_SAMPLE_CALLCHAIN)
-			put_callchain_buffers();
-	}
-
-	perf_event_free_bpf_prog(event);
-	perf_addr_filters_splice(event, NULL);
-	kfree(event->addr_filter_ranges);
-
 	if (event->destroy)
 		event->destroy(event);
 
@@ -5362,22 +5343,58 @@ static void _free_event(struct perf_even
 	if (event->hw.target)
 		put_task_struct(event->hw.target);
 
-	if (event->pmu_ctx)
+	if (event->pmu_ctx) {
+		/*
+		 * put_pmu_ctx() needs an event->ctx reference, because of
+		 * epc->ctx.
+		 */
+		WARN_ON_ONCE(!event->ctx);
+		WARN_ON_ONCE(event->pmu_ctx->ctx != event->ctx);
 		put_pmu_ctx(event->pmu_ctx);
+	}
 
 	/*
-	 * perf_event_free_task() relies on put_ctx() being 'last', in particular
-	 * all task references must be cleaned up.
+	 * perf_event_free_task() relies on put_ctx() being 'last', in
+	 * particular all task references must be cleaned up.
 	 */
 	if (event->ctx)
 		put_ctx(event->ctx);
 
-	exclusive_event_destroy(event);
-	module_put(event->pmu->module);
+	if (event->pmu)
+		module_put(event->pmu->module);
 
 	call_rcu(&event->rcu_head, free_event_rcu);
 }
 
+/* vs perf_event_alloc() success */
+static void _free_event(struct perf_event *event)
+{
+	irq_work_sync(&event->pending_irq);
+	irq_work_sync(&event->pending_disable_irq);
+	perf_pending_task_sync(event);
+
+	unaccount_event(event);
+
+	security_perf_event_free(event);
+
+	if (event->rb) {
+		/*
+		 * Can happen when we close an event with re-directed output.
+		 *
+		 * Since we have a 0 refcount, perf_mmap_close() will skip
+		 * over us; possibly making our ring_buffer_put() the last.
+		 */
+		mutex_lock(&event->mmap_mutex);
+		ring_buffer_attach(event, NULL);
+		mutex_unlock(&event->mmap_mutex);
+	}
+
+	perf_event_free_bpf_prog(event);
+	perf_addr_filters_splice(event, NULL);
+
+	__free_event(event);
+}
+
 /*
  * Used to free events which have a known refcount of 1, such as in error paths
  * where the event isn't exposed yet and inherited events.
@@ -12390,7 +12407,7 @@ perf_event_alloc(struct perf_event_attr
 	 * See perf_output_read().
 	 */
 	if (has_inherit_and_sample_read(attr) && !(attr->sample_type & PERF_SAMPLE_TID))
-		goto err_ns;
+		goto err;
 
 	if (!has_branch_stack(event))
 		event->attr.branch_sample_type = 0;
@@ -12398,7 +12415,7 @@ perf_event_alloc(struct perf_event_attr
 	pmu = perf_init_event(event);
 	if (IS_ERR(pmu)) {
 		err = PTR_ERR(pmu);
-		goto err_ns;
+		goto err;
 	}
 
 	/*
@@ -12408,25 +12425,25 @@ perf_event_alloc(struct perf_event_attr
 	 */
 	if (pmu->task_ctx_nr == perf_invalid_context && (task || cgroup_fd != -1)) {
 		err = -EINVAL;
-		goto err_pmu;
+		goto err;
 	}
 
 	if (event->attr.aux_output &&
 	    (!(pmu->capabilities & PERF_PMU_CAP_AUX_OUTPUT) ||
 	     event->attr.aux_pause || event->attr.aux_resume)) {
 		err = -EOPNOTSUPP;
-		goto err_pmu;
+		goto err;
 	}
 
 	if (event->attr.aux_pause && event->attr.aux_resume) {
 		err = -EINVAL;
-		goto err_pmu;
+		goto err;
 	}
 
 	if (event->attr.aux_start_paused) {
 		if (!(pmu->capabilities & PERF_PMU_CAP_AUX_PAUSE)) {
 			err = -EOPNOTSUPP;
-			goto err_pmu;
+			goto err;
 		}
 		event->hw.aux_paused = 1;
 	}
@@ -12434,12 +12451,12 @@ perf_event_alloc(struct perf_event_attr
 	if (cgroup_fd != -1) {
 		err = perf_cgroup_connect(cgroup_fd, event, attr, group_leader);
 		if (err)
-			goto err_pmu;
+			goto err;
 	}
 
 	err = exclusive_event_init(event);
 	if (err)
-		goto err_pmu;
+		goto err;
 
 	if (has_addr_filter(event)) {
 		event->addr_filter_ranges = kcalloc(pmu->nr_addr_filters,
@@ -12447,7 +12464,7 @@ perf_event_alloc(struct perf_event_attr
 						    GFP_KERNEL);
 		if (!event->addr_filter_ranges) {
 			err = -ENOMEM;
-			goto err_per_task;
+			goto err;
 		}
 
 		/*
@@ -12472,41 +12489,22 @@ perf_event_alloc(struct perf_event_attr
 		if (event->attr.sample_type & PERF_SAMPLE_CALLCHAIN) {
 			err = get_callchain_buffers(attr->sample_max_stack);
 			if (err)
-				goto err_addr_filters;
+				goto err;
+			event->attach_state |= PERF_ATTACH_CALLCHAIN;
 		}
 	}
 
 	err = security_perf_event_alloc(event);
 	if (err)
-		goto err_callchain_buffer;
+		goto err;
 
 	/* symmetric to unaccount_event() in _free_event() */
 	account_event(event);
 
 	return event;
 
-err_callchain_buffer:
-	if (!event->parent) {
-		if (event->attr.sample_type & PERF_SAMPLE_CALLCHAIN)
-			put_callchain_buffers();
-	}
-err_addr_filters:
-	kfree(event->addr_filter_ranges);
-
-err_per_task:
-	exclusive_event_destroy(event);
-
-err_pmu:
-	if (is_cgroup_event(event))
-		perf_detach_cgroup(event);
-	if (event->destroy)
-		event->destroy(event);
-	module_put(pmu->module);
-err_ns:
-	if (event->hw.target)
-		put_task_struct(event->hw.target);
-	call_rcu(&event->rcu_head, free_event_rcu);
-
+err:
+	__free_event(event);
 	return ERR_PTR(err);
 }
 


