Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B11F4295
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743629377; cv=none; b=iBzJOKrApmUFGERKv94RmFGeWyq4LiHrl8o6+caflX9XrfeLAlT7E562NGWBd48CyBm303PrfQScodKBUjFcRZaiwj05TvZkmLJdlTbi9nayLMEifKfFAcDOllPnt6QvlLSKQTC/qZxryS2vKOagI+fyhVa6xAJF+r6m6JhjqPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743629377; c=relaxed/simple;
	bh=EB2SWIX2MQDVxuPwHJP9YdKIaXyPqmolnJbgJbQw4IA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OmV+bnZp/16sYFmf2Lt4JUwdk4ss8WKovExIaFE9LBFaaSukRVkArm5+TiYuzUWH2cwaqkYIc70o3q/JJGqAWhOdmqW5G4zfSHiw/nLqf902yiojpOb1wh76yJSOJlrnWUVKd4aUObWaqSuUGZci4LPMqjKDJPGXSCXKpzm+9co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZGKQrT0R; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZGKQrT0R"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6fecdb96e52so3913817b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 14:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743629375; x=1744234175; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qE3xbxPdvmDug9clNwdu+4Xt6VEFfLm+kW+AsHbUMvM=;
        b=ZGKQrT0ROKsjBngxzGF2JR1F9j8O5B/bzA7ZDACBHkf6osXgsWlwJvELESVczwzgh0
         8xqGA08Vd0oUvo9a65bKw5mnRqUCdnUQm41Q+bEPT30XSrqGottddrCAuxg4SoloFEPt
         h1kt8MeJOC2Q7Jt9vENN5cM2Cv7PdVfrwCmWwAISqCevUf/IRfD4UYbBXZyI9jKeF6Id
         AtDcWTZwzAsk1slVX25sloz3nUBP1A3vmnwIEjjAoZUITQP3ZDv79DldxVEIgt4TeC2k
         m+b+Vggnt+QKmtVbTX6i+N+lGzt59gKhb0EMcNU9MwdCCo2v/Cc9PbH7j2Dq86kmNHvr
         lr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743629375; x=1744234175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qE3xbxPdvmDug9clNwdu+4Xt6VEFfLm+kW+AsHbUMvM=;
        b=nCNPuHMJCfz2QakZMbtv2+cQ+PvYL3rz2cpNSa0mb3oU69nM1nQYD6hsmJTMyrwmTr
         E85W/RWmQ5Y7KsIHxImjVKgFHjgWbfblWUPfjDSM8O5KcROV9WyS6zEV8OTRGkYo8w0g
         fVH/dvZwnv+VfnKfhlVcou1ym2/bFrEmNTqATYNt3XoWVFzE7GzQc+PyZwjMWW+BwvZu
         dDdVrpj8WSSfT0dur00wy4cgNWAuuS9PJhRnvJo/NwtxNYvvwSncEKQpvPpHVGe5tY5b
         Vf6rUdIdD8c1Xc41BM89vnXGB8drnBPK5p8BCDZwmQxxQtMppXwq+CCfDdxUs+R6H8Rf
         anvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxdKAuuurR3L9172LklH9K60QjwB6LAvbOLzso0IumtON86kCtSeNZoyW69jmdmka3xJ6k1vRBxQtFbQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKwJPEc8k6OmlRm10fzL21+COtuUPYcldDg55W6J/NqNfDKKl+
	kXwlnlhGkIDrSBldAlJu/D6Qr5mZfruowZPgDaEP+h2yHRdDnk4etz2ylAMq195aedPw/zCndTu
	E02U1FA==
X-Google-Smtp-Source: AGHT+IFVrtjcBvAqhHkqRDeAfUX4780AiqQ4c5vCIEbaJtnVTXAjV/lbfMRrp0h3QjJAtD+CLP4MyM3GKcPs
X-Received: from ybbgd10.prod.google.com ([2002:a05:6902:408a:b0:e61:1c55:6314])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6902:1b86:b0:e6d:fb0f:fca4
 with SMTP id 3f1490d57ef6-e6e0a100a05mr420085276.5.1743629374925; Wed, 02 Apr
 2025 14:29:34 -0700 (PDT)
