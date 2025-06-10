Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8F7259C87
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542065; cv=none; b=MeNoClrFPZVItDsX9yUmin5rkOkIL3Buh3gv2QIGGj0zMgdPlh6C3w0WOKUb+DERuJk4oCOQcAtyPOarp6FYtrxPb3bDVo7ECIs3S2N5dmvvaXhK+xF1eFx0J9j/PwvP4GKHWzfjLKUqOZNmvSAdkgtlQdriecfY9xXxVBA6itk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542065; c=relaxed/simple;
	bh=sp1+zD9TdD3ICMmYp5fjNv1ArJBdfDxcamYPKlYZStQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bW8hAzbktgA/KxxjSCLvtf5d/z2/n4n2zPdTS7nJE2MzRTtD/m1f1ehzOYcyeA7aMOQ2OR4xSHWpxv/44DvQr7aJnqi4bOGnLY3z5xnt7ACK+GcCTZV+8PmAJ7l3PimmdBx94JXm4gse9gkgYqmo0U55ixMgefs+hf2tvgFimGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=JBFSX/eE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="JBFSX/eE"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A1CDxh012194;
	Tue, 10 Jun 2025 07:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=jIdIqfPxfB9RaiJq5
	FixOtoy9prE4pZuS5ykL++HHGk=; b=JBFSX/eEHpLGknbEIpzwVhcjCwYoY80sx
	a5QPvk5IglUaWcIc6/nKB+G29Nc/1NLYqiSe+Vu/kS/SezvYWwP0evAQJFIaFxS+
	/EbxKBZVc1x+xwNagt6EWDZeDwCQCixhvKY3Wf865Bf1aJBiw+BwWf1S890+bosT
	UBKQr9IWWVmnBPOVWCTuqZOWromXBxiT3xRYjY6C877YP3/DqmR0FuWDVgLQWN3m
	sgEUZobPZZ3b0H48js83vGHTKjg5GrESMCeYkREzVEgRG1tVxrUNUQglb9LhJykJ
	ULR028kClbJlkbo+aj2ZGMngF6P/iatiaRuKikD96oQR/EVTL1ekQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguc1wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 07:54:01 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55A70uDs019602;
	Tue, 10 Jun 2025 07:54:01 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4752f29290-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 07:54:01 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55A7rvK749152344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 07:53:57 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C5EE2004B;
	Tue, 10 Jun 2025 07:53:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2D6B20049;
	Tue, 10 Jun 2025 07:53:53 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.27.113])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 07:53:53 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, tglx@linutronix.de, bigeasy@linutronix.de,
        vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
        linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com
Subject: [PATCH 1/1] sched: preempt: Move dynamic keys into kernel/sched
Date: Tue, 10 Jun 2025 13:23:44 +0530
Message-ID: <20250610075344.1379597-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250610075344.1379597-1-sshegde@linux.ibm.com>
References: <20250610075344.1379597-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Pfr/hjhd c=1 sm=1 tr=0 ts=6847e499 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=7d-BAE35GrDzMBwietEA:9
X-Proofpoint-GUID: IveRM9t9mxxaNk6Gm2klbID7YdkgzzAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA1OCBTYWx0ZWRfX/QMpB2fnmmSR p9wT5/oMz1zqRKMcVIUUKcSEyPDAlMJINlQpk48teSaHh5ql741av8gQI4VSlu0o7qu/Yjou399 RK+DzAxKu1IooaR0a67wTVcME4W8PAMGi9bd7nM56OcxRuDS5XaR/UtJeqX1JArPwRygxvaE07f
 I8U6gUroVCkttzQrWawN6yEb6My53JfnLnyqwSFzlousxv8qKBnvOryFaVPe0haxDWnH9OKSI38 3WdibMBY2DuWFMwEDAKNOuwexIAkEAWaUSIjUdXYe5t7BsWXD2rZEA+8tMdz5HL//aE083qGEjj RPLcsMFT0rGbL151GUXLUpu1K2RybzZ3h7Ox7M7SuLfz5leZ2swJCJ2R4/zg1s7Yh3BM9h2/Hzs
 iuf1ZMR/vMpBvkZSmdoLt9paWyD7yB7CW6pJi1yNdjdugcWU75feNWd2SUtRhR172QElp0HC
