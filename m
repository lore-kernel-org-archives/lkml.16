Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D8A283CB8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289488; cv=none; b=qSEoHeUw8Z5f2tUiRDnEP7vuWXfwKWEJwrM49k/lv7xoS7eOwx9f+TPXcHKJeMOPi1CfzINbV1XSkTn1JA8VyH+pT/s/nra3MwuCnw4+qXrnYf+GafeqN+oG+6kgOe91j2N0pgW/minPW5SQPguUH1VpRS2VwKMkyEf7FzQCdRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289488; c=relaxed/simple;
	bh=iJMCFV6EOamdalNTxSDy4sCKc3VgnW0XSiZvW9laNBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuOnJ4bscqiONZxB7ldA2OfOqoplvZrZq29c3Or+wnd0xcyq7+pqcQ1GUd9IkbbzdVnS5Nfuflz5KZ9CNLhiPMpy9S0SJG9bRUKIbipCsOwOmkCdiZPptJfXVfGhRwf0tQOZ9kg9Yvy3h3gaJCV0nQ8EIx1/Jfef0lOl9WUiQpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P4kikwS5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P4kikwS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744289485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+8BpYbqVfV59Tc41WHFqkSmWviEBsJafHYqVfY0jKo=;
	b=P4kikwS5oqWc5iX5DU7R891Gmyj7l6WUYx5DKYA5UetBVXvjOeqj9hsVF4gyMyQRUd5NGh
	iZouvDN5xC41BvPKZ0o3BojNjtpB5O1dFmj3C3qefNcI/PE+ls11IWtAfZxH5GqNrGuE13
	YUBbHbMYWr3xOlDpxjQaprDEl5SIGcI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-LYCia02gMMmHXT5dQnqgFw-1; Thu,
 10 Apr 2025 08:51:19 -0400
X-MC-Unique: LYCia02gMMmHXT5dQnqgFw-1
X-Mimecast-MFC-AGG-ID: LYCia02gMMmHXT5dQnqgFw_1744289478
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9918C1955DCD;
	Thu, 10 Apr 2025 12:51:17 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.134])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B85D419560AD;
	Thu, 10 Apr 2025 12:51:08 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: mathieu.desnoyers@efficios.com,
	peterz@infradead.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	gmonaco@redhat.com,
	linux-mm@kvack.org,
	paulmck@kernel.org,
	shuah@kernel.org
Subject: [PATCH] fixup: [PATCH v12 2/3] sched: Move task_mm_cid_work to mm work_struct
Date: Thu, 10 Apr 2025 14:50:29 +0200
Message-ID: <20250410125030.215239-1-gmonaco@redhat.com>
In-Reply-To: <e916f393-b18c-4641-ace7-cf23b7508e09@efficios.com>
References: <e916f393-b18c-4641-ace7-cf23b7508e09@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Thanks both for the comments, I tried to implement what Mathieu
suggested. This patch applies directly on 2/3 but I'm sending it here
first to get feedback.

Essentially, I refactored a bit to avoid the need to add more
dependencies to rseq, the rseq_tick is now called task_tick_mm_cid (as
before the series) and it does the two things you mentioned:
 * A) trigger the mm_cid recompaction
 * B) trigger an update of the task's rseq->mm_cid field at some point
   after recompaction, so it can get a mm_cid value closer to 0.

Now, A occurs only after the scan time elapsed, which means it could
potentially run multiple times in case the work is not scheduled before
the next tick, I'm not sure adding more checks to make sure it
happens once and only once really makes sense here.

B is occurring after the work updates the last scan time, so we are in a
condition where the runtime is above threshold but the (next) scan time
did not expire yet.
I tried to account for multiple threads updating the mm_cid (not
necessarily the long running one, or in case more are long running), for
this I'm tracking the last time we updated the mm_cid, if that occurred
before the last mm_cid scan, we need to update (and preempt).

Does this make sense to you?

Thanks,
Gabriele

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/linux/rseq.h  | 14 +-------------
 include/linux/sched.h |  1 +
 kernel/sched/core.c   | 42 +++++++++++++++++++++++++++++++++++++++++-
 kernel/sched/sched.h  |  3 +++
 4 files changed, 46 insertions(+), 14 deletions(-)

diff --git a/include/linux/rseq.h b/include/linux/rseq.h
index d20fd72f4c80d..7e3fa2ae9e7a4 100644
--- a/include/linux/rseq.h
+++ b/include/linux/rseq.h
@@ -7,8 +7,6 @@
 #include <linux/preempt.h>
 #include <linux/sched.h>
 
