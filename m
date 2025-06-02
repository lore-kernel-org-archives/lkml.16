Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEDA227EA4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887568; cv=none; b=t3Ti9anKJ//tBCH5EVV7/3a3yVNNI7MLueK9OZJEKaEECiqqXR5qbzW4fsC9E+NvuwenKBIx1/MqKOULCU8JfyE+RakSI9ihcXLrI5TE8Hu/kC5nXeJ0nDGVe3x4q+C9Zvhc+qi3y92zWjS67oKoufwUpHj6x1WbrB3wgAX2eiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887568; c=relaxed/simple;
	bh=AZlIea1dW+5RMVO3LVVnVTm5W3mhmp186O8a1JZi1ls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a7Bito5w/70WEeHootlZajlDqtAgdVB+MEEHtJn/1uSMckSBogozHrbNAc4jMz5YQ1L0c35ndCDRAsjyNbNIJhrT9FlcT3bdgAlLftSENTpcVDXXZouRTuBY8Hiqk9KZSCGI725spOVwdT8yby3I0kkCwTxA4MXIGCvqn0U29TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i8MRKrdY; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i8MRKrdY"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-70e72e81fafso69077647b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748887565; x=1749492365; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xzk0cvJ8UNCzaHHSJWSHz1NKFknBW+0VIm4yoAVCWg0=;
        b=i8MRKrdYup+1YE7J/6108np8ZlYfKFTs5R/r2angv9R5IChv4dJ8pBvDQlPMlCxXy/
         Z8HfX1wV/JQMDki6rgqpqAuzFD5sJryN/YVYWlAnSWUWdjirepgqOSVipakwCJb3J4Bq
         h2uR2vodEvK6NmoP0jZYgXCmDw7QjjGombnpeIfngOykAs6N3emzQ+NO/KNP02/4lnO4
         3aWOLEkyYp85R7vMcoFjl+3kpmLo8dcgbrjgGUMbiHcd2hY+8sZK/69fpHoxN+7DpRKm
         xDXjEK4B22L4htfRYxWUHdFbffBBav0sLCkQ9NBXw+ZXuj8yxtngtf672lWjoCV2zx7z
         U4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748887565; x=1749492365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzk0cvJ8UNCzaHHSJWSHz1NKFknBW+0VIm4yoAVCWg0=;
        b=HQX4SQAdJ/0KOO8nM7ZkDRCBYjIu9DBrwVBKaepRzv4aeznrznv6XruEEcOm+9V0ZQ
         1h3v691/CGP02SnOyxjmWa6jYsJEVYblYgsUo48YHJpEvgjN4FOydXmxkPhenOLU7IYa
         7VsCE5JoJP5OCYsvZYrkOI/UwzgJHaeux7Z3wIyKXLE+ww6ksS/zx3gc1q7i66QqvJJ3
         OwOjB0812kkgplr5TS1V4e0+7vQInELI5RQ55RwmZpbjSFTkiEvsrJET/vnnrEVQAffL
         TQbvXm9E2rDA8Q5E3UzczRgrohSH1wqDfTw0k1AA0C3g6apuCfWIl1Ef3vBRtU0vWNid
         VOyg==
X-Forwarded-Encrypted: i=1; AJvYcCX5HciBdwFVPX51BbE8XRvn17TUJMg5E9oTmgsb50m2kRwU/vloorHGkXUBZ/3L6CHSlsBVZw/inYkfE54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3drMfkm/kJRh4MVdDyZKaxSgz3ibjtwr1+vscVMBZOLCjzmb6
	BcygOClgNZE9AYeUdJ4TOdxFPlXnZOre87ugGLsNuHiF18f5aLwP9KyNiaRh3rVEILED6qrbUsF
	lnjJ2nzk7tA==
