Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8AA231842
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 23:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993838; cv=none; b=Jv/A4hRqp2S4LWxPt60tSQqLsmfcRDrFoR43tyGy12S9alcevFM2JIt+oi+eVHuHf/YeCCJTN3mhGRiZYh+pX30NTHZnnTEHsfVwd9hA31ozsalJj1l8UzBXVwwNEsY1zm1qgEsi8DlaGZosRJmE4dmNaDPinI2CcbDw3s7uE8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993838; c=relaxed/simple;
	bh=Hvp3nU+HjLeWs761iA7FXQjwIa2uP2Ctm8FYDl4ullI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNI31vdiCgr1AvwVSIPl3UczxYqqiJq7Abcv8mP2YXVbgufOnhg3KThtYsLfNFGnwOfzIsSjDe8XloO+OCzWN6JiY0L/D5Yq9YW60ouTcOinFKO7oRMUeGHy2geBtI7H/3dhLswTJDO0/nAD6Nlu/sm+wL1JgukQ5Y5HJGGEqmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NVC4BJSg; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NVC4BJSg"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MN19R032342;
	Tue, 3 Jun 2025 23:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ynYPe
	KlKONZVtL6WidNA+27i1VPQsBZGopRVJY9HXyw=; b=NVC4BJSgJOBQAmPfVBoBj
	C3NqM6cC6eBe/XqlDt3MLck504jRCWz4t3OQgwTEDYTb4jQemcRCJTtxKqZhrcIs
	vBwN1VoJw5eVjHG7AECgXkPU5FlaNnKKP3SU/NPLBOpCuSU8ctnNWvJvHqrp3TpX
	ZvVlasOyB7xKaPfzpOOitABGNqpMMdTvxe8OH9YLCQ+llhPcm3K15YXqU7KTPWmf
	w3tlIBEmQXD9PTOXEKV7kmv3B4KpqpV7ADdS1Wtw2CeENlXIjyBN4LZhUNjkkUqV
	yly1zIiJFI0jEezHXF41QAxkKP5qvW6j2deQYfZwMn2hkWSM74Qq5WksScIEc6ae
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dty38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 23:36:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553MtHqu030803;
	Tue, 3 Jun 2025 23:36:56 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a2j93-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 03 Jun 2025 23:36:56 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V5 2/6] Sched: Indicate if thread got rescheduled
Date: Tue,  3 Jun 2025 23:36:50 +0000
Message-ID: <20250603233654.1838967-3-prakash.sangappa@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=683f8719 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=O1hS_E6ypt93dt2FiYsA:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDIwMiBTYWx0ZWRfX2OeChnao1J7Y VA7ijZpMxXHofJ8z7l5qAoen+idFpwK9w13iUCrjaUClADxQVRiGwxegtqQvoWXQxVHXKyMdnDJ MpmxV5TV2MPEFFCETS/7VnnENk/H3lbPnhdatihZuulXSxx/b6hwokAZPHkei1Ee4UptRAWnAH9
 QOg6ZBWTsGlUjqYLpW4cIMhLGZxtK6qzD0s7SBoy3vwsuCGqdGMkBCpSdYRJsiVfOwBt45vzP1E /aqgynEqHt87XbH1fTNF1vFV4uRPvavWikCHS7lESjAsArMwvMTCRct0Eta05UwLKRaFi+SmS4J XfDK1qOxPH+wy5uaVoNj38ahZ5NB+DOv0KlLdPPnONomNVRcxYefh3b20L/1dsAANNUjg1/vUKY
 SUnyQOLvyQlM3iAZ7CAxfgogQcVsNkiWnlq/3vIV4BRT7s0hUyzbQow0Tv8fROTNpUX5KXb2
X-Proofpoint-ORIG-GUID: r_boophj7bVoufLM6475I_WTgPWaZ3zu
X-Proofpoint-GUID: r_boophj7bVoufLM6475I_WTgPWaZ3zu

Use a bit in rseq flags to indicate if the thread got rescheduled
after the cpu time extension was graned. The user thread can check this
flag before calling sched_yield() to yield the cpu.

Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/linux/sched.h     |  2 ++
 include/uapi/linux/rseq.h | 10 ++++++++++
 kernel/rseq.c             | 20 ++++++++++++++++++++
 kernel/sched/core.c       |  3 +--
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 14bf0508bfca..71e6c8221c1e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2256,12 +2256,14 @@ unsigned long sched_cpu_util(int cpu);
 extern bool rseq_delay_resched(void);
 extern void rseq_delay_resched_fini(void);
 extern void rseq_delay_resched_tick(void);
+extern void rseq_delay_schedule(void);
 
 #else
 
 static inline bool rseq_delay_resched(void) { return false; }
 static inline void rseq_delay_resched_fini(void) { }
 static inline void rseq_delay_resched_tick(void) { }
+static inline void rseq_delay_schedule(void) { }
 
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
index dba44ca9f624..9355654e9b38 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -504,6 +504,26 @@ void rseq_delay_resched_tick(void)
 #endif
 }
 
+void rseq_delay_schedule(void)
+{
+#ifdef CONFIG_SCHED_HRTICK
+	struct task_struct *t = current;
+	u32 flags;
+
+	if (t->sched_time_delay) {
+		t->sched_time_delay = 0;
+		if (!t->rseq)
+			return;
+		if (copy_from_user_nofault(&flags, &t->rseq->flags,
+                        sizeof(flags)))
+                        return;
+                flags |= RSEQ_CS_FLAG_RESCHEDULED;
+                copy_to_user_nofault(&t->rseq->flags, &flags,
+                        sizeof(flags));
+	}
+#endif
+}
+
 #ifdef CONFIG_DEBUG_RSEQ
 
 /*
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8c8960245ec0..86583fb72914 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6734,8 +6734,7 @@ static void __sched notrace __schedule(int sched_mode)
 picked:
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();
-	if (IS_ENABLED(CONFIG_RSEQ))
-		prev->sched_time_delay = 0;
+	rseq_delay_schedule();
 	rq->last_seen_need_resched_ns = 0;
 
 	is_switch = prev != next;
-- 
2.43.5

