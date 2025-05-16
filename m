Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D90322F772
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365521; cv=none; b=IAVUjKPDPUc/e/ABAsJLl6vqJV8TbNYQa6X9NVX1EOCcoCmNAGLM8AylTggRc25ASs44nIPYuOmUYFn/PEMBJnLZusoAywZeRwsAHw66tpcGDCP8n7+pBcvGEAqxcGS0TphMw3mR8rEkb72vVTuZjLYlY92unMAD9L4f73dRNqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365521; c=relaxed/simple;
	bh=UBbQjezrR1fHz0zF7NXwxg2PSLurx+sthBx2QVpoljM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=raDAOe4Kl38Nr4yxO8D5ug0gm19ApDM+Q/6n820eSmcGiDZBYkvgneYg5JQbRGlvgLdpjAozhj7Ea8lb8U9T14M2txGm3ya3nFqKSPYVIktPP7zDiXBZUE3el7t7I9a+KhrW2ekK1prDLGzDjD62KTVnczSC7mI76TMyiPHSopc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LHD66FlU; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LHD66FlU"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-231d7f59e03so4481295ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747365519; x=1747970319; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pqsry2aDUlRvgWK/E6M77oZbESAlSvAsf7Y9ujTW+bM=;
        b=LHD66FlU+5Pi6df9ny+mNzsorIzkWuwiHF26CGx/N4Bu8Xgk4TwHigdpfhH1ba3XCf
         ZEWMfq3clRx9/uY6XtU7jz9+o4M5Bv28HbDZJIGmgt94Yt9ielj6b1XEhKdXG3gT5wYw
         0PtY1/tIB/ZprjitQQl2Din/C9HNThVRd74dRksUJJz60O8mpLr2wfWtH57egOsaPFFA
         6I76xWAgo6uSwZulBDSRk3WE/3yS/U/9X6gYymMY1yQrxNGiSCcy2eMzwnWDXtFFbJrQ
         3N/ha+oqRG1L2OP4NX45CK95D9XPJGp7GaBFCN8LQCDXftsgNyi2SGz0IlCL3w/ZcTm1
         0OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747365519; x=1747970319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pqsry2aDUlRvgWK/E6M77oZbESAlSvAsf7Y9ujTW+bM=;
        b=V/emOCDtR4CiMbFl5gkXy1ecz1axLUFZhf2B/neaek6BbsiBaQ7lQrDMi413pJqg8R
         jGbAKQCtbrXombyglWehlsxzMmvRe/IYvvB18J4VHygqbVQr2jHFXLwQGzEBexhLTfgK
         2noe5QHD5d2TGmf59fUQbmR9bidA1JL0eLewKlGzFCN9TwAJsk4WJANbVM4rFRka4qp6
         kwI//kwo5VaJtuCwL755oslhAgS4ZQRFGNezuY9Yk+STz7T69jZij5+uBT02C//pTdHg
         RT7ksOTLo1BIvnkfADICvZsHfq3hUghYa8l78LDhenkHxpkgPF0SYtQ8KeyFc7UUqmNm
         uV5A==
X-Gm-Message-State: AOJu0Yw+zMVP/XEPs3AcmBQ+bI9JhyVE9jSy+M3NiBU+1O1kUD2C0q3K
	5vYb30pYiqqzXm3ZRSyWOtpdKZGSZryyyLe6iAL2adj7W5Guxlkg1zbhMoZRq880KhVF7m4O+di
	c5+kVTPv8WumclzqB7Fm9KBzDxKXcYb7CAlBJmXx4c0+GhI8miLuWFLoT70zBO9DZcEPX4z8G+/
	I9/BypvCCe92iZFY0Y7R9qaXIEiepIHbY4cEF6t+tzFW+iV7c1
X-Google-Smtp-Source: AGHT+IFEc10E5hUgcJd8rrMiTaJD2KymMo9KUSlicuOy9tHdWmrv2O3WyFFxsFmCmsJjWSlf/P+fpyXlwBjP
X-Received: from pffk18.prod.google.com ([2002:aa7:88d2:0:b0:736:56a2:99ac])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4614:b0:736:5822:74b4
 with SMTP id d2e1a72fcca58-742a98d4a75mr2274204b3a.21.1747365508226; Thu, 15
 May 2025 20:18:28 -0700 (PDT)
Date: Fri, 16 May 2025 03:17:54 +0000
In-Reply-To: <20250516031814.1870508-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516031814.1870508-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516031814.1870508-8-jstultz@google.com>
Subject: [PATCH v17 7/8] sched: Fix proxy/current (push,pull)ability
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
2.49.0.1101.gccaa498523-goog

