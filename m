Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F24225785;
	Thu, 24 Apr 2025 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490448; cv=none; b=UEDoTryDjVAZabIutP7VCEfRzu7agTAgsnmpE3I7xjyUCz5wO7rreceRQ2PZQpH+spJLquG2Q4phjW/MZuslz1JFsH5tdPVIuEbzrzxU0p6CXZaRiRM1mIcDQs150kK9KjernbB+jjI0PcDwkEFGlGEl5tdeqIcnK94EuWmcVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490448; c=relaxed/simple;
	bh=kVmUOsoYAffCkj0BDSiaisYdEeHtGHN8RCJylQNCwn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWWXEblyVSkdtLRhrT/3Jcuo1cXTt0lQDNc2Al6HI6he8i4q9QZjas7+yhc5+h8bk0oPxSGU5PXyv5R7pcF/ZqIzRVJF1VHhS5P7b44I2BNBz7u4XJGzSRBi1f6hUYnvbEaZsXBUuYONYIE9YbZWm/e5kF9w+9h3tQVOwjsusHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlZh337e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlZh337e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F70C4CEE3;
	Thu, 24 Apr 2025 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490448;
	bh=kVmUOsoYAffCkj0BDSiaisYdEeHtGHN8RCJylQNCwn4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SlZh337ecGjw8IRclRHeDtqsRimlYJMsnwvRBsiJNO96jqJTjgHs1NEMQmYriU4xU
	 VCufKcQHVPCoKjuF5hW1Qivq43kNsJlCBXPuawfk+v2eZWwcqnOJvNkEH1mVRjYdVj
	 Yboz+QCFINhh7js9m73ijcM0kUBe9SuZQ8tz7Xtehj0ZkRE0LMYmnyQsWn29/q1cx2
	 uqPvr3EVmyebcapyvCES4aGk+Tebh8s70INmolZjPhLDImqmqdXmb2Qk6/dB6pzJRi
	 XjdvgQoigQ0r4nDllnRKzrccrodTsvQQ4paIy6zY2YJtqmrZptgBk7zzzpScwbyOZg
	 uSaBJDuQ33ZSw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:30 +0200
Subject: [PATCH v2 19/22] irqchip/gic-v5: Add GICv5 CPU interface/IRS
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-19-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

Implement GICv5 CPU interface and IRS support, to manage interrupt
state, priority and routing for all GICv5 interrupt types.

The GICv5 CPU interface implements support for PE-Private Peripheral
Interrupts (PPI), that are handled (enabled/prioritized/delivered)
entirely within the CPU interface hardware.

To enable PPI interrupts, implement the baseline GICv5 host kernel
driver infrastructure required to handle interrupts on a GICv5 system.

Add the exception handling code path and definitions for GICv5
instructions.

Add GICv5 PPI handling code as a specific IRQ domain to:

- Set-up PPI priority
- Manage PPI configuration and state
- Manage IRQ flow handler
- IRQs allocation/free
- Hook-up a PPI specific IRQchip to provide the relevant methods

PPI IRQ priority is chosen as the minimum allowed priority by the
system design (after probing the number of priority bits implemented
by the CPU interface).

The GICv5 Interrupt Routing Service (IRS) component implements
interrupt management and routing in the GICv5 architecture.

A GICv5 system comprises one or more IRSes, that together
handle the interrupt routing and state for the system.

An IRS supports Shared Peripheral Interrupts (SPIs), that are
interrupt sources directly connected to the IRS; they do not
rely on memory for storage. The number of supported SPIs is
fixed for a given implementation and can be probed through IRS
IDR registers.

SPI interrupt state and routing are managed through GICv5
instructions.

Each core (PE in GICv5 terms) in a GICv5 system is identified with
an Interrupt AFFinity ID (IAFFID).

An IRS manages a set of cores that are connected to it.

Firmware provides a topology description that the driver uses
to detect to which IRS a CPU (ie an IAFFID) is associated with.

Use probeable information and firmware description to initialize
the IRSes and implement GICv5 IRS SPIs support through an
SPI-specific IRQ domain.

The GICv5 IRS driver:

- Probes IRSes in the system to detect SPI ranges
- Associates an IRS with a set of cores connected to it
- Adds an IRQchip structure for SPI handling

SPIs priority is set to a value corresponding to the lowest
permissible priority in the system (taking into account the
implemented priority bits of the IRS and CPU interface).

Since all IRQs are set to the same priority value, the value
itself does not matter as long as it is a valid one.

An IRS supports Logical Peripheral Interrupts (LPIs) and implement
Linux IPIs on top of it.

LPIs are used for interrupt signals that are translated by a
GICv5 ITS (Interrupt Translation Service) but also for software
generated IRQs - namely interrupts that are not driven by a HW
signal, ie IPIs.

LPIs rely on memory storage for interrupt routing and state.

Memory storage is handled by the IRS - that is configured
at probe time by the driver with the required memory.

LPIs state and routing information is kept in the Interrupt
State Table (IST).

IRSes provide support for 1- or 2-level IST tables configured
to support a maximum number of interrupts that depend on the
OS configuration and the HW capabilities.

On systems that provide 2-level IST support, always allow
the maximum number of LPIs; On systems with only 1-level
support, limit the number of LPIs to 2^12 to prevent
wasting memory (presumably a system that supports a 1-level
only IST is not expecting a large number of interrupts).

On a 2-level IST system, L2 entries are allocated on
demand.

The IST table memory is allocated using the kmalloc() interface;
the allocation required may be smaller than a page and must be
made up of contiguous physical pages if larger than a page.

On systems where the IRS is not cache-coherent with the CPUs,
cache mainteinance operations are executed to clean and
invalidate the allocated memory to the point of coherency
making it visible to the IRS components.

Add an LPI IRQ domain to:

- Manage LPI state and routing
- Add LPI IRQchip structure and callbacks
- LPI domain allocation/de-allocation

On GICv5 systems, IPIs are implemented using LPIs.

Implement an IPI-specific IRQ domain created as a child/subdomain
of the LPI domain to allocate the required number of LPIs needed
to implement the IPIs.

Move the arm64 IPI enum declaration to a header file so that the
GICv5 driver code can detect how many IPIs are required by arch code.

IPIs are backed by LPIs, add LPIs allocation/de-allocation
functions.

The LPI INTID namespace is managed using an IDA to alloc/free LPI
INTIDs.

Associate an IPI irqchip with IPI IRQ descriptors to provide
core code with the irqchip.ipi_send_single() method required
to raise an IPI.

Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 MAINTAINERS                         |    2 +
 arch/arm64/include/asm/arch_gicv5.h |   91 +++
 arch/arm64/include/asm/smp.h        |   17 +
 arch/arm64/kernel/smp.c             |   17 -
 drivers/irqchip/Kconfig             |    5 +
 drivers/irqchip/Makefile            |    1 +
 drivers/irqchip/irq-gic-v5-irs.c    |  841 ++++++++++++++++++++++++++++
 drivers/irqchip/irq-gic-v5.c        | 1058 +++++++++++++++++++++++++++++++++++
 drivers/irqchip/irq-gic-v5.h        |  184 ++++++
 9 files changed, 2199 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3ed84466da19906953b5396a5f4b50e878c376e..cdeceb6782355a4a18609135bf7f03249d8b0bb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1907,6 +1907,8 @@ M:	Marc Zyngier <maz@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
+F:	arch/arm64/include/asm/arch_gicv5.h
+F:	drivers/irqchip/irq-gic-v5*.[ch]
 
 ARM HDLCD DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
diff --git a/arch/arm64/include/asm/arch_gicv5.h b/arch/arm64/include/asm/arch_gicv5.h
new file mode 100644
index 0000000000000000000000000000000000000000..75557fdad611fa51d7136126eb80cb861be98a8d
--- /dev/null
+++ b/arch/arm64/include/asm/arch_gicv5.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 ARM Ltd.
+ */
+#ifndef __ASM_ARCH_GICV5_H
+#define __ASM_ARCH_GICV5_H
+
+#include <asm/cacheflush.h>
+#include <asm/sysreg.h>
+
+#ifndef __ASSEMBLY__
+
+#define GICV5_OP_GIC_CDAFF		sys_insn(1, 0, 12, 1, 3)
+#define GICV5_OP_GIC_CDDI		sys_insn(1, 0, 12, 2, 0)
+#define GICV5_OP_GIC_CDDIS		sys_insn(1, 0, 12, 1, 0)
+#define GICV5_OP_GIC_CDEN		sys_insn(1, 0, 12, 1, 1)
+#define GICV5_OP_GIC_CDEOI		sys_insn(1, 0, 12, 1, 7)
+#define GICV5_OP_GIC_CDPEND		sys_insn(1, 0, 12, 1, 4)
+#define GICV5_OP_GIC_CDPRI		sys_insn(1, 0, 12, 1, 2)
+#define GICV5_OP_GIC_CDRCFG		sys_insn(1, 0, 12, 1, 5)
+#define GICV5_OP_GICR_CDIA		sys_insn(1, 0, 12, 3, 0)
+
+#define gicr_insn(insn)			read_sysreg_s(insn)
+#define gic_insn(v, insn)		write_sysreg_s(v, insn)
+
+#define GSB_ACK				__emit_inst(0xd5000000 | sys_insn(1, 0, 12, 0, 1) | 31)
+#define GSB_SYS				__emit_inst(0xd5000000 | sys_insn(1, 0, 12, 0, 0) | 31)
+
+#define gsb_ack()			asm volatile(GSB_ACK : : : "memory")
+#define gsb_sys()			asm volatile(GSB_SYS : : : "memory")
+
+/* Shift and mask definitions for GIC CDAFF */
+#define GICV5_GIC_CDAFF_IAFFID_MASK	GENMASK_ULL(47, 32)
+#define GICV5_GIC_CDAFF_IAFFID(r)	FIELD_GET(GICV5_GIC_CDAFF_IAFFID_MASK, r)
+#define GICV5_GIC_CDAFF_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDAFF_TYPE(r)		FIELD_GET(GICV5_GIC_CDAFF_TYPE_MASK, r)
+#define GICV5_GIC_CDAFF_IRM_MASK	BIT_ULL(28)
+#define GICV5_GIC_CDAFF_IRM(r)		FIELD_GET(GICV5_GIC_CDAFF_IRM_MASK, r)
+#define GICV5_GIC_CDAFF_ID_MASK		GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDAFF_ID(r)		FIELD_GET(GICV5_GIC_CDAFF_ID_MASK, r)
+
+/* Shift and mask definitions for GIC CDDI */
+#define GICV5_GIC_CDDI_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDDI_TYPE(r)		FIELD_GET(GICV5_GIC_CDDI_TYPE_MASK, r)
+#define GICV5_GIC_CDDI_ID_MASK		GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDDI_ID(r)		FIELD_GET(GICV5_GIC_CDDI_ID_MASK, r)
+
+/* Shift and mask definitions for GIC CDDIS */
+#define GICV5_GIC_CDDIS_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDDIS_TYPE(r)		FIELD_GET(GICV5_GIC_CDDIS_TYPE_MASK, r)
+#define GICV5_GIC_CDDIS_ID_MASK		GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDDIS_ID(r)		FIELD_GET(GICV5_GIC_CDDIS_ID_MASK, r)
+
+/* Shift and mask definitions for GIC CDEN */
+#define GICV5_GIC_CDEN_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDEN_TYPE(r)		FIELD_GET(GICV5_GIC_CDEN_TYPE_MASK, r)
+#define GICV5_GIC_CDEN_ID_MASK		GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDEN_ID(r)		FIELD_GET(GICV5_GIC_CDEN_ID_MASK, r)
+
+/* Shift and mask definitions for GIC CDPEND */
+#define GICV5_GIC_CDPEND_PENDING_MASK	BIT_ULL(32)
+#define GICV5_GIC_CDPEND_PENDING(r)	FIELD_GET(GICV5_GIC_CDPEND_PENDING_MASK, r)
+#define GICV5_GIC_CDPEND_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDPEND_TYPE(r)	FIELD_GET(GICV5_GIC_CDPEND_TYPE_MASK, r)
+#define GICV5_GIC_CDPEND_ID_MASK	GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDPEND_ID(r)		FIELD_GET(GICV5_GIC_CDPEND_ID_MASK, r)
+
+/* Shift and mask definitions for GIC CDPRI */
+#define GICV5_GIC_CDPRI_PRIORITY_MASK	GENMASK_ULL(39, 35)
+#define GICV5_GIC_CDPRI_PRIORITY(r)	FIELD_GET(GICV5_GIC_CDPRI_PRIORITY_MASK, r)
+#define GICV5_GIC_CDPRI_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDPRI_TYPE(r)		FIELD_GET(GICV5_GIC_CDPRI_TYPE_MASK, r)
+#define GICV5_GIC_CDPRI_ID_MASK		GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDPRI_ID(r)		FIELD_GET(GICV5_GIC_CDPRI_ID_MASK, r)
+
+/* Shift and mask definitions for GIC CDRCFG */
+#define GICV5_GIC_CDRCFG_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDRCFG_TYPE(r)	FIELD_GET(GICV5_GIC_CDRCFG_TYPE_MASK, r)
+#define GICV5_GIC_CDRCFG_ID_MASK	GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDRCFG_ID(r)		FIELD_GET(GICV5_GIC_CDRCFG_ID_MASK, r)
+
+/* Shift and mask definitions for GICR CDIA */
+#define GICV5_GIC_CDIA_VALID_MASK	BIT_ULL(32)
+#define GICV5_GIC_CDIA_VALID(r)		FIELD_GET(GICV5_GIC_CDIA_VALID_MASK, r)
+#define GICV5_GIC_CDIA_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDIA_TYPE(r)		FIELD_GET(GICV5_GIC_CDIA_TYPE_MASK, r)
+#define GICV5_GIC_CDIA_ID_MASK		GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDIA_ID(r)		FIELD_GET(GICV5_GIC_CDIA_ID_MASK, r)
+
+#endif /* __ASSEMBLY__ */
+#endif /* __ASM_ARCH_GICV5_H */
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index d6fd6efb66a673ae33825971e4aa07e791c02ee5..d48ef6d5abcc77d1c06ad8e91e72006acf662078 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -50,6 +50,23 @@ struct seq_file;
  */
 extern void smp_init_cpus(void);
 
