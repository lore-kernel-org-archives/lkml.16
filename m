Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F3186328
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330320; cv=none; b=F0IXHDd1AIcoO4D5IpIoXK4pfk4QzUulc4/IMEI2d4T3qF98ENf01cB8Q7ydYZjz+mcGpY4SjEvqkI0j1qacRpsjoy7A8vF63f4cIjJDG3vpOo/k7/+3cbDlCjz/+i/TwqOWT4G6SQttWNaWCW/iyZC/JRt7oOyzr4PHQIG9eTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330320; c=relaxed/simple;
	bh=cB+AyQBm3Vfw1IrDC1azeCRsmvjxinflrt0ymlU5Yrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyhJP7zSwTmZOjrsOgXDde/bzuSQorFjjfjF+l5BbY+bS/vAursJzumB7mFdayvMly/cYIZxQ4qH8c+kHCdEGeNTgOYRLk4x1/JnQJWCOo8cO2Z7R2gLTt65l1Bw9ot1KWoRAHQKjjVR0ld5o9CaG23MxDaIO+7eDQFONW9Sox8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gMPBJMUU; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gMPBJMUU"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIBxpL003650;
	Tue, 1 Jul 2025 00:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=FsY2D
	KKLC/0tkiNL1jCbJcYDiNBCsD6bXamS8zhaBV0=; b=gMPBJMUUb8jcKH8qPTgiK
	TX4IzAWpNYjcCDFJm7aXBAntmr9pLpi/lW8YkigvPREmuDjb9MJbil9lS7ZKuzjk
	ExMITAgLT9Rzyah/hsPGJsL76v6ha2IgVEJLXSaJOg4VswY2GRFqT0j1gkM/UywO
	h6rwaW3jEWCDJUUi5bmmfexRmyfT85UHZHcB4wVT6QpDBu1XmmxUsE43fvkFpuz6
	yVOhivleryLwCsMRHAOA4NDtEldyszLGOpSHMSp48NIKWcLR15PPG3sD2GcKecjf
	D652uvbGwyIRA7JP/vqWsoEqorNdlqr2jRxZZiGuAX6yH6DHZ2BG52fCGhTgAqrH
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w3k31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 00:38:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UNDxNY009139;
	Tue, 1 Jul 2025 00:38:07 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u92pxj-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 01 Jul 2025 00:38:07 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V6 2/7] Sched: Indicate if thread got rescheduled
Date: Tue,  1 Jul 2025 00:37:44 +0000
Message-ID: <20250701003749.50525-3-prakash.sangappa@oracle.com>
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
X-Proofpoint-GUID: rlaOoYskALshdZfrp_gZQ07_gQ9Fv-4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMiBTYWx0ZWRfXy9e0Tb92UX8i QAsGFTYCOMiCo9tZJYdOJDOf+2SnIXSlhPVQB+/P9+jkP4bdNWC3Gai3Wfs5+ca6jW3edKGZZKB F4lUz/zTqm797RvKW9KSNCFKrNRYG5tiJcsgG+AiFlK3/je3c+mmAEG1kjhP8vFoluV1tEVIT8V
 TU29wBCvIuB/8REO8UvRRk5EsjxRbP3O5tEYJTXvXo5XB6SpkLkeJHqdAFnbkxd1QOl5iL8ksjd 7b0eV6NfAR5ZZ6sYC9E139g1+oGaJFl2Ylw8wEau4yXAKSomIFEuCGtai2QnhQIOgjSu7XZZied emiZUfYTqi8Kbby88lMI5NtEOc78YxgKBaPnoxh+CUo6MXGkTnv8uU+xb7kErl/cj/cRNTeaZ5L
 ch5IplX0tLADdFDvyTWUCyrFajrr0co0REaQZCm+7cFfR6heduaUTbOLI6sjRbzoT8kz4A/l
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=68632df0 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=qx7APbdOUbj-W9D39agA:9 cc=ntf awl=host:14723
X-Proofpoint-ORIG-GUID: rlaOoYskALshdZfrp_gZQ07_gQ9Fv-4a

