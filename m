Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B435B13D8B1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330321; cv=none; b=BlfXNjA/A3lYnxAIme0fQzxMzJSWbU0iGTn36rg8ZYz/ybgIJWBtJ/VFXlpguI3FlXWxmAWrexmhJ4VlYa5xUp0jdxHsoi2H/nLGzuXgtb0FQacaWJ7ODN+S5exkj8Cnzh2mIRZ0c3zlRfOvvzYuJjJ8iJ8iFSnm7erv9kFI/Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330321; c=relaxed/simple;
	bh=sHITr8kRCc4egyLqs5lJZo2zVFBSehDXwgebHkZjIA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTE7HeOOWpJJULlAPDm0hHfPhfqEgowMlicn96IsMcjsfmcvW7dU9lBGlUSjGfCYW7k6kchsuj39OD425MdZ1Zrjwie2WZlKRnltWQYWRwHByFA+fIPw5FXPZGYXfi+Y0gIdQdWR+iY8zUXUhkL+ay4qqV/y4Tgo4vjcFFu4tYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JQBHDoB8; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JQBHDoB8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIC8cO003843;
	Tue, 1 Jul 2025 00:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=H/KXq
	+38CRxvMA/KdN4XNLyDOdGoZL/qPwprstHaWLA=; b=JQBHDoB8ALscuBpp6grPZ
	RYO2OrHk0hyjjhchanw6esHOm/31TJkZB0APZ6sFQX6PMvBvqiM2FYCVRPshuUsJ
	hZHqzIHCuPc8gbFIkTdA+VN93b5uS3PJ9ZO70RDBjDzUcv1QSLPy+buN/Z016jrX
	L9njtVOYc/J0igTf/0AfVpz0F0puahjTk9EufXKNf/r+wiDezFUhh1kFYLO9pPNu
	IAkTFj9iGHkNleHZIXy7A27jg3Ls7sHboAjSxw0zW1fm+mO25IzoyG2ZY7luY1GM
	o3gHDGGAX3rOTwwWJeZI+fZKKt50JpM1bsO05jUqlJ4VYbjdZhZRSZMvjWNHfKPE
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w3k33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 00:38:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UNDxNd009139;
	Tue, 1 Jul 2025 00:38:09 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u92pxj-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 01 Jul 2025 00:38:09 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V6 7/7] Introduce a config option for scheduler time slice extension feature
Date: Tue,  1 Jul 2025 00:37:49 +0000
Message-ID: <20250701003749.50525-8-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250701003749.50525-1-prakash.sangappa@oracle.com>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_06,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010002
X-Proofpoint-GUID: GYsKCXv2VZOXgQsES73YwaiY7EG0n_80
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMiBTYWx0ZWRfX9k7vcaE7sFRT jJK/yfsGS3TaBA0XOQbXxHLftj0Pop9MJobsh7y9snk3e7rJbqu7djJihwSjZR2nIOyO0pk7Pap 2aVVPXwaKwBKw/WfXiio4rEklPic9I3+w9NzvbOmEhi1tpBxVBWv30LhhJEvoPnlPtR0gqgO8Ut
 0hUptt/Fgx6YG4KzzgLvPYZXWqvzTj2HQWKXI+Pe968WzO3N6wivdveBRbPHxuQEGmJcODFdv+I bDVv/qnBhRhxPdiQWN4ruzpj2gnYFES3oG2m6ZOOSX8cVaAT4rsFXK+waSjda/O8548f/hwZlDH UfqRNeab1otDJsrk1YdfpSz4RB/p1e6CIe7l2Bra4f2KnEkH1zbzhkxy+RPrdhR7GFIzuyi2t7W
 JmpbQQrfH7yiQHwij60u5QMDDLoxRWdO3Og0pBp6+UK04mfdkeJt22nFYYuvZOmHQokqkM6u
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=68632df2 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=V5MaIScRyTJAW4VN5IkA:9 cc=ntf awl=host:14723
X-Proofpoint-ORIG-GUID: GYsKCXv2VZOXgQsES73YwaiY7EG0n_80

Add a config option to enable schedule time slice extension.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/linux/entry-common.h |  2 +-
 include/linux/sched.h        |  8 ++++----
 init/Kconfig                 |  7 +++++++
 kernel/rseq.c                |  5 ++++-
 kernel/sched/core.c          | 12 ++++++------
 kernel/sched/debug.c         |  2 +-
 kernel/sched/syscalls.c      |  3 ++-
 7 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index d4fa952e394e..351c9dc159bc 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -402,7 +402,7 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
 	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
 
 	/* reschedule if sched delay was granted */
-	if (IS_ENABLED(CONFIG_RSEQ) && current->sched_time_delay)
+	if (IS_ENABLED(CONFIG_SCHED_PREEMPT_DELAY) && current->sched_time_delay)
 		set_tsk_need_resched(current);
 
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 90d7989a0185..ca2b461b7662 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -339,7 +339,7 @@ extern void io_schedule_finish(int token);
 extern long io_schedule_timeout(long timeout);
 extern void io_schedule(void);
 extern void hrtick_local_start(u64 delay);
-#ifdef CONFIG_RSEQ
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 extern void update_stat_preempt_delayed(struct task_struct *t);
 #endif
 
@@ -409,7 +409,7 @@ static inline void sched_domains_mutex_lock(void) { }
 static inline void sched_domains_mutex_unlock(void) { }
 #endif
 
-#ifdef CONFIG_RSEQ
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 /* Scheduler time slice extension */
 extern unsigned int sysctl_sched_preempt_delay_us;
 #endif
