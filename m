Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460032581
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172780; cv=none; b=WhyqMqbRf16lafsbnRfRgK6KrFeCJ2YTWDiko9Ck6qv/Y0vlT2wajV/c/62lDr2Qm+ix80eI6gjy/RxORoBrL3Xgv6TSjZ6smnfLYUD46PjkyiuECQmPRitSP7k+WFdre/tmhUhGk/JOq8lkw7U82rhpURfFO2Y37EEspeUWI9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172780; c=relaxed/simple;
	bh=RwqSclDMY6GfCaZEU5c53IrFIXQSlzkanBN9AoDM/s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnVxlAJzqZatFdrpoNRQbqz+xL/EZphkxmdaFBCOexl9ABgTI6KVY+glJBFH+eKBgzemiEAeumWrm/igWMl2T4Y2ZNpqLD1YN5NocCjqYP7lve/3BiMnxh+YF1ghTsDDwYEUopu51W5avW98Stlk88+xZxL+c9HJRWEAz1jBBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TeIUTFnA; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TeIUTFnA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DL0lgR010297;
	Tue, 13 May 2025 21:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=fP7NQ
	M9rSpI6g19shnrw/5oiAfJEIKQ6mCauSx8K+74=; b=TeIUTFnAa4fihtPnBzw4k
	zej5OSsuWg8sOSD/IY6SGTXhu/W/WtUH65xAIzUy1peNVP5B0VoM/c+8XICSIZb2
	8NVCH0L6j1zNA/ii9qTZD66ZS5g+pnvWgRXTmW7xtINGY/htlsw0PPjIi4yNeQBc
	iRzDcS4qbmAqBvnWn5Qj05MyjAdDiXui1g8Jw2gjUH1FKaTxK2EdexOdDbUonpe0
	gQWhWN/4ZHl8ffjqzgGH7d3P2371i7grD8Z7dBc9VetjtjKYQVN1JjOX9bOn3mXr
	GfDovKwLANo/k06XUiJ+W1aSRgBwPT6o8MU3zxTPKi12G4aKKbsjQ+7HDknF7n8t
	Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbchrarb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 21:46:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DLQjeR001890;
	Tue, 13 May 2025 21:46:03 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mc4yv943-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 13 May 2025 21:46:03 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V4 5/6] Sched: Add tracepoint for sched time slice extension
Date: Tue, 13 May 2025 21:45:53 +0000
Message-ID: <20250513214554.4160454-6-prakash.sangappa@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIwNSBTYWx0ZWRfX2f/em3+ZqP// U7ufb+K01K5tHIdI8xqcF4ZLUm/VzOoTqPZxScFbWQFs33VGNz3cx7y14Kjshak05PjF9E98hhO SPI1ZxcwenGld0oMD9PwWcUsgFEln1LvUWPK7ixiCOBUbOoQaPVUt1LU8kOCy0uAMUHx9+08iYV
 yaO/AnGFaRq+QffxTUO3sFgtlaBvs+98Uvrx56Xk2ALvoQPf30jtsQF/X9797OmjqmcaKc1cCjQ f5EkGPVafKnDOU+++hqtta+XSMA7v40QvGGR+O2aA/4TDdLWH1MNMngS4nOKpx2cBw8RkNNeRYQ bwbRqokjxBkdkgysE1hhykTUqd/cFU1wzPkMhLYkcTxr12SSzL01Omh/M7DVc4KrcJ24h4w7dkL
 CkzjoUhvexOPQZGUCE+Va9QGnaadQPk+FuGaf0Tz8eiQXfSjY6wGmQ53U54B28VieCO5HgkC
X-Authority-Analysis: v=2.4 cv=EtTSrTcA c=1 sm=1 tr=0 ts=6823bd9c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=-a2y3q_jHnAO8POPY3MA:9
X-Proofpoint-ORIG-GUID: xosSJFlI2glUxAv-KhiTv65ZSuml8sPi
X-Proofpoint-GUID: xosSJFlI2glUxAv-KhiTv65ZSuml8sPi

Trace thread's preemption getting delayed. Which can occur if
the running thread requested extra time on cpu.  Also, indicate
the NEED_RESCHED flag, that is set on the thread, getting cleared.

Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/trace/events/sched.h | 28 ++++++++++++++++++++++++++++
 kernel/entry/common.c        | 12 ++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
index 8994e97d86c1..4aa04044b14a 100644
--- a/include/trace/events/sched.h
+++ b/include/trace/events/sched.h
@@ -296,6 +296,34 @@ TRACE_EVENT(sched_migrate_task,
 		  __entry->orig_cpu, __entry->dest_cpu)
 );
 
+/*
+ * Tracepoint for delayed resched requested by task:
+ */
+TRACE_EVENT(sched_delay_resched,
+
+	TP_PROTO(struct task_struct *p, unsigned int resched_flg),
+
+	TP_ARGS(p, resched_flg),
+
+	TP_STRUCT__entry(
+		__array( char, comm, TASK_COMM_LEN	)
+		__field( pid_t, pid			)
+		__field( int, cpu			)
+		__field( int, flg			)
+	),
+
+	TP_fast_assign(
+		memcpy(__entry->comm, p->comm, TASK_COMM_LEN);
+		__entry->pid		= p->pid;
+		__entry->cpu 		= task_cpu(p);
+		__entry->flg		= resched_flg;
+	),
+
+	TP_printk("comm=%s pid=%d cpu=%d resched_flg_cleared=0x%x",
+		__entry->comm, __entry->pid, __entry->cpu, __entry->flg)
+
+);
+
 DECLARE_EVENT_CLASS(sched_process_template,
 
 	TP_PROTO(struct task_struct *p),
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index b26adccb32df..cd0f076920fd 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -12,6 +12,7 @@
 
 #include "common.h"
 
+#include <trace/events/sched.h>
 #define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
 
@@ -91,6 +92,7 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 						     unsigned long ti_work,
 						     bool irq)
 {
+	unsigned long ti_work_cleared = 0;
 	/*
 	 * Before returning to user space ensure that all pending work
 	 * items have been completed.
@@ -100,10 +102,12 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 		local_irq_enable_exit_to_user(ti_work);
 
 		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
-		       if (irq && rseq_delay_resched())
+		       if (irq && rseq_delay_resched()) {
 			       clear_tsk_need_resched(current);
-		       else
+			       ti_work_cleared = ti_work;
+		       } else {
 			       schedule();
+		       }
 		}
 
 		if (ti_work & _TIF_UPROBE)
@@ -134,6 +138,10 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 		ti_work = read_thread_flags();
 	}
 
+	if (ti_work_cleared)
+		trace_sched_delay_resched(current, ti_work_cleared &
+			(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY));
+
 	/* Return the latest work state for arch_exit_to_user_mode() */
 	return ti_work;
 }
-- 
2.43.5

