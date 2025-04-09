Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20C825FA09
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200507; cv=none; b=HEvaE4mcCXFDPbyHayLk5lGR2uvvRZpSR9RLTpUBkgM8jd/iyhNMIu+Cz+fV5eWseVSyRFp3WY6G3MiGoJ6niUXjU9CPJhvCaLDtSJLQ2PV+0L1zcOZ51nd0+qRSZWB9sZPzbNb61lPB0Fq+euksiuddDYxDZeFBIZEX8mucjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200507; c=relaxed/simple;
	bh=5FIyRLIuTEKE9CK1u0UbyyTdW5OtYxuO2X06M6RgAF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KzpDY7yzScOQomlIgIpM7qCN6OjJ0Iffe3KUCHhba5NUtO3L+prFyaj31pfsrpvTABr7879M2jgSJ//Q8YAmbDG34elKUFBvaeME+zxAg9SSrR4J2vYDJtALFioTdnuZUBJ91aFTDxn24vDaqVxdRw3pVEbhiQg5xLgpzdcP5Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=N0hCUWB6; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="N0hCUWB6"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af908bb32fdso552113a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 05:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744200505; x=1744805305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRjfUgyAXNg6y8q1U/ED0xC0L5K6VtUkY9Y8CsxVVuA=;
        b=N0hCUWB6DKIQlkIHwGt77p1IZsE1+kHZy+UgXvosOZgjSPxOVGeSgKbacwY3u10uvI
         W/xVETaUDKFxdy65anBKF4u52BkhxGA1G9J3258zIHOCt9UfOYvJZdVfz4UwGYEG5U87
         DLXkx0mg9hjKtHXldnOn4Oie4JqobhdY7CU/3+XLPjkN1hgMvkk6asziG0VDAViiPYBs
         wbry/lNiQ+Ot4Gg+TQQJlH4jEYF0rRS82RdxOsqlwnfIT2Lgx0Q6eWfsSLvANtpB8APd
         3/46vDBYih9iYNHTmifLmov2onRWa+vqbT9/J3C7OoGtSNsT5B6LcY84PJxLJVzdqtr5
         5TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744200505; x=1744805305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRjfUgyAXNg6y8q1U/ED0xC0L5K6VtUkY9Y8CsxVVuA=;
        b=NgeoTZYaXDrsqFwsHXjjSOT4/nSH7rzM0hpBsuQD9VbIwRmIZB7eXUf3snq1jxJGWt
         3swAbrg+MGu4CdjffH4pHu/Z4rOWEaCe3DWZifN3PpElqwADOsUcjYTS9kn8gBf5a4Am
         E9DTALbfqsSqPZFsN9i8VtMULld1fbDE9NcaV2Mgh9DF7cdIGMX1MsaFZr1coszP0CFm
         WK4WZjmH2m8ppsMf2EUs7vW8RXA1B7vd4Y4y6S8c2Szw/LP8UcdIw/BGU/dWWN6yl1bH
         3jKamNui5jWIVS9WS1W35pIc1mRv9+9XvPj3dZb2ynSFS2yhEquOo/DtTL7uXXV5OVX0
         LTHA==
X-Gm-Message-State: AOJu0YyZLd33wUYtw7gPqnO8Z0X/lYMpfSE1ehzl3Jx2x1jy0CdA2xuh
	sEhIJqUXELIFddPtITBYvQSgT2r+6w9/GLa+sT52B7BVfMLWMkBvvFRM97VYJg==
X-Gm-Gg: ASbGncsYWkaLdyxb66u0vSPNBvKFmmdsZTmdcBq1YyfdATD362q/POdf2I42di9Zxr3
	AV217B9Sul6iMUMImAkZ84vtcnHwcm8af8IndMOWekv6WrtBech2hue8sOZTjwU/gBW5KU8wIBR
	6N4lJOb15YwVc/UxkzbeJj4SH4rUPkRjT2rRC2ZFphHlG9l/OMGwaRUw8g93MIpYR0RSOvJJDhO
	mUCOS1b3yc/WXm9TJFD37vxZo4ftqbICax1x1dTj5SjqnMSQlPoLU4IUDPCksaMw52ZNAOCY079
	FbcroNUh0JWJweKp/RcHj76QFkOGdTflCz34sOFux0aswRb58PZ8LlUs
