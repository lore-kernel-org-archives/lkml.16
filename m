Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E97D21B9F6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004875; cv=none; b=nneVvr+qkEdj6z41Xsx7c4rhDJ02OlpRS6pyMkmumG4cDE+jPSFqlSdRgqUITD2ueS7Cb8hcuc3XN3+0GZM2CA5OU9ffl3CX12XQ3pIoNqgewPHFY8/QiznGBdpOSxBcuz2iQf7J3CMxgMQCItutgzaoajPxnVIoPov8y+9BHs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004875; c=relaxed/simple;
	bh=hOc3I889hCWGX3bXJ1nGTThXDVk3MT6lhW+gFEfryDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxhqsWkVjBC5P9D9uzsZ7rMNDGsPLH7Mnhx6kkoPKkow30UCxQrHmrtkM3fttxK49QKc5g6P8RujRCqT4BrRdSSJOc/kIr+fWQEGmboZJvUq32/XbyvFXUhrnzP11r9g9zFtLUUO871snPJLFfxdv/KRUegqA0QOKaSHq9jJrVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gVNQ20W2; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gVNQ20W2"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IJCYcs024858;
	Fri, 18 Apr 2025 19:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=e0Ba0
	BvzSqj2uEA0NoVElvU1bafvUeNM0yvrELr9HIk=; b=gVNQ20W2paDVKf9h/1Seo
	oXW/25bbnKs8lMLW4+x3I6kyqdOw3TBBE4neMcP/xOz5axu/xHpOlMBCewxOGgbZ
	x/eDEDpQ1Y0vV/EPhrnvmmI/hMJ4HbPFY7u7YIEWwnYs5dBo/9gDRUQ2zpjPqbb3
	sW1e7mqgYvruZmgZN28wCMlXeJarUkX55iJ8x5/a9GPiobnDYOouG4hhY8y4akYo
	JUV4sl2UDY5oas+gatjABwSnhA/TJw1J2WSlLrBiWjNT1ADCEAfmO69zVx6ypgsV
	7hEwKL5tOfQYvifGLTKdLMkwAGcm7Ou32ZmrAWIPhDQRXj1+YWJOeQDR2zisb6uN
	Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187y0su8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 19:34:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53IIn28j038828;
	Fri, 18 Apr 2025 19:34:14 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4w8qqy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 18 Apr 2025 19:34:14 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de
Subject: [PATCH V2 1/3] Sched: Scheduler time slice extension
Date: Fri, 18 Apr 2025 19:34:08 +0000
Message-ID: <20250418193410.2010058-2-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250418193410.2010058-1-prakash.sangappa@oracle.com>
References: <20250418193410.2010058-1-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504180148
X-Proofpoint-GUID: hiRqszRI5u9GJ_XS5pSjhxVlJd934NTT
X-Proofpoint-ORIG-GUID: hiRqszRI5u9GJ_XS5pSjhxVlJd934NTT

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
---
 include/linux/entry-common.h | 11 +++++--
 include/linux/sched.h        | 18 ++++++++++++
 include/uapi/linux/rseq.h    |  5 ++++
 kernel/entry/common.c        | 21 ++++++++++----
 kernel/rseq.c                | 56 ++++++++++++++++++++++++++++++++++++
 kernel/sched/core.c          | 16 +++++++++++
 kernel/sched/syscalls.c      |  7 +++++
 7 files changed, 126 insertions(+), 8 deletions(-)

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
index 599f077b8019..75abe260de72 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -326,6 +326,7 @@ extern int __must_check io_schedule_prepare(void);
 extern void io_schedule_finish(int token);
 extern long io_schedule_timeout(long timeout);
 extern void io_schedule(void);
