Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E02BEC4D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634222; cv=none; b=cE+rvkTeCn9c2wfXdJPhixqBC4Mb5RUeMJy4vT1ztg46Urd9hsdVShZggC1jy++8Li5LCBg4uAzsq+YvLbwmaQghmPL1BaFA3zSkrNJxXJX2cFR/RWD73PnOLf3aT1swqrMVO77xjJCgE3/o0ysc8HQBS83huJbYCbfXhGim9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634222; c=relaxed/simple;
	bh=SEaw6XgSnsJ2A5Lh0UZ2LVAXyi0SSrK4mluh+u5Bq/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+aExEzRKL3G/q5A4/d8Q7niVs67SjN+L9b1GmIx57Xj4zOJrxZd35LDDCtEdI0inszjK2GUWe3H/4+AIjXXgUJ/ZH9pbAJ1dkaoJN+RML4RHngnkP2x2PkGhX2UTP7Sk9dEUlMtO8jatRRP+RkGdXFfIm7AOsr6Kamdi+tSiJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJBTWw2G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJBTWw2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744634218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ow1MfSMVKbrqZYsMV1MbMg5z7c6NxQmTZgm3gs391EQ=;
	b=BJBTWw2GXjodxTI96pdEhNeRHLzbj8c/0y/vS7z7ghF4pFxKohyS6fSMKphW5vhRusvk08
	MJSZuwIArINx09m2fS3P4GFjAo063T9YInNHQmsVEl2X4H7IZvJN42sOAP8fElN56E6ajp
	9S94qxWKGTPxK7TQrC/rGAx6hq/vcUM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-c4GkyEx-M7GwuAulNcO8eA-1; Mon,
 14 Apr 2025 08:36:57 -0400
X-MC-Unique: c4GkyEx-M7GwuAulNcO8eA-1
X-Mimecast-MFC-AGG-ID: c4GkyEx-M7GwuAulNcO8eA_1744634216
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D48C1954B36;
	Mon, 14 Apr 2025 12:36:56 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.225.177])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D06F4180B487;
	Mon, 14 Apr 2025 12:36:53 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	"To: Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
	"To: Peter Zijlstra" <peterz@infradead.org>,
	"To: Ingo Molnar" <mingo@redhat.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v13 2/3] sched: Move task_mm_cid_work to mm work_struct
Date: Mon, 14 Apr 2025 14:36:33 +0200
Message-ID: <20250414123630.177385-7-gmonaco@redhat.com>
In-Reply-To: <20250414123630.177385-5-gmonaco@redhat.com>
References: <20250414123630.177385-5-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Currently, the task_mm_cid_work function is called in a task work
triggered by a scheduler tick to frequently compact the mm_cids of each
process. This can delay the execution of the corresponding thread for
the entire duration of the function, negatively affecting the response
in case of real time tasks. In practice, we observe task_mm_cid_work
increasing the latency of 30-35us on a 128 cores system, this order of
magnitude is meaningful under PREEMPT_RT.

Run the task_mm_cid_work in a new work_struct connected to the
mm_struct rather than in the task context before returning to
userspace.

This work_struct is initialised with the mm and disabled before freeing
it. The queuing of the work happens while returning to userspace in
__rseq_handle_notify_resume, maintaining the checks to avoid running
more frequently than MM_CID_SCAN_DELAY.
To make sure this happens predictably also on long running tasks, we
trigger a call to __rseq_handle_notify_resume also from the scheduler
tick if the runtime exceeded a 100ms threshold.

The main advantage of this change is that the function can be offloaded
to a different CPU and even preempted by RT tasks.

Moreover, this new behaviour is more predictable with periodic tasks
with short runtime, which may rarely run during a scheduler tick.
Now, the work is always scheduled when the task returns to userspace.

The work is disabled during mmdrop, since the function cannot sleep in
all kernel configurations, we cannot wait for possibly running work
items to terminate. We make sure the mm is valid in case the task is
terminating by reserving it with mmgrab/mmdrop, returning prematurely if
we are really the last user while the work gets to run.
This situation is unlikely since we don't schedule the work for exiting
tasks, but we cannot rule it out.

