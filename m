Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71B21CC57
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004875; cv=none; b=XSJxQhqPRCwP8Fohb/fzvD9qnFC7fFk1R61kP8mHgHUak3Fro9EpdDWPfiDOC3L5HGAr1UyQCYmEbnKgzifvVWzbi+XZ1jlb116R7aYt2Uw8zY5aAIeqH+zuWjrHUJqty4zfa4gT+j1JYqGEoEzwjsGpJnMYWKAVEidE9VuBz1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004875; c=relaxed/simple;
	bh=22oLt7wjjXG/wt9SSLtEPvA78v4lBAwefirjuD+2DwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQJVfl6VcnjMasAWXGTImQtbCc87jTbN9CwLTNddY4Z9tdju5U3dj6YYUkRzlFJM5Ow8NtNSvc4B5cDqeYQZM8fNhFTSIfvW8eQSs7LlhpeMhgcH95N5pR0wJrceMQLnqYP3dyWug3pXBDQoXc7saEyHPNjW1yMWDmqtrBB0nnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e/AAeHw5; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e/AAeHw5"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IJCgEB024797;
	Fri, 18 Apr 2025 19:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=0vCER
	sIP2yb4xbsffCFA2kR/asq0VuYMViUZ7Uq4vYY=; b=e/AAeHw54UYIm+BYP01Kj
	IgWHD2sovDQFK8mUMwYrurk79+52in4/lD/9DXOezJGkSBYLST/T1vM5rhgKeva/
	ZqNuUDX14unVhAqvK3/Mgi00szmTVMCUQb7SjUfBXrlvAJiR6PiQCHuMpbFE3c+U
	snM3yB+YUhIffOJRiq1eHO+f0gkMZsl6PikI3/E38pRemczbwrd1xuzhhUlSyRuN
	jYUBLQO2zOieFC+/a23ElpRGOHrEOIMld5tNXBoG4riuigNRQgIICNL2AX5qDTXn
	C663+SWo0dk5EcyKe/p2QmWGEGS0mh9L0u8RgybN9xjYQ/volQqK6zTLQ3JtY9PG
	Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180wgxpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 19:34:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53IIn28k038828;
	Fri, 18 Apr 2025 19:34:14 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4w8qqy-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 18 Apr 2025 19:34:14 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de
Subject: [PATCH V2 2/3] Sched: Tunable to specify duration of time slice extension
Date: Fri, 18 Apr 2025 19:34:09 +0000
Message-ID: <20250418193410.2010058-3-prakash.sangappa@oracle.com>
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
X-Proofpoint-ORIG-GUID: I2oMFrMUHe-jZ3Czi1BTYl3P3EXSUd8r
X-Proofpoint-GUID: I2oMFrMUHe-jZ3Czi1BTYl3P3EXSUd8r

Add a tunable to specify duration of scheduler time slice extension.
The default will be set to 50us and the max value that can be specified
is 100us. Setting it to 0, disables scheduler time slice extension.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/linux/sched.h |  3 +++
 kernel/rseq.c         | 10 ++++++----
 kernel/sched/core.c   | 16 ++++++++++++++++
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 75abe260de72..c91856f908d6 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -385,6 +385,9 @@ extern struct root_domain def_root_domain;
 extern struct mutex sched_domains_mutex;
 #endif
 
+/* Scheduler time slice extension */
+extern unsigned int sysctl_sched_preempt_delay_us;
+
 struct sched_param {
 	int sched_priority;
 };
diff --git a/kernel/rseq.c b/kernel/rseq.c
index 9f83d47253ce..7022729d02ee 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -434,6 +434,8 @@ bool rseq_delay_resched(void)
 	if (!IS_ENABLED(CONFIG_SCHED_HRTICK))
 		return false;
 
+	if (!sysctl_sched_preempt_delay_us)
+		return false;
 	if (!t->rseq)
 		return false;
 
@@ -464,11 +466,11 @@ void rseq_delay_resched_fini(void)
 	 * IRQs off, guaranteed to return to userspace, start timer on this CPU
 	 * to limit the resched-overdraft.
 	 *
-	 * If your critical section is longer than 50 us you get to keep the
-	 * pieces.
+	 * If your critical section is longer than sysctl_sched_preempt_delay_us
+	 * you get to keep the pieces.
 	 */
-	if (t->rseq_sched_delay)
-		hrtick_local_start(50 * NSEC_PER_USEC);
+	if (sysctl_sched_preempt_delay_us && t->rseq_sched_delay)
+		hrtick_local_start(sysctl_sched_preempt_delay_us * NSEC_PER_USEC);
 #endif
 }
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index cee50e139723..59b381cef472 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -151,6 +151,13 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
  */
 const_debug unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
 
+/*
+ * Scheduler time slice extension, duration in microsecs.
+ * Max value allowed 100us, default 50us
+ * If set to 0, scheduler time slice extension is disabled.
+ */
+__read_mostly unsigned int sysctl_sched_preempt_delay_us = 50;
+
 __read_mostly int scheduler_running;
 
 #ifdef CONFIG_SCHED_CORE
@@ -4713,6 +4720,15 @@ static const struct ctl_table sched_core_sysctls[] = {
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

