Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A286727B4E2
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737727; cv=none; b=ROQn8WveoPkWqPlxtisEGGD5ZY9/+iHJ4Njxh/3mowLpKaAMPyIjxKfU2TxihBRsZl7kfRYvzyp/Jrymv/vJ4j/S9QKB7N+lRx2GHssRfEujBTbGRAB8w8oS3BKEMqk35WEQvsPluLZkMcXIVFZSv8s/P35/LuKBqi5BqOVgRtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737727; c=relaxed/simple;
	bh=f3NI11wY3c8+57II55JXOvfFx2iJFNe4gCEH05S+EDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VO1/iY+GsxSMuwDlrGT8GH4IuaR+pup34TwXk6kYMqYZczxuzjIfZuOP7ibUVqE8JDA2P0l2lSF5PlwFA4jo6Kpyi2Z3CVE27XVH4/h0Yqrp3qTPW3iFtvWbp0JlJvzXM/8/Tc2qf0PNiv/8ncYrAMrscQPjWz+Y6N2zHumFCbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=S4CIJvaS; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="S4CIJvaS"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30e8f4dbb72so4307124a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747737725; x=1748342525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGNKviJzaWhadrTdDs2rGTaET3ATkPE7R4ubBwCoT3Y=;
        b=S4CIJvaSTLSiOZIzMFShdlZNKd3Oc4vVbNjWxAhxxgoeQbssQynSzej+gXReFFPEhD
         QhAXhvu14TukJat8vePo5dt9LbVMB5Me5vgIG2HDNXVkDcAhY+bvDpeky3JJY2IoZxDq
         G2Z/aH3wSnU5oyybppqu8S2YY4acTVn/XEKTJ88xo6LDUqOgK9qY+99ryK7aPSxwpZg/
         L0qzU7Hf9rbzZUOnFCQ/9aAQyzDVp/zSHa6qrF1TPvA0t3XQRHJyUWV5CkfltZDpTRlx
         bac56HONiBaMB4u7t0RIPby+7bcX/wISnhmapoZnCqqRg4ucu0cY7Q7ct9ZkVkt0L4ue
         5m7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737725; x=1748342525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGNKviJzaWhadrTdDs2rGTaET3ATkPE7R4ubBwCoT3Y=;
        b=H/ie5QbbPB5XMUh4D6AMSUjk7kpQafIHt7Xo3hHk8281xqgO2N539X0//t9sl0Xli4
         mcc9Ff5PDsoSDAIcP0Ado+zzhVggxafEMeLsnU2y+MCCrIFUh5ESFZQ9SAQMg3+9ATb/
         xbG5YnDXXjQnLyVATtrTVuDM95NXPTgB3CW+1v3TOn5B6OpnWGSaeKQMWegWUKWlAznC
         Cx+VsH15IsOc5L/hJsk5KDLCIai/76i/s7Fq32gl9GV7uUenKLfAJA36lnUcgegeYSMF
         7Evy+3EaICOXLrKIbTsBhzOG/06nTq/v/fBM0Y6GgC2Qj3IMD5q3MOHgBhjyrU4M2EAf
         b4KA==
X-Gm-Message-State: AOJu0YztVupWlvzXdzBDKR+T6gKnnNIEHrcOlUfBHDF1Ty0wUmdk9VHL
	o2kLSs7ZhpbJwPishoznDbPswaBBN/oXoUNrEGUKXrJQn859rCKDAsz7ZwzANVWRIw==
X-Gm-Gg: ASbGncs4ywe0tnS5hkXdAZk0qpSu4ktmOGY9QY/hGKBvzzw9NuDwlWUnDD4WrP1welj
	gRtkVK3i+7GTKMnDgcQ1+34WGjkT2cB2bftrDBnpIqo8ylDQxwLBp741T2IfehD/xbGaqz1sS0A
	UnQ9TRybxDBuMx3YsMiCfGrgvmQJnBYptHr+Gz3Sq3ZWlVRUr23CA4ICTczZJpKTwI97xr9d2Qx
	ZGNDDQNlgR+cpyDIYA+iye1pyH2pgiUl0lesyhxnJSWklADwYOmk6TwanQHyqORdolq6KFaUTjt
	0YhsDVWbqD1aAVYqM29Ps82FmGiz7bQBQgZAgwgCm6N6q2Y8G6uc+3U0uQLKZPZrQCE=
