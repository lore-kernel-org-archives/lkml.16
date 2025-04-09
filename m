Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0257525F7AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200533; cv=none; b=dRO8CpcBvjARl3TAI7QjVn/hE02yNW1aE1y40crxC5ZxgGaA992j9jTgMZOBjxxb04vhHKSMD5L4DCEKKdbS/EDxN9fmT5DSByQMt2nstSM8f9/v9qcfwbZJqMwKGItrqurB2wZ7XWSOvboUnqMVm4eUe8+NlDFhcbdS9KSq0v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200533; c=relaxed/simple;
	bh=r+U8nm/XYGjZeIaR9vq8NIB9rt1fWxKAyc80zUWemVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b1ZYzpQr/8yTt4yCOJEo+6/tL5yGVyv1NS/FxhB/UWhQfmGriUyh+hqcZvPwXW2oZEuBMvN8Qu7YYHQaucsY3Yx85oQIJJglty7U6uZabFKNOTfNjhvr+MGHorfOMThkdqoPlllWrTvEY9zurRKHgZNiaSBC3fUmeJzLFXc412I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DMUWLXlO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DMUWLXlO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22548a28d0cso94452585ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744200531; x=1744805331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iLVN+UQDsaz8fEhz9VXXrzsLP1VkED6AM2sgVLXPic=;
        b=DMUWLXlOtZtOyMccLJ7Ma+8DrdlsQrF948MppKrN3iGypWBIh9+c/3rZTsVe9Tz+ft
         /vsdZDNJddcF/wDDhY5ny2y0OcZn4A0ayTy6JfjrrBUljyrmSb/H9Zak+6t7JzKGdYqq
         xfvAM2oY8+KwEqzomDAoC58w42ouXNKfhDVH/70MFlXidz99dmd4tEjcDqWye27GYjjZ
         pSrLBj53ckEbvLHMCvk9Uh9uHQu2GQtGzzPrfMU7ZTgzjyaAEchdHMbIumRqfBSxVqxa
         Ij0MZEbL0m53VUVTDhVSyixaePbzcmGhF7vGlcTXrRkJsY264j5ULqKUg3xOw+VBrXll
         nAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744200531; x=1744805331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iLVN+UQDsaz8fEhz9VXXrzsLP1VkED6AM2sgVLXPic=;
        b=rKR1NpK3I8Q6b/7qM1VDoUJ/LNeG00Ln+5VTEsShxfnzwYUrm5BF6qwI6cfVHNX/ji
         U0N3ebP4/szIZsQo8NT9vTbUonATxjNj+Q6j1kjW8CA0Xpkgq0ltBlnXuBhGp14sQkbY
         9Hs/PQHZbQT+QWx8Xpyb5WbUOfZ3NzJMTa+xl/9wDVcwntJ/GCtYnbPNOyykDsWymxjm
         a4PGnmUGCHadVjsAov8k34A0hiLe5YxF8C6sIn8Vh2BEwhsfG4zae28SLEycLOehqyG1
         qVPPa5aJu7eMMy6nFHI0IT6HgtSR4+h6L+Hbv3Z6e8F6HBYaYo4ZBIIAT/474zMEaqhq
         +fDg==
X-Gm-Message-State: AOJu0YwNhvgueQBs5A/kiSzd446wUtajx08ee9CiTcgFMSm+RsXjSkV4
	sZJLPSABXeV8L/pvM2jbiKtYFaHih31l5d5NS4IFtAW/lY+o8b2zydS9RfrqPg==
X-Gm-Gg: ASbGncujxF1wQZYKoir87oLcsE5kSGw3IkBPbvRc3/7l0CyEAp/S1zckjwpPPudDPGB
	9+xTrjCWmmmXHzW1eRJldmIj7105PA0ngZJ4B4PcIUp+MM5vkuT/3R46PVi9rRVR1X1wNX5RypW
	FmtgIyzCMpxPIAXugIPGf8bNZ14D92/Cnm2EEZ+wI4Q4CWWTn3wrhHpIuOtoVLmDxx/dFslIaI5
	YtwH+rKJm6MC/TjPAaw5DYSwQ4D7v8gOyWIjWPDk5odNjjtf8YExuoL+ntxzONr8CCp8uTv13U1
	IIJWR1+58/E4KsKC33sMcOeHjAFFV6Tsp+tunt5sIk/tcbmLQXEcGmT0
