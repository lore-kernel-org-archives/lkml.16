Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B222E7632
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771680; cv=none; b=gHR49BZBVfjC86VjKN66QZ5KLRWQ3D+0P3ojoLO5c1D8XACmaxjzvIC45CkD5CJMqBrmuhmRty3TAituRpD9dDwOWXPZQU4VHZ+osrmKxhuXghMGUQWzl351tKj2F5x9jDTPr0850ac8s4/ut9vXL1zEiyK23D/BXHMiUdaKbn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771680; c=relaxed/simple;
	bh=0Y+YU2tG91aTV6rlj83yTw8wALOgBmQrp7y1v8/NaWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxZAHE5Lo94CpE5SeUe2Bq4+ujliI/S6sRYx6+dhSigSSYYVmkFJFNZ6hdGkRTImpyPkAe9llTmx/ICLjEU1ktMsamyBdglY82dqSnJyD4ddx2QS10GhAZqT8TAMdp2cc4POsJcfoc/MGQX4Di3ON0KMf4d09U42oSUvOj0fH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SF66KC/J; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pTzm+fnu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SF66KC/J";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pTzm+fnu"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40K9B0t26LX1DySV5VsJmoyEVEFLIho/CTmnJzaTfWM=;
	b=SF66KC/J3vMyQ/0/y97n/EYvWWfTQy7KtHk7qLOYJYpVT6aZuhxVcIr6Ej7W0QvqojSpYk
	Gg79uojb2FGx4Asf6psjybjbZFa9ijYG/BwXA4oYPGlj3uHBMSH8syyLVvsp0qDpteFmam
	X718FEv4NBeF5nps84rB2ucXtDCGuq6WqN/bILEYGguW1w4+uA6HGyNcQYUIT2M0u5HMgo
	4oIJyo6BVaZWTc3iJUZx++Yd8/icWb1w/wRPXIRbxWYQQTjQYAShJrSGqABhivrFfw9Zzd
	z/1ybk4gbnGC5vwptzz9NcfmWbt7N1TxRBG21skB/AY6RKKJEySlrDII7vPzYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40K9B0t26LX1DySV5VsJmoyEVEFLIho/CTmnJzaTfWM=;
	b=pTzm+fnucc5OUIrpcOVXdd0eGc26x8b7iRpW5u98lBSwCp4EMf0QJu7je2+aYh7sOdNVG7
	JotHM3fBs4dOGcDg==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 17/44] treewide: Explicitly include <asm/cpuid/api.h>
Date: Fri, 13 Jun 2025 01:39:43 +0200
Message-ID: <20250612234010.572636-18-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let all CPUID call sites which include the main CPUID API header
implicitly though <asm/processor.h> include it explicitly instead.

This disentangles the CPUID API header <asm/cpuid/api.h> from
<asm/processor.h>, thus avoiding a circular header dependency.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/boot/compressed/pgtable_64.c        | 1 +
 arch/x86/boot/startup/sme.c                  | 1 +
 arch/x86/coco/tdx/tdx.c                      | 1 +
 arch/x86/events/amd/core.c                   | 2 ++
 arch/x86/events/amd/ibs.c                    | 1 +
 arch/x86/events/amd/lbr.c                    | 2 ++
 arch/x86/events/amd/power.c                  | 3 +++
 arch/x86/events/amd/uncore.c                 | 1 +
 arch/x86/events/intel/core.c                 | 1 +
 arch/x86/events/intel/lbr.c                  | 1 +
 arch/x86/events/zhaoxin/core.c               | 1 +
 arch/x86/include/asm/acrn.h                  | 2 ++
 arch/x86/include/asm/microcode.h             | 1 +
 arch/x86/include/asm/xen/hypervisor.h        | 1 +
 arch/x86/kernel/cpu/amd.c                    | 1 +
 arch/x86/kernel/cpu/centaur.c                | 1 +
 arch/x86/kernel/cpu/hygon.c                  | 1 +
 arch/x86/kernel/cpu/mce/core.c               | 1 +
 arch/x86/kernel/cpu/mce/inject.c             | 1 +
 arch/x86/kernel/cpu/resctrl/core.c           | 1 +
 arch/x86/kernel/cpu/resctrl/monitor.c        | 1 +
 arch/x86/kernel/cpu/scattered.c              | 1 +
 arch/x86/kernel/cpu/sgx/main.c               | 3 +++
 arch/x86/kernel/cpu/topology_amd.c           | 1 +
 arch/x86/kernel/cpu/topology_common.c        | 1 +
 arch/x86/kernel/cpu/topology_ext.c           | 1 +
 arch/x86/kernel/cpu/transmeta.c              | 3 +++
 arch/x86/kernel/cpu/zhaoxin.c                | 1 +
 arch/x86/kernel/cpuid.c                      | 1 +
 arch/x86/kernel/paravirt.c                   | 1 +
 arch/x86/kvm/cpuid.h                         | 3 +++
 arch/x86/kvm/mmu/spte.c                      | 1 +
 drivers/cpufreq/speedstep-lib.c              | 1 +
 drivers/firmware/efi/libstub/x86-5lvl.c      | 1 +
 drivers/hwmon/fam15h_power.c                 | 1 +
 drivers/hwmon/k10temp.c                      | 2 ++
 drivers/hwmon/k8temp.c                       | 1 +
 drivers/thermal/intel/intel_hfi.c            | 1 +
 drivers/thermal/intel/x86_pkg_temp_thermal.c | 1 +
 39 files changed, 51 insertions(+)

diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
index bdd26050dff7..d94d98595780 100644
--- a/arch/x86/boot/compressed/pgtable_64.c
+++ b/arch/x86/boot/compressed/pgtable_64.c
@@ -2,6 +2,7 @@
 #include "misc.h"
 #include <asm/bootparam.h>
 #include <asm/bootparam_utils.h>
+#include <asm/cpuid/api.h>
 #include <asm/e820/types.h>
 #include <asm/processor.h>
 #include "../string.h"
diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index 922b236be02f..6a58ab568390 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -40,6 +40,7 @@
 #include <linux/mm.h>
 
 #include <asm/coco.h>
+#include <asm/cpuid/api.h>
 #include <asm/init.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 7bc11836c46a..4ed8ec642646 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -10,6 +10,7 @@
 #include <linux/kexec.h>
 
 #include <asm/coco.h>
+#include <asm/cpuid/api.h>
 #include <asm/ia32.h>
 #include <asm/insn.h>
 #include <asm/insn-eval.h>
diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index b20661b8621d..d28d45ceb707 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -7,8 +7,10 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
+
 #include <asm/apicdef.h>
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
 
diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 112f43b23ebf..0c7848e6149e 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -15,6 +15,7 @@
 #include <linux/sched/clock.h>
 
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "../perf_event.h"
diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
index d24da377df77..5b437dc8e4ce 100644
--- a/arch/x86/events/amd/lbr.c
+++ b/arch/x86/events/amd/lbr.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/perf_event.h>
+
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/perf_event.h>
 
diff --git a/arch/x86/events/amd/power.c b/arch/x86/events/amd/power.c
index dad42790cf7d..744dffa42dee 100644
--- a/arch/x86/events/amd/power.c
+++ b/arch/x86/events/amd/power.c
@@ -10,8 +10,11 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/perf_event.h>
+
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
+
 #include "../perf_event.h"
 
 /* Event code: LSB 8 bits, passed in attr->config any other bit is reserved. */
diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index c1483ef16c0b..5261f12007df 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -15,6 +15,7 @@
 #include <linux/smp.h>
 #include <linux/types.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/perf_event.h>
 
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 741b229f0718..a372f0e2867a 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -17,6 +17,7 @@
 #include <linux/kvm_host.h>
 
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/debugreg.h>
 #include <asm/hardirq.h>
 #include <asm/intel-family.h>
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index 7aa59966e7c3..0d1ec3651735 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -3,6 +3,7 @@
 #include <linux/types.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/perf_event.h>
 #include <asm/msr.h>
 
diff --git a/arch/x86/events/zhaoxin/core.c b/arch/x86/events/zhaoxin/core.c
index d59992364880..15bb9c9c9358 100644
--- a/arch/x86/events/zhaoxin/core.c
+++ b/arch/x86/events/zhaoxin/core.c
@@ -14,6 +14,7 @@
 
 #include <asm/apic.h>
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/hardirq.h>
 #include <asm/msr.h>
 
diff --git a/arch/x86/include/asm/acrn.h b/arch/x86/include/asm/acrn.h
index fab11192c60a..db42b477c41d 100644
--- a/arch/x86/include/asm/acrn.h
+++ b/arch/x86/include/asm/acrn.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_X86_ACRN_H
 #define _ASM_X86_ACRN_H
 
