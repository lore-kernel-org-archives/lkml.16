Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2730EEA8
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 02:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151223; cv=none; b=CPhNt8VQNe6IRi1ZKh+lKAWBjOTRXuWWj2QPtOcyE3/Oavd3mtSn8R35mvwyse6vKieUyXtbKBoJwxeaAEnnwgUFxvzNiv1VZN2Zuv8g95SEOlsIZF+3UBoiapOMGULFZCK8v73YZ5gnbmXleMIXUKa/rsJw5F+bW3gQ09TEB6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151223; c=relaxed/simple;
	bh=U4X8LGE5rY7W8OFpXjBNq8MAFGAvJUw5b+XCxMq8cyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRgcOcy8ISamRCQam6GKSrqISeN/+WyCw1JN8qyjxFKiQTktHb9mHkW/kNufSvVSXdcW5SCfChqUS5SmNv4gfxX3on8nYYcij92fmIMLxccGuNWSZxhomRwJH4Qr6kZmtxJ/cQsWuVyuD7fqscz0QWBD1ZdfMO7ywX4HE4XeGyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qSseV6vI; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qSseV6vI"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541KeUQ1025029;
	Fri, 2 May 2025 01:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=WxQr3
	8+6zji9ZGaiO6kdMhdW1yPIty5vBXCpJ1ODMPQ=; b=qSseV6vIsydzxWMd9EXj9
	Dy8z9OlP25jlrB6QFWS3WOye/uxsDyuUkt9sASueQsUVM5Opdvo2n+OWBYNBxBil
	nKDwg19S38MqgQnqWwd4n+57ixTs8EbjfDOKDd6NFAgaQyHv7BJGphZKx1ERFuTo
	rPfdyD2kdICKdPPKV3IXnWQw66QwdF8iuEjJIJ0cvDucJS2T6bQc6HMH0p1ZFHWO
	h1xadLHXJtP0Y6rRk+jy/mrA9xIf9EA4mMk8fCWUJMPGfZPhqRUUYz832HuXSQMy
	lVfH5aNfi019vDhP0rTTU9JeyptgaH60RCD3h0ev/MItEPJiiP/Jjkf6BW3YEjUT
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6usmcc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 01:59:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5421aMDT035421;
	Fri, 2 May 2025 01:59:58 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxd1euw-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 02 May 2025 01:59:58 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V3 2/4] Sched: Tunable to specify duration of time slice extension
Date: Fri,  2 May 2025 01:59:53 +0000
Message-ID: <20250502015955.3146733-3-prakash.sangappa@oracle.com>
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
X-Proofpoint-ORIG-GUID: IP1qOVD8r_9lLa724JmRAoyiuFQcueBE
X-Proofpoint-GUID: IP1qOVD8r_9lLa724JmRAoyiuFQcueBE
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6814271f b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=vtrBRbmf2MmeuvLnnLMA:9 cc=ntf awl=host:14638
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAxMyBTYWx0ZWRfX2XtJWXmt3tJS 2Bw6tbElz6oJ4crtI7hs+pgss7gggH84TZ7XqjzxiO7jVRqQOk25Bjy7w8B0YllBDpA9no46Cuj 4yXCBC3Wcjv7GNiN/32brVF+nSwPSUQ9MfuIiSkYytEbUoOPOuqMjJGjJISCY151+Q569v83o9y
 YirNvTc2uqXIZsrmTxefLe1CBIa6eDhZktKRT77R+Huv19N736XWzo9Va1fkka7yUF505TH0XnU W30b28Qg5DUR53Dfp6Yz2rb99LwFrz2PEzf5UJvasXPxtyF4E5ZjoGP2ObT/Gx9wmdoPqNwP+AF cPRqBCj04SJomItJkGMKQ9HD26qYrODEyZ4ojJXv+OHuA6/udQoGTFcEHMWTFeG47t282+I0gTr
 cUWVsCpEuHMaVM0YXagSWh0QQIK5uxHMrcNmceJ+22Nw5AtDY5IW1ZH8bcHMLdPTPmArfDIS

Add a tunable to specify duration of scheduler time slice extension.
The default will be set to 50us and the max value that can be specified
is 100us. Setting it to 0, disables scheduler time slice extension.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/linux/sched.h     |  3 +++
 include/uapi/linux/rseq.h |  6 +++---
 kernel/rseq.c             |  7 +++++--
 kernel/sched/core.c       | 16 ++++++++++++++++
 4 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 14bf0508bfca..cce3a0496703 100644
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
index 900cb75f6a88..2aa9029325c2 100644
--- a/include/uapi/linux/rseq.h
+++ b/include/uapi/linux/rseq.h
@@ -132,9 +132,9 @@ struct rseq {
 	 *     Inhibit instruction sequence block restart on migration for
 	 *     this thread.
 	 * - RSEQ_CS_DELAY_RESCHED
-	 *     Request by user task to try delaying preemption. With
-	 *     use of a timer, extra cpu time upto 50us is granted for this
-	 *     thread before being rescheduled.
+	 *     Request by user task to try delaying its preemption. With
+	 *     use of a timer, extra cpu time upto 'sched_preempt_delay_us'
+	 *     is granted for this thread before being rescheduled.
 	 */
 	__u32 flags;
 
diff --git a/kernel/rseq.c b/kernel/rseq.c
index 0ecd16e01712..0cfdaf5b6c8e 100644
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
 	 * If your critical section is longer than 50 us you get to keep the
 	 * pieces.
 	 */
-	if (t->sched_time_delay)
-		hrtick_local_start(50 * NSEC_PER_USEC);
+	if (sysctl_sched_preempt_delay_us && t->sched_time_delay)
+		hrtick_local_start(sysctl_sched_preempt_delay_us *
+							NSEC_PER_USEC);
 #endif
 }
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8c8960245ec0..05a952ec15ae 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -148,6 +148,13 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
  */
 __read_mostly unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
 
+/*
+ * Scheduler time slice extension, duration in microsecs.
+ * Max value allowed 100us, default 50us
+ * If set to 0, scheduler time slice extension is disabled.
+ */
+__read_mostly unsigned int sysctl_sched_preempt_delay_us = 50;
+
 __read_mostly int scheduler_running;
 
 #ifdef CONFIG_SCHED_CORE
@@ -4711,6 +4718,15 @@ static const struct ctl_table sched_core_sysctls[] = {
 		.extra2		= SYSCTL_FOUR,
 	},
 #endif /* CONFIG_NUMA_BALANCING */
+	{
+		.procname	= "sched_preempt_delay_us",
+		.data		= &sysctl_sched_preempt_delay_us,
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE_HUNDRED,
+	},
 };
 static int __init sched_core_sysctl_init(void)
 {
-- 
2.43.5