X-Google-Smtp-Source: AGHT+IHEahy8pwoua01WcQcJf/l3yT1AbK/F+vkss2DqIiIV9m+OrkJEuowHzcV1gZmUco39r340ig==
X-Received: by 2002:a17:903:2310:b0:227:e709:f71 with SMTP id d9443c01a7336-22ac29b41d7mr45248595ad.29.1744200531114;
        Wed, 09 Apr 2025 05:08:51 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c62dsm10017875ad.95.2025.04.09.05.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:08:50 -0700 (PDT)
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
Subject: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting throttle time
Date: Wed,  9 Apr 2025 20:07:46 +0800
Message-Id: <20250409120746.635476-8-ziqianlu@bytedance.com>
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

Implement an alternative way of accounting cfs_rq throttle time which:
- starts accounting when a throttled cfs_rq has no tasks enqueued and its
  throttled list is not empty;
- stops accounting when this cfs_rq gets unthrottled or a task gets
  enqueued.

This way, the accounted throttle time is when the cfs_rq has absolutely
no tasks enqueued and has tasks throttled.

Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c  | 112 ++++++++++++++++++++++++++++++++-----------
 kernel/sched/sched.h |   4 ++
 2 files changed, 89 insertions(+), 27 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 20471a3aa35e6..70f7de82d1d9d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5300,6 +5300,7 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 
 static void check_enqueue_throttle(struct cfs_rq *cfs_rq);
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq);
+static void account_cfs_rq_throttle_self(struct cfs_rq *cfs_rq);
 
 static void
 requeue_delayed_entity(struct sched_entity *se);
@@ -5362,10 +5363,14 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 		if (throttled_hierarchy(cfs_rq)) {
 			struct rq *rq = rq_of(cfs_rq);
 
-			if (cfs_rq_throttled(cfs_rq) && !cfs_rq->throttled_clock)
-				cfs_rq->throttled_clock = rq_clock(rq);
-			if (!cfs_rq->throttled_clock_self)
-				cfs_rq->throttled_clock_self = rq_clock(rq);
+			if (cfs_rq->throttled_clock) {
+				cfs_rq->throttled_time +=
+					rq_clock(rq) - cfs_rq->throttled_clock;
+				cfs_rq->throttled_clock = 0;
+			}
+
+			if (cfs_rq->throttled_clock_self)
+				account_cfs_rq_throttle_self(cfs_rq);
 		}
 #endif
 	}
@@ -5453,7 +5458,7 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 		 * DELAY_DEQUEUE relies on spurious wakeups, special task
 		 * states must not suffer spurious wakeups, excempt them.
 		 */
-		if (flags & DEQUEUE_SPECIAL)
+		if (flags & (DEQUEUE_SPECIAL | DEQUEUE_THROTTLE))
 			delay = false;
 
 		WARN_ON_ONCE(delay && se->sched_delayed);
@@ -5513,8 +5518,24 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 
 	if (cfs_rq->nr_queued == 0) {
 		update_idle_cfs_rq_clock_pelt(cfs_rq);
-		if (throttled_hierarchy(cfs_rq))
+
+#ifdef CONFIG_CFS_BANDWIDTH
+		if (throttled_hierarchy(cfs_rq)) {
 			list_del_leaf_cfs_rq(cfs_rq);
+
+			if (cfs_rq->h_nr_throttled) {
+				struct rq *rq = rq_of(cfs_rq);
+
+				WARN_ON_ONCE(cfs_rq->throttled_clock_self);
+				cfs_rq->throttled_clock_self = rq_clock(rq);
+
+				if (cfs_rq_throttled(cfs_rq)) {
+					WARN_ON_ONCE(cfs_rq->throttled_clock);
+					cfs_rq->throttled_clock = rq_clock(rq);
+				}
+			}
+		}
+#endif
 	}
 
 	return true;
@@ -5809,6 +5830,18 @@ static inline bool task_is_throttled(struct task_struct *p)
 	return !list_empty(&p->throttle_node);
 }
 
+static inline void
+cfs_rq_inc_h_nr_throttled(struct cfs_rq *cfs_rq, unsigned int nr)
+{
+	cfs_rq->h_nr_throttled += nr;
+}
+
+static inline void
+cfs_rq_dec_h_nr_throttled(struct cfs_rq *cfs_rq, unsigned int nr)
+{
+	cfs_rq->h_nr_throttled -= nr;
+}
+
 static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
 static void throttle_cfs_rq_work(struct callback_head *work)
 {
@@ -5845,7 +5878,7 @@ static void throttle_cfs_rq_work(struct callback_head *work)
 		rq = scope.rq;
 		update_rq_clock(rq);
 		WARN_ON_ONCE(!list_empty(&p->throttle_node));
-		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
+		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_THROTTLE);
 		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
 		resched_curr(rq);
 	}