Date: Wed,  2 Apr 2025 21:29:01 +0000
In-Reply-To: <20250402212904.8866-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402212904.8866-1-zecheng@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402212904.8866-2-zecheng@google.com>
Subject: [RFC PATCH 1/2] sched/fair: Reorder struct cfs_rq
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

Hot fields are moved to the first two cache lines. The first cache line
is considered to be the hottest, and the second one is slightly cooler.
With all related CONFIG enabled, it also moves fields originally located
around the 4th and 5th cache line offsets to provide better locality
when executing CFS bandwidth control functions. Due to the removal of
holes in the struct, its size is observed to reduce by one cacheline in
an x86 system.

The following changes are proposed:

- Move `curr`, `rq`, `tg`, `throttle_count`, and `runtime_enabled` to
the first cache line as they are frequently accessed (and mostly read).
They are pointers to the closely related structs (`rq`, `tg`) or checked
as a condition (`curr`, `throttle_count` and `runtime_enabled`).

- `propagate` and `idle`, two frequently read fields, were placed in
separate cache lines. Group them in cache line 2 with the remaining
fields previously in cache line 1 to fill the hole.

- `on_list` is often accessed together with `throttle_clock_*` in
`tg_unthrottle_up` and `tg_throttle_down` functions. Move
`runtime_remaining` and `throttled_pelt_idle`, which are less frequently
accessed, to the previous cache line to allow grouping `on_list` and
throttle-related fields together.

- Use `__cacheline_group_*` macros to delineate logically grouped fields
for cache alignment, with compile-time checks added in
`cfs_rq_struct_check`.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/core.c  | 61 +++++++++++++++++++++++++++++++++++++-
 kernel/sched/sched.h | 70 ++++++++++++++++++++++++++++----------------
 2 files changed, 104 insertions(+), 27 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 042351c7afce..84ee289d98d7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8473,6 +8473,8 @@ LIST_HEAD(task_groups);
 static struct kmem_cache *task_group_cache __ro_after_init;
 #endif
 
+static void __init cfs_rq_struct_check(void);
+
 void __init sched_init(void)
 {
 	unsigned long ptr = 0;
@@ -8489,7 +8491,7 @@ void __init sched_init(void)
 	BUG_ON(!sched_class_above(&fair_sched_class, &ext_sched_class));
 	BUG_ON(!sched_class_above(&ext_sched_class, &idle_sched_class));
 #endif
-
+	cfs_rq_struct_check();
 	wait_bit_init();
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
@@ -10696,3 +10698,60 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx)
 		set_next_task(rq, ctx->p);
 }
 #endif	/* CONFIG_SCHED_CLASS_EXT */
