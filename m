Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FC1136352
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330320; cv=none; b=MJv6cZ+s7H4Cvg8ihWUi2gb+t9fZGfYKow5wTh6SEQG/5a6Y7VlyQrm2Teej56f+HIVkAdmqw+0GFl2R2c0gdaNvjBUgFaZM+oZiktEa3mh/ceSiTpPJRDxzULVngPbxHOPXTps+qj6aWLEMrMNmlBkrVRl0hWyai3lKMjrJi/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330320; c=relaxed/simple;
	bh=IRnyvt+7jl3BW7QGojcwKSgx4PX0gGxlwsOqFULkOR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tM+QITlkRBLZEor7OMUWnU/0QyTfPQO5MZnEMZyHlPPxWzBlvmZ03SxZUnlk4eVn5vGAfixXTGlUtvJyCmTIR+RxrYZP0VLDJh2NS+CZuk6s0V7fqCooOJpVk9kG91UX20KU+8RW3fEqFKnp/T7Wj+S+NF5z5R35HxCReP9evIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RD5+D9Ql; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RD5+D9Ql"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UICIeN013322;
	Tue, 1 Jul 2025 00:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=suaLR
	58JSndY28lBIAWZHxUetHyvOEwZ6/3F7a6zJdg=; b=RD5+D9QlchJpwjpf2bqiB
	3/lHylW5WIMJjUCIDKy3t08ik9V48Sh0eiKbvPUGS7x30uYJKBHJgw0uaJ3hEL49
	iQxtbjYu20WUiB9/tIhsh2u70y1rvkMDa12NrYHl80UGtOR5TiHIrwa/qD41UvC6
	PX3f6YihE3MASi1ae1z0doUxh5G2hF3zCyJXpAwafWQwRoz6YL252ebf4/CgUe5o
	cVuFyXoNrNLQxofRINzwtouzHTQcAZnMSNaaIOlPe+g+dbv5bJ+aL5t1GMEp/PX+
	XsroNhJgvqGacS+ATO7ZjEQK594PO6wwu2p/hcHnHB2JOvtrWcSwbkOvfj/ZNmKx
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfbkvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 00:38:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UNDxNb009139;
	Tue, 1 Jul 2025 00:38:08 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u92pxj-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 01 Jul 2025 00:38:08 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V6 5/7] Sched: Add tracepoint for sched time slice extension
Date: Tue,  1 Jul 2025 00:37:47 +0000
Message-ID: <20250701003749.50525-6-prakash.sangappa@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68632df1 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=iS32z0vWAbCrL6C1AdEA:9 cc=ntf awl=host:14723
X-Proofpoint-GUID: kNcHrIudpwk8ewwSpiqmBMPaBPw9ypKL
X-Proofpoint-ORIG-GUID: kNcHrIudpwk8ewwSpiqmBMPaBPw9ypKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMiBTYWx0ZWRfX6LUWlgMM7IvE 3Ewirw4HZ1bajTPlayYTUGC3s9fkziyqKFXylmh5iHPqCJXhzJgHHUXkufV1codD9xNmAKt2Njm YyHeVuVSttQuc710x5+r1tMOGl18K6+i2uJdwm7vGt9u71DjyyzOcqM+fXt+ksK4kHeO6/OEA4Q
 FINk3AeME6Ma49pCDPELoP+LrLe1d3jk3PpJYwW4RC4dKLvn3OhYAiDQ+vSlOayhS/jUdB7yMhx filRADbDsIfqIgQyQWLiDxHI9XbV4RuABLWZVnO4KjsU4hTrx1dMRopzPdsVd8rHNcDAIvV1Uw/ PToFs0YP/A9xRHvYrCZS8g0DrpERjD5NLET0D/uQYYzu5Z7GX2mkge3cR1rAlJDFRng5FUkhpmE
 8qLPUzb0pOo7Bn/+AbbJLFfjHC54/JYXX2lnHwdFBedG6P1wI+vuIr1J+CWHJWhOJHDs4bEw

Trace thread's preemption getting delayed. Which can occur if
the running thread requested extra time on cpu.  Also, indicate
the NEED_RESCHED flag, that is set on the thread, getting cleared.

Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
v5 -> v6
- Changed tracepoint to tracepoint condition.
---
 include/trace/events/sched.h | 31 +++++++++++++++++++++++++++++++
 kernel/entry/common.c        | 10 ++++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
index 4e6b2910cec3..a4846579f377 100644
--- a/include/trace/events/sched.h
+++ b/include/trace/events/sched.h
@@ -296,6 +296,37 @@ TRACE_EVENT(sched_migrate_task,
 		  __entry->orig_cpu, __entry->dest_cpu)
 );
 
+/*
+ * Tracepoint for delayed resched requested by task:
+ */
+TRACE_EVENT_CONDITION(sched_delay_resched,
+
+	TP_PROTO(struct task_struct *p, unsigned int ti_work_cleared),
+
+	TP_ARGS(p, ti_work_cleared),
+
+	TP_CONDITION(ti_work_cleared),
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
+		__entry->flg		= ti_work_cleared & (_TIF_NEED_RESCHED |
+					_TIF_NEED_RESCHED_LAZY);
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
index 8769c3592e26..ca3c91f0ea99 100644
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
@@ -134,6 +138,8 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 		ti_work = read_thread_flags();
 	}
 
+	trace_sched_delay_resched(current, ti_work_cleared);
+
 	/* Return the latest work state for arch_exit_to_user_mode() */
 	return ti_work;
 }
-- 
2.43.5

