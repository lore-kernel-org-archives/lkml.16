Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A264E22B59D
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751138; cv=none; b=gp0OyyQpNviVFR7noUN4s+3IBmuW4qGbm6vVngY8a8oRZ5un6zZYkOtho6ZPRBiLXlmL8W/QhT2tdtXO3LC3UepuaFqW5d3tIomi66Jnc9OZaYSnz0dnbRJ6N9io9wdX1bfwto8Jc5qeW0StLAgU13jViZetmSAznvQH8uTANZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751138; c=relaxed/simple;
	bh=2zscDwLR0ZjhieKGNemGCr5W89z17A7bETmSG8j0smg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=exSneeW7erMe1diWc+xzMogkTEV0apEN7qsUqykyZS75U0AJZA9xsVJQdgOkc4aaaJWhVhXqRVR3Spy9f5gWEQBDQPP7hoEZAHG+nkLQ0nfqX3Vl/OEOu318vsiXBnmPtnQN6Suq/kmHZP/beljl2QI+Q2cFeAPPcGzep5Y50+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IpcY51AP; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IpcY51AP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=UnuX1XoQTtG9dRc73ChG71Cgdr+YdzLA5XtqNeptKjc=; b=IpcY51APqo79GkJhgk/sAgb8mD
	bCti6WPHKIX8iZm9XQc04e2Rvp+Z45OAlHvfgiF84LoxfbONC9WTnBIJbXPmEdFLPsQSsbYas+/oo
	8D0yM7TNIKnOX+gWElxJFqPHEw/i4VOMflFQxB7BSAVfWfA4Rt9Gv+wfeU1Y3uvtX0Ems1V7AIOmg
	8O1ecEgUZ8C/r7hAOtWrsVrizoBX60Wr1+jghi8X5C1PSIUITowvfSP42ELFEC0HzlDJBK2xL5wif
	veTLI2qc6/9CBraZbPj83Xmv8flKuxi/GDiLVOBgQy+6wGXFBO2Zcq+DrtfO9RgPmbD0pqNl9+Jsr
	7THMfBdQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-0000000GbmF-347e;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E5F61307FAE; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102449.906046341@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:35 +0100
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
Subject: [PATCH v2 15/24] perf: Add this_cpc() helper
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

As a preparation for adding yet another indirection.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1176,23 +1176,28 @@ static int perf_mux_hrtimer_restart_ipi(
 	return perf_mux_hrtimer_restart(arg);
 }
 
+static __always_inline struct perf_cpu_pmu_context *this_cpc(struct pmu *pmu)
+{
+	return this_cpu_ptr(pmu->cpu_pmu_context);
+}
+
 void perf_pmu_disable(struct pmu *pmu)
 {
-	int *count = &this_cpu_ptr(pmu->cpu_pmu_context)->pmu_disable_count;
+	int *count = &this_cpc(pmu)->pmu_disable_count;
 	if (!(*count)++)
 		pmu->pmu_disable(pmu);
 }
 
 void perf_pmu_enable(struct pmu *pmu)
 {
-	int *count = &this_cpu_ptr(pmu->cpu_pmu_context)->pmu_disable_count;
+	int *count = &this_cpc(pmu)->pmu_disable_count;
 	if (!--(*count))
 		pmu->pmu_enable(pmu);
 }
 
 static void perf_assert_pmu_disabled(struct pmu *pmu)
 {
-	int *count = &this_cpu_ptr(pmu->cpu_pmu_context)->pmu_disable_count;
+	int *count = &this_cpc(pmu)->pmu_disable_count;
 	WARN_ON_ONCE(*count == 0);
 }
 
