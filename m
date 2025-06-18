Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552C727F75C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234833; cv=none; b=KC4mCTmB74PtZpxV8dwTleCKB2hAwWBKbPz+qzVgNMxkZU06S/tp2j3z3yjJSs9nGbgmjGakDiWtEe0HmVY3AAlBbCT768kccZuY1PISDm5FCywbKcxrnzDKt0Bpd2BB/fMmovqPWUwCl+ApwAK4q0lpTLncTzB5ECIAq6+cDs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234833; c=relaxed/simple;
	bh=z021WrGctKuppj0/h8tKBraJ0dwBjvVoczMC6LXzLZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sXPI/cC3LD9eHZfvG91FuwNSeqTs2FNG4CcmfF4yctM7rAs15Qpp0A4zVpES47q8VmNIGXyOH4Sm2TO/ZQArEMzxjVTIPiMLxc4GxqR/osiaJ9SwVqAbwj9hUcg17hWYFX1Ki7qRX7J07r1oo757UphFPrvvvt/vrK6fSde6ZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=au4jI7Ne; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="au4jI7Ne"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso5314792a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750234830; x=1750839630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amuhs5zxMAjg/6Xi+wuLV4ot6W15AoFQiopBdQFm/lE=;
        b=au4jI7NeYy/VYRFPCBuBstAviedQXLBWS9ov1/3a6dgOdHQ0hd9C3odSUZdwVrhyM6
         vJJR5bm+w0WAHsNwxKoElw/XcRUCW/XB6XTgtX4hZai36Vv+ijXesLYY3rTqs90DKBow
         28dDCz90Us+9PsHqmdnBeKtmQiZ3PN9EvtvHBe52wSBI+LLjSVpgXC5L9bLmwUme3d3H
         Sn/FSY4GTrboPXPPtGFeraoCI6QHgYJKJVB2Bo3kNVfpMJLs8hAB1/62g+yD6hoTQgCQ
         snLANrVwYva81O1vD8uRJN0fHHanuzC8FRNp0FPLD5Onyu7BxCE9AFRQo7wVw06UTzgj
         MY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234830; x=1750839630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amuhs5zxMAjg/6Xi+wuLV4ot6W15AoFQiopBdQFm/lE=;
        b=kU4piTjtNfTJrpDwt1p0gr4D+pWLRj7mB3obYeSF1+VbjrKThDxKBtoC/mU8bY8frm
         Wek+phhJmaffwfcEUfh1Hx8DHxvALMta9TKNsKvwrd91UXeAht+soXa0tkt4y8+1wTBm
         JzL4Q7TSKbAhS/EbSUjCtIXkneHbHMgF4DbmPApTVlu5WJee1QEZ25qFmrJ9uo6RcNEu
         Rghs1M7d68lArQxyZVjn3B/4UPNUrROcff2l3FxCxIXfqx1+oLRSIHB6s9lspv7xYvta
         PKoIYOsgBDDx3PZXiKHBYjRQs8UkMUMeMrMX2rYZGpMOWl7mb401eNRS3t/EN7jCez/D
         spXg==
X-Gm-Message-State: AOJu0Yx1t/yc49ZJMqzd9nzFdNjiGVd2aGcxofsJuADKg/tH0wSzS4rP
	Ei44hEVqtY/3sR/PvGSp83h0I7y6Dxmr4EpLB+2yTgWcgB+R0CNZbEYPbELEKDuVdQ==
X-Gm-Gg: ASbGncufLD4pikAPvovO/qeNFe1dU+8ARCm5krlGI1EEjoVQp8iVLMjygSLFB2Ic+5R
	QlDuXSDuvWXN/IBRA1wq3yKTaBxMJMqIDW1siElzKFRe28dsnnridXcJSJ49l2qdD7BLyOOG9rg
	43wF52EesLQB/sCavo/m8GB9t3RfV9iNMfo5QvafnRb9y/LX5IiHm/REQ4DQ0XNX38d8F60K52Y
	hD4+uAYaoXCSPgl7AWlPCPQ5NIVlD7tlfB6uPwRdpHuxZO0p+yIb3aoxwKXGUhctw6vGQaTaUl4
	CO69CQP9om2uMAVgy2xk2AVezubgS8bwuF/A3Arxc7xxkPMEY4ETkLo2P1qRgktPNBIauXNobzI
	Bqr0ehvoMvPAIt88g7y+oEPIeJvzGWSk6
