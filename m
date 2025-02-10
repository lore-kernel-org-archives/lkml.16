Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657125E443
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213093; cv=none; b=DXvBYr1Wq7A8sCpcj365PfJolio4qwb0OxSQ+d2VL5NzLj4xs2RTrl/iNnNgJ7TBu5xWQTGjGcB8flBKeDrp/c4lHW8UQwlkGyS37GZeg7bVbNrDwZYe6M++bK5xoD5FgYQ2QLDrd2GlozQnt1maDHxgEMhhTuDIFk36nnzrHcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213093; c=relaxed/simple;
	bh=fwq+aqi0Lf9jOwOz9WT1izBtQX3ni6hDp1X9GQZ8YQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dka8LPx5S59dvMyUCF18QkFF+esMo/2KOMPiWAe2x2hUE1INrsU/Cl2/esOmTP87Z+yr4e8AtZzNtgK0ACTEVhkDdUIbVS+pPwnI6pDxanG1OO7QkHbDnMYe4EKt0xyPGhJNX42Q9XF5CplohuKQ/5ihPLuZ8e3RB6AUCSFOcbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UAdqTl0Z; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UAdqTl0Z"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AFdQOw028739;
	Mon, 10 Feb 2025 18:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=es/ytR4y0uhj6XH+r
	ax5y+ZKeNITu9jewdwz1Fp0w9Y=; b=UAdqTl0Z09eAUmxSPynyNHLLm777/8eO9
	kiUb47SVJ+P49KlpLDlRtdg2J4UM09JoQ4nNIVzjDo07BksD4k8ERVsiW57wOBp7
	uwfvazBVjik1rjGqqSLr3Ce9hcyea0K1hLZyenbqEX+FxxStGClVnwUcR3SoVihY
	gqYrpf1vMxMMf7O9F+XKCVZjnD5Km7JErvRfz7xpv5XZgoHxnxJELqR4fl6QYf32
	CvHQDuivcMVZWlbBRqZe9p5gp9WXQjejOMaziOlpWkAqp5yKhFWW6RzwZHl4VuYH
	qmWx2wmcLYgqZ9XejbobWgEz3WoC64KvbOkaUqsWLvwJ5rNS/OFbw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44qm9tgxv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 18:44:27 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51AIiQI4024067;
	Mon, 10 Feb 2025 18:44:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44qm9tgxv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 18:44:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AFq96o001051;
	Mon, 10 Feb 2025 18:44:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pjkmyrak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 18:44:25 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51AIiLKE35652260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 18:44:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2B9120043;
	Mon, 10 Feb 2025 18:44:21 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BED5620040;
	Mon, 10 Feb 2025 18:44:19 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.21.225])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Feb 2025 18:44:19 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        christophe.leroy@csgroup.eu
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        bigeasy@linutronix.de, will@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] powerpc: enable dynamic preemption
Date: Tue, 11 Feb 2025 00:13:34 +0530
Message-ID: <20250210184334.567383-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250210184334.567383-1-sshegde@linux.ibm.com>
References: <20250210184334.567383-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iIMnPBp5X1NCCjhrT4KnZ8dHCfELt2_W
X-Proofpoint-ORIG-GUID: rnMB2gwvS1vmqrKMDNXHmGBtR3DlZvi6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100149

Once the lazy preemption is supported, it would be desirable to change
the preemption models at runtime. So add support for dynamic preemption
using DYNAMIC_KEY.

::Tested lightly on Power10 LPAR
Performance numbers indicate that, preempt=none(no dynamic) and
preempt=none(dynamic) are close.

cat /sys/kernel/debug/sched/preempt
(none) voluntary full lazy
perf stat -e probe:__cond_resched -a sleep 1
 Performance counter stats for 'system wide':
             1,253      probe:__cond_resched

echo full > /sys/kernel/debug/sched/preempt
cat /sys/kernel/debug/sched/preempt
none voluntary (full) lazy
perf stat -e probe:__cond_resched -a sleep 1
 Performance counter stats for 'system wide':
                 0      probe:__cond_resched

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/preempt.h | 16 ++++++++++++++++
 arch/powerpc/kernel/interrupt.c    |  6 +++++-
 arch/powerpc/lib/vmx-helper.c      |  2 +-
 4 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/asm/preempt.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 424f188e62d9..364edaea1f88 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -275,6 +275,7 @@ config PPC
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_PREEMPT_DYNAMIC_KEY
 	select HAVE_RETHOOK			if KPROBES
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
new file mode 100644
index 000000000000..000e2b9681f3
--- /dev/null
+++ b/arch/powerpc/include/asm/preempt.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_POWERPC_PREEMPT_H
+#define __ASM_POWERPC_PREEMPT_H
+
+#include <asm-generic/preempt.h>
+
+#if defined(CONFIG_PREEMPT_DYNAMIC)
+#include <linux/jump_label.h>
+DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+#define need_irq_preemption() \
+	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
+#else
+#define need_irq_preemption()   (IS_ENABLED(CONFIG_PREEMPTION))
+#endif
+
+#endif /* __ASM_POWERPC_PREEMPT_H */
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 8f4acc55407b..e0c681d0b076 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -25,6 +25,10 @@
 unsigned long global_dbcr0[NR_CPUS];
 #endif
 
+#if defined(CONFIG_PREEMPT_DYNAMIC)
+DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
 static inline bool exit_must_hard_disable(void)
@@ -396,7 +400,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
-		if (IS_ENABLED(CONFIG_PREEMPTION)) {
+		if (need_irq_preemption()) {
 			/* Return to preemptible kernel context */
 			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
 				if (preempt_count() == 0)
diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
index 58ed6bd613a6..54340912398f 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -45,7 +45,7 @@ int exit_vmx_usercopy(void)
 	 * set and we are preemptible. The hack here is to schedule a
 	 * decrementer to fire here and reschedule for us if necessary.
 	 */
-	if (IS_ENABLED(CONFIG_PREEMPTION) && need_resched())
+	if (need_irq_preemption() && need_resched())
 		set_dec(1);
 	return 0;
 }
-- 
2.39.3

