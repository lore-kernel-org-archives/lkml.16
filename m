Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3E11EB1B5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172795; cv=none; b=YKEcBplCV1mDjOMW3Vj2R1kXwV6dZ2naMRlPDJhgV2JMOFB2fhkg+L2Hpwa+2nUarlwXhT6z/W1BtGmQKQ1PxfIG+XDwA+mfhbOCmQ5AlyNgd3AFxuwxTy9AwxVZq6NLfVcISKx7j4BK2OQliwfB5AmcbaGc+IUc6sp31y6jEik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172795; c=relaxed/simple;
	bh=Hvp3nU+HjLeWs761iA7FXQjwIa2uP2Ctm8FYDl4ullI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSzTzXW3nbeUhpye+RugxSf+8xhjrsZpiDba2L5Ht22FtLdnhZpGO1JsFlt1HrlOdTkSu/HXGOcqxXBpPsY4Y5k6q4nlxWQtcV94QAVUO4PdtV1Zg5H15gg1UmnF/nNKH6xWCmOoejkCJqIbJ9oj5sAOGzMb5mUAzw5nS2Vqsq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WVJGRlxK; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WVJGRlxK"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DL0lIf021616;
	Tue, 13 May 2025 21:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ynYPe
	KlKONZVtL6WidNA+27i1VPQsBZGopRVJY9HXyw=; b=WVJGRlxKbdSDskKRYipXs
	Bi/lZ+Bn8bYGfuQlBm4j5d+3RpO+pbTJgvwhcNME9Ujy4/lchOh0nDOxsD2UObLK
	/hN7wyBwzsCCJGODoyThH5kqQn7gELAOgSntLameMRX1E2g/67umyU60FzGJr3gR
	b2b5851yY0N71oh5YLnoHlvwnP7q1XrQjPofajZeX1YkQxu6gsDw1YEq28s7Hp5X
	P3i72yhYrxDvbdjEEsA+GSrFRKFR9I3D4JJFWKViRZuP/kRuEBkZc60bHqpxkA+w
	2pZpeCrZBY1sQGvAS7sWozFuUteWm7mH2A/4k4vdxKdLkRQYjODEFTdNZX+OMfnt
	g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcmgat0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 21:46:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DLQjeN001890;
	Tue, 13 May 2025 21:45:59 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mc4yv943-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 13 May 2025 21:45:59 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V4 2/6] Sched: Indicate if thread got rescheduled
Date: Tue, 13 May 2025 21:45:50 +0000
Message-ID: <20250513214554.4160454-3-prakash.sangappa@oracle.com>
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
X-Proofpoint-ORIG-GUID: HVbylk16ERiHEGxsuCkMG3AF2jRQuj0K
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=6823bd98 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=O1hS_E6ypt93dt2FiYsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIwNSBTYWx0ZWRfX+L7MOWJvFTgK Htfz7MD9r/885+fud1RFh4atJaju49pihhNj+HrUB44zryHCYuEo9UseF9/YZp6NpydMpHXkxxL HR8+fHNs1mnxb3+WRkezzP8hrTq2sh2966ACTUAitchHrGmwaL+/R6adn1hURhnK+QSNDVwkbjq
 S9rUubaENnAYLmPTjMLeDx0h+9pw2mED/oiMQIe5QVBC+t2Wc4q+K240I4D5tHkH7ADp02arguR SMdxDGCgJ6JbIU1Wdr/NX0v7DWM3mdBVMMmxIosQvUcKFx46Fj5bPbeqNuutZ+fdw3Vdc4qcqMh +YgIh2KkYgg83dUeqmjnyInE13u4U6bpK/CLlp6dh2TnoLXwsLmEFnurY0PzKgenur0U+aH7Ugt
 8Xism+J1TVp81X04tBBcK4TAiwekiH4kiRlJzau6oDINvLSw0k6cyRLmCFoAd3Hd6PsrC9mr
X-Proofpoint-GUID: HVbylk16ERiHEGxsuCkMG3AF2jRQuj0K

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

