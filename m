Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877AB1581EE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743958688; cv=none; b=tVsfF9u4MkZV/gQezr6+ZI8o5vymGFyj32dCpFoO/W0zldvm5DJ2sW1DXMZ5O8PDlSpdtXd9ZJjUm/Qpb4Yf//+/YirWHlAtbmYtLnSutpSZ9tzoN1jszEUGEinNn3xOz6M6/Aif1Op2vgTk2ZGZ9QkTkZ9OwKyxxRBlmtwi8P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743958688; c=relaxed/simple;
	bh=pY/Mn0zkQe44xZrMDHGZ5uzrUSaj7bzCfhNtwdHUHfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0U4Lm4UG//4dVS7elqJRh1L5dugagD2gnL/APK3/p+ml/7TCbcfmXxrMa1LpBhOmqSxIbDF0++XC/UZ7PnVjt8DbetVwfeB6pZm3beMQ2z2UA628V9s1wCF6OSP0jn34k4SGsZBqjUcH/zAp1C+pUEbXvniwrkK8H7VLYkf8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdyPsQ5E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdyPsQ5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8521FC4CEE3;
	Sun,  6 Apr 2025 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743958687;
	bh=pY/Mn0zkQe44xZrMDHGZ5uzrUSaj7bzCfhNtwdHUHfA=;
	h=Date:From:To:Cc:Subject:From;
	b=BdyPsQ5EA92a1hHMG4UriXDWlzAdPvtWaArUw5FZA5G6IScZdgaXrOtBpQa64c2Pt
	 UYqe9Rp5c/J4pQsdj43QBlPym7lICiYsULzystCf1AnT4+lnaXRz6E78mj+CtASq/R
	 paBP9MWZ6RB1/j0ErAOO226Yam3xLTShXa3h8FzJkGEr51A7WuJ6NfkLwxeo5Znv17
	 Ga2BApD+gXOUJsnWENuUPMtSfguMOhRZfg2bVMuxcBtJkMjLrB8DmMdLapFw4fmBxk
	 xZf5Q304tJ5UkC3VvpKZAH4QqMshEwTSRCJj4FH+aM1pWC55ACI/x5xY/Jt5tn08dR
	 rc1pdxdPUt/nA==
Date: Sun, 6 Apr 2025 18:58:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [GIT PULL] perf events fix
Message-ID: <Z_Kyms8NphwAtcCg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-06

   # HEAD: a3c3c66670cee11eb13aa43905904bf29cb92d32 perf/core: Fix child_total_time_enabled accounting bug at task exit

Fix a perf events time accounting bug.

 Thanks,

	Ingo

------------------>
Yeoreum Yun (1):
      perf/core: Fix child_total_time_enabled accounting bug at task exit


 kernel/events/core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 0bb21659e252..128db74e9eab 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2451,6 +2451,7 @@ ctx_time_update_event(struct perf_event_context *ctx, struct perf_event *event)
 #define DETACH_GROUP	0x01UL
 #define DETACH_CHILD	0x02UL
 #define DETACH_DEAD	0x04UL
+#define DETACH_EXIT	0x08UL
 
 /*
  * Cross CPU call to remove a performance event
@@ -2465,6 +2466,7 @@ __perf_remove_from_context(struct perf_event *event,
 			   void *info)
 {
 	struct perf_event_pmu_context *pmu_ctx = event->pmu_ctx;
+	enum perf_event_state state = PERF_EVENT_STATE_OFF;
 	unsigned long flags = (unsigned long)info;
 
 	ctx_time_update(cpuctx, ctx);
@@ -2473,16 +2475,19 @@ __perf_remove_from_context(struct perf_event *event,
 	 * Ensure event_sched_out() switches to OFF, at the very least
 	 * this avoids raising perf_pending_task() at this time.
 	 */
-	if (flags & DETACH_DEAD)
+	if (flags & DETACH_EXIT)
+		state = PERF_EVENT_STATE_EXIT;
+	if (flags & DETACH_DEAD) {
 		event->pending_disable = 1;
+		state = PERF_EVENT_STATE_DEAD;
+	}
 	event_sched_out(event, ctx);
+	perf_event_set_state(event, min(event->state, state));
 	if (flags & DETACH_GROUP)
 		perf_group_detach(event);
 	if (flags & DETACH_CHILD)
 		perf_child_detach(event);
 	list_del_event(event, ctx);
-	if (flags & DETACH_DEAD)
-		event->state = PERF_EVENT_STATE_DEAD;
 
 	if (!pmu_ctx->nr_events) {
 		pmu_ctx->rotate_necessary = 0;
@@ -13731,12 +13736,7 @@ perf_event_exit_event(struct perf_event *event, struct perf_event_context *ctx)
 		mutex_lock(&parent_event->child_mutex);
 	}
 
-	perf_remove_from_context(event, detach_flags);
-
-	raw_spin_lock_irq(&ctx->lock);
-	if (event->state > PERF_EVENT_STATE_EXIT)
-		perf_event_set_state(event, PERF_EVENT_STATE_EXIT);
-	raw_spin_unlock_irq(&ctx->lock);
+	perf_remove_from_context(event, detach_flags | DETACH_EXIT);
 
 	/*
 	 * Child events can be freed.
