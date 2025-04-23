Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B7242D65
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451957; cv=none; b=DQV+516FXyHsVNayrF8H1qs/mQWbERFLDMC6Mbt3nsTQkb2BY7ASHZVZi8NQQCOIgzLlMWZqhTVO7w6y0U0i/2AIO1ERZAqPsRoksIFCwhnb2QPg0ObuDBkGZmI9XzXGKcOmUD/TEaT4WHjFPWZCkjwq+1qZxBZZTND6nGTpsaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451957; c=relaxed/simple;
	bh=RUJH4wBuhorR3PqNtNAebpSZFrbXDsdThpRqpoASPVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoHV5Cq8BKWdoDh2jw8PeNoc2pwbrtHeFIX5QBt07XLc29qOqTmHn9Fpl0jvKbehOW5lrxsyvHuSHSZObDKQ/BsPAetYOCDdWXaF3aYoI4npvxTyO7vfyg/atrWbqmPZoFLRMWIdJD3GgzEht++c5+4fRgcQZB8hZeF5ojlDRm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYh5czlV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYh5czlV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6232EC4CEE2;
	Wed, 23 Apr 2025 23:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451957;
	bh=RUJH4wBuhorR3PqNtNAebpSZFrbXDsdThpRqpoASPVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pYh5czlVtVn15E1qkvspE9Ra15qepR3UMvn8HCT8ziIna0la8MdvUG8oobkR9RJxQ
	 2RT8Kh3ZGiy3b8y/MFpJaM9iW5xogaNCtZQcWXaYGlLp6+wjtp0Y0Oti4KKfx47OZU
	 k+nGzC6AUt42cKThEXBdI/742o8Bcg7Djc8WnZjmumcJdCld8dXgodLrZMXhmbVBBV
	 ASzyiPonIMePRoDtp5qEyXcu4XRvYUEVj77GNPy1hzyaBLUuQHeGtl2J3CCz5amSSI
	 gPvfyAie4RdRldo222HZi3aNiUtyBjiCwHGfk+YgOceEbv6cDJiZXTrYaCUy3CbgSE
	 HtykGyxNs+Gxw==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>
Subject: [PATCH 09/12] sched_ext: Factor out scx_read_events()
Date: Wed, 23 Apr 2025 13:44:47 -1000
Message-ID: <20250423234542.1890867-10-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423234542.1890867-1-tj@kernel.org>
References: <20250423234542.1890867-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In prepration of moving event_stats_cpu into scx_sched, factor out
scx_read_events() out of scx_bpf_events() and update the in-kernel users -
scx_attr_events_show() and scx_dump_state() - to use scx_read_events()
instead of scx_bpf_events(). No observable behavior changes.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 244ccf134cee..4d2866db8cbe 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1648,7 +1648,7 @@ static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
 } while (0)
 
 
-static void scx_bpf_events(struct scx_event_stats *events, size_t events__sz);
+static void scx_read_events(struct scx_event_stats *events);
 
 static enum scx_enable_state scx_enable_state(void)
 {
@@ -4455,7 +4455,7 @@ static ssize_t scx_attr_events_show(struct kobject *kobj,
 	struct scx_event_stats events;
 	int at = 0;
 
-	scx_bpf_events(&events, sizeof(events));
+	scx_read_events(&events);
 	at += scx_attr_event_show(buf, at, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_KEEP_LAST);
@@ -5179,7 +5179,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	dump_line(&s, "Event counters");
 	dump_line(&s, "--------------");
 
-	scx_bpf_events(&events, sizeof(events));
+	scx_read_events(&events);
 	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
@@ -7401,6 +7401,27 @@ __bpf_kfunc u64 scx_bpf_now(void)
 	return clock;
 }
 
+static void scx_read_events(struct scx_event_stats *events)
+{
+	struct scx_event_stats *e_cpu;
+	int cpu;
+
+	/* Aggregate per-CPU event counters into @events. */
+	memset(events, 0, sizeof(*events));
+	for_each_possible_cpu(cpu) {
+		e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
+		scx_agg_event(events, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
+		scx_agg_event(events, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
+		scx_agg_event(events, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
+		scx_agg_event(events, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
+		scx_agg_event(events, e_cpu, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED);
+		scx_agg_event(events, e_cpu, SCX_EV_REFILL_SLICE_DFL);
+		scx_agg_event(events, e_cpu, SCX_EV_BYPASS_DURATION);
+		scx_agg_event(events, e_cpu, SCX_EV_BYPASS_DISPATCH);
+		scx_agg_event(events, e_cpu, SCX_EV_BYPASS_ACTIVATE);
+	}
+}
+
 /*
  * scx_bpf_events - Get a system-wide event counter to
  * @events: output buffer from a BPF program
@@ -7409,23 +7430,9 @@ __bpf_kfunc u64 scx_bpf_now(void)
 __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 				size_t events__sz)
 {
-	struct scx_event_stats e_sys, *e_cpu;
-	int cpu;
+	struct scx_event_stats e_sys;
 
-	/* Aggregate per-CPU event counters into the system-wide counters. */
-	memset(&e_sys, 0, sizeof(e_sys));
-	for_each_possible_cpu(cpu) {
-		e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
-		scx_agg_event(&e_sys, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
-		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
-		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
-		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
-		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED);
-		scx_agg_event(&e_sys, e_cpu, SCX_EV_REFILL_SLICE_DFL);
-		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DURATION);
-		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DISPATCH);
-		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
-	}
+	scx_read_events(&e_sys);
 
 	/*
 	 * We cannot entirely trust a BPF-provided size since a BPF program
-- 
2.49.0

