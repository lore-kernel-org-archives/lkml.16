Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B55822B8D9
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751140; cv=none; b=tChwClG/LCEMVlCLGQFbK2UwBIW2bcEjcQIBRil+ImSLZjnWgLYiZ+TfhaWJGRvXFMHaaRv60117WwAnyxC76os38fmQoLEuOn8RiWX3mzSXzanT5p0vvBdoRB/gwcRwKcKl8PU/oF/CpNFjNT2XmHZ0LwLMjF6Plonne9frcGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751140; c=relaxed/simple;
	bh=fb4yx1mLvfIivb42zEJ6sQ3mn7X1TYb8g7pYQvyHERQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=IMdqhZaOkQDYO0DJWFMJMEI4oyO63Godz9gW76P+5zrYWBdwHVbfT+vi7FlVwq3fgWR3I+4IJDdkWXtwv/ML8xv3szHubYEZrxT7nsoBTq6blVGIxZB4tP3eZ6jjjKlI225VGVxWzjlxRGH9Dj/02xr5uP3bYp/+wAoOl1nMsoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BOaNDxB+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BOaNDxB+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=et62BZe26TSNPT9m7zmj3JkW+qnq8ZueXYHt8xkqpL4=; b=BOaNDxB+8qhm1WOH11iyiecxJn
	fVFA/AfK8L/sNXJUpsGOsUpM1QTERb3e91fXdlp5KgPVQku1O9sAloZrvn43heerci7C9nxx/Ruiz
	/1CxaRweBbHnR/rS+0tYmJ5BIGKmORcvN57X0b8vfRe5L7V+F66NWt5D3GWsroF0hN0ZfCQsKCR8A
	hSnMnezrJqzAtDQtTj+fnxuk1EeXXt01EOyAGI2Yq0XoSmTJr7waCBjP4NcqYsNF6h7Wc3Az3VpPc
	fQUpSvpU7jUqhZRifr2UQ+OmORjbXTYTan0YAyRqBQQIpMszBAGVucUibW4q7/88FSinCmyhzsvMT
	4pjwMd8g==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-00000004GPa-26uI;
	Wed, 05 Feb 2025 10:25:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D6E323061F6; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102449.451984422@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:31 +0100
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
Subject: [PATCH v2 11/24] perf: Simplify perf_pmu_register()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Using the previously introduced perf_pmu_free() and a new IDR helper,
simplify the perf_pmu_register error paths.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/idr.h  |   17 ++++++++++++
 kernel/events/core.c |   71 ++++++++++++++++++++-------------------------------
 2 files changed, 46 insertions(+), 42 deletions(-)

--- a/include/linux/idr.h
+++ b/include/linux/idr.h
@@ -15,6 +15,7 @@
 #include <linux/radix-tree.h>
 #include <linux/gfp.h>
 #include <linux/percpu.h>