@@ -5863,16 +5896,37 @@ void init_cfs_throttle_work(struct task_struct *p)
 
 static void dequeue_throttled_task(struct task_struct *p, int flags)
 {
+	struct sched_entity *se = &p->se;
+
 	/*
 	 * Task is throttled and someone wants to dequeue it again:
 	 * it must be sched/core when core needs to do things like
 	 * task affinity change, task group change, task sched class
 	 * change etc.
 	 */
-	WARN_ON_ONCE(p->se.on_rq);
-	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
+	WARN_ON_ONCE(se->on_rq);
+	WARN_ON_ONCE(flags & DEQUEUE_THROTTLE);
 
 	list_del_init(&p->throttle_node);
+
+	for_each_sched_entity(se) {
+		struct cfs_rq *cfs_rq = cfs_rq_of(se);
+
+		cfs_rq->h_nr_throttled--;
+	}
+}
+
+static void account_cfs_rq_throttle_self(struct cfs_rq *cfs_rq)
+{
+	/* account self time */
+	u64 delta = rq_clock(rq_of(cfs_rq)) - cfs_rq->throttled_clock_self;
+
+	cfs_rq->throttled_clock_self = 0;
+
+	if (WARN_ON_ONCE((s64)delta < 0))
+		delta = 0;
+
+	cfs_rq->throttled_clock_self_time += delta;
 }
 
 static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
@@ -5889,27 +5943,21 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
 	cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
 		cfs_rq->throttled_clock_pelt;
 
-	if (cfs_rq->throttled_clock_self) {
-		u64 delta = rq_clock(rq) - cfs_rq->throttled_clock_self;
-
-		cfs_rq->throttled_clock_self = 0;
-
-		if (WARN_ON_ONCE((s64)delta < 0))
-			delta = 0;
-
-		cfs_rq->throttled_clock_self_time += delta;
-	}
+	if (cfs_rq->throttled_clock_self)
+		account_cfs_rq_throttle_self(cfs_rq);
 
 	/* Re-enqueue the tasks that have been throttled at this level. */
 	list_for_each_entry_safe(p, tmp, &cfs_rq->throttled_limbo_list, throttle_node) {
 		list_del_init(&p->throttle_node);
-		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP);
+		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP | ENQUEUE_THROTTLE);
 	}
 
 	/* Add cfs_rq with load or one or more already running entities to the list */
 	if (!cfs_rq_is_decayed(cfs_rq))
 		list_add_leaf_cfs_rq(cfs_rq);
 
+	WARN_ON_ONCE(cfs_rq->h_nr_throttled);
+
 	return 0;
 }
 
@@ -5945,10 +5993,7 @@ static int tg_throttle_down(struct task_group *tg, void *data)
 	/* group is entering throttled state, stop time */
 	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
 
-	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
-	if (cfs_rq->nr_queued)
-		cfs_rq->throttled_clock_self = rq_clock(rq);
-	else
+	if (!cfs_rq->nr_queued)
 		list_del_leaf_cfs_rq(cfs_rq);
 
 	WARN_ON_ONCE(!list_empty(&cfs_rq->throttled_limbo_list));
@@ -5992,9 +6037,6 @@ static void throttle_cfs_rq(struct cfs_rq *cfs_rq)
 	 * throttled-list.  rq->lock protects completion.
 	 */
 	cfs_rq->throttled = 1;
-	WARN_ON_ONCE(cfs_rq->throttled_clock);
-	if (cfs_rq->nr_queued)
-		cfs_rq->throttled_clock = rq_clock(rq);
 	return;
 }
 
@@ -6026,6 +6068,10 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 		cfs_b->throttled_time += rq_clock(rq) - cfs_rq->throttled_clock;
 		cfs_rq->throttled_clock = 0;
 	}
+	if (cfs_rq->throttled_time) {
+		cfs_b->throttled_time += cfs_rq->throttled_time;
+		cfs_rq->throttled_time = 0;
+	}
 	list_del_rcu(&cfs_rq->throttled_list);
 	raw_spin_unlock(&cfs_b->lock);
 
@@ -6710,6 +6756,8 @@ static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
 static void task_throttle_setup_work(struct task_struct *p) {}
 static bool task_is_throttled(struct task_struct *p) { return false; }
 static void dequeue_throttled_task(struct task_struct *p, int flags) {}
