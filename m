Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE68223098F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751149; cv=none; b=ugOiGp9yDrdbDrBrZrgAlpOVJm35hYXeC6b4rQyCXMgHNSR9yWJVYXuLqPCk6jPhtl5Kntbpchby1M1yNMjAUSpLCPdMLPgH4AIDOxvVR8meXuO2GsQttfmudgbAdCNHQeEKPwUSgrSLRGqkmIKSCYxzWZzHU/wxFBk9BQPuYXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751149; c=relaxed/simple;
	bh=41Y9iiBFIWa+xKSz6JdAshpsBvIL4g8JIQnoVc7pb6g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=j433LXajJX0PEUQmKLr6Nux7OsKJC4CecTMarCpfv335AJNupe/n+Pmm7N5ceHB2iELKPf6U4d3iW/Pyb8DUg0wXLgIL3fuTmqm0sJJiPzM3CD9U6lFn2aebT1nYWU0f/ifPSjSsMkG4wOSD4/A3ILnnCZa1YtW5BtmJOOD3fj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hLIOl2vz; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hLIOl2vz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Bm6lxT+iF6YGPyZbFX7MMSqDd/wgHbIFbh5l5hoRNJg=; b=hLIOl2vzAkNabmGYA4aJFmCT6p
	bIePL8i7YjExx2HO3sqnJoSFz78EVSE7Z6QF2zMGrTAL8mKOPQgg2KWyZbZ0IB7Igh0TrVRVS4p5/
	SnC/3Eh6qJsUYldipD/F0/R90G2UKrhXAaFFtnrfGuFdl/KUynUczKBkTPZ2uVd0ctnPdQddj2vcr
	VCanr5NKRywGkMxOD2Q78L8MDPkcyJ+OWIzBUZ92x9v3H1InHejx4WeZkXOax2mLubrxBIeydYtY3
	lnmYNKGe/StmqmHenqipHEfAZM63WmFIKH+Tdld6oFhj0axKl3D3apYE5c40NQEanaK1XGdehSrCO
	yoZ/X2Lw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-00000004GPf-2HJO;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E2228307FA8; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102449.797431411@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:34 +0100
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
Subject: [PATCH v2 14/24] perf: Merge pmu_disable_count into cpu_pmu_context
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Because it makes no sense to have two per-cpu allocations per pmu.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/perf_event.h |    2 +-
 kernel/events/core.c       |   12 ++++--------
 2 files changed, 5 insertions(+), 9 deletions(-)

--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -343,7 +343,6 @@ struct pmu {
 	 */
 	unsigned int			scope;
 
-	int __percpu			*pmu_disable_count;
 	struct perf_cpu_pmu_context __percpu *cpu_pmu_context;
 	atomic_t			exclusive_cnt; /* < 0: cpu; > 0: tsk */
 	int				task_ctx_nr;
@@ -1031,6 +1030,7 @@ struct perf_cpu_pmu_context {
 
 	int				active_oncpu;
 	int				exclusive;
+	int				pmu_disable_count;
 
 	raw_spinlock_t			hrtimer_lock;
 	struct hrtimer			hrtimer;
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1174,21 +1174,22 @@ static int perf_mux_hrtimer_restart_ipi(
 
 void perf_pmu_disable(struct pmu *pmu)
 {
-	int *count = this_cpu_ptr(pmu->pmu_disable_count);
+	int *count = &this_cpu_ptr(pmu->cpu_pmu_context)->pmu_disable_count;
 	if (!(*count)++)
 		pmu->pmu_disable(pmu);
 }
 
 void perf_pmu_enable(struct pmu *pmu)
 {
-	int *count = this_cpu_ptr(pmu->pmu_disable_count);
+	int *count = &this_cpu_ptr(pmu->cpu_pmu_context)->pmu_disable_count;
 	if (!--(*count))
 		pmu->pmu_enable(pmu);
 }
 
 static void perf_assert_pmu_disabled(struct pmu *pmu)
 {
-	WARN_ON_ONCE(*this_cpu_ptr(pmu->pmu_disable_count) == 0);
+	int *count = &this_cpu_ptr(pmu->cpu_pmu_context)->pmu_disable_count;
+	WARN_ON_ONCE(*count == 0);
 }
 
 static inline void perf_pmu_read(struct perf_event *event)
@@ -11860,7 +11861,6 @@ static bool idr_cmpxchg(struct idr *idr,
 
 static void perf_pmu_free(struct pmu *pmu)
 {
-	free_percpu(pmu->pmu_disable_count);
 	if (pmu_bus_running && pmu->dev && pmu->dev != PMU_NULL_DEV) {
 		if (pmu->nr_addr_filters)
 			device_remove_file(pmu->dev, &dev_attr_nr_addr_filters);
@@ -11879,10 +11879,6 @@ int perf_pmu_register(struct pmu *_pmu,
 	struct pmu *pmu __free(pmu_unregister) = _pmu;
 	guard(mutex)(&pmus_lock);
 
-	pmu->pmu_disable_count = alloc_percpu(int);
-	if (!pmu->pmu_disable_count)
-		return -ENOMEM;
-
 	if (WARN_ONCE(!name, "Can not register anonymous pmu.\n"))
 		return -EINVAL;
 


