Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6C27F00E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234827; cv=none; b=WB3kmeHSHQo09iG6zdLw7XqWAspjNDDZiKFnmYRIFbrgk84OpJnvxdWAW/YHVXlhN3eHAu1v0VRHSpEM57Ii3YRxIGvknCeJO5kFG19fgufrTUqKGCbUyZfKXLukSlRE/D4kGLYnwOzjydQ8+e/aEKAUz8t4nvwm0+yCsIN1AWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234827; c=relaxed/simple;
	bh=y9AyYh62HEh1O6R6xmIGTerCgm7NUN8yHzY7XZuwo/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UDF0IdNx2yLQ5FZsVc0TyR9NfF/5x0dkU4l+nn/Us7JBOGwcmz74ZdTGxiQjLHYKpVHSwzOg31Y+I3hOYdWlpAehGro17gbCFwrucvx9fTvyf8hVxUxfVqflgL6wdIkoBmbxAR5nclJgtV98GFNFmeccsl7dcPsJsM8AQCtaxsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KDapHZOI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KDapHZOI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235f9e87f78so69629005ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750234825; x=1750839625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NXe/cf9qFtQFjwCo3Xjn8ayWVM4Iys5BjAx9JvlC+M=;
        b=KDapHZOIOPbOickLLgwXw2wkMhBkl6UImWx7ttKZ3ssHGSngAi2zs3Fy9Yvfv1kfMC
         CtbLfDEoaATHpKswIyz/GX+N66Zu9nctsmvviHC/GBOJkB9JhjONfXRPD/2gAMdocFcQ
         SbUC1DYJG9Ek4xQ3Pr1oLcpOhipo4Gk/1kuwfvF0Mm1aL/fnEOW7igcTtRtBX+JdEGg0
         DWJ6X0CWFRm3PlkLZ5RJ9FFlfENXV5YYrw9ZwQ+JidVREzzRru5QWddZX/00N7hmyY1Y
         TejP0Rbba3aGWMJ8AVBJpN3LBfT6ZfwFLLydBoBXaFPEPQvZvdQB81T9ZbRw+mINTJrQ
         TZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234825; x=1750839625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NXe/cf9qFtQFjwCo3Xjn8ayWVM4Iys5BjAx9JvlC+M=;
        b=sJGuiucdAdKTMjxXzh5nYTYHDpztskkdwiMLrNmZa7xf3OYqdPPhpyaGL9BRr+uhHE
         MlSWCbWQI+O4rKZ17M8L8IQigqS3oyrc90Uhgo/JsMfvknLmClB3OXOfMZbc3It4uG/4
         4xm7GHjZZC4450Pp5sqEiX8m1rshvYLiU+JfpP00kKkCqfPRbkZTPbDra91JlN5WcLgT
         nJwaoE6VHt1nBgLs6kl0TNCsrBThBFCv9iC4uvSE2Ec23OVqwsHQvUNIrdBfdVCLgMqm
         GN2gIh7D5NlOw6gTDg6HPUpa44qL5D3VzdbY2uYMGpbzN/froxoTG9oP/+Zls8LlL5Hk
         5YBg==
X-Gm-Message-State: AOJu0YyGqrV6H1EmSSLJzMmbIgsH/Qsk6+1wFS8+wrGA1uNpeJLkmi1p
	E5yCFmCjfr3gLpecgglE88MQvgZlqIwttibCoXUIkoJUdyqlhRaeGDwyQmKYd3LZgA==
X-Gm-Gg: ASbGnctsSIPbN3fW3kKknpdXIYqQxHuAYJ49PpnfSCl3z125I0JHRm4GXiCRBlQE/h1
	FZ0obWKJXY/Bei6Y8AEujfV0oTr/cgQU6lz3PdKjJ0s1rn8u9UKxB97GQ3oem2+wNdL5sCMA6il
	7KAkOAdmINtPc++V6EYPfzKpYeoTyf71m5lGAnQfJFWqnM0z6gETTHizqZEEPgQKUk+jbxDiv8A
	kOoqgAh7DxdAv5tL1RwZ9+RvuSlQ9SrTjf5FCS+Xc1+I/7IuLMYn6iSvBc6AGwVyanLpOSnoGCO
	4Zfok7EoLoMnQTKLKaMQfBoWTXihl0+xI0r0tnjV4HFw8mBGQKPNeiI9v+V6wE8eceVHl8IVqh8
	+BC9Sh8DtX4jePwhbfNcf0p1njhdSkwfa
