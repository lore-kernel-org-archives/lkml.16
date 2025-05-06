Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CD727FB29;
	Tue,  6 May 2025 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534328; cv=none; b=hyArGtCGPp9hucFHurt8RAQeWjgTrYJ/eZ9KbRwCqA3or1LkquXoz5DxGuah9zTYEniu/IjkNMuu0VC9HC4aKVqWByHDa0LRnS61qZ5g6ekT/GaU1zH7cLwpn8VKZPvh8etDC8Qs9/b5/KbxeQFCP8++3PTuki31oavl5IKxwyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534328; c=relaxed/simple;
	bh=pIOZvsE7m06vebtQtAxWdk9T0aeG70Xvc3Xwvn19H2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQ2s9nbRshAs9GFQjdOTsiMrBMnN3eeMTkpkMvDAb0CzGa2G8XGV1XbzL7Fj8PjpprwGybZMHJkOM5PYg0iXSPWmlEwAHnuS5aui88+EsT8x1WdLDK5m0uNrorya1SgXIH0DCAVQQsZypfIkom2qoMNlKEzGdhmHmHESFHdwZvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f43g8l6p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f43g8l6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDBBC4CEE4;
	Tue,  6 May 2025 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534328;
	bh=pIOZvsE7m06vebtQtAxWdk9T0aeG70Xvc3Xwvn19H2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f43g8l6piXDG9rpTD7ycL7wckvMcQ+sGyoXrvDx8tyZOWF8DtXg4j+pCdeF8h/N4+
	 ukkTraYk0cck0pFsEiYTDa6yqXcoYu6K/XJWOzdaWtlqEkbpjUoKfJ6KRTMF/3d5bk
	 FTJ6KKUyEvvFLqZVet8Xyr6RHiVqsrfMgo3oXPbsIyPKst8GyelovxgLLbBLOc3Mc3
	 RtZ3ASQhKqMO7kxwLwyG/htf4ZRIJADBf15few0hWbw/DGoiFoPelNxy303Lq4tnRR
	 ytwHOPG8He51w1FRND/RRMf7EQCcEjUpb4BTd5COjL/uk6uP3UksgylmgCj27/dv7k
	 d8AjiUwA16eiQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:49 +0200
Subject: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

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
 MAINTAINERS                        |   2 +
 arch/arm64/include/asm/sysreg.h    |  23 ++
 drivers/irqchip/Kconfig            |   5 +
 drivers/irqchip/Makefile           |   1 +
 drivers/irqchip/irq-gic-v5.c       | 454 +++++++++++++++++++++++++++++++++++++
 include/linux/irqchip/arm-gic-v5.h |  19 ++
 6 files changed, 504 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1902291c3cccc06d27c5f79123e67774cf9a0e43..49c377febad72e77dd6d480105c2b6bffa81f9a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1907,6 +1907,8 @@ M:	Marc Zyngier <maz@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5*.yaml
+F:	drivers/irqchip/irq-gic-v5*.[ch]
+F:	include/linux/irqchip/arm-gic-v5.h
 
 ARM HDLCD DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index e7734f90bb723bfbd8be99f16dd6d6fdc7fa57e8..4b48d00842c5750299f2983ecd72f19f2865c0e3 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1079,6 +1079,29 @@
 
 #define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
 					       GCS_CAP_VALID_TOKEN)
+/*
+ * Definitions for GICv5 instructions
+ */
+#define GICV5_OP_GIC_CDDI		sys_insn(1, 0, 12, 2, 0)
+#define GICV5_OP_GIC_CDEOI		sys_insn(1, 0, 12, 1, 7)
+#define GICV5_OP_GICR_CDIA		sys_insn(1, 0, 12, 3, 0)
+
+/* Shift and mask definitions for GIC CDDI */
+#define GICV5_GIC_CDDI_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDDI_TYPE(r)		FIELD_GET(GICV5_GIC_CDDI_TYPE_MASK, r)
+#define GICV5_GIC_CDDI_ID_MASK		GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDDI_ID(r)		FIELD_GET(GICV5_GIC_CDDI_ID_MASK, r)
+
+/* Shift and mask definitions for GICR CDIA */
+#define GICV5_GIC_CDIA_VALID_MASK	BIT_ULL(32)
+#define GICV5_GIC_CDIA_VALID(r)		FIELD_GET(GICV5_GIC_CDIA_VALID_MASK, r)
+#define GICV5_GIC_CDIA_TYPE_MASK	GENMASK_ULL(31, 29)
+#define GICV5_GIC_CDIA_TYPE(r)		FIELD_GET(GICV5_GIC_CDIA_TYPE_MASK, r)
+#define GICV5_GIC_CDIA_ID_MASK		GENMASK_ULL(23, 0)
+#define GICV5_GIC_CDIA_ID(r)		FIELD_GET(GICV5_GIC_CDIA_ID_MASK, r)
+
+#define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
+#define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
 
 #define ARM64_FEATURE_FIELD_BITS	4
 
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index cec05e443083b8982b3e72f4212d808a22883914..6b3d70924186bd8ca04294832409d1e379c9cbd4 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -54,6 +54,11 @@ config ARM_GIC_V3_ITS_FSL_MC
 	depends on FSL_MC_BUS
 	default ARM_GIC_V3_ITS
 
