Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBE822ACEF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751136; cv=none; b=Hl7nH/bmXgFGHN4TlslwaOoZ7FwAUTW2hfCKm0EhLXyxbBTLM/wiBYP2Qdkh4zHEaHKYpRTXgeLJZMpxrRX7z4/Yi0VYO6e1nJZ4i1A6ruOsHbxCsAG+WPZ+MKklIuvYX6e9gBgd4wYbw2dOCUXgJBfonH2NVWKV01Zj6uU85SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751136; c=relaxed/simple;
	bh=1kQdT7RNP30VSQRhVbLbDXk7u0BCc/CqkwU4buF82HI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=GyldpZkuTUbua3h3g0RMq4FfgML0vC1YmJkOKIMX/xBwbvLbvSN5McMD/6J6vkkNLbqFyYuo+zjbjEkvnSZsq09htonHh1ZBIEfc0OCoeFg9Q01lIjF4RJ3hRE0/3EUTMtgRo88/uUYrtx+IHY2MyscieBATW/KrKf4PV4CAdY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UCnKCpJa; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UCnKCpJa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Wwd6VbMcmGqdP94/vtno7cnLFnb1TlambeNcu37V/zM=; b=UCnKCpJaplDgiCBcHb+48fhhPo
	wkNRN/6jjzxBknsakXe4zcsBPed5tZ5sccNToZEXMSBQXmtAaiynpNK8REJeNPNF2cnUqcSZ3HExz
	cMz1PmG980uUwgrVQ/2dkbVZvGIQVo5rhoTTVDfpDYM+c4gl9AwGTjtfUkyoj7IaG3ICDTPsHtUsE
	d7A8RodJV+WjKTDBgGf9kBcGY7q4tExci8xTLT1O33yoDUzugdUVAmIaRYQ9qf9lUKiLhdZ0sQWmn
	YjIaJL0K4ANWf/QfWBpi7seFf5wKXEA40GNEgQ7uxm0AKHqmzpEK2edioVZ6L1xUhAD/cGsLAVxpR
	fNgan5uA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-00000004GPj-35EO;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E9436308076; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102450.016081954@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:36 +0100
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
Subject: [PATCH v2 16/24] perf: Detach perf_cpu_pmu_context and pmu lifetimes
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

In prepration for being able to unregister a pmu with existing events,
it becomes important to detach struct perf_cpu_pmu_context lifetimes
from that of struct pmu.

Notably perf_cpu_pmu_context embeds a perf_event_pmu_context that can
stay referenced until the last event goes.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/perf_event.h |    4 +--
 kernel/events/core.c       |   56 +++++++++++++++++++++++++++++++++++++--------
 2 files changed, 49 insertions(+), 11 deletions(-)