+static void cfs_rq_inc_h_nr_throttled(struct cfs_rq *cfs_rq, unsigned int nr) {}
+static void cfs_rq_dec_h_nr_throttled(struct cfs_rq *cfs_rq, unsigned int nr) {}
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
@@ -6898,6 +6946,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	struct sched_entity *se = &p->se;
 	int h_nr_idle = task_has_idle_policy(p);
 	int h_nr_runnable = 1;
+	int h_nr_throttled = (flags & ENQUEUE_THROTTLE) ? 1 : 0;
 	int task_new = !(flags & ENQUEUE_WAKEUP);
 	int rq_h_nr_queued = rq->cfs.h_nr_queued;
 	u64 slice = 0;
@@ -6951,6 +7000,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		cfs_rq->h_nr_runnable += h_nr_runnable;
 		cfs_rq->h_nr_queued++;
 		cfs_rq->h_nr_idle += h_nr_idle;
+		cfs_rq_dec_h_nr_throttled(cfs_rq, h_nr_throttled);
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = 1;
@@ -6973,6 +7023,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		cfs_rq->h_nr_runnable += h_nr_runnable;
 		cfs_rq->h_nr_queued++;
 		cfs_rq->h_nr_idle += h_nr_idle;
+		cfs_rq_dec_h_nr_throttled(cfs_rq, h_nr_throttled);
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = 1;
@@ -7027,10 +7078,12 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 	int rq_h_nr_queued = rq->cfs.h_nr_queued;
 	bool task_sleep = flags & DEQUEUE_SLEEP;
 	bool task_delayed = flags & DEQUEUE_DELAYED;
+	bool task_throttle = flags & DEQUEUE_THROTTLE;
 	struct task_struct *p = NULL;
 	int h_nr_idle = 0;
 	int h_nr_queued = 0;
 	int h_nr_runnable = 0;
+	int h_nr_throttled = 0;
 	struct cfs_rq *cfs_rq;
 	u64 slice = 0;
 
@@ -7040,6 +7093,9 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		h_nr_idle = task_has_idle_policy(p);
 		if (task_sleep || task_delayed || !se->sched_delayed)
 			h_nr_runnable = 1;
+
+		if (task_throttle)
+			h_nr_throttled = 1;
 	} else {
 		cfs_rq = group_cfs_rq(se);
 		slice = cfs_rq_min_slice(cfs_rq);
@@ -7058,6 +7114,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		cfs_rq->h_nr_runnable -= h_nr_runnable;
 		cfs_rq->h_nr_queued -= h_nr_queued;
 		cfs_rq->h_nr_idle -= h_nr_idle;
+		cfs_rq_inc_h_nr_throttled(cfs_rq, h_nr_throttled);
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
@@ -7095,6 +7152,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		cfs_rq->h_nr_runnable -= h_nr_runnable;
 		cfs_rq->h_nr_queued -= h_nr_queued;
 		cfs_rq->h_nr_idle -= h_nr_idle;
+		cfs_rq_inc_h_nr_throttled(cfs_rq, h_nr_throttled);
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 97be6a6f53b9c..54cdec21aa5c2 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -721,6 +721,7 @@ struct cfs_rq {
 
 #ifdef CONFIG_CFS_BANDWIDTH
 	int			runtime_enabled;
+	unsigned int		h_nr_throttled;
 	s64			runtime_remaining;
 
 	u64			throttled_pelt_idle;
@@ -732,6 +733,7 @@ struct cfs_rq {
 	u64			throttled_clock_pelt_time;
 	u64			throttled_clock_self;
 	u64			throttled_clock_self_time;
+	u64			throttled_time;
 	int			throttled;
 	int			throttle_count;
 	struct list_head	throttled_list;
@@ -2360,6 +2362,7 @@ extern const u32		sched_prio_to_wmult[40];
 #define DEQUEUE_SPECIAL		0x10
 #define DEQUEUE_MIGRATING	0x100 /* Matches ENQUEUE_MIGRATING */
 #define DEQUEUE_DELAYED		0x200 /* Matches ENQUEUE_DELAYED */
+#define DEQUEUE_THROTTLE	0x800 /* Matches ENQUEUE_THROTTLE */
 
 #define ENQUEUE_WAKEUP		0x01
 #define ENQUEUE_RESTORE		0x02
@@ -2377,6 +2380,7 @@ extern const u32		sched_prio_to_wmult[40];
 #define ENQUEUE_MIGRATING	0x100
 #define ENQUEUE_DELAYED		0x200
 #define ENQUEUE_RQ_SELECTED	0x400
+#define ENQUEUE_THROTTLE	0x800
 
 #define RETRY_TASK		((void *)-1UL)
 
-- 
2.39.5

