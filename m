Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6FC469D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330319; cv=none; b=hvwH78yXdkgW6m3ChSf8/2o2l9M/KWqHcpFtu59FT6HqWkbDPNoE9oaPE8rbiGpHG68fYHo7GRoDic5gmxzJOmZwCBImK55TGmakWh2cerFDmkc2pN1A6waSClLZ4HFN9RE0x6e0ccLoaU7MhFKxJDOwAYoYk6xHsYrvWOunlZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330319; c=relaxed/simple;
	bh=0N+geEJZC9bxJsprhJXBQmWk03ePIjN+UbskQ8v6fXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGLs/tX04Zn7dk+fRv36/ea0EKA4lV1PYJq5MChcsUAEa79/Ns2CYPlmqDeHpQGve/ALq8DcxlMWu5bNfkb8M6rOikiHGP7Ji0eu9yiUajzmIbV9VFrCivwsllV+UQdir/QHIsssqPtzfvl3qaOwxWuVhE2YhOkkuYVnOR38xX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UHg1KOYB; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UHg1KOYB"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIBx3d012330;
	Tue, 1 Jul 2025 00:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=k+YGq
	wjnxQblgAVUYVpPFdXsdNqALvGFMzuBJFXvJm4=; b=UHg1KOYB/q+w4/UDnS+Bx
	v+oLzU5e4gOYbaIa9txJG1t6/kCUQPf6RGNE3ZihIw7a/DJwgGv3/rxKU9Bew7LY
	k4riKaQgoMGuWj8kvX+kRQrw6uPuTR8/OvIyhXptA04cpUf+cwf+D2gGx2KZEtSh
	BA+BY+ECQbJZm9hA0Eow6edt1HjBa2S7nPZAZ5CNn6TnAjZosx+41SKiaPGwq95K
	wHX7/845QGe64CqyD/5XcDenP48KGojWmd2TodmGccuZXsTAEclZ/qsrwHq2r7Bx
	y4KROaRpiYEnwW43ChzQoEIdTXooHy1uOdiRGRaU6JCYENGhYYKvPIahd59DfBle
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfbkvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 00:38:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UNDxNZ009139;
	Tue, 1 Jul 2025 00:38:08 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u92pxj-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 01 Jul 2025 00:38:07 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V6 3/7] Sched: Tunable to specify duration of time slice extension
Date: Tue,  1 Jul 2025 00:37:45 +0000
Message-ID: <20250701003749.50525-4-prakash.sangappa@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68632df0 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=p7qRMtwlg9ZQNcIIFPQA:9 cc=ntf awl=host:14723
X-Proofpoint-GUID: arnoM5LtkQM_lMdmb62Rv17LFT97urPj
X-Proofpoint-ORIG-GUID: arnoM5LtkQM_lMdmb62Rv17LFT97urPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMiBTYWx0ZWRfX/j5YKwae8K3/ pyGqJK92QgIfKVEyfG3Y2VvnRif9aFYS60+vg06H2sIhZzHEXE2/sD2O+noV6kH6+FksSJIPuRE ncWyElXSsBp694oSTO7pYvkarKfe/Etxx/gfn6dGNBSsDbX72A7y58vocitLZtDmRXPWQcyjdN7
 B+suHo0+Ag01wCmR9vDKHo69rPXuMBEuiv3GQnDE7fWbsy56ihuB3XLZ+4xRDILlC41Rbjl5h1i 6Acyfipco9UmnSL2Hais5dDrqkDlox+VndJqwCGGsdjK+L/7hEhMK1BVQt59ie2vHwU2rIgi2SF axIsTfVS0RTGVo7rD2w8PQVbLXf/qzOw2gZPvDIZkDKqp4pRrDhkUd8+ZbYQ1P+aVrElPtukXDv
 5eFJTUFwm8lKajvsWDsJAPifeCitRk/cBtIOFNVep9bX9E85XHbyWRPuUPI+waORtC4k3Tkx

Add a tunable to specify duration of scheduler time slice extension.
The default will be set to 30us and the max value that can be specified
is 100us. Setting it to 0, disables scheduler time slice extension.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
v5 -> v6
- Added documentation for tunable 'sysctl_sched_preempt_delay_us'.
---
 .../admin-guide/kernel-parameters.txt         |  8 ++++
 include/linux/sched.h                         |  5 +++
 include/uapi/linux/rseq.h                     |  5 ++-
 kernel/rseq.c                                 |  7 +++-
 kernel/sched/core.c                           | 40 +++++++++++++++++++
 5 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0ee6c5314637..1e0f86cda0db 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6398,6 +6398,14 @@
 
 	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
 
