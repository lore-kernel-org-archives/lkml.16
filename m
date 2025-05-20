Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512FC270570
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737709; cv=none; b=n9zzRMel81BPHxRF5h1nbnpAV2UU8e1ZmMPHBHphc9lx8VMthlrwh5pMiYxC8sCCH/iVo+7H2kXnjmrv7Mml1Rn+oUNHPmMDIPrJnJlk+hT4DJ/BWS3MkvpwlL15f0HOiDAv/KNdVyU7kheSt/MIO3f2n58R7/KbNCJ5zCU/iXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737709; c=relaxed/simple;
	bh=9AGJ4GxlRpshblPLOwtf4kmR6xioUmQ01bwBZpPUGqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aNCH4ziZ1br76Vd0034DXNPt3D/6CydG5Gsl7mdInhw9gdiHk+wR/PP4c84xOVrk9bUMZlsh93+uOTMcUdNepjJ1ulI7BhU0BnTrYaAYtca6njfTeDjvHsgb3HfXDrbH0f/YrY0qlDpU40RoOT5yh2SvHmAILrswkxFvJOGwT9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ma7Lc3Hi; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ma7Lc3Hi"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30e8f4dbb72so4306704a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747737706; x=1748342506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKI6AvJAKm0q4V9pf0FaG1/k8HhhTM3e80N6uB0ow4E=;
        b=Ma7Lc3HilydISockeP2i7hzKZPuY8r4UNYe96Pna8kDHpMQr/ycKDQzPNZFajIj4lj
         1W24ABoAQMxMCl8h2drG5b+fR6xD9XnG/Wq9J9TA7Nvnz+NT71sqHYHONlj0fD9kYAU+
         6BqJesvWrkqebigGT6vSqUPa3a5Q0lpuq+SPTohjm8JsPyqmjSvXKs5m7PCYuwweJdmq
         /uTKJpc3raKXjtm30MmpbLMtvVJqI51sVPIyw01XTpS/HttgjLT69gujsMzMMePhALaH
         sScuR+/GfjBy1E/IbR/2M0E70ntmRPxKQnOq1E7gMfLWyUK7QVwPMsy0G+h8v8J69Tv5
         AyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737706; x=1748342506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKI6AvJAKm0q4V9pf0FaG1/k8HhhTM3e80N6uB0ow4E=;
        b=wvbUbsNeU27rA24P0AjiRclZps0FFNfa+/BfjW1PY4T4SmS+MychTxkuXRDGeQrM/E
         OPg+6b2SivhDy4WpnZhqH2bXqPF5L3JwA1/Zky05u7DrVkgjaDx1dTOn0d4MjZ2HnSgN
         rIkgqYUwx8Si+FPd8/vAtXhqDuwEyalGQy/if4m2j+ETacEHl/o/bQH3Ybeb5ibAH3BD
         tlo/dFD/DQMVQP7y3QjUDCMzJm8s6Bzv6HhCRE4bDMoNO7NvPNJsBS4+34YUFfy97wdH
         1v+7EnOZqAVQS6fpDz21Go8qpiUnwuLC3tohyPZ09NiI+rpxNvJE3BV9xKd5XNuVWrYm
         TT9w==
X-Gm-Message-State: AOJu0YyWHbgB2SdU9ebw648GAN8JgPIfBu7FGXTVLlWO6/DCFLwI/YZi
	7SRz12ksdfG15LYvBLk/B4cypV4CQUkWKsNyVD3YqyQrOFCiPwZJyaerFYxnGkb59Q==
X-Gm-Gg: ASbGnctCUidbg5bdIJFhTFPMTKHQDTR54a3MmgNqW/zslqh8OpRJEuI122cK0Yq9nKF
	ssZeiGNjDUssPGnCxGTe1LAK+mw0yIA3wgpbsQsZA8aI1zLRIMLZzFnC3diCzjREe8/QvLU5trk
	mI0fb+Da/rCWcTH4V+arF3rTUc3uUOK2WMJ80f+3b/L0R6M+3BKeqhELz3L4q50MlHzJvg/t3FZ
	xQSUgfW98DS6mFGbx37KjxkBSTgaDpI72Hi+l2jURyOp4dU6rj2I5yN18m6hDRsnVMOSu/2XrNX
	FHVVXMBTRl9lykomUcEJdfSAqsS3bzm5uluTc5uSFcNW950DS94AbcglgtqfGFzcWNM=
X-Google-Smtp-Source: AGHT+IH/PtwPd1mgjYXQvnL4fwIENCrgk+qMTuNxVA/gY12kivs7np2kOcCvSnKID14pDW2p8TjTwQ==
X-Received: by 2002:a17:90b:5407:b0:309:f53c:b0a0 with SMTP id 98e67ed59e1d1-30e83225857mr23064769a91.24.1747737706371;
        Tue, 20 May 2025 03:41:46 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5d31sm1359431a91.38.2025.05.20.03.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:41:45 -0700 (PDT)
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
Subject: [PATCH 2/7] sched/fair: prepare throttle path for task based throttle
Date: Tue, 20 May 2025 18:41:05 +0800
Message-Id: <20250520104110.3673059-3-ziqianlu@bytedance.com>
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

In current throttle model, when a cfs_rq is throttled, its entity will
be dequeued from cpu's rq, making tasks attached to it not able to run,
thus achiveing the throttle target.

This has a drawback though: assume a task is a reader of percpu_rwsem
and is waiting. When it gets wakeup, it can not run till its task group's
next period comes, which can be a relatively long time. Waiting writer
will have to wait longer due to this and it also makes further reader
build up and eventually trigger task hung.

