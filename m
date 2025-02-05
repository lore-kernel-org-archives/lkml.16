Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4BC22B587
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751139; cv=none; b=lRPl0v6GitPdrb6mQD6o1jDhvSHkzz8jBrtiKquqpyThO2l0GJb64gVbx7QIU6d+YH279HFyJwIqRQVQGUv14HrOVOwMUZORlL8iM7zhNCpGAh50ZOujI7AYnqYDm0BJb0foZhfOpbvtcSnElOmIcjSEHiQhuJpBj6z9UZicUjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751139; c=relaxed/simple;
	bh=k/cG38pmzyjUIZk1609SZCN25ncHk8XKRnc054U+rLI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Uf2g/flvWUBRuZs1ExFq70+ZpLJtzjgIx/D7duig5dtYH6iagPqjKIB5CjcGtQkcLUA9mJKB4rjC9g3QaKM7Bve86n1aZq3e58ZaIQ1ElOBGxRwMJMIZhXtWcBdopfl3ZXwD3jmX7pIkP6hPYgxrFraOBp1j4nDebaeWzWhTHIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CLqmmzEl; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CLqmmzEl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=awRwc3C7jyT26FBW24uhR95uNITqcA5r2W8hvYtalrM=; b=CLqmmzElantDocWicWXo46ZDoM
	ZxwKXd5pR5JlWruytj68BVCKyWw4bsDzgc/KpL+YC3QI7PodPo6QUofwDzYwonIKj0MnB/B+6/EkJ
	iyP+9A8hIXlohpDN6xSpemFPt6yXVIN670dC9/ujEqoncOp0q+qO/36eE9AvxqA85LhDAboE3GM3o
	TxI+4gv1kO3BZ+H1viYBho6yul/4xUr1xrgHdIup4gPZM0bN86042f/tCss9c3RJdJw6NS+N5W3PI
	0kjImxhoTTOCTE5UOdxn7srHvPjnk/zr53Lb6Wz5fU8Yus9xoh81s+5hDBJMfb4/Gd108EQ4PiJYK
	bt5Mf6kA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb2-0000000GbmA-41ew;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C4C33302E9C; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102448.898435571@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:26 +0100
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
Subject: [PATCH v2 06/24] perf: Fix pmus_lock vs pmus_srcu ordering
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Commit a63fbed776c7 ("perf/tracing/cpuhotplug: Fix locking order")
placed pmus_lock inside pmus_srcu, this makes perf_pmu_unregister()
trip lockdep.

Move the locking about such that only pmu_idr and pmus (list) are
modified while holding pmus_lock. This avoids doing synchronize_srcu()
while holding pmus_lock and all is well again.

Fixes: a63fbed776c7 ("perf/tracing/cpuhotplug: Fix locking order")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11836,6 +11836,8 @@ void perf_pmu_unregister(struct pmu *pmu
 {
 	mutex_lock(&pmus_lock);
 	list_del_rcu(&pmu->entry);
+	idr_remove(&pmu_idr, pmu->type);
+	mutex_unlock(&pmus_lock);
 
 	/*
 	 * We dereference the pmu list under both SRCU and regular RCU, so
@@ -11845,7 +11847,6 @@ void perf_pmu_unregister(struct pmu *pmu
 	synchronize_rcu();
 
 	free_percpu(pmu->pmu_disable_count);
-	idr_remove(&pmu_idr, pmu->type);
 	if (pmu_bus_running && pmu->dev && pmu->dev != PMU_NULL_DEV) {
 		if (pmu->nr_addr_filters)
 			device_remove_file(pmu->dev, &dev_attr_nr_addr_filters);
@@ -11853,7 +11854,6 @@ void perf_pmu_unregister(struct pmu *pmu
 		put_device(pmu->dev);
 	}
 	free_pmu_context(pmu);
-	mutex_unlock(&pmus_lock);
 }
 EXPORT_SYMBOL_GPL(perf_pmu_unregister);
 


