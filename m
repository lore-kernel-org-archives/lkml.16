Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E39B1D9A54
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747703058; cv=none; b=VFq7aJk9P6RhCCNowPCR6vtoHa9EYSGm0pZBUNU5qt2UNSTwLqSvMMybuBmgtOfk3MFb1gWmsSlzZgED5wFeGKCdJ54TSsQyYKfdRc+DiIDdXdV+Bxeh3xp1W4l8AvkA8sJZZo7DqCL48DZ5XThdifPjPZSJQJGizlSTgCo3pqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747703058; c=relaxed/simple;
	bh=5Rvkn2hH269ajlSSkiHddJB8MsDkB8k7A1C8M1wbv3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkZXpoH0tOmkgWcil9HjiflMJFqRkNR6pOEaI6UnWMB37QxgutoQLhpNy2U3QTwtC6AFVVDxQLsE+UctltTqmyhikvAcZGMEggjaijYodwMxYNyLLwzD/xZPqXE55JsXlOA7ge7AVnOkCBur8vnWeaBeQ8+bTInJPP2GZZwltmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHBOd-000000000aB-0Mtu;
	Mon, 19 May 2025 21:03:55 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	nadav.amit@gmail.com,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
Date: Mon, 19 May 2025 21:02:32 -0400
Message-ID: <20250520010350.1740223-8-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520010350.1740223-1-riel@surriel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

From: Yu-cheng Yu <yu-cheng.yu@intel.com>

Remote Action Request (RAR) is a TLB flushing broadcast facility.
To start a TLB flush, the initiator CPU creates a RAR payload and
sends a command to the APIC.  The receiving CPUs automatically flush
TLBs as specified in the payload without the kernel's involement.

[ riel: add pcid parameter to smp_call_rar_many so other mms can be flushed ]

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/include/asm/rar.h   |  69 +++++++++++++
 arch/x86/kernel/cpu/common.c |   4 +
 arch/x86/mm/Makefile         |   1 +
 arch/x86/mm/rar.c            | 195 +++++++++++++++++++++++++++++++++++
 4 files changed, 269 insertions(+)
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
index dd662c42f510..b1e1b9afb2ac 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -71,6 +71,7 @@
 #include <asm/tdx.h>
 #include <asm/posted_intr.h>
 #include <asm/runtime-const.h>
+#include <asm/rar.h>
 
 #include "cpu.h"
 
