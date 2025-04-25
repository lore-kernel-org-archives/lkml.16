Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFE2500DE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618336; cv=none; b=X/TlKOsoycq+hsubamBUpclKhsQh2g7cBnYxu6OZDt4e9baAtuEBZ82rRIrE3Ac2PKyWTylfVPsqnszKoeohYCkGyl8eQHKrqwoKwCIxnaMIb+N4BLLr/79LyP1N6+ZGVQ2WfdKsEC25nDy5NG9MoiONMaldHRWFeNX3tFwHJt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618336; c=relaxed/simple;
	bh=OvgaAABc1XI1UlFQpJ5Z2nQgzyjH27O4HiBs77LOdBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BI5hbqGF1QRvsemmiZqXNbX81OuFTaOR1DIDxOIdxmZ6Bbu8XG/TKIBIg+3f9j3Pq6SsAN7fpozrbLv5TZyiO6aWkS4ld1i1tXF89a1czEnpI8ZnHAIaYcACp+vjmz7zWJdm4rdk1OZhWzH1ytZEtWBloZBEjc/Q76CQzMqdNcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhgr6lZl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhgr6lZl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7DDC4CEED;
	Fri, 25 Apr 2025 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618334;
	bh=OvgaAABc1XI1UlFQpJ5Z2nQgzyjH27O4HiBs77LOdBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhgr6lZl8pzI3mRuEHocW6dAPVnjdYm9bPwHExBJbZcUe4EMMnnxasLm8A3/zuCS1
	 Lqgb1u5Ry3B84qdC7zTLKZyY9dN6j5kvSolQp9zDBw/GnKgt5oT7DjehXlBPHx1wQ2
	 KDPkGOxGiqltr885vZBlWGlcOe7ljgWnVTFY4F9MXmQMuLX5Tq+G8/nO/Z4xsBy7Jz
	 MdYKO79sT7pLqH/k1BbTCxPXjQ31CZLaPeUJecw3cpPuQ6U1+W6YmX47x15FVilnAO
	 4THGxLy/19nXF0hDqWzti6e1LNbe2bQRw4Lv7bEUBVAx0y9i2F8+Z1PI1+usvUq6WM
	 kQi2QYcAe0NeA==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 09/12] sched_ext: Factor out scx_read_events()
Date: Fri, 25 Apr 2025 11:58:24 -1000
Message-ID: <20250425215840.2334972-10-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425215840.2334972-1-tj@kernel.org>
References: <20250425215840.2334972-1-tj@kernel.org>
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
index bbcd7c0f561e..885cd71a847e 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1651,7 +1651,7 @@ static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
 } while (0)
 
 
-static void scx_bpf_events(struct scx_event_stats *events, size_t events__sz);
+static void scx_read_events(struct scx_event_stats *events);
 
 static enum scx_enable_state scx_enable_state(void)
 {
@@ -4458,7 +4458,7 @@ static ssize_t scx_attr_events_show(struct kobject *kobj,
 	struct scx_event_stats events;
 	int at = 0;
 
-	scx_bpf_events(&events, sizeof(events));
+	scx_read_events(&events);
 	at += scx_attr_event_show(buf, at, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_KEEP_LAST);
@@ -5182,7 +5182,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	dump_line(&s, "Event counters");
 	dump_line(&s, "--------------");
 
-	scx_bpf_events(&events, sizeof(events));
+	scx_read_events(&events);
 	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
@@ -7405,6 +7405,27 @@ __bpf_kfunc u64 scx_bpf_now(void)
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
@@ -7413,23 +7434,9 @@ __bpf_kfunc u64 scx_bpf_now(void)
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