X-Google-Smtp-Source: AGHT+IGbJOpGAPZ2P+Evy7NQHVjjK9LjvUNeeJuOSqs8TCv16hzIsTsx5gNxMdGrJR4QJGa9l3v8kQ==
X-Received: by 2002:a05:6a21:790:b0:20a:bde0:beb9 with SMTP id adf61e73a8af0-21fbd494fccmr24851593637.1.1750234830469;
        Wed, 18 Jun 2025 01:20:30 -0700 (PDT)
Received: from 5CG4011XCS-JQI.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1691d7fsm10432084a12.69.2025.06.18.01.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:20:29 -0700 (PDT)
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
Subject: [PATCH v2 4/5] sched/fair: Task based throttle time accounting
Date: Wed, 18 Jun 2025 16:19:39 +0800
Message-Id: <20250618081940.621-5-ziqianlu@bytedance.com>
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

With task based throttle model, the previous way to check cfs_rq's
nr_queued to decide if throttled time should be accounted doesn't work
as expected, e.g. when a cfs_rq which has a single task is throttled,
that task could later block in kernel mode instead of being dequeued on
limbo list and account this as throttled time is not accurate.

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
index 59b372ffae18c..aab3ce4073582 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5292,16 +5292,6 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
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
 
@@ -5387,7 +5377,7 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 		 * DELAY_DEQUEUE relies on spurious wakeups, special task
 		 * states must not suffer spurious wakeups, excempt them.
 		 */
-		if (flags & DEQUEUE_SPECIAL)
+		if (flags & (DEQUEUE_SPECIAL | DEQUEUE_THROTTLE))
 			delay = false;
 
 		WARN_ON_ONCE(delay && se->sched_delayed);
@@ -5795,7 +5785,7 @@ static void throttle_cfs_rq_work(struct callback_head *work)
 		rq = scope.rq;
 		update_rq_clock(rq);
 		WARN_ON_ONCE(p->throttled || !list_empty(&p->throttle_node));
-		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
+		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_THROTTLE);
 		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
 		/*
 		 * Must not set throttled before dequeue or dequeue will
@@ -5947,6 +5937,17 @@ static inline void task_throttle_setup_work(struct task_struct *p)
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
@@ -5958,12 +5959,10 @@ static int tg_throttle_down(struct task_group *tg, void *data)
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
@@ -6006,8 +6005,6 @@ static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
 	 */
 	cfs_rq->throttled = 1;
 	WARN_ON_ONCE(cfs_rq->throttled_clock);
-	if (cfs_rq->nr_queued)
-		cfs_rq->throttled_clock = rq_clock(rq);
 	return true;
 }
 
@@ -6717,6 +6714,7 @@ static void task_throttle_setup_work(struct task_struct *p) {}
 static bool task_is_throttled(struct task_struct *p) { return false; }
 static void dequeue_throttled_task(struct task_struct *p, int flags) {}
 static bool enqueue_throttled_task(struct task_struct *p) { return false; }
+static void record_throttle_clock(struct cfs_rq *cfs_rq) {}
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
@@ -7036,6 +7034,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 	int rq_h_nr_queued = rq->cfs.h_nr_queued;
 	bool task_sleep = flags & DEQUEUE_SLEEP;
 	bool task_delayed = flags & DEQUEUE_DELAYED;
+	bool task_throttled = flags & DEQUEUE_THROTTLE;
 	struct task_struct *p = NULL;
 	int h_nr_idle = 0;
 	int h_nr_queued = 0;
@@ -7069,6 +7068,9 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
 
+		if (throttled_hierarchy(cfs_rq) && task_throttled)
+			record_throttle_clock(cfs_rq);
+
 		/* Don't dequeue parent if it has other entities besides us */
 		if (cfs_rq->load.weight) {
 			slice = cfs_rq_min_slice(cfs_rq);
@@ -7105,6 +7107,9 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 
 		if (cfs_rq_is_idle(cfs_rq))
 			h_nr_idle = h_nr_queued;
+
+		if (throttled_hierarchy(cfs_rq) && task_throttled)
+			record_throttle_clock(cfs_rq);
 	}
 
 	sub_nr_running(rq, h_nr_queued);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index fa78c0c3efe39..f2a07537d3c12 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2312,6 +2312,7 @@ extern const u32		sched_prio_to_wmult[40];
 #define DEQUEUE_SPECIAL		0x10
 #define DEQUEUE_MIGRATING	0x100 /* Matches ENQUEUE_MIGRATING */
 #define DEQUEUE_DELAYED		0x200 /* Matches ENQUEUE_DELAYED */
+#define DEQUEUE_THROTTLE	0x800
 
 #define ENQUEUE_WAKEUP		0x01
 #define ENQUEUE_RESTORE		0x02
-- 
2.39.5