X-Google-Smtp-Source: AGHT+IGRndvep7MBM+UXCluTDBgc27r2XCnfOYFW3b1POsOSytzJpQpu8Z6txAoGCQYwor6LkyAUoA==
X-Received: by 2002:a17:903:350b:b0:234:bef7:e227 with SMTP id d9443c01a7336-2366affb316mr228444535ad.18.1750234824786;
        Wed, 18 Jun 2025 01:20:24 -0700 (PDT)
Received: from 5CG4011XCS-JQI.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1691d7fsm10432084a12.69.2025.06.18.01.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:20:24 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v2 3/5] sched/fair: Switch to task based throttle model
Date: Wed, 18 Jun 2025 16:19:38 +0800
Message-Id: <20250618081940.621-4-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618081940.621-1-ziqianlu@bytedance.com>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Valentin Schneider <vschneid@redhat.com>

In current throttle model, when a cfs_rq is throttled, its entity will
be dequeued from cpu's rq, making tasks attached to it not able to run,
thus achiveing the throttle target.

This has a drawback though: assume a task is a reader of percpu_rwsem
and is waiting. When it gets woken, it can not run till its task group's
next period comes, which can be a relatively long time. Waiting writer
will have to wait longer due to this and it also makes further reader
build up and eventually trigger task hung.

To improve this situation, change the throttle model to task based, i.e.
when a cfs_rq is throttled, record its throttled status but do not remove
it from cpu's rq. Instead, for tasks that belong to this cfs_rq, when
they get picked, add a task work to them so that when they return
to user, they can be dequeued there. In this way, tasks throttled will
not hold any kernel resources. And on unthrottle, enqueue back those
tasks so they can continue to run.

Throttled cfs_rq's leaf_cfs_rq_list is handled differently now: since a
task can be enqueued to a throttled cfs_rq and gets to run, to not break
the assert_list_leaf_cfs_rq() in enqueue_task_fair(), always add it to
leaf cfs_rq list when it has its first entity enqueued and delete it
from leaf cfs_rq list when it has no tasks enqueued.

Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # tag on pick
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c | 325 +++++++++++++++++++++-----------------------
 1 file changed, 153 insertions(+), 172 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8226120b8771a..59b372ffae18c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5291,18 +5291,17 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 
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
 
@@ -5341,8 +5340,6 @@ static void set_delayed(struct sched_entity *se)
 		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
 		cfs_rq->h_nr_runnable--;
-		if (cfs_rq_throttled(cfs_rq))
-			break;
 	}
 }
 
@@ -5363,8 +5360,6 @@ static void clear_delayed(struct sched_entity *se)
 		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
 		cfs_rq->h_nr_runnable++;
-		if (cfs_rq_throttled(cfs_rq))
-			break;
 	}
 }
 
@@ -5450,8 +5445,11 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 	if (flags & DEQUEUE_DELAYED)
 		finish_delayed_dequeue_entity(se);
 
-	if (cfs_rq->nr_queued == 0)
+	if (cfs_rq->nr_queued == 0) {
 		update_idle_cfs_rq_clock_pelt(cfs_rq);
+		if (throttled_hierarchy(cfs_rq))
+			list_del_leaf_cfs_rq(cfs_rq);
+	}
 
 	return true;
 }
@@ -5799,6 +5797,10 @@ static void throttle_cfs_rq_work(struct callback_head *work)
 		WARN_ON_ONCE(p->throttled || !list_empty(&p->throttle_node));
 		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
 		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
+		/*
+		 * Must not set throttled before dequeue or dequeue will
+		 * mistakenly regard this task as an already throttled one.
+		 */
 		p->throttled = true;
 		resched_curr(rq);
 	}
@@ -5812,32 +5814,116 @@ void init_cfs_throttle_work(struct task_struct *p)
 	INIT_LIST_HEAD(&p->throttle_node);
 }
 