Use a bit in rseq flags to indicate if the thread got rescheduled
after the cpu time extension was graned. The user thread can check this
flag before calling sched_yield() to yield the cpu.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/linux/sched.h     |  2 ++
 include/uapi/linux/rseq.h | 10 ++++++++++
 kernel/rseq.c             | 19 +++++++++++++++++++
 kernel/sched/core.c       |  3 +--
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 9b4670d85131..0a6d564d2745 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2252,12 +2252,14 @@ unsigned long sched_cpu_util(int cpu);
 extern bool rseq_delay_resched(void);
 extern void rseq_delay_resched_fini(void);
 extern void rseq_delay_resched_tick(void);
+extern void rseq_delay_schedule(struct task_struct *tsk);
 
 #else
 
 static inline bool rseq_delay_resched(void) { return false; }
 static inline void rseq_delay_resched_fini(void) { }
 static inline void rseq_delay_resched_tick(void) { }
+static inline void rseq_delay_schedule(struct task_struct *tsk) { }
 
 #endif
 
diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
index 25fc636b17d5..f4813d931387 100644
--- a/include/uapi/linux/rseq.h
+++ b/include/uapi/linux/rseq.h
@@ -27,6 +27,7 @@ enum rseq_cs_flags_bit {
 	RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT	= 1,
 	RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT	= 2,
 	RSEQ_CS_FLAG_DELAY_RESCHED_BIT		= 3,
+	RSEQ_CS_FLAG_RESCHEDULED_BIT		= 4,
 };
 
 enum rseq_cs_flags {
@@ -38,6 +39,9 @@ enum rseq_cs_flags {
 		(1U << RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT),
 	RSEQ_CS_FLAG_DELAY_RESCHED		=
 		(1U << RSEQ_CS_FLAG_DELAY_RESCHED_BIT),
+	RSEQ_CS_FLAG_RESCHEDULED		=
+		(1U << RSEQ_CS_FLAG_RESCHEDULED_BIT),
+
 };
 
 /*
@@ -135,6 +139,12 @@ struct rseq {
 	 *     Request by user thread to delay preemption. With use
 	 *     of a timer, kernel grants extra cpu time upto 30us for this
 	 *     thread before being rescheduled.
+	 * - RSEQ_CS_FLAG_RESCHEDULED
+	 *     Set by kernel if the thread was rescheduled in the extra time
+	 *     granted due to request RSEQ_CS_DELAY_RESCHED. This bit is
+	 *     checked by the thread before calling sched_yield() to yield
+	 *     cpu. User thread sets this bit to 0, when setting
+	 *     RSEQ_CS_DELAY_RESCHED to request preemption delay.
 	 */
 	__u32 flags;
 
diff --git a/kernel/rseq.c b/kernel/rseq.c
index dba44ca9f624..eb20622634ef 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -504,6 +504,25 @@ void rseq_delay_resched_tick(void)
 #endif
 }
 
+void rseq_delay_schedule(struct task_struct *tsk)
+{
+#ifdef CONFIG_SCHED_HRTICK
+	u32 flags;
+
+	if (tsk->sched_time_delay) {
+		tsk->sched_time_delay = 0;
+		if (!tsk->rseq)
+			return;
+		if (copy_from_user_nofault(&flags, &tsk->rseq->flags,
+                        sizeof(flags)))
+                        return;
+                flags |= RSEQ_CS_FLAG_RESCHEDULED;
+                copy_to_user_nofault(&tsk->rseq->flags, &flags,
+                        sizeof(flags));
+	}
+#endif
+}
+
 #ifdef CONFIG_DEBUG_RSEQ
 
 /*
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c1b64879115f..e163822d5381 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6752,8 +6752,7 @@ static void __sched notrace __schedule(int sched_mode)
 picked:
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();
-	if (IS_ENABLED(CONFIG_RSEQ))
-		prev->sched_time_delay = 0;
+	rseq_delay_schedule(prev);
 	rq->last_seen_need_resched_ns = 0;
 
 	is_switch = prev != next;
-- 
2.43.5