To improve this situation, change the throttle model to task based, i.e.
when a cfs_rq is throttled, record its throttled status but do not remove
it from cpu's rq. Instead, for tasks that belong to this cfs_rq, when
they get picked, add a task work to them so that when they return
to user, they can be dequeued. In this way, tasks throttled will not
hold any kernel resources.

To avoid breaking bisect, preserve the current throttle behavior by
still dequeuing throttled hierarchy from rq and because of this, no task
can have that throttle task work added yet. The throttle model will
switch to task based in a later patch.

Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # tag on pick
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c  | 88 +++++++++++++++++++++++++++++++++++++++-----
 kernel/sched/sched.h |  1 +
 2 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 75bf6186a5137..e87ceb0a2d37f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5825,8 +5825,47 @@ static inline int throttled_lb_pair(struct task_group *tg,
 	       throttled_hierarchy(dest_cfs_rq);
 }
 
+static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
 static void throttle_cfs_rq_work(struct callback_head *work)
 {
+	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
+	struct sched_entity *se;
+	struct cfs_rq *cfs_rq;
+	struct rq *rq;
+
+	WARN_ON_ONCE(p != current);
+	p->sched_throttle_work.next = &p->sched_throttle_work;
+
+	/*
+	 * If task is exiting, then there won't be a return to userspace, so we
+	 * don't have to bother with any of this.
+	 */
+	if ((p->flags & PF_EXITING))
+		return;
+
+	scoped_guard(task_rq_lock, p) {
+		se = &p->se;
+		cfs_rq = cfs_rq_of(se);
+
+		/* Raced, forget */
+		if (p->sched_class != &fair_sched_class)
+			return;
+
+		/*
+		 * If not in limbo, then either replenish has happened or this
+		 * task got migrated out of the throttled cfs_rq, move along.
+		 */
+		if (!cfs_rq->throttle_count)
+			return;
+		rq = scope.rq;
+		update_rq_clock(rq);
+		WARN_ON_ONCE(!list_empty(&p->throttle_node));
+		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
+		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
+		resched_curr(rq);
+	}
+
+	cond_resched_tasks_rcu_qs();
 }
 
 void init_cfs_throttle_work(struct task_struct *p)
@@ -5866,21 +5905,42 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
 	return 0;
 }
 
+static inline bool task_has_throttle_work(struct task_struct *p)
+{
+	return p->sched_throttle_work.next != &p->sched_throttle_work;
+}
+
+static inline void task_throttle_setup_work(struct task_struct *p)
+{
+	if (task_has_throttle_work(p))
+		return;
+
+	/*
+	 * Kthreads and exiting tasks don't return to userspace, so adding the
+	 * work is pointless
+	 */
+	if ((p->flags & (PF_EXITING | PF_KTHREAD)))
+		return;
+
+	task_work_add(p, &p->sched_throttle_work, TWA_RESUME);
+}
+
 static int tg_throttle_down(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
 	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
 
+	cfs_rq->throttle_count++;
+	if (cfs_rq->throttle_count > 1)
+		return 0;
+
 	/* group is entering throttled state, stop time */
-	if (!cfs_rq->throttle_count) {
-		cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
-		list_del_leaf_cfs_rq(cfs_rq);
+	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
+	list_del_leaf_cfs_rq(cfs_rq);
 
-		WARN_ON_ONCE(cfs_rq->throttled_clock_self);
-		if (cfs_rq->nr_queued)
-			cfs_rq->throttled_clock_self = rq_clock(rq);
-	}
-	cfs_rq->throttle_count++;
+	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
+	if (cfs_rq->nr_queued)
+		cfs_rq->throttled_clock_self = rq_clock(rq);
 
 	return 0;
 }
@@ -6575,6 +6635,7 @@ static void init_cfs_rq_runtime(struct cfs_rq *cfs_rq)
 	cfs_rq->runtime_enabled = 0;
 	INIT_LIST_HEAD(&cfs_rq->throttled_list);
 	INIT_LIST_HEAD(&cfs_rq->throttled_csd_list);
+	INIT_LIST_HEAD(&cfs_rq->throttled_limbo_list);
 }
 
 void start_cfs_bandwidth(struct cfs_bandwidth *cfs_b)
@@ -6744,6 +6805,7 @@ static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
 static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
 static inline void sync_throttle(struct task_group *tg, int cpu) {}
 static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
+static void task_throttle_setup_work(struct task_struct *p) {}
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
@@ -8851,6 +8913,7 @@ static struct task_struct *pick_task_fair(struct rq *rq)
 {
 	struct sched_entity *se;
 	struct cfs_rq *cfs_rq;
+	struct task_struct *p;
 
 again:
 	cfs_rq = &rq->cfs;
@@ -8871,7 +8934,14 @@ static struct task_struct *pick_task_fair(struct rq *rq)
 		cfs_rq = group_cfs_rq(se);
 	} while (cfs_rq);
 
-	return task_of(se);
+	p = task_of(se);
+	if (throttled_hierarchy(cfs_rq_of(se))) {
+		/* Shuold not happen for now */
+		WARN_ON_ONCE(1);
+		task_throttle_setup_work(p);
+	}
+
+	return p;
 }
 
 static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool first);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 921527327f107..83f16fc44884f 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -736,6 +736,7 @@ struct cfs_rq {
 	int			throttle_count;
 	struct list_head	throttled_list;
 	struct list_head	throttled_csd_list;
+	struct list_head        throttled_limbo_list;
 #endif /* CONFIG_CFS_BANDWIDTH */
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 };
-- 
2.39.5

