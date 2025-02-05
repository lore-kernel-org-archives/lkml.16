Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD6722F399
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751145; cv=none; b=J6Q1yt9HsFk3/tKZ2sF99xMaLeXmObdb4dabqJqQT/mD8VcGUQlto6w412mL8/wN3X3ADoEa/naD5Ostp6gk62vZAYimeMuyp+VIBe2tLGIyX7o51DHpDV2S9QLS4fWLXi9K9BS4NqH8sIQF4+Boanl2ugOqtKjG5fZeGslDv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751145; c=relaxed/simple;
	bh=V5gRc9xaSn1o1EJddIrGLWliyFJt9NbqAOiRFB5WSpI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=MNPfjnOtvN1kUr7yMyJ2/UiSEN6+uomCgYChTGoI7hFYzT62izdn2+bZ69fjIB6lVat33qgddkrUpTbxPZdkSCuYGiK8MIl5QOe2E3oRprHA0+opNjkamWigEfvFj/IlhMd6soNqU4cUAgabMTJQ1+E4BkB6UtvD+YRaJyudxvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rvVT9Y6Q; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rvVT9Y6Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=caaHUBwU3FjXVkr/jMxyi0Xl6jcwm1jZ/HPyaNVGz1c=; b=rvVT9Y6QWlCkTCvxMkqE1VeA9T
	i1JZFZO+NBH72LciNsxNNhiERji24+Emb7gdfGg8CeZHjfaTFxqHNnfJytzdyJJElcUwBko74iv2d
	j4IlVXCuyeMfnTTJ+CjN6sULirxzXwQMJO7bGYiXp78dS1uzpOyRl7i6I63RqZ9dBYTioLcCQYevK
	bKttlyLVu9A2TdJu8rvPMOh3Ak0lYYADhOsJo5ugy7BqfEIfRi22C88Cjr7VpBknoKM2euWlOZtJ6
	bsD0QlbWgLLDphQP0FLWYdu0Xitl0fclSDWPsXKPiq4djky3WPUjtU5mVJppWaR9WuOmrQeN1iuZ8
	pI4UYmGw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-00000004GPZ-24yU;
	Wed, 05 Feb 2025 10:25:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id CC50530619B; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102449.110145835@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:28 +0100
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
Subject: [PATCH v2 08/24] perf: Cleanup perf_try_init_event()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Make sure that perf_try_init_event() doesn't leave event->pmu nor
event->destroy set on failure.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   69 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 28 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -12019,38 +12019,51 @@ static int perf_try_init_event(struct pm
 	if (ctx)
 		perf_event_ctx_unlock(event->group_leader, ctx);
 
-	if (!ret) {
-		if (!(pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS) &&
-		    has_extended_regs(event))
-			ret = -EOPNOTSUPP;
-
-		if (pmu->capabilities & PERF_PMU_CAP_NO_EXCLUDE &&
-		    event_has_any_exclude_flag(event))
-			ret = -EINVAL;
-
-		if (pmu->scope != PERF_PMU_SCOPE_NONE && event->cpu >= 0) {
-			const struct cpumask *cpumask = perf_scope_cpu_topology_cpumask(pmu->scope, event->cpu);
-			struct cpumask *pmu_cpumask = perf_scope_cpumask(pmu->scope);
-			int cpu;
-
-			if (pmu_cpumask && cpumask) {
-				cpu = cpumask_any_and(pmu_cpumask, cpumask);
-				if (cpu >= nr_cpu_ids)
-					ret = -ENODEV;
-				else
-					event->event_caps |= PERF_EV_CAP_READ_SCOPE;
-			} else {
-				ret = -ENODEV;
-			}
-		}
+	if (ret)
+		goto err_pmu;
 
-		if (ret && event->destroy)
-			event->destroy(event);
+	if (!(pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS) &&
+	    has_extended_regs(event)) {
+		ret = -EOPNOTSUPP;
+		goto err_destroy;
 	}
 
-	if (ret)
-		module_put(pmu->module);
+	if (pmu->capabilities & PERF_PMU_CAP_NO_EXCLUDE &&
+	    event_has_any_exclude_flag(event)) {
+		ret = -EINVAL;
+		goto err_destroy;
+	}
+
+	if (pmu->scope != PERF_PMU_SCOPE_NONE && event->cpu >= 0) {
+		const struct cpumask *cpumask;
+		struct cpumask *pmu_cpumask;
+		int cpu;
+
+		cpumask = perf_scope_cpu_topology_cpumask(pmu->scope, event->cpu);
+		pmu_cpumask = perf_scope_cpumask(pmu->scope);
+
+		ret = -ENODEV;
+		if (!pmu_cpumask || !cpumask)
+			goto err_destroy;
+
+		cpu = cpumask_any_and(pmu_cpumask, cpumask);
+		if (cpu >= nr_cpu_ids)
+			goto err_destroy;
+
+		event->event_caps |= PERF_EV_CAP_READ_SCOPE;
+	}
+
+	return 0;
+
+err_destroy:
+	if (event->destroy) {
+		event->destroy(event);
+		event->destroy = NULL;
+	}
 
+err_pmu:
+	event->pmu = NULL;
+	module_put(pmu->module);
 	return ret;
 }
 


