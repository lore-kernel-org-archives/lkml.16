Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19EA199EB7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744437799; cv=none; b=liy8UqaKXcWMBgD9wOjpxTHsnFfbNUN5HOCoFxaDA6Of6PEIflgxwwuye0Ztmdifcid6ZZZ24CRCmahUPj5F3hdC3X2BPsZSJNxSSM+oZypQJ3DxlKKVo2+PXotdYfo8LWPKe3hK8M8YSnODs6HzBX7zthGx/3Y0lCHDMarRCHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744437799; c=relaxed/simple;
	bh=fKTNvFvODPcI1rCmpuwOiM+rUgcui9jkItI+2fxkRBo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NNG85QOGc0+65annaQdfrzlnaY7YJLHhtFEcyJSIi5dn4f38MWE/AykhgjP5o14jHNihyvrGTwsZYOJ954dEsEFs7KQIo5a/4nfozUeUJGWzmuT0PfOVfcMXsIAPbWt1noWU6vesCO/hpTPwef3zx/Sx5CbMxkqUnV5ykz+NiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zquhV0GL; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zquhV0GL"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af8a4410816so2212523a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744437796; x=1745042596; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xoxewrjA0eRKaqgPhy1nPLkUdhv1NKZQYr6pe4XtuJw=;
        b=zquhV0GLqhRjs801kMBKKfiMWwNG6dNhncI4nhF3MBsA6sylmL5yEvCmX5UDBE4hMi
         0rJEWEUzZ3CO/l0FAc5CcCBcDAbYATgubuQ+F02tbIq+I6HcsV+74tXHQ9odTsWEDrwn
         k3f9UC6Wz5XhBKJx0N8PPbkpuCIvDQMbJ4CpjYdj1y2JIXLxXhag/QsjHuFkDPXKl3hc
         C6UqJzG5bNL5cIqUYGdgMI6cgr5HAi0zSg6X7JTgqzhFALf0zyweO3N+pmYJjrWnIce8
         nkAiqRmGewG1nnPqmwlDR6jMz0yx+/AITw2TDxI3UUibyPqyg3pSmeTjgNZRzIl1QOXW
         TT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744437796; x=1745042596;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoxewrjA0eRKaqgPhy1nPLkUdhv1NKZQYr6pe4XtuJw=;
        b=O+VopZqp5bcdSN1GRe67IfIxIf7kUJLQ1OOc9uAUvBAbzWiJ2GzvdLr2sTNVIZ2w8q
         oDD+FPaHOFPPC4ETqs8/sW816Nemj+8DjLjZ6HE/oCkCqZEljvAdn6fmkuMthVn8nTfz
         IJcEZSLQ09RqwOcq/uqkQQiVUgXVOsxALeOPu8FPeAqmTDTjTDqF0aLENpmLbvu+6hLF
         vkBEQvLir0L1BnZ0k2Fh7yMfUkpUdfWdIEY//ReF//HxrDxJGOmDN2/V6gUc5R4O8RDn
         sPTmkAh8FV47nQHUB7Xga8nLOHdZIaVP7l3iEQUT38oVSqLLWu4hP6N0XMc1gmeI4dSl
         pwVA==
X-Gm-Message-State: AOJu0YyFwQDvPC4Ib55cb+kDzidZ892qpnAtSnOlX+pbpL0MM5hVtgtQ
	SWBDqEV5nf53Mx3EuBKkaUuzTXXZaRLAiRO9BPEPIXIp2YI8J4RmJ15F7c6EyOlmnUysLVeR5cg
	8JdTWr5ouGtarGJH+1NmDN9eqJ7kOZJkFOHuc/EqKn9V8reiggMCp9rjFKiU9xeg62donX8Wfkb
	9pQVChymMr3mAhsfsr9HFUgZBXgv2ON+nuFO/YpkQCdA3t
X-Google-Smtp-Source: AGHT+IHRrIZOLx+coeg/Jiph+bXKsm9O4rkyMkbO695loThOvdjJk3HvsU6HqvMMnpnNbd/xzRkboFZCOLxQ
X-Received: from pgbdn6.prod.google.com ([2002:a05:6a02:e06:b0:af8:c71b:5fbe])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:438f:b0:1f5:8903:860f
 with SMTP id adf61e73a8af0-2017979a290mr9035889637.14.1744437795653; Fri, 11
 Apr 2025 23:03:15 -0700 (PDT)
Date: Fri, 11 Apr 2025 23:02:40 -0700
In-Reply-To: <20250412060258.3844594-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412060258.3844594-7-jstultz@google.com>
Subject: [PATCH v16 6/7] sched: Fix proxy/current (push,pull)ability
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com, 
	"Connor O'Brien" <connoro@google.com>, John Stultz <jstultz@google.com>
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
---
 kernel/sched/core.c     | 25 +++++++++++++++++++++++++
 kernel/sched/deadline.c |  3 +++
 kernel/sched/rt.c       |  5 +++++
 3 files changed, 33 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 88acb47f50d0f..33f0260c20609 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6719,6 +6719,23 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
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
@@ -6855,6 +6872,10 @@ static void __sched notrace __schedule(int sched_mode)
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
@@ -6889,6 +6910,10 @@ static void __sched notrace __schedule(int sched_mode)
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
index ad45a8fea245e..eb07c3a1b8fa4 100644
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
2.49.0.604.gff1f9ca942-goog