Fixes: 223baf9d17f2 ("sched: Fix performance regression introduced by mm_cid")
Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/linux/mm_types.h | 26 ++++++++++++++
 include/linux/sched.h    |  8 ++++-
 kernel/rseq.c            |  2 ++
 kernel/sched/core.c      | 75 ++++++++++++++++++++++++++--------------
 kernel/sched/sched.h     |  6 ++--
 5 files changed, 89 insertions(+), 28 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 56d07edd01f91..e4ae9295508cf 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -982,6 +982,10 @@ struct mm_struct {
 		 * mm nr_cpus_allowed updates.
 		 */
 		raw_spinlock_t cpus_allowed_lock;
+		/*
+		 * @cid_work: Work item to run the mm_cid scan.
+		 */
+		struct work_struct cid_work;
 #endif
 #ifdef CONFIG_MMU
 		atomic_long_t pgtables_bytes;	/* size of all page tables */
@@ -1282,6 +1286,8 @@ enum mm_cid_state {
 	MM_CID_LAZY_PUT = (1U << 31),
 };
 
+extern void task_mm_cid_work(struct work_struct *work);
+
 static inline bool mm_cid_is_unset(int cid)
 {
 	return cid == MM_CID_UNSET;
@@ -1354,12 +1360,14 @@ static inline int mm_alloc_cid_noprof(struct mm_struct *mm, struct task_struct *
 	if (!mm->pcpu_cid)
 		return -ENOMEM;
 	mm_init_cid(mm, p);
+	INIT_WORK(&mm->cid_work, task_mm_cid_work);
 	return 0;
 }
 #define mm_alloc_cid(...)	alloc_hooks(mm_alloc_cid_noprof(__VA_ARGS__))
 
 static inline void mm_destroy_cid(struct mm_struct *mm)
 {
+	disable_work(&mm->cid_work);
 	free_percpu(mm->pcpu_cid);
 	mm->pcpu_cid = NULL;
 }
@@ -1381,6 +1389,16 @@ static inline void mm_set_cpus_allowed(struct mm_struct *mm, const struct cpumas
 	WRITE_ONCE(mm->nr_cpus_allowed, cpumask_weight(mm_allowed));
 	raw_spin_unlock(&mm->cpus_allowed_lock);
 }
+
+static inline bool mm_cid_needs_scan(struct mm_struct *mm)
+{
+	return mm && !time_before(jiffies, READ_ONCE(mm->mm_cid_next_scan));
+}
+
+static inline bool mm_cid_scan_pending(struct mm_struct *mm)
+{
+	return mm && work_pending(&mm->cid_work);
+}
 #else /* CONFIG_SCHED_MM_CID */
 static inline void mm_init_cid(struct mm_struct *mm, struct task_struct *p) { }
 static inline int mm_alloc_cid(struct mm_struct *mm, struct task_struct *p) { return 0; }
@@ -1391,6 +1409,14 @@ static inline unsigned int mm_cid_size(void)
 	return 0;
 }
 static inline void mm_set_cpus_allowed(struct mm_struct *mm, const struct cpumask *cpumask) { }
+static inline bool mm_cid_needs_scan(struct mm_struct *mm)
+{
+	return false;
+}
+static inline bool mm_cid_scan_pending(struct mm_struct *mm)
+{
+	return false;
+}
 #endif /* CONFIG_SCHED_MM_CID */
 
 struct mmu_gather;
diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac19828934..3ffdb96ef6b0a 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1424,7 +1424,7 @@ struct task_struct {
 	int				last_mm_cid;	/* Most recent cid in mm */
 	int				migrate_from_cpu;
 	int				mm_cid_active;	/* Whether cid bitmap is active */
-	struct callback_head		cid_work;
+	unsigned long			last_cid_reset;	/* Time of last reset in jiffies */
 #endif
 
 	struct tlbflush_unmap_batch	tlb_ubc;
@@ -2281,4 +2281,10 @@ static __always_inline void alloc_tag_restore(struct alloc_tag *tag, struct allo
 #define alloc_tag_restore(_tag, _old)		do {} while (0)
 #endif
 
+#ifdef CONFIG_SCHED_MM_CID
+extern void task_queue_mm_cid(struct task_struct *curr);
+#else
+static inline void task_queue_mm_cid(struct task_struct *curr) { }
+#endif
+
 #endif
diff --git a/kernel/rseq.c b/kernel/rseq.c
index b7a1ec327e811..383db2ccad4d0 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -441,6 +441,8 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
 	}
 	if (unlikely(rseq_update_cpu_node_id(t)))
 		goto error;
+	if (mm_cid_needs_scan(t->mm))
+		task_queue_mm_cid(t);
 	return;
 
 error:
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba05..02b18649e6a09 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10566,22 +10566,16 @@ static void sched_mm_cid_remote_clear_weight(struct mm_struct *mm, int cpu,
 	sched_mm_cid_remote_clear(mm, pcpu_cid, cpu);
 }
 
-static void task_mm_cid_work(struct callback_head *work)
+void task_mm_cid_work(struct work_struct *work)
 {
 	unsigned long now = jiffies, old_scan, next_scan;
-	struct task_struct *t = current;
 	struct cpumask *cidmask;
-	struct mm_struct *mm;
+	struct mm_struct *mm = container_of(work, struct mm_struct, cid_work);
 	int weight, cpu;
 
-	WARN_ON_ONCE(t != container_of(work, struct task_struct, cid_work));
-
-	work->next = work;	/* Prevent double-add */
-	if (t->flags & PF_EXITING)
-		return;
-	mm = t->mm;
-	if (!mm)
-		return;
+	/* We are the last user, process already terminated. */
+	if (atomic_read(&mm->mm_count) == 1)
+		goto out_drop;
 	old_scan = READ_ONCE(mm->mm_cid_next_scan);
 	next_scan = now + msecs_to_jiffies(MM_CID_SCAN_DELAY);
 	if (!old_scan) {
@@ -10594,9 +10588,9 @@ static void task_mm_cid_work(struct callback_head *work)
 			old_scan = next_scan;
 	}
 	if (time_before(now, old_scan))
-		return;
+		goto out_drop;
 	if (!try_cmpxchg(&mm->mm_cid_next_scan, &old_scan, next_scan))
-		return;
+		goto out_drop;
 	cidmask = mm_cidmask(mm);
 	/* Clear cids that were not recently used. */
 	for_each_possible_cpu(cpu)
@@ -10608,6 +10602,8 @@ static void task_mm_cid_work(struct callback_head *work)
 	 */
 	for_each_possible_cpu(cpu)
 		sched_mm_cid_remote_clear_weight(mm, cpu, weight);
+out_drop:
+	mmdrop(mm);
 }
 
 void init_sched_mm_cid(struct task_struct *t)
@@ -10620,23 +10616,52 @@ void init_sched_mm_cid(struct task_struct *t)
 		if (mm_users == 1)
 			mm->mm_cid_next_scan = jiffies + msecs_to_jiffies(MM_CID_SCAN_DELAY);
 	}
-	t->cid_work.next = &t->cid_work;	/* Protect against double add */
-	init_task_work(&t->cid_work, task_mm_cid_work);
 }
 
