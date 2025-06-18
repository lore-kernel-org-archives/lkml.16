Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ADA27EFF1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234821; cv=none; b=jPBBXDXH1dRJYsmm3x2Mc5SUTGbv/7KbHshxOprxxSryojwEyvShwX6b7v1vjFTckJXt+ZqRx65TjIj7FXUCTpZ5gKRAeRxib+qFt1XF565ZyXFZ57BsI6qduA2D/GaCI5zeLIMjW9DYzFY+12XCXcXUgkEejTPJw2zrh5c6cbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234821; c=relaxed/simple;
	bh=7y6HZaSPKNRJy1JaP9jWDuQpqU+u3oSJyopNMN65hZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JJwGqm/RsD+K6cCMSx4tTrUWCfheGlC5H7Dq2H9HTnOR3xFXlbfT3+8GxA0ld4XHLtjHeTQKJXC/oNxphSMA+R3qFlWyPYlRi7D1yEEL9mZZLy8mSOw6jZDVPlJXZnQ5pTls7ze98X+rWq6RNjPFsd6nucQZoSWg+4ZaIEsjuXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=B9Qop6hi; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="B9Qop6hi"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so6117828a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750234819; x=1750839619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZsKU8S+9M3jyPQspID+7IQD7NJj5OgiHkX2wV4OkrI=;
        b=B9Qop6hiIA2gFz+Ez7DAYMp8lX7Jit7HKZboYLAqusgfezg5qTcws75rId9xNNrgGv
         N00O6tnm+pZBwHzYvzi2DgT7/zELxRSNj7O4b+gyzQMBUxO4Vy+J93UjK9CuZiQ4KzRw
         KOkfeq5l10RVT3lalXVeRtZIrp1ZpM/ehHVDNrqjO6485d1fhXbQHYmU79fSrYhZPR8a
         au37POqYtAncIwJ7/7Sm4oKUcG0POvuddhiDMrj/+DrgHZl1UU0Jkc/B9ZOuZbwOdMEe
         a8k1IpUsgKhs192/5juJOc3N2K7OD9Tk52PAz81mFjOcTXBLIYnEC0m5MpqAm1MXchDA
         g8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234819; x=1750839619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZsKU8S+9M3jyPQspID+7IQD7NJj5OgiHkX2wV4OkrI=;
        b=kQgtNI4eGbAmlj/9vxomle39wdZ1B5fOacTsGT45OylqC30EgIs9jPOItXTM2YuB/m
         xnLXId/hKb5I7fP9ete8nabw31FFT7GaKW1go1UzkwFMrMa9Pjm/fuJxQL637NhlDM9b
         CY9YaF1hLVvWz3M4RIdB/ZvqVcBqollIO3Kk0VUXH7Yxvu+KvvDJiKraS4dO1Bn1cNO1
         OHh30wqq1b/fd6OayoSekWypFyHhQZO1HdtzK6nZBj97z04uXUpzd4oSSzbBvGswf2Qq
         AQly0eQUcNta6uroEbIDeVWBzi6MS3Bk14V079iPfclB05aT9CK0r5ynglx0BgH5B4GZ
         Xhuw==
X-Gm-Message-State: AOJu0Yx+AovemAZmtDrYSiIy6F3uXZneC7/UpJgh3SykdTW0z1tPZe4B
	TcH4j9VMFyfVlW601rhkiXZ4+oSGSXH0A2V/+PWMt0Pmzd96X0lyXdwdvk/+uXydQg==
X-Gm-Gg: ASbGncvQbMxz2vygVdPMPTXKvMZy4tyY5rZOi8eGaD6+/QDQ33x1Z7Ln1zNTfuoNwSD
	SxrE6L+wbPTfzE+qJCZtcHNEhAU1FUnWiOkEQP/9/im2Mix3k233i3gd5ifVfg6d3As6qNaKUju
	Pr++kmOTVgOzUGBQqAYodx35LWrqHLbRCW9c6XtES/Kh+956kTz0S97uP81MNHCuYQRUoqEooxz
	SJgKyrTbnOzFY2pvQv1U46SPkLydlmUH1vvVtujX5Sn1WPMpfbhHXJlriD01RIDy5iUuMn6AP7A
	f5A2VqYPO+8TXdHRDHhog2cxk/+vO7q0dMzVl3nn37vYXSPcOz2yYtxql1mg3yo7Jke+q19jDiA
	WkfVLcAag8GDO/arKd18MsQmzs71X8MPd
X-Google-Smtp-Source: AGHT+IFupeInnX7DECfQyAU8PgaGQgMoGT6WGpX7zVeJF1Angiw7xI6NXHKjJPDjUqJFePh2T5+EGQ==
X-Received: by 2002:a05:6a20:cd92:b0:219:935a:6e1e with SMTP id adf61e73a8af0-21fbd559011mr24018556637.26.1750234818843;
        Wed, 18 Jun 2025 01:20:18 -0700 (PDT)
Received: from 5CG4011XCS-JQI.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1691d7fsm10432084a12.69.2025.06.18.01.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:20:18 -0700 (PDT)
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
Subject: [PATCH v2 2/5] sched/fair: Implement throttle task work and related helpers
Date: Wed, 18 Jun 2025 16:19:37 +0800
Message-Id: <20250618081940.621-3-ziqianlu@bytedance.com>
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

Implement throttle_cfs_rq_work() task work which gets executed on task's
ret2user path where the task is dequeued and marked as throttled.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f7b8597bc95ac..8226120b8771a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5757,8 +5757,51 @@ static inline int throttled_lb_pair(struct task_group *tg,
 	       throttled_hierarchy(dest_cfs_rq);
 }
 
+static inline bool task_is_throttled(struct task_struct *p)
+{
+	return p->throttled;
+}
+
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
+		WARN_ON_ONCE(p->throttled || !list_empty(&p->throttle_node));
+		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
+		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
+		p->throttled = true;
+		resched_curr(rq);
+	}
 }
 
 void init_cfs_throttle_work(struct task_struct *p)
@@ -5798,6 +5841,26 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
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
@@ -6668,6 +6731,8 @@ static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
 static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
 static inline void sync_throttle(struct task_group *tg, int cpu) {}
 static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
+static void task_throttle_setup_work(struct task_struct *p) {}
+static bool task_is_throttled(struct task_struct *p) { return false; }
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
-- 
2.39.5

