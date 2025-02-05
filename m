Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C422C35E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751140; cv=none; b=Zdkjsqu7pyMaRodbsbZ2tTV62BpLIyyINZV+OOi8QYhBFql0sQ4gAJS/EXKraQWV/Bdg1W5HE2lPzN2jFNjIROFxAYV3zcq9bGTskuXQYJT4YUm0pRAXKoEFQ35vp4fEkBlO1AgWKhXxhODSeTjei0o3W/OdPrG5a5708ZOt3vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751140; c=relaxed/simple;
	bh=VyZRdBAMs530KrDX/IvA+7ZtQx5J6svRBc1QlxxrPn4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=uIk5KgtJ8JgN4E9X4Kl+FBcYMRP9eWu8iaCM+rTEBf2n/Ue93I8Q2RMS/pszlsUCGPcKveEH+zy0D81VgQJ3NFowBuEWyrP//BnC3LDpdLyU9k+xqENBw6jZs8AoaxOAkFIDQW0utg2L6TmRO+aqEvjQgGmMMjRK2qhoGjpfppI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UlswYVN8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UlswYVN8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=eu5ZvhRBqGbSk6AaLgfzXy2QPVH2kRteBU9D7EL3a1k=; b=UlswYVN8AYGp3Qft4WUC8TZ31z
	Q92UHUTApwYK7JqqUtGo265pLOuA5CYDJWcEKFH85ENAHSetAQUujLokh77gWL9ymz6wkacL4CvFG
	SvKTPHx1Axfbg17rfKfeiAwUyfWgA6ghdtnogGhM8tRP5V8+Wqd7XCkvPdq5NhFvb6u+9kpSooWSw
	5BZYHN58RNuNFMUcuH4Vt/t5hi29bCA0txiA9fHrxx21YBp2TwXWd9G4GWEgj/3UGcs66Wm2vnD3m
	P+fn3oSNjLUhP8/9y/0TLKeMBPX+ptPLFRnHYoivcBcRlmlqjmjWl09C3OWQAQ2mJUuhBYBl5aK4+
	wOvxis/g==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-00000004GPe-2FDa;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id DEA513078A4; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102449.682083733@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:33 +0100
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
Subject: [PATCH v2 13/24] perf: Simplify perf_event_alloc()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Using the previous simplifications, transition perf_event_alloc() to
the cleanup way of things -- reducing error path magic.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   60 +++++++++++++++++++--------------------------------
 1 file changed, 23 insertions(+), 37 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5360,6 +5361,8 @@ static void __free_event(struct perf_eve
 	call_rcu(&event->rcu_head, free_event_rcu);
 }
 
+DEFINE_FREE(__free_event, struct perf_event *, if (_T) __free_event(_T))
+
 /* vs perf_event_alloc() success */
 static void _free_event(struct perf_event *event)
 {
@@ -12238,7 +12241,6 @@ perf_event_alloc(struct perf_event_attr
 		 void *context, int cgroup_fd)
 {
 	struct pmu *pmu;
-	struct perf_event *event;
 	struct hw_perf_event *hwc;
 	long err = -EINVAL;
 	int node;
@@ -12253,8 +12255,8 @@ perf_event_alloc(struct perf_event_attr
 	}
 
 	node = (cpu >= 0) ? cpu_to_node(cpu) : -1;
-	event = kmem_cache_alloc_node(perf_event_cache, GFP_KERNEL | __GFP_ZERO,
-				      node);
+	struct perf_event *event __free(__free_event) =
+		kmem_cache_alloc_node(perf_event_cache, GFP_KERNEL | __GFP_ZERO, node);
 	if (!event)
 		return ERR_PTR(-ENOMEM);
 
@@ -12361,65 +12363,53 @@ perf_event_alloc(struct perf_event_attr
 	 * See perf_output_read().
 	 */
 	if (has_inherit_and_sample_read(attr) && !(attr->sample_type & PERF_SAMPLE_TID))
-		goto err;
+		return ERR_PTR(-EINVAL);
 
 	if (!has_branch_stack(event))
 		event->attr.branch_sample_type = 0;
 
 	pmu = perf_init_event(event);
-	if (IS_ERR(pmu)) {
-		err = PTR_ERR(pmu);
-		goto err;
-	}
+	if (IS_ERR(pmu))
+		return (void*)pmu;
 
 	/*
 	 * Disallow uncore-task events. Similarly, disallow uncore-cgroup
 	 * events (they don't make sense as the cgroup will be different
 	 * on other CPUs in the uncore mask).
 	 */
-	if (pmu->task_ctx_nr == perf_invalid_context && (task || cgroup_fd != -1)) {
-		err = -EINVAL;
-		goto err;
-	}
+	if (pmu->task_ctx_nr == perf_invalid_context && (task || cgroup_fd != -1))
+		return ERR_PTR(-EINVAL);
 
 	if (event->attr.aux_output &&
 	    (!(pmu->capabilities & PERF_PMU_CAP_AUX_OUTPUT) ||
-	     event->attr.aux_pause || event->attr.aux_resume)) {
-		err = -EOPNOTSUPP;
-		goto err;
-	}
+	     event->attr.aux_pause || event->attr.aux_resume))
+		return ERR_PTR(-EOPNOTSUPP);
 
-	if (event->attr.aux_pause && event->attr.aux_resume) {
-		err = -EINVAL;
-		goto err;
-	}
+	if (event->attr.aux_pause && event->attr.aux_resume)
+		return ERR_PTR(-EINVAL);
 
 	if (event->attr.aux_start_paused) {
-		if (!(pmu->capabilities & PERF_PMU_CAP_AUX_PAUSE)) {
-			err = -EOPNOTSUPP;
-			goto err;
-		}
+		if (!(pmu->capabilities & PERF_PMU_CAP_AUX_PAUSE))
+			return ERR_PTR(-EOPNOTSUPP);
 		event->hw.aux_paused = 1;
 	}
 
 	if (cgroup_fd != -1) {
 		err = perf_cgroup_connect(cgroup_fd, event, attr, group_leader);
 		if (err)
-			goto err;
+			return ERR_PTR(err);
 	}
 
 	err = exclusive_event_init(event);
 	if (err)
-		goto err;
+		return ERR_PTR(err);
 
 	if (has_addr_filter(event)) {
 		event->addr_filter_ranges = kcalloc(pmu->nr_addr_filters,
 						    sizeof(struct perf_addr_filter_range),
 						    GFP_KERNEL);
-		if (!event->addr_filter_ranges) {
-			err = -ENOMEM;
-			goto err;
-		}
+		if (!event->addr_filter_ranges)
+			return ERR_PTR(-ENOMEM);
 
 		/*
 		 * Clone the parent's vma offsets: they are valid until exec()
@@ -12443,23 +12433,19 @@ perf_event_alloc(struct perf_event_attr
 		if (event->attr.sample_type & PERF_SAMPLE_CALLCHAIN) {
 			err = get_callchain_buffers(attr->sample_max_stack);
 			if (err)
-				goto err;
+				return ERR_PTR(err);
 			event->attach_state |= PERF_ATTACH_CALLCHAIN;
 		}
 	}
 
 	err = security_perf_event_alloc(event);
 	if (err)
-		goto err;
+		return ERR_PTR(err);
 
 	/* symmetric to unaccount_event() in _free_event() */
 	account_event(event);
 
-	return event;
-
-err:
-	__free_event(event);
-	return ERR_PTR(err);
+	return_ptr(event);
 }
 
 static int perf_copy_attr(struct perf_event_attr __user *uattr,