+config ARM_GIC_V5
+	bool
+	select IRQ_DOMAIN_HIERARCHY
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+
 config ARM_NVIC
 	bool
 	select IRQ_DOMAIN_HIERARCHY
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 365bcea9a61ff89e2cb41034125b3fc8cd494d81..3f8225bba5f0f9ce5dbb629b6d4782eacf85da44 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_ARM_GIC_V3)		+= irq-gic-v3.o irq-gic-v3-mbi.o irq-gic-common.o
 obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o irq-gic-v3-its-msi-parent.o
 obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
 obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
+obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o
 obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
 obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
 obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
new file mode 100644
index 0000000000000000000000000000000000000000..29915a82e798211b61b611ed3ad457047b299298
--- /dev/null
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2025 ARM Limited, All Rights Reserved.
+ */
+
+#define pr_fmt(fmt)	"GICv5: " fmt
+
+#include <linux/irqdomain.h>
+#include <linux/wordpart.h>
+
+#include <linux/irqchip.h>
+#include <linux/irqchip/arm-gic-v5.h>
+
+#include <asm/cpufeature.h>
+#include <asm/exception.h>
+
+static u8 pri_bits = 5;
+#define GICV5_IRQ_PRI_MASK 0x1f
+#define GICV5_IRQ_PRI_MI \
+		(GICV5_IRQ_PRI_MASK & GENMASK(4, 5 - pri_bits))
+
+#define PPI_NR	128
+
+static bool gicv5_cpuif_has_gcie(void)
+{
+	return this_cpu_has_cap(ARM64_HAS_GICV5_CPUIF);
+}
+
+struct gicv5_chip_data {
+	struct fwnode_handle	*fwnode;
+	struct irq_domain	*ppi_domain;
+};
+
+static struct gicv5_chip_data gicv5_global_data __read_mostly;
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
+	 * Context syncronization required to make sure system register writes
+	 * effects are synchronised.
+	 */
+	isb();
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
+	 * We must ensure that the disable takes effect immediately to
+	 * guarantee that the lazy-disabled IRQ mechanism works.
+	 * A context synchronization event is required to guarantee it.
+	 * Reference: I_ZLTKB/R_YRGMH GICv5 specification - section 2.9.1.
+	 */
+	isb();
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
+	/*
+	 * We must ensure that the enable takes effect in finite time - a
+	 * context synchronization event is required to guarantee it, we
+	 * can not take for granted that would happen (eg a core going straight
+	 * into idle after enabling a PPI).
+	 * Reference: I_ZLTKB/R_YRGMH GICv5 specification - section 2.9.1.
+	 */
+	isb();
+}
+
+static void gicv5_hwirq_eoi(u32 hwirq_id, u8 hwirq_type)
+{
+	u64 cddi = hwirq_id | FIELD_PREP(GICV5_GIC_CDDI_TYPE_MASK, hwirq_type);
+
+	gic_insn(cddi, CDDI);
+
+	gic_insn(0, CDEOI);
+}
+
+static void gicv5_ppi_irq_eoi(struct irq_data *d)
+{
+	gicv5_hwirq_eoi(d->hwirq, GICV5_HWIRQ_TYPE_PPI);
+}
+
+#define READ_PPI_REG(irq, reg)							\
+	({									\
+		u64 __ppi_val;							\
+										\
+		if (irq < 64)							\
+			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R0_EL1);	\
+		else								\
+			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R1_EL1);	\
+		__ppi_val;							\
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
+	u64 pendr, activer, hwirq_id_bit = BIT_ULL(d->hwirq % 64);
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
+	default:
+		pr_debug("Unexpected PPI irqchip state\n");
+	}
+
+	return -EINVAL;
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
+	default:
+		pr_debug("Unexpected PPI irqchip state\n");
+	}
+
+	return -EINVAL;
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
+static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
+				      struct irq_fwspec *fwspec,
+				      irq_hw_number_t *hwirq,
+				      unsigned int *type)
+{
+	if (!is_of_node(fwspec->fwnode))
+		return -EINVAL;
+
+	if (fwspec->param_count < 3)
+		return -EINVAL;
+
+	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI)
+		return -EINVAL;
+
+	*hwirq = fwspec->param[1];
+	*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+
+	return 0;
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
+static void handle_irq_per_domain(u32 hwirq)
+{
+	u8 hwirq_type = FIELD_GET(GICV5_HWIRQ_TYPE, hwirq);
+	u32 hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, hwirq);
+	struct irq_domain *domain;
+
+	switch (hwirq_type) {
+	case GICV5_HWIRQ_TYPE_PPI:
+		domain = gicv5_global_data.ppi_domain;
+		break;
+	default:
+		pr_err_once("Unknown IRQ type, bail out\n");
+		return;
+	}
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
+	ia = gicr_insn(CDIA);
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
+static int gicv5_starting_cpu(unsigned int cpu)
+{
+	if (WARN(!gicv5_cpuif_has_gcie(),
+	    "GICv5 system components present but CPU does not have FEAT_GCIE"))
+		return -ENODEV;
+
+	gicv5_cpu_enable_interrupts();
+
+	return 0;
+}
+
+static void __init gicv5_free_domains(void)
+{
+	if (gicv5_global_data.ppi_domain)
+		irq_domain_remove(gicv5_global_data.ppi_domain);
+
+	gicv5_global_data.ppi_domain = NULL;
+}
+
+static int __init gicv5_init_domains(struct fwnode_handle *handle)
+{
+	struct irq_domain *d;
+
+	d = irq_domain_create_linear(handle, PPI_NR, &gicv5_irq_ppi_domain_ops,
+				     NULL);
+	if (!d)
+		return -ENOMEM;
+
+	irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
+	gicv5_global_data.ppi_domain = d;
+
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
+		pri_bits = 4;
+		break;
+	case ICC_IDR0_EL1_PRI_BITS_5BITS:
+		pri_bits = 5;
+		break;
+	default:
+		pr_err("Unexpected ICC_IDR0_EL1_PRI_BITS value, default to 4");
+		pri_bits = 4;
+		break;
+	}
+}
+
+static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
+{
+	int ret;
+
+	ret = gicv5_init_domains(&node->fwnode);
+	if (ret)
+		return ret;
+
+	gicv5_set_cpuif_pribits();
+
+	ret = gicv5_starting_cpu(smp_processor_id());
+	if (ret)
+		goto out_dom;
+
+	ret = set_handle_irq(gicv5_handle_irq);
+	if (ret)
+		goto out_int;
+
+	return 0;
+out_int:
+	gicv5_cpu_disable_interrupts();
+out_dom:
+	gicv5_free_domains();
+
+	return ret;
+}
+IRQCHIP_DECLARE(gic_v5, "arm,gic-v5", gicv5_of_init);
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
new file mode 100644
index 0000000000000000000000000000000000000000..cc3da79e615b2b6ee27456e98c17061e4508030f
--- /dev/null
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 ARM Limited, All Rights Reserved.
+ */
+#ifndef __LINUX_IRQCHIP_ARM_GIC_V5_H
+#define __LINUX_IRQCHIP_ARM_GIC_V5_H
+
+#include <asm/sysreg.h>
+
+#define GICV5_HWIRQ_ID			GENMASK(23, 0)
+#define GICV5_HWIRQ_TYPE		GENMASK(31, 29)
+#define GICV5_HWIRQ_INTID		GENMASK_ULL(31, 0)
+
+#define GICV5_HWIRQ_TYPE_PPI		UL(0x1)
+
+#define GICV5_PPI_HM_EDGE		UL(0x0)
+#define GICV5_PPI_HM_LEVEL		UL(0x1)
+
+#endif

-- 
2.48.0

