Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276610A3E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 02:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151223; cv=none; b=MWDIQzxcIeWD7eP0pTDkSQFqYTZJiHkfNZceluQaR4R2SORmAMvjVd11Rt2Eg6HFmCrJDVsYbX/Q0JulPeIzbROyQys9CvE3xsZ431dwrtf40eNtZkGYRBb4g/Ef1aeDp7k9xKS4syyf28z1NBrsHSO48pYHXnXGHPUkX5+EHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151223; c=relaxed/simple;
	bh=atTXP+694Aux8BhuSCLFOHPu0kPkh4AOt9gerkd3pdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8MNs287LPDix+k40BZES/PjGS2K9zXb26PyxmNg7bMmzomtI8Zz8phlMlyv4FVmIoVHiro+Ri9S+uSNbsoslxooQHYgoNk28juiNJxBV9v6xmsYSGj5p1KsTob4YDpLBDaw6EJwPChlAFYerNbdIXPm8SN7QjB/GJDOlYx5wFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GXjbuKiL; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GXjbuKiL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541KeRND021468;
	Fri, 2 May 2025 02:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=esKM0
	Oy8DM3GOqvsuucG+ZW3+3TxMtiamPFuV4U6QY8=; b=GXjbuKiLqzrfxe+EYIgeE
	rJ1TgDtZtcQvgBMUWg6Yy5JwEan+9E2Sz3eVkJJL2lIa4TqTkvsd9YjIUZPQg27N
	jMwQO3f4EiDNdXBEu0qG864hSg3U9B58lQ3Xm8AS78/UZdyj6byhnTZzGsMrINCm
	/5iTX/ipzzhy9GfZ4ihDeodlr99OXNzhuWaOrnCevPoe7AfwfjvvqUPPDtaQ1B49
	kdsjDvZjcFY3SeNF1Kv4FoyhX8FM+E7ygLsrvkvcrDZgcsTQ97MB20lKZdp5XwLh
	xVeFyFzQARj8tF0S9yDqoLwICcnLkvhdNEIUn19+8J9iBdGWsxK5RuzFxC3lER93
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uqmdj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 01:59:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5421aMDU035421;
	Fri, 2 May 2025 01:59:58 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxd1euw-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 02 May 2025 01:59:58 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V3 3/4] Sched: Add scheduler stat for cpu time slice extension
Date: Fri,  2 May 2025 01:59:54 +0000
Message-ID: <20250502015955.3146733-4-prakash.sangappa@oracle.com>
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
X-Proofpoint-ORIG-GUID: VpFENSIBJXGoIRujMdpW5sLTndIaZSAv
X-Authority-Analysis: v=2.4 cv=Vq8jA/2n c=1 sm=1 tr=0 ts=68142720 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=HM_RregbEbY-m7O0KLoA:9 cc=ntf awl=host:14638
X-Proofpoint-GUID: VpFENSIBJXGoIRujMdpW5sLTndIaZSAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAxMyBTYWx0ZWRfX3V5K47kZJh6y eNqOXJV1rhkV/SIeciuZBAD1fs7bvTi7fOY3vwbdK8SFGNuUWnqhIdjcTZJ4eLufC28s/c10PAO ExEiOgKolWSQwVgYdRjl/Ue2aoI0tWtLh+QTTVgB8qVTHKskNyQ234TijNiY7pkzV5w1UDRH8fz
 Xm37W/1xYYyafc5vrPRGXa8e1EgR6DZEOAH6lQqS2hBjn4eltZj0OWl6C5/jMNFoRRMmlG3m6kX wyXycwBwjHzLJXJzI7wK3WYrDKEIX5ukpBltzGDDcynHjTZljhYweJgBHtqNLBgMD09QmmK6DwM YDCdZp7jonAXSU+tXEMNblkUojKdhRxJ2HPV3mXXnz+RX5L60Pg0w9BLVc/oA+ySq/wS9youPpy
 hHXLC1O1EBh+5mn/KVlZlpIrIv44NO81K0jYBFOQG5vNMGvCRrLG8whKSphoIqnfGxMflqfu

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
index cce3a0496703..1367171b4a9e 100644
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
index 0cfdaf5b6c8e..4c1586977f1b 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -475,6 +475,7 @@ bool rseq_delay_resched(void)
 		return false;
 
 	t->sched_time_delay = 1;
+	update_stat_preempt_delayed(t);
 
 	return true;
 }
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 05a952ec15ae..cb5bc0d41b01 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -936,6 +936,11 @@ void hrtick_local_start(u64 delay)
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