X-Google-Smtp-Source: AGHT+IFRYqXeyuRE9uH0d/fZONsHwBwYJVUQxmwaod5YhfMdNCz4cup1gdbEkeUDcCoigoP103ai4g==
X-Received: by 2002:a17:90b:4b82:b0:2ff:6f88:b04a with SMTP id 98e67ed59e1d1-30e8314d95bmr23728515a91.15.1747737724595;
        Tue, 20 May 2025 03:42:04 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5d31sm1359431a91.38.2025.05.20.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:42:04 -0700 (PDT)
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
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 5/7] sched/fair: switch to task based throttle model
Date: Tue, 20 May 2025 18:41:08 +0800
Message-Id: <20250520104110.3673059-6-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520104110.3673059-1-ziqianlu@bytedance.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Valentin Schneider <vschneid@redhat.com>

Now with all the preparatory work in place, switch to task based
throttle model by:
- on throttle time, do not remove the hierarchy in runqueue but rely on
  task work added in pick_task_fair() to do the actual throttle/dequeue
  in task's ret2user path;
- on unthrottle, enqueue back those throttled tasks on limbo list.

Since throttle_cfs_rq() no longer remove the hierarchy from rq, its
return value is not needed. Same for check_cfs_rq_runtime().

Throttled cfs_rq's leaf_cfs_rq_list is handled differently now: since a
task can be enqueued to a throttled cfs_rq and gets to run, to not break
the assert_list_leaf_cfs_rq() in enqueue_task_fair(), always add it to
leaf cfs_rq list when it has its first entity enqueued and delete it
from leaf cfs_rq list when it has no tasks enqueued.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c | 188 ++++++--------------------------------------
 1 file changed, 24 insertions(+), 164 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4c66fd8d24389..a968d334e8730 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5359,18 +5359,17 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 
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
 
@@ -5409,8 +5408,6 @@ static void set_delayed(struct sched_entity *se)
 		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
 		cfs_rq->h_nr_runnable--;
-		if (cfs_rq_throttled(cfs_rq))
-			break;
 	}
 }
 
@@ -5431,8 +5428,6 @@ static void clear_delayed(struct sched_entity *se)
 		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
 		cfs_rq->h_nr_runnable++;
-		if (cfs_rq_throttled(cfs_rq))
-			break;
 	}
 }
 
@@ -5518,8 +5513,11 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
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
@@ -5600,7 +5598,7 @@ pick_next_entity(struct rq *rq, struct cfs_rq *cfs_rq)
 	return se;
 }
 
-static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq);
+static void check_cfs_rq_runtime(struct cfs_rq *cfs_rq);
 
 static void put_prev_entity(struct cfs_rq *cfs_rq, struct sched_entity *prev)
 {
@@ -5968,22 +5966,22 @@ static int tg_throttle_down(struct task_group *tg, void *data)
 
 	/* group is entering throttled state, stop time */
 	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
-	list_del_leaf_cfs_rq(cfs_rq);
 
 	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
 	if (cfs_rq->nr_queued)
 		cfs_rq->throttled_clock_self = rq_clock(rq);
+	else
+		list_del_leaf_cfs_rq(cfs_rq);
 
+	WARN_ON_ONCE(!list_empty(&cfs_rq->throttled_limbo_list));
 	return 0;
 }
 
-static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
+static void throttle_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	struct rq *rq = rq_of(cfs_rq);
 	struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
-	struct sched_entity *se;
-	long queued_delta, runnable_delta, idle_delta, dequeue = 1;
-	long rq_h_nr_queued = rq->cfs.h_nr_queued;
+	int dequeue = 1;
 
 	raw_spin_lock(&cfs_b->lock);
 	/* This will start the period timer if necessary */
@@ -6004,74 +6002,13 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
 	raw_spin_unlock(&cfs_b->lock);
 
 	if (!dequeue)