+extern void hrtick_local_start(u64 delay);
 
 /**
  * struct prev_cputime - snapshot of system and user cputime
@@ -930,6 +931,9 @@ struct task_struct {
 	struct plist_node		pushable_tasks;
 	struct rb_node			pushable_dl_tasks;
 #endif
+#ifdef CONFIG_RSEQ
+	unsigned			rseq_sched_delay:1;
+#endif
 
 	struct mm_struct		*mm;
 	struct mm_struct		*active_mm;
@@ -2221,6 +2225,20 @@ static inline bool owner_on_cpu(struct task_struct *owner)
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
index c233aae5eac9..ec3b45f32bc8 100644
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
@@ -128,6 +131,8 @@ struct rseq {
 	 * - RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE
 	 *     Inhibit instruction sequence block restart on migration for
 	 *     this thread.
+	 * - RSEQ_CS_DELAY_RESCHED
+	 *     Try delay resched...
 	 */
 	__u32 flags;
 
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 6b7ff1bc1b9b..944027d14198 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -89,7 +89,8 @@ void __weak arch_do_signal_or_restart(struct pt_regs *regs) { }
  * @ti_work:	TIF work flags as read by the caller
  */
 __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
-						     unsigned long ti_work)
+						     unsigned long ti_work,
+						     bool irq)
 {
 	/*
 	 * Before returning to user space ensure that all pending work
@@ -99,8 +100,12 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 
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
@@ -188,6 +193,12 @@ static void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
 
 	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
 
+#ifdef CONFIG_RSEQ
+	/* reschedule if sched delay was granted */
+	if (current->rseq_sched_delay)
+		set_tsk_need_resched(current);
+#endif
+
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
 		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
 			local_irq_enable();
@@ -208,7 +219,7 @@ static __always_inline void __syscall_exit_to_user_mode_work(struct pt_regs *reg
 {
 	syscall_exit_to_user_mode_prepare(regs);
 	local_irq_disable_exit_to_user();
-	exit_to_user_mode_prepare(regs);
+	exit_to_user_mode_prepare(regs, false);
 }
 
 void syscall_exit_to_user_mode_work(struct pt_regs *regs)
@@ -232,7 +243,7 @@ noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
 	instrumentation_begin();
-	exit_to_user_mode_prepare(regs);
+	exit_to_user_mode_prepare(regs, true);
 	instrumentation_end();
 	exit_to_user_mode();
 }
diff --git a/kernel/rseq.c b/kernel/rseq.c
index 442aba29bc4c..9f83d47253ce 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -426,6 +426,62 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
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
+	if (t->rseq_sched_delay)
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
+	t->rseq_sched_delay = 1;
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
+	if (t->rseq_sched_delay)
+		hrtick_local_start(50 * NSEC_PER_USEC);
+#endif
+}
+
+void rseq_delay_resched_tick(void)
+{
+#ifdef CONFIG_SCHED_HRTICK
+	struct task_struct *t = current;
+
+	if (t->rseq_sched_delay)
+		set_tsk_need_resched(t);
+#endif
+}
+
 #ifdef CONFIG_DEBUG_RSEQ
 
 /*
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 165c90ba64ea..cee50e139723 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -823,6 +823,7 @@ void update_rq_clock(struct rq *rq)
 
 static void hrtick_clear(struct rq *rq)
 {
+	rseq_delay_resched_tick();
 	if (hrtimer_active(&rq->hrtick_timer))
 		hrtimer_cancel(&rq->hrtick_timer);
 }
@@ -838,6 +839,8 @@ static enum hrtimer_restart hrtick(struct hrtimer *timer)
 
 	WARN_ON_ONCE(cpu_of(rq) != smp_processor_id());
 
+	rseq_delay_resched_tick();
+
 	rq_lock(rq, &rf);
 	update_rq_clock(rq);
 	rq->donor->sched_class->task_tick(rq, rq->curr, 1);
@@ -911,6 +914,16 @@ void hrtick_start(struct rq *rq, u64 delay)
 
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
@@ -6718,6 +6731,9 @@ static void __sched notrace __schedule(int sched_mode)
 picked:
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();
+#ifdef CONFIG_RSEQ
+	prev->rseq_sched_delay = 0;
+#endif
 #ifdef CONFIG_SCHED_DEBUG
 	rq->last_seen_need_resched_ns = 0;
 #endif
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 3919f03fde57..52cc0714dd43 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -1378,6 +1378,13 @@ static void do_sched_yield(void)
  */
 SYSCALL_DEFINE0(sched_yield)
 {
+#ifdef CONFIG_RSEQ
+	if (current->rseq_sched_delay) {
+		schedule();
+		return 0;
+	}
+#endif
+
 	do_sched_yield();
 	return 0;
 }
-- 
2.43.5