X-Google-Smtp-Source: AGHT+IF1hsPkMFJ/W2lv3i3RQmOsxNX0efTq+Chl3HuoptfTN5xXARCntSnFNA6yZVZN6R0O2y0I1w==
X-Received: by 2002:a17:90b:51d1:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-306d0d1d6afmr10139880a91.14.1744200504872;
        Wed, 09 Apr 2025 05:08:24 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c62dsm10017875ad.95.2025.04.09.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:08:24 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [RFC PATCH v2 3/7] sched/fair: Handle unthrottle path for task based throttle
Date: Wed,  9 Apr 2025 20:07:42 +0800
Message-Id: <20250409120746.635476-4-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409120746.635476-1-ziqianlu@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Valentin Schneider <vschneid@redhat.com>

On unthrottle, enqueue throttled tasks back so they can continue to run.

Note that for this task based throttling, the only throttle place is
when it returns to user space so as long as a task is enqueued, no
matter its cfs_rq is throttled or not, it will be allowed to run till it
reaches that throttle place.

leaf_cfs_rq list is handled differently now: as long as a task is
enqueued to a throttled or not cfs_rq, this cfs_rq will be added to that
list and when cfs_rq is throttled and all its tasks are dequeued, it
will be removed from that list. I think this is easy to reason so chose
to do so.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c | 129 ++++++++++++++++----------------------------
 1 file changed, 45 insertions(+), 84 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index c566a5a90d065..4152088fc0546 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5357,18 +5357,17 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 
 	if (cfs_rq->nr_queued == 1) {
 		check_enqueue_throttle(cfs_rq);
-		if (!throttled_hierarchy(cfs_rq)) {
-			list_add_leaf_cfs_rq(cfs_rq);
-		} else {
+		list_add_leaf_cfs_rq(cfs_rq);
 #ifdef CONFIG_CFS_BANDWIDTH
+		if (throttled_hierarchy(cfs_rq)) {
 			struct rq *rq = rq_of(cfs_rq);
 
 			if (cfs_rq_throttled(cfs_rq) && !cfs_rq->throttled_clock)
 				cfs_rq->throttled_clock = rq_clock(rq);
 			if (!cfs_rq->throttled_clock_self)
 				cfs_rq->throttled_clock_self = rq_clock(rq);
-#endif
 		}
+#endif
 	}
 }
 
@@ -5826,6 +5825,11 @@ static inline int throttled_lb_pair(struct task_group *tg,
 	       throttled_hierarchy(dest_cfs_rq);
 }
 
+static inline bool task_is_throttled(struct task_struct *p)
+{
+	return !list_empty(&p->throttle_node);
+}
+
 static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
 static void throttle_cfs_rq_work(struct callback_head *work)
 {
@@ -5878,32 +5882,41 @@ void init_cfs_throttle_work(struct task_struct *p)
 	INIT_LIST_HEAD(&p->throttle_node);
 }
 
+static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
 static int tg_unthrottle_up(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
 	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+	struct task_struct *p, *tmp;
 
 	cfs_rq->throttle_count--;
-	if (!cfs_rq->throttle_count) {
-		cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
-					     cfs_rq->throttled_clock_pelt;
+	if (cfs_rq->throttle_count)
+		return 0;
 
-		/* Add cfs_rq with load or one or more already running entities to the list */
-		if (!cfs_rq_is_decayed(cfs_rq))
-			list_add_leaf_cfs_rq(cfs_rq);
+	cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
+		cfs_rq->throttled_clock_pelt;
 
-		if (cfs_rq->throttled_clock_self) {
-			u64 delta = rq_clock(rq) - cfs_rq->throttled_clock_self;
+	if (cfs_rq->throttled_clock_self) {
+		u64 delta = rq_clock(rq) - cfs_rq->throttled_clock_self;
 
-			cfs_rq->throttled_clock_self = 0;
+		cfs_rq->throttled_clock_self = 0;
 
-			if (WARN_ON_ONCE((s64)delta < 0))
-				delta = 0;
+		if (WARN_ON_ONCE((s64)delta < 0))
+			delta = 0;
 
-			cfs_rq->throttled_clock_self_time += delta;
-		}
+		cfs_rq->throttled_clock_self_time += delta;
+	}
+
+	/* Re-enqueue the tasks that have been throttled at this level. */
+	list_for_each_entry_safe(p, tmp, &cfs_rq->throttled_limbo_list, throttle_node) {
+		list_del_init(&p->throttle_node);
+		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP);
 	}
 
+	/* Add cfs_rq with load or one or more already running entities to the list */
+	if (!cfs_rq_is_decayed(cfs_rq))
+		list_add_leaf_cfs_rq(cfs_rq);
+
 	return 0;
 }
 