+enum ipi_msg_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+	IPI_CPU_STOP,
+	IPI_CPU_STOP_NMI,
+	IPI_TIMER,
+	IPI_IRQ_WORK,
+	NR_IPI,
+	/*
+	 * Any enum >= NR_IPI and < MAX_IPI is special and not tracable
+	 * with trace_ipi_*
+	 */
+	IPI_CPU_BACKTRACE = NR_IPI,
+	IPI_KGDB_ROUNDUP,
+	MAX_IPI
+};
+
 /*
  * Register IPI interrupts with the arch SMP code
  */
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3f3712e47c94c62836fb89cd4bfb3595fbb41557..148145979d83f67469075df1c8b5e366ffe9d907 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -64,23 +64,6 @@ struct secondary_data secondary_data;
 /* Number of CPUs which aren't online, but looping in kernel text. */
 static int cpus_stuck_in_kernel;
 
-enum ipi_msg_type {
-	IPI_RESCHEDULE,
-	IPI_CALL_FUNC,
-	IPI_CPU_STOP,
-	IPI_CPU_STOP_NMI,
-	IPI_TIMER,
-	IPI_IRQ_WORK,
-	NR_IPI,
-	/*
-	 * Any enum >= NR_IPI and < MAX_IPI is special and not tracable
-	 * with trace_ipi_*
-	 */
-	IPI_CPU_BACKTRACE = NR_IPI,
-	IPI_KGDB_ROUNDUP,
-	MAX_IPI
-};
-
 static int ipi_irq_base __ro_after_init;
 static int nr_ipi __ro_after_init = NR_IPI;
 
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index cec05e443083b8982b3e72f4212d808a22883914..160a4761d5d85f6dbf36f3142fd619c114733e36 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -54,6 +54,11 @@ config ARM_GIC_V3_ITS_FSL_MC
 	depends on FSL_MC_BUS
 	default ARM_GIC_V3_ITS
 
+config ARM_GIC_V5
+	bool
+	select IRQ_DOMAIN_HIERARCHY
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
+
 config ARM_NVIC
 	bool
 	select IRQ_DOMAIN_HIERARCHY
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 365bcea9a61ff89e2cb41034125b3fc8cd494d81..3d9c47fa3fdf40b7452c059d84fe8ac24c91bc0f 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_ARM_GIC_V3)		+= irq-gic-v3.o irq-gic-v3-mbi.o irq-gic-common.o
 obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o irq-gic-v3-its-msi-parent.o
 obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
 obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
+obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o
 obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
 obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
 obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
