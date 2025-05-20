Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D85F2741CA
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737715; cv=none; b=QDAvSxgLC1INI+MCUJpJgXCiHYapXtnMtdQK9EB4potrxdhylaubtixsFSQVycQ2gg2ThtAFXPHnWadVfSq8RyBsNeya2/YC/1VwvJwvhahE23z9R6H27EOpGOQplqOq9bCmnc4ODD1wdin6HQXs3kMlbjFsHBgGyUGKbJAQ1sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737715; c=relaxed/simple;
	bh=Yi3quYVqyCI1bbWOlHM5FspDzUGMS3vBIi76r6QnT34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H2xGISo6Fxa7/ugBnS/4a+h5sP0PFp1b8YhMU8t4hCxX75xmvL1uDPvA04PjSQRSFZ9jHShD89qaU1KZjO/y8Y++3jXrLXSWh/y/TEn5OyXypshm6+NPv7pl7HO5M3aGJDY7AHuXrkE5M/IB3Lz2Veo0Ok+2H7WSwu0WdWstSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OL0ykUeL; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OL0ykUeL"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736c277331eso5699892b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747737712; x=1748342512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gGyT2TBYGGTLbruyOBVqMqc5c3gyEsAoJSjXYUgjR0=;
        b=OL0ykUeLMrUYemVnmd6Dwoe/Hj1em6o3olq9nZvHCvrDMFQEVv+awmJ/dshJefa/Jg
         uD5YvMAONRzeIsuDU2anbkKgChHaR8p08qVzeBSsnVTKZW2XN3HlA0X4u5nc6h73qCyg
         uy07a3zL/NdhiRtfX2a4jwzpqxEHBkGqlx0IdCCFTwZzQdVp8GMj4gFdKnjQD6EhMxi5
         3LjTiJ5UI2ZpDuAwGBLaomMKY8Xa+be+rH/ZBIiyGUgkX1bv7UAyLdDRZy2/3Kch1SWW
         IRsXDlupNqVjszKEHc6j6/Y2143bf+IcWV76tADyKxGJHJt+w0dhMd0+Pjs0pdEtP7lG
         viSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737712; x=1748342512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gGyT2TBYGGTLbruyOBVqMqc5c3gyEsAoJSjXYUgjR0=;
        b=NcmP0gbfvRdBQecAWrUwTb1u71qqiEO+KkA4gxBQhme/ZAHJRX2E7M4m0LAWLfLuUi
         vcEsUmtHNKYFB+BmNYrl3uI8d/skAAPhBkdhhb9MoocQHkRusRNVliVeBfDFvdCctSoM
         sq0xLXNfPTbd822bG3TsqaGyzXwD18rf/1ubUkC6HSFR371RpQ6X24xcOBy2OUT4ZACt
         pBtERRwiTcDu2Q5fWJjL8ThxUD2DhR3qX8zi/hh7Jw5XioinpA6kFOJ48yhHYX91HW+M
         CLb5WT/Mi48M6m56k1lMkMOkNd+wo7BWnNxdImO6LTf5E/O+vSCsildLa7orHL1DmDNO
         MQFw==
X-Gm-Message-State: AOJu0YxltYQ05DswarKMZOBS/z9sYp2tdH0bIrFxc/aHXLEVgIjvH+AV
	ACnSJYgs+jq0E1dZUZ/6iMAmc11G3yKCF/W2/QyeyAIcpnoUte9N7vVAx3ArI+qcmw==
X-Gm-Gg: ASbGnctrQqEHaOhDuuhw6xiYMHunPW3/pIOTlDNlqV3S+tIpLV8bG7Oku0lpwBgLxxJ
	esslg4qLaFCdho5erZ7HMN9NnXNl0+2aykV81CSeKV79P6jgdYpJ1lq8FvzWYnlDXC4pL4oMgyt
	fJdSpPUrrlwaaK8wWCwwYQtI0I6rN9PYJhl5W0KBZDWUmggGblK2jndHfeG4dC6oNRkh3TnZV3A
	iMjD3+jpGpmTazhDTVQSpW7TP8JN1KUZLZzAaiSapNX+i93CjKnexU9GKt5VwWjeP/qzKeGKNhk
	YZvf+SP51RjvnyV/OjaMZKF8V8Da16hUFL5g9AGf8UW+eNJGhyaVgX8ZUC6rVhprnck=
X-Google-Smtp-Source: AGHT+IENNcTSUwnsI+Z9AsK6+k8fGvZRH8A165FYAKbqg0IwJSc5LyI8x210CGvJR9VhZ9zm/LjCHw==
X-Received: by 2002:a05:6a20:c707:b0:218:183b:ccaa with SMTP id adf61e73a8af0-218183bd4e6mr17182557637.17.1747737712352;
        Tue, 20 May 2025 03:41:52 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5d31sm1359431a91.38.2025.05.20.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:41:52 -0700 (PDT)
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
Subject: [PATCH 3/7] sched/fair: prepare unthrottle path for task based throttle
Date: Tue, 20 May 2025 18:41:06 +0800
Message-Id: <20250520104110.3673059-4-ziqianlu@bytedance.com>
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

During unthrottle, enqueued back throttled tasks so that they can
resume execution.

This patch only sets up the enqueue mechanism; it does not take effect
yet because no tasks in the throttled hierarchy are placed on the limbo
list as of now.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c | 55 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e87ceb0a2d37f..74bc320cbc238 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5825,6 +5825,11 @@ static inline int throttled_lb_pair(struct task_group *tg,
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
@@ -5876,32 +5881,41 @@ void init_cfs_throttle_work(struct task_struct *p)
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
 
@@ -6059,6 +6073,19 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 	long queued_delta, runnable_delta, idle_delta;
 	long rq_h_nr_queued = rq->cfs.h_nr_queued;
 
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
+
 	se = cfs_rq->tg->se[cpu_of(rq)];
 
 	cfs_rq->throttled = 0;
@@ -6806,6 +6833,7 @@ static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
 static inline void sync_throttle(struct task_group *tg, int cpu) {}
 static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
 static void task_throttle_setup_work(struct task_struct *p) {}
+static bool task_is_throttled(struct task_struct *p) { return false; }
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
@@ -7014,6 +7042,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		util_est_enqueue(&rq->cfs, p);
 
 	if (flags & ENQUEUE_DELAYED) {
+		WARN_ON_ONCE(task_is_throttled(p));
 		requeue_delayed_entity(se);
 		return;
 	}
-- 
2.39.5