+/*
+ * Task is throttled and someone wants to dequeue it again:
+ * it could be sched/core when core needs to do things like
+ * task affinity change, task group change, task sched class
+ * change etc. and in these cases, DEQUEUE_SLEEP is not set;
+ * or the task is blocked after throttled due to freezer etc.
+ * and in these cases, DEQUEUE_SLEEP is set.
+ */
+static void detach_task_cfs_rq(struct task_struct *p);
+static void dequeue_throttled_task(struct task_struct *p, int flags)
+{
+	WARN_ON_ONCE(p->se.on_rq);
+	list_del_init(&p->throttle_node);
+
+	/* task blocked after throttled */
+	if (flags & DEQUEUE_SLEEP) {
+		p->throttled = false;
+		return;
+	}
+
+	/*
+	 * task is migrating off its old cfs_rq, detach
+	 * the task's load from its old cfs_rq.
+	 */
+	if (task_on_rq_migrating(p))
+		detach_task_cfs_rq(p);
+}
+
+static bool enqueue_throttled_task(struct task_struct *p)
+{
+	struct cfs_rq *cfs_rq = cfs_rq_of(&p->se);
+
+	/*
+	 * If the throttled task is enqueued to a throttled cfs_rq,
+	 * take the fast path by directly put the task on target
+	 * cfs_rq's limbo list, except when p is current because
+	 * the following race can cause p's group_node left in rq's
+	 * cfs_tasks list when it's throttled:
+	 *
+	 *        cpuX                       cpuY
+	 *   taskA ret2user
+	 *  throttle_cfs_rq_work()    sched_move_task(taskA)
+	 *  task_rq_lock acquired
+	 *  dequeue_task_fair(taskA)
+	 *  task_rq_lock released
+	 *                            task_rq_lock acquired
+	 *                            task_current_donor(taskA) == true
+	 *                            task_on_rq_queued(taskA) == true
+	 *                            dequeue_task(taskA)
+	 *                            put_prev_task(taskA)
+	 *                            sched_change_group()
+	 *                            enqueue_task(taskA) -> taskA's new cfs_rq
+	 *                                                   is throttled, go
+	 *                                                   fast path and skip
+	 *                                                   actual enqueue
+	 *                            set_next_task(taskA)
+	 *                          __set_next_task_fair(taskA)
+	 *                    list_move(&se->group_node, &rq->cfs_tasks); // bug
+	 *  schedule()
+	 *
+	 * And in the above race case, the task's current cfs_rq is in the same
+	 * rq as its previous cfs_rq because sched_move_task() doesn't migrate
+	 * task so we can use its current cfs_rq to derive rq and test if the
+	 * task is current.
+	 */
+	if (throttled_hierarchy(cfs_rq) &&
+	    !task_current_donor(rq_of(cfs_rq), p)) {
+		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
+		return true;
+	}
+
+	/* we can't take the fast path, do an actual enqueue*/
+	p->throttled = false;
+	return false;
+}
+
+static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
 static int tg_unthrottle_up(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
 	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+	struct task_struct *p, *tmp;
 
-	cfs_rq->throttle_count--;
-	if (!cfs_rq->throttle_count) {
-		cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
-					     cfs_rq->throttled_clock_pelt;
+	if (--cfs_rq->throttle_count)
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
 	}
 
+	/* Re-enqueue the tasks that have been throttled at this level. */
+	list_for_each_entry_safe(p, tmp, &cfs_rq->throttled_limbo_list, throttle_node) {
+		list_del_init(&p->throttle_node);
+		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP);
+	}
+
+	/* Add cfs_rq with load or one or more already running entities to the list */
+	if (!cfs_rq_is_decayed(cfs_rq))
+		list_add_leaf_cfs_rq(cfs_rq);
+
 	return 0;
 }
 
@@ -5866,17 +5952,19 @@ static int tg_throttle_down(struct task_group *tg, void *data)
 	struct rq *rq = data;
 	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
 
+	if (cfs_rq->throttle_count++)
+		return 0;
+
 	/* group is entering throttled state, stop time */
