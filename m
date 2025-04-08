Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4872690DB;
	Tue,  8 Apr 2025 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109522; cv=none; b=Mk9NnhPtDeVUEe/OzBovXvhoeodSgOx3hBVqtEgseSpO/AyP3f6fxFsHn4omXjnN2DWoNrGsrgzejYfWreCkIDc2DTQ0/Npa8G9bPJtVLJcuzRz+xLnUPPDWnx9136HPQuwZJCjUpZjHh6Pu9gL/7SRKQ21Ws0cHWlU/f0aMj10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109522; c=relaxed/simple;
	bh=I4CJMV1W3CjDmDnFQpck8HW5RiufP8Jfd8CGS/MAO7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QT7B15vk/iR8gtLGY0ZT3cwlCwck9oAc8QIyVauMMjVciz/eFZNVWT6kN+pmELgtimiHM9z3WdNBV5KEjH/2P/v3V188ksEXPwUuId0J1RYhR3MQyxr/LiYedVmS3hTTq8yhXnPcUkj2piKy4N3SybKx7u73IK9Cno+Ml9fFHn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmhw3C2f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmhw3C2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F260BC4CEEB;
	Tue,  8 Apr 2025 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109522;
	bh=I4CJMV1W3CjDmDnFQpck8HW5RiufP8Jfd8CGS/MAO7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qmhw3C2fYCa4e3SfuKrBTW0DL3tQdeDdKusG1PeTa4nieLYqy3mvJJLNDllpqtrLw
	 xm+Lt+UYg3rnJjHJVTbPx3knzNlrRlt15yxOn5/aUMTNl4fh2d9fn3j/i6h33gnJZH
	 dDX5w/NaTWx/JKJklBGxg2mmusMlD6Jznt7SN/7muxWLMzfELleIzY6RGSXzAECWhS
	 xBHv2vrrM/pUaEeiDM9+v0UMEs9iK7Pz5vAlGKz++gE9GoVm2YL5zRsavgzHcyG5uM
	 Tk8xg1YaJu+WU1fTUh/SX8H8lGTrtwx7ogR6N49MyhFGjmi3+Kv8XaSCZKWHwpE21q
	 crbl8ZUjFMpTg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:19 +0200
Subject: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

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

Move the arm64 IPI enum declaration to a header file so that the GICv5
driver code can detect how many IPIs are required by arch code.

IPIs are backed by LPIs, add LPIs allocation/de-allocation
functions.

The LPI INTID namespace is managed using a maple tree which encodes
ranges, add code to alloc/free LPI INTIDs.

Maple tree entries are not used by the driver, only the range tracking
is required - therefore the driver first finds an empty area large
enough to contain the required number of LPIs then checks the
adjacent (and possibly occupied) LPI ranges and try to merge them
together, reducing maple tree slots usage.

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
 arch/arm64/include/asm/arch_gicv5.h |   1 +
 arch/arm64/include/asm/smp.h        |  17 ++
 arch/arm64/kernel/smp.c             |  17 --
 drivers/irqchip/irq-gic-v5-irs.c    | 369 ++++++++++++++++++++++++++++++++++++
 drivers/irqchip/irq-gic-v5.c        | 347 ++++++++++++++++++++++++++++++++-
 drivers/irqchip/irq-gic-v5.h        |  64 +++++++
 6 files changed, 797 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/arch_gicv5.h b/arch/arm64/include/asm/arch_gicv5.h
index 00c6b7903094ca5d6e496890d029d21d82b7af66..75557fdad611fa51d7136126eb80cb861be98a8d 100644
--- a/arch/arm64/include/asm/arch_gicv5.h
+++ b/arch/arm64/include/asm/arch_gicv5.h
@@ -5,6 +5,7 @@
 #ifndef __ASM_ARCH_GICV5_H
 #define __ASM_ARCH_GICV5_H
 
+#include <asm/cacheflush.h>
 #include <asm/sysreg.h>
 
 #ifndef __ASSEMBLY__
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
 
diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 5999f2a2c8dac0ea01ab0aa5df65bf12e1f59f63..909ccf07879a1feb5abb65fa265706f2c276d927 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -7,11 +7,14 @@
 
 #include <linux/iopoll.h>
 #include <linux/irqchip.h>
+#include <linux/log2.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 
 #include "irq-gic-v5.h"
 
+#define LPI_ID_BITS_LINEAR		12
+
 #define IRS_FLAGS_NON_COHERENT		BIT(0)
 
 static DEFINE_PER_CPU(struct gicv5_irs_chip_data *, per_cpu_irs_data);
@@ -22,12 +25,346 @@ static u32 irs_readl(struct gicv5_irs_chip_data *irs_data, const u64 reg_offset)
 	return readl_relaxed(irs_data->irs_base + reg_offset);
 }
 
+static u64 irs_readq(struct gicv5_irs_chip_data *irs_data, const u64 reg_offset)
+{
+	return readq_relaxed(irs_data->irs_base + reg_offset);
+}
+
 static void irs_writel(struct gicv5_irs_chip_data *irs_data, const u32 val,
 		       const u64 reg_offset)
 {
 	writel_relaxed(val, irs_data->irs_base + reg_offset);
 }
 
+static void irs_writeq(struct gicv5_irs_chip_data *irs_data, const u64 val,
+		       const u64 reg_offset)
+{
+	writeq_relaxed(val, irs_data->irs_base + reg_offset);
+}
+
+/* Wait for completion of an IST change */
+static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data *irs_data)
+{
+	int ret;
+	u32 val;
+
+	ret = readl_relaxed_poll_timeout_atomic(
+			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
+			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
+			USEC_PER_SEC);
+
+	if (ret == -ETIMEDOUT)
+		pr_err_ratelimited("IST_STATUSR.IDLE timeout...\n");
+
+	return ret;
+}
+
+static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data,
+					    unsigned int lpi_id_bits,
+					    unsigned int istsz)
+{
+	void *ist;
+	u32 n, cfgr;
+	u64 baser;
+	size_t l2istsz;
+	int ret;
+
+	/* Taken from GICv5 specifications 10.2.1.13 IRS_IST_BASER */
+	n = max(5, lpi_id_bits + 1 + istsz);
+
+	l2istsz = BIT(n + 1);
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
+	irs_writel(irs_data, cfgr, GICV5_IRS_IST_CFGR);
+
+	gicv5_global_data.ist.l2 = false;
+
+	baser = (virt_to_phys(ist) & GICV5_IRS_IST_BASER_ADDR_MASK) |
+		FIELD_PREP(GICV5_IRS_IST_BASER_VALID, 0x1);
+	irs_writeq(irs_data, baser, GICV5_IRS_IST_BASER);
+
+	ret = gicv5_irs_ist_wait_for_idle(irs_data);
+	if (ret) {
+		kfree(ist);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __init gicv5_irs_init_ist_two_level(
+					struct gicv5_irs_chip_data *irs_data,
+					unsigned int lpi_id_bits,
+					unsigned int istsz,
+					unsigned int l2sz)
+{
+	u32 cfgr, n;
+	u64 baser;
+	size_t l1sz;
+	__le64 *l1ist;
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
+	irs_writel(irs_data, cfgr, GICV5_IRS_IST_CFGR);
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
+	irs_writeq(irs_data, baser, GICV5_IRS_IST_BASER);
+
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
+ * Locking/serialization is guaranteed by irqdomain core code by
+ * taking the hierarchical domain struct irq_domain.root->mutex.
+ */
+int gicv5_irs_iste_alloc(const u32 lpi)
+{
+	struct gicv5_irs_chip_data *irs_data;
+	u32 l2istr, l2bits;
+	size_t l2size;
+	unsigned int index;
+	__le64 *l1ist;
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
+	l1ist[index] = cpu_to_le64(
+			virt_to_phys(l2ist) & GICV5_ISTL1E_L2_ADDR_MASK);
+
+	if (irs_data->flags & IRS_FLAGS_NON_COHERENT) {
+		dcache_clean_inval_poc((unsigned long)l2ist,
+				(unsigned long)l2ist + l2size);
+		dcache_clean_poc((unsigned long)(l1ist + index),
+				(unsigned long)(l1ist + index) + sizeof(*l1ist));
+	} else {
+		dsb(ishst);
+	}
+
+	l2istr = FIELD_PREP(GICV5_IRS_MAP_L2_ISTR_ID, lpi);
+	irs_writel(irs_data, l2istr, GICV5_IRS_MAP_L2_ISTR);
+
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
+		 * Order the MMIO IRS wait for idle with cache
+		 * invalidation
+		 */
+		dma_rmb();
+		dcache_inval_poc((unsigned long)(l1ist + index),
+				(unsigned long)(l1ist + index) + sizeof(*l1ist));
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
+	baser = irs_readq(irs_data, GICV5_IRS_IST_BASER);
+	if (FIELD_GET(GICV5_IRS_IST_BASER_VALID, baser)) {
+		pr_err("IST is marked as valid already; cannot allocate\n");
+		return -EPERM;
+	}
+
+	idr2 = irs_readl(irs_data, GICV5_IRS_IDR2);
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
+	two_levels = two_levels && (lpi_id_bits > ((10 - l2_iste_sz) +
+						   (2 * l2sz)));
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
+	gicv5_init_lpi(BIT(lpi_id_bits));
+
+	return 0;
+}
+
 struct iaffid_entry {
 	u16 iaffid;
 	bool valid;
@@ -383,8 +720,16 @@ static int __init gicv5_irs_init(struct device_node *node)
 		goto out_iomem;
 	}
 
+	idr = irs_readl(irs_data, GICV5_IRS_IDR2);
+	if (WARN(!FIELD_GET(GICV5_IRS_IDR2_LPI, idr),
+		 "LPI support not available - no IPIs, can't proceed\n")) {
+		ret = -ENODEV;
+		goto out_iomem;
+	}
+
 	idr = irs_readl(irs_data, GICV5_IRS_IDR7);
 	irs_data->spi_min = FIELD_GET(GICV5_IRS_IDR7_SPI_BASE, idr);
+
 	idr = irs_readl(irs_data, GICV5_IRS_IDR6);
 	irs_data->spi_range = FIELD_GET(GICV5_IRS_IDR6_SPI_IRS_RANGE, idr);
 
@@ -409,6 +754,8 @@ static int __init gicv5_irs_init(struct device_node *node)
 		gicv5_global_data.global_spi_count =
 			FIELD_GET(GICV5_IRS_IDR5_SPI_RANGE, idr);
 
+		gicv5_init_lpi_domain();
+
 		pr_debug("Detected %u SPIs globally\n",
 			 gicv5_global_data.global_spi_count);
 	}
@@ -427,6 +774,9 @@ void __init gicv5_irs_remove(void)
 {
 	struct gicv5_irs_chip_data *irs_data, *tmp_data;
 
+	gicv5_free_lpi_domain();
+	gicv5_free_lpi();
+
 	list_for_each_entry_safe(irs_data, tmp_data, &irs_nodes, entry) {
 		iounmap(irs_data->irs_base);
 		list_del(&irs_data->entry);
@@ -434,6 +784,25 @@ void __init gicv5_irs_remove(void)
 	}
 }
 
+int __init gicv5_irs_enable(void)
+{
+	int ret;
+	struct gicv5_irs_chip_data *irs_data;
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
 int __init gicv5_irs_of_probe(struct device_node *parent)
 {
 	int ret;
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 5c7a9263e0cea36515dbdadd067b8eb5f65e8da4..85d951bfd807fc1b67b616dbadeebc150848293f 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -7,6 +7,8 @@
 
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
+#include <linux/maple_tree.h>
+#include <linux/slab.h>
 #include <linux/wordpart.h>
 
 #include <asm/cpufeature.h>
@@ -26,6 +28,90 @@ static bool gicv5_cpuif_has_gcie(void)
 
 struct gicv5_chip_data gicv5_global_data __read_mostly;
 
+static struct maple_tree lpi_mt;
+static u32 num_lpis;
+
+void __init gicv5_init_lpi(u32 lpis)
+{
+	mt_init_flags(&lpi_mt, MT_FLAGS_ALLOC_RANGE);
+	num_lpis = lpis;
+}
+
+void __init gicv5_free_lpi(void)
+{
+	mtree_destroy(&lpi_mt);
+	num_lpis = 0;
+}
+
+#define MT_ENTRY	((void *)&lpi_mt) /* Unused - just a valid pointer */
+
+static int alloc_lpi_range(u32 lpis, u32 *base)
+{
+	int ret;
+	void *entry;
+	unsigned long lpi_base, startp, lastp;
+
+	MA_STATE(mas, &lpi_mt, 0, 0);
+
+	if (!num_lpis)
+		return -ENODEV;
+
+	mtree_lock(&lpi_mt);
+	ret = mas_empty_area(&mas, 0, num_lpis - 1, lpis);
+	if (ret) {
+		pr_err("Failed to perform a dynamic alloc in the LPI MT!\n");
+		return ret;
+	}
+
+	lpi_base = mas.index;
+
+	/*
+	 * We don't really care about the entry itself, only about
+	 * allocation of a maple tree ranges describing in use LPIs.
+	 * That's why, upon allocation, we try to merge slots adjacent
+	 * with the empty one we are allocating to minimize the number
+	 * of slots we take from maple tree nodes for nothing, all
+	 * we need to keep track of is in use ranges.
+	 */
+	startp = mas.index;
+	lastp = mas.last;
+
+	entry = mas_next(&mas, num_lpis - 1);
+	if (entry && mas.index == lastp + 1)
+		lastp = mas.last;
+
+	entry = mas_prev(&mas, 0);
+	if (entry)
+		startp = mas.index;
+	mas_set_range(&mas, startp, lastp);
+	mas_store_gfp(&mas, MT_ENTRY, GFP_KERNEL);
+	mtree_unlock(&lpi_mt);
+
+	// startp is the index at which we allocated, i.e. the base LPI.
+	*base = lpi_base;
+
+	return 0;
+}
+
+// Drop entries between min and max (inclusive)
+static int release_lpi_range(u32 min, u32 max)
+{
+	return mtree_store_range(&lpi_mt, min, max, NULL, GFP_KERNEL);
+}
+
+static int gicv5_alloc_lpi_range(u32 nr_lpis, u32 *base)
+{
+	return alloc_lpi_range(nr_lpis, base);
+}
+
+static int gicv5_free_lpi_range(u32 base, u32 nr_lpis)
+{
+	if (nr_lpis < 1)
+		return -EINVAL;
+
+	return release_lpi_range(base, base + nr_lpis - 1);
+}
+
 static void gicv5_ppi_priority_init(void)
 {
 	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRIORITY_MI),
@@ -74,7 +160,8 @@ static void gicv5_hwirq_init(irq_hw_number_t hwirq, u8 priority, u8 hwirq_type)
 	u16 iaffid;
 	int ret;
 
-	if (hwirq_type == GICV5_HWIRQ_TYPE_SPI) {
+	if (hwirq_type == GICV5_HWIRQ_TYPE_LPI ||
+	    hwirq_type == GICV5_HWIRQ_TYPE_SPI) {
 		cdpri = FIELD_PREP(GICV5_GIC_CDPRI_PRIORITY_MASK, priority)	|
 			FIELD_PREP(GICV5_GIC_CDPRI_TYPE_MASK, hwirq_type)	|
 			FIELD_PREP(GICV5_GIC_CDPRI_ID_MASK, hwirq);
@@ -123,6 +210,11 @@ static void gicv5_spi_irq_mask(struct irq_data *d)
 	gicv5_iri_irq_mask(d, GICV5_HWIRQ_TYPE_SPI);
 }
 
+static void gicv5_lpi_irq_mask(struct irq_data *d)
+{
+	gicv5_iri_irq_mask(d, GICV5_HWIRQ_TYPE_LPI);
+}
+
 static void gicv5_ppi_irq_unmask(struct irq_data *d)
 {
 	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
@@ -145,6 +237,11 @@ static void gicv5_spi_irq_unmask(struct irq_data *d)
 	gicv5_iri_irq_unmask(d, GICV5_HWIRQ_TYPE_SPI);
 }
 
+static void gicv5_lpi_irq_unmask(struct irq_data *d)
+{
+	gicv5_iri_irq_unmask(d, GICV5_HWIRQ_TYPE_LPI);
+}
+
 static void gicv5_hwirq_eoi(u32 hwirq_id, u8 hwirq_type)
 {
 	u64 cddi = hwirq_id | FIELD_PREP(GICV5_GIC_CDDI_TYPE_MASK, hwirq_type);
@@ -164,6 +261,11 @@ static void gicv5_spi_irq_eoi(struct irq_data *d)
 	gicv5_hwirq_eoi(d->hwirq, GICV5_HWIRQ_TYPE_SPI);
 }
 
+static void gicv5_lpi_irq_eoi(struct irq_data *d)
+{
+	gicv5_hwirq_eoi(d->hwirq, GICV5_HWIRQ_TYPE_LPI);
+}
+
 static int gicv5_ppi_set_type(struct irq_data *d, unsigned int type)
 {
 	/*
@@ -232,6 +334,14 @@ static int gicv5_spi_irq_set_affinity(struct irq_data *d,
 					  GICV5_HWIRQ_TYPE_SPI);
 }
 
+static int gicv5_lpi_irq_set_affinity(struct irq_data *d,
+				      const struct cpumask *mask_val,
+				      bool force)
+{
+	return gicv5_iri_irq_set_affinity(d, mask_val, force,
+					  GICV5_HWIRQ_TYPE_LPI);
+}
+
 static int gicv5_ppi_irq_get_irqchip_state(struct irq_data *d,
 					   enum irqchip_irq_state which,
 					   bool *val)
@@ -321,6 +431,14 @@ static int gicv5_spi_irq_get_irqchip_state(struct irq_data *d,
 					       GICV5_HWIRQ_TYPE_SPI);
 }
 
+static int gicv5_lpi_irq_get_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool *val)
+{
+	return gicv5_iri_irq_get_irqchip_state(d, which, val,
+					       GICV5_HWIRQ_TYPE_LPI);
+}
+
 static int gicv5_ppi_irq_set_irqchip_state(struct irq_data *d,
 					   enum irqchip_irq_state which,
 					   bool val)
@@ -396,6 +514,11 @@ static void gicv5_spi_irq_write_pending_state(struct irq_data *d, bool val)
 	gicv5_iri_irq_write_pending_state(d, val, GICV5_HWIRQ_TYPE_SPI);
 }
 
+static void gicv5_lpi_irq_write_pending_state(struct irq_data *d, bool val)
+{
+	gicv5_iri_irq_write_pending_state(d, val, GICV5_HWIRQ_TYPE_LPI);
+}
+
 static int gicv5_spi_irq_set_irqchip_state(struct irq_data *d,
 					   enum irqchip_irq_state which,
 					   bool val)
@@ -418,12 +541,47 @@ static int gicv5_spi_irq_set_irqchip_state(struct irq_data *d,
 	return 0;
 }
 
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
 static int gicv5_spi_irq_retrigger(struct irq_data *data)
 {
 	return !gicv5_spi_irq_set_irqchip_state(data, IRQCHIP_STATE_PENDING,
 						true);
 }
 
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
 static const struct irq_chip gicv5_ppi_irq_chip = {
 	.name			= "GICv5-PPI",
 	.irq_mask		= gicv5_ppi_irq_mask,
@@ -452,6 +610,35 @@ static const struct irq_chip gicv5_spi_irq_chip = {
 				  IRQCHIP_MASK_ON_SUSPEND
 };
 
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
 static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
 					  struct irq_fwspec *fwspec,
 					  irq_hw_number_t *hwirq,
@@ -607,6 +794,120 @@ static const struct irq_domain_ops gicv5_irq_spi_domain_ops = {
 	.select		= gicv5_irq_spi_domain_select
 };
 
+static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain,
+				      unsigned int virq, unsigned int nr_irqs,
+				      void *arg)
+{
+	irq_hw_number_t hwirq;
+	struct irq_data *irqd;
+	u32 *base_lpi = arg;
+	int i, ret;
+
+	hwirq = *base_lpi;
+
+	for (i = 0; i < nr_irqs; i++) {
+		irqd = irq_desc_get_irq_data(irq_to_desc(virq + i));
+
+		irq_domain_set_info(domain, virq + i, hwirq + i,
+				    &gicv5_lpi_irq_chip, NULL,
+				    handle_fasteoi_irq, NULL, NULL);
+		irqd_set_single_target(irqd);
+
+		ret = gicv5_irs_iste_alloc(hwirq + i);
+		if (ret < 0)
+			return ret;
+
+		gicv5_hwirq_init((hwirq + i), GICV5_IRQ_PRIORITY_MI,
+					      GICV5_HWIRQ_TYPE_LPI);
+	}
+
+	return 0;
+}
+
+static void gicv5_irq_lpi_domain_free(struct irq_domain *domain,
+				      unsigned int virq, unsigned int nr_irqs)
+{
+	int i;
+
+	for (i = 0; i < nr_irqs; i++) {
+		struct irq_data *d = irq_domain_get_irq_data(domain, virq + i);
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
+	gicv5_global_data.lpi_domain = irq_domain_create_tree(NULL,
+				&gicv5_irq_lpi_domain_ops, NULL);
+}
+
+void __init gicv5_free_lpi_domain(void)
+{
+	irq_domain_remove(gicv5_global_data.lpi_domain);
+}
+
+static int gicv5_irq_ipi_domain_alloc(struct irq_domain *domain,
+				      unsigned int virq, unsigned int nr_irqs,
+				      void *arg)
+{
+	int ret, i;
+	u32 lpi;
+	struct irq_data *irqd = irq_desc_get_irq_data(irq_to_desc(virq));
+
+	// Get LPIs for the IPIs
+	ret = gicv5_alloc_lpi_range(nr_irqs, &lpi);
+	if (ret)
+		return ret;
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &lpi);
+	if (ret) {
+		gicv5_free_lpi_range(lpi, nr_irqs);
+		return ret;
+	}
+
+	for (i = 0; i < nr_irqs; i++) {
+		irqd = irq_desc_get_irq_data(irq_to_desc(virq + i));
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
+static void gicv5_irq_ipi_domain_free(struct irq_domain *domain,
+				      unsigned int virq, unsigned int nr_irqs)
+{
+	for (unsigned int i = 0; i < nr_irqs; i++) {
+		struct irq_data *d = irq_domain_get_irq_data(domain, virq + i);
+
+		if (WARN_ON(!d))
+			return;
+
+		gicv5_free_lpi_range(d->parent_data->hwirq, 1);
+
+		irq_set_handler(virq + i, NULL);
+		irq_domain_reset_irq_data(d);
+	}
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+}
+
+static const struct irq_domain_ops gicv5_irq_ipi_domain_ops = {
+	.alloc	= gicv5_irq_ipi_domain_alloc,
+	.free	= gicv5_irq_ipi_domain_free,
+};
+
 static inline void handle_irq_per_domain(u32 hwirq)
 {
 	u32 hwirq_id;
@@ -619,6 +920,8 @@ static inline void handle_irq_per_domain(u32 hwirq)
 		domain = gicv5_global_data.ppi_domain;
 	else if (hwirq_type == GICV5_HWIRQ_TYPE_SPI)
 		domain = gicv5_global_data.spi_domain;
+	else if (hwirq_type == GICV5_HWIRQ_TYPE_LPI)
+		domain = gicv5_global_data.lpi_domain;
 
 	if (generic_handle_domain_irq(domain, hwirq_id)) {
 		pr_err("Could not handle, hwirq = 0x%x", hwirq_id);
@@ -706,6 +1009,8 @@ static void __init gicv5_free_domains(void)
 		irq_domain_remove(gicv5_global_data.ppi_domain);
 	if (gicv5_global_data.spi_domain)
 		irq_domain_remove(gicv5_global_data.spi_domain);
+	if (gicv5_global_data.ipi_domain)
+		irq_domain_remove(gicv5_global_data.ipi_domain);
 }
 
 static int __init gicv5_init_domains(struct fwnode_handle *handle)
@@ -732,6 +1037,19 @@ static int __init gicv5_init_domains(struct fwnode_handle *handle)
 					    DOMAIN_BUS_WIRED);
 	}
 
+	if (!WARN(!gicv5_global_data.lpi_domain,
+		  "LPI domain uninitialized, can't set up IPIs")) {
+		gicv5_global_data.ipi_domain = irq_domain_create_hierarchy(
+			gicv5_global_data.lpi_domain, 0,
+			GICV5_IPIS_PER_CPU * nr_cpu_ids,
+			NULL, &gicv5_irq_ipi_domain_ops, NULL);
+
+		if (WARN_ON(!gicv5_global_data.ipi_domain)) {
+			gicv5_free_domains();
+			return -ENOMEM;
+		}
+	}
+
 	return 0;
 }
 
@@ -753,6 +1071,25 @@ static void gicv5_set_cpuif_pribits(void)
 	}
 }
 
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
 static int __init gicv5_of_init(struct device_node *node,
 				struct device_node *parent)
 {
@@ -769,6 +1106,7 @@ static int __init gicv5_of_init(struct device_node *node,
 	}
 
 	gicv5_set_cpuif_pribits();
+	gicv5_set_cpuif_idbits();
 
 	pri_bits = min_not_zero(gicv5_global_data.cpuif_pri_bits,
 		       gicv5_global_data.irs_pri_bits);
@@ -781,6 +1119,13 @@ static int __init gicv5_of_init(struct device_node *node,
 	}
 
 	ret = set_handle_irq(gicv5_handle_irq);
+	if (ret) {
+		gicv5_irs_remove();
+		gicv5_free_domains();
+		gicv5_cpu_disable_interrupts();
+	}
+
+	ret = gicv5_irs_enable();
 	if (ret) {
 		gicv5_irs_remove();
 		gicv5_free_domains();
diff --git a/drivers/irqchip/irq-gic-v5.h b/drivers/irqchip/irq-gic-v5.h
index 57e2472f1f2a9984f399d2a8633c824bc208da26..8376da2a342d14568a71c0bc85b79c4e7b83a66c 100644
--- a/drivers/irqchip/irq-gic-v5.h
+++ b/drivers/irqchip/irq-gic-v5.h
@@ -6,12 +6,16 @@
 #define __LINUX_IRQCHIP_GIC_V5_H
 
 #include <asm/arch_gicv5.h>
+#include <asm/smp.h>
+
+#define GICV5_IPIS_PER_CPU		MAX_IPI
 
 #define GICV5_HWIRQ_ID			GENMASK(23, 0)
 #define GICV5_HWIRQ_TYPE		GENMASK(31, 29)
 #define GICV5_HWIRQ_INTID		GENMASK_ULL(31, 0)
 
 #define GICV5_HWIRQ_TYPE_PPI		UL(0x1)
+#define GICV5_HWIRQ_TYPE_LPI		UL(0x2)
 #define GICV5_HWIRQ_TYPE_SPI		UL(0x3)
 
 #define GICV5_PPI_HM_EDGE		UL(0x0)
@@ -43,6 +47,10 @@
 #define GICV5_IRS_PE_SELR		0x0140
 #define GICV5_IRS_PE_STATUSR		0x0144
 #define GICV5_IRS_PE_CR0		0x0148
+#define GICV5_IRS_IST_BASER		0x0180
+#define GICV5_IRS_IST_CFGR		0x0190
+#define GICV5_IRS_IST_STATUSR		0x0194
+#define GICV5_IRS_MAP_L2_ISTR		0x01c0
 
 #define GICV5_IRS_IDR1_PRIORITY_BITS	GENMASK(22, 20)
 #define GICV5_IRS_IDR1_IAFFID_BITS	GENMASK(19, 16)
@@ -53,10 +61,22 @@
 #define GICV5_IRS_IDR1_PRIORITY_BITS_4BITS	0b011
 #define GICV5_IRS_IDR1_PRIORITY_BITS_5BITS	0b100
 
+#define GICV5_IRS_IDR2_ISTMD_SZ		GENMASK(19, 15)
+#define GICV5_IRS_IDR2_ISTMD		BIT(14)
+#define GICV5_IRS_IDR2_IST_L2SZ		GENMASK(13, 11)
+#define GICV5_IRS_IDR2_IST_LEVELS	BIT(10)
+#define GICV5_IRS_IDR2_MIN_LPI_ID_BITS	GENMASK(9, 6)
+#define GICV5_IRS_IDR2_LPI		BIT(5)
+#define GICV5_IRS_IDR2_ID_BITS		GENMASK(4, 0)
+
 #define GICV5_IRS_IDR5_SPI_RANGE	GENMASK(24, 0)
 #define GICV5_IRS_IDR6_SPI_IRS_RANGE	GENMASK(24, 0)
 #define GICV5_IRS_IDR7_SPI_BASE		GENMASK(23, 0)
 
+#define GICV5_IRS_IST_L2SZ_SUPPORT_4KB(r)	FIELD_GET(BIT(11), (r))
+#define GICV5_IRS_IST_L2SZ_SUPPORT_16KB(r)	FIELD_GET(BIT(12), (r))
+#define GICV5_IRS_IST_L2SZ_SUPPORT_64KB(r)	FIELD_GET(BIT(13), (r))
+
 #define GICV5_IRS_CR0_IDLE		BIT(1)
 #define GICV5_IRS_CR0_IRSEN		BIT(0)
 
@@ -88,14 +108,50 @@
 
 #define GICV5_IRS_PE_CR0_DPS		BIT(0)
 
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
 struct gicv5_chip_data {
 	struct fwnode_handle	*fwnode;
 	struct irq_domain	*ppi_domain;
 	struct irq_domain	*spi_domain;
+	struct irq_domain	*lpi_domain;
+	struct irq_domain	*ipi_domain;
 	u32			global_spi_count;
 	u8			cpuif_pri_bits;
+	u8			cpuif_id_bits;
 	u8			irs_pri_bits;
 	u8			irs_iaffid_bits;
+	struct {
+		__le64 *l1ist_addr;
+		u32 l2_size;
+		u8 l2_bits;
+		bool l2;
+	} ist;
 };
 
 extern struct gicv5_chip_data gicv5_global_data __read_mostly;
@@ -110,11 +166,19 @@ struct gicv5_irs_chip_data {
 	raw_spinlock_t		spi_config_lock;
 };
 
+void __init gicv5_init_lpi_domain(void);
+void __init gicv5_free_lpi_domain(void);
+
 int gicv5_irs_of_probe(struct device_node *parent);
 void gicv5_irs_remove(void);
+int gicv5_irs_enable(void);
 int gicv5_irs_register_cpu(int cpuid);
 int gicv5_irs_cpu_to_iaffid(int cpu_id, u16 *iaffid);
 struct gicv5_irs_chip_data *gicv5_irs_lookup_by_spi_id(u32 spi_id);
 int gicv5_spi_irq_set_type(struct irq_data *d, unsigned int type);
+int gicv5_spi_set_type(struct irq_data *d, unsigned int type);
+int gicv5_irs_iste_alloc(u32 lpi);
 
+void gicv5_init_lpi(u32 max);
+void gicv5_free_lpi(void);
 #endif

-- 
2.48.0

