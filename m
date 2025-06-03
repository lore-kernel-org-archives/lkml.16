Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132CA238C06
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993840; cv=none; b=CzYFxrTG4fLsf6I4KAhBYA1WNrpw5zvaTqjuBMtA/dSTt1vlYMesHw1EerqM/pLNweW/oE9l080o0oZq7bRwycI9LIfW7i/6S7UYLog2s7wzcrWlL84f7mrPa82NqIPyINGWASaD82bAvODxNTqZVwEajyxp0IUmaYh8q5WA2YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993840; c=relaxed/simple;
	bh=a+nPW8Ip1Nz+gcdTaixLNifQPbeU9IfAWcCfFwY5RVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBHE+7VRei3Eym+wKpIaAU/EhEBfqLTHSStXx7WNVaip7m+3VOIr3C1IEpLoZNg9C5uHFI7kYYHM/cIKCpRVYgNBQDWgudh3sD3+wE/5+JgMrXrMrqMUpu96Sml5qmcDCNKQqH4ra997B1PEn54DXEV/+3e+zSIzCOAF4zaXcsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VOIp8G6b; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VOIp8G6b"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MN5hO003901;
	Tue, 3 Jun 2025 23:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=6xprP
	p3NYiZknTpQcWOh24x9izQJbm+YrYkGWNufubs=; b=VOIp8G6bzKw6568ROH3Vp
	xC7YeMmLs1Xp1w9WTEWionirzjRxll78Qosm8mbp4d/NSGOJsDjuNre26C8V5YT/
	7fBPjxrw5wfuFhQTkUwhPs4yeYolsVilpIxv4qUmxRZ96xBX5r09Slb9QPj3oIF2
	qnYAiYXcRDmPYFDyFHoPaX0d8mmgq6HCFvPekuNM+yzZvOumPfIdShoqYZlmVQOW
	OksXbMR4OruWEHHiAX23TOSB2fDVDfOC8ytUmGwwB9y4pEk1zPukCYStRjYPCRSk
	4fAzLlXIRA+rKhOTMTarYHKB0FZjilG3o65jYmKubjCSKpL9hyu+slcVqJlydvx9
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8gawfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 23:36:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553MtHqt030803;
	Tue, 3 Jun 2025 23:36:56 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a2j93-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 03 Jun 2025 23:36:56 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V5 1/6] Sched: Scheduler time slice extension
Date: Tue,  3 Jun 2025 23:36:49 +0000
Message-ID: <20250603233654.1838967-2-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDIwMiBTYWx0ZWRfXyPpcCE55tUEY OG0sLXtaLn9B8n4u/8Kmu9rdViS335PSBTfrjEZdiyUJC82xKyl+PFmoQitnb7tcd5RzpJku0ep sqatlx5N0prQ/ytCqLF1r6mCtIapTicjD2GVMQR9vwOECRYyi13YVa0lwt5yAGbwQt71aX1bUT/
 OgJJtQBgp2N995pd9AmPD5h7Ke9UPOjotBd5qO+8poi3KeXBlJ8Xf9LtHKPxw4MAvorA5I6vTN8 TXeq65OI17b5P62nvAorGs2/huw76waqp8fofQDQ4BX+F6vv1eWKQCMl6AjTiBn/2lydSOnMtLI Cz9cW7L9mMMedr3VuMDkiaHGrpvAv7HiqwmqgeX/6Pkh57l8kjUR+8gmCbw64QoIqUnGfQKI5Od
 p1hKEcvsInsxr6ao7k7CqhUv0Yv5h5W+jDKrgqveqZ5zLBPHH1oT16ITIXubGvzp4m5wT+6T
X-Proofpoint-GUID: KF289qAE7jd7GHpJp9kcGQ7Tm0zF9jJE
X-Proofpoint-ORIG-GUID: KF289qAE7jd7GHpJp9kcGQ7Tm0zF9jJE
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=683f8719 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=kB6fCMDy4_io11iu5P8A:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:14714

Add support for a thread to request extending its execution time slice on
the cpu. The extra cpu time granted would help in allowing the thread to
complete executing the critical section and drop any locks without getting
preempted. The thread would request this cpu time extension, by setting a
bit in the restartable sequences(rseq) structure registered with the kernel.

Kernel will grant a 30us extension on the cpu, when it sees the bit set.
With the help of a timer, kernel force preempts the thread if it is still
running on the cpu when the 30us timer expires. The thread should yield
the cpu by making a system call after completing the critical section.

Suggested-by: Peter Ziljstra <peterz@infradead.org>
Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
v4:
- Changed default sched delay extension time to 30us
v3:
- Rename rseq_sched_delay -> sched_time_delay and move near other bits
  in struct task_struct.
- Use IS_ENABLED() check to access 'sched_time_delay' instead of #ifdef
- Modify coment describing RSEQ_CS_FLAG_DELAY_RESCHED flag.
- Remove rseq_delay_resched_tick() call from hrtick_clear().
v2:
- Add check in syscall_exit_to_user_mode_prepare() and reschedule if
  thread has 'rseq_sched_delay' set.
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
index c233aae5eac9..25fc636b17d5 100644
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
+	 * - RSEQ_CS_FLAG_DELAY_RESCHED
+	 *     Request by user thread to delay preemption. With use
+	 *     of a timer, kernel grants extra cpu time upto 30us for this
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
index b7a1ec327e81..dba44ca9f624 100644
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
+	 * If your critical section is longer than 30 us you get to keep the
+	 * pieces.
+	 */
+	if (t->sched_time_delay)
+		hrtick_local_start(30 * NSEC_PER_USEC);
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