@@ -5996,11 +6009,20 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	struct rq *rq = rq_of(cfs_rq);
 	struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
-	struct sched_entity *se;
-	long queued_delta, runnable_delta, idle_delta;
-	long rq_h_nr_queued = rq->cfs.h_nr_queued;
+	struct sched_entity *se = cfs_rq->tg->se[cpu_of(rq)];
 
-	se = cfs_rq->tg->se[cpu_of(rq)];
+	/*
+	 * It's possible we are called with !runtime_remaining due to things
+	 * like user changed quota setting(see tg_set_cfs_bandwidth()) or async
+	 * unthrottled us with a positive runtime_remaining but other still
+	 * running entities consumed those runtime before we reach here.
+	 *
+	 * Anyway, we can't unthrottle this cfs_rq without any runtime remaining
+	 * because any enqueue below will immediately trigger a throttle, which
+	 * is not supposed to happen on unthrottle path.
+	 */
+	if (cfs_rq->runtime_enabled && cfs_rq->runtime_remaining <= 0)
+		return;
 
 	cfs_rq->throttled = 0;
 
@@ -6028,62 +6050,8 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 			if (list_add_leaf_cfs_rq(cfs_rq_of(se)))
 				break;
 		}
-		goto unthrottle_throttle;
 	}
 
-	queued_delta = cfs_rq->h_nr_queued;
-	runnable_delta = cfs_rq->h_nr_runnable;
-	idle_delta = cfs_rq->h_nr_idle;
-	for_each_sched_entity(se) {
-		struct cfs_rq *qcfs_rq = cfs_rq_of(se);
-
-		/* Handle any unfinished DELAY_DEQUEUE business first. */
-		if (se->sched_delayed) {
-			int flags = DEQUEUE_SLEEP | DEQUEUE_DELAYED;
-
-			dequeue_entity(qcfs_rq, se, flags);
-		} else if (se->on_rq)
-			break;
-		enqueue_entity(qcfs_rq, se, ENQUEUE_WAKEUP);
-
-		if (cfs_rq_is_idle(group_cfs_rq(se)))
-			idle_delta = cfs_rq->h_nr_queued;
-
-		qcfs_rq->h_nr_queued += queued_delta;
-		qcfs_rq->h_nr_runnable += runnable_delta;
-		qcfs_rq->h_nr_idle += idle_delta;
-
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(qcfs_rq))
-			goto unthrottle_throttle;
-	}
-
-	for_each_sched_entity(se) {
-		struct cfs_rq *qcfs_rq = cfs_rq_of(se);
-
-		update_load_avg(qcfs_rq, se, UPDATE_TG);
-		se_update_runnable(se);
-
-		if (cfs_rq_is_idle(group_cfs_rq(se)))
-			idle_delta = cfs_rq->h_nr_queued;
-
-		qcfs_rq->h_nr_queued += queued_delta;
-		qcfs_rq->h_nr_runnable += runnable_delta;
-		qcfs_rq->h_nr_idle += idle_delta;
-
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(qcfs_rq))
-			goto unthrottle_throttle;
-	}
-
-	/* Start the fair server if un-throttling resulted in new runnable tasks */
-	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
-		dl_server_start(&rq->fair_server);
-
-	/* At this point se is NULL and we are at root level*/
-	add_nr_running(rq, queued_delta);
-
-unthrottle_throttle:
 	assert_list_leaf_cfs_rq(rq);
 
 	/* Determine whether we need to wake up potentially idle CPU: */
@@ -6747,6 +6715,7 @@ static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
 static inline void sync_throttle(struct task_group *tg, int cpu) {}
 static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
 static void task_throttle_setup_work(struct task_struct *p) {}
+static bool task_is_throttled(struct task_struct *p) { return false; }
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
@@ -6955,6 +6924,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		util_est_enqueue(&rq->cfs, p);
 
 	if (flags & ENQUEUE_DELAYED) {
+		WARN_ON_ONCE(task_is_throttled(p));
 		requeue_delayed_entity(se);
 		return;
 	}
@@ -6997,10 +6967,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = 1;
 
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			goto enqueue_throttle;
-
 		flags = ENQUEUE_WAKEUP;
 	}
 
@@ -7022,10 +6988,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = 1;
-
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			goto enqueue_throttle;
 	}
 
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued) {
@@ -7055,7 +7017,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (!task_new)
 		check_update_overutilized_status(rq);
 
-enqueue_throttle:
 	assert_list_leaf_cfs_rq(rq);
 
 	hrtick_update(rq);
-- 
2.39.5

