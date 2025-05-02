Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EDA4430
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 02:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151222; cv=none; b=HDhIwOC4eKvm+7l8rXonOeKnm0iRBPTVH3+PQ5srGuRtc12BVoNcYR11HzL4pQ+GPo5tA2RjlWf2FHZfs1FsWWTHJp/qx9jwu2pqMjY0K6rIpCce026zrKCeKG/PwMH0RDFVF2ANYVSY++6dZclyY7XuTXKKwrxIbxeBj37N6HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151222; c=relaxed/simple;
	bh=Y9RhFFi7+7w1Xv0CEDV1TvMMTLeSJOp/V5irmpAK2LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/XlMTrRnlYlKbu8Q/0gDp89yxfMhqrFTJ9fKeGw9fWbHNqV6nVZFQ8rhll/wLTWrv36S8nV3sX8tAX/wYKybFWXbIzrbDQtIoMeE3FN/rxZIkaC7qKQxQd5wGjiE/ZB3VEvm2+E2OXZWqoHEA0aI3M1KpGHvvX4oZC8eGo1huw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QfEO6sTg; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QfEO6sTg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Keg1Y009089;
	Fri, 2 May 2025 01:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=dLFqY
	KVzVYEJ14JdJPse3+8YrSesXxizWv5nUco8Hb0=; b=QfEO6sTg9ZMlfUnZxWlUX
	ywTsyktrmgBCNLz6BCebmFPtlTdgVbRLVV8RdAdt8cdbHQSFUmWPcKtse+S/N35i
	L/TIe2TENcdKuKJkPfbFOLjkLVNlNvUMH9k3RmAlM/rIIuu4OfiojNRl3cGozZhX
	BdkSjsqg0aaSoDIGYmjOJ3subkBg6fCfyrLS4KtmoxF2773Nf9TiUrYNO8K+z3gM
	mwtq5QCL39i3oAofbqloXVW5sQtcA/mUv8XKE45MGFRuDmGWZWToNwuugTWmrcKE
	kaWBWj1Qmx3fZfYODK7Kc8t65h9u9Jga94dhpjsoHDjb9YMYeSYLEeMHjFi3dRrE
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ukmdxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 01:59:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5421aMDS035421;
	Fri, 2 May 2025 01:59:57 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxd1euw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 02 May 2025 01:59:57 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V3 1/4] Sched: Scheduler time slice extension
Date: Fri,  2 May 2025 01:59:52 +0000
Message-ID: <20250502015955.3146733-2-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505020013
X-Authority-Analysis: v=2.4 cv=MIZgmNZl c=1 sm=1 tr=0 ts=6814271e b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=dt9VzEwgFbYA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=kB6fCMDy4_io11iu5P8A:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:14638
X-Proofpoint-GUID: XzCahc1bJtLpcPmooIh_9uce6C5ufBZQ
X-Proofpoint-ORIG-GUID: XzCahc1bJtLpcPmooIh_9uce6C5ufBZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAxMyBTYWx0ZWRfX50/KUysRUoWB mp5DtPXbF83MK7//T9/ybbcAruUEVXeriLz8AEEyAING/mmppr9m7jNPQ2gWk/i5Oqf/kWkb0ET tGLG4a5iqS0Leum116ETAtYdf4zYepj6NUwqg38Vp9eCx7XLa2gz/O7mCTzMjjCM9FZ/EUsJU3h
 +v+gWmmMRG0G6GbrLrWZYoRCcS+FpILiVD4673NgDB9+SniWTi4gOXR+6k1AG19M/vDpIJLtuvL 7x06pVZHBEOO8jtcrPSgftaSIn6Ohs95sXvkDIQM6eq0vB4AnnfDZOTIw3u+hHfUfqv9bmK9CnM 9RLJNcgCkuSx/OifeOKD0gKx91MeNUm1nU3wvcj/UVAYmlc90MkjZXlPeYO/8MJup47kI7PTJ2p
 t40RYzloY7oDvL2tvalrlWZLfotnqPzoqSJcKWtemDQaW/bbn77CMVbHCXQoftK98BIN51MB

Add support for a thread to request extending its execution time slice on
the cpu. The extra cpu time granted would help in allowing the thread to
complete executing the critical section and drop any locks without getting
preempted. The thread would request this cpu time extension, by setting a
bit in the restartable sequences(rseq) structure registered with the kernel.

Kernel will grant a 50us extension on the cpu, when it sees the bit set.
With the help of a timer, kernel force preempts the thread if it is still
running on the cpu when the 50us timer expires. The thread should yield
the cpu by making a system call after completing the critical section.

Suggested-by: Peter Ziljstra <peterz@infradead.org>
Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
v2:
- Add check in syscall_exit_to_user_mode_prepare() and reschedule if
  thread has 'rseq_sched_delay' set.
v3:
- Rename rseq_sched_delay -> sched_time_delay and move near other bits
  in struct task_struct.