+	sched_preempt_delay_us=	[KNL]
+			Scheduler preemption delay in microseconds.
+			Allowed range is 0 to 100us. A thread can request
+			extending its scheduler time slice on the cpu by
+			delaying preemption. Duration of preemption delay
+			granted is specified by this parameter. Setting it
+			to 0 will disable this feature.
+
 	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
 			Allowed values are enable and disable. This feature
 			incurs a small amount of overhead in the scheduler
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 0a6d564d2745..a0661f1d423b 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -406,6 +406,11 @@ static inline void sched_domains_mutex_lock(void) { }
 static inline void sched_domains_mutex_unlock(void) { }
 #endif
 
+#ifdef CONFIG_RSEQ
+/* Scheduler time slice extension */
+extern unsigned int sysctl_sched_preempt_delay_us;
+#endif
+
 struct sched_param {
 	int sched_priority;
 };
diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
index f4813d931387..015534f064af 100644
--- a/include/uapi/linux/rseq.h
+++ b/include/uapi/linux/rseq.h
@@ -137,8 +137,9 @@ struct rseq {
 	 *     this thread.
 	 * - RSEQ_CS_FLAG_DELAY_RESCHED
 	 *     Request by user thread to delay preemption. With use
-	 *     of a timer, kernel grants extra cpu time upto 30us for this
-	 *     thread before being rescheduled.
+	 *     of a timer, kernel grants extra cpu time upto the tunable
+	 *     'sched_preempt_delay_us' value for this thread before it gets
+	 *     rescheduled.
 	 * - RSEQ_CS_FLAG_RESCHEDULED
 	 *     Set by kernel if the thread was rescheduled in the extra time
 	 *     granted due to request RSEQ_CS_DELAY_RESCHED. This bit is
diff --git a/kernel/rseq.c b/kernel/rseq.c
index eb20622634ef..545123ca60b0 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -456,6 +456,8 @@ bool rseq_delay_resched(void)
 	if (!IS_ENABLED(CONFIG_SCHED_HRTICK))
 		return false;
 
+	if (!sysctl_sched_preempt_delay_us)
+		return false;
 	if (!t->rseq)
 		return false;
 
@@ -489,8 +491,9 @@ void rseq_delay_resched_fini(void)
 	 * If your critical section is longer than 30 us you get to keep the
 	 * pieces.
 	 */
-	if (t->sched_time_delay)
-		hrtick_local_start(30 * NSEC_PER_USEC);
+	if (sysctl_sched_preempt_delay_us && t->sched_time_delay)
+		hrtick_local_start(sysctl_sched_preempt_delay_us *
+				   NSEC_PER_USEC);
 #endif
 }
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e163822d5381..6d50eff9be8c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -149,6 +149,17 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
  */
 __read_mostly unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
 
+#ifdef CONFIG_RSEQ
+/*
+ * Scheduler time slice extension, duration in microsecs.
+ * Max value allowed 100us, default is 30us.
+ * If set to 0, scheduler time slice extension is disabled.
+ */
+#define SCHED_PREEMPT_DELAY_DEFAULT_US	30
+__read_mostly unsigned int sysctl_sched_preempt_delay_us =
+	SCHED_PREEMPT_DELAY_DEFAULT_US;
+#endif
+
 __read_mostly int scheduler_running;
 
 #ifdef CONFIG_SCHED_CORE
@@ -4678,6 +4689,24 @@ static int sysctl_schedstats(const struct ctl_table *table, int write, void *buf
 #endif /* CONFIG_PROC_SYSCTL */
 #endif /* CONFIG_SCHEDSTATS */
 
+#ifdef CONFIG_PROC_SYSCTL
+#ifdef CONFIG_RSEQ
+static int sysctl_sched_preempt_delay(const struct ctl_table *table, int write,
+		void *buffer, size_t *lenp, loff_t *ppos)
+{
+	int err;
+
+	err = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+	if (err < 0)
+		return err;
+	if (sysctl_sched_preempt_delay_us > SCHED_PREEMPT_DELAY_DEFAULT_US)
+		pr_warn("Sched preemption delay time set higher then default value %d us\n",
+			SCHED_PREEMPT_DELAY_DEFAULT_US);
+	return err;
+}
+#endif /* CONFIG_RSEQ */
+#endif /* CONFIG_PROC_SYSCTL */
+
 #ifdef CONFIG_SYSCTL
 static const struct ctl_table sched_core_sysctls[] = {
 #ifdef CONFIG_SCHEDSTATS
@@ -4725,6 +4754,17 @@ static const struct ctl_table sched_core_sysctls[] = {
 		.extra2		= SYSCTL_FOUR,
 	},
 #endif /* CONFIG_NUMA_BALANCING */
+#ifdef CONFIG_RSEQ
+	{
+		.procname	= "sched_preempt_delay_us",
+		.data		= &sysctl_sched_preempt_delay_us,
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= sysctl_sched_preempt_delay,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE_HUNDRED,
+	},
+#endif /* CONFIG_RSEQ */
 };
 static int __init sched_core_sysctl_init(void)
 {
-- 
2.43.5

