Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876142798F5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716571; cv=none; b=ZYFbP3FNXgy4ydSjzSq8kHy5cyl/tuWfHrPlmAEJYo2/qPTcMTIEhfGnGEjVXECETQXBu+ixoxBnSQYGm2MOSTNA/nTR07xdVzCRVkIR+Ib8vLXuXTo/Jw3FXqt+6BArmjaisCh4+FvLVNcI8dqc0PeOqB4LR1Q1H6E+pfpnzaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716571; c=relaxed/simple;
	bh=KwRSLfvjHxj87pOjqUvVy5lfQX5BcaHXeYfDA5C4/Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhW15ezXyHvl4q8H8x5J4kbRxBaIzzYaRdm2gqnsIuiCoU1cMsMWq7ZQRdfG1xoKJfK41zHgFpKbJM4Kdu3/74+Q92ZLwy6mgSJLqbdJJkmcRqakIbnbRo4MySQxttttSIf5JdMyNvrW/QU0wKsYyFDjfVTE2rjq08y5tlFvdb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0xVzj8EJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e7Ha5cwy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0xVzj8EJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e7Ha5cwy"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AR4QBydac+ePtZr/KBeU6d7HqcaAY5BkP7LONKl+RRQ=;
	b=0xVzj8EJLrS7Cc2TT9ban9zWmajCVE3VQeozZaz75vTdksEjQiBP0zyeV2xsbag8UMyr7N
	xoILAbFaImDObvf71gspxOSUouG9h4dHEmder6s+Xx1YKNxyTROj3MEZ1rgscQhBYvgBug
	1rNv74O4TLTeWksboi14TIpTk7NkJCMY4JCxrr+eo55SZNQPm2bI327gset5JgQeoS+XC7
	dAXBYbeDNapRTXTqdGbBSmP+S7LxkPZa+XmCwnda3/G3taNsEJm+Y3bYYFM9VTXbmUfrDO
	PdNLl8TrnWMDhfQVth/MqcQSFmpX+77aTfrbcqKe35eOW2D8FcvkcHE7PCpwbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AR4QBydac+ePtZr/KBeU6d7HqcaAY5BkP7LONKl+RRQ=;
	b=e7Ha5cwyIgr1WHwJdBtRKRc8daiZeezm/VFq94MBJExtQlZWn1ibq1soJ+ONZsjNfBsx4Y
	xqrNR1E2V9HNlHBQ==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 2/9] x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header
Date: Thu,  8 May 2025 17:02:31 +0200
Message-ID: <20250508150240.172915-3-darwi@linutronix.de>
In-Reply-To: <20250508150240.172915-1-darwi@linutronix.de>
References: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main CPUID header <asm/cpuid.h> was originally a storefront for the
headers:

    <asm/cpuid/api.h>
    <asm/cpuid/leaf_0x2_api.h>

Now that the latter CPUID(0x2) header has been merged into the former,
there is no practical difference between <asm/cpuid.h> and
<asm/cpuid/api.h>

Remove <asm/cpuid.h> and let all call-sites directly include
<asm/cpuid/api.h>.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/boot/compressed/sev.c        | 2 +-
 arch/x86/coco/sev/core.c              | 2 +-
 arch/x86/events/intel/pt.c            | 2 +-
 arch/x86/include/asm/cpuid.h          | 8 --------
 arch/x86/include/asm/processor.h      | 2 +-
 arch/x86/kernel/acpi/cstate.c         | 2 +-
 arch/x86/kernel/amd_nb.c              | 2 +-
 arch/x86/kernel/cpu/cacheinfo.c       | 2 +-
 arch/x86/kernel/cpu/common.c          | 2 +-
 arch/x86/kernel/cpu/intel.c           | 2 +-
 arch/x86/kernel/fpu/xstate.c          | 2 +-
 arch/x86/kernel/hpet.c                | 2 +-
 arch/x86/kernel/process.c             | 2 +-
 arch/x86/kernel/smpboot.c             | 2 +-
 arch/x86/kernel/tsc.c                 | 2 +-
 arch/x86/kvm/cpuid.c                  | 2 +-
 arch/x86/virt/svm/sev.c               | 2 +-
 arch/x86/xen/enlighten_pv.c           | 2 +-
 drivers/acpi/acpi_pad.c               | 2 +-
 drivers/dma/ioat/dca.c                | 2 +-
 drivers/idle/intel_idle.c             | 2 +-
 drivers/platform/x86/intel/pmc/core.c | 2 +-
 sound/soc/intel/avs/tgl.c             | 2 +-
 23 files changed, 22 insertions(+), 30 deletions(-)
 delete mode 100644 arch/x86/include/asm/cpuid.h

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 0003e4416efd..f054bf52c10a 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -21,7 +21,7 @@
 #include <asm/fpu/xcr.h>
 #include <asm/ptrace.h>
 #include <asm/svm.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 
 #include "error.h"
 #include "../msr.h"
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index b0c1a7a57497..836fc4ce37d0 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -41,7 +41,7 @@
 #include <asm/smp.h>
 #include <asm/cpu.h>
 #include <asm/apic.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/cmdline.h>
 
 #define DR7_RESET_VALUE        0x400
diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index fa37565f6418..5ec16f31b904 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -18,7 +18,7 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/perf_event.h>
 #include <asm/insn.h>
 #include <asm/io.h>
diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
deleted file mode 100644
index d5749b25fa10..000000000000
--- a/arch/x86/include/asm/cpuid.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _ASM_X86_CPUID_H
-#define _ASM_X86_CPUID_H
-
-#include <asm/cpuid/api.h>
-
-#endif /* _ASM_X86_CPUID_H */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 5d2f7e5aff26..f639df061f09 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -16,7 +16,7 @@ struct vm86;
 #include <uapi/asm/sigcontext.h>
 #include <asm/current.h>
 #include <asm/cpufeatures.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/page.h>
 #include <asm/pgtable_types.h>
 #include <asm/percpu.h>
diff --git a/arch/x86/kernel/acpi/cstate.c b/arch/x86/kernel/acpi/cstate.c
index d5ac34186555..8698d66563ed 100644
--- a/arch/x86/kernel/acpi/cstate.c
+++ b/arch/x86/kernel/acpi/cstate.c
@@ -14,7 +14,7 @@
 
 #include <acpi/processor.h>
 #include <asm/cpu_device_id.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/mwait.h>
 #include <asm/special_insns.h>
 #include <asm/smp.h>
diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index ffaad175cee2..cb4de00c36e7 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -15,7 +15,7 @@
 #include <linux/pci_ids.h>
 
 #include <asm/amd/nb.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 
 static u32 *flush_words;
 
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index f866d94352fb..6d61f7dff9e7 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -16,7 +16,7 @@
 #include <asm/amd/nb.h>
 #include <asm/cacheinfo.h>
 #include <asm/cpufeature.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/mtrr.h>
 #include <asm/smp.h>
 #include <asm/tlbflush.h>
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index e5734df3b4a1..9f0f6dcb2f7d 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -29,7 +29,7 @@
 
 #include <asm/alternative.h>
 #include <asm/cmdline.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/perf_event.h>
 #include <asm/mmu_context.h>
 #include <asm/doublefault.h>
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index a6493f60b3f2..ade5557dd3f8 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -16,7 +16,7 @@
 #include <asm/cpu_device_id.h>
 #include <asm/cpufeature.h>
 #include <asm/cpu.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/hwcap2.h>
 #include <asm/intel-family.h>
 #include <asm/microcode.h>
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 6a41d1610d8b..d67636806c8d 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -20,7 +20,7 @@
 #include <asm/fpu/signal.h>
 #include <asm/fpu/xcr.h>
 
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/tlbflush.h>
 #include <asm/prctl.h>
 #include <asm/elf.h>
diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 7f4b2966e15c..e786664b735f 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -7,7 +7,7 @@
 #include <linux/cpu.h>
 #include <linux/irq.h>
 
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/irq_remapping.h>
 #include <asm/hpet.h>
 #include <asm/time.h>
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 962c3ce39323..6e2f494472ae 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -30,7 +30,7 @@
 #include <linux/hw_breakpoint.h>
 #include <linux/entry-common.h>
 #include <asm/cpu.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/apic.h>
 #include <linux/uaccess.h>
 #include <asm/mwait.h>
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index d6cf1e23c2a3..d7d61b3de2bf 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -64,7 +64,7 @@
 
 #include <asm/acpi.h>
 #include <asm/cacheinfo.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/desc.h>
 #include <asm/nmi.h>
 #include <asm/irq.h>
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 88e5a4ed9db3..56a1b7c5cf4e 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -16,7 +16,7 @@
 #include <linux/static_key.h>
 #include <linux/static_call.h>
 
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/hpet.h>
 #include <asm/timer.h>
 #include <asm/vgtod.h>
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 571c906ffcbf..7f43d8d24fbe 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -21,7 +21,7 @@
 #include <asm/user.h>
 #include <asm/fpu/xstate.h>
 #include <asm/sgx.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include "cpuid.h"
 #include "lapic.h"
 #include "mmu.h"
diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index fc473ca12c44..10a78a98e2dd 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -27,7 +27,7 @@
 #include <asm/smp.h>
 #include <asm/cpu.h>
 #include <asm/apic.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/cmdline.h>
 #include <asm/iommu.h>
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 846b5737d320..21c7f524766e 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -49,7 +49,7 @@
 #include <xen/hvc-console.h>
 #include <xen/acpi.h>
 
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/paravirt.h>
 #include <asm/apic.h>
 #include <asm/page.h>
diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c
index 3fde4496f8a2..6f8bbe1247a5 100644
--- a/drivers/acpi/acpi_pad.c
+++ b/drivers/acpi/acpi_pad.c
@@ -19,7 +19,7 @@
 #include <linux/acpi.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/mwait.h>
 #include <xen/xen.h>
 
diff --git a/drivers/dma/ioat/dca.c b/drivers/dma/ioat/dca.c
index c9aba2304de7..5d3c0ae6b342 100644
--- a/drivers/dma/ioat/dca.c
+++ b/drivers/dma/ioat/dca.c
@@ -10,7 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/dca.h>
 
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 
 /* either a kernel change is needed, or we need something like this in kernel */
 #ifndef CONFIG_SMP
diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
index 976f5be54e36..d0b94dbc0835 100644
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@ -51,7 +51,7 @@
 #include <linux/notifier.h>
 #include <linux/cpu.h>
 #include <linux/moduleparam.h>
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/mwait.h>
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 7a1d11f2914f..492c7b672bd7 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -22,7 +22,7 @@
 #include <linux/suspend.h>
 #include <linux/units.h>
 
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/msr.h>
diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
index 56905f2b9eb2..9dbb3ad0954a 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -47,7 +47,7 @@ static int avs_tgl_config_basefw(struct avs_dev *adev)
 #ifdef CONFIG_X86
 	unsigned int ecx;
 
-#include <asm/cpuid.h>
+#include <asm/cpuid/api.h>
 	ecx = cpuid_ecx(CPUID_TSC_LEAF);
 	if (ecx) {
 		ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(ecx), &ecx);
-- 
2.49.0

