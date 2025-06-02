Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDE12550D7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902220; cv=none; b=DZPTT58PTc7w3VWW2j7h6I8bpIJDceXnpQuj1hVmpMLIGtMqRvJDNOboexf7MiCYQ31uEslq1LaNqhTmSpYJ9iyOqap5lGgfKy96MgdO7EKlSm9QmyLAAyT0QsTn/LCWUZ9tjXDDrhOY5t1TMHaIgU/ta0FgBrHPRGMek6F1e7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902220; c=relaxed/simple;
	bh=A6AXAST5Hp7ur7HURBTqqxiK2iM2jTlXqWPlUOtip9M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BK4Px+VbwieoWnVDKwKbMgJv5N+Hzit1lBT+0lUf84cEr+OA3YDOEnLbtfFrWsnr3rNWulJjbwZVQz/y2ZArS/7cGUn6dyKBo9SuWJkM9z0ZXNKbRdQ7PQ8yWfYBfaWYNfCRWcZ7Uz72QoeTz0Qh/ySjfjiJ1HIJ03c++1GGAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZGQWA+Z+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZGQWA+Z+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-310c5c2c38cso4643030a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748902217; x=1749507017; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQGeZPeoFIZ05GGB/xC9cvkywXWFzqsQJ2gLPAw1gt4=;
        b=ZGQWA+Z+KP+v2sk8tN1cUXsscBheU/1Ln14NkbpCTm5wmFwYh0EF2o6q6qA/CqmNDa
         aDbFhqFR0MlvVEAN1t/ioLgNTBaeBDqOfSrKK2WekOCxs2uVJpEq9YN+P7QFYmwAwh7w
         RGKBzfyteS9WgPjQ8MyWhjUlIKOEr0D1JtZBjjzAGB7AaYproKsFY9zMGP2plHHd1R/v
         APt1VZRK2gNVzTaiDN/Kbw4XqCTY0JyeMVlepv+5MDlpYci58YG2kHlbu4gaLOx0u4lZ
         IVHcx3uee1dQG1iQ5ymrbRcnFKwvpYY6fNUFpmg+wqVizDVOddI6BI9qlbS9i5VkIDop
         DkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902217; x=1749507017;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MQGeZPeoFIZ05GGB/xC9cvkywXWFzqsQJ2gLPAw1gt4=;
        b=qUe9AD+Dc5f+8AJP0Lk+lTX11l54QxQlS92CnO+I6KWK5nnX83C9FfthsDAJdN9ubM
         ZFHfEMPqpmA4tklHuWqd5oPvhbN53vvMBjt36WNRug20mOZ5DYiPBNApnDGXSeHebxSy
         8cLbngOEGp4eBCKOmy1wwZ7S8CgdbWzzTWBNAhxSRTnnxabi1LVFD+5ElxLhihgBCzl4
         KU8b69wlV5kQWFnYXKjBmB47thgCFQs/0dI8LeYV3/qj5+9s789n1gmOn5lXZRF5wB6w
         fQVT3LNuDMly7JNoq7kyDzOfXIx1YVQwGG7QNla8bbpUHMF03LryOT164SREBiqfiNNy
         vsGQ==
X-Gm-Message-State: AOJu0Yz4/qy/bfD0B58B5UqqQrByRDK5LtIAEztkq87aBpRZ6DQfao34
	xeDaGMo2AO00L8eU667ExPbd85aH/URNCzL5CdXJ9aMZ5UfbFJ6VRUef80OI60weAMNzQa/fCcc
	ODv/kiowwhM1Z6ifaV5W/WEH2z2HB9biHpvDzMDUezAtH9hLlbtZOzJ4zlFW20UQKPzCBfRtqwG
	yQYh6UAFVr3I/VlSb71rdg+uhiGaLX59+sKyHZKevLjPcfMhdM
X-Google-Smtp-Source: AGHT+IFW+mFHXaNLcKUxdgA878nn15Jh9ozh2fN9stO0dk0D31tfz8s35ogkSyOjyfCfGYdbtyFvtsAHnSqW
X-Received: from pjbsx4.prod.google.com ([2002:a17:90b:2cc4:b0:311:9ce0:8215])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d2c8:b0:311:f30b:c26
 with SMTP id 98e67ed59e1d1-31250353151mr18912286a91.6.1748902217283; Mon, 02
 Jun 2025 15:10:17 -0700 (PDT)
Date: Mon,  2 Jun 2025 22:09:54 +0000
In-Reply-To: <20250602221004.3837674-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602221004.3837674-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602221004.3837674-8-jstultz@google.com>
Subject: [RESEND][PATCH v17 7/8] sched: Fix proxy/current (push,pull)ability
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
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
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
Cc: kernel-team@android.com
---
 kernel/sched/core.c     | 25 +++++++++++++++++++++++++
 kernel/sched/deadline.c |  7 +++++++
 kernel/sched/rt.c       |  5 +++++
 3 files changed, 37 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 878d9c5fea53c..af35a493fd943 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6718,6 +6718,23 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
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
@@ -6854,6 +6871,10 @@ static void __sched notrace __schedule(int sched_mode)
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
@@ -6888,6 +6909,10 @@ static void __sched notrace __schedule(int sched_mode)
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
index fa03ec3ed56a2..87ccd5d5375a3 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1477,6 +1477,9 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 
 	enqueue_rt_entity(rt_se, flags);
 
+	if (task_is_blocked(p))
+		return;
+
 	if (!task_current(rq, p) && p->nr_cpus_allowed > 1)
 		enqueue_pushable_task(rq, p);
 }
@@ -1757,6 +1760,8 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
 
 	update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 1);
 
+	if (task_is_blocked(p))
+		return;
 	/*
 	 * The previous task needs to be made eligible for pushing
 	 * if it is still active
-- 
2.49.0.1204.g71687c7c1d-goog

