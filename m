Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7022E11CD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883491; cv=none; b=aFrVEtRTQEE71pSHTPHAXyBRhjT5e3BpCNSER5PbPFfBq7Rov0TD3DXfvE12/9lyb5bFbAuybY7hzZMb21iLIGzTklKOj5GQnJ3uoxNTbyd3LVgLSeYBwLbZA7pMONyzYReUnYLDED07c0JbJrYmM4DBCluiiTUy54DZ/525YLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883491; c=relaxed/simple;
	bh=XJ+zB5vfjgj/VuFNky+aSN6sseEPlMbV05wwGCrI/A0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dW5vJhYkTuWuoETCoBRZnGjFQcIhWWJx6qg1etnw7HB0E8djELnHsa3FCXPDRguy4XbHeBJzxgdtQ0qD8QK9qblAFnC7zFnCxtlrnDDH1tG7QxXm+oaMGWYGM01/gb79Vw8V2HlYa4Gu9gWe+YHbF7LYNPe3xl217A8tDjV+G+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rMHXN94Q; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rMHXN94Q"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so128413a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750883488; x=1751488288; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Rq31Hw/FTi2WUEI+nbUuOFryI5Rf1pz1yynmS6irFs=;
        b=rMHXN94QnDs8G1/NFuqgHVv/7SEQbH9kSfyAKIQWa2+p2ThRThGBMDhQnv2M+UQtTb
         Mr6cE+9KknATc2IHdJKyPQSP+j+Rpk5teb1zVuoTsE27h+ADRGC2IhhpxyEoMuH2lCb+
         kA/UHbeQvNb2i+MZVifRXnfuM5NaSPDmIKp1ZQJDZiGH+zT+iVEhKkRxTYmbrxXr0fiT
         N0XZeRucTUMyZuI/SOuh2/hgaTawVsxDSHGIIWIkiyBwKTnikagG2EhIgeMJIkl9v4kT
         +CTSBwQw3qBfXWG+9K41tM+HorBhX6vAsw/xbfUqVTczg21D67LmsPrnUU0tWkfMf7zp
         6+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750883488; x=1751488288;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Rq31Hw/FTi2WUEI+nbUuOFryI5Rf1pz1yynmS6irFs=;
        b=t+7Yyf81cf0o6BMCYmwHUDOMfSwZxOEwh/OkAgM1LXRoLLPXqSOmAqK1yL+0xIvnQL
         DrKel+5wUbv7BBF3smKqZuYE9Ip/uF03gwvIbdB4VQDsPS3Z24qc72QwzBXjxs6OvUKe
         bmhGnLHS4IdgJZJyeIrtf00C+EqaIxkh4wul2fmyTTN4vzQfzPQIpcMC6N/hYl8DvQyl
         mW2uCmgk3jsDzRTj+HzfwHvvYYHqhOHYpzbn0NpndpgC9iWzHzVQFLQQKpqHiDJOe1+R
         gK6PbBnClz8iCCMhsM38rqk6StXxcBgvBWKFZJ03nxiFohxbnOG6qJ+muN+1aH2+YRPu
         uMcw==
X-Gm-Message-State: AOJu0YzMcblOm/7ByhED5GXGQHYqPfyOnYQUyKFbr9LZJzKGF48ADq1A
	0wGz3Sune3S1k116GF44pElEKuonAqPwcTrvGs8xzc1ri//2Ur3Gi3A02MpyqG2n04v0tJ4ufxe
	S2OoY9WllSm/GBM84R35D8JXHsGH++7Y2Hwjsoo2io3+xe8DI5GjdMWXyMyw8GnnmUAMnPUn5il
	bY42SEPtEaFOs8A4bcM4BTZt+EbYOsIQNr8LRrVne4prnQ/95/
X-Google-Smtp-Source: AGHT+IEIJjMyvJHQ8RtqqWnbiH/IcHGJSBO4XdkrUZuvBBBiYERZZhj8nO0yMIxtjLUpxd30/hXbupIWFWZa
X-Received: from pfbiv18.prod.google.com ([2002:a05:6a00:66d2:b0:748:ec4d:30ec])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9009:b0:21a:b9d4:ad73
 with SMTP id adf61e73a8af0-2207f2bd033mr8463572637.40.1750883488323; Wed, 25
 Jun 2025 13:31:28 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:31:00 +0000
In-Reply-To: <20250625203110.2299275-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250625203110.2299275-1-jstultz@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250625203110.2299275-8-jstultz@google.com>
Subject: [PATCH v18 7/8] sched: Fix proxy/current (push,pull)ability
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>, "Connor O'Brien" <connoro@google.com>, 
	John Stultz <jstultz@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

From: Valentin Schneider <valentin.schneider@arm.com>

Proxy execution forms atomic pairs of tasks: The waiting donor
task (scheduling context) and a proxy (execution context). The
donor task, along with the rest of the blocked chain, follows
the proxy wrt CPU placement.

They can be the same task, in which case push/pull doesn't need any
modification. When they are different, however,
FIFO1 & FIFO42:

	      ,->  RT42
	      |     | blocked-on
	      |     v
