Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7C20C484
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172797; cv=none; b=mweZMtMe9ojRrf1+f+f4pcEn89UnrJ00nm/k4OozNnNZ9suckBFzz0fn/7rgR3pIW/Klqp55rptx47sFz2SvmdPtoRV6BX14HPcqQuWOHXBE5UwCxic9AwVuWGgN1BXMosFh2XuF3lubVqj1RF5NZRQvd9AVyKS7qw342bp9lgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172797; c=relaxed/simple;
	bh=dMxkB/Amgm39mRKWuYEQ2bBhP+VIS7OEzCC03PxhBq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpZYeLiI+M1XbDJPIU6JdUCtORB7oU7d7M5NfJKpFALn6bybMprrzqbw9I+OVV+h1VBhYGsqhv1HulSg6R1ftOlPs8+fLkKCfvgHAhQqxOHmDeMsByHzuAjW6WNK24AtfERthkLvZqf+pa59Uvk4dIx0CfT6YqHhx1Rt6OndN0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DrfMPayQ; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DrfMPayQ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DL0l8g021615;
	Tue, 13 May 2025 21:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=FeIq8
	56bcHjC00EZD3ha87tR0WyB1diqHSx9HB1jnDo=; b=DrfMPayQaS1KU3esxNRju
	kebAN0YVdagIUH3K1apgiCalehATk77seR1WJRei7dsDj5MlQMeS+s+/r17rG/sa
	bXn1mBFQveUNN4iDru0j64pzxsHBzo37+NACgdk/BFzEe3Q+ivTvT28Mh8798i5p
	N1AAk+L5wSECa1K1zUH0DFsaoddIf4hM6Ndpk7DUnN5AQr/bn7PP2/y0JcjwldkW
	hYs9E4sgebdCqsE7VeeYrrZgyOYLeyeKJ/I0hgIT/NdDO3Y1lptSOUYjQ//YU1Yj
	03ubYbfIta8SzC72gy8SIcI1reFqgmT3JwuDy2bBSQI4vrC38N4JH7zMKWphmbkk
	w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcmgat2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 21:46:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DLQjeP001890;
	Tue, 13 May 2025 21:46:02 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mc4yv943-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 13 May 2025 21:46:02 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V4 4/6] Sched: Add scheduler stat for cpu time slice extension
Date: Tue, 13 May 2025 21:45:52 +0000
Message-ID: <20250513214554.4160454-5-prakash.sangappa@oracle.com>
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
X-Proofpoint-ORIG-GUID: Ifzoe-T7iBWx5m7dX-pzDVY50XpyzFdP
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=6823bd9a b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=HM_RregbEbY-m7O0KLoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIwNSBTYWx0ZWRfX+0AVgNjn0+co sxCD2insB0oBCR0H/PZ0kZ3Z145UpzYypC5ni8QAyk+ZQOO0s1xozja2y00j/7MrEKSmuPlA/V+ 7euUIMRx/+PD2xl6g+V4qNw5HUopO4ImSqNygXAseJsymlGYEKXKm9X0h9bXC2u4SrViBIpdV1k
 Wf590N5z9SFX869UrQ/PErJPSRVDSlTkdb0nu6/3giqr77sySnG10FZKAEbK7SBDNZyYMgAwHKC gaLTxTws1F7JWYwu30pT2yVpA+CZTMhL7pMr7MmoRUvEqrGV4WVSThfn1tR33PQS7dmAg/cEzqz vNmgdBLbftloRsmvl4gPsNBfIKjyHIGFTTf20lAF8csli87EmTOZdXVzmogKcoa0ahPJu91a6sn
 1qrla3EmUKg2XWvoh4BKOpK+R5VbNIVzWCUu0pMU0AOXG7Q/X8KhBu7BkLxvRPT5uj8ee06y
X-Proofpoint-GUID: Ifzoe-T7iBWx5m7dX-pzDVY50XpyzFdP

Add scheduler stat to record number of times the thread was granted
cpu time slice extension.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/linux/sched.h | 2 ++
 kernel/rseq.c         | 1 +
 kernel/sched/core.c   | 5 +++++
 kernel/sched/debug.c  | 1 +
 4 files changed, 9 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index c279232ca6a2..8cf756e80ae9 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -340,6 +340,7 @@ extern void io_schedule_finish(int token);
 extern long io_schedule_timeout(long timeout);
 extern void io_schedule(void);
 extern void hrtick_local_start(u64 delay);
+extern void update_stat_preempt_delayed(struct task_struct *t);
 
 /* wrapper function to trace from this header file */
 DECLARE_TRACEPOINT(sched_set_state_tp);
@@ -563,6 +564,7 @@ struct sched_statistics {
 	u64				nr_wakeups_affine_attempts;
 	u64				nr_wakeups_passive;
 	u64				nr_wakeups_idle;
+	u64				nr_preempt_delay_granted;
 
 #ifdef CONFIG_SCHED_CORE
 	u64				core_forceidle_sum;
diff --git a/kernel/rseq.c b/kernel/rseq.c
index 44d0f3ae0cd3..c4bc52f8ba9c 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -475,6 +475,7 @@ bool rseq_delay_resched(void)
 		return false;
 
 	t->sched_time_delay = 1;
+	update_stat_preempt_delayed(t);
 
 	return true;
 }
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 31928cbcd907..880368756b48 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -938,6 +938,11 @@ void hrtick_local_start(u64 delay)
 	rq_unlock(rq, &rf);
 }
 
+void update_stat_preempt_delayed(struct task_struct *t)
+{
+	schedstat_inc(t->stats.nr_preempt_delay_granted);
+}
+
 static void hrtick_rq_init(struct rq *rq)
 {
 #ifdef CONFIG_SMP
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 4cba21f5d24d..6b753f56c312 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1216,6 +1216,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_wakeups_affine_attempts);
 		P_SCHEDSTAT(nr_wakeups_passive);
 		P_SCHEDSTAT(nr_wakeups_idle);
+		P_SCHEDSTAT(nr_preempt_delay_granted);
 
 		avg_atom = p->se.sum_exec_runtime;
 		if (nr_switches)
-- 
2.43.5

