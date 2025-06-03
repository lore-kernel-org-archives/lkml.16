Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1773D2528E4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 23:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993840; cv=none; b=aEP9j9FpRE5ewmy+H1ZhLd+hfUR9Z4815QP2UBjWf14VxwvjDpX2kJdMGGOb4jxuwaoRvsLMhzSz7esFs40feQvGPmiZRxJg5gy+CvfRKM58+i8mUC0seVyVLeDerLSw4cC+vVM6Wq5kOoNKY/jsjf2LpHQuoPpBCXMehgkUYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993840; c=relaxed/simple;
	bh=fAMyyogiuCL2Mk8isq78RmOsKGd3MG8SW7HHpIlVtKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2lr9JoYZJNSEDaRhmDVlZj897OXzN9h6pEV+VCzNGnVuKnuGoQzOabCVePLRVTPPM4JB2NnvSogrt2AvcpFYbufnUNlsrLbTEwilOXTtOdq1R4p85uF8S4l2JyTIuI6I+Nfy/T7tNVmpxwFEaPxJo5KuqJUCuTgiz0q40CwbKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sHmtJUMG; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sHmtJUMG"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MNSlE000917;
	Tue, 3 Jun 2025 23:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=2YYge
	WCe3uS9GhsMAZV94521B63BCd0/tI0g0txHXag=; b=sHmtJUMGuTUXvU6CMjkZv
	XZW7eRMNAB0yjxlZQby3nHbgwS+GrqYvAoOFkyDltjadgqNqGJdUkYJxmH+O5udC
	6nLBVmOBwUYlOShKvMGK1QGSjbP1Ijb38kMazoPyd+pJgqQavKPb1TFk6VxHUc+o
	4iOWmwHkWMyndQTegIwuLoyvfRm/nhd8eK5FLwAKf7EnDIQ/EVu0l2pdIp3t/+c5
	38MblPe+h/hsreodV1f/O1KfiRaPn0JH6aSktz95J528QcEyH8VIfkL4WFGP5EP3
	GpVQ9lxd5UOQHFxE2KEEf3dDaDJz/sKSD47/rYz8SDbWN1CcdJFYXMtlaIsBE5Hz
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dty3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 23:36:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553MtHqv030803;
	Tue, 3 Jun 2025 23:36:57 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a2j93-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 03 Jun 2025 23:36:57 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V5 3/6] Sched: Tunable to specify duration of time slice extension
Date: Tue,  3 Jun 2025 23:36:51 +0000
Message-ID: <20250603233654.1838967-4-prakash.sangappa@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=683f8719 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=ggT4wvkgqP9MO6PAK6EA:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDIwMiBTYWx0ZWRfX0N1joMf9+m+O Lf30RC9DU3+F+wCS4eeN+/RwYAO7BCkx9O0+v6Pq+cM1VbbFWpQBD2cBBeRDRU0BCXHyx+BGGM5 Py34vN2QDIUNd544ZF9bVk/buyENTIjjSLBOcuk/+vfRGpDz1hVtB9jLZ0SV6DWNW0ubEq+gS8i
 uZAuodc1v1EC2X+7LOx2Lqxn05rjHaA9RIDxHs4vP1FIf4u5tg+W//zyRfF8x2PD7V4tj4Ty/d7 Du/pQ8Ge9tbDgZ0oa0QZ6ZsqUz+SdUFNZ+M/F/LRDRrU6Cml6HplOZU4tjFP7Lz4EnVzOMVflmB qMwHASIMeTaXFRFCysVobOivIt6BrlGMxv9Xa7ev4cU03UIa4oRejhvAIGeh2GwHwaQVuLpOVt0
 q+47wrMpconfI7nkNTjKUkntOvSZsIwN5OXZNQ1gDprJ9uKVOHrwvBTMAJ3tUePJvgxTAtNK
X-Proofpoint-ORIG-GUID: M_ckvyiOuLQ4o5bfQ9roZot7MC_w7XTY
X-Proofpoint-GUID: M_ckvyiOuLQ4o5bfQ9roZot7MC_w7XTY

Add a tunable to specify duration of scheduler time slice extension.
The default will be set to 30us and the max value that can be specified
is 100us. Setting it to 0, disables scheduler time slice extension.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
v5:
- Added #ifdef CONFIG_RSEQ & CONFIG_PROC_SYSCTL 
---
 include/linux/sched.h     |  5 +++++
 include/uapi/linux/rseq.h |  5 +++--
 kernel/rseq.c             |  7 +++++--
 kernel/sched/core.c       | 40 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 71e6c8221c1e..14069ebe26e2 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -407,6 +407,11 @@ static inline void sched_domains_mutex_lock(void) { }
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
index 9355654e9b38..44d0f3ae0cd3 100644
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
index 86583fb72914..e5307389b30a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -148,6 +148,17 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
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
@@ -4664,6 +4675,24 @@ static int sysctl_schedstats(const struct ctl_table *table, int write, void *buf
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
@@ -4711,6 +4740,17 @@ static const struct ctl_table sched_core_sysctls[] = {
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

