Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F7A12D1F1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330321; cv=none; b=q98Sy12KkIt4GgdywmOyZIce4xpg4wSaIV0QuEoLxnHckbTjRIPh9aPZxhnEkPokFWKraYS1E9Hc/xwZX0qZmfgPvRKe+Cb6xWwIM2FsBUvQaiiLznYRsCX32AgtSJoWRsIVwH/LuJzJG2TbxXA41IHtB5SlMAjrFkWwafb8CnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330321; c=relaxed/simple;
	bh=EZlHI3AyZZK47wa6IArP7bBLMoai9emuvFkF8uXxd2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/Nv1D23MZcrBehrKy8YiTQD8rYlRmnnn8czR19QGDcujJM42uTCb9qF5lX9qvg0J3wt3bEWlpesniwrbx9kajdqbq2aDfkdSvEcLEhF7lDrxW/g9OPh8wXXRHaecCN5EAPyANYt+UVrrDTPuvHSvwLM0RQG8iMYqHDSQnALVjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Pn13kk2Q; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Pn13kk2Q"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIC8cN003843;
	Tue, 1 Jul 2025 00:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=r/TQj
	5217mubelqEr+IAQuWUykYsQHPEzX3vIPhbFlY=; b=Pn13kk2Q73GG1se65q79O
	938B+LAjrrx4LK8zSMJdqecTapMjVCL8mHN2s/lug8AGXNYDOHWbtEGok7bYvWiE
	LE5sKPr76e+bjAkfcNpCiAp+oxfMSqDus3Ila7+RRpvkPF0JBWvOOsdFR1//KfDk
	G9JGZuf2w9knIpf8AuCqkZC05S81u85xaENXlqyQiNjeBB28ltzBPh5IMu5Z44CJ
	G6kPv2zW7byou4mbMujwGEZCvBx3DHnEJs1b2Bb6wA6EBRdVNJxludC2p7fCnjmj
	ukSdyzY5A88pC3NBUL2Dgkg/E/6xE185VTx9nweGi+3+Q1w2YGNAxiAGpfbFMtxH
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w3k32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 00:38:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UNDxNa009139;
	Tue, 1 Jul 2025 00:38:08 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u92pxj-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 01 Jul 2025 00:38:08 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V6 4/7] Sched: Add scheduler stat for cpu time slice extension
Date: Tue,  1 Jul 2025 00:37:46 +0000
Message-ID: <20250701003749.50525-5-prakash.sangappa@oracle.com>
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
X-Proofpoint-GUID: iFKrfZETNWp0LnT9hczTZXNzD0sgkYJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMiBTYWx0ZWRfX6EsREupSKwA0 Drx+r75NOoVpqcpQFUrlPT/h8G6HsY3O+c0qrUC9TgzLAfNiLBVsnxQGiPydCe3cndjXwHjyYuv v1lApPWqhGKnTs7D6W7KcHo0ZaK1u8tXnvzomTm0gshY7rDR19MMbr61qyMllhtC7hymoyUipYi
 cGdN1/g+MjyvQnNNrtWLaRloImWmu56yt/0d/EuegbIkq8z0Jr1nkPaasibo1Fhv/b3hz0rHGBh gy8bV3azBEN4H+TtqX/mRJzMRxoXdHn20zCqucu5IMSwno74x7h7AmxeV7Qsqxa0p47SzNYYZLv vxEDCF3uBtkXezYh6WoSnpvWB5SrVIf+o6ZUDJLsL8yQiwXh3WmTDq1dJ62nRifAHWTUNY+bWUM
 1ue4F4zvZwdbvpoGNXo1I99Ofb7g7mvwy+E1vXVKrbseoUW6MwP9tlhOlnvvjYla1xnBS1Tk
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=68632df1 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=OT5oSfvlyc5tXnlsM0wA:9 cc=ntf awl=host:14723
X-Proofpoint-ORIG-GUID: iFKrfZETNWp0LnT9hczTZXNzD0sgkYJj

Add scheduler stat to record number of times the thread was granted
cpu time slice extension.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/linux/sched.h | 7 +++++++
 kernel/rseq.c         | 1 +
 kernel/sched/core.c   | 7 +++++++
 kernel/sched/debug.c  | 4 ++++
 4 files changed, 19 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index a0661f1d423b..90d7989a0185 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -339,6 +339,9 @@ extern void io_schedule_finish(int token);
 extern long io_schedule_timeout(long timeout);
 extern void io_schedule(void);
 extern void hrtick_local_start(u64 delay);
+#ifdef CONFIG_RSEQ
+extern void update_stat_preempt_delayed(struct task_struct *t);
+#endif
 
 /* wrapper function to trace from this header file */
 DECLARE_TRACEPOINT(sched_set_state_tp);
@@ -569,6 +572,10 @@ struct sched_statistics {
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
index 545123ca60b0..99aa263c3a07 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -475,6 +475,7 @@ bool rseq_delay_resched(void)
 		return false;
 
 	t->sched_time_delay = 1;
+	update_stat_preempt_delayed(t);
 
 	return true;
 }
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 6d50eff9be8c..fd572053a955 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -941,6 +941,13 @@ void hrtick_local_start(u64 delay)
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
index 9135d5c2edea..3a2efd9505e1 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1225,6 +1225,10 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
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

