Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942AB27EC97
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737733; cv=none; b=tB5qZ3so5nJ3WDz64bKrC0PoXsg2a0o7WjxvfT7hx2QCsI6GHZfoKaqUtS3ebxVnL+Ja1WZSO4ZekNIqapsAvh7Rk7GVOal7SYGp3ysRrXUxky7QT868+MCc9Zl5TVa8h3zaRvrJl06Om5vQ3D1UypDEgal+CprCO/Lu0N2UaEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737733; c=relaxed/simple;
	bh=0dZ1drf8rOlm0eW/UihINT07gNG+dj8YiiGFJaN8q9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ltKZxSmmrHSp0sLTkMANMjVZoMkA1x7+5/PRAaeWE8dWhkDUrZPsxMHbBZRgPTCkxa4OfvUipoDL+OH4pChr//kAvTm+bzkHmGWfqoRgGfvUjK/QeWk5KDRT3R/5Z+hybvuIp7Dx8RFZ6jcQ+WEA74eSPbRbB3aod9XGjn5016E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RUkhKFqH; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RUkhKFqH"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30e9e81d517so2684358a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747737731; x=1748342531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEMmT73jJYNNK4t8cAMM0nD3eDabIAA39FkqxQKoUqU=;
        b=RUkhKFqH+0vMhTOEdjAa4RlO4/+ofix7PkAik/Aq+VTiqDRrFNomXCH/Ke5+wPugM7
         Jyn90/Xro5cSVvEKgEdDyqvDlbu1uL6QTiXoJqBFy48cVJP0L7FaFPlWuffJazU9oaEf
         TwfYPS4/B91EZB49uRjdY95c9dWBgUjE1DtGTzCEKdQGAvlj1cZyeL2xjCfpjJoIz0HG
         qz5XQO5OlqOEkTbmaJuyFLP9+cY3T8QcxUjaAe3mpjdtodQfBgP7orSUaUxm/1oDf+GV
         TRDcNiHqIF/f71Qrd1uZYEBt5pPMnPsYM6OVOeC3YeQCnv9VkhQYGlzmdH5lVoAOnfl9
         AH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737731; x=1748342531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEMmT73jJYNNK4t8cAMM0nD3eDabIAA39FkqxQKoUqU=;
        b=sXB63vGgVQx8qxZd7tj6BZbk3uKMJfdwWk4+oSujnF6aIPaaBgEgXY9RUbuCpdAcsh
         OQf+v70fwRSKfo41OumrGh4nnBnEk9wc8aknjy2ftFB7x05nuNMSDDz31vtHmvs5Zr5f
         ZdTYOdyWPG+lUnh8u741hPgS8TdRXAD6ckYNHKI7LH5+vFXPk36EZDKZnJba9lZhgu+T
         59xydF9S33DuZU9R745Ms3ETsxBa7Lyx3ZLPn7s2awc6rWmBTPZNtxnd9VdeoK8XV+pL
         /i6F9DMCzx0RMqIWwNCFFkIb0JgSmyxptW8RqIkFA+aSEFpN5ZqS7dhDV/9hBRZCKnVh
         HPJQ==
X-Gm-Message-State: AOJu0Yzi0TGuSfx4bH5MkwPfZXVIKsrDyd1bCv7RHVZcVZihDRtoiTnT
	L2MtNqe0tIn+aZ+lkg7lPEf8Dwn1hrUVZ4Cllrt5mamHFxgZ2cFPlCgNTcYHlck6gg==
X-Gm-Gg: ASbGncuXuMOMvxRwriet14qaxG2F+/n4n3ZOzo/3ZcyOUnphmm767mfUZwM6Nmu4Q+1
	GXwlYSWf1c9kowYxv3dItTomoSijwc19LRol4BmIErZYLn9IOXWDNboL8TA8VLps+CS1Oixynok
	WttpaQCTPYtIdpwXFkM1sY2IhfEP/MrY8DRlwnQ0OnN19YQttnrODZ1eecQDLdx/YHBlutZ99Z+
	kDdX+BfdzZ+9DSebrkgPwO+CvQYnBbecyWugS3xFaCw7SzWRh3u8kDWWusIILGqjkXh/+uiTM/6
	ChH8nicDVSaI/v3BU03qsMwxtoXqhx/q6RdE2x2shP7/DLhxTwNH1olkpHBZDlbvTHQ=
X-Google-Smtp-Source: AGHT+IG1KSRO5kFcZoTO2J4HyN7oHwgR/lBFjkCfWVy+6oaO2Ks3YVK68ZEzctFgZE4Y7GmCHzXz7A==
X-Received: by 2002:a17:90b:3904:b0:30e:54be:37e4 with SMTP id 98e67ed59e1d1-30e7d5564dcmr27917283a91.17.1747737730645;
        Tue, 20 May 2025 03:42:10 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5d31sm1359431a91.38.2025.05.20.03.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:42:10 -0700 (PDT)
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
Subject: [PATCH 6/7] sched/fair: task based throttle time accounting
Date: Tue, 20 May 2025 18:41:09 +0800
Message-Id: <20250520104110.3673059-7-ziqianlu@bytedance.com>
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

With task based throttle model, the previous way to check cfs_rq's
nr_queued to decide if throttled time should be accounted doesn't work
as expected, e.g. when a cfs_rq is throttled, its nr_queued == 1 but
then that task could block in kernel mode instead of being dequeued on
limbo list. Account this as throttled time is not accurate.