@@ -2304,7 +2309,7 @@ static void
 event_sched_out(struct perf_event *event, struct perf_event_context *ctx)
 {
 	struct perf_event_pmu_context *epc = event->pmu_ctx;
-	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(epc->pmu->cpu_pmu_context);
+	struct perf_cpu_pmu_context *cpc = this_cpc(epc->pmu);
 	enum perf_event_state state = PERF_EVENT_STATE_INACTIVE;
 
 	// XXX cpc serialization, probably per-cpu IRQ disabled
@@ -2445,9 +2450,8 @@ __perf_remove_from_context(struct perf_e
 		pmu_ctx->rotate_necessary = 0;
 
 		if (ctx->task && ctx->is_active) {
-			struct perf_cpu_pmu_context *cpc;
+			struct perf_cpu_pmu_context *cpc = this_cpc(pmu_ctx->pmu);
 
-			cpc = this_cpu_ptr(pmu_ctx->pmu->cpu_pmu_context);
 			WARN_ON_ONCE(cpc->task_epc && cpc->task_epc != pmu_ctx);
 			cpc->task_epc = NULL;
 		}
@@ -2585,7 +2589,7 @@ static int
 event_sched_in(struct perf_event *event, struct perf_event_context *ctx)
 {
 	struct perf_event_pmu_context *epc = event->pmu_ctx;
-	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(epc->pmu->cpu_pmu_context);
+	struct perf_cpu_pmu_context *cpc = this_cpc(epc->pmu);
 	int ret = 0;
 
 	WARN_ON_ONCE(event->ctx != ctx);
@@ -2692,7 +2696,7 @@ group_sched_in(struct perf_event *group_
 static int group_can_go_on(struct perf_event *event, int can_add_hw)
 {
 	struct perf_event_pmu_context *epc = event->pmu_ctx;
-	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(epc->pmu->cpu_pmu_context);
+	struct perf_cpu_pmu_context *cpc = this_cpc(epc->pmu);
 
 	/*
 	 * Groups consisting entirely of software events can always go on.
@@ -3315,9 +3319,8 @@ static void __pmu_ctx_sched_out(struct p
 	struct pmu *pmu = pmu_ctx->pmu;
 
 	if (ctx->task && !(ctx->is_active & EVENT_ALL)) {
-		struct perf_cpu_pmu_context *cpc;
+		struct perf_cpu_pmu_context *cpc = this_cpc(pmu);
 
-		cpc = this_cpu_ptr(pmu->cpu_pmu_context);
 		WARN_ON_ONCE(cpc->task_epc && cpc->task_epc != pmu_ctx);
 		cpc->task_epc = NULL;
 	}
@@ -3565,7 +3568,7 @@ static void perf_ctx_sched_task_cb(struc
 	struct perf_cpu_pmu_context *cpc;
 
 	list_for_each_entry(pmu_ctx, &ctx->pmu_ctx_list, pmu_ctx_entry) {
-		cpc = this_cpu_ptr(pmu_ctx->pmu->cpu_pmu_context);
+		cpc = this_cpc(pmu_ctx->pmu);
 
 		if (cpc->sched_cb_usage && pmu_ctx->pmu->sched_task)
 			pmu_ctx->pmu->sched_task(pmu_ctx, sched_in);
@@ -3674,7 +3677,7 @@ static DEFINE_PER_CPU(int, perf_sched_cb
 
 void perf_sched_cb_dec(struct pmu *pmu)
 {
-	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(pmu->cpu_pmu_context);
+	struct perf_cpu_pmu_context *cpc = this_cpc(pmu);
 
 	this_cpu_dec(perf_sched_cb_usages);
 	barrier();
@@ -3686,7 +3689,7 @@ void perf_sched_cb_dec(struct pmu *pmu)
 
 void perf_sched_cb_inc(struct pmu *pmu)
 {
-	struct perf_cpu_pmu_context *cpc = this_cpu_ptr(pmu->cpu_pmu_context);
+	struct perf_cpu_pmu_context *cpc = this_cpc(pmu);
 
 	if (!cpc->sched_cb_usage++)
 		list_add(&cpc->sched_cb_entry, this_cpu_ptr(&sched_cb_list));
@@ -3810,7 +3813,7 @@ static void __link_epc(struct perf_event
 	if (!pmu_ctx->ctx->task)
 		return;
 
-	cpc = this_cpu_ptr(pmu_ctx->pmu->cpu_pmu_context);
+	cpc = this_cpc(pmu_ctx->pmu);
 	WARN_ON_ONCE(cpc->task_epc && cpc->task_epc != pmu_ctx);
 	cpc->task_epc = pmu_ctx;
 }
@@ -3939,10 +3942,9 @@ static int merge_sched_in(struct perf_ev
 			perf_cgroup_event_disable(event, ctx);
 			perf_event_set_state(event, PERF_EVENT_STATE_ERROR);
 		} else {
-			struct perf_cpu_pmu_context *cpc;
+			struct perf_cpu_pmu_context *cpc = this_cpc(event->pmu_ctx->pmu);
 
 			event->pmu_ctx->rotate_necessary = 1;
-			cpc = this_cpu_ptr(event->pmu_ctx->pmu->cpu_pmu_context);
 			perf_mux_hrtimer_restart(cpc);
 			group_update_userpage(event);
 		}


