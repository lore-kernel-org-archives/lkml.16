Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91592522B5
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 23:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993840; cv=none; b=ZK1ctM2G5pz4p4hqSm2WTk5I2155T08gjV2NzAZDhLLj8PU0wq7AnO4j5xX/RWx8IykZXMFXfYec7jnV8S1mXHNa1m+cwAKq1I+7doA6fo7m+93t8cXjogaFw56uW02Y9e4tG9Y5lAlRPC/Wg+ricBftb6I3pOa51bO8pLOvHPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993840; c=relaxed/simple;
	bh=2uL+0Zwp87pysajm/okX2HDO9RisreP4PWYFKZElQS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WceCEzFkh9hiGMF57q/McmMiimFm63GhBeE/nDMJBpgJfrJeIFzn7Ntn7Eu9cMqjBdhPG4xWOV1gBqrlYfEbeQHzSXuDsGJP1qcEbNDB0SR2+IZVVyFYcDFy6txSUwQiFG4c2/EzvLto8su6QvhihKG9STSH+ULJxHhVpmmCZU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=piuOmFzT; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="piuOmFzT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MNSt2000913;
	Tue, 3 Jun 2025 23:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=6hBEg
	VpVgl7/BUSASlqOj6zL7f7ZoKMd7QZmJcNgWeU=; b=piuOmFzTfIxiYRpXOXtZD
	6vWN93OjnncJMrBhLCAlNVTUhACh0g4S0hY3h+Dds+bZazptO+F4jMVVZTRG8lQ9
	4vjmwuujbDzMBNp0i0IDNXkE1e424RCnoMsEFFbFWFy8LnliK7/rqGTp3WqGyxTT
	XeKr9fGhk7RW4Ia8VbQ+k9rrza1f3A0WYtYlGPoFVdVf+BUgEz5/j7SRj+I/HKno
	vHdR6E8Cf86oYcWqh50p7VJY2qvGo6FzgNZT7boI7hghoav1TuuT6RH56+XHa6Lt
	/7ZZu7JZpo4Rq/gXSEkVkUSXKODxZeUUi1FU9HDse+4250EluJAkHnvW2DIX4D0O
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dty3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 23:36:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553MtHqw030803;
	Tue, 3 Jun 2025 23:36:57 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a2j93-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 03 Jun 2025 23:36:57 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V5 4/6] Sched: Add scheduler stat for cpu time slice extension
Date: Tue,  3 Jun 2025 23:36:52 +0000
Message-ID: <20250603233654.1838967-5-prakash.sangappa@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=683f871a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=vUPmPsuNeZtoDWJSgW8A:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDIwMiBTYWx0ZWRfX0DgZu18QMrk6 82rEYOm5HYxXlegybGoJ31/FPOVC+POt3tF7yXAAuEXOtvRj1cG1zVzB8GKf03MPp+xhnGim1Kq sign1lqGp2QrXxZ1t1HYAQQ6U8lGWRJ9+U480/tdSaAtZyTYHUVMIEzFOsB3HXdQei47n1DD6U3
 LrsWDAl4nEpap3BqpkySPJR1XTt2JlCrjrFcu9UUc1YRV4qoUZtJ3rY/XMhjz/p6FehbE+P7jBo btj+CMgz5blI0NMmpIhjzFPFe2So2anz/8u8+Mhk7S70fkDkHt9K4PHuCyh/JzRDLWMipuPLRpR 3FGbtC6cc4RJeFlkk3NDydO8uWBq9Cj4BAG9Zx7riw81XlQ+LHvkrLbKvCNVvfSLRbM80vmWcji
 5ro+OQQ/9Y9NBHQ4F78yGZxGSGwdq5Mu6SYfF7QViv35+uk1kO+t1lRq4ANvowb+y+Swwpyb
X-Proofpoint-ORIG-GUID: 21ladm4DMoryhfZtKrzY7nhyoq5f47-9
X-Proofpoint-GUID: 21ladm4DMoryhfZtKrzY7nhyoq5f47-9

Add scheduler stat to record number of times the thread was granted
cpu time slice extension.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
v5:
- Added #ifdef CONFIG_RSEQ
---
 include/linux/sched.h | 7 +++++++
 kernel/rseq.c         | 1 +
 kernel/sched/core.c   | 7 +++++++
 kernel/sched/debug.c  | 4 ++++
 4 files changed, 19 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 14069ebe26e2..6c2e9d30c2fc 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -340,6 +340,9 @@ extern void io_schedule_finish(int token);
 extern long io_schedule_timeout(long timeout);
 extern void io_schedule(void);
 extern void hrtick_local_start(u64 delay);
+#ifdef CONFIG_RSEQ
+extern void update_stat_preempt_delayed(struct task_struct *t);
+#endif
 
 /* wrapper function to trace from this header file */
 DECLARE_TRACEPOINT(sched_set_state_tp);
@@ -566,6 +569,10 @@ struct sched_statistics {
 	u64				nr_wakeups_passive;
 	u64				nr_wakeups_idle;
 
+#ifdef CONFIG_RSEQ
+	u64				nr_preempt_delay_granted;
+#endif
+
 #ifdef CONFIG_SCHED_CORE
 	u64				core_forceidle_sum;
 #endif
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
index e5307389b30a..95fce557a294 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -940,6 +940,13 @@ void hrtick_local_start(u64 delay)
 	rq_unlock(rq, &rf);
 }
 
+#ifdef CONFIG_RSEQ
+void update_stat_preempt_delayed(struct task_struct *t)
+{
+	schedstat_inc(t->stats.nr_preempt_delay_granted);
+}
+#endif
+
 static void hrtick_rq_init(struct rq *rq)
 {
 #ifdef CONFIG_SMP
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 4cba21f5d24d..b178cb0e2904 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1217,6 +1217,10 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_wakeups_passive);
 		P_SCHEDSTAT(nr_wakeups_idle);
 
+#ifdef CONFIG_RSEQ
+		P_SCHEDSTAT(nr_preempt_delay_granted);
+#endif
+
 		avg_atom = p->se.sum_exec_runtime;
 		if (nr_switches)
 			avg_atom = div64_ul(avg_atom, nr_switches);
-- 
2.43.5