X-Proofpoint-ORIG-GUID: IveRM9t9mxxaNk6Gm2klbID7YdkgzzAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100058

Dynamic preemption can be static key or static call based.
Static key is used to check kernel preemption depending on
the current preemption model. i.e enable for lazy, full. 

Code is spread currently across entry/common.c, arm64 and latest being
powerpc. There is little arch specific to it. For example, arm64,
powerpc does the same thing. It is better to move it into kernel/sched 
since preemption is more closely associated with scheduler.  

Plus, Any new arch that wants dynamic preemption enabled need to have 
only HAVE_PREEMPT_DYNAMIC_KEY. 

This is more of code movement. No functional change. 

Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/arm64/include/asm/preempt.h   |  1 -
 arch/arm64/kernel/entry-common.c   |  8 --------
 arch/powerpc/include/asm/preempt.h | 16 ----------------
 arch/powerpc/kernel/interrupt.c    |  4 ----
 include/linux/entry-common.h       |  1 -
 include/linux/sched.h              |  8 ++++++++
 kernel/entry/common.c              |  1 -
 kernel/sched/core.c                |  4 ++++
 8 files changed, 12 insertions(+), 31 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/preempt.h

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 0159b625cc7f..a9348e65d75e 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -87,7 +87,6 @@ void preempt_schedule_notrace(void);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 
-DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
 void dynamic_preempt_schedule(void);
 #define __preempt_schedule()		dynamic_preempt_schedule()
 void dynamic_preempt_schedule_notrace(void);
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index b260ddc4d3e9..b1c854fb4884 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -259,14 +259,6 @@ static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs)
 		lockdep_hardirqs_on(CALLER_ADDR0);
 }
 
-#ifdef CONFIG_PREEMPT_DYNAMIC
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-#define need_irq_preemption() \
-	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
-#else
-#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
-#endif
-
 static void __sched arm64_preempt_schedule_irq(void)
 {
 	if (!need_irq_preemption())
diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
deleted file mode 100644
index 000e2b9681f3..000000000000
--- a/arch/powerpc/include/asm/preempt.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_POWERPC_PREEMPT_H
-#define __ASM_POWERPC_PREEMPT_H
-
-#include <asm-generic/preempt.h>
-
-#if defined(CONFIG_PREEMPT_DYNAMIC)
-#include <linux/jump_label.h>
-DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-#define need_irq_preemption() \
-	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
-#else
-#define need_irq_preemption()   (IS_ENABLED(CONFIG_PREEMPTION))
-#endif
-
-#endif /* __ASM_POWERPC_PREEMPT_H */
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index e0c681d0b076..4d62d785ad26 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -25,10 +25,6 @@
 unsigned long global_dbcr0[NR_CPUS];
 #endif
 
-#if defined(CONFIG_PREEMPT_DYNAMIC)
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-#endif
-
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
 static inline bool exit_must_hard_disable(void)
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index f94f3fdf15fc..8624faa1f8b9 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -549,7 +549,6 @@ void raw_irqentry_exit_cond_resched(void);
 DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
 #define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
 void dynamic_irqentry_exit_cond_resched(void);
 #define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
 #endif
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 45e5953b8f32..ebd230382027 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2115,6 +2115,14 @@ static inline int _cond_resched(void)
 
 #endif /* !CONFIG_PREEMPTION || CONFIG_PREEMPT_DYNAMIC */
 
+#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+#define need_irq_preemption() \
+	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
+#else
+#define need_irq_preemption()   (IS_ENABLED(CONFIG_PREEMPTION))
+#endif
+
 #define cond_resched() ({			\
 	__might_resched(__FILE__, __LINE__, 0);	\
 	_cond_resched();			\
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index a8dd1f27417c..b8ffd7127338 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -268,7 +268,6 @@ void raw_irqentry_exit_cond_resched(void)
 #if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
 DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
 void dynamic_irqentry_exit_cond_resched(void)
 {
 	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 62b3416f5e43..6af2bab187cb 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7083,6 +7083,10 @@ EXPORT_SYMBOL(dynamic_preempt_schedule_notrace);
 
 #endif /* CONFIG_PREEMPTION */
 
+#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+#endif
+
 /*
  * This is the entry point to schedule() from kernel preemption
  * off of IRQ context.
-- 
2.43.0