blocked_donor |   mutex
	      |     | owner
	      |     v
	      `--  RT1

   RT1
   RT42

  CPU0            CPU1
   ^                ^
   |                |
  overloaded    !overloaded
  rq prio = 42  rq prio = 0

RT1 is eligible to be pushed to CPU1, but should that happen it will
"carry" RT42 along. Clearly here neither RT1 nor RT42 must be seen as
push/pullable.

Unfortunately, only the donor task is usually dequeued from the rq,
and the proxy'ed execution context (rq->curr) remains on the rq.
This can cause RT1 to be selected for migration from logic like the
rt pushable_list.

Thus, adda a dequeue/enqueue cycle on the proxy task before __schedule
returns, which allows the sched class logic to avoid adding the now
current task to the pushable_list.

Furthermore, tasks becoming blocked on a mutex don't need an explicit
dequeue/enqueue cycle to be made (push/pull)able: they have to be running
to block on a mutex, thus they will eventually hit put_prev_task().

Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
Signed-off-by: Connor O'Brien <connoro@google.com>
Signed-off-by: John Stultz <jstultz@google.com>
---
v3:
* Tweaked comments & commit message
v5:
* Minor simplifications to utilize the fix earlier
  in the patch series.
* Rework the wording of the commit message to match selected/
  proxy terminology and expand a bit to make it more clear how
  it works.
v6:
* Dropped now-unused proxied value, to be re-added later in the
  series when it is used, as caught by Dietmar
v7:
* Unused function argument fixup
* Commit message nit pointed out by Metin Kaya
* Dropped unproven unlikely() and use sched_proxy_exec()
  in proxy_tag_curr, suggested by Metin Kaya
v8:
* More cleanups and typo fixes suggested by Metin Kaya
v11:
* Cleanup of comimt message suggested by Metin
v12:
* Rework for rq_selected -> rq->donor renaming
v16:
* Pulled logic from later patch in to avoid sched_balance
  migrating blocked tasks.
* Moved enqueue_task_rt() logic from earlier into this patch
  as suggested by K Prateek Nayak
* Simplified changes to enqueue_task_rt to match deadline's
  logic, as pointed out by Peter
v17:
* Add similar logic to put_prev_task_dl as pointed out by
  K Prateek Nayak

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: kernel-team@android.com
---
 kernel/sched/core.c     | 25 +++++++++++++++++++++++++
 kernel/sched/deadline.c |  7 +++++++
 kernel/sched/rt.c       |  5 +++++
 3 files changed, 37 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dc82d9b8bee2c..98a802e0a3f36 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6735,6 +6735,23 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 }
 #endif /* SCHED_PROXY_EXEC */
 
+static inline void proxy_tag_curr(struct rq *rq, struct task_struct *owner)
+{
+	if (!sched_proxy_exec())
+		return;
+	/*
+	 * pick_next_task() calls set_next_task() on the chosen task
+	 * at some point, which ensures it is not push/pullable.
+	 * However, the chosen/donor task *and* the mutex owner form an
+	 * atomic pair wrt push/pull.
+	 *
+	 * Make sure owner we run is not pushable. Unfortunately we can
+	 * only deal with that by means of a dequeue/enqueue cycle. :-/
+	 */
+	dequeue_task(rq, owner, DEQUEUE_NOCLOCK | DEQUEUE_SAVE);
+	enqueue_task(rq, owner, ENQUEUE_NOCLOCK | ENQUEUE_RESTORE);
+}
+
 /*
  * __schedule() is the main scheduler function.
  *
@@ -6873,6 +6890,10 @@ static void __sched notrace __schedule(int sched_mode)
 		 * changes to task_struct made by pick_next_task().
 		 */
 		RCU_INIT_POINTER(rq->curr, next);
+
+		if (!task_current_donor(rq, next))
+			proxy_tag_curr(rq, next);
+
 		/*
 		 * The membarrier system call requires each architecture
 		 * to have a full memory barrier after updating
@@ -6907,6 +6928,10 @@ static void __sched notrace __schedule(int sched_mode)
 		/* Also unlocks the rq: */
 		rq = context_switch(rq, prev, next, &rf);
 	} else {
+		/* In case next was already curr but just got blocked_donor */
+		if (!task_current_donor(rq, next))
+			proxy_tag_curr(rq, next);
+
 		rq_unpin_lock(rq, &rf);
 		__balance_callbacks(rq);
 		raw_spin_rq_unlock_irq(rq);
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245e..4757c29d0979e 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2166,6 +2166,9 @@ static void enqueue_task_dl(struct rq *rq, struct task_struct *p, int flags)
 	if (dl_server(&p->dl))
 		return;
 
+	if (task_is_blocked(p))
+		return;
+
 	if (!task_current(rq, p) && !p->dl.dl_throttled && p->nr_cpus_allowed > 1)
 		enqueue_pushable_dl_task(rq, p);
 }
@@ -2465,6 +2468,10 @@ static void put_prev_task_dl(struct rq *rq, struct task_struct *p, struct task_s
 	update_curr_dl(rq);
 
 	update_dl_rq_load_avg(rq_clock_pelt(rq), rq, 1);
+
+	if (task_is_blocked(p))
+		return;
+
 	if (on_dl_rq(&p->dl) && p->nr_cpus_allowed > 1)
 		enqueue_pushable_dl_task(rq, p);
 }
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e40422c370335..b1fc9e6cf4a60 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1488,6 +1488,9 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 
 	enqueue_rt_entity(rt_se, flags);
 
+	if (task_is_blocked(p))
+		return;
+
 	if (!task_current(rq, p) && p->nr_cpus_allowed > 1)
 		enqueue_pushable_task(rq, p);
 }
@@ -1768,6 +1771,8 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
 
 	update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 1);
 
+	if (task_is_blocked(p))
+		return;
 	/*
 	 * The previous task needs to be made eligible for pushing
 	 * if it is still active
-- 
2.50.0.727.gbf7dc18ff4-goog

