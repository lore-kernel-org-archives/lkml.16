Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A121CC64
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004875; cv=none; b=R/KJe3CdJ//RjkmSA2czIBV/I9KEbpyoCTkMUhpmK1a7/8Lg5TwJXLNJxfIGzTVQsATS/IuGbItn6eoP7KaQLtqLUTpO9/aRQQFx4rzWTAN8qWrZoJrv3HHS4v4XMYPmYWZPhnDMkvULEWYO4NVpmg1x+gjbRnqCNCrjb5WG66w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004875; c=relaxed/simple;
	bh=JRPNpxrZJesS5QZm+9qn4/l+3J4kbs3kiiEObTDlEew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcWLVuxkRHpjVBx16AQSaZQKNRpFoWIazQdt6OLcFBy5V7pQLBhF1D45o0Afs7Zv+zxJbbbwHfuBwVH5x3uO2ZSECNooLs2g+WcDVV2CMLBYGN/an+hreD7RkLwQw+5JDsgX3ZLh8kfRaa7hubhj+Avrn6V4XegBtaYZzqfe31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N8If/W8N; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N8If/W8N"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IJCe40005929;
	Fri, 18 Apr 2025 19:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=HYM1W
	FhUNRWnr9m7RbnDdHVWykeNIG5BuW9k+n6uhJQ=; b=N8If/W8N1LAyzip2kgPFA
	2KVhC3S0C/eWh9IkrWxkm0LwlFQFgexCGApjpHrT/AZJntyCisalqFOncDMTUHCh
	V1DEXKANLWgoOoba+oQdFGR3q3EyuYsNqHed+d6gkUEIHQY6M4tgBRqPuXfYcsQv
	WPeVaOL57OMP8ljH/MoSZnFaaTm9JLM3BXMtTbmBzOB7dG7WiN8GwbGtIk6jEyhb
	EsoMf70f0yHyOVZdQ+aQLQA61j3Rjg8Q88o6JjX8SAWSWGtrAiTF+il+shNGbjym
	vsSmssJ8pMGIjlpDWYOZvMInNeuPxnKQ1bjDHGC4sks3h4xekLcouFES7vLchPnF
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185n0nuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 19:34:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53IIn28l038828;
	Fri, 18 Apr 2025 19:34:15 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4w8qqy-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 18 Apr 2025 19:34:15 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de
Subject: [PATCH V2 3/3] Sched: Add scheduler stat for cpu time slice extension
Date: Fri, 18 Apr 2025 19:34:10 +0000
Message-ID: <20250418193410.2010058-4-prakash.sangappa@oracle.com>
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
X-Proofpoint-ORIG-GUID: 7JGZ84SkMdejhFq0dD7iB-kjSakjkkQB
X-Proofpoint-GUID: 7JGZ84SkMdejhFq0dD7iB-kjSakjkkQB

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
index c91856f908d6..2c5c928f1128 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -327,6 +327,7 @@ extern void io_schedule_finish(int token);
 extern long io_schedule_timeout(long timeout);
 extern void io_schedule(void);
 extern void hrtick_local_start(u64 delay);
+extern void update_stat_preempt_delayed(struct task_struct *t);
 
 /**
  * struct prev_cputime - snapshot of system and user cputime
@@ -541,6 +542,7 @@ struct sched_statistics {
 	u64				nr_wakeups_affine_attempts;
 	u64				nr_wakeups_passive;
 	u64				nr_wakeups_idle;
+	u64				nr_preempt_delay_granted;
 
 #ifdef CONFIG_SCHED_CORE
 	u64				core_forceidle_sum;
diff --git a/kernel/rseq.c b/kernel/rseq.c
index 7022729d02ee..d8e3bf126248 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -453,6 +453,7 @@ bool rseq_delay_resched(void)
 		return false;
 
 	t->rseq_sched_delay = 1;
+	update_stat_preempt_delayed(t);
 
 	return true;
 }
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 59b381cef472..6a08e6ece98d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -931,6 +931,11 @@ void hrtick_local_start(u64 delay)
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
index ef047add7f9e..e160e14b348f 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1213,6 +1213,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_wakeups_affine_attempts);
 		P_SCHEDSTAT(nr_wakeups_passive);
 		P_SCHEDSTAT(nr_wakeups_idle);
+		P_SCHEDSTAT(nr_preempt_delay_granted);
 
 		avg_atom = p->se.sum_exec_runtime;
 		if (nr_switches)
-- 
2.43.5

