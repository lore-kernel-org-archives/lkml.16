Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26126C398
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745853850; cv=none; b=PuOgw7YVEf7i2gwXkVbpzviljW6xCezDKV0nurpvR34FuwR4p/+Y0v7XYCx+D0biyPciUhUiqtiPzIf1Xz0wjLuWJYzfH+0X++h0nmVl9Yrh0x1tGtAKobtqbSv3LFP5x27FhKVbpMZvH8+iFVXJmEFWZGJuNg7htIoWeUKH/Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745853850; c=relaxed/simple;
	bh=tU0kQjzdAeeNHMbzq58xxOYsH9yXHBshKhvf++x5gSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGImvUd/dX6ZLq94ef1KTZZl9ZvDFIFHzM1Z82Tt5JetILQuy+v71LnmZhrnN5iS6/Ne7l7JfXJOprQTYBdoDCjV2zQuo1O9u2rWAfxqQ7/B19NyCqin9e4t7+cbrSK37ATz4y4CN6yU42SDDNAxwQwDTRbfFugjCWJl+r4EBrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ekgcGIYI; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ekgcGIYI"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAee2o022814;
	Mon, 28 Apr 2025 15:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=G3vviyzZoJPlzkVRq
	zDxfPO64NMkELJCgK8bGue+90k=; b=ekgcGIYI7NGDFq1XMhUjgDfyiS6A1udlG
	iJXtCbWoVf9wV1oSw6gyYexYXvlaxdZjtxG6cO10/eIJjYXJuWku+fMPGf5Qtygz
	1meDMpQFbn8r2eBYSziAvOjt3V2GgH8R8jAI9EmFpZmlk6K8G9PUR1st0lUPmpiN
	HiMcv/WZ+RthYfT0Vdg3TG/lUrUeosPJDbHqBiYTel0RsNHM0gcOGZii7xtD7D4M
	itY9Q0KROF4XOevsaPqVW0DyjZglUp/Qqi3l1WNCOnJkOpukRlGxm1NYm1a7Jpg/
	2SpY+/0JXnry2nsMDxc09Y5V4kkfinWN/agZNNJc33gRJbZIMBjsw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a84s1c0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SFNkiM026978;
	Mon, 28 Apr 2025 15:23:46 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a84s1c08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:46 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SEq30G000749;
	Mon, 28 Apr 2025 15:23:45 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atp71nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:45 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SFNfVP20840810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 15:23:41 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BA9C20043;
	Mon, 28 Apr 2025 15:23:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4F3220040;
	Mon, 28 Apr 2025 15:23:34 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.30.54])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 15:23:34 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        neeraj.upadhyay@kernel.org, vschneid@redhat.com, tglx@linutronix.de,
        frederic@kernel.org, ankur.a.arora@oracle.com, sshegde@linux.ibm.com,
        bigeasy@linutronix.de, kees@kernel.org, oleg@redhat.com,
        peterz@infradead.org, tzimmermann@suse.de, namcao@linutronix.de,
        kan.liang@linux.intel.com, mcgrof@kernel.org, rppt@kernel.org,
        atrajeev@linux.vnet.ibm.com, anjalik@linux.ibm.com,
        coltonlewis@google.com, linuxppc-dev@lists.ozlabs.org,
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Subject: [RFC V1 3/6] powerpc: introduce arch_enter_from_user_mode
Date: Mon, 28 Apr 2025 20:52:24 +0530
Message-ID: <20250428152225.66044-6-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428152225.66044-2-mchauras@linux.ibm.com>
References: <20250428152225.66044-2-mchauras@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Mchsu4/f c=1 sm=1 tr=0 ts=680f9d82 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=lMC0XsYRYVtSgHH_D0QA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyNCBTYWx0ZWRfX8+2IiZ0zq6DQ Adcr4v7lMD8eOe7UzcN2V6K7MOscYBhimUvU/2XK50G2c5WR9i/wMY1sh1LfnwSy8va4s6Elp3o Ymud/t63ubi65G1Xkanrnhu5lrHpA0XvbaZ6adPJlVpuL7K1kIUIQF8av38KqHbPT/hlaFeYVwQ
 RgYdKPJfwyWGnufKul9sECNj3EHUGf2Yn5eQ6YlVo7oeUcLAlHj+KjHqQ1CvnLu7QYQDl4qLJtd 9ZOD/9A4g9HElBH7TDGgOwXH7qIj8hWWzZjEyinn36fX4TQbP3PnP6cJJrg4YW6ik0j/WXLzmsu aB2HH+uVsMiKKhVmId9GGmweuFJePuI5GTVsoytS8c3aCcUFDGoKT6ogwhvkeH4yRFf2QZiPvUs
 IRkQ5DyMaZOU4ZUFAdOMI+Nm5avkimSx71YObl9YwzdoZ01CWHnGc+YCniaADSprkalAHQ/n
X-Proofpoint-ORIG-GUID: UUzKhatvjhDxIVTSZmfZxohN2ZMQU932
X-Proofpoint-GUID: VSCoDYLsWnIlMOiO7Vrm5EZvhsQOmqWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280124