@@ -2438,6 +2439,9 @@ void cpu_init(void)
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
index 000000000000..16dc9b889cbd
--- /dev/null
+++ b/arch/x86/mm/rar.c
@@ -0,0 +1,195 @@
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
+#define RAR_ACTION_OK		0x00
+#define RAR_ACTION_START	0x01
+#define RAR_ACTION_ACKED	0x02
+#define RAR_ACTION_FAIL		0x80
+
+#define RAR_MAX_PAYLOADS 32UL
+
+static unsigned long rar_in_use = ~(RAR_MAX_PAYLOADS - 1);
+static struct rar_payload rar_payload[RAR_MAX_PAYLOADS] __page_aligned_bss;
+static DEFINE_PER_CPU_ALIGNED(u8[RAR_MAX_PAYLOADS], rar_action);
+
+static unsigned long get_payload(void)
+{
+	while (1) {
+		unsigned long bit;
+
+		/*
+		 * Find a free bit and confirm it with
+		 * test_and_set_bit() below.
+		 */
+		bit = ffz(READ_ONCE(rar_in_use));
+
+		if (bit >= RAR_MAX_PAYLOADS)
+			continue;
+
+		if (!test_and_set_bit((long)bit, &rar_in_use))
+			return bit;
+	}
+}
+
+static void free_payload(unsigned long idx)
+{
+	clear_bit(idx, &rar_in_use);
+}
+
+static void set_payload(unsigned long idx, u16 pcid, unsigned long start,
+			uint32_t pages)
+{
+	struct rar_payload *p = &rar_payload[idx];
+
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
+	smp_wmb();
+}
+
+static void set_action_entry(unsigned long idx, int target_cpu)
+{
+	u8 *bitmap = per_cpu(rar_action, target_cpu);
+
+	WRITE_ONCE(bitmap[idx], RAR_ACTION_START);
+}
+
+static void wait_for_done(unsigned long idx, int target_cpu)
+{
+	u8 status;
+	u8 *rar_actions = per_cpu(rar_action, target_cpu);
+
+	status = READ_ONCE(rar_actions[idx]);
+
+	while ((status != RAR_ACTION_OK) && (status != RAR_ACTION_FAIL)) {
+		cpu_relax();
+		status = READ_ONCE(rar_actions[idx]);
+	}
+
+	WARN_ON_ONCE(rar_actions[idx] == RAR_ACTION_FAIL);
+}
+
+void rar_cpu_init(void)
+{
+	u64 r;
+	u8 *bitmap;
+	int this_cpu = smp_processor_id();
+
+	cpumask_clear(&per_cpu(rar_cpu_mask, this_cpu));
+
+	rdmsrl(MSR_IA32_RAR_INFO, r);
+	pr_info_once("RAR: support %lld payloads\n", r >> 32);
+
+	bitmap = (u8 *)per_cpu(rar_action, this_cpu);
+	memset(bitmap, 0, RAR_MAX_PAYLOADS);
+	wrmsrl(MSR_IA32_RAR_ACT_VEC, (u64)virt_to_phys(bitmap));
+	wrmsrl(MSR_IA32_RAR_PAYLOAD_BASE, (u64)virt_to_phys(rar_payload));
+
+	r = RAR_CTRL_ENABLE | RAR_CTRL_IGNORE_IF;
+	// reserved bits!!! r |= (RAR_VECTOR & 0xff);
+	wrmsrl(MSR_IA32_RAR_CTRL, r);
+}
+
+/*
+ * This is a modified version of smp_call_function_many() of kernel/smp.c,
+ * without a function pointer, because the RAR handler is the ucode.
+ */
+void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
+		       unsigned long start, unsigned long end)
+{
+	unsigned long pages = (end - start + PAGE_SIZE) / PAGE_SIZE;
+	int cpu, next_cpu, this_cpu = smp_processor_id();
+	cpumask_t *dest_mask;
+	unsigned long idx;
+
+	if (pages > RAR_INVLPG_MAX_PAGES || end == TLB_FLUSH_ALL)
+		pages = RAR_INVLPG_MAX_PAGES;
+
+	/*
+	 * Can deadlock when called with interrupts disabled.
+	 * We allow cpu's that are not yet online though, as no one else can
+	 * send smp call function interrupt to this cpu and as such deadlocks
+	 * can't happen.
+	 */
+	WARN_ON_ONCE(cpu_online(this_cpu) && irqs_disabled()
+		     && !oops_in_progress && !early_boot_irqs_disabled);
+
+	/* Try to fastpath.  So, what's a CPU they want?  Ignoring this one. */
+	cpu = cpumask_first_and(mask, cpu_online_mask);
+	if (cpu == this_cpu)
+		cpu = cpumask_next_and(cpu, mask, cpu_online_mask);
+
+	/* No online cpus?  We're done. */
+	if (cpu >= nr_cpu_ids)
+		return;
+
+	/* Do we have another CPU which isn't us? */
+	next_cpu = cpumask_next_and(cpu, mask, cpu_online_mask);
+	if (next_cpu == this_cpu)
+		next_cpu = cpumask_next_and(next_cpu, mask, cpu_online_mask);
+
+	/* Fastpath: do that cpu by itself. */
+	if (next_cpu >= nr_cpu_ids) {
+		idx = get_payload();
+		set_payload(idx, pcid, start, pages);
+		set_action_entry(idx, cpu);
+		arch_send_rar_single_ipi(cpu);
+		wait_for_done(idx, cpu);
+		free_payload(idx);
+		return;
+	}
+
+	dest_mask = this_cpu_ptr(&rar_cpu_mask);
+	cpumask_and(dest_mask, mask, cpu_online_mask);
+	cpumask_clear_cpu(this_cpu, dest_mask);
+
+	/* Some callers race with other cpus changing the passed mask */
+	if (unlikely(!cpumask_weight(dest_mask)))
+		return;
+
+	idx = get_payload();
+	set_payload(idx, pcid, start, pages);
+
+	for_each_cpu(cpu, dest_mask)
+		set_action_entry(idx, cpu);
+
+	/* Send a message to all CPUs in the map */
+	arch_send_rar_ipi_mask(dest_mask);
+
+	for_each_cpu(cpu, dest_mask)
+		wait_for_done(idx, cpu);
+
+	free_payload(idx);
+}
+EXPORT_SYMBOL(smp_call_rar_many);
-- 
2.49.0

