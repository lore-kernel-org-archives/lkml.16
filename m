Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DD222B584
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751138; cv=none; b=bzkfe9E6b1CBPhIoBx41gs9rdrndsKI4p5Qn1HN57zrXvkF00beNDWhFHf2EUPqLRUp8UWGatmrGAewJ84qoYljbwShC5laYiw8R26AFrolwYdKvVgFgnDyBhNOa3+gRP2YHd9BCWehxlung2RAKmXfcpiMJAdQ5wUB3CSwG6d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751138; c=relaxed/simple;
	bh=Uo3iRwMo30qUuwd+fK7rUxoC49gNZhQz6oTLxcvKrjw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=e2IubtZardAlouXBmbahD1X4Go1F6hgBLMfIqxtxMNoQZVAUMR5mQurfWqiI2lLhju5W2offX/4s/Zwo35X6j6SkioM4Lcg6RdxKjuF420p3pfKgjYyKooUJ2WigjKkt5Hbmn1yqUE69m2n1mIMTOxhhCtAUzFi3LpUcohKnlPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=egFaWgvu; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="egFaWgvu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=0c5KDEJ1EMCTvwH6BbR0x0uKuseQOdbaYO4MmFZng44=; b=egFaWgvumZPBW/cOOY2E4oXebI
	zc10uTwSyWLGuRUeNBdleXsnVcwgO72cTxGNbANZ2hlMUxBS7yFqYnorXnUOMUhNraNUH3ixcCPS3
	c+1VKb7w69g3nt1EvpBTMClR4NyHSvwPRNN0vrPTmNsbbI4N6UKnCnqIvmkR+vwhS8o8ndsVLTtXy
	sKscBHGLRDVrakmbtWlyjsQZB9A7Q/9z1u/QZX/l4X1LaoRUyJVpxoD7laHfqp6vdfqSr1vwa79om
	989I3TahhyrbhWiYJtMeIo5hm7RpWuMh9LvgJN1mVMTiidHVvMCqsQ9t6JegDU8zcaECYIgRGdr2u
	i4M4aPsQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-0000000GbmC-23Lr;
	Wed, 05 Feb 2025 10:25:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D34A23061EE; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102449.342213679@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:30 +0100
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
Subject: [PATCH v2 10/24] perf: Simplify perf_pmu_register() error path
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The error path of perf_pmu_register() is of course very similar to a
subset of perf_pmu_unregister(). Extract this common part in
perf_pmu_free() and simplify things.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   67 ++++++++++++++++++++++-----------------------------
 1 file changed, 30 insertions(+), 37 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11605,11 +11605,6 @@ static int perf_event_idx_default(struct
 	return 0;
 }
 
-static void free_pmu_context(struct pmu *pmu)
-{
-	free_percpu(pmu->cpu_pmu_context);
-}
-
 /*
  * Let userspace know that this PMU supports address range filtering:
  */
@@ -11815,6 +11810,7 @@ static int pmu_dev_alloc(struct pmu *pmu
 
 free_dev:
 	put_device(pmu->dev);
+	pmu->dev = NULL;
 	goto out;
 }
 
@@ -11836,25 +11832,38 @@ static bool idr_cmpxchg(struct idr *idr,
 	return true;
 }
 