-	if (!cfs_rq->throttle_count) {
-		cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
-		list_del_leaf_cfs_rq(cfs_rq);
+	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
 
-		WARN_ON_ONCE(cfs_rq->throttled_clock_self);
-		if (cfs_rq->nr_queued)
-			cfs_rq->throttled_clock_self = rq_clock(rq);
-	}
-	cfs_rq->throttle_count++;
+	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
+	if (cfs_rq->nr_queued)
+		cfs_rq->throttled_clock_self = rq_clock(rq);
+	else
+		list_del_leaf_cfs_rq(cfs_rq);
 
+	WARN_ON_ONCE(!list_empty(&cfs_rq->throttled_limbo_list));
 	return 0;
 }
 
@@ -5884,9 +5972,7 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	struct rq *rq = rq_of(cfs_rq);
 	struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
-	struct sched_entity *se;
-	long queued_delta, runnable_delta, idle_delta, dequeue = 1;
-	long rq_h_nr_queued = rq->cfs.h_nr_queued;
+	int dequeue = 1;
 
 	raw_spin_lock(&cfs_b->lock);
 	/* This will start the period timer if necessary */
@@ -5909,72 +5995,11 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
 	if (!dequeue)
 		return false;  /* Throttle no longer required. */
 
-	se = cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
-
 	/* freeze hierarchy runnable averages while throttled */
 	rcu_read_lock();
 	walk_tg_tree_from(cfs_rq->tg, tg_throttle_down, tg_nop, (void *)rq);
 	rcu_read_unlock();
 
-	queued_delta = cfs_rq->h_nr_queued;
-	runnable_delta = cfs_rq->h_nr_runnable;
-	idle_delta = cfs_rq->h_nr_idle;
-	for_each_sched_entity(se) {
-		struct cfs_rq *qcfs_rq = cfs_rq_of(se);
-		int flags;
-
-		/* throttled entity or throttle-on-deactivate */
-		if (!se->on_rq)
-			goto done;
-
-		/*
-		 * Abuse SPECIAL to avoid delayed dequeue in this instance.
-		 * This avoids teaching dequeue_entities() about throttled
-		 * entities and keeps things relatively simple.
-		 */
-		flags = DEQUEUE_SLEEP | DEQUEUE_SPECIAL;
-		if (se->sched_delayed)
-			flags |= DEQUEUE_DELAYED;
-		dequeue_entity(qcfs_rq, se, flags);
-
-		if (cfs_rq_is_idle(group_cfs_rq(se)))
-			idle_delta = cfs_rq->h_nr_queued;
-
-		qcfs_rq->h_nr_queued -= queued_delta;
-		qcfs_rq->h_nr_runnable -= runnable_delta;
-		qcfs_rq->h_nr_idle -= idle_delta;
-
-		if (qcfs_rq->load.weight) {
-			/* Avoid re-evaluating load for this entity: */
-			se = parent_entity(se);
-			break;
-		}
-	}
-
-	for_each_sched_entity(se) {
-		struct cfs_rq *qcfs_rq = cfs_rq_of(se);
-		/* throttled entity or throttle-on-deactivate */
-		if (!se->on_rq)
-			goto done;
-
-		update_load_avg(qcfs_rq, se, 0);
-		se_update_runnable(se);
-
-		if (cfs_rq_is_idle(group_cfs_rq(se)))
-			idle_delta = cfs_rq->h_nr_queued;
-
-		qcfs_rq->h_nr_queued -= queued_delta;
-		qcfs_rq->h_nr_runnable -= runnable_delta;
-		qcfs_rq->h_nr_idle -= idle_delta;
-	}
-
-	/* At this point se is NULL and we are at root level*/
-	sub_nr_running(rq, queued_delta);
-
-	/* Stop the fair server if throttling resulted in no runnable tasks */
-	if (rq_h_nr_queued && !rq->cfs.h_nr_queued)
-		dl_server_stop(&rq->fair_server);
-done:
 	/*
 	 * Note: distribution will already see us throttled via the
 	 * throttled-list.  rq->lock protects completion.
@@ -5990,9 +6015,20 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	struct rq *rq = rq_of(cfs_rq);
 	struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
-	struct sched_entity *se;
-	long queued_delta, runnable_delta, idle_delta;
-	long rq_h_nr_queued = rq->cfs.h_nr_queued;
+	struct sched_entity *se = cfs_rq->tg->se[cpu_of(rq)];
+
+	/*
+	 * It's possible we are called with !runtime_remaining due to things
+	 * like user changed quota setting(see tg_set_cfs_bandwidth()) or async
+	 * unthrottled us with a positive runtime_remaining but other still
+	 * running entities consumed those runtime before we reached here.
+	 *
+	 * Anyway, we can't unthrottle this cfs_rq without any runtime remaining
+	 * because any enqueue in tg_unthrottle_up() will immediately trigger a
+	 * throttle, which is not supposed to happen on unthrottle path.
+	 */
+	if (cfs_rq->runtime_enabled && cfs_rq->runtime_remaining <= 0)
+		return;
 
 	se = cfs_rq->tg->se[cpu_of(rq)];
 