-		return false;  /* Throttle no longer required. */
-
-	se = cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
+		return;  /* Throttle no longer required. */
 
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
@@ -6080,16 +6017,14 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
 	WARN_ON_ONCE(cfs_rq->throttled_clock);
 	if (cfs_rq->nr_queued)
 		cfs_rq->throttled_clock = rq_clock(rq);
-	return true;
+	return;
 }
 
 void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	struct rq *rq = rq_of(cfs_rq);
 	struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
-	struct sched_entity *se;
-	long queued_delta, runnable_delta, idle_delta;
-	long rq_h_nr_queued = rq->cfs.h_nr_queued;
+	struct sched_entity *se = cfs_rq->tg->se[cpu_of(rq)];
 
 	/*
 	 * It's possible we are called with !runtime_remaining due to things
@@ -6132,62 +6067,8 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
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
@@ -6569,22 +6450,22 @@ static void sync_throttle(struct task_group *tg, int cpu)
 }
 
 /* conditionally throttle active cfs_rq's from put_prev_entity() */
-static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq)
+static void check_cfs_rq_runtime(struct cfs_rq *cfs_rq)
 {
 	if (!cfs_bandwidth_used())
-		return false;
+		return;
 
 	if (likely(!cfs_rq->runtime_enabled || cfs_rq->runtime_remaining > 0))
-		return false;
+		return;
 
 	/*
 	 * it's possible for a throttled entity to be forced into a running
 	 * state (e.g. set_curr_task), in this case we're finished.
 	 */
 	if (cfs_rq_throttled(cfs_rq))
-		return true;
+		return;
 
-	return throttle_cfs_rq(cfs_rq);
+	throttle_cfs_rq(cfs_rq);
 }
 
 static enum hrtimer_restart sched_cfs_slack_timer(struct hrtimer *timer)
@@ -6846,7 +6727,7 @@ static void sched_fair_update_stop_tick(struct rq *rq, struct task_struct *p)
 #else /* CONFIG_CFS_BANDWIDTH */
 
 static void account_cfs_rq_runtime(struct cfs_rq *cfs_rq, u64 delta_exec) {}
-static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
+static void check_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
 static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
 static inline void sync_throttle(struct task_group *tg, int cpu) {}
 static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
@@ -7104,10 +6985,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = 1;
 
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			goto enqueue_throttle;
-
 		flags = ENQUEUE_WAKEUP;
 	}
 
@@ -7129,10 +7006,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = 1;
-
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			goto enqueue_throttle;
 	}
 
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued) {
@@ -7162,7 +7035,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (!task_new)
 		check_update_overutilized_status(rq);
 
-enqueue_throttle:
 	assert_list_leaf_cfs_rq(rq);
 
 	hrtick_update(rq);
@@ -7220,10 +7092,6 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
 
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			return 0;
-
 		/* Don't dequeue parent if it has other entities besides us */
 		if (cfs_rq->load.weight) {
 			slice = cfs_rq_min_slice(cfs_rq);
@@ -7260,10 +7128,6 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
-
-		/* end evaluation on encountering a throttled cfs_rq */
-		if (cfs_rq_throttled(cfs_rq))
-			return 0;
 	}
 
 	sub_nr_running(rq, h_nr_queued);
@@ -8978,8 +8842,7 @@ static struct task_struct *pick_task_fair(struct rq *rq)
 		if (cfs_rq->curr && cfs_rq->curr->on_rq)
 			update_curr(cfs_rq);
 
-		if (unlikely(check_cfs_rq_runtime(cfs_rq)))
-			goto again;
+		check_cfs_rq_runtime(cfs_rq);
 
 		se = pick_next_entity(rq, cfs_rq);
 		if (!se)
@@ -8988,11 +8851,8 @@ static struct task_struct *pick_task_fair(struct rq *rq)
 	} while (cfs_rq);
 
 	p = task_of(se);
-	if (throttled_hierarchy(cfs_rq_of(se))) {
-		/* Shuold not happen for now */
-		WARN_ON_ONCE(1);
+	if (throttled_hierarchy(cfs_rq_of(se)))
 		task_throttle_setup_work(p);
-	}
 
 	return p;
 }
-- 
2.39.5

