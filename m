Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AC926D4E3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361200; cv=none; b=CwHkW1+nP2kRDSGSPQfRUx/ccL7x+51IvQngFSuCt/3b+Aa26XDKoB82b5YduWnO3fADjnQzN+rGkk9kFHomxlUPr85qwek/iOlWgoJ7FfIB4uCTd4bvIRNte19VTZaob6pZUrjmCRUotXpaQ/ecZ15MT9eu9DKQKFnpQumhZzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361200; c=relaxed/simple;
	bh=mqlmQbDhzltj00xDTZJT5W9d4TpNe+QdmjfdKDNEefk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rx4ricx+2mMFjbAd8H+MdpgNJU+yjauXjDc1aw8zYNN89eIo6xseIaQSePFIFUNlmTk1VeF2vdBrB5Oxu+Yt7uub5NQMyPZYlwAWAYz8Jjn6CA2oSCD3FYWdMXJB1mIAUZ8xeqT7pZ2tj0GYJY7Gk7s7oLDahDRqIoDzjQbkZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+n88Fm0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+n88Fm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59392C4CEE9;
	Tue, 22 Apr 2025 22:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745361199;
	bh=mqlmQbDhzltj00xDTZJT5W9d4TpNe+QdmjfdKDNEefk=;
	h=From:To:Cc:Subject:Date:From;
	b=t+n88Fm02h27V8V8CU1cdNBTEKEsEcWjHedhmduFYF6S/aLOVve1PDZx4enEfxFWL
	 V3BaH2M/6PV+tiPfWo1rLQA00nITmrwQjy3+FAMn9EnvlQ+67w8HVdw+tM7IRxuIOD
	 Pl2QJw5cDHiLGUWR57VWHFJoowEf3whBWzWxSpSRFBsmGWFdbkRR9SEZkIcDTuPyN0
	 F1k+tP99z7OsxwkQHxePMuR55SRlGOAK3ZEee0Kd5bv4S6AacXVxJE3j1Y0uz/K3A0
	 BR9M53EkQrouaT7C1wF0Ny5zA9wlHxM+eYR7mLVC0A+TVCjSkSZ6fmuNstRSOP9Rs1
	 T+d4Y9tjadQRQ==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Gabriel Marin <gmx@google.com>
Subject: [RFC/PATCH for-perf-urgent] perf/core: Change to POLLERR for pinned events with error
Date: Tue, 22 Apr 2025 15:33:18 -0700
Message-ID: <20250422223318.180343-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit f4b07fd62d4d11d5 ("perf/core: Use POLLHUP for pinned events
in error") started to emit POLLHUP for pinned events in an error state.

But the POLLHUP is also used to signal events that the attached task is
terminated.  To distinguish pinned per-task events in the error state
it would need to check if the task is live.

If we can change it to POLLERR it should be clear.

Suggested-by: Gabriel Marin <gmx@google.com>
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 kernel/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index e93c195659140d30..95e703891b24f8fc 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3943,7 +3943,7 @@ static int merge_sched_in(struct perf_event *event, void *data)
 			perf_event_set_state(event, PERF_EVENT_STATE_ERROR);
 
 			if (*perf_event_fasync(event))
-				event->pending_kill = POLL_HUP;
+				event->pending_kill = POLL_ERR;
 
 			perf_event_wakeup(event);
 		} else {
@@ -6075,7 +6075,7 @@ static __poll_t perf_poll(struct file *file, poll_table *wait)
 
 	if (unlikely(READ_ONCE(event->state) == PERF_EVENT_STATE_ERROR &&
 		     event->attr.pinned))
-		return events;
+		return EPOLLERR;
 
 	/*
 	 * Pin the event->rb by taking event->mmap_mutex; otherwise
-- 
2.49.0.805.g082f7c87e0-goog

