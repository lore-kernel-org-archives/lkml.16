Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827637DA9C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141364; cv=none; b=WALn9Gx/FDp/KJlHFMdyp5C2s/vjDLruTz72ye9S/sh+iGrudugWsQwStgPU+UyM07oUPPlw6MUYeTNfSvA7SA89EE2VmnInw1snIHT1M8XWlK9Waij8GuD0eRpTXUVTjfzcfr9/EWUix0mXMGaSKO121JuXoU2eNE6UuFtSHgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141364; c=relaxed/simple;
	bh=tUXIhZbF7H9VbMC/6Rr6SYm8b2PsrGPNeClDtMBzUMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avX4QWnPriGRQ/+5DsQW64gN3qO8NSHj00EsgwloBxdKPyQOPx17NTpsKw3yh93bxSEsCn3txCRz6VWWLkK1cubIaMEK8ZBQ/fcY7dKs9nsKaWofeLo+79HzOELb1E0dRXhWCclhKPJJ+ikN7gC7/2EZYqghqLYSWKOO17guQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=QO2d/FP7; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="QO2d/FP7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=d0GaS7yOnMLWrg4UsPm7aK0LJLyPCA8rrRBXUPtjrSg=; b=QO2d/FP7YU/UtaWbMr4zEEzKZX
	k+sy01hroVzxv6hrVfMRxcPuuWwGx7gYF0yTNdpZ6YcW5HQnZlNO2fR9Q0Cr0og0TgRtPsXEP6nPV
	rrQRna6TVzkBMYmafmzU6/AiqbB+6KKwZ8+9adI9fARwaRa8lTuNXe7P+nqHtlJiauRcaM/Bv/hxh
	8PQ3x+nQsvPmJ1ojhD1sM1+3sQG+Ji5nUUlsh7wDDEDEuv35POExsqyqq8SbrdSxFXfqEQPKkI+FF
	iDXbFxr7AQ0KSMOwKT2hHFpiTZs0p+RNnuJ6MA7o1XnNLe3P71X5lqFeyvXZUDYp2oo0T+qhShWHL
	wFXq2KsA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNDZC-000000002qg-3ZIq;
	Thu, 05 Jun 2025 12:35:46 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v3 5/7] x86/mm: Introduce Remote Action Request
Date: Thu,  5 Jun 2025 12:35:14 -0400
Message-ID: <20250605163544.3852565-6-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605163544.3852565-1-riel@surriel.com>
References: <20250605163544.3852565-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yu-cheng Yu <yu-cheng.yu@intel.com>

Remote Action Request (RAR) is a TLB flushing broadcast facility.
To start a TLB flush, the initiator CPU creates a RAR payload and
sends a command to the APIC.  The receiving CPUs automatically flush
TLBs as specified in the payload without the kernel's involement.

[ riel: add pcid parameter to smp_call_rar_many so other mms can be flushed ]

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/include/asm/rar.h   |  69 +++++++++++
 arch/x86/kernel/cpu/common.c |   4 +
 arch/x86/mm/Makefile         |   1 +
 arch/x86/mm/rar.c            | 217 +++++++++++++++++++++++++++++++++++
 4 files changed, 291 insertions(+)
 create mode 100644 arch/x86/include/asm/rar.h
 create mode 100644 arch/x86/mm/rar.c