X-Google-Smtp-Source: AGHT+IErnilqh/FPKXIL6KvVOGQizN6Yu+6DNdKW52Es9cu8i7octE1JM91IVsRnO3YHnziLnwa2+8oO4rPI
X-Received: from ybbdr8.prod.google.com ([2002:a05:6902:2408:b0:e7d:9da3:a6d4])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6902:1141:b0:e81:5197:4cda
 with SMTP id 3f1490d57ef6-e8151974f47mr3822023276.0.1748887564754; Mon, 02
 Jun 2025 11:06:04 -0700 (PDT)
Date: Mon,  2 Jun 2025 18:05:42 +0000
In-Reply-To: <20250602180544.3626909-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602180544.3626909-1-zecheng@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602180544.3626909-3-zecheng@google.com>
Subject: [RFC PATCH v2 2/3] sched/fair: Reorder struct cfs_rq
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, 
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

Hot fields are moved to the head of the struct, for a total of 128
bytes, which accounts for two cache lines in x86. With all related
CONFIG enabled, it also moves fields originally located around the 4th
and 5th cache line offsets to provide better locality when executing CFS
bandwidth control functions. Due to the removal of holes in the struct,
its size is observed to reduce by one cacheline in an x86 system.

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
accessed, to the outside to allow grouping `on_list` and
throttle-related fields together. This cache group aligns to 64 byte
boundaries only when the target architecture utilizes a 64 byte cache
line size.

- Use `__cacheline_group_*` macros to delineate logically grouped fields
for cache alignment, with compile-time checks added in
`cfs_rq_struct_check`.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/core.c  | 61 ++++++++++++++++++++++++++++++++-
 kernel/sched/sched.h | 81 ++++++++++++++++++++++++++++++--------------
 2 files changed, 115 insertions(+), 27 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba0..ba89cd4f2fac 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8524,6 +8524,8 @@ LIST_HEAD(task_groups);
 static struct kmem_cache *task_group_cache __ro_after_init;
 #endif
 
+static void __init cfs_rq_struct_check(void);
+
 void __init sched_init(void)
 {
 	unsigned long ptr = 0;
@@ -8540,7 +8542,7 @@ void __init sched_init(void)
 	BUG_ON(!sched_class_above(&fair_sched_class, &ext_sched_class));
 	BUG_ON(!sched_class_above(&ext_sched_class, &idle_sched_class));
 #endif
-
+	cfs_rq_struct_check();
 	wait_bit_init();
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
@@ -10746,3 +10748,60 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx)
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
index 47972f34ea70..b0a6c70c01ea 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -641,31 +641,55 @@ struct balance_callback {
 	void (*func)(struct rq *rq);
 };
 
+/**
+ * The `throttle` cache group is designed to group 64 bytes into a cache
+ * line, which benefits architectures with a 64-byte cache line size. To
+ * prevent performance degradation on other architectures, let's
+ * conditionally align it when the target system utilizes a 64-byte
+ * cache line.
+ */
+#define THROTTLE_GROUP_ALIGN_COND 64
+
 /* CFS-related fields in a runqueue */
 struct cfs_rq {
+	/* The first cache line group is hot and mostly read */
+	__cacheline_group_begin(hot);
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
+	__cacheline_group_end(hot);
 
 #ifdef CONFIG_SMP
 	/*
@@ -686,7 +710,6 @@ struct cfs_rq {
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	u64			last_update_tg_load_avg;
 	unsigned long		tg_load_avg_contrib;
-	long			propagate;
 	long			prop_runnable_sum;
 
 	/*
@@ -702,8 +725,21 @@ struct cfs_rq {
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
+	 * Alignment is enforced only when the target architecture
+	 * utilizes a 64-byte cache line size.
+	 */
+	__cacheline_group_begin_aligned_cond(throttle, THROTTLE_GROUP_ALIGN_COND);
+	int			throttled;
+#endif /* CONFIG_CFS_BANDWIDTH */
 	/*
 	 * leaf cfs_rqs are those that hold tasks (lowest schedulable entity in
 	 * a hierarchy). Non-leaf lrqs hold other higher schedulable entities
@@ -714,30 +750,23 @@ struct cfs_rq {
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
+	__cacheline_group_end_aligned_cond(throttle, THROTTLE_GROUP_ALIGN_COND);
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