new file mode 100644
index 0000000000000000000000000000000000000000..7bd60e6d56b77c0c19a1bd9bee9685d9b6ffc959
--- /dev/null
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -0,0 +1,841 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2025 ARM Limited, All Rights Reserved.
+ */
+
+#define pr_fmt(fmt)	"GICv5 IRS: " fmt
+
+#include <linux/iopoll.h>
+#include <linux/irqchip.h>
+#include <linux/log2.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+#include "irq-gic-v5.h"
+
+#define LPI_ID_BITS_LINEAR		12
+
+#define IRS_FLAGS_NON_COHERENT		BIT(0)
+
+static DEFINE_PER_CPU(struct gicv5_irs_chip_data *, per_cpu_irs_data);
+static LIST_HEAD(irs_nodes);
+
+static u32 irs_readl_relaxed(struct gicv5_irs_chip_data *irs_data,
+			     const u64 reg_offset)
+{
+	return readl_relaxed(irs_data->irs_base + reg_offset);
+}
+
+static void irs_writel_relaxed(struct gicv5_irs_chip_data *irs_data,
+			       const u32 val, const u64 reg_offset)
+{
+	writel_relaxed(val, irs_data->irs_base + reg_offset);
+}
+
+static u64 irs_readq_relaxed(struct gicv5_irs_chip_data *irs_data,
+			     const u64 reg_offset)
+{
+	return readq_relaxed(irs_data->irs_base + reg_offset);
+}
+
+static void irs_writeq_relaxed(struct gicv5_irs_chip_data *irs_data,
+			       const u64 val, const u64 reg_offset)
+{
+	writeq_relaxed(val, irs_data->irs_base + reg_offset);
+}
+
+static int gicv5_wait_for_op(void __iomem *addr, u32 offset, u32 mask, u32 *val)
+{
+	void __iomem *reg = addr + offset;
+	u32 tmp;
+	int ret;
+
+	ret = readl_poll_timeout_atomic(reg, tmp, tmp & mask, 1, 10 * USEC_PER_MSEC);
+
+	if (val)
+		*val = tmp;
+
+	return ret;
+}
+
+#define gicv5_irs_wait_for_op(base, reg, mask)				\
+	({								\
+		int ret;						\
+									\
+		ret = gicv5_wait_for_op(base, reg, mask, NULL);		\
+		if (unlikely(ret == -ETIMEDOUT))			\
+			pr_err_ratelimited(#reg" timeout...\n");	\
+		ret;							\
+	 })
+
+/* Wait for completion of an IST change */
+static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data *irs_data)
+{
+	return gicv5_irs_wait_for_op(irs_data->irs_base, GICV5_IRS_IST_STATUSR,
+				     GICV5_IRS_IST_STATUSR_IDLE);
+}
+
+static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data,
+					    unsigned int lpi_id_bits,
+					    unsigned int istsz)
+{
+	size_t l2istsz;
+	u32 n, cfgr;
+	void *ist;
+	u64 baser;
+	int ret;
+
+	/* Taken from GICv5 specifications 10.2.1.13 IRS_IST_BASER */
+	n = max(5, lpi_id_bits + 1 + istsz);
+
+	l2istsz = BIT(n + 1);
+	/*
+	 * Check memory requirements. For a linear IST we cap the
+	 * number of ID bits to a value that should never exceed
+	 * kmalloc interface memory allocation limits, so this
+	 * check is really belt and braces.
+	 */
+	if (l2istsz > KMALLOC_MAX_SIZE) {
+		u8 lpi_id_cap = ilog2(KMALLOC_MAX_SIZE) - 2 + istsz;
+
+		pr_warn("Limiting LPI ID bits from %u to %u\n",
+			lpi_id_bits, lpi_id_cap);
+		lpi_id_bits = lpi_id_cap;
+		l2istsz = KMALLOC_MAX_SIZE;
+	}
+
+	ist = kzalloc(l2istsz, GFP_KERNEL);
+	if (!ist)
+		return -ENOMEM;
+
+	if (irs_data->flags & IRS_FLAGS_NON_COHERENT)
+		dcache_clean_inval_poc((unsigned long)ist,
+				       (unsigned long)ist + l2istsz);
+	else
+		dsb(ishst);
+
+	cfgr = FIELD_PREP(GICV5_IRS_IST_CFGR_STRUCTURE,
+			  GICV5_IRS_IST_CFGR_STRUCTURE_LINEAR)	|
+	       FIELD_PREP(GICV5_IRS_IST_CFGR_ISTSZ, istsz)	|
+	       FIELD_PREP(GICV5_IRS_IST_CFGR_L2SZ,
+			  GICV5_IRS_IST_CFGR_L2SZ_4K)		|
+	       FIELD_PREP(GICV5_IRS_IST_CFGR_LPI_ID_BITS, lpi_id_bits);
+	irs_writel_relaxed(irs_data, cfgr, GICV5_IRS_IST_CFGR);
+
+	gicv5_global_data.ist.l2 = false;
+
+	baser = (virt_to_phys(ist) & GICV5_IRS_IST_BASER_ADDR_MASK) |
+		FIELD_PREP(GICV5_IRS_IST_BASER_VALID, 0x1);
+	irs_writeq_relaxed(irs_data, baser, GICV5_IRS_IST_BASER);
+
+	/*
+	 * The polling wait (in gicv5_wait_for_op()) on a GIC register
+	 * provides the memory barriers (through MMIO accessors)
+	 * required to synchronize CPU and GIC access to IST memory.
+	 */
+	ret = gicv5_irs_ist_wait_for_idle(irs_data);
+	if (ret) {
+		kfree(ist);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __init gicv5_irs_init_ist_two_level(struct gicv5_irs_chip_data *irs_data,
+					       unsigned int lpi_id_bits,
+					       unsigned int istsz,
+					       unsigned int l2sz)
+{
+	__le64 *l1ist;
+	u32 cfgr, n;
+	size_t l1sz;
+	u64 baser;
+	int ret;
+
+	/* Taken from GICv5 specifications 10.2.1.13 IRS_IST_BASER */
+	n = max(5, lpi_id_bits - ((10 - istsz) + (2 * l2sz)) + 2);
+
+	l1sz = BIT(n + 1);
+
+	l1ist = kzalloc(l1sz, GFP_KERNEL);
+	if (!l1ist)
+		return -ENOMEM;
+
+	if (irs_data->flags & IRS_FLAGS_NON_COHERENT)
+		dcache_clean_inval_poc((unsigned long)l1ist,
+				       (unsigned long)l1ist + l1sz);
+	else
+		dsb(ishst);
+
+	cfgr = FIELD_PREP(GICV5_IRS_IST_CFGR_STRUCTURE,
+			  GICV5_IRS_IST_CFGR_STRUCTURE_TWO_LEVEL)	|
+	       FIELD_PREP(GICV5_IRS_IST_CFGR_ISTSZ, istsz)		|
+	       FIELD_PREP(GICV5_IRS_IST_CFGR_L2SZ, l2sz)		|
+	       FIELD_PREP(GICV5_IRS_IST_CFGR_LPI_ID_BITS, lpi_id_bits);
+	irs_writel_relaxed(irs_data, cfgr, GICV5_IRS_IST_CFGR);
+
+	/*
+	 * The L2SZ determine bits required at L2 level. Number of bytes
+	 * required by metadata is reported through istsz - the number of bits
+	 * covered by L2 entries scales accordingly.
+	 */
+	gicv5_global_data.ist.l2_size = BIT(11 + (2 * l2sz) + 1);
+	gicv5_global_data.ist.l2_bits = (10 - istsz) + (2 * l2sz);
+	gicv5_global_data.ist.l1ist_addr = l1ist;
+	gicv5_global_data.ist.l2 = true;
+
+	baser = (virt_to_phys(l1ist) & GICV5_IRS_IST_BASER_ADDR_MASK) |
+		FIELD_PREP(GICV5_IRS_IST_BASER_VALID, 0x1);
+	irs_writeq_relaxed(irs_data, baser, GICV5_IRS_IST_BASER);
+
+	/*
+	 * The polling wait (in gicv5_wait_for_op()) on a GIC register
+	 * provides the memory barriers (through MMIO accessors)
+	 * required to synchronize CPU and GIC access to IST memory.
+	 */
+	ret = gicv5_irs_ist_wait_for_idle(irs_data);
+	if (ret) {
+		kfree(l1ist);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Alloc L2 IST entries on demand.
+ *
+ * Locking/serialization is guaranteed by irqdomain core code by
+ * taking the hierarchical domain struct irq_domain.root->mutex.
+ */
+int gicv5_irs_iste_alloc(const u32 lpi)
+{
+	struct gicv5_irs_chip_data *irs_data;
+	unsigned int index;
+	u32 l2istr, l2bits;
+	__le64 *l1ist;
+	size_t l2size;
+	void *l2ist;
+	int ret;
+
+	if (!gicv5_global_data.ist.l2)
+		return 0;
+
+	irs_data = per_cpu(per_cpu_irs_data, smp_processor_id());
+	if (!irs_data)
+		return -ENOENT;
+
+	l2size = gicv5_global_data.ist.l2_size;
+	l2bits = gicv5_global_data.ist.l2_bits;
+
+	l1ist = gicv5_global_data.ist.l1ist_addr;
+
+	index = lpi >> l2bits;
+
+	if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
+		return 0;
+
+	l2ist = kzalloc(l2size, GFP_KERNEL);
+	if (!l2ist)
+		return -ENOMEM;
+
+	l1ist[index] = cpu_to_le64(virt_to_phys(l2ist) & GICV5_ISTL1E_L2_ADDR_MASK);
+
+	if (irs_data->flags & IRS_FLAGS_NON_COHERENT) {
+		dcache_clean_inval_poc((unsigned long)l2ist,
+				       (unsigned long)l2ist + l2size);
+		dcache_clean_poc((unsigned long)(l1ist + index),
+				 (unsigned long)(l1ist + index) + sizeof(*l1ist));
+	} else {
+		dsb(ishst);
+	}
+
+	l2istr = FIELD_PREP(GICV5_IRS_MAP_L2_ISTR_ID, lpi);
+	irs_writel_relaxed(irs_data, l2istr, GICV5_IRS_MAP_L2_ISTR);
+
+	/*
+	 * The polling wait (in gicv5_wait_for_op()) on a GIC register
+	 * provides the memory barriers (through MMIO accessors)
+	 * required to synchronize CPU and GIC access to IST memory.
+	 */
+	ret = gicv5_irs_ist_wait_for_idle(irs_data);
+	if (ret) {
+		l1ist[index] = 0;
+		kfree(l2ist);
+		return ret;
+	}
+
+	/*
+	 * Make sure we invalidate the cache line pulled before the IRS
+	 * had a chance to update the L1 entry and mark it valid.
+	 */
+	if (irs_data->flags & IRS_FLAGS_NON_COHERENT) {
+		/*
+		 * gicv5_irs_ist_wait_for_idle() includes memory
+		 * barriers (MMIO accessors) required to guarantee that the
+		 * following dcache invalidation is not executed before the
+		 * IST mapping operation has completed.
+		 */
+		dcache_inval_poc((unsigned long)(l1ist + index),
+				 (unsigned long)(l1ist + index) + sizeof(*l1ist));
+	}
+
+	return 0;
+}
+
+/*
+ * Try to match the L2 IST size to the pagesize, and if this is not possible
+ * pick the smallest supported L2 size in order to minimise the requirement for
+ * physically contiguous blocks of memory as page-sized allocations are
+ * guaranteed to be physically contiguous, and are by definition the easiest to
+ * find.
+ *
+ * Fall back to the smallest supported size (in the event that the pagesize
+ * itself is not supported) again serves to make it easier to find physically
+ * contiguous blocks of memory.
+ */
+static int gicv5_irs_l2_sz(u32 idr2)
+{
+	switch (PAGE_SIZE) {
+	case SZ_64K:
+		if (GICV5_IRS_IST_L2SZ_SUPPORT_64KB(idr2))
+			return GICV5_IRS_IST_CFGR_L2SZ_64K;
+		fallthrough;
+	case SZ_16K:
+		if (GICV5_IRS_IST_L2SZ_SUPPORT_16KB(idr2))
+			return GICV5_IRS_IST_CFGR_L2SZ_16K;
+		fallthrough;
+	case SZ_4K:
+		if (GICV5_IRS_IST_L2SZ_SUPPORT_4KB(idr2))
+			return GICV5_IRS_IST_CFGR_L2SZ_4K;
+		if (GICV5_IRS_IST_L2SZ_SUPPORT_16KB(idr2))
+			return GICV5_IRS_IST_CFGR_L2SZ_16K;
+		if (GICV5_IRS_IST_L2SZ_SUPPORT_64KB(idr2))
+			return GICV5_IRS_IST_CFGR_L2SZ_64K;
+		break;
+	}
+
+	return -ENODEV;
+}
+
+static int __init gicv5_irs_init_ist(struct gicv5_irs_chip_data *irs_data)
+{
+	u32 lpi_id_bits, idr2_id_bits, idr2_min_lpi_id_bits,
+	    l2_iste_sz, l2sz, l2_iste_sz_split, idr2;
+	bool two_levels, istmd;
+	u64 baser;
+	int ret;
+
+	baser = irs_readq_relaxed(irs_data, GICV5_IRS_IST_BASER);
+	if (FIELD_GET(GICV5_IRS_IST_BASER_VALID, baser)) {
+		pr_err("IST is marked as valid already; cannot allocate\n");
+		return -EPERM;
+	}
+
+	idr2 = irs_readl_relaxed(irs_data, GICV5_IRS_IDR2);
+
+	two_levels = !!FIELD_GET(GICV5_IRS_IDR2_IST_LEVELS, idr2);
+
+	idr2_id_bits = FIELD_GET(GICV5_IRS_IDR2_ID_BITS, idr2);
+	idr2_min_lpi_id_bits = FIELD_GET(GICV5_IRS_IDR2_MIN_LPI_ID_BITS, idr2);
+
+	/*
+	 * For two level tables we are always allocating the maximum allowed
+	 * number of IDs.
+	 *
+	 * For 1-level tables, we should allocate a number of bits that
+	 * is >= min_lpi_id_bits but cap it to LPI_ID_BITS_LINEAR lest
+	 * the level 1-table gets too large and its memory allocation
+	 * may fail.
+	 */
+	if (two_levels) {
+		lpi_id_bits = idr2_id_bits;
+	} else {
+		lpi_id_bits = max(LPI_ID_BITS_LINEAR, idr2_min_lpi_id_bits);
+		lpi_id_bits = min(lpi_id_bits, idr2_id_bits);
+	}
+
+	/*
+	 * Cap the ID bits according to the CPUIF supported ID bits
+	 */
+	lpi_id_bits = min(lpi_id_bits, gicv5_global_data.cpuif_id_bits);
+
+	if (two_levels) {
+		l2sz = gicv5_irs_l2_sz(idr2);
+		if (l2sz < 0)
+			return l2sz;
+	}
+
+	istmd = !!FIELD_GET(GICV5_IRS_IDR2_ISTMD, idr2);
+
+	l2_iste_sz = GICV5_IRS_IST_CFGR_ISTSZ_4;
+
+	// Only supported if IRS_IDR2.ISTMD is 1
+	if (istmd) {
+		l2_iste_sz_split = FIELD_GET(GICV5_IRS_IDR2_ISTMD_SZ, idr2);
+
+		if (lpi_id_bits < l2_iste_sz_split)
+			l2_iste_sz = GICV5_IRS_IST_CFGR_ISTSZ_8;
+		else
+			l2_iste_sz = GICV5_IRS_IST_CFGR_ISTSZ_16;
+	}
+
+	/*
+	 * Follow GICv5 specification recommendation to opt in for two
+	 * level tables
+	 */
+	two_levels = two_levels && (lpi_id_bits > ((10 - l2_iste_sz) + (2 * l2sz)));
+
+	if (two_levels)
+		ret = gicv5_irs_init_ist_two_level(irs_data, lpi_id_bits,
+						   l2_iste_sz, l2sz);
+	else
+		ret = gicv5_irs_init_ist_linear(irs_data, lpi_id_bits,
+						l2_iste_sz);
+	if (ret)
+		return ret;
+
+	gicv5_init_lpis(BIT(lpi_id_bits));
+
+	return 0;
+}
+
+struct iaffid_entry {
+	u16	iaffid;
+	bool	valid;
+};
+
+static DEFINE_PER_CPU(struct iaffid_entry, cpu_iaffid);
+
+int gicv5_irs_cpu_to_iaffid(int cpuid, u16 *iaffid)
+{
+	if (!per_cpu(cpu_iaffid, cpuid).valid) {
+		pr_err("IAFFID for CPU %d has not been initialised\n", cpuid);
+		return -ENODEV;
+	}
+
+	*iaffid = per_cpu(cpu_iaffid, cpuid).iaffid;
+
+	return 0;
+}
+
+struct gicv5_irs_chip_data *gicv5_irs_lookup_by_spi_id(u32 spi_id)
+{
+	struct gicv5_irs_chip_data *irs_data;
+	u32 min, max;
+
+	list_for_each_entry(irs_data, &irs_nodes, entry) {
+		if (!irs_data->spi_range)
+			continue;
+
+		min = irs_data->spi_min;
+		max = irs_data->spi_min + irs_data->spi_range - 1;
+		if (spi_id >= min && spi_id <= max)
+			return irs_data;
+	}
+
+	return NULL;
+}
+
+static int gicv5_irs_wait_for_spi_op(struct gicv5_irs_chip_data *irs_data)
+{
+	u32 statusr;
+	int ret;
+
+	ret = gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_SPI_STATUSR,
+				GICV5_IRS_SPI_STATUSR_IDLE, &statusr);
+	if (unlikely(ret == -ETIMEDOUT)) {
+		pr_err_ratelimited("IRS_SPI_STATUSR timeout\n");
+		return ret;
+	}
+
+	return !!FIELD_GET(GICV5_IRS_SPI_STATUSR_V, statusr) ? 0 : -ENXIO;
+}
+
+static int gicv5_irs_wait_for_irs_pe(struct gicv5_irs_chip_data *irs_data,
+				     bool selr)
+{
+	u32 statusr;
+	bool valid;
+	int ret;
+
+	ret = gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_PE_STATUSR,
+				GICV5_IRS_PE_STATUSR_IDLE, &statusr);
+
+	if (unlikely(ret == -ETIMEDOUT)) {
+		pr_err_ratelimited("IRS_PE_STATUSR timeout after %s\n",
+				   selr ? "IRS_PE_SELR" : "IRS_PE_CR0");
+		return ret;
+	}
+
+	if (selr) {
+		valid = !!FIELD_GET(GICV5_IRS_PE_STATUSR_V, statusr);
+		return valid ? 0 : -ENXIO;
+	}
+
+	return 0;
+}
+
+static int gicv5_irs_wait_for_pe_selr(struct gicv5_irs_chip_data *irs_data)
+{
+	return gicv5_irs_wait_for_irs_pe(irs_data, true);
+}
+
+static int gicv5_irs_wait_for_pe_cr0(struct gicv5_irs_chip_data *irs_data)
+{
+	return gicv5_irs_wait_for_irs_pe(irs_data, false);
+}
+
+int gicv5_spi_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gicv5_irs_chip_data *irs_data = d->chip_data;
+	u32 selr, cfgr;
+	bool level;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_EDGE_FALLING:
+		level = false;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+	case IRQ_TYPE_LEVEL_LOW:
+		level = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	guard(raw_spinlock)(&irs_data->spi_config_lock);
+
+	selr = FIELD_PREP(GICV5_IRS_SPI_SELR_ID, d->hwirq);
+	irs_writel_relaxed(irs_data, selr, GICV5_IRS_SPI_SELR);
+	if (gicv5_irs_wait_for_spi_op(irs_data))
+		return -EIO;
+
+	cfgr = FIELD_PREP(GICV5_IRS_SPI_CFGR_TM, level);
+
+	irs_writel_relaxed(irs_data, cfgr, GICV5_IRS_SPI_CFGR);
+	if (gicv5_irs_wait_for_spi_op(irs_data))
+		return -EPERM;
+
+	return 0;
+}
+
+static int gicv5_irs_wait_for_idle(struct gicv5_irs_chip_data *irs_data)
+{
+	return gicv5_irs_wait_for_op(irs_data->irs_base, GICV5_IRS_CR0,
+				     GICV5_IRS_CR0_IDLE);
+}
+
+int gicv5_irs_register_cpu(int cpuid)
+{
+	struct gicv5_irs_chip_data *irs_data;
+	u32 selr, cr0;
+	u16 iaffid;
+	int ret;
+
+	ret = gicv5_irs_cpu_to_iaffid(cpuid, &iaffid);
+	if (ret) {
+		pr_err("IAFFID for CPU %d has not been initialised\n", cpuid);
+		return ret;
+	}
+
+	irs_data = per_cpu(per_cpu_irs_data, cpuid);
+	if (!irs_data) {
+		pr_err("No IRS associated with CPU %u\n", cpuid);
+		return -ENXIO;
+	}
+
+	selr = FIELD_PREP(GICV5_IRS_PE_SELR_IAFFID, iaffid);
+	irs_writel_relaxed(irs_data, selr, GICV5_IRS_PE_SELR);
+
+	ret = gicv5_irs_wait_for_pe_selr(irs_data);
+	if (ret) {
+		pr_err("IAFFID 0x%x used in IRS_PE_SELR is invalid\n", iaffid);
+		return -ENXIO;
+	}
+
+	cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
+	irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
+
+	ret = gicv5_irs_wait_for_pe_cr0(irs_data);
+	if (ret)
+		return ret;
+
+	pr_debug("CPU%d enabled PE IAFFID 0x%x\n", cpuid, iaffid);
+
+	return 0;
+}
+
+static int __init gicv5_irs_init_bases(struct gicv5_irs_chip_data *irs_data,
+				       void __iomem *irs_base,
+				       struct fwnode_handle *handle)
+{
+	struct device_node *np = to_of_node(handle);
+	u32 cr0, cr1;
+
+	irs_data->fwnode = handle;
+	irs_data->irs_base = irs_base;
+
+	if (of_property_read_bool(np, "dma-noncoherent")) {
+		/*
+		 * A non-coherent IRS implies that some cache levels cannot be
+		 * used coherently by the cores and GIC. Our only option is to mark
+		 * memory attributes for the GIC as non-cacheable; by default,
+		 * non-cacheable memory attributes imply outer-shareable
+		 * shareability, the value written into IRS_CR1_SH is ignored.
+		 */
+		cr1 = FIELD_PREP(GICV5_IRS_CR1_VPED_WA, GICV5_NO_WRITE_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VPED_RA, GICV5_NO_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VMD_WA, GICV5_NO_WRITE_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VMD_RA, GICV5_NO_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VPET_RA, GICV5_NO_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VMT_RA, GICV5_NO_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_IST_WA, GICV5_NO_WRITE_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_IST_RA, GICV5_NO_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_IC, GICV5_NON_CACHE)		|
+			FIELD_PREP(GICV5_IRS_CR1_OC, GICV5_NON_CACHE);
+			irs_data->flags |= IRS_FLAGS_NON_COHERENT;
+	} else {
+		cr1 = FIELD_PREP(GICV5_IRS_CR1_VPED_WA, GICV5_WRITE_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VPED_RA, GICV5_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VMD_WA, GICV5_WRITE_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VMD_RA, GICV5_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VPET_RA, GICV5_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_VMT_RA, GICV5_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_IST_WA, GICV5_WRITE_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_IST_RA, GICV5_READ_ALLOC)	|
+			FIELD_PREP(GICV5_IRS_CR1_IC, GICV5_WB_CACHE)		|
+			FIELD_PREP(GICV5_IRS_CR1_OC, GICV5_WB_CACHE)		|
+			FIELD_PREP(GICV5_IRS_CR1_SH, GICV5_INNER_SHARE);
+	}
+
+	irs_writel_relaxed(irs_data, cr1, GICV5_IRS_CR1);
+
+	cr0 = FIELD_PREP(GICV5_IRS_CR0_IRSEN, 0x1);
+	irs_writel_relaxed(irs_data, cr0, GICV5_IRS_CR0);
+	gicv5_irs_wait_for_idle(irs_data);
+
+	return 0;
+}
+
+static int __init gicv5_irs_of_init_affinity(struct device_node *node,
+					     struct gicv5_irs_chip_data *irs_data,
+					     u8 iaffid_bits)
+{
+	/*
+	 * Detect IAFFID<->CPU mappings from the device tree and
+	 * record IRS<->CPU topology information.
+	 */
+	u16 iaffid_mask = GENMASK(iaffid_bits - 1, 0);
+	u16 *iaffids __free(kfree) = NULL;
+	int ret, i, ncpus, niaffids;
+
+	ncpus = of_property_count_elems_of_size(node, "cpus", sizeof(u32));
+	if (ncpus < 0)
+		return -EINVAL;
+
+	niaffids = of_property_count_elems_of_size(node, "arm,iaffids",
+						   sizeof(u16));
+	if (niaffids != ncpus)
+		return -EINVAL;
+
+	iaffids = kcalloc(niaffids, sizeof(*iaffids), GFP_KERNEL);
+	if (!iaffids)
+		return -ENOMEM;
+
+	ret = of_property_read_u16_array(node, "arm,iaffids", iaffids, niaffids);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ncpus; i++) {
+		struct device_node *cpu_node;
+		u32 cpu_phandle;
+		int cpu;
+
+		if (of_property_read_u32_index(node, "cpus", i, &cpu_phandle))
+			continue;
+
+		cpu_node = of_find_node_by_phandle(cpu_phandle);
+		if (WARN_ON(!cpu_node))
+			continue;
+
+		cpu = of_cpu_node_to_id(cpu_node);
+		of_node_put(cpu_node);
+		if (WARN_ON(cpu < 0))
+			continue;
+
+		if (iaffids[i] & ~iaffid_mask) {
+			pr_warn("CPU %d iaffid 0x%x exceeds IRS iaffid bits\n",
+				cpu, iaffids[i]);
+			continue;
+		}
+
+		per_cpu(cpu_iaffid, cpu).iaffid = iaffids[i];
+		per_cpu(cpu_iaffid, cpu).valid = true;
+
+		// We also know that the CPU is connected to this IRS
+		per_cpu(per_cpu_irs_data, cpu) = irs_data;
+	}
+
+	return ret;
+}
+
+static void irs_setup_pri_bits(u32 idr1)
+{
+	switch (FIELD_GET(GICV5_IRS_IDR1_PRIORITY_BITS, idr1)) {
+	case GICV5_IRS_IDR1_PRIORITY_BITS_1BITS:
+		gicv5_global_data.irs_pri_bits = 1;
+		break;
+	case GICV5_IRS_IDR1_PRIORITY_BITS_2BITS:
+		gicv5_global_data.irs_pri_bits = 2;
+		break;
+	case GICV5_IRS_IDR1_PRIORITY_BITS_3BITS:
+		gicv5_global_data.irs_pri_bits = 3;
+		break;
+	case GICV5_IRS_IDR1_PRIORITY_BITS_4BITS:
+		gicv5_global_data.irs_pri_bits = 4;
+		break;
+	case GICV5_IRS_IDR1_PRIORITY_BITS_5BITS:
+		gicv5_global_data.irs_pri_bits = 5;
+		break;
+	default:
+		pr_warn("Detected wrong IDR priority bits value 0x%lx\n",
+			FIELD_GET(GICV5_IRS_IDR1_PRIORITY_BITS, idr1));
+		break;
+	}
+}
+
+static int __init gicv5_irs_init(struct device_node *node)
+{
+	struct gicv5_irs_chip_data *irs_data;
+	void __iomem *irs_base;
+	u8 iaffid_bits;
+	int ret;
+	u32 idr;
+
+	irs_data = kzalloc(sizeof(*irs_data), GFP_KERNEL);
+	if (!irs_data)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&irs_data->spi_config_lock);
+
+	irs_base = of_io_request_and_map(node, 0, "IRS");
+	if (IS_ERR(irs_base)) {
+		pr_err("%pOF: unable to map GICv5 IRS registers\n", node);
+		ret = PTR_ERR(irs_base);
+		goto out_err;
+	}
+
+	gicv5_irs_init_bases(irs_data, irs_base, &node->fwnode);
+
+	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
+	iaffid_bits = FIELD_GET(GICV5_IRS_IDR1_IAFFID_BITS, idr) + 1;
+
+	ret = gicv5_irs_of_init_affinity(node, irs_data, iaffid_bits);
+	if (ret) {
+		pr_err("Failed to parse CPU IAFFIDs from the device tree!\n");
+		goto out_iomem;
+	}
+
+	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR2);
+	if (WARN(!FIELD_GET(GICV5_IRS_IDR2_LPI, idr),
+		 "LPI support not available - no IPIs, can't proceed\n")) {
+		ret = -ENODEV;
+		goto out_iomem;
+	}
+
+	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR7);
+	irs_data->spi_min = FIELD_GET(GICV5_IRS_IDR7_SPI_BASE, idr);
+
+	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR6);
+	irs_data->spi_range = FIELD_GET(GICV5_IRS_IDR6_SPI_IRS_RANGE, idr);
+
+	if (irs_data->spi_range) {
+		pr_info("%s detected SPI range [%u-%u]\n",
+						of_node_full_name(node),
+						irs_data->spi_min,
+						irs_data->spi_min +
+						irs_data->spi_range - 1);
+	}
+
+	/*
+	 * Do the global setting only on the first IRS.
+	 * Global properties (iaffid_bits, global spi count) are guaranteed to
+	 * be consistent across IRSes by the architecture.
+	 */
+	if (list_empty(&irs_nodes)) {
+
+		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
+		irs_setup_pri_bits(idr);
+
+		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR5);
+		gicv5_global_data.global_spi_count =
+			FIELD_GET(GICV5_IRS_IDR5_SPI_RANGE, idr);
+
+		gicv5_init_lpi_domain();
+
+		pr_debug("Detected %u SPIs globally\n",
+			 gicv5_global_data.global_spi_count);
+	}
+
+	list_add_tail(&irs_data->entry, &irs_nodes);
+
+	return 0;
+out_iomem:
+	iounmap(irs_base);
+out_err:
+	kfree(irs_data);
+	return ret;
+}
+
+void __init gicv5_irs_remove(void)
+{
+	struct gicv5_irs_chip_data *irs_data, *tmp_data;
+
+	gicv5_free_lpi_domain();
+	gicv5_deinit_lpis();
+
+	list_for_each_entry_safe(irs_data, tmp_data, &irs_nodes, entry) {
+		iounmap(irs_data->irs_base);
+		list_del(&irs_data->entry);
+		kfree(irs_data);
+	}
+}
+
+int __init gicv5_irs_enable(void)
+{
+	struct gicv5_irs_chip_data *irs_data;
+	int ret;
+
+	irs_data = list_first_entry_or_null(&irs_nodes,
+					    struct gicv5_irs_chip_data, entry);
+	if (!irs_data)
+		return -ENODEV;
+
+	ret = gicv5_irs_init_ist(irs_data);
+	if (ret) {
+		pr_err("Failed to init IST\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+int __init gicv5_irs_of_probe(struct device_node *parent)
+{
+	struct device_node *np;
+	int ret;
+
+	for_each_available_child_of_node(parent, np) {
+		if (!of_device_is_compatible(np, "arm,gic-v5-irs"))
+			continue;
+
+		ret = gicv5_irs_init(np);
+		if (ret)
+			pr_err("Failed to init IRS %s\n", np->full_name);
+	}
+
+	return list_empty(&irs_nodes) ? -ENODEV : 0;
+}
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
new file mode 100644
index 0000000000000000000000000000000000000000..c4d4e85382f672fa4ae334db1a4e4c7c4f46b9fe
--- /dev/null
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -0,0 +1,1058 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2025 ARM Limited, All Rights Reserved.
+ */
+
+#define pr_fmt(fmt)	"GICv5: " fmt
+
+#include <linux/cpuhotplug.h>
+#include <linux/idr.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/slab.h>
+#include <linux/wordpart.h>
+
+#include <asm/cpufeature.h>
+#include <asm/exception.h>
+
+#include "irq-gic-v5.h"
+
+static u8 pri_bits = 5;
+#define GICV5_IRQ_PRI_MASK 0x1f
+#define GICV5_IRQ_PRI_MI \
+		(GICV5_IRQ_PRI_MASK & GENMASK(4, 5 - pri_bits))
+
+static bool gicv5_cpuif_has_gcie(void)
+{
+	return this_cpu_has_cap(ARM64_HAS_GICV5_CPUIF);
+}
+
+struct gicv5_chip_data gicv5_global_data __read_mostly;
+
+static DEFINE_IDA(lpi_ida);
+static u32 num_lpis;
+
+void __init gicv5_init_lpis(u32 lpis)
+{
+	num_lpis = lpis;
+}
+
+void __init gicv5_deinit_lpis(void)
+{
+	num_lpis = 0;
+}
+
+static int alloc_lpi(void)
+{
+	if (!num_lpis)
+		return -ENOSPC;
+
+	return ida_alloc_max(&lpi_ida, num_lpis - 1, GFP_KERNEL);
+}
+
+static void release_lpi(u32 lpi)
+{
+	ida_free(&lpi_ida, lpi);
+}
+
+static int gicv5_alloc_lpi(void)
+{
+	return alloc_lpi();
+}
+
+static void gicv5_free_lpi(u32 lpi)
+{
+	release_lpi(lpi);
+}
+
+static void gicv5_ppi_priority_init(void)
+{
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR0_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR1_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR2_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR3_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR4_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR5_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR6_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR7_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR8_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR9_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR10_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR11_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR12_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR13_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR14_EL1);
+	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRI_MI), SYS_ICC_PPI_PRIORITYR15_EL1);
+
+	/*
+	 * Context syncronization required to mare system
+	 * register writes effects are synchronized
+	 */
+	isb();
+}
+
+static void gicv5_hwirq_init(irq_hw_number_t hwirq, u8 priority, u8 hwirq_type)
+{
+	u64 cdpri, cdaff;
+	u16 iaffid;
+	int ret;
+
+	if (hwirq_type == GICV5_HWIRQ_TYPE_LPI || hwirq_type == GICV5_HWIRQ_TYPE_SPI) {
+		cdpri = FIELD_PREP(GICV5_GIC_CDPRI_PRIORITY_MASK, priority)	|
+			FIELD_PREP(GICV5_GIC_CDPRI_TYPE_MASK, hwirq_type)	|
+			FIELD_PREP(GICV5_GIC_CDPRI_ID_MASK, hwirq);
+		gic_insn(cdpri, GICV5_OP_GIC_CDPRI);
+
+		ret = gicv5_irs_cpu_to_iaffid(smp_processor_id(), &iaffid);
+
+		if (WARN_ON_ONCE(ret))
+			return;
+
+		cdaff = FIELD_PREP(GICV5_GIC_CDAFF_IAFFID_MASK, iaffid)		|
+			FIELD_PREP(GICV5_GIC_CDAFF_TYPE_MASK, hwirq_type)	|
+			FIELD_PREP(GICV5_GIC_CDAFF_ID_MASK, hwirq);
+		gic_insn(cdaff, GICV5_OP_GIC_CDAFF);
+	}
+}
+
+static void gicv5_ppi_irq_mask(struct irq_data *d)
+{
+	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
+
+	if (d->hwirq < 64)
+		sysreg_clear_set_s(SYS_ICC_PPI_ENABLER0_EL1, hwirq_id_bit, 0);
+	else
+		sysreg_clear_set_s(SYS_ICC_PPI_ENABLER1_EL1, hwirq_id_bit, 0);
+
+	/*
+	 * Ensure that the disable takes effect
+	 */
+	isb();
+}
+
+static void gicv5_iri_irq_mask(struct irq_data *d, u8 hwirq_type)
+{
+	u64 cddis = d->hwirq | FIELD_PREP(GICV5_GIC_CDDIS_TYPE_MASK, hwirq_type);
+
+	gic_insn(cddis, GICV5_OP_GIC_CDDIS);
+	/*
+	 * We must make sure that GIC CDDIS write effects are propagated
+	 */
+	gsb_sys();
+}
+
+static void gicv5_spi_irq_mask(struct irq_data *d)
+{
+	gicv5_iri_irq_mask(d, GICV5_HWIRQ_TYPE_SPI);
+}
+
+static void gicv5_lpi_irq_mask(struct irq_data *d)
+{
+	gicv5_iri_irq_mask(d, GICV5_HWIRQ_TYPE_LPI);
+}
+
+static void gicv5_ppi_irq_unmask(struct irq_data *d)
+{
+	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
+
+	if (d->hwirq < 64)
+		sysreg_clear_set_s(SYS_ICC_PPI_ENABLER0_EL1, 0, hwirq_id_bit);
+	else
+		sysreg_clear_set_s(SYS_ICC_PPI_ENABLER1_EL1, 0, hwirq_id_bit);
+}
+
+static void gicv5_iri_irq_unmask(struct irq_data *d, u8 hwirq_type)
+{
+	u64 cden = d->hwirq | FIELD_PREP(GICV5_GIC_CDEN_TYPE_MASK, hwirq_type);
+
+	gic_insn(cden, GICV5_OP_GIC_CDEN);
+}
+
+static void gicv5_spi_irq_unmask(struct irq_data *d)
+{
+	gicv5_iri_irq_unmask(d, GICV5_HWIRQ_TYPE_SPI);
+}
+
+static void gicv5_lpi_irq_unmask(struct irq_data *d)
+{
+	gicv5_iri_irq_unmask(d, GICV5_HWIRQ_TYPE_LPI);
+}
+
+static void gicv5_hwirq_eoi(u32 hwirq_id, u8 hwirq_type)
+{
+	u64 cddi = hwirq_id | FIELD_PREP(GICV5_GIC_CDDI_TYPE_MASK, hwirq_type);
+
+	gic_insn(cddi, GICV5_OP_GIC_CDDI);
+
+	gic_insn(0, GICV5_OP_GIC_CDEOI);
+}
+
+static void gicv5_ppi_irq_eoi(struct irq_data *d)
+{
+	gicv5_hwirq_eoi(d->hwirq, GICV5_HWIRQ_TYPE_PPI);
+}
+
+static void gicv5_spi_irq_eoi(struct irq_data *d)
+{
+	gicv5_hwirq_eoi(d->hwirq, GICV5_HWIRQ_TYPE_SPI);
+}
+
+static void gicv5_lpi_irq_eoi(struct irq_data *d)
+{
+	gicv5_hwirq_eoi(d->hwirq, GICV5_HWIRQ_TYPE_LPI);
+}
+
+static int gicv5_iri_irq_set_affinity(struct irq_data *d,
+				      const struct cpumask *mask_val,
+				      bool force, u8 hwirq_type)
+{
+	int ret, cpuid;
+	u16 iaffid;
+	u64 cdaff;
+
+	if (force)
+		cpuid = cpumask_first(mask_val);
+	else
+		cpuid = cpumask_any_and(mask_val, cpu_online_mask);
+
+	ret = gicv5_irs_cpu_to_iaffid(cpuid, &iaffid);
+	if (ret)
+		return ret;
+
+	cdaff = FIELD_PREP(GICV5_GIC_CDAFF_IAFFID_MASK, iaffid)		|
+		FIELD_PREP(GICV5_GIC_CDAFF_TYPE_MASK, hwirq_type)	|
+		FIELD_PREP(GICV5_GIC_CDAFF_ID_MASK, d->hwirq);
+	gic_insn(cdaff, GICV5_OP_GIC_CDAFF);
+
+	irq_data_update_effective_affinity(d, cpumask_of(cpuid));
+
+	return IRQ_SET_MASK_OK_DONE;
+}
+
+static int gicv5_spi_irq_set_affinity(struct irq_data *d,
+				      const struct cpumask *mask_val,
+				      bool force)
+{
+	return gicv5_iri_irq_set_affinity(d, mask_val, force,
+					  GICV5_HWIRQ_TYPE_SPI);
+}
+
+static int gicv5_lpi_irq_set_affinity(struct irq_data *d,
+				      const struct cpumask *mask_val,
+				      bool force)
+{
+	return gicv5_iri_irq_set_affinity(d, mask_val, force,
+					  GICV5_HWIRQ_TYPE_LPI);
+}
+
+#define READ_PPI_REG(irq, reg)						\
+	({								\
+		u64 val;						\
+									\
+		if (irq < 64)						\
+			val = read_sysreg_s(SYS_ICC_PPI_##reg##R0_EL1);	\
+		else							\
+			val = read_sysreg_s(SYS_ICC_PPI_##reg##R1_EL1);	\
+		val;							\
+	})
+
+#define WRITE_PPI_REG(set, irq, bit, reg)					\
+	do {									\
+		if (set) {							\
+			if (irq < 64)						\
+				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R0_EL1);\
+			else							\
+				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R1_EL1);\
+		} else {							\
+			if (irq < 64)						\
+				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R0_EL1);\
+			else							\
+				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R1_EL1);\
+		}								\
+	} while (0)
+
+static int gicv5_ppi_set_type(struct irq_data *d, unsigned int type)
+{
+	/*
+	 * The PPI trigger mode is not configurable at runtime,
+	 * therefore this function simply confirms that the `type`
+	 * parameter matches what is present.
+	 */
+	u64 hmr = READ_PPI_REG(d->hwirq, HM);
+
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+	case IRQ_TYPE_LEVEL_LOW:
+		if (((hmr >> (d->hwirq % 64)) & 0x1) != GICV5_PPI_HM_LEVEL)
+			return -EINVAL;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_EDGE_FALLING:
+		if (((hmr >> (d->hwirq % 64)) & 0x1) != GICV5_PPI_HM_EDGE)
+			return -EINVAL;
+		break;
+	default:
+		pr_debug("Unexpected PPI trigger mode");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int gicv5_ppi_irq_get_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool *val)
+{
+	u64 pendr, activer, enabler, hwirq_id_bit = BIT_ULL(d->hwirq % 64);
+
+	switch (which) {
+	case IRQCHIP_STATE_PENDING:
+		pendr = READ_PPI_REG(d->hwirq, SPEND);
+
+		*val = !!(pendr & hwirq_id_bit);
+
+		return 0;
+	case IRQCHIP_STATE_ACTIVE:
+		activer = READ_PPI_REG(d->hwirq, SACTIVE);
+
+		*val = !!(activer & hwirq_id_bit);
+
+		return 0;
+	case IRQCHIP_STATE_MASKED:
+		enabler = READ_PPI_REG(d->hwirq, ENABLE);
+
+		*val = !(enabler & hwirq_id_bit);
+
+		return 0;
+	default:
+		pr_debug("Unexpected PPI irqchip state\n");
+		return -EINVAL;
+	}
+
+	return -EINVAL;
+}
+
+static int gicv5_iri_irq_get_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool *val, u8 hwirq_type)
+{
+	u64 icsr, cdrcfg;
+
+	cdrcfg = d->hwirq | FIELD_PREP(GICV5_GIC_CDRCFG_TYPE_MASK, hwirq_type);
+
+	gic_insn(cdrcfg, GICV5_OP_GIC_CDRCFG);
+	isb();
+	icsr = read_sysreg_s(SYS_ICC_ICSR_EL1);
+
+	if (FIELD_GET(ICC_ICSR_EL1_F, icsr)) {
+		pr_err("ICSR_EL1 is invalid\n");
+		return -EINVAL;
+	}
+
+	switch (which) {
+	case IRQCHIP_STATE_PENDING:
+		*val = !!(FIELD_GET(ICC_ICSR_EL1_Pending, icsr));
+		return 0;
+
+	case IRQCHIP_STATE_ACTIVE:
+		*val = !!(FIELD_GET(ICC_ICSR_EL1_Active, icsr));
+		return 0;
+
+	case IRQCHIP_STATE_MASKED:
+		*val = !(FIELD_GET(ICC_ICSR_EL1_Enabled, icsr));
+		return 0;
+
+	default:
+		pr_debug("Unexpected irqchip_irq_state\n");
+		return -EINVAL;
+	}
+
+	return -EINVAL;
+}
+
+static int gicv5_spi_irq_get_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool *val)
+{
+	return gicv5_iri_irq_get_irqchip_state(d, which, val,
+					       GICV5_HWIRQ_TYPE_SPI);
+}
+
+static int gicv5_lpi_irq_get_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool *val)
+{
+	return gicv5_iri_irq_get_irqchip_state(d, which, val,
+					       GICV5_HWIRQ_TYPE_LPI);
+}
+
+static int gicv5_ppi_irq_set_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool val)
+{
+	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
+
+	switch (which) {
+	case IRQCHIP_STATE_PENDING:
+		WRITE_PPI_REG(val, d->hwirq, hwirq_id_bit, PEND);
+		return 0;
+	case IRQCHIP_STATE_ACTIVE:
+		WRITE_PPI_REG(val, d->hwirq, hwirq_id_bit, ACTIVE);
+		return 0;
+	case IRQCHIP_STATE_MASKED:
+		if (val)
+			gicv5_ppi_irq_mask(d);
+		else
+			gicv5_ppi_irq_unmask(d);
+		return 0;
+	default:
+		pr_debug("Unexpected PPI irqchip state\n");
+		return -EINVAL;
+	}
+
+	return -EINVAL;
+}
+
+static void gicv5_iri_irq_write_pending_state(struct irq_data *d, bool val,
+					      u8 hwirq_type)
+{
+	u64 cdpend;
+
+	cdpend = FIELD_PREP(GICV5_GIC_CDPEND_TYPE_MASK, hwirq_type)	|
+		 FIELD_PREP(GICV5_GIC_CDPEND_ID_MASK, d->hwirq)		|
+		 FIELD_PREP(GICV5_GIC_CDPEND_PENDING_MASK, val);
+
+	gic_insn(cdpend, GICV5_OP_GIC_CDPEND);
+}
+
+static void gicv5_spi_irq_write_pending_state(struct irq_data *d, bool val)
+{
+	gicv5_iri_irq_write_pending_state(d, val, GICV5_HWIRQ_TYPE_SPI);
+}
+
+static void gicv5_lpi_irq_write_pending_state(struct irq_data *d, bool val)
+{
+	gicv5_iri_irq_write_pending_state(d, val, GICV5_HWIRQ_TYPE_LPI);
+}
+
+static int gicv5_spi_irq_set_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool val)
+{
+	switch (which) {
+	case IRQCHIP_STATE_PENDING:
+		gicv5_spi_irq_write_pending_state(d, val);
+		break;
+	case IRQCHIP_STATE_MASKED:
+		if (val)
+			gicv5_spi_irq_mask(d);
+		else
+			gicv5_spi_irq_unmask(d);
+		break;
+	default:
+		pr_debug("Unexpected irqchip_irq_state\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int gicv5_lpi_irq_set_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool val)
+{
+	switch (which) {
+	case IRQCHIP_STATE_PENDING:
+		gicv5_lpi_irq_write_pending_state(d, val);
+		break;
+	case IRQCHIP_STATE_MASKED:
+		if (val)
+			gicv5_lpi_irq_mask(d);
+		else
+			gicv5_lpi_irq_unmask(d);
+		break;
+
+	default:
+		pr_debug("Unexpected irqchip_irq_state\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int gicv5_spi_irq_retrigger(struct irq_data *data)
+{
+	return !gicv5_spi_irq_set_irqchip_state(data, IRQCHIP_STATE_PENDING,
+						true);
+}
+
+static int gicv5_lpi_irq_retrigger(struct irq_data *data)
+{
+	return !gicv5_lpi_irq_set_irqchip_state(data, IRQCHIP_STATE_PENDING,
+						true);
+}
+
+static void gicv5_ipi_send_single(struct irq_data *d, unsigned int cpu)
+{
+	/* Mark the LPI pending */
+	irq_chip_retrigger_hierarchy(d);
+}
+
+static const struct irq_chip gicv5_ppi_irq_chip = {
+	.name			= "GICv5-PPI",
+	.irq_mask		= gicv5_ppi_irq_mask,
+	.irq_unmask		= gicv5_ppi_irq_unmask,
+	.irq_eoi		= gicv5_ppi_irq_eoi,
+	.irq_set_type		= gicv5_ppi_set_type,
+	.irq_get_irqchip_state	= gicv5_ppi_irq_get_irqchip_state,
+	.irq_set_irqchip_state	= gicv5_ppi_irq_set_irqchip_state,
+	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE	  |
+				  IRQCHIP_MASK_ON_SUSPEND
+};
+
+static const struct irq_chip gicv5_spi_irq_chip = {
+	.name			= "GICv5-SPI",
+	.irq_mask		= gicv5_spi_irq_mask,
+	.irq_unmask		= gicv5_spi_irq_unmask,
+	.irq_eoi		= gicv5_spi_irq_eoi,
+	.irq_set_type		= gicv5_spi_irq_set_type,
+	.irq_set_affinity	= gicv5_spi_irq_set_affinity,
+	.irq_retrigger		= gicv5_spi_irq_retrigger,
+	.irq_get_irqchip_state	= gicv5_spi_irq_get_irqchip_state,
+	.irq_set_irqchip_state	= gicv5_spi_irq_set_irqchip_state,
+	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE	  |
+				  IRQCHIP_MASK_ON_SUSPEND
+};
+
+static int gicv5_irq_domain_translate(struct irq_domain *d,
+				      struct irq_fwspec *fwspec,
+				      irq_hw_number_t *hwirq,
+				      unsigned int *type,
+				      u8 hwirq_type)
+{
+	if (!is_of_node(fwspec->fwnode))
+		return -EINVAL;
+
+	if (fwspec->param_count < 3)
+		return -EINVAL;
+
+	if (fwspec->param[0] != hwirq_type)
+		return -EINVAL;
+
+	*hwirq = fwspec->param[1];
+	*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+
+	return 0;
+}
+
+static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
+					  struct irq_fwspec *fwspec,
+					  irq_hw_number_t *hwirq,
+					  unsigned int *type)
+{
+	return gicv5_irq_domain_translate(d, fwspec, hwirq, type,
+					  GICV5_HWIRQ_TYPE_PPI);
+}
+
+static int gicv5_irq_ppi_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				      unsigned int nr_irqs, void *arg)
+{
+	unsigned int type = IRQ_TYPE_NONE;
+	struct irq_fwspec *fwspec = arg;
+	irq_hw_number_t hwirq;
+	int ret;
+
+	if (WARN_ON_ONCE(nr_irqs != 1))
+		return -EINVAL;
+
+	ret = gicv5_irq_ppi_domain_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	irq_set_percpu_devid(virq);
+	irq_domain_set_info(domain, virq, hwirq, &gicv5_ppi_irq_chip, NULL,
+			    handle_percpu_devid_irq, NULL, NULL);
+
+	return 0;
+}
+
+static void gicv5_irq_domain_free(struct irq_domain *domain, unsigned int virq,
+				  unsigned int nr_irqs)
+{
+	struct irq_data *d;
+
+	if (WARN_ON_ONCE(nr_irqs != 1))
+		return;
+
+	d = irq_domain_get_irq_data(domain, virq);
+
+	irq_set_handler(virq, NULL);
+	irq_domain_reset_irq_data(d);
+}
+
+static int gicv5_irq_ppi_domain_select(struct irq_domain *d, struct irq_fwspec *fwspec,
+				       enum irq_domain_bus_token bus_token)
+{
+	if (fwspec->fwnode != d->fwnode)
+		return 0;
+
+	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI)
+		return 0;
+
+	return (d == gicv5_global_data.ppi_domain);
+}
+
+static const struct irq_domain_ops gicv5_irq_ppi_domain_ops = {
+	.translate	= gicv5_irq_ppi_domain_translate,
+	.alloc		= gicv5_irq_ppi_domain_alloc,
+	.free		= gicv5_irq_domain_free,
+	.select		= gicv5_irq_ppi_domain_select
+};
+
+static int gicv5_irq_spi_domain_translate(struct irq_domain *d,
+					  struct irq_fwspec *fwspec,
+					  irq_hw_number_t *hwirq,
+					  unsigned int *type)
+{
+	return gicv5_irq_domain_translate(d, fwspec, hwirq, type,
+					  GICV5_HWIRQ_TYPE_SPI);
+}
+
+static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain,
+				      unsigned int virq, unsigned int nr_irqs,
+				      void *arg)
+{
+	struct gicv5_irs_chip_data *chip_data;
+	unsigned int type = IRQ_TYPE_NONE;
+	struct irq_fwspec *fwspec = arg;
+	struct irq_data *irqd;
+	irq_hw_number_t hwirq;
+	int ret;
+
+	if (WARN_ON_ONCE(nr_irqs != 1))
+		return -EINVAL;
+
+	ret = gicv5_irq_spi_domain_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
+	chip_data = gicv5_irs_lookup_by_spi_id(hwirq);
+
+	irq_domain_set_info(domain, virq, hwirq, &gicv5_spi_irq_chip, chip_data,
+			    handle_fasteoi_irq, NULL, NULL);
+	irq_set_probe(virq);
+	irqd_set_single_target(irqd);
+
+	gicv5_hwirq_init(hwirq, GICV5_IRQ_PRI_MI, GICV5_HWIRQ_TYPE_SPI);
+
+	return 0;
+}
+
+static int gicv5_irq_spi_domain_select(struct irq_domain *d,
+				       struct irq_fwspec *fwspec,
+				       enum irq_domain_bus_token bus_token)
+{
+	if (fwspec->fwnode != d->fwnode)
+		return 0;
+
+	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_SPI)
+		return 0;
+
+	return (d == gicv5_global_data.spi_domain);
+}
+
+static const struct irq_domain_ops gicv5_irq_spi_domain_ops = {
+	.translate	= gicv5_irq_spi_domain_translate,
+	.alloc		= gicv5_irq_spi_domain_alloc,
+	.free		= gicv5_irq_domain_free,
+	.select		= gicv5_irq_spi_domain_select
+};
+
+static const struct irq_chip gicv5_lpi_irq_chip = {
+	.name			= "GICv5-LPI",
+	.irq_mask		= gicv5_lpi_irq_mask,
+	.irq_unmask		= gicv5_lpi_irq_unmask,
+	.irq_eoi		= gicv5_lpi_irq_eoi,
+	.irq_set_affinity	= gicv5_lpi_irq_set_affinity,
+	.irq_retrigger		= gicv5_lpi_irq_retrigger,
+	.irq_get_irqchip_state	= gicv5_lpi_irq_get_irqchip_state,
+	.irq_set_irqchip_state	= gicv5_lpi_irq_set_irqchip_state,
+	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE	  |
+				  IRQCHIP_MASK_ON_SUSPEND
+};
+
+static const struct irq_chip gicv5_ipi_irq_chip = {
+	.name			= "GICv5-IPI",
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	// We only handle this one in the IPI domain - the rest go to parent
+	.ipi_send_single	= gicv5_ipi_send_single,
+	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE	  |
+				  IRQCHIP_MASK_ON_SUSPEND
+};
+
+static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				      unsigned int nr_irqs, void *arg)
+{
+	irq_hw_number_t hwirq;
+	struct irq_data *irqd;
+	u32 *lpi = arg;
+	int ret;
+
+	if (WARN_ON_ONCE(nr_irqs != 1))
+		return -EINVAL;
+
+	hwirq = *lpi;
+
+	irqd = irq_domain_get_irq_data(domain, virq);
+
+	irq_domain_set_info(domain, virq, hwirq, &gicv5_lpi_irq_chip, NULL,
+			    handle_fasteoi_irq, NULL, NULL);
+	irqd_set_single_target(irqd);
+
+	ret = gicv5_irs_iste_alloc(hwirq);
+	if (ret < 0)
+		return ret;
+
+	gicv5_hwirq_init(hwirq, GICV5_IRQ_PRI_MI, GICV5_HWIRQ_TYPE_LPI);
+
+	return 0;
+}
+
+static void gicv5_irq_lpi_domain_free(struct irq_domain *domain, unsigned int virq,
+				      unsigned int nr_irqs)
+{
+	struct irq_data *d;
+	int i;
+
+	WARN_ON_ONCE(nr_irqs != 1);
+
+	for (i = 0; i < nr_irqs; i++) {
+		d = irq_domain_get_irq_data(domain, virq + i);
+
+		irq_set_handler(virq + i, NULL);
+		irq_domain_reset_irq_data(d);
+	}
+}
+
+static const struct irq_domain_ops gicv5_irq_lpi_domain_ops = {
+	.alloc	= gicv5_irq_lpi_domain_alloc,
+	.free	= gicv5_irq_lpi_domain_free,
+};
+
+void __init gicv5_init_lpi_domain(void)
+{
+	struct irq_domain *d;
+
+	d = irq_domain_create_tree(NULL, &gicv5_irq_lpi_domain_ops, NULL);
+	gicv5_global_data.lpi_domain = d;
+}
+
+void __init gicv5_free_lpi_domain(void)
+{
+	irq_domain_remove(gicv5_global_data.lpi_domain);
+}
+
+static int gicv5_irq_ipi_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				      unsigned int nr_irqs, void *arg)
+{
+	struct irq_data *irqd;
+	int ret, i;
+	u32 lpi;
+
+	for (i = 0; i < nr_irqs; i++) {
+		ret = gicv5_alloc_lpi();
+		if (ret < 0)
+			return ret;
+
+		lpi = ret;
+
+		ret = irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
+		if (ret) {
+			gicv5_free_lpi(lpi);
+			return ret;
+		}
+
+		irqd = irq_domain_get_irq_data(domain, virq + i);
+
+		irq_domain_set_hwirq_and_chip(domain, virq + i, i,
+				&gicv5_ipi_irq_chip, NULL);
+
+		irqd_set_single_target(irqd);
+
+		irq_set_handler(virq + i, handle_percpu_irq);
+	}
+
+	return 0;
+}
+
+static void gicv5_irq_ipi_domain_free(struct irq_domain *domain, unsigned int virq,
+				      unsigned int nr_irqs)
+{
+	struct irq_data *d;
+	unsigned int i;
+
+	for (i = 0; i < nr_irqs; i++) {
+		d = irq_domain_get_irq_data(domain, virq + i);
+
+		if (!d)
+			return;
+
+		gicv5_free_lpi(d->parent_data->hwirq);
+
+		irq_set_handler(virq + i, NULL);
+		irq_domain_reset_irq_data(d);
+		irq_domain_free_irqs_parent(domain, virq + i, 1);
+	}
+}
+
+static const struct irq_domain_ops gicv5_irq_ipi_domain_ops = {
+	.alloc	= gicv5_irq_ipi_domain_alloc,
+	.free	= gicv5_irq_ipi_domain_free,
+};
+
+static inline void handle_irq_per_domain(u32 hwirq)
+{
+	u8 hwirq_type = FIELD_GET(GICV5_HWIRQ_TYPE, hwirq);
+	u32 hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, hwirq);
+	struct irq_domain *domain = NULL;
+
+	if (hwirq_type == GICV5_HWIRQ_TYPE_PPI)
+		domain = gicv5_global_data.ppi_domain;
+	else if (hwirq_type == GICV5_HWIRQ_TYPE_SPI)
+		domain = gicv5_global_data.spi_domain;
+	else if (hwirq_type == GICV5_HWIRQ_TYPE_LPI)
+		domain = gicv5_global_data.lpi_domain;
+
+	if (generic_handle_domain_irq(domain, hwirq_id)) {
+		pr_err_once("Could not handle, hwirq = 0x%x", hwirq_id);
+		gicv5_hwirq_eoi(hwirq_id, hwirq_type);
+	}
+}
+
+static void __exception_irq_entry gicv5_handle_irq(struct pt_regs *regs)
+{
+	bool valid;
+	u32 hwirq;
+	u64 ia;
+
+	ia = gicr_insn(GICV5_OP_GICR_CDIA);
+	valid = GICV5_GIC_CDIA_VALID(ia);
+
+	if (!valid)
+		return;
+
+	/*
+	 * Ensure that the CDIA instruction effects (ie IRQ activation) are
+	 * completed before handling the interrupt.
+	 */
+	gsb_ack();
+
+	/*
+	 * Ensure instruction ordering between an acknowledgment and subsequent
+	 * instructions in the IRQ handler using an ISB.
+	 */
+	isb();
+
+	hwirq = FIELD_GET(GICV5_HWIRQ_INTID, ia);
+
+	handle_irq_per_domain(hwirq);
+}
+
+static void gicv5_cpu_disable_interrupts(void)
+{
+	u64 cr0;
+
+	cr0 = FIELD_PREP(ICC_CR0_EL1_EN, 0);
+	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
+}
+
+static void gicv5_cpu_enable_interrupts(void)
+{
+	u64 cr0, pcr;
+
+	write_sysreg_s(0, SYS_ICC_PPI_ENABLER0_EL1);
+	write_sysreg_s(0, SYS_ICC_PPI_ENABLER1_EL1);
+
+	gicv5_ppi_priority_init();
+
+	pcr = FIELD_PREP(ICC_PCR_EL1_PRIORITY, GICV5_IRQ_PRI_MI);
+	write_sysreg_s(pcr, SYS_ICC_PCR_EL1);
+
+	cr0 = FIELD_PREP(ICC_CR0_EL1_EN, 1);
+	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
+}
+
+static int base_ipi_virq;
+
+static int gicv5_starting_cpu(unsigned int cpu)
+{
+	if (WARN(!gicv5_cpuif_has_gcie(),
+	    "GICv5 system components present but CPU does not have FEAT_GCIE"))
+		return -ENODEV;
+
+	gicv5_cpu_enable_interrupts();
+
+	return gicv5_irs_register_cpu(cpu);
+}
+
+static void __init gicv5_smp_init(void)
+{
+	unsigned int num_ipis = GICV5_IPIS_PER_CPU * nr_cpu_ids;
+
+	cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_GIC_STARTING,
+				  "irqchip/arm/gicv5:starting",
+				  gicv5_starting_cpu, NULL);
+
+	base_ipi_virq = irq_domain_alloc_irqs(gicv5_global_data.ipi_domain,
+					      num_ipis, NUMA_NO_NODE, NULL);
+	if (WARN(base_ipi_virq <= 0, "IPI IRQ allocation was not successful"))
+		return;
+
+	set_smp_ipi_range_percpu(base_ipi_virq, GICV5_IPIS_PER_CPU, nr_cpu_ids);
+}
+
+static void __init gicv5_free_domains(void)
+{
+	if (gicv5_global_data.ppi_domain)
+		irq_domain_remove(gicv5_global_data.ppi_domain);
+	if (gicv5_global_data.spi_domain)
+		irq_domain_remove(gicv5_global_data.spi_domain);
+	if (gicv5_global_data.ipi_domain)
+		irq_domain_remove(gicv5_global_data.ipi_domain);
+}
+
+static int __init gicv5_init_domains(struct fwnode_handle *handle)
+{
+	u32 spi_count = gicv5_global_data.global_spi_count;
+	struct irq_domain *d;
+
+	d = irq_domain_create_linear(handle, 128, &gicv5_irq_ppi_domain_ops,
+				     NULL);
+	if (!d)
+		return -ENOMEM;
+
+	irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
+	gicv5_global_data.ppi_domain = d;
+
+	if (spi_count) {
+		d = irq_domain_create_linear(handle, spi_count,
+					     &gicv5_irq_spi_domain_ops, NULL);
+
+		if (!d) {
+			gicv5_free_domains();
+			return -ENOMEM;
+		}
+
+		gicv5_global_data.spi_domain = d;
+		irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
+	}
+
+	if (!WARN(!gicv5_global_data.lpi_domain,
+		  "LPI domain uninitialized, can't set up IPIs")) {
+		d = irq_domain_create_hierarchy(gicv5_global_data.lpi_domain,
+						0, GICV5_IPIS_PER_CPU * nr_cpu_ids,
+						NULL, &gicv5_irq_ipi_domain_ops,
+						NULL);
+
+		if (!d) {
+			gicv5_free_domains();
+			return -ENOMEM;
+		}
+		gicv5_global_data.ipi_domain = d;
+	}
+	gicv5_global_data.fwnode = handle;
+
+	return 0;
+}
+
+static void gicv5_set_cpuif_pribits(void)
+{
+	u64 icc_idr0 = read_sysreg_s(SYS_ICC_IDR0_EL1);
+
+	switch (FIELD_GET(ICC_IDR0_EL1_PRI_BITS, icc_idr0)) {
+	case ICC_IDR0_EL1_PRI_BITS_4BITS:
+		gicv5_global_data.cpuif_pri_bits = 4;
+		break;
+	case ICC_IDR0_EL1_PRI_BITS_5BITS:
+		gicv5_global_data.cpuif_pri_bits = 5;
+		break;
+	default:
+		pr_err("Unexpected ICC_IDR0_EL1_PRI_BITS value, default to 4");
+		gicv5_global_data.cpuif_pri_bits = 4;
+		break;
+	}
+}
+
+static void gicv5_set_cpuif_idbits(void)
+{
+	u32 icc_idr0 = read_sysreg_s(SYS_ICC_IDR0_EL1);
+
+	switch (FIELD_GET(ICC_IDR0_EL1_ID_BITS, icc_idr0)) {
+	case ICC_IDR0_EL1_ID_BITS_16BITS:
+		gicv5_global_data.cpuif_id_bits = 16;
+		break;
+	case ICC_IDR0_EL1_ID_BITS_24BITS:
+		gicv5_global_data.cpuif_id_bits = 24;
+		break;
+	default:
+		pr_err("Unexpected ICC_IDR0_EL1_ID_BITS value, default to 16");
+		gicv5_global_data.cpuif_id_bits = 16;
+		break;
+	}
+}
+
+
+static int __init gicv5_of_init(struct device_node *node,
+				struct device_node *parent)
+{
+	int ret;
+
+	ret = gicv5_irs_of_probe(node);
+	if (ret)
+		return ret;
+
+	ret = gicv5_init_domains(&node->fwnode);
+	if (ret)
+		goto out_irs;
+
+	gicv5_set_cpuif_pribits();
+	gicv5_set_cpuif_idbits();
+
+	pri_bits = min_not_zero(gicv5_global_data.cpuif_pri_bits,
+		       gicv5_global_data.irs_pri_bits);
+
+	ret = gicv5_starting_cpu(smp_processor_id());
+	if (ret)
+		goto out_dom;
+
+	ret = set_handle_irq(gicv5_handle_irq);
+	if (ret)
+		goto out_int;
+
+	ret = gicv5_irs_enable();
+	if (ret)
+		goto out_int;
+
+	gicv5_smp_init();
+
+	return 0;
+out_int:
+	gicv5_cpu_disable_interrupts();
+out_dom:
+	gicv5_free_domains();
+out_irs:
+	gicv5_irs_remove();
+
+	return ret;
+}
+IRQCHIP_DECLARE(gic_v5, "arm,gic-v5", gicv5_of_init);
diff --git a/drivers/irqchip/irq-gic-v5.h b/drivers/irqchip/irq-gic-v5.h
new file mode 100644
index 0000000000000000000000000000000000000000..19569639153a084760c3b5b7f0fa84791ba0195c
--- /dev/null
+++ b/drivers/irqchip/irq-gic-v5.h
@@ -0,0 +1,184 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 ARM Limited, All Rights Reserved.
+ */
+#ifndef __LINUX_IRQCHIP_GIC_V5_H
+#define __LINUX_IRQCHIP_GIC_V5_H
+
+#include <asm/arch_gicv5.h>
+#include <asm/smp.h>
+
+#define GICV5_IPIS_PER_CPU		MAX_IPI
+
+#define GICV5_HWIRQ_ID			GENMASK(23, 0)
+#define GICV5_HWIRQ_TYPE		GENMASK(31, 29)
+#define GICV5_HWIRQ_INTID		GENMASK_ULL(31, 0)
+
+#define GICV5_HWIRQ_TYPE_PPI		UL(0x1)
+#define GICV5_HWIRQ_TYPE_LPI		UL(0x2)
+#define GICV5_HWIRQ_TYPE_SPI		UL(0x3)
+
+#define GICV5_PPI_HM_EDGE		UL(0x0)
+#define GICV5_PPI_HM_LEVEL		UL(0x1)
+
+#define GICV5_NO_READ_ALLOC		0b0
+#define GICV5_READ_ALLOC		0b1
+#define GICV5_NO_WRITE_ALLOC		0b0
+#define GICV5_WRITE_ALLOC		0b1
+
+#define GICV5_NON_CACHE			0b00
+#define GICV5_WB_CACHE			0b01
+#define GICV5_WT_CACHE			0b10
+
+#define GICV5_NON_SHARE			0b00
+#define GICV5_OUTER_SHARE		0b10
+#define GICV5_INNER_SHARE		0b11
+
+#define GICV5_IRS_IDR1			0x0004
+#define GICV5_IRS_IDR2			0x0008
+#define GICV5_IRS_IDR5			0x0014
+#define GICV5_IRS_IDR6			0x0018
+#define GICV5_IRS_IDR7			0x001c
+#define GICV5_IRS_CR0			0x0080
+#define GICV5_IRS_CR1			0x0084
+#define GICV5_IRS_SPI_SELR		0x0108
+#define GICV5_IRS_SPI_CFGR		0x0114
+#define GICV5_IRS_SPI_STATUSR		0x0118
+#define GICV5_IRS_PE_SELR		0x0140
+#define GICV5_IRS_PE_STATUSR		0x0144
+#define GICV5_IRS_PE_CR0		0x0148
+#define GICV5_IRS_IST_BASER		0x0180
+#define GICV5_IRS_IST_CFGR		0x0190
+#define GICV5_IRS_IST_STATUSR		0x0194
+#define GICV5_IRS_MAP_L2_ISTR		0x01c0
+
+#define GICV5_IRS_IDR1_PRIORITY_BITS	GENMASK(22, 20)
+#define GICV5_IRS_IDR1_IAFFID_BITS	GENMASK(19, 16)
+
+#define GICV5_IRS_IDR1_PRIORITY_BITS_1BITS	0b000
+#define GICV5_IRS_IDR1_PRIORITY_BITS_2BITS	0b001
+#define GICV5_IRS_IDR1_PRIORITY_BITS_3BITS	0b010
+#define GICV5_IRS_IDR1_PRIORITY_BITS_4BITS	0b011
+#define GICV5_IRS_IDR1_PRIORITY_BITS_5BITS	0b100
+
+#define GICV5_IRS_IDR2_ISTMD_SZ		GENMASK(19, 15)
+#define GICV5_IRS_IDR2_ISTMD		BIT(14)
+#define GICV5_IRS_IDR2_IST_L2SZ		GENMASK(13, 11)
+#define GICV5_IRS_IDR2_IST_LEVELS	BIT(10)
+#define GICV5_IRS_IDR2_MIN_LPI_ID_BITS	GENMASK(9, 6)
+#define GICV5_IRS_IDR2_LPI		BIT(5)
+#define GICV5_IRS_IDR2_ID_BITS		GENMASK(4, 0)
+
+#define GICV5_IRS_IDR5_SPI_RANGE	GENMASK(24, 0)
+#define GICV5_IRS_IDR6_SPI_IRS_RANGE	GENMASK(24, 0)
+#define GICV5_IRS_IDR7_SPI_BASE		GENMASK(23, 0)
+
+#define GICV5_IRS_IST_L2SZ_SUPPORT_4KB(r)	FIELD_GET(BIT(11), (r))
+#define GICV5_IRS_IST_L2SZ_SUPPORT_16KB(r)	FIELD_GET(BIT(12), (r))
+#define GICV5_IRS_IST_L2SZ_SUPPORT_64KB(r)	FIELD_GET(BIT(13), (r))
+
+#define GICV5_IRS_CR0_IDLE		BIT(1)
+#define GICV5_IRS_CR0_IRSEN		BIT(0)
+
+#define GICV5_IRS_CR1_VPED_WA		BIT(15)
+#define GICV5_IRS_CR1_VPED_RA		BIT(14)
+#define GICV5_IRS_CR1_VMD_WA		BIT(13)
+#define GICV5_IRS_CR1_VMD_RA		BIT(12)
+#define GICV5_IRS_CR1_VPET_WA		BIT(11)
+#define GICV5_IRS_CR1_VPET_RA		BIT(10)
+#define GICV5_IRS_CR1_VMT_WA		BIT(9)
+#define GICV5_IRS_CR1_VMT_RA		BIT(8)
+#define GICV5_IRS_CR1_IST_WA		BIT(7)
+#define GICV5_IRS_CR1_IST_RA		BIT(6)
+#define GICV5_IRS_CR1_IC		GENMASK(5, 4)
+#define GICV5_IRS_CR1_OC		GENMASK(3, 2)
+#define GICV5_IRS_CR1_SH		GENMASK(1, 0)
+
+#define GICV5_IRS_SPI_STATUSR_V		BIT(1)
+#define GICV5_IRS_SPI_STATUSR_IDLE	BIT(0)
+
+#define GICV5_IRS_SPI_SELR_ID		GENMASK(23, 0)
+
+#define GICV5_IRS_SPI_CFGR_TM		BIT(0)
+
+#define GICV5_IRS_PE_SELR_IAFFID	GENMASK(15, 0)
+
+#define GICV5_IRS_PE_STATUSR_V		BIT(1)
+#define GICV5_IRS_PE_STATUSR_IDLE	BIT(0)
+
+#define GICV5_IRS_PE_CR0_DPS		BIT(0)
+
+#define GICV5_IRS_IST_STATUSR_IDLE	BIT(0)
+
+#define GICV5_IRS_IST_CFGR_STRUCTURE	BIT(16)
+#define GICV5_IRS_IST_CFGR_ISTSZ	GENMASK(8, 7)
+#define GICV5_IRS_IST_CFGR_L2SZ		GENMASK(6, 5)
+#define GICV5_IRS_IST_CFGR_LPI_ID_BITS	GENMASK(4, 0)
+
+#define GICV5_IRS_IST_CFGR_STRUCTURE_LINEAR	0b0
+#define GICV5_IRS_IST_CFGR_STRUCTURE_TWO_LEVEL	0b1
+
+#define GICV5_IRS_IST_CFGR_ISTSZ_4	0b00
+#define GICV5_IRS_IST_CFGR_ISTSZ_8	0b01
+#define GICV5_IRS_IST_CFGR_ISTSZ_16	0b10
+
+#define GICV5_IRS_IST_CFGR_L2SZ_4K	0b00
+#define GICV5_IRS_IST_CFGR_L2SZ_16K	0b01
+#define GICV5_IRS_IST_CFGR_L2SZ_64K	0b10
+
+#define GICV5_IRS_IST_BASER_ADDR_MASK	GENMASK_ULL(55, 6)
+#define GICV5_IRS_IST_BASER_VALID	BIT_ULL(0)
+
+#define GICV5_IRS_MAP_L2_ISTR_ID	GENMASK(23, 0)
+
+#define GICV5_ISTL1E_VALID		BIT_ULL(0)
+
+#define GICV5_ISTL1E_L2_ADDR_MASK	GENMASK_ULL(55, 12)
+
+struct gicv5_chip_data {
+	struct fwnode_handle	*fwnode;
+	struct irq_domain	*ppi_domain;
+	struct irq_domain	*spi_domain;
+	struct irq_domain	*lpi_domain;
+	struct irq_domain	*ipi_domain;
+	u32			global_spi_count;
+	u8			cpuif_pri_bits;
+	u8			cpuif_id_bits;
+	u8			irs_pri_bits;
+	u8			irs_iaffid_bits;
+	struct {
+		__le64 *l1ist_addr;
+		u32 l2_size;
+		u8 l2_bits;
+		bool l2;
+	} ist;
+};
+
+extern struct gicv5_chip_data gicv5_global_data __read_mostly;
+
+struct gicv5_irs_chip_data {
+	struct list_head	entry;
+	struct fwnode_handle	*fwnode;
+	void __iomem		*irs_base;
+	u32			flags;
+	u32			spi_min;
+	u32			spi_range;
+	raw_spinlock_t		spi_config_lock;
+};
+
+void __init gicv5_init_lpi_domain(void);
+void __init gicv5_free_lpi_domain(void);
+
+int gicv5_irs_of_probe(struct device_node *parent);
+void gicv5_irs_remove(void);
+int gicv5_irs_enable(void);
+int gicv5_irs_register_cpu(int cpuid);
+int gicv5_irs_cpu_to_iaffid(int cpu_id, u16 *iaffid);
+struct gicv5_irs_chip_data *gicv5_irs_lookup_by_spi_id(u32 spi_id);
+int gicv5_spi_irq_set_type(struct irq_data *d, unsigned int type);
+int gicv5_spi_set_type(struct irq_data *d, unsigned int type);
+int gicv5_irs_iste_alloc(u32 lpi);
+
+void gicv5_init_lpis(u32 max);
+void gicv5_deinit_lpis(void);
+#endif

-- 
2.48.0