@@ -6022,62 +6058,8 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 			if (list_add_leaf_cfs_rq(cfs_rq_of(se)))
 				break;
 		}
-		goto unthrottle_throttle;
-	}
-
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
 	}
 
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
@@ -6733,6 +6715,8 @@ static inline void sync_throttle(struct task_group *tg, int cpu) {}
 static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
 static void task_throttle_setup_work(struct task_struct *p) {}
 static bool task_is_throttled(struct task_struct *p) { return false; }
+static void dequeue_throttled_task(struct task_struct *p, int flags) {}
+static bool enqueue_throttled_task(struct task_struct *p) { return false; }
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
@@ -6925,6 +6909,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	int rq_h_nr_queued = rq->cfs.h_nr_queued;
 	u64 slice = 0;
 
+	if (unlikely(task_is_throttled(p) && enqueue_throttled_task(p)))
+		return;
+
 	/*
 	 * The code below (indirectly) updates schedutil which looks at
 	 * the cfs_rq utilization to select a frequency.
@@ -6977,10 +6964,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = 1;
 
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			goto enqueue_throttle;
-
 		flags = ENQUEUE_WAKEUP;
 	}
 
@@ -7002,10 +6985,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = 1;
-
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			goto enqueue_throttle;
 	}
 
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued) {
@@ -7035,7 +7014,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (!task_new)
 		check_update_overutilized_status(rq);
 
-enqueue_throttle:
 	assert_list_leaf_cfs_rq(rq);
 
 	hrtick_update(rq);
@@ -7091,10 +7069,6 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
 
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			return 0;
-
 		/* Don't dequeue parent if it has other entities besides us */
 		if (cfs_rq->load.weight) {
 			slice = cfs_rq_min_slice(cfs_rq);
@@ -7131,10 +7105,6 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
-
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			return 0;
 	}
 
 	sub_nr_running(rq, h_nr_queued);
@@ -7171,6 +7141,11 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
  */
 static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 {
+	if (unlikely(task_is_throttled(p))) {
+		dequeue_throttled_task(p, flags);
+		return true;
+	}
+
 	if (!p->se.sched_delayed)
 		util_est_dequeue(&rq->cfs, p);
 
@@ -8836,19 +8811,22 @@ static struct task_struct *pick_task_fair(struct rq *rq)
 {
 	struct sched_entity *se;
 	struct cfs_rq *cfs_rq;
+	struct task_struct *p;
+	bool throttled;
 
 again:
 	cfs_rq = &rq->cfs;
 	if (!cfs_rq->nr_queued)
 		return NULL;
 
+	throttled = false;
+
 	do {
 		/* Might not have done put_prev_entity() */
 		if (cfs_rq->curr && cfs_rq->curr->on_rq)
 			update_curr(cfs_rq);
 
-		if (unlikely(check_cfs_rq_runtime(cfs_rq)))
-			goto again;
+		throttled |= check_cfs_rq_runtime(cfs_rq);
 
 		se = pick_next_entity(rq, cfs_rq);
 		if (!se)
@@ -8856,7 +8834,10 @@ static struct task_struct *pick_task_fair(struct rq *rq)
 		cfs_rq = group_cfs_rq(se);
 	} while (cfs_rq);
 
-	return task_of(se);
+	p = task_of(se);
+	if (unlikely(throttled))
+		task_throttle_setup_work(p);
+	return p;
 }
 
 static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool first);
-- 
2.39.5