diff --git a/arch/x86/include/asm/rar.h b/arch/x86/include/asm/rar.h
new file mode 100644
index 000000000000..78c039e40e81
--- /dev/null
+++ b/arch/x86/include/asm/rar.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_RAR_H
+#define _ASM_X86_RAR_H
+
+/*
+ * RAR payload types
+ */
+#define RAR_TYPE_INVPG		0
+#define RAR_TYPE_INVPG_NO_CR3	1
+#define RAR_TYPE_INVPCID	2
+#define RAR_TYPE_INVEPT		3
+#define RAR_TYPE_INVVPID	4
+#define RAR_TYPE_WRMSR		5
+
+/*
+ * Subtypes for RAR_TYPE_INVLPG
+ */
+#define RAR_INVPG_ADDR			0 /* address specific */
+#define RAR_INVPG_ALL			2 /* all, include global */
+#define RAR_INVPG_ALL_NO_GLOBAL		3 /* all, exclude global */
+
+/*
+ * Subtypes for RAR_TYPE_INVPCID
+ */
+#define RAR_INVPCID_ADDR		0 /* address specific */
+#define RAR_INVPCID_PCID		1 /* all of PCID */
+#define RAR_INVPCID_ALL			2 /* all, include global */
+#define RAR_INVPCID_ALL_NO_GLOBAL	3 /* all, exclude global */
+
+/*
+ * Page size for RAR_TYPE_INVLPG
+ */
+#define RAR_INVLPG_PAGE_SIZE_4K		0
+#define RAR_INVLPG_PAGE_SIZE_2M		1
+#define RAR_INVLPG_PAGE_SIZE_1G		2
+
+/*
+ * Max number of pages per payload
+ */
+#define RAR_INVLPG_MAX_PAGES 63
+
+struct rar_payload {
+	u64 for_sw		: 8;
+	u64 type		: 8;
+	u64 must_be_zero_1	: 16;
+	u64 subtype		: 3;
+	u64 page_size		: 2;
+	u64 num_pages		: 6;
+	u64 must_be_zero_2	: 21;
+
+	u64 must_be_zero_3;
+
+	/*
+	 * Starting address
+	 */
+	u64 initiator_cr3;
+	u64 linear_address;
+
+	/*
+	 * Padding
+	 */
+	u64 padding[4];
+};
+
+void rar_cpu_init(void);
+void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
+		       unsigned long start, unsigned long end);
+
+#endif /* _ASM_X86_RAR_H */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 8feb8fd2957a..d68a0a9b2aa2 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -71,6 +71,7 @@
 #include <asm/tdx.h>
 #include <asm/posted_intr.h>
 #include <asm/runtime-const.h>
+#include <asm/rar.h>
 
 #include "cpu.h"
 
@@ -2425,6 +2426,9 @@ void cpu_init(void)
 	if (is_uv_system())
 		uv_cpu_init();
 
+	if (cpu_feature_enabled(X86_FEATURE_RAR))
+		rar_cpu_init();
+
 	load_fixmap_gdt(cpu);
 }
 
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 5b9908f13dcf..f36fc99e8b10 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_ACPI_NUMA)		+= srat.o
 obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)	+= pkeys.o
 obj-$(CONFIG_RANDOMIZE_MEMORY)			+= kaslr.o
 obj-$(CONFIG_MITIGATION_PAGE_TABLE_ISOLATION)	+= pti.o
+obj-$(CONFIG_BROADCAST_TLB_FLUSH)		+= rar.o
 
 obj-$(CONFIG_X86_MEM_ENCRYPT)	+= mem_encrypt.o
 obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= mem_encrypt_amd.o