+
+static void __init cfs_rq_struct_check(void)
+{
+	/*
+	 * The first two cache lines are hot and mostly read
+	 * except load.inv_weight
+	 */
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, load);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, nr_queued);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, h_nr_queued);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, h_nr_runnable);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, h_nr_idle);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, curr);
+
+#ifdef CONFIG_FAIR_GROUP_SCHED
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, rq);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, tg);
+
+#ifdef CONFIG_CFS_BANDWIDTH
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, throttle_count);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, runtime_enabled);
+#endif
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, idle);
+
+#ifdef CONFIG_SMP
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, propagate);
+#endif
+#endif
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, avg_vruntime);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, avg_load);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, min_vruntime);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, tasks_timeline);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, hot, next);
+
+	/*
+	 * This cache line groups hot fields of the throttling functions.
+	 * This group is enabled when CFS_BANDWIDTH is configured.
+	 */
+#ifdef CONFIG_CFS_BANDWIDTH
+#ifdef CONFIG_FAIR_GROUP_SCHED
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, throttle, throttled);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, throttle, on_list);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, throttle,
+				      leaf_cfs_rq_list);
+
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, throttle, throttled_clock);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, throttle,
+				      throttled_clock_pelt);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, throttle,
+				      throttled_clock_pelt_time);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, throttle,
+				      throttled_clock_self);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct cfs_rq, throttle,
+				      throttled_clock_self_time);
+#endif
+#endif
+}
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 023b844159c9..3230b09a4959 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -649,29 +649,44 @@ struct balance_callback {
 
 /* CFS-related fields in a runqueue */
 struct cfs_rq {
+	/* The first two cache lines are hot and mostly read */
+	__cacheline_group_begin_aligned(hot);
 	struct load_weight	load;
 	unsigned int		nr_queued;
 	unsigned int		h_nr_queued;       /* SCHED_{NORMAL,BATCH,IDLE} */
 	unsigned int		h_nr_runnable;     /* SCHED_{NORMAL,BATCH,IDLE} */
 	unsigned int		h_nr_idle; /* SCHED_IDLE */
+	/*
+	 * 'curr' points to currently running entity on this cfs_rq.
+	 * It is set to NULL otherwise (i.e when none are currently running).
+	 */
+	struct sched_entity	*curr;
+
+#ifdef CONFIG_FAIR_GROUP_SCHED
+	struct rq		*rq;	/* CPU runqueue to which this cfs_rq is attached */
+	struct task_group	*tg;	/* group that "owns" this runqueue */
+
+#ifdef CONFIG_CFS_BANDWIDTH
+	int			throttle_count;
+	int			runtime_enabled;
+#endif
+	/* Locally cached copy of our task_group's idle value */
+	int			idle;
+
+#ifdef CONFIG_SMP
+	long			propagate;
+#endif /* CONFIG_SMP */
+#endif /* CONFIG_FAIR_GROUP_SCHED */
 
 	s64			avg_vruntime;
 	u64			avg_load;
 
 	u64			min_vruntime;
-#ifdef CONFIG_SCHED_CORE
-	unsigned int		forceidle_seq;
-	u64			min_vruntime_fi;
-#endif
 
 	struct rb_root_cached	tasks_timeline;
 
-	/*
-	 * 'curr' points to currently running entity on this cfs_rq.
-	 * It is set to NULL otherwise (i.e when none are currently running).
-	 */
-	struct sched_entity	*curr;
 	struct sched_entity	*next;
+	__cacheline_group_end_aligned(hot);
 
 #ifdef CONFIG_SMP
 	/*
@@ -692,7 +707,6 @@ struct cfs_rq {
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	u64			last_update_tg_load_avg;
 	unsigned long		tg_load_avg_contrib;
-	long			propagate;
 	long			prop_runnable_sum;
 
 	/*
@@ -708,8 +722,19 @@ struct cfs_rq {
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
-	struct rq		*rq;	/* CPU runqueue to which this cfs_rq is attached */
-
+#ifdef CONFIG_CFS_BANDWIDTH
+	s64			runtime_remaining;
+	u64			throttled_pelt_idle;
+#ifndef CONFIG_64BIT
+	u64                     throttled_pelt_idle_copy;
+#endif
+	/*
+	 * This cache line groups hot fields of the throttling functions.
+	 * This group is enabled when CFS_BANDWIDTH is configured.
+	 */
+	__cacheline_group_begin_aligned(throttle);
+	int			throttled;
+#endif /* CONFIG_CFS_BANDWIDTH */
 	/*
 	 * leaf cfs_rqs are those that hold tasks (lowest schedulable entity in
 	 * a hierarchy). Non-leaf lrqs hold other higher schedulable entities
@@ -720,30 +745,23 @@ struct cfs_rq {
 	 */
 	int			on_list;
 	struct list_head	leaf_cfs_rq_list;
-	struct task_group	*tg;	/* group that "owns" this runqueue */
-
-	/* Locally cached copy of our task_group's idle value */
-	int			idle;
-
 #ifdef CONFIG_CFS_BANDWIDTH
-	int			runtime_enabled;
-	s64			runtime_remaining;
-
-	u64			throttled_pelt_idle;
-#ifndef CONFIG_64BIT
-	u64                     throttled_pelt_idle_copy;
-#endif
 	u64			throttled_clock;
 	u64			throttled_clock_pelt;
 	u64			throttled_clock_pelt_time;
 	u64			throttled_clock_self;
 	u64			throttled_clock_self_time;
-	int			throttled;
-	int			throttle_count;
+	__cacheline_group_end_aligned(throttle);
+
 	struct list_head	throttled_list;
 	struct list_head	throttled_csd_list;
 #endif /* CONFIG_CFS_BANDWIDTH */
 #endif /* CONFIG_FAIR_GROUP_SCHED */
+
+#ifdef CONFIG_SCHED_CORE
+	unsigned int		forceidle_seq;
+	u64			min_vruntime_fi;
+#endif
 };
 
 #ifdef CONFIG_SCHED_CLASS_EXT
-- 
2.49.0