-void task_tick_mm_cid(struct rq *rq, struct task_struct *curr)
+void task_tick_mm_cid(struct rq *rq, struct task_struct *t)
 {
-	struct callback_head *work = &curr->cid_work;
-	unsigned long now = jiffies;
+	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
 
-	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) ||
-	    work->next != work)
-		return;
-	if (time_before(now, READ_ONCE(curr->mm->mm_cid_next_scan)))
-		return;
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
+	 * A occurs only once after the scan time elapsed, until the next scan
+	 * expires as well.
+	 * B occurs once after the compaction work completes, that is when scan
+	 * is no longer needed (it occurred for this mm) but the last rseq
+	 * preempt was done before the last mm_cid scan.
+	 */
+	if (t->mm && rtime > RSEQ_UNPREEMPTED_THRESHOLD) {
+		if (mm_cid_needs_scan(t->mm) && !mm_cid_scan_pending(t->mm))
+			rseq_set_notify_resume(t);
+		else if (time_after(jiffies, t->last_cid_reset +
+				      msecs_to_jiffies(MM_CID_SCAN_DELAY))) {
+			int old_cid = t->mm_cid;
+
+			if (!t->mm_cid_active)
+				return;
+			mm_cid_snapshot_time(rq, t->mm);
+			mm_cid_put_lazy(t);
+			t->last_mm_cid = t->mm_cid = mm_cid_get(rq, t, t->mm);
+			if (old_cid != t->mm_cid)
+				rseq_preempt(t);
+		}
+	}
+}
 
-	/* No page allocation under rq lock */
-	task_work_add(curr, work, TWA_RESUME);
+/* Call only when curr is a user thread. */
+void task_queue_mm_cid(struct task_struct *curr)
+{
+	/* Ensure the mm exists when we run. */
+	mmgrab(curr->mm);
+	queue_work(system_unbound_wq, &curr->mm->cid_work);
 }
 
 void sched_mm_cid_exit_signals(struct task_struct *t)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 47972f34ea701..c0f8fd4c575c3 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3582,13 +3582,14 @@ extern const char *preempt_modes[];
 
 #define SCHED_MM_CID_PERIOD_NS	(100ULL * 1000000)	/* 100ms */
 #define MM_CID_SCAN_DELAY	100			/* 100ms */
+#define RSEQ_UNPREEMPTED_THRESHOLD	SCHED_MM_CID_PERIOD_NS
 
 extern raw_spinlock_t cid_lock;
 extern int use_cid_lock;
 
 extern void sched_mm_cid_migrate_from(struct task_struct *t);
 extern void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t);
-extern void task_tick_mm_cid(struct rq *rq, struct task_struct *curr);
+extern void task_tick_mm_cid(struct rq *rq, struct task_struct *t);
 extern void init_sched_mm_cid(struct task_struct *t);
 
 static inline void __mm_cid_put(struct mm_struct *mm, int cid)
@@ -3798,6 +3799,7 @@ static inline int mm_cid_get(struct rq *rq, struct task_struct *t,
 	cid = __mm_cid_get(rq, t, mm);
 	__this_cpu_write(pcpu_cid->cid, cid);
 	__this_cpu_write(pcpu_cid->recent_cid, cid);
+	t->last_cid_reset = jiffies;
 
 	return cid;
 }
@@ -3857,7 +3859,7 @@ static inline void switch_mm_cid(struct rq *rq,
 static inline void switch_mm_cid(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
 static inline void sched_mm_cid_migrate_from(struct task_struct *t) { }
 static inline void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t) { }
-static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *curr) { }
+static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *t) { }
 static inline void init_sched_mm_cid(struct task_struct *t) { }
 #endif /* !CONFIG_SCHED_MM_CID */
 
-- 
2.49.0