-#define RSEQ_UNPREEMPTED_THRESHOLD	(100ULL * 1000000)	/* 100ms */
-
 /*
  * Map the event mask on the user-space ABI enum rseq_cs_flags
  * for direct mask checks.
@@ -54,14 +52,7 @@ static inline void rseq_preempt(struct task_struct *t)
 {
 	__set_bit(RSEQ_EVENT_PREEMPT_BIT, &t->rseq_event_mask);
 	rseq_set_notify_resume(t);
-}
-
-static inline void rseq_preempt_from_tick(struct task_struct *t)
-{
-	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
-
-	if (rtime > RSEQ_UNPREEMPTED_THRESHOLD)
-		rseq_preempt(t);
+	t->last_rseq_preempt = jiffies;
 }
 
 /* rseq_migrate() requires preemption to be disabled. */
@@ -114,9 +105,6 @@ static inline void rseq_signal_deliver(struct ksignal *ksig,
 static inline void rseq_preempt(struct task_struct *t)
 {
 }
-static inline void rseq_preempt_from_tick(struct task_struct *t)
-{
-}
 static inline void rseq_migrate(struct task_struct *t)
 {
 }
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 851933e62bed3..5b057095d5dc0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1424,6 +1424,7 @@ struct task_struct {
 	int				last_mm_cid;	/* Most recent cid in mm */
 	int				migrate_from_cpu;
 	int				mm_cid_active;	/* Whether cid bitmap is active */
+	unsigned long			last_rseq_preempt; /* Time of last preempt in jiffies */
 #endif
 
 	struct tlbflush_unmap_batch	tlb_ubc;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 52ad709094167..9f0c9cc284804 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5663,7 +5663,7 @@ void sched_tick(void)
 		resched_latency = cpu_resched_latency(rq);
 	calc_global_load_tick(rq);
 	sched_core_tick(rq);
-	rseq_preempt_from_tick(donor);
+	task_tick_mm_cid(rq, donor);
 	scx_tick(rq);
 
 	rq_unlock(rq, &rf);
@@ -10618,6 +10618,46 @@ void init_sched_mm_cid(struct task_struct *t)
 	}
 }
 
+void task_tick_mm_cid(struct rq *rq, struct task_struct *t)
+{
+	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
+
+	/*
+	 * If a task is running unpreempted for a long time, it won't get its
+	 * mm_cid compacted and won't update its mm_cid value after a
+	 * compaction occurs.
+	 * For such a task, this function does two things:
+	 * A) trigger the mm_cid recompaction,
+	 * B) trigger an update of the task's rseq->mm_cid field at some point
+	 * after recompaction, so it can get a mm_cid value closer to 0.
+	 * A change in the mm_cid triggers an rseq_preempt.
+	 *
+	 * A occurs only after the next scan time elapsed but before the
+	 * compaction work is actually scheduled.
+	 * B occurs once after the compaction work completes, that is when scan
+	 * is no longer needed (it occurred for this mm) but the last rseq
+	 * preempt was done before the last mm_cid scan.
+	 */
+	if (t->mm && rtime > RSEQ_UNPREEMPTED_THRESHOLD) {
+		if (mm_cid_needs_scan(t->mm))
+			rseq_set_notify_resume(t);
+		else if (time_after(jiffies, t->last_rseq_preempt +
+				      msecs_to_jiffies(MM_CID_SCAN_DELAY))) {
+			int old_cid = t->mm_cid;
+
+			if (!t->mm_cid_active)
+				return;
+			mm_cid_snapshot_time(rq, t->mm);
+			mm_cid_put_lazy(t);
+			t->last_mm_cid = t->mm_cid = mm_cid_get(rq, t, t->mm);
+			if (old_cid == t->mm_cid)
+				t->last_rseq_preempt = jiffies;
+			else
+				rseq_preempt(t);
+		}
+	}
+}
+
 /* Call only when curr is a user thread. */
 void task_queue_mm_cid(struct task_struct *curr)
 {
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 1703cd16d5433..7d104d12ed974 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3582,12 +3582,14 @@ extern const char *preempt_modes[];
 
 #define SCHED_MM_CID_PERIOD_NS	(100ULL * 1000000)	/* 100ms */
 #define MM_CID_SCAN_DELAY	100			/* 100ms */
+#define RSEQ_UNPREEMPTED_THRESHOLD	SCHED_MM_CID_PERIOD_NS
 
 extern raw_spinlock_t cid_lock;
 extern int use_cid_lock;
 
 extern void sched_mm_cid_migrate_from(struct task_struct *t);
 extern void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t);
+extern void task_tick_mm_cid(struct rq *rq, struct task_struct *t);
 extern void init_sched_mm_cid(struct task_struct *t);
 
 static inline void __mm_cid_put(struct mm_struct *mm, int cid)
@@ -3856,6 +3858,7 @@ static inline void switch_mm_cid(struct rq *rq,
 static inline void switch_mm_cid(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
 static inline void sched_mm_cid_migrate_from(struct task_struct *t) { }
 static inline void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t) { }
+static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *t) { }
 static inline void init_sched_mm_cid(struct task_struct *t) { }
 #endif /* !CONFIG_SCHED_MM_CID */
 

base-commit: c59c19fcfad857c96effa3b2e9eb6d934d2380d8
-- 
2.49.0