Rework throttle time accounting for a cfs_rq as follows:
- start accounting when the first task gets throttled in its hierarchy;
- stop accounting on unthrottle.

Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # accounting mechanism
Co-developed-by: K Prateek Nayak <kprateek.nayak@amd.com> # simplify implementation
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c  | 41 +++++++++++++++++++++++------------------
 kernel/sched/sched.h |  1 +
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a968d334e8730..4646d4f8b878d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5360,16 +5360,6 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 	if (cfs_rq->nr_queued == 1) {
 		check_enqueue_throttle(cfs_rq);
 		list_add_leaf_cfs_rq(cfs_rq);
-#ifdef CONFIG_CFS_BANDWIDTH
-		if (throttled_hierarchy(cfs_rq)) {
-			struct rq *rq = rq_of(cfs_rq);
-
-			if (cfs_rq_throttled(cfs_rq) && !cfs_rq->throttled_clock)
-				cfs_rq->throttled_clock = rq_clock(rq);
-			if (!cfs_rq->throttled_clock_self)
-				cfs_rq->throttled_clock_self = rq_clock(rq);
-		}
-#endif
 	}
 }
 
@@ -5455,7 +5445,7 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 		 * DELAY_DEQUEUE relies on spurious wakeups, special task
 		 * states must not suffer spurious wakeups, excempt them.
 		 */
-		if (flags & DEQUEUE_SPECIAL)
+		if (flags & (DEQUEUE_SPECIAL | DEQUEUE_THROTTLE))
 			delay = false;
 
 		WARN_ON_ONCE(delay && se->sched_delayed);
@@ -5863,7 +5853,7 @@ static void throttle_cfs_rq_work(struct callback_head *work)
 		rq = scope.rq;
 		update_rq_clock(rq);
 		WARN_ON_ONCE(!list_empty(&p->throttle_node));
-		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
+		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_THROTTLE);
 		/*
 		 * Must not add it to limbo list before dequeue or dequeue will
 		 * mistakenly regard this task as an already throttled one.
@@ -5955,6 +5945,17 @@ static inline void task_throttle_setup_work(struct task_struct *p)
 	task_work_add(p, &p->sched_throttle_work, TWA_RESUME);
 }
 
+static void record_throttle_clock(struct cfs_rq *cfs_rq)
+{
+	struct rq *rq = rq_of(cfs_rq);
+
+	if (cfs_rq_throttled(cfs_rq) && !cfs_rq->throttled_clock)
+		cfs_rq->throttled_clock = rq_clock(rq);
+
+	if (!cfs_rq->throttled_clock_self)
+		cfs_rq->throttled_clock_self = rq_clock(rq);
+}
+
 static int tg_throttle_down(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
@@ -5967,12 +5968,10 @@ static int tg_throttle_down(struct task_group *tg, void *data)
 	/* group is entering throttled state, stop time */
 	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
 
-	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
-	if (cfs_rq->nr_queued)
-		cfs_rq->throttled_clock_self = rq_clock(rq);
-	else
+	if (!cfs_rq->nr_queued)
 		list_del_leaf_cfs_rq(cfs_rq);
 
+	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
 	WARN_ON_ONCE(!list_empty(&cfs_rq->throttled_limbo_list));
 	return 0;
 }
@@ -6015,8 +6014,6 @@ static void throttle_cfs_rq(struct cfs_rq *cfs_rq)
 	 */
 	cfs_rq->throttled = 1;
 	WARN_ON_ONCE(cfs_rq->throttled_clock);
-	if (cfs_rq->nr_queued)
-		cfs_rq->throttled_clock = rq_clock(rq);
 	return;
 }
 
@@ -6734,6 +6731,7 @@ static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
 static void task_throttle_setup_work(struct task_struct *p) {}
 static bool task_is_throttled(struct task_struct *p) { return false; }
 static void dequeue_throttled_task(struct task_struct *p, int flags) {}
+static void record_throttle_clock(struct cfs_rq *cfs_rq) {}
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
@@ -7057,6 +7055,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 	int rq_h_nr_queued = rq->cfs.h_nr_queued;
 	bool task_sleep = flags & DEQUEUE_SLEEP;
 	bool task_delayed = flags & DEQUEUE_DELAYED;
+	bool task_throttled = flags & DEQUEUE_THROTTLE;
 	struct task_struct *p = NULL;
 	int h_nr_idle = 0;
 	int h_nr_queued = 0;
@@ -7092,6 +7091,9 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
 
+		if (throttled_hierarchy(cfs_rq) && task_throttled)
+			record_throttle_clock(cfs_rq);
+
 		/* Don't dequeue parent if it has other entities besides us */
 		if (cfs_rq->load.weight) {
 			slice = cfs_rq_min_slice(cfs_rq);
@@ -7128,6 +7130,9 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
+
+		if (throttled_hierarchy(cfs_rq) && task_throttled)
+			record_throttle_clock(cfs_rq);
 	}
 
 	sub_nr_running(rq, h_nr_queued);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 83f16fc44884f..9ba4b8f988ebf 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2360,6 +2360,7 @@ extern const u32		sched_prio_to_wmult[40];
 #define DEQUEUE_SPECIAL		0x10
 #define DEQUEUE_MIGRATING	0x100 /* Matches ENQUEUE_MIGRATING */
 #define DEQUEUE_DELAYED		0x200 /* Matches ENQUEUE_DELAYED */
+#define DEQUEUE_THROTTLE	0x800
 
 #define ENQUEUE_WAKEUP		0x01
 #define ENQUEUE_RESTORE		0x02
-- 
2.39.5