+#include <asm/cpuid/api.h>
+
 /*
  * This CPUID returns feature bitmaps in EAX.
  * Guest VM uses this to detect the appropriate feature bit.
diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 8b41f26f003b..645e65ac1586 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -3,6 +3,7 @@
 #define _ASM_X86_MICROCODE_H
 
 #include <asm/msr.h>
+#include <asm/cpuid/api.h>
 
 struct cpu_signature {
 	unsigned int sig;
diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index c2fc7869b996..7c596cebfb78 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -37,6 +37,7 @@ extern struct shared_info *HYPERVISOR_shared_info;
 extern struct start_info *xen_start_info;
 
 #include <asm/bug.h>
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 
 #define XEN_SIGNATURE "XenVMMXenVMM"
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index c988d876b700..f982b3bb1c10 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -14,6 +14,7 @@
 #include <asm/cacheinfo.h>
 #include <asm/cpu.h>
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/debugreg.h>
 #include <asm/delay.h>
 #include <asm/msr.h>
diff --git a/arch/x86/kernel/cpu/centaur.c b/arch/x86/kernel/cpu/centaur.c
index a3b55db35c96..cc5a390dcd07 100644
--- a/arch/x86/kernel/cpu/centaur.c
+++ b/arch/x86/kernel/cpu/centaur.c
@@ -5,6 +5,7 @@
 
 #include <asm/cpu.h>
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/e820/api.h>
 #include <asm/mtrr.h>
 #include <asm/msr.h>
diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index 2154f12766fb..75ad7eb1301a 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -10,6 +10,7 @@
 
 #include <asm/apic.h>
 #include <asm/cpu.h>
+#include <asm/cpuid/api.h>
 #include <asm/smp.h>
 #include <asm/numa.h>
 #include <asm/cacheinfo.h>
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index fe9e65f314fb..9f7c39b4163f 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -47,6 +47,7 @@
 #include <linux/uaccess.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/fred.h>
 #include <asm/mce.h>
 #include <asm/msr.h>
diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index d02c4f556cd0..42c82c14c48a 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -26,6 +26,7 @@
 
 #include <asm/amd/nb.h>
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/irq_vectors.h>
 #include <asm/mce.h>
 #include <asm/msr.h>
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 289e79154922..9498d55d51e6 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/resctrl.h>
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index c261558276cd..5dffb9453d77 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -21,6 +21,7 @@
 #include <linux/resctrl.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "internal.h"
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 3d23b943f596..15f8752d4132 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -5,6 +5,7 @@
 #include <linux/cpu.h>
 
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/memtype.h>
 #include <asm/processor.h>
 
diff --git a/arch/x86/kernel/cpu/sgx/main.c b/arch/x86/kernel/cpu/sgx/main.c
index 2de01b379aa3..00bf42f4c536 100644
--- a/arch/x86/kernel/cpu/sgx/main.c
+++ b/arch/x86/kernel/cpu/sgx/main.c
@@ -14,8 +14,11 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/vmalloc.h>
+
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/sgx.h>
+
 #include "driver.h"
 #include "encl.h"
 #include "encls.h"
diff --git a/arch/x86/kernel/cpu/topology_amd.c b/arch/x86/kernel/cpu/topology_amd.c
index 843b1655ab45..abc6f5a7a486 100644
--- a/arch/x86/kernel/cpu/topology_amd.c
+++ b/arch/x86/kernel/cpu/topology_amd.c
@@ -2,6 +2,7 @@
 #include <linux/cpu.h>
 
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/memtype.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
diff --git a/arch/x86/kernel/cpu/topology_common.c b/arch/x86/kernel/cpu/topology_common.c
index 48c47d02d8a9..38189e4fea0e 100644
--- a/arch/x86/kernel/cpu/topology_common.c
+++ b/arch/x86/kernel/cpu/topology_common.c
@@ -4,6 +4,7 @@
 #include <xen/xen.h>
 
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/intel-family.h>
 #include <asm/processor.h>
 #include <asm/smp.h>
diff --git a/arch/x86/kernel/cpu/topology_ext.c b/arch/x86/kernel/cpu/topology_ext.c
index 467b0326bf1a..eb915c73895f 100644
--- a/arch/x86/kernel/cpu/topology_ext.c
+++ b/arch/x86/kernel/cpu/topology_ext.c
@@ -2,6 +2,7 @@
 #include <linux/cpu.h>
 
 #include <asm/apic.h>
+#include <asm/cpuid/api.h>
 #include <asm/memtype.h>
 #include <asm/processor.h>
 
diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index 42c939827621..1fdcd69c625c 100644
--- a/arch/x86/kernel/cpu/transmeta.c
+++ b/arch/x86/kernel/cpu/transmeta.c
@@ -3,8 +3,11 @@
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
 #include <linux/mm.h>
+
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
+
 #include "cpu.h"
 
 static void early_init_transmeta(struct cpuinfo_x86 *c)
diff --git a/arch/x86/kernel/cpu/zhaoxin.c b/arch/x86/kernel/cpu/zhaoxin.c
index 89b1c8a70fe8..cfcfb6221e3f 100644
--- a/arch/x86/kernel/cpu/zhaoxin.c
+++ b/arch/x86/kernel/cpu/zhaoxin.c
@@ -4,6 +4,7 @@
 
 #include <asm/cpu.h>
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "cpu.h"
diff --git a/arch/x86/kernel/cpuid.c b/arch/x86/kernel/cpuid.c
index dae436253de4..cbd04b677fd1 100644
--- a/arch/x86/kernel/cpuid.c
+++ b/arch/x86/kernel/cpuid.c
@@ -37,6 +37,7 @@
 #include <linux/gfp.h>
 #include <linux/completion.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 #include <asm/msr.h>
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 3d745cd25a43..b7fc3b78086c 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -18,6 +18,7 @@
 
 #include <asm/apic.h>
 #include <asm/bug.h>
+#include <asm/cpuid/api.h>
 #include <asm/debugreg.h>
 #include <asm/delay.h>
 #include <asm/desc.h>
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index d3f5ae15a7ca..89f8ed3fb37a 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -3,8 +3,11 @@
 #define ARCH_X86_KVM_CPUID_H
 
 #include "reverse_cpuid.h"
+
 #include <asm/cpu.h>
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
+
 #include <uapi/asm/kvm_para.h>
 
 extern u32 kvm_cpu_caps[NR_KVM_CPU_CAPS] __read_mostly;
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index cfce03d8f123..e7b69275ae50 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -15,6 +15,7 @@
 #include "x86.h"
 #include "spte.h"
 
+#include <asm/cpuid/api.h>
 #include <asm/e820/api.h>
 #include <asm/memtype.h>
 #include <asm/vmx.h>
diff --git a/drivers/cpufreq/speedstep-lib.c b/drivers/cpufreq/speedstep-lib.c
index f08817331aec..3c323cd8eede 100644
--- a/drivers/cpufreq/speedstep-lib.c
+++ b/drivers/cpufreq/speedstep-lib.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/tsc.h>
 
diff --git a/drivers/firmware/efi/libstub/x86-5lvl.c b/drivers/firmware/efi/libstub/x86-5lvl.c
index f1c5fb45d5f7..029ad80cf0b4 100644
--- a/drivers/firmware/efi/libstub/x86-5lvl.c
+++ b/drivers/firmware/efi/libstub/x86-5lvl.c
@@ -2,6 +2,7 @@
 #include <linux/efi.h>
 
 #include <asm/boot.h>
+#include <asm/cpuid/api.h>
 #include <asm/desc.h>
 #include <asm/efi.h>
 
diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index 5a5674e85f63..1ecaef25f04e 100644
--- a/drivers/hwmon/fam15h_power.c
+++ b/drivers/hwmon/fam15h_power.c
@@ -19,6 +19,7 @@
 #include <linux/time.h>
 #include <linux/topology.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
 
diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index babf2413d666..12115654689a 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -20,7 +20,9 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
+
 #include <asm/amd/node.h>
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 
 MODULE_DESCRIPTION("AMD Family 10h+ CPU core temperature monitor");
diff --git a/drivers/hwmon/k8temp.c b/drivers/hwmon/k8temp.c
index 8c1efce9a04b..eb167be245b9 100644
--- a/drivers/hwmon/k8temp.c
+++ b/drivers/hwmon/k8temp.c
@@ -15,6 +15,7 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/processor.h>
 
 #define TEMP_FROM_REG(val)	(((((val) >> 16) & 0xff) - 49) * 1000)
diff --git a/drivers/thermal/intel/intel_hfi.c b/drivers/thermal/intel/intel_hfi.c
index bd2fca7dc017..c910cc563d9d 100644
--- a/drivers/thermal/intel/intel_hfi.c
+++ b/drivers/thermal/intel/intel_hfi.c
@@ -41,6 +41,7 @@
 #include <linux/topology.h>
 #include <linux/workqueue.h>
 
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "intel_hfi.h"
diff --git a/drivers/thermal/intel/x86_pkg_temp_thermal.c b/drivers/thermal/intel/x86_pkg_temp_thermal.c
index c843cb5fc5c3..1b9e0b49856c 100644
--- a/drivers/thermal/intel/x86_pkg_temp_thermal.c
+++ b/drivers/thermal/intel/x86_pkg_temp_thermal.c
@@ -20,6 +20,7 @@
 #include <linux/thermal.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/cpuid/api.h>
 #include <asm/msr.h>
 
 #include "thermal_interrupt.h"
-- 
2.49.0