@@ -572,7 +572,7 @@ struct sched_statistics {
 	u64				nr_wakeups_passive;
 	u64				nr_wakeups_idle;
 
-#ifdef CONFIG_RSEQ
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 	u64				nr_preempt_delay_granted;
 #endif
 
@@ -2259,7 +2259,7 @@ static inline bool owner_on_cpu(struct task_struct *owner)
 unsigned long sched_cpu_util(int cpu);
 #endif /* CONFIG_SMP */
 
-#ifdef CONFIG_RSEQ
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 
 extern bool rseq_delay_resched(void);
 extern void rseq_delay_resched_fini(void);
diff --git a/init/Kconfig b/init/Kconfig
index ce76e913aa2b..2f5f603d175a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1130,6 +1130,13 @@ config SCHED_MM_CID
 	def_bool y
 	depends on SMP && RSEQ
 
+config SCHED_PREEMPT_DELAY
+	def_bool y
+	depends on SMP && RSEQ
+	help
+	  This feature enables a thread to request extending its time slice on
+	  the cpu by delaying preemption.
+
 config UCLAMP_TASK_GROUP
 	bool "Utilization clamping per group of tasks"
 	depends on CGROUP_SCHED
diff --git a/kernel/rseq.c b/kernel/rseq.c
index 7710a209433b..440fa4002be5 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -448,6 +448,7 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
 	force_sigsegv(sig);
 }
 
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 bool rseq_delay_resched(void)
 {
 	struct task_struct *t = current;
@@ -526,6 +527,7 @@ void rseq_delay_schedule(struct task_struct *tsk)
 	}
 #endif
 }
+#endif /* CONFIG_SCHED_PREEMPT_DELAY */
 
 #ifdef CONFIG_DEBUG_RSEQ
 
@@ -581,7 +583,8 @@ SYSCALL_DEFINE4(rseq, struct rseq __user *, rseq, u32, rseq_len,
 	if (flags & RSEQ_FLAG_QUERY_CS_FLAGS) {
 		u32 rseq_csflags = RSEQ_CS_FLAG_DELAY_RESCHED |
 				   RSEQ_CS_FLAG_RESCHEDULED;
-		if (!IS_ENABLED(CONFIG_SCHED_HRTICK))
+		if (!IS_ENABLED(CONFIG_SCHED_PREEMPT_DELAY) ||
+					!IS_ENABLED(CONFIG_SCHED_HRTICK))
 			return -EINVAL;
 		if (!rseq)
 			return -EINVAL;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index fd572053a955..d28c0e75b4f3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -149,7 +149,7 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
  */
 __read_mostly unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
 
-#ifdef CONFIG_RSEQ
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 /*
  * Scheduler time slice extension, duration in microsecs.
  * Max value allowed 100us, default is 30us.
@@ -941,7 +941,7 @@ void hrtick_local_start(u64 delay)
 	rq_unlock(rq, &rf);
 }
 
-#ifdef CONFIG_RSEQ
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 void update_stat_preempt_delayed(struct task_struct *t)
 {
 	schedstat_inc(t->stats.nr_preempt_delay_granted);
@@ -4697,7 +4697,7 @@ static int sysctl_schedstats(const struct ctl_table *table, int write, void *buf
 #endif /* CONFIG_SCHEDSTATS */
 
 #ifdef CONFIG_PROC_SYSCTL
-#ifdef CONFIG_RSEQ
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 static int sysctl_sched_preempt_delay(const struct ctl_table *table, int write,
 		void *buffer, size_t *lenp, loff_t *ppos)
 {
@@ -4711,7 +4711,7 @@ static int sysctl_sched_preempt_delay(const struct ctl_table *table, int write,
 			SCHED_PREEMPT_DELAY_DEFAULT_US);
 	return err;
 }
-#endif /* CONFIG_RSEQ */
+#endif /* CONFIG_SCHED_PREEMPT_DELAY */
 #endif /* CONFIG_PROC_SYSCTL */
 
 #ifdef CONFIG_SYSCTL
@@ -4761,7 +4761,7 @@ static const struct ctl_table sched_core_sysctls[] = {
 		.extra2		= SYSCTL_FOUR,
 	},
 #endif /* CONFIG_NUMA_BALANCING */
-#ifdef CONFIG_RSEQ
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 	{
 		.procname	= "sched_preempt_delay_us",
 		.data		= &sysctl_sched_preempt_delay_us,
@@ -4771,7 +4771,7 @@ static const struct ctl_table sched_core_sysctls[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE_HUNDRED,
 	},
-#endif /* CONFIG_RSEQ */
+#endif /* CONFIG_SCHED_PREEMPT_DELAY */
 };
 static int __init sched_core_sysctl_init(void)
 {
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 3a2efd9505e1..45ae09447624 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1225,7 +1225,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_wakeups_passive);
 		P_SCHEDSTAT(nr_wakeups_idle);
 
-#ifdef CONFIG_RSEQ
+#ifdef CONFIG_SCHED_PREEMPT_DELAY
 		P_SCHEDSTAT(nr_preempt_delay_granted);
 #endif
 
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index d9a4e3a2e064..f86eac7e2b43 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -1379,7 +1379,8 @@ static void do_sched_yield(void)
  */
 SYSCALL_DEFINE0(sched_yield)
 {
-	if (IS_ENABLED(CONFIG_RSEQ) && current->sched_time_delay) {
+	if (IS_ENABLED(CONFIG_SCHED_PREEMPT_DELAY) &&
+				current->sched_time_delay) {
 		schedule();
 		return 0;
 	}
-- 
2.43.5

