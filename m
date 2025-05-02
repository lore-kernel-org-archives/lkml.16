Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F13BA45
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 02:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151222; cv=none; b=ZhMdfo9pAUl1FdFuzbdiZgawm5VhQqaltJv43KuGnWMaBJAmyWcOYzvaSnHNjutw9x6LADX1oQVAdwpqaCvNUyvIgowOMWiPL4Ppgz1TEjJjsZDJTs3xDnbV3dZL6RZcs4+SNEG5gRMPFZxLrUbPFkzOyERz44zAaqnSSMlXxn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151222; c=relaxed/simple;
	bh=ZXkDydD8p1Uc21PX/F84gcKQrLXSFuEgfF/Sh8BgQlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLnrhd15efgmIcMt0tOU5v0C8XXAFg2NxCI3BGDh2s85MQxtax3XYJsirNaxjk932IUHNX7tIfdUKZoirdpFYzj6nz8SqTv4JX9rfLgFNn/qZ+CdSy+xcZMN4GqsOwrRx0skMBiyAZjY1MPni5asWbBNZRUrDMLLnvmVnBrUfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RQYxdfom; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RQYxdfom"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541KeNdt007190;
	Fri, 2 May 2025 01:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=lBN+p
	zYewV/WF24zN3SzgAWiwurwsgcxGEwDaDvrUwk=; b=RQYxdfom56AJW9us9UDsF
	CjgK9y8ItMQi9CSoQ/vPI7CFKW+/yo9iWNP3GMuaTw7kXeKjyrf+7pLxDaAYRhdq
	wRo5jQZbyM5kvMy8B7k7R29H9TWR0NUC+H2ngC9l5S7+JczEHUqAhTzbJh5AScXx
	cErp4EJuSsusp4rOCHVefKs9pcevbXg65Njk5MXBmG6PCh13ovV0XWydo4OyMvsc
	YJkRHzBTD2/VXuZLs08qkq/4+90FdpN8QNVCyQrg4L9JC8QTHbf62xnno52qFmbP
	0oEggOQ2I+1AVqzZzAbd7ECDVvsMWUDblPJ9E1A28K1/f56wA50rCZUEPmeaPJsO
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ucmdhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 01:59:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5421aMDV035421;
	Fri, 2 May 2025 01:59:58 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxd1euw-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 02 May 2025 01:59:58 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V3 4/4] Sched: Add tracepoint for sched time slice extension
Date: Fri,  2 May 2025 01:59:55 +0000
Message-ID: <20250502015955.3146733-5-prakash.sangappa@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=6814271f b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=-a2y3q_jHnAO8POPY3MA:9 cc=ntf awl=host:14638
X-Proofpoint-ORIG-GUID: d6gd_v_NDBb0nYxLBWhyHtu9qrVoUmWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAxMyBTYWx0ZWRfX8We9gt/JWU42 UwIxrJAUwElniPIJysvck+5hz/kkgQsRt9vxwJW1jSDLtP0TR4NObeFFKRXwGumP9NfDK25C686 UFatNfbfroH+ufJNP7Td23dbyIzd4IOKCzvBiwwzPZXjh8xXN2eEJDhLyuFpuhqFj1JejmWf73F
 IednqszEgZtKAB2ae5yPEwlFcZlrMyWktxapvmmfVInI5fsg3/jb+BIPRIION3DYVIAlRPBctsT aF1JpN88eXBRMDXFWtaa/lkj4aTRR9owfgpirsP54e9AbjOWVP/ffHHK4kHpPs8tSusvaMZJsy0 FQWqxbTXIIYKBmrTK+s8vDua2ix1Z3baKg5dHrrdqzDKyJg1exyyEX6My8dtfPdl0QfGYjT0cQy
 J0e9pegkUNVzOfUQ2dh6I/QBnAv4Ix8Nhdjo3uTMbGGYWkzwS7A+xH/sms8srRLex2ZkzDU7
X-Proofpoint-GUID: d6gd_v_NDBb0nYxLBWhyHtu9qrVoUmWx

Trace task's preemption due to a wakeups, getting delayed. Which
can occurs when the running task requested extra time on cpu.
Also, indicate the NEED_RESCHED flag set on the task getting
cleared.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/trace/events/sched.h | 28 ++++++++++++++++++++++++++++
 kernel/entry/common.c        |  8 ++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

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
index b26adccb32df..1951e6a4e9bc 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -12,6 +12,7 @@
 
 #include "common.h"
 
+#include <trace/events/sched.h>
 #define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
 
@@ -100,9 +101,12 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 		local_irq_enable_exit_to_user(ti_work);
 
 		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
-		       if (irq && rseq_delay_resched())
+		       if (irq && rseq_delay_resched()) {
 			       clear_tsk_need_resched(current);
-		       else
+			       trace_sched_delay_resched(current,
+					       ti_work & (_TIF_NEED_RESCHED |
+						       _TIF_NEED_RESCHED_LAZY));
+		       } else
 			       schedule();
 		}
 
-- 
2.43.5