Introduce arch_enter_from_user_mode required by syscall entry.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 96 +++++++++++++++++++++++++
 arch/powerpc/include/asm/interrupt.h    | 23 ++++++
 arch/powerpc/kernel/interrupt.c         | 22 ------
 3 files changed, 119 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index e9e4220a1d225..804f6d019ec95 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -5,7 +5,103 @@
 
 #ifdef CONFIG_GENERIC_ENTRY
 
+#include <asm/cputime.h>
+#include <asm/interrupt.h>
 #include <asm/stacktrace.h>
+#include <asm/tm.h>
+
+static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
+{
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+
+	BUG_ON(regs_is_unrecoverable(regs));
+	BUG_ON(!user_mode(regs));
+	BUG_ON(regs_irqs_disabled(regs));
+
+#ifdef CONFIG_PPC_PKEY
+	if (mmu_has_feature(MMU_FTR_PKEY)) {
+		unsigned long amr, iamr;
+		bool flush_needed = false;
+		/*
+		 * When entering from userspace we mostly have the AMR/IAMR
+		 * different from kernel default values. Hence don't compare.
+		 */
+		amr = mfspr(SPRN_AMR);
+		iamr = mfspr(SPRN_IAMR);
+		regs->amr  = amr;
+		regs->iamr = iamr;
+		if (mmu_has_feature(MMU_FTR_KUAP)) {
+			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+			flush_needed = true;
+		}
+		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
+			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
+			flush_needed = true;
+		}
+		if (flush_needed)
+			isync();
+	} else
+#endif
+		kuap_assert_locked();
+
+	booke_restore_dbcr0();
+
+	account_cpu_user_entry();
+
+	account_stolen_time();
+
+	/*
+	 * This is not required for the syscall exit path, but makes the
+	 * stack frame look nicer. If this was initialised in the first stack
+	 * frame, or if the unwinder was taught the first stack frame always
+	 * returns to user with IRQS_ENABLED, this store could be avoided!
+	 */
+	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
+
+	/*
+	 * If system call is called with TM active, set _TIF_RESTOREALL to
+	 * prevent RFSCV being used to return to userspace, because POWER9
+	 * TM implementation has problems with this instruction returning to
+	 * transactional state. Final register values are not relevant because
+	 * the transaction will be aborted upon return anyway. Or in the case
+	 * of unsupported_scv SIGILL fault, the return state does not much
+	 * matter because it's an edge case.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+			unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
+		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
+
+	/*
+	 * If the system call was made with a transaction active, doom it and
+	 * return without performing the system call. Unless it was an
+	 * unsupported scv vector, in which case it's treated like an illegal
+	 * instruction.
+	 */
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
+	    !trap_is_unsupported_scv(regs)) {
+		/* Enable TM in the kernel, and disable EE (for scv) */
+		hard_irq_disable();
+		mtmsr(mfmsr() | MSR_TM);
+
+		/* tabort, this dooms the transaction, nothing else */
+		asm volatile(".long 0x7c00071d | ((%0) << 16)"
+				:: "r"(TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT));
+
+		/*
+		 * Userspace will never see the return value. Execution will
+		 * resume after the tbegin. of the aborted transaction with the
+		 * checkpointed register state. A context switch could occur
+		 * or signal delivered to the process before resuming the
+		 * doomed transaction context, but that should all be handled
+		 * as expected.
+		 */
+		return;
+	}
+#endif // CONFIG_PPC_TRANSACTIONAL_MEM
+}
+#define arch_enter_from_user_mode arch_enter_from_user_mode
 
 #endif /* CONFIG_GENERIC_ENTRY */
 #endif /* _ASM_PPC_ENTRY_COMMON_H */
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 56bc8113b8cde..6edf064a0fea2 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -138,6 +138,29 @@ static inline void nap_adjust_return(struct pt_regs *regs)
 #endif
 }
 
+static inline void booke_load_dbcr0(void)
+{
+#ifdef CONFIG_PPC_ADV_DEBUG_REGS
+       unsigned long dbcr0 = current->thread.debug.dbcr0;
+
+       if (likely(!(dbcr0 & DBCR0_IDM)))
+               return;
+
+       /*
+        * Check to see if the dbcr0 register is set up to debug.
+        * Use the internal debug mode bit to do this.
+        */
+       mtmsr(mfmsr() & ~MSR_DE);
+       if (IS_ENABLED(CONFIG_PPC32)) {
+               isync();
+               global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
+       }
+       mtspr(SPRN_DBCR0, dbcr0);
+       mtspr(SPRN_DBSR, -1);
+#endif
+}
+
+
 static inline void booke_restore_dbcr0(void)
 {
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index f656192f075fb..44afc65e0e0e0 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -74,28 +74,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 	return true;
 }
 
-static notrace void booke_load_dbcr0(void)
-{
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-	unsigned long dbcr0 = current->thread.debug.dbcr0;
-
-	if (likely(!(dbcr0 & DBCR0_IDM)))
-		return;
-
-	/*
-	 * Check to see if the dbcr0 register is set up to debug.
-	 * Use the internal debug mode bit to do this.
-	 */
-	mtmsr(mfmsr() & ~MSR_DE);
-	if (IS_ENABLED(CONFIG_PPC32)) {
-		isync();
-		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
-	}
-	mtspr(SPRN_DBCR0, dbcr0);
-	mtspr(SPRN_DBSR, -1);
-#endif
-}
-
 static notrace void check_return_regs_valid(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
-- 
2.49.0

