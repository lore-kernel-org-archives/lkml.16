Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82A72631
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 04:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748926267; cv=none; b=ISfehBY6c7giJy+lDAAGaND+GHaddpSM3Hv14wHM7gPCo+B+Thysx3WL7Kdz2NQ2g9x6/f9CCpHs5V7P5IZSUUzq2j9CuY6uYSIOlUfwavvtzolft1SwMSqyaTtH+ZgUKDRYEjj5fJ7hNZGOWMcIjrAbDxMRyIr1PRu+wHgSsKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748926267; c=relaxed/simple;
	bh=80HoaEL9VeNRhfhE8ESZWz7454MMkQ2KRw4aX1gbtOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNTMf93LOYr3iiL+jjgsTVBkpc4J9mvgV0E5GJOknkBsMpvnnjTYvNbHWMOoWadAjRD0y0tKrXh7rnQlo9o66IMCgr2Ps1VgTGMPNOySxQvtOj9opgyLE+R0CsPVaQm2VYR3fLiw6meiaqCZSHbN5T5zCm6VKRNtWtgE+TthLD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fC+ZdEaT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fC+ZdEaT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A892FC4CEED;
	Tue,  3 Jun 2025 04:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748926267;
	bh=80HoaEL9VeNRhfhE8ESZWz7454MMkQ2KRw4aX1gbtOw=;
	h=From:To:Cc:Subject:Date:From;
	b=fC+ZdEaTvuhWkZ/8Ie27bdXRlA0m/DjGc/N4lttMMt+kk3eejlDR41TgEtqih+aq+
	 4rw6tcnyZnubSxZb5XQdcs1QxhKk10akOHc7Ec0hq727pDZESfFQUkK3s+we2Nm+6T
	 FpdrFPemNlF0GxAkm9O004B9+T9WimKdg1hJ8bBj6MkS8fHlUOf0QhsrdS/4RRWHK0
	 HN6w6MLrgNl2Suz793DPRcd6nA8iZr1mXtkWLPUlFYUJly5Qw1csLPTmJvQXoaS6GK
	 Y6P9U7Udn9DyZFXOuqr+/z5NlnfaRLk8ck30bFkl+CbT7+OAwrwCInKUOM9sUYLBo1
	 RqkhU0bQcinMw==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Lai, Yi" <yi1.lai@linux.intel.com>
Subject: [PATCH] perf/core: Fix invalid wait context in ctx_sched_in()
Date: Mon,  2 Jun 2025 21:51:05 -0700
Message-ID: <20250603045105.1731451-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep found a bug in the event scheduling when a pinned event was
failed and wakes up the threads in the ring buffer like below.

It seems it should not grab a wait-queue lock under perf-context lock.
Let's do it with irq_work.

  [   39.913691] =============================
  [   39.914157] [ BUG: Invalid wait context ]
  [   39.914623] 6.15.0-next-20250530-next-2025053 #1 Not tainted
  [   39.915271] -----------------------------
  [   39.915731] repro/837 is trying to lock:
  [   39.916191] ffff88801acfabd8 (&event->waitq){....}-{3:3}, at: __wake_up+0x26/0x60
  [   39.917182] other info that might help us debug this:
  [   39.917761] context-{5:5}
  [   39.918079] 4 locks held by repro/837:
  [   39.918530]  #0: ffffffff8725cd00 (rcu_read_lock){....}-{1:3}, at: __perf_event_task_sched_in+0xd1/0xbc0
  [   39.919612]  #1: ffff88806ca3c6f8 (&cpuctx_lock){....}-{2:2}, at: __perf_event_task_sched_in+0x1a7/0xbc0
  [   39.920748]  #2: ffff88800d91fc18 (&ctx->lock){....}-{2:2}, at: __perf_event_task_sched_in+0x1f9/0xbc0
  [   39.921819]  #3: ffffffff8725cd00 (rcu_read_lock){....}-{1:3}, at: perf_event_wakeup+0x6c/0x470

Fixes: f4b07fd62d4d ("perf/core: Use POLLHUP for a pinned event in error")
Reported-by: "Lai, Yi" <yi1.lai@linux.intel.com>
Tested-by: "Lai, Yi" <yi1.lai@linux.intel.com>
Closes: https://lore.kernel.org/lkml/aD2w50VDvGIH95Pf@ly-workstation
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 kernel/events/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index f34c99f8ce8f446a..e22eb88eb105b95b 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3995,7 +3995,8 @@ static int merge_sched_in(struct perf_event *event, void *data)
 			if (*perf_event_fasync(event))
 				event->pending_kill = POLL_ERR;
 
-			perf_event_wakeup(event);
+			event->pending_wakeup = 1;
+			irq_work_queue(&event->pending_irq);
 		} else {
 			struct perf_cpu_pmu_context *cpc = this_cpc(event->pmu_ctx->pmu);
 
-- 
2.49.0.1204.g71687c7c1d-goog

