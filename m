Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1DD22ACF1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751136; cv=none; b=izB7hiWcPqj62MZ0w1PikM8rh9K4Vr7cG7+2tfGpD1Mfuq+WzFuEVmyqNYeqrHGba+NtWDGnC0BumrDpYHBBVsq8tManzZxdOXM03f0qAISGzvlgu6PliOA2+QviEbhuu1G5Z7sDsobGVGUS5BU/6W8EoB3lzwOjaOwXGjBaBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751136; c=relaxed/simple;
	bh=axSv5kNHfFatY3qrMWazkxF0Xp0A0k5ornDlIv1p4P8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Ka/L42hJ5XzDn6HxItIcauunrV8tvP82eHdNk4WC9UREs81RXU8YR8xnmoBt278Cd+W0sn3x4m3H0xJLkZLU3tnggth6MPy2QnjQe21ibtfvqnWZqNOuCA88X068VcjA9uET+F+2KzxyavQRm4AnB2T6B0A3+4FYalrdlPJWv9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HlgKGx+G; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HlgKGx+G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Fgq+swJWnqWBfSBKjOMZU1+pyDensX+uKGeMorHPpsI=; b=HlgKGx+Gd7R8YsbqwX/nofzc3O
	9IlAAg6P3+ly/i5nj69BYisE+pufuAduqZ966g/9yo1G2R7jUNL2GvBtrBt5xk4eNg7WiT+AFq1mn
	Z4GETiBzQl+xxZq2UDC9najXbUqdJ0DMF2fiGeHuZA/tkS5zJnEuze24dNWPucdhAPX4kmjzXMJHW
	SVu7tfrTdDq1AREO9jHAfi9MYamo+M0BFh95M7v4cs5PYixuRA28FV9F66+il8i6jv5dnmU+0XZ89
	TFfxnhnkGu8DdTwiGAVioFGL+0ZO3gKwqYKRW8FvHwNZBBOkTRlmaRrxVudT+QsvlHlNVMwg2jRzj
	5W1ZdFJQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb4-00000004GQ6-1wMt;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id ED27A3080B3; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102450.119262657@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:37 +0100
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
Subject: [PATCH v2 17/24] perf: Introduce perf_free_addr_filters()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Replace _free_event()'s use of perf_addr_filters_splice()s use with an
explicit perf_free_addr_filters() with the explicit propery that it is
able to be called a second time without ill effect.

Most notable, referencing event->pmu must be avoided when there are no
filters left (from eg a previous call).

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5307,8 +5307,7 @@ static bool exclusive_event_installable(
 	return true;
 }
 
-static void perf_addr_filters_splice(struct perf_event *event,
-				       struct list_head *head);
+static void perf_free_addr_filters(struct perf_event *event);
 
 static void perf_pending_task_sync(struct perf_event *event)
 {
@@ -5407,7 +5406,7 @@ static void _free_event(struct perf_even
 	}
 
 	perf_event_free_bpf_prog(event);
-	perf_addr_filters_splice(event, NULL);
+	perf_free_addr_filters(event);
 
 	__free_event(event);
 }
@@ -10880,6 +10882,17 @@ static void perf_addr_filters_splice(str
 	free_filters_list(&list);
 }
 
+static void perf_free_addr_filters(struct perf_event *event)
+{
+	/*
+	 * Used during free paths, there is no concurrency.
+	 */
+	if (list_empty(&event->addr_filters.list))
+		return;
+
+	perf_addr_filters_splice(event, NULL);
+}
+
 /*
  * Scan through mm's vmas and see if one of them matches the
  * @filter; if so, adjust filter's address range.