+static void perf_pmu_free(struct pmu *pmu)
+{
+	free_percpu(pmu->pmu_disable_count);
+	if (pmu_bus_running && pmu->dev && pmu->dev != PMU_NULL_DEV) {
+		if (pmu->nr_addr_filters)
+			device_remove_file(pmu->dev, &dev_attr_nr_addr_filters);
+		device_del(pmu->dev);
+		put_device(pmu->dev);
+	}
+	free_percpu(pmu->cpu_pmu_context);
+}
+
 int perf_pmu_register(struct pmu *pmu, const char *name, int type)
 {
 	int cpu, ret, max = PERF_TYPE_MAX;
 
+	pmu->type = -1;
+
 	mutex_lock(&pmus_lock);
 	ret = -ENOMEM;
 	pmu->pmu_disable_count = alloc_percpu(int);
 	if (!pmu->pmu_disable_count)
 		goto unlock;
 
-	pmu->type = -1;
 	if (WARN_ONCE(!name, "Can not register anonymous pmu.\n")) {
 		ret = -EINVAL;
-		goto free_pdc;
+		goto free;
 	}
 
 	if (WARN_ONCE(pmu->scope >= PERF_PMU_MAX_SCOPE, "Can not register a pmu with an invalid scope.\n")) {
 		ret = -EINVAL;
-		goto free_pdc;
+		goto free;
 	}
 
 	pmu->name = name;
@@ -11864,24 +11873,23 @@ int perf_pmu_register(struct pmu *pmu, c
 
 	ret = idr_alloc(&pmu_idr, NULL, max, 0, GFP_KERNEL);
 	if (ret < 0)
-		goto free_pdc;
+		goto free;
 
 	WARN_ON(type >= 0 && ret != type);
 
-	type = ret;
-	pmu->type = type;
+	pmu->type = ret;
 	atomic_set(&pmu->exclusive_cnt, 0);
 
 	if (pmu_bus_running && !pmu->dev) {
 		ret = pmu_dev_alloc(pmu);
 		if (ret)
-			goto free_idr;
+			goto free;
 	}
 
 	ret = -ENOMEM;
 	pmu->cpu_pmu_context = alloc_percpu(struct perf_cpu_pmu_context);
 	if (!pmu->cpu_pmu_context)
-		goto free_dev;
+		goto free;
 
 	for_each_possible_cpu(cpu) {
 		struct perf_cpu_pmu_context *cpc;
@@ -11922,8 +11930,10 @@ int perf_pmu_register(struct pmu *pmu, c
 	/*
 	 * Now that the PMU is complete, make it visible to perf_try_init_event().
 	 */
-	if (!idr_cmpxchg(&pmu_idr, pmu->type, NULL, pmu))
-		goto free_context;
+	if (!idr_cmpxchg(&pmu_idr, pmu->type, NULL, pmu)) {
+		ret = -EINVAL;
+		goto free;
+	}
 	list_add_rcu(&pmu->entry, &pmus);
 
 	ret = 0;
@@ -11932,20 +11942,10 @@ int perf_pmu_register(struct pmu *pmu, c
 
 	return ret;
 
-free_context:
-	free_percpu(pmu->cpu_pmu_context);
-
-free_dev:
-	if (pmu->dev && pmu->dev != PMU_NULL_DEV) {
-		device_del(pmu->dev);
-		put_device(pmu->dev);
-	}
-
-free_idr:
-	idr_remove(&pmu_idr, pmu->type);
-
-free_pdc:
-	free_percpu(pmu->pmu_disable_count);
+free:
+	if (pmu->type >= 0)
+		idr_remove(&pmu_idr, pmu->type);
+	perf_pmu_free(pmu);
 	goto unlock;
 }
 EXPORT_SYMBOL_GPL(perf_pmu_register);
@@ -11964,14 +11964,7 @@ void perf_pmu_unregister(struct pmu *pmu
 	synchronize_srcu(&pmus_srcu);
 	synchronize_rcu();
 
-	free_percpu(pmu->pmu_disable_count);
-	if (pmu_bus_running && pmu->dev && pmu->dev != PMU_NULL_DEV) {
-		if (pmu->nr_addr_filters)
-			device_remove_file(pmu->dev, &dev_attr_nr_addr_filters);
-		device_del(pmu->dev);
-		put_device(pmu->dev);
-	}
-	free_pmu_context(pmu);
+	perf_pmu_free(pmu);
 }
 EXPORT_SYMBOL_GPL(perf_pmu_unregister);
 