+#include <linux/cleanup.h>
 
 struct idr {
 	struct radix_tree_root	idr_rt;
@@ -124,6 +125,22 @@ void *idr_get_next_ul(struct idr *, unsi
 void *idr_replace(struct idr *, void *, unsigned long id);
 void idr_destroy(struct idr *);
 
+struct __class_idr {
+	struct idr *idr;
+	int id;
+};
+
+#define idr_null ((struct __class_idr){ NULL, -1 })
+#define take_idr_id(id) __get_and_null(id, idr_null)
+
+DEFINE_CLASS(idr_alloc, struct __class_idr,
+	     if (_T.id >= 0) idr_remove(_T.idr, _T.id),
+	     ((struct __class_idr){
+	     	.idr = idr,
+		.id = idr_alloc(idr, ptr, start, end, gfp),
+	     }),
+	     struct idr *idr, void *ptr, int start, int end, gfp_t gfp);
+
 /**
  * idr_init_base() - Initialise an IDR.
  * @idr: IDR handle.
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11778,52 +11778,49 @@ static void perf_pmu_free(struct pmu *pm
 	free_percpu(pmu->cpu_pmu_context);
 }
 
-int perf_pmu_register(struct pmu *pmu, const char *name, int type)
+DEFINE_FREE(pmu_unregister, struct pmu *, if (_T) perf_pmu_free(_T))
+
+int perf_pmu_register(struct pmu *_pmu, const char *name, int type)
 {
-	int cpu, ret, max = PERF_TYPE_MAX;
+	int cpu, max = PERF_TYPE_MAX;
 
-	pmu->type = -1;
+	struct pmu *pmu __free(pmu_unregister) = _pmu;
+	guard(mutex)(&pmus_lock);
 
-	mutex_lock(&pmus_lock);
-	ret = -ENOMEM;
 	pmu->pmu_disable_count = alloc_percpu(int);
 	if (!pmu->pmu_disable_count)
-		goto unlock;
+		return -ENOMEM;
 
-	if (WARN_ONCE(!name, "Can not register anonymous pmu.\n")) {
-		ret = -EINVAL;
-		goto free;
-	}
+	if (WARN_ONCE(!name, "Can not register anonymous pmu.\n"))
+		return -EINVAL;
 
-	if (WARN_ONCE(pmu->scope >= PERF_PMU_MAX_SCOPE, "Can not register a pmu with an invalid scope.\n")) {
-		ret = -EINVAL;
-		goto free;
-	}
+	if (WARN_ONCE(pmu->scope >= PERF_PMU_MAX_SCOPE,
+		      "Can not register a pmu with an invalid scope.\n"))
+		return -EINVAL;
 
 	pmu->name = name;
 
 	if (type >= 0)
 		max = type;
 
-	ret = idr_alloc(&pmu_idr, NULL, max, 0, GFP_KERNEL);
-	if (ret < 0)
-		goto free;
+	CLASS(idr_alloc, pmu_type)(&pmu_idr, NULL, max, 0, GFP_KERNEL);
+	if (pmu_type.id < 0)
+		return pmu_type.id;
 
-	WARN_ON(type >= 0 && ret != type);
+	WARN_ON(type >= 0 && pmu_type.id != type);
 
-	pmu->type = ret;
+	pmu->type = pmu_type.id;
 	atomic_set(&pmu->exclusive_cnt, 0);
 
 	if (pmu_bus_running && !pmu->dev) {
-		ret = pmu_dev_alloc(pmu);
+		int ret = pmu_dev_alloc(pmu);
 		if (ret)
-			goto free;
+			return ret;
 	}
 
-	ret = -ENOMEM;
 	pmu->cpu_pmu_context = alloc_percpu(struct perf_cpu_pmu_context);
 	if (!pmu->cpu_pmu_context)
-		goto free;
+		return -ENOMEM;
 
 	for_each_possible_cpu(cpu) {
 		struct perf_cpu_pmu_context *cpc;
@@ -11864,32 +11861,22 @@ int perf_pmu_register(struct pmu *pmu, c
 	/*
 	 * Now that the PMU is complete, make it visible to perf_try_init_event().
 	 */
-	if (!idr_cmpxchg(&pmu_idr, pmu->type, NULL, pmu)) {
-		ret = -EINVAL;
-		goto free;
-	}
+	if (!idr_cmpxchg(&pmu_idr, pmu->type, NULL, pmu))
+		return -EINVAL;
 	list_add_rcu(&pmu->entry, &pmus);
 
-	ret = 0;
-unlock:
-	mutex_unlock(&pmus_lock);
-
-	return ret;
-
-free:
-	if (pmu->type >= 0)
-		idr_remove(&pmu_idr, pmu->type);
-	perf_pmu_free(pmu);
-	goto unlock;
+	take_idr_id(pmu_type);
+	_pmu = no_free_ptr(pmu); // let it rip
+	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_pmu_register);
 
 void perf_pmu_unregister(struct pmu *pmu)
 {
-	mutex_lock(&pmus_lock);
-	list_del_rcu(&pmu->entry);
-	idr_remove(&pmu_idr, pmu->type);
-	mutex_unlock(&pmus_lock);
+	scoped_guard (mutex, &pmus_lock) {
+		list_del_rcu(&pmu->entry);
+		idr_remove(&pmu_idr, pmu->type);
+	}
 
 	/*
 	 * We dereference the pmu list under both SRCU and regular RCU, so