- Use IS_ENABLED() check to access 'sched_time_delay' instead of #ifdef
- Modify coment describing RSEQ_CS_FLAG_DELAY_RESCHED flag.
- Remove rseq_delay_resched_tick() call from hrtick_clear().
---
 include/linux/entry-common.h | 11 +++++--
 include/linux/sched.h        | 16 +++++++++++
 include/uapi/linux/rseq.h    |  7 +++++
 kernel/entry/common.c        | 19 ++++++++----
 kernel/rseq.c                | 56 ++++++++++++++++++++++++++++++++++++
 kernel/sched/core.c          | 14 +++++++++
 kernel/sched/syscalls.c      |  5 ++++
 7 files changed, 120 insertions(+), 8 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index fc61d0205c97..cec343f95210 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -303,7 +303,8 @@ void arch_do_signal_or_restart(struct pt_regs *regs);
  * exit_to_user_mode_loop - do any pending work before leaving to user space
  */
 unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
-				     unsigned long ti_work);
+				     unsigned long ti_work,
+				     bool irq);
 
 /**
  * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
@@ -315,7 +316,8 @@ unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
  *    EXIT_TO_USER_MODE_WORK are set
  * 4) check that interrupts are still disabled
  */
-static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
+static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs,
+						bool irq)
 {
 	unsigned long ti_work;
 
@@ -326,7 +328,10 @@ static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
 
 	ti_work = read_thread_flags();
 	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
-		ti_work = exit_to_user_mode_loop(regs, ti_work);
+		ti_work = exit_to_user_mode_loop(regs, ti_work, irq);
+
+	if (irq)
+		rseq_delay_resched_fini();
 
 	arch_exit_to_user_mode_prepare(regs, ti_work);
 
diff --git a/include/linux/sched.h b/include/linux/sched.h
index c08fd199be4e..14bf0508bfca 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -339,6 +339,7 @@ extern int __must_check io_schedule_prepare(void);
 extern void io_schedule_finish(int token);
 extern long io_schedule_timeout(long timeout);
 extern void io_schedule(void);
+extern void hrtick_local_start(u64 delay);
 
 /* wrapper function to trace from this header file */
 DECLARE_TRACEPOINT(sched_set_state_tp);
@@ -1044,6 +1045,7 @@ struct task_struct {
 	/* delay due to memory thrashing */
 	unsigned                        in_thrashing:1;
 #endif
+	unsigned			sched_time_delay:1;
 #ifdef CONFIG_PREEMPT_RT
 	struct netdev_xmit		net_xmit;
 #endif
@@ -2249,6 +2251,20 @@ static inline bool owner_on_cpu(struct task_struct *owner)
 unsigned long sched_cpu_util(int cpu);
 #endif /* CONFIG_SMP */
 
+#ifdef CONFIG_RSEQ
+
+extern bool rseq_delay_resched(void);
+extern void rseq_delay_resched_fini(void);
+extern void rseq_delay_resched_tick(void);
+
+#else
+
+static inline bool rseq_delay_resched(void) { return false; }
+static inline void rseq_delay_resched_fini(void) { }
+static inline void rseq_delay_resched_tick(void) { }
+
+#endif
+
 #ifdef CONFIG_SCHED_CORE
 extern void sched_core_free(struct task_struct *tsk);
 extern void sched_core_fork(struct task_struct *p);
diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
index c233aae5eac9..900cb75f6a88 100644
--- a/include/uapi/linux/rseq.h
+++ b/include/uapi/linux/rseq.h
@@ -26,6 +26,7 @@ enum rseq_cs_flags_bit {
 	RSEQ_CS_FLAG_NO_RESTART_ON_PREEMPT_BIT	= 0,
 	RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT	= 1,
 	RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT	= 2,
+	RSEQ_CS_FLAG_DELAY_RESCHED_BIT		= 3,
 };
 
 enum rseq_cs_flags {
@@ -35,6 +36,8 @@ enum rseq_cs_flags {
 		(1U << RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT),
 	RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE	=
 		(1U << RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT),
+	RSEQ_CS_FLAG_DELAY_RESCHED		=
+		(1U << RSEQ_CS_FLAG_DELAY_RESCHED_BIT),
 };
 
 /*
@@ -128,6 +131,10 @@ struct rseq {
 	 * - RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE
 	 *     Inhibit instruction sequence block restart on migration for
 	 *     this thread.
+	 * - RSEQ_CS_DELAY_RESCHED
+	 *     Request by user task to try delaying preemption. With
+	 *     use of a timer, extra cpu time upto 50us is granted for this
+	 *     thread before being rescheduled.
 	 */
 	__u32 flags;
 
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 20154572ede9..b26adccb32df 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -88,7 +88,8 @@ void __weak arch_do_signal_or_restart(struct pt_regs *regs) { }
  * @ti_work:	TIF work flags as read by the caller
  */
 __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
-						     unsigned long ti_work)
+						     unsigned long ti_work,
+						     bool irq)
 {
 	/*
 	 * Before returning to user space ensure that all pending work
@@ -98,8 +99,12 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 
 		local_irq_enable_exit_to_user(ti_work);
 
-		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
-			schedule();
+		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
+		       if (irq && rseq_delay_resched())
+			       clear_tsk_need_resched(current);
+		       else
+			       schedule();
+		}
 
 		if (ti_work & _TIF_UPROBE)
 			uprobe_notify_resume(regs);
@@ -184,6 +189,10 @@ static void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
 
 	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
 
+	/* reschedule if sched delay was granted */
+	if (IS_ENABLED(CONFIG_RSEQ) && current->sched_time_delay)
+		set_tsk_need_resched(current);
+
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
 		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
 			local_irq_enable();
@@ -204,7 +213,7 @@ static __always_inline void __syscall_exit_to_user_mode_work(struct pt_regs *reg
 {
 	syscall_exit_to_user_mode_prepare(regs);
 	local_irq_disable_exit_to_user();
-	exit_to_user_mode_prepare(regs);
+	exit_to_user_mode_prepare(regs, false);
 }
 
 void syscall_exit_to_user_mode_work(struct pt_regs *regs)
@@ -228,7 +237,7 @@ noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
 	instrumentation_begin();
-	exit_to_user_mode_prepare(regs);
+	exit_to_user_mode_prepare(regs, true);
 	instrumentation_end();
 	exit_to_user_mode();
 }
diff --git a/kernel/rseq.c b/kernel/rseq.c
index b7a1ec327e81..0ecd16e01712 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -448,6 +448,62 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
 	force_sigsegv(sig);
 }
 
+bool rseq_delay_resched(void)
+{
+	struct task_struct *t = current;
+	u32 flags;
+
+	if (!IS_ENABLED(CONFIG_SCHED_HRTICK))
+		return false;
+
+	if (!t->rseq)
+		return false;
+
+	if (t->sched_time_delay)
+		return false;
+
+	if (copy_from_user_nofault(&flags, &t->rseq->flags, sizeof(flags)))
+		return false;
+
+	if (!(flags & RSEQ_CS_FLAG_DELAY_RESCHED))
+		return false;
+
+	flags &= ~RSEQ_CS_FLAG_DELAY_RESCHED;
+	if (copy_to_user_nofault(&t->rseq->flags, &flags, sizeof(flags)))
+		return false;
+
+	t->sched_time_delay = 1;
+
+	return true;
+}
+
+void rseq_delay_resched_fini(void)
+{
+#ifdef CONFIG_SCHED_HRTICK
+	extern void hrtick_local_start(u64 delay);
+	struct task_struct *t = current;
+	/*
+	 * IRQs off, guaranteed to return to userspace, start timer on this CPU
+	 * to limit the resched-overdraft.
+	 *
+	 * If your critical section is longer than 50 us you get to keep the
+	 * pieces.
+	 */
+	if (t->sched_time_delay)
+		hrtick_local_start(50 * NSEC_PER_USEC);
+#endif
+}
+
+void rseq_delay_resched_tick(void)
+{
+#ifdef CONFIG_SCHED_HRTICK
+	struct task_struct *t = current;
+
+	if (t->sched_time_delay)
+		set_tsk_need_resched(t);
+#endif
+}
+
 #ifdef CONFIG_DEBUG_RSEQ
 
 /*
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 4de24eefe661..8c8960245ec0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -844,6 +844,8 @@ static enum hrtimer_restart hrtick(struct hrtimer *timer)
 
 	WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
 
+	rseq_delay_resched_tick();
+
 	rq_lock(rq, &rf);
 	update_rq_clock(rq);
 	rq->donor->sched_class->task_tick(rq, rq->curr, 1);
@@ -917,6 +919,16 @@ void hrtick_start(struct rq *rq, u64 delay)
 
 #endif /* CONFIG_SMP */
 
+void hrtick_local_start(u64 delay)
+{
+	struct rq *rq = this_rq();
+	struct rq_flags rf;
+
+	rq_lock(rq, &rf);
+	hrtick_start(rq, delay);
+	rq_unlock(rq, &rf);
+}
+
 static void hrtick_rq_init(struct rq *rq)
 {
 #ifdef CONFIG_SMP
@@ -6722,6 +6734,8 @@ static void __sched notrace __schedule(int sched_mode)
 picked:
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();
+	if (IS_ENABLED(CONFIG_RSEQ))
+		prev->sched_time_delay = 0;
 	rq->last_seen_need_resched_ns = 0;
 
 	is_switch = prev != next;
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index cd38f4e9899d..1b2b64fe0fb1 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -1378,6 +1378,11 @@ static void do_sched_yield(void)
  */
 SYSCALL_DEFINE0(sched_yield)
 {
+	if (IS_ENABLED(CONFIG_RSEQ) && current->sched_time_delay) {
+		schedule();
+		return 0;
+	}
+
 	do_sched_yield();
 	return 0;
 }
-- 
2.43.5