--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -336,7 +336,7 @@ struct pmu {
 	 */
 	unsigned int			scope;
 
-	struct perf_cpu_pmu_context __percpu *cpu_pmu_context;
+	struct perf_cpu_pmu_context __percpu **cpu_pmu_context;
 	atomic_t			exclusive_cnt; /* < 0: cpu; > 0: tsk */
 	int				task_ctx_nr;
 	int				hrtimer_interval_ms;
@@ -901,7 +901,7 @@ struct perf_event_pmu_context {
 	struct list_head		pinned_active;
 	struct list_head		flexible_active;
 
-	/* Used to avoid freeing per-cpu perf_event_pmu_context */
+	/* Used to identify the per-cpu perf_event_pmu_context */
 	unsigned int			embedded : 1;
 
 	unsigned int			nr_events;
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1178,7 +1178,7 @@ static int perf_mux_hrtimer_restart_ipi(
 
 static __always_inline struct perf_cpu_pmu_context *this_cpc(struct pmu *pmu)
 {
-	return this_cpu_ptr(pmu->cpu_pmu_context);
+	return *this_cpu_ptr(pmu->cpu_pmu_context);
 }
 
 void perf_pmu_disable(struct pmu *pmu)
@@ -4971,11 +4971,14 @@ find_get_pmu_context(struct pmu *pmu, st
 		 */
 		struct perf_cpu_pmu_context *cpc;
 
-		cpc = per_cpu_ptr(pmu->cpu_pmu_context, event->cpu);
+		cpc = *per_cpu_ptr(pmu->cpu_pmu_context, event->cpu);
 		epc = &cpc->epc;
 		raw_spin_lock_irq(&ctx->lock);
 		if (!epc->ctx) {
-			atomic_set(&epc->refcount, 1);
+			/*
+			 * One extra reference for the pmu; see perf_pmu_free().
+			 */
+			atomic_set(&epc->refcount, 2);
 			epc->embedded = 1;
 			list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
 			epc->ctx = ctx;
@@ -5044,6 +5047,15 @@ static void get_pmu_ctx(struct perf_even
 	WARN_ON_ONCE(!atomic_inc_not_zero(&epc->refcount));
 }
 
+static void free_cpc_rcu(struct rcu_head *head)
+{
+	struct perf_cpu_pmu_context *cpc =
+		container_of(head, typeof(*cpc), epc.rcu_head);
+
+	kfree(cpc->epc.task_ctx_data);
+	kfree(cpc);
+}
+
 static void free_epc_rcu(struct rcu_head *head)
 {
 	struct perf_event_pmu_context *epc = container_of(head, typeof(*epc), rcu_head);
@@ -5078,8 +5090,10 @@ static void put_pmu_ctx(struct perf_even
 
 	raw_spin_unlock_irqrestore(&ctx->lock, flags);
 
-	if (epc->embedded)
+	if (epc->embedded) {
+		call_rcu(&epc->rcu_head, free_cpc_rcu);
 		return;
+	}
 
 	call_rcu(&epc->rcu_head, free_epc_rcu);
 }
@@ -11595,7 +11609,7 @@ perf_event_mux_interval_ms_store(struct
 	cpus_read_lock();
 	for_each_online_cpu(cpu) {
 		struct perf_cpu_pmu_context *cpc;
-		cpc = per_cpu_ptr(pmu->cpu_pmu_context, cpu);
+		cpc = *per_cpu_ptr(pmu->cpu_pmu_context, cpu);
 		cpc->hrtimer_interval = ns_to_ktime(NSEC_PER_MSEC * timer);
 
 		cpu_function_call(cpu, perf_mux_hrtimer_restart_ipi, cpc);
@@ -11767,7 +11781,25 @@ static void perf_pmu_free(struct pmu *pm
 		device_del(pmu->dev);
 		put_device(pmu->dev);
 	}
-	free_percpu(pmu->cpu_pmu_context);
+
+	if (pmu->cpu_pmu_context) {
+		int cpu;
+
+		for_each_possible_cpu(cpu) {
+			struct perf_cpu_pmu_context *cpc;
+
+			cpc = *per_cpu_ptr(pmu->cpu_pmu_context, cpu);
+			if (!cpc)
+				continue;
+			if (cpc->epc.embedded) {
+				/* refcount managed */
+				put_pmu_ctx(&cpc->epc);
+				continue;
+			}
+			kfree(cpc);
+		}
+		free_percpu(pmu->cpu_pmu_context);
+	}
 }
 
 DEFINE_FREE(pmu_unregister, struct pmu *, if (_T) perf_pmu_free(_T))
@@ -11806,14 +11838,20 @@ int perf_pmu_register(struct pmu *_pmu,
 			return ret;
 	}
 
-	pmu->cpu_pmu_context = alloc_percpu(struct perf_cpu_pmu_context);
+	pmu->cpu_pmu_context = alloc_percpu(struct perf_cpu_pmu_context *);
 	if (!pmu->cpu_pmu_context)
 		return -ENOMEM;
 
 	for_each_possible_cpu(cpu) {
-		struct perf_cpu_pmu_context *cpc;
+		struct perf_cpu_pmu_context *cpc =
+			kmalloc_node(sizeof(struct perf_cpu_pmu_context),
+				     GFP_KERNEL | __GFP_ZERO,
+				     cpu_to_node(cpu));
+
+		if (!cpc)
+			return -ENOMEM;
 
-		cpc = per_cpu_ptr(pmu->cpu_pmu_context, cpu);
+		*per_cpu_ptr(pmu->cpu_pmu_context, cpu) = cpc;
 		__perf_init_event_pmu_context(&cpc->epc, pmu);
 		__perf_mux_hrtimer_init(cpc, cpu);
 	}


