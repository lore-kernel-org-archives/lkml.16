Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767E2522BA
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 23:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993841; cv=none; b=SA96LhJ/xVguT63StU2sNjzNq6Hworq11XU2BafrKFTn+vG9Y39F5ma/lmhX4JTS6JwU4XwVdMdkPJfNlb9c0uMiHXKqKT2rPSsFP1/mvbKEJgjlPSSfQBrAY6LBUOQb36zCAjYC3Kg5bKSUPPQWSTr7EKTHIXGo+60GJpL6NuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993841; c=relaxed/simple;
	bh=RwqSclDMY6GfCaZEU5c53IrFIXQSlzkanBN9AoDM/s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2Hux1gH9HQ/Nv1CkHsDTBeFGyt7mr17bkv8KqGMCtuc0a033YZdqYdc7wu2dU7O7XI7qef9oq9jVBt5T5g9F15NdlHx02+3FVeNBl+K9ModyA30+/obpkOBma1H8SVlvyZHG6ORLWDX8KrgGFSC7+/D5bHBELqh4aMDikCU0Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DjvwatAU; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DjvwatAU"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MN5EB003886;
	Tue, 3 Jun 2025 23:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=fP7NQ
	M9rSpI6g19shnrw/5oiAfJEIKQ6mCauSx8K+74=; b=DjvwatAUc1YiiWNIuxWmd
	bo2luZaIT197HsYg8+MSk8hwhKrz55fFaaWK8kVXSsMCOtqSbvYOmI9sSg8Q4IrJ
	vVM/k837MwoDwtjjm2Or4oE/ZPPbm7UlSHnckOS88LuIwkdpdY5ieXmHU6Saxbtc
	BqxCqJXG7FnqxXnCXUzlK+Hq2hONIRyl48z2n628fa/WRqiiJvyPvQalgQYzgYWl
	4N2OZR78n0sOS6Enagjx/NWddopKVAKinU98mLfivJAu2UNXYI+6YOy8Voy03qcN
	w8e5kvvvRffHVoZPHXAKW/YYQAPzVfwN+q3aomHn2ibfv8UjpvO6dkq1Yxe3SdAr
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8gawfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 23:36:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553MtHqx030803;
	Tue, 3 Jun 2025 23:36:57 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a2j93-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 03 Jun 2025 23:36:57 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V5 5/6] Sched: Add tracepoint for sched time slice extension
Date: Tue,  3 Jun 2025 23:36:53 +0000
Message-ID: <20250603233654.1838967-6-prakash.sangappa@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDIwMiBTYWx0ZWRfX9QkN12Wfj0l0 KdNI0eJuMyS40hXodUPD6SJO8Zj4xkeAnvTasXXxMdLB711gXFvOIdcqlv6poqjy448uSmS3emu g/zLQ0jg0ZfjmDNy1tbjfx/ntHJXuKoiFBG1SRIkYpqlwZ3LKb4VT1yxNWgVS/z7bfVd+9adMFc
 79HzP22TnEfT+SpnZQSXelPDU4PP+IwNn088kqUzocPwZxGXjk7R8Ii6jLsU/6JpG3fX0EYF37V mdiTDQ08ULP1+0CZtnXyLLr1b5EM21Upl+g3dUO8RauGYaEq6zfeAWlaZw2FyfS9ck3Fv8JTgJa XqZuUt6BuOQfe5QTTY0EKiitejd0xJrTAJeZ0RXc64iwS+hEnlmJrpkiYFtzfm3DBmnLiR+uAr/
 lKHYDbnF0/tq6+JpJDCJGLGo9qmL0sOoq3qYEMlu/1McanFNbD5Lj97pQ5USbwivvETnZf6Z
X-Proofpoint-GUID: PyLxm4N2FgS7u85TSFKPdtljAHdhppx0
X-Proofpoint-ORIG-GUID: PyLxm4N2FgS7u85TSFKPdtljAHdhppx0
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=683f871a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=-a2y3q_jHnAO8POPY3MA:9 cc=ntf awl=host:14714

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

