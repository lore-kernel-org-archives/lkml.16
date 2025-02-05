Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D747022FDE0
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751146; cv=none; b=qtbCoPQ5XC9oYZi3DZrNhjh+nSPb8hazZ2eG0Q8gQUPN38N+Dp9Rwigzw1QWSNawdFSx8ivr0clJqb8r0EgiRER9zxl/W32/c4rYQUZag9JDxoXtIBMa8xtPboAANxlcg/wsD1MlXRnc+efCZGvOYBnCcGh/M7GdVdFFif2mx5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751146; c=relaxed/simple;
	bh=f5dpMh9AhzPjGGmswmBsQrHH1XA3sp2ngO2q5ZzvHoo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=qQ40Ri2p7Ha46MPC7t38qfu45rEKLWRmrlISQ9A8rbrPelwDADvcEiPZ/ZxkviFzHQ5AULNHIkUe66ZavT39tCpNfHYairHDg/7v2SN6auLfQQ6xOC0+b9MR2/MzLQJ3cw9UsbXTua5gRFp6B9IQaYk2LjzCt7iYSehfsSeloOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BI0PO8sG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BI0PO8sG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=mO36VRNVxK68SLi3Hxx0gi8+RzNHKpmki4ffDW+Vt6g=; b=BI0PO8sG8f/04Bu+03mBn0tg8/
	6qTsRXSFvATfaPeQR2W8SihBK8thion04pKNaikCGNrq9VUVK+nwNNrdnGlqMSoYk2gPwFo1k7AHi
	7U8DcslOIWSWOLmjYAKzFRRqbtp0cUKO8ZctA1NGHJN+UY8HF4pqZpnWq5kCy3ctr+i0+vvkQFn5S
	SYWpzSX1clujYqL6PmZH/CnFJ697CLxlI2Ni730K1+fktFBfBZDLWYVQXY7lF7ArYAuMAm/go/kfd
	XWsaqdrlFQxT3Za638epspI1ODlqk4190aDD09feJWp6wc04bijJvSVZRfDnTcjoqvg3MHm6mkdwT
	gTkO5oag==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb3-00000004GPb-27OX;
	Wed, 05 Feb 2025 10:25:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id DAE713064EF; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102449.560323038@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:32 +0100
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
Subject: [PATCH v2 12/24] perf: Simplify perf_init_event()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11942,10 +11942,10 @@ static int perf_try_init_event(struct pm
 static struct pmu *perf_init_event(struct perf_event *event)
 {
 	bool extended_type = false;
-	int idx, type, ret;
 	struct pmu *pmu;
+	int type, ret;
 
-	idx = srcu_read_lock(&pmus_srcu);
+	guard(srcu)(&pmus_srcu);
 
 	/*
 	 * Save original type before calling pmu->event_init() since certain
@@ -11958,7 +11958,7 @@ static struct pmu *perf_init_event(struc
 		pmu = event->parent->pmu;
 		ret = perf_try_init_event(pmu, event);
 		if (!ret)
-			goto unlock;
+			return pmu;
 	}
 
 	/*
@@ -11977,13 +11977,12 @@ static struct pmu *perf_init_event(struc
 	}
 
 again:
-	rcu_read_lock();
-	pmu = idr_find(&pmu_idr, type);
-	rcu_read_unlock();
+	scoped_guard (rcu)
+		pmu = idr_find(&pmu_idr, type);
 	if (pmu) {
 		if (event->attr.type != type && type != PERF_TYPE_RAW &&
 		    !(pmu->capabilities & PERF_PMU_CAP_EXTENDED_HW_TYPE))
-			goto fail;
+			return ERR_PTR(-ENOENT);
 
 		ret = perf_try_init_event(pmu, event);
 		if (ret == -ENOENT && event->attr.type != type && !extended_type) {
@@ -11992,27 +11991,21 @@ static struct pmu *perf_init_event(struc
 		}
 
 		if (ret)
-			pmu = ERR_PTR(ret);
+			return ERR_PTR(ret);
 
-		goto unlock;
+		return pmu;
 	}
 
 	list_for_each_entry_rcu(pmu, &pmus, entry, lockdep_is_held(&pmus_srcu)) {
 		ret = perf_try_init_event(pmu, event);
 		if (!ret)
-			goto unlock;
+			return pmu;
 
-		if (ret != -ENOENT) {
-			pmu = ERR_PTR(ret);
-			goto unlock;
-		}
+		if (ret != -ENOENT)
+			return ERR_PTR(ret);
 	}
-fail:
-	pmu = ERR_PTR(-ENOENT);
-unlock:
-	srcu_read_unlock(&pmus_srcu, idx);
 
-	return pmu;
+	return ERR_PTR(-ENOENT);
 }
 
 static void attach_sb_event(struct perf_event *event)


