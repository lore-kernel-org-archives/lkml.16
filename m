Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA012309B3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751152; cv=none; b=B5dVxgkTPK5Uf1wn1k9eWvwUSZgSFLWsBY5QUfS7citewkqI/w45lm1/gk86GPOZcp1eNObijTY/396/Y5X46/Ag9uIlgzlLmx/pfEPZorlhS8zG7surfFze3L0yO6ocoqFW0U4tubUQR21XOVLTMXoK3NDhhXv/zn+oJv5UKyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751152; c=relaxed/simple;
	bh=AeZhM/tJiHVa4QhSBs3iTgAN3KRu0glOTLTyr6soPK8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=H2iexXxyKy/ZW8/H/2XGjvmOMMQ96hRdfayZ7glUVZLtFej/1/mcvPCAgfQq8SNlvDQqCnh+05XOqu7jhvUAWnFq2dKcc53AzccMYwEa3MhfSoIpsKRPFMazEwuDvSVKK6dUEhrYtTx/elixFC9LIZkURZUXtolb3fGiB8CqkXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vBRiqrBp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vBRiqrBp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=rqt7ldGfsvkJgM5c0RTcP/CKPPdkVrAGzemxz4WCgPU=; b=vBRiqrBp1uzhzfBZdCI+dV/C8F
	iBlVwCOWgmuC0cKOVHJ7buPKxzUW9NNhmivEM39KkcFktD1IUIBhlmq1ELXx1hYmaKOlQa22nCunj
	c6VuXjGey6RV8qhaBICOdQp4q2dF/V0P4F56Iy1rJ9yDOe9bKKeBwlRlnHyKzme+HGDBZZy3wyXm3
	kEWmucFniSQw1lNlwNCgvIhhAI8wMcNICH0cDXa6Y+/SUefaTzdrcObVKy6u53uz6yN0kG6iofwMg
	3ReYJAjGmq6f7y1371yZRZm8lqALSHLt7SOYfvEVSGojiwZ8cEWREkX7pL0e/KITKbzpB3Y2ltShL
	mc7deYdQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-00000004GPY-1wdb;
	Wed, 05 Feb 2025 10:25:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C8B113031DE; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102449.006102855@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:27 +0100
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
Subject: [PATCH v2 07/24] perf: Fix perf_pmu_register() vs perf_init_event()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

There is a fairly obvious race between perf_init_event() doing
idr_find() and perf_pmu_register() doing idr_alloc() with an
incompletely initialized pmu pointer.

Avoid by doing idr_alloc() on a NULL pointer to register the id, and
swizzling the real pmu pointer at the end using idr_replace().

Also making sure to not set pmu members after publishing the pmu, duh.

[ introduce idr_cmpxchg() in order to better handle the idr_replace()
  error case -- if it were to return an unexpected pointer, it will
  already have replaced the value and there is no going back. ]

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11739,6 +11739,21 @@ static int pmu_dev_alloc(struct pmu *pmu
 static struct lock_class_key cpuctx_mutex;
 static struct lock_class_key cpuctx_lock;
 
+static bool idr_cmpxchg(struct idr *idr, unsigned long id, void *old, void *new)
+{
+	void *tmp, *val = idr_find(idr, id);
+
+	if (val != old)
+		return false;
+
+	tmp = idr_replace(idr, new, id);
+	if (IS_ERR(tmp))
+		return false;
+
+	WARN_ON_ONCE(tmp != val);
+	return true;
+}
+
 int perf_pmu_register(struct pmu *pmu, const char *name, int type)
 {
 	int cpu, ret, max = PERF_TYPE_MAX;
@@ -11765,7 +11780,7 @@ int perf_pmu_register(struct pmu *pmu, c
 	if (type >= 0)
 		max = type;
 
-	ret = idr_alloc(&pmu_idr, pmu, max, 0, GFP_KERNEL);
+	ret = idr_alloc(&pmu_idr, NULL, max, 0, GFP_KERNEL);
 	if (ret < 0)
 		goto free_pdc;
 
@@ -11773,6 +11788,7 @@ int perf_pmu_register(struct pmu *pmu, c
 
 	type = ret;
 	pmu->type = type;
+	atomic_set(&pmu->exclusive_cnt, 0);
 
 	if (pmu_bus_running && !pmu->dev) {
 		ret = pmu_dev_alloc(pmu);
@@ -11821,14 +11837,22 @@ int perf_pmu_register(struct pmu *pmu, c
 	if (!pmu->event_idx)
 		pmu->event_idx = perf_event_idx_default;
 
+	/*
+	 * Now that the PMU is complete, make it visible to perf_try_init_event().
+	 */
+	if (!idr_cmpxchg(&pmu_idr, pmu->type, NULL, pmu))
+		goto free_context;
 	list_add_rcu(&pmu->entry, &pmus);
-	atomic_set(&pmu->exclusive_cnt, 0);
+
 	ret = 0;
 unlock:
 	mutex_unlock(&pmus_lock);
 
 	return ret;
 
+free_context:
+	free_percpu(pmu->cpu_pmu_context);
+
 free_dev:
 	if (pmu->dev && pmu->dev != PMU_NULL_DEV) {
 		device_del(pmu->dev);


