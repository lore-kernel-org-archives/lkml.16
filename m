Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B52046BA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172799; cv=none; b=e/fZk/Z2dnmVizkkZCUaHzs7lxl7R1em4HqwGpze50BK91yhUraEBYk/VpkFCAezLa4hKxXMfV9waafQgNE+3l4CJZbxPpAlkzhmQHvaq2URsbAgN37G22dLhGrxaxW8ipyPiS4r1z+u3xEdq/qsyJTs8qndLfNCaDhctytIXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172799; c=relaxed/simple;
	bh=7B12a5hYQjTTeBFzhXliq7ihaUcje+OiP8Og9NOsTDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOW0rnn6cXWLeWPjzZGbXbHYw50C/YnrcozADxZ5hOj6FOb0fdfkaA2NQ8AVaNhqUW94jUIiCrj58zTJOlYOoGztLBuFP625My5pDg25Qzt5uKgJoQTkNijw8BlDRQcyRde2Oz4ls95hS9rOC8c5lSNfCkHSP6TsB1I3GIm5Qkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r+MTpHuw; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r+MTpHuw"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DL0mF9021629;
	Tue, 13 May 2025 21:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=IQcSc
	IcYTX4XkSixb+3nmgGZb89xJcUaF8n6HcenWkA=; b=r+MTpHuwCWfBhZog8yL4j
	rlatUMnoQ3iAVT4AAS0NZoCzbgUvxilNOYU3x/sEo/8OGmlzchlx3C0OrsfLM6Jh
	EzD8C5DEj7EYm24244uXr7CKAppGsZNJVhiBF2YH8WaEL1gy3RbHgJhkUM3eCzkW
	s45YtTekYyRESAgPWDa6QnY4LkgFoqLysWPqrkz/duPt8OXsv1JKZL3+EBegshwW
	OrGwaJl3IeT56vMBqVsqcr3RpWItyr3k2VoqSRvMxtLOCQ4NBygf6eRr8jGubd3q
	ozNcQUxDsDYDfOJnsjouQy4iufu3xeSRZGgIT2UKxEFmxIfx4UHm+Z0SKi3SS+s+
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcmgat1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 21:46:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DLQjeO001890;
	Tue, 13 May 2025 21:46:00 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mc4yv943-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 13 May 2025 21:46:00 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V4 3/6] Sched: Tunable to specify duration of time slice extension
Date: Tue, 13 May 2025 21:45:51 +0000
Message-ID: <20250513214554.4160454-4-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505130206
X-Proofpoint-ORIG-GUID: mXJrKalMY_m117X5kYrTYXNgdqFem5Ol
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=6823bd99 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=ggT4wvkgqP9MO6PAK6EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIwNSBTYWx0ZWRfXz1PHrWSxq74p 0LFA4kFFbSs46AR/CBEiSH0qnU7OGWDvSFE0a7WdyaeVYXVMq0Nc5R1fXnG0tt8++U2LF9ZRTQO 6ppsYdAdqxNfqbgWQaqdMCkGm6zeu4pgFWRA8rkP4xrA473hDUK1mxZBE4eOLgdMbcibnb3KCRr
 U4vTiOZGwdZTXZlETDOJzeUoqKzdO5x9qLfD6bKSD0+aKWQHRldaVdxOvb4mv/N4Q3DBmMuXmll 0/emYvmprg4BOl4nxYWLLP7bLBxUDB7VYFAmAzH0qwadVGlvcOxvOBMkN70X9RjWDrcyMcAoBq0 z+SX4yvi8AO1gD5ybhdD4B7d7/WjgIVG8T+39T0w5XqepJ/fGOKjF/sgfU5b4dVta3nEs9SkDvU
 0049n0R5yG1jhLOIPHmETL4oGb/Gvr2mfyr4UT5ooqcsPR/H6ElaP6CrO+vazZleV/uKRigG
X-Proofpoint-GUID: mXJrKalMY_m117X5kYrTYXNgdqFem5Ol

Add a tunable to specify duration of scheduler time slice extension.
The default will be set to 30us and the max value that can be specified
is 100us. Setting it to 0, disables scheduler time slice extension.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/linux/sched.h     |  3 +++
 include/uapi/linux/rseq.h |  5 +++--
 kernel/rseq.c             |  7 +++++--
 kernel/sched/core.c       | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 71e6c8221c1e..c279232ca6a2 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -407,6 +407,9 @@ static inline void sched_domains_mutex_lock(void) { }
 static inline void sched_domains_mutex_unlock(void) { }
 #endif
 
+/* Scheduler time slice extension */
+extern unsigned int sysctl_sched_preempt_delay_us;
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
index 86583fb72914..31928cbcd907 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -148,6 +148,15 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
  */
 __read_mostly unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
 
+/*
+ * Scheduler time slice extension, duration in microsecs.
+ * Max value allowed 100us, default is 30us.
+ * If set to 0, scheduler time slice extension is disabled.
+ */
+#define SCHED_PREEMPT_DELAY_DEFAULT_US	30
+__read_mostly unsigned int sysctl_sched_preempt_delay_us =
+	SCHED_PREEMPT_DELAY_DEFAULT_US;
+
 __read_mostly int scheduler_running;
 
 #ifdef CONFIG_SCHED_CORE
@@ -4664,6 +4673,20 @@ static int sysctl_schedstats(const struct ctl_table *table, int write, void *buf
 #endif /* CONFIG_PROC_SYSCTL */
 #endif /* CONFIG_SCHEDSTATS */
 
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
+
 #ifdef CONFIG_SYSCTL
 static const struct ctl_table sched_core_sysctls[] = {
 #ifdef CONFIG_SCHEDSTATS
@@ -4711,6 +4734,15 @@ static const struct ctl_table sched_core_sysctls[] = {
 		.extra2		= SYSCTL_FOUR,
 	},
 #endif /* CONFIG_NUMA_BALANCING */
+	{
+		.procname	= "sched_preempt_delay_us",
+		.data		= &sysctl_sched_preempt_delay_us,
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= sysctl_sched_preempt_delay,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE_HUNDRED,
+	},
 };
 static int __init sched_core_sysctl_init(void)
 {
-- 
2.43.5

