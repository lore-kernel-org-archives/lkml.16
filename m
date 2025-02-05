Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB5E22ACDF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751136; cv=none; b=ia+KVBd6iQX5lYIydoxnEWgJnrCYlOEjj3EKREUUGTTjqfBLxGjmmL0oJBwaopBfstigroF3fqjUpKPTZJonh72nezy70hXJkg2k310oc6iraI9C885+ugYMzR+mxUGzZbcZHrdAiYn3dOsh3hBSo5WHjQ3d1O9r9SZsP2skWrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751136; c=relaxed/simple;
	bh=iU1mfq4vL+87Qe1N+xJ3oAYSLpoDgo2jjmOnpa8z3AY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Q5/IyD00EE/tarordfn2r5LvY8Xlq1L5I900lVJ2ZqDDWk+qhIUcC0HVK7D6PjOL67jfHv7dNU9ujKnmvJ7lqvMWC3zyHkGMzsC32ZzrAWm7BemPIHJAwUdqHz0DFixJ4IJTjYoDdnQH2GrW5J8zZ8wZ+33q2cqajce9VFaxmBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V6hg/fMP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V6hg/fMP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Jt1bq5imd9I+0bQfTxJMRZoYW9GAQBZvZ0BHkv1KS+o=; b=V6hg/fMPGZl8AToiVn8RDyOEHv
	1XojFLZynbTq5BLYoy99bqJZb0xZYeDtpSFgah/A+s4psx8Cu08YUuZJ5VbJ31iBs/bYJnwEaTiCT
	emfVEpODspmNyNH3Ao798Yj+YIKAx0t6YhZxKkRRgtdGwTzE6By5HEx9JZQK2GAVjEVju917pUW8G
	TuoMMdnxDUg8ATAZ6gpVdYap8R+05NQsg16hX/CvKCUmnmJHr8X40kEXbMI0hbJ7Lj1/Iqbd6X1FG
	KkgGr3DoyESajRaF/l65omcAgxTiBuvdKV18HnVcFDyBGlvpMLZrrUpsLA5CI8DIrGDsNKBOE6h7x
	Yrq+Xzww==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb4-00000004GQ7-24ak;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id F08D9308136; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102450.240970193@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:38 +0100
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
Subject: [PATCH v2 18/24] perf: Robustify perf_event_free_bpf_prog()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Ensure perf_event_free_bpf_prog() is safe to call a second time;
notably without making any references to event->pmu when there is no
prog left.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10782,6 +10781,9 @@ int perf_event_set_bpf_prog(struct perf_
 
 void perf_event_free_bpf_prog(struct perf_event *event)
 {
+	if (!event->prog)
+		return;
+
 	if (!perf_event_is_tracing(event)) {
 		perf_event_free_bpf_handler(event);
 		return;