diff --git a/arch/x86/mm/rar.c b/arch/x86/mm/rar.c
new file mode 100644
index 000000000000..f63e68b412de
--- /dev/null
+++ b/arch/x86/mm/rar.c
@@ -0,0 +1,217 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RAR TLB shootdown
+ */
+#include <linux/sched.h>
+#include <linux/bug.h>
+#include <asm/current.h>
+#include <asm/io.h>
+#include <asm/sync_bitops.h>
+#include <asm/rar.h>
+#include <asm/tlbflush.h>
+
+static DEFINE_PER_CPU(struct cpumask, rar_cpu_mask);
+
+#define RAR_ACTION_SUCCESS	0x00
+#define RAR_ACTION_PENDING	0x01
+#define RAR_ACTION_FAILURE	0x80
+
+#define RAR_MAX_PAYLOADS 64UL
+
+/* How many RAR payloads are supported by this CPU */
+static int rar_max_payloads = RAR_MAX_PAYLOADS;
+
+/* Bitmap describing which RAR payload slots are in use. */
+static unsigned long rar_in_use = ~(RAR_MAX_PAYLOADS - 1);
+
+/*
+ * RAR payloads telling CPUs what to do. This table is shared between
+ * all CPUs; it is possible to have multiple payload tables shared between
+ * different subsets of CPUs, but that adds a lot of complexity.
+ */
+static struct rar_payload rar_payload[RAR_MAX_PAYLOADS] __page_aligned_bss;
+
+/*
+ * The action vector tells each CPU which payload table entries
+ * have work for that CPU.
+ */
+static DEFINE_PER_CPU_ALIGNED(u8[RAR_MAX_PAYLOADS], rar_action);
+
+static unsigned long get_payload_slot(void)
+{
+	while (1) {
+		unsigned long bit;
+
+		/*
+		 * Find a free bit and confirm it with test_and_set_bit()
+		 * below. If no slot is free, spin until one becomes free.
+		 */
+		bit = ffz(READ_ONCE(rar_in_use));
+
+		if (bit >= rar_max_payloads)
+			continue;
+
+		if (!test_and_set_bit((long)bit, &rar_in_use))
+			return bit;
+	}
+}
+
+static void free_payload_slot(unsigned long payload_nr)
+{
+	clear_bit(payload_nr, &rar_in_use);
+}
+
+static void set_payload(struct rar_payload *p, u16 pcid, unsigned long start,
+			uint32_t pages)
+{
+	p->must_be_zero_1	= 0;
+	p->must_be_zero_2	= 0;
+	p->must_be_zero_3	= 0;
+	p->page_size		= RAR_INVLPG_PAGE_SIZE_4K;
+	p->type			= RAR_TYPE_INVPCID;
+	p->num_pages		= pages;
+	p->initiator_cr3	= pcid;
+	p->linear_address	= start;
+
+	if (pcid) {
+		/* RAR invalidation of the mapping of a specific process. */
+		if (pages >= RAR_INVLPG_MAX_PAGES)
+			p->subtype = RAR_INVPCID_PCID;
+		else
+			p->subtype = RAR_INVPCID_ADDR;
+	} else {
+		/*
+		 * Unfortunately RAR_INVPCID_ADDR excludes global translations.
+		 * Always do a full flush for kernel invalidations.
+		 */
+		p->subtype = RAR_INVPCID_ALL;
+	}
+
+	/* Ensure all writes are visible before the action entry is set. */
+	smp_wmb();
+}
+
+static void set_action_entry(unsigned long payload_nr, int target_cpu)
+{
+	u8 *bitmap = per_cpu(rar_action, target_cpu);
+
+	/*
+	 * Given a remote CPU, "arm" its action vector to ensure it handles
+	 * the request at payload_nr when it receives a RAR signal.
+	 * The remote CPU will overwrite RAR_ACTION_PENDING when it handles
+	 * the request.
+	 */
+	WRITE_ONCE(bitmap[payload_nr], RAR_ACTION_PENDING);
+}
+
+static void wait_for_action_done(unsigned long payload_nr, int target_cpu)
+{
+	u8 status;
+	u8 *rar_actions = per_cpu(rar_action, target_cpu);
+
+	status = READ_ONCE(rar_actions[payload_nr]);
+
+	while (status == RAR_ACTION_PENDING) {
+		cpu_relax();
+		status = READ_ONCE(rar_actions[payload_nr]);
+	}
+
+	WARN_ON_ONCE(rar_actions[payload_nr] != RAR_ACTION_SUCCESS);
+}
+
+void rar_cpu_init(void)
+{
+	u64 r;
+	u8 *bitmap;
+	int max_payloads;
+	int this_cpu = smp_processor_id();
+
+	cpumask_clear(&per_cpu(rar_cpu_mask, this_cpu));
+
+	/* The MSR contains N defining the max [0-N] rar payload slots. */
+	rdmsrl(MSR_IA32_RAR_INFO, r);
+	max_payloads = (r >> 32) + 1;
+
+	/* If this CPU supports less than RAR_MAX_PAYLOADS, lower our limit. */
+	if (max_payloads < rar_max_payloads)
+		rar_max_payloads = max_payloads;
+	pr_info_once("RAR: support %d payloads\n", max_payloads);
+
+	bitmap = (u8 *)per_cpu(rar_action, this_cpu);
+	memset(bitmap, 0, RAR_MAX_PAYLOADS);
+	wrmsrl(MSR_IA32_RAR_ACT_VEC, (u64)virt_to_phys(bitmap));
+	wrmsrl(MSR_IA32_RAR_PAYLOAD_BASE, (u64)virt_to_phys(rar_payload));
+
+	/*
+	 * Allow RAR events to be processed while interrupts are disabled on
+	 * a target CPU. This prevents "pileups" where many CPUs are waiting
+	 * on one CPU that has IRQs blocked for too long, and should reduce
+	 * contention on the rar_payload table.
+	 */
+	r = RAR_CTRL_ENABLE | RAR_CTRL_IGNORE_IF;
+	wrmsrl(MSR_IA32_RAR_CTRL, r);
+}
+
+/*
+ * Inspired by smp_call_function_many(), but RAR requires a global payload
+ * table rather than per-CPU payloads in the CSD table, because the action
+ * handler is microcode rather than software.
+ */
+void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
+		       unsigned long start, unsigned long end)
+{
+	unsigned long pages = (end - start + PAGE_SIZE) / PAGE_SIZE;
+	int cpu, this_cpu = smp_processor_id();
+	cpumask_t *dest_mask;
+	unsigned long payload_nr;
+
+	if (pages > RAR_INVLPG_MAX_PAGES || end == TLB_FLUSH_ALL)
+		pages = RAR_INVLPG_MAX_PAGES;
+
+	/*
+	 * Can deadlock when called with interrupts disabled.
+	 * Allow CPUs that are not yet online though, as no one else can
+	 * send smp call function interrupt to this CPU and as such deadlocks
+	 * can't happen.
+	 */
+	if (cpu_online(this_cpu) && !oops_in_progress && !early_boot_irqs_disabled) {
+		lockdep_assert_irqs_enabled();
+		lockdep_assert_preemption_disabled();
+	}
+
+	/*
+	 * A CPU needs to be initialized in order to process RARs.
+	 * Skip offline CPUs.
+	 *
+	 * TODO:
+	 * - Use RAR to flush our own TLB so it can all happen in parallel
+	 *   (need to resolve a chicken-egg issue with the boot CPU)
+	 * - Skip RAR to CPUs that are in a deeper C-state, with an empty TLB
+	 *
+	 * This code cannot use the should_flush_tlb() logic here because
+	 * RAR flushes do not update the tlb_gen, resulting in unnecessary
+	 * flushes at context switch time.
+	 */
+	dest_mask = this_cpu_ptr(&rar_cpu_mask);
+	cpumask_and(dest_mask, mask, cpu_online_mask);
+	__cpumask_clear_cpu(this_cpu, dest_mask);
+
+	/* Some callers race with other CPUs changing the passed mask */
+	if (unlikely(!cpumask_weight(dest_mask)))
+		return;
+
+	payload_nr = get_payload_slot();
+	set_payload(&rar_payload[payload_nr], pcid, start, pages);
+
+	for_each_cpu(cpu, dest_mask)
+		set_action_entry(payload_nr, cpu);
+
+	/* Send a message to all CPUs in the map */
+	native_send_rar_ipi(dest_mask);
+
+	for_each_cpu(cpu, dest_mask)
+		wait_for_action_done(payload_nr, cpu);
+
+	free_payload_slot(payload_nr);
+}
+EXPORT_SYMBOL(smp_call_rar_many);
-- 
2.49.0

