Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1132267B65;
	Tue,  8 Apr 2025 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109533; cv=none; b=gmRofve6e4TlMLcg8f1yjhRdO07AIgyTmoMFlybiAsvpvmkQAG9iKzg2TPhwQ4mR4j5GoAkMTcKBaOrJOa8AR1gsuWmOb6vL1VFT6czm01/QqDsPQueMY+8XfuoXLAO/iTMGbBtJkGuImAHkAF71wTqrORv1spn2agzKMopFitE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109533; c=relaxed/simple;
	bh=VWbKskICjszzODfmcIHRFNDwR7rzLsL1xOAkLUxLHSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FALPEa2DPkA/95sHDhwg5fIPDYoYU3iTFTbSNp3oJgUEswQXeS0BOKzrKVieMbFp+lUHhyQlaghhGAdcFBBnhPFS5jqXNskBHDJCJvbcAofWvWepoxjt2lt7FChU/WUieLSAB3PVR4/vuO1ygSjZc/tesDIYkFPC0uwWF6c8M+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUL4j67x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUL4j67x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10EDC4CEE7;
	Tue,  8 Apr 2025 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109532;
	bh=VWbKskICjszzODfmcIHRFNDwR7rzLsL1xOAkLUxLHSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mUL4j67xgNQ+lX3F73gG1z+ao2XpcNrIrqMFOh5zT0QvTpI954vhx3kiBBCjQE1J5
	 q1Zn4orWvyzHAu4xCjAc3cQS3RC7/3LRmwvI0BRcesRB0S68Ic2+pEYjNkVV1fiSDX
	 bbWnV8BJi8RDJt/RkbksVIgrm81GRVFfdHSpBkzosWHg85u+BxRyASW2U9OcKZjXqN
	 nbGqpXSYw9u7uFfXE5JeEk5MSYTcVTCtomFbOrgfJubhK2jT8HBVpOcUZVSHZXmDp1
	 wLiDiu1G3m2yij+O58jCLTwjPNZDEiXT9qID+zV+El11ncWn21oV4rHdC58Y9lkocX
	 Tduj3Ig9P1aHA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:22 +0200
Subject: [PATCH 23/24] irqchip/gic-v5: Add GICv5 IWB support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-23-1f26db465f8d@kernel.org>
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

The GICv5 architecture implements the Interrupt Wire Bridge (IWB) in
order to support wired interrupts that cannot be connected directly
to an IRS and instead uses the ITS to translate a wire event into
an IRQ signal.

An IWB is a special ITS device with its own deviceID; upon probe,
an IWB calls into the ITS driver to allocate DT/ITT tables for its
events (ie wires).

An IWB is always associated with a single ITS in the system.

An IWB is connected to an ITS and it has its own deviceID for all
interrupt wires that it manages; the IWB input wire number is
exposed to the ITS as an eventID. This eventID is not programmable
and therefore requires special handling in the ITS driver.

Add an IWB driver in order to:

- Probe IWBs in the system and allocate ITS tables
- Manage IWB IRQ domains
- Handle IWB input wires state (enable/disable)
- Add the required IWB IRQchip representation
- Handle firmware representation to Linux IRQ translation

Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/Makefile         |   2 +-
 drivers/irqchip/irq-gic-v5-its.c |  70 ++++++--
 drivers/irqchip/irq-gic-v5-iwb.c | 377 +++++++++++++++++++++++++++++++++++++++
 drivers/irqchip/irq-gic-v5.c     |   2 +
 drivers/irqchip/irq-gic-v5.h     |  28 +++
 5 files changed, 459 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 4280395e3bdff7858102f0b4eaaea1121cace52f..7bfb2369fbe494a64b72308d95ae33de93c6b8c6 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -37,7 +37,7 @@ obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o
 obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
 obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
 obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o
-obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o
+obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o irq-gic-v5-iwb.o
 obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
 obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
 obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index f4f381e6c3af896f354e7e03bc2452b8a65cf093..84ce6032f36724e4f17d6169a7d1933ed11f9110 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -779,9 +779,8 @@ static struct gicv5_its_dev *gicv5_its_find_device(
 	return dev ? dev : ERR_PTR(-ENODEV);
 }
 
-static struct gicv5_its_dev *gicv5_its_alloc_device(
-				struct gicv5_its_chip_data *its, int nvec,
-				u32 dev_id)
+struct gicv5_its_dev *gicv5_its_alloc_device(struct gicv5_its_chip_data *its,
+					     int nvec, u32 dev_id, bool is_iwb)
 {
 	int ret;
 	struct gicv5_its_dev *its_dev;
@@ -808,6 +807,7 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
 	its_dev->device_id = dev_id;
 	its_dev->num_events = nvec;
 	its_dev->num_mapped_events = 0;
+	its_dev->is_iwb = is_iwb;
 
 	ret = gicv5_its_device_register(its, its_dev);
 	if (ret) {
@@ -820,9 +820,11 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
 
 	/*
 	 * This is the first time we have seen this device. Hence, it is not
-	 * shared.
+	 * shared, unless it is an IWB that is a shared ITS device by
+	 * definition, its eventids are hardcoded and never change - we allocate
+	 * it once for all and never free it.
 	 */
-	its_dev->shared = false;
+	its_dev->shared = is_iwb;
 
 	its_dev->its_node = its;
 
@@ -852,7 +854,7 @@ static int gicv5_its_msi_prepare(struct irq_domain *domain, struct device *dev,
 
 	guard(mutex)(&its->dev_alloc_lock);
 
-	its_dev = gicv5_its_alloc_device(its, nvec, dev_id);
+	its_dev = gicv5_its_alloc_device(its, nvec, dev_id, false);
 	if (IS_ERR(its_dev))
 		return PTR_ERR(its_dev);
 
@@ -930,28 +932,55 @@ static void gicv5_its_free_event(struct gicv5_its_dev *its_dev, u16 event_id)
 }
 
 static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev,
+				   msi_alloc_info_t *info,
 				   unsigned int nr_irqs, u32 *eventid)
 {
-	int ret;
+	int event_id_base;
 
-	ret = bitmap_find_free_region(its_dev->event_map,
-				      its_dev->num_events,
-				      get_count_order(nr_irqs));
+	if (!its_dev->is_iwb) {
 
-	if (ret < 0)
-		return ret;
+		event_id_base = bitmap_find_free_region(
+			its_dev->event_map, its_dev->num_events,
+			get_count_order(nr_irqs));
+		if (event_id_base < 0)
+			return event_id_base;
+	} else {
+		/*
+		 * We want to have a fixed EventID mapped for the IWB.
+		 */
+		if (WARN(nr_irqs != 1, "IWB requesting nr_irqs != 1\n"))
+			return -EINVAL;
 
-	*eventid = ret;
+		event_id_base = info->scratchpad[1].ul;
+
+		if (event_id_base >= its_dev->num_events) {
+			pr_err("EventID ouside of ITT range; cannot allocate an ITT entry!\n");
+
+			return -EINVAL;
+		}
+
+		if (test_and_set_bit(event_id_base, its_dev->event_map)) {
+			pr_warn("Can't reserve event_id bitmap\n");
+			return -EINVAL;
+
+		}
+	}
+
+	*eventid = event_id_base;
 
 	return 0;
+
 }
 
 static void gicv5_its_free_eventid(struct gicv5_its_dev *its_dev,
 				   u32 event_id_base,
 				   unsigned int nr_irqs)
 {
-	bitmap_release_region(its_dev->event_map, event_id_base,
+	if (!its_dev->is_iwb)
+		bitmap_release_region(its_dev->event_map, event_id_base,
 				      get_count_order(nr_irqs));
+	else
+		clear_bit(event_id_base, its_dev->event_map);
 }
 
 static int gicv5_its_irq_domain_alloc(struct irq_domain *domain,
@@ -977,14 +1006,17 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain,
 	if (IS_ERR(its_dev))
 		return PTR_ERR(its_dev);
 
-	ret = gicv5_its_alloc_eventid(its_dev, nr_irqs, &event_id_base);
+	ret = gicv5_its_alloc_eventid(its_dev, info, nr_irqs, &event_id_base);
 	if (ret)
 		return ret;
 
-	ret = iommu_dma_prepare_msi(info->desc,
-				    its->its_trans_phys_base);
-	if (ret)
-		goto out_eventid;
+	/* IWB are never upstream an IOMMU */
+	if (!its_dev->is_iwb) {
+		ret = iommu_dma_prepare_msi(info->desc,
+					    its->its_trans_phys_base);
+		if (ret)
+			goto out_eventid;
+	}
 
 	ret = gicv5_alloc_lpi_range(nr_irqs, &lpi_base);
 	if (ret) {
diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
new file mode 100644
index 0000000000000000000000000000000000000000..5938d271f5bcf2c926dc58d1664e30ee75139479
--- /dev/null
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2025 ARM Limited, All Rights Reserved.
+ */
+#define pr_fmt(fmt)	"GICv5 IWB: " fmt
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/irqchip.h>
+#include <linux/iopoll.h>
+#include <linux/msi.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+
+#include "irq-gic-v5.h"
+
+static u32 iwb_readl(struct gicv5_iwb_chip_data *iwb_node, const u64 reg_offset)
+{
+	return readl_relaxed(iwb_node->iwb_base + reg_offset);
+}
+
+static void iwb_writel(struct gicv5_iwb_chip_data *iwb_node, const u32 val,
+		       const u64 reg_offset)
+{
+	writel_relaxed(val, iwb_node->iwb_base + reg_offset);
+}
+
+static int gicv5_iwb_wait_for_wenabler(struct gicv5_iwb_chip_data *iwb_node)
+{
+	int ret;
+	u32 val;
+
+	ret = readl_relaxed_poll_timeout_atomic(
+			iwb_node->iwb_base + GICV5_IWB_WENABLE_STATUSR, val,
+			FIELD_GET(GICV5_IWB_WENABLE_STATUSR_IDLE, val), 1,
+			USEC_PER_SEC);
+
+	if (ret == -ETIMEDOUT)
+		pr_err_ratelimited("GICv5 IWB_WENABLE_STATUSR timeout\n");
+
+	return ret;
+}
+
+static int __gicv5_iwb_set_wire_enable(struct gicv5_iwb_chip_data *iwb_node,
+				       u32 iwb_wire, bool enable)
+{
+	u32 val;
+	u32 n = iwb_wire / 32;
+	u8 i = iwb_wire % 32;
+
+	if (n >= iwb_node->nr_regs) {
+		pr_err("IWB_WENABLER<n> is invalid for n=%u\n", n);
+		return -EINVAL;
+	}
+
+	/*
+	 * Enable IWB wire/pin at this point
+	 * Note: This is not the same as enabling the interrupt
+	 */
+	val = iwb_readl(iwb_node, GICV5_IWB_WENABLER + (4 * n));
+	if (enable)
+		val |= BIT(i);
+	else
+		val &= ~BIT(i);
+	iwb_writel(iwb_node, val, GICV5_IWB_WENABLER + (4 * n));
+
+	return gicv5_iwb_wait_for_wenabler(iwb_node);
+}
+
+static int gicv5_iwb_enable_wire(struct gicv5_iwb_chip_data *iwb_node,
+				 u32 iwb_wire)
+{
+	return __gicv5_iwb_set_wire_enable(iwb_node, iwb_wire, true);
+}
+
+static int gicv5_iwb_disable_wire(struct gicv5_iwb_chip_data *iwb_node,
+				  u32 iwb_wire)
+{
+	return __gicv5_iwb_set_wire_enable(iwb_node, iwb_wire, false);
+}
+
+static int gicv5_iwb_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gicv5_iwb_chip_data *iwb_node = irq_data_get_irq_chip_data(d);
+	u32 iwb_wire, n, wtmr;
+	u8 i;
+
+	iwb_wire = d->hwirq;
+
+	i = iwb_wire % 32;
+	n = iwb_wire / 32;
+
+	WARN_ON(n >= iwb_node->nr_regs);
+
+	wtmr = iwb_readl(iwb_node, GICV5_IWB_WTMR + (4 * n));
+
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+	case IRQ_TYPE_LEVEL_LOW:
+		wtmr |= BIT(i);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_EDGE_FALLING:
+		wtmr &= ~BIT(i);
+		break;
+	default:
+		pr_debug("unexpected wire trigger mode");
+		return -EINVAL;
+	}
+
+	iwb_writel(iwb_node, wtmr, GICV5_IWB_WTMR + (4 * n));
+
+	return 0;
+}
+
+static const struct irq_chip gicv5_iwb_chip = {
+	.name			= "GICv5-IWB",
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_set_type		= gicv5_iwb_set_type,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_MASK_ON_SUSPEND
+};
+
+static int gicv5_iwb_irq_domain_translate(struct irq_domain *d,
+					  struct irq_fwspec *fwspec,
+					  irq_hw_number_t *hwirq,
+					  unsigned int *type)
+{
+	if (is_of_node(fwspec->fwnode)) {
+		if (fwspec->param_count < 2)
+			return -EINVAL;
+
+		/*
+		 * param[0] is be the wire
+		 * param[1] is the interrupt type
+		 */
+		*hwirq = fwspec->param[0];
+
+		*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static void gicv5_iwb_irq_domain_free(struct irq_domain *domain,
+				      unsigned int virq, unsigned int nr_irqs)
+{
+	/* Free the local data, and then go up the hierarchy doing the same */
+	struct gicv5_iwb_chip_data *iwb_node = domain->host_data;
+	struct irq_data *data;
+
+	if (WARN_ON(nr_irqs != 1))
+		return;
+
+	data = irq_domain_get_irq_data(domain, virq);
+	gicv5_iwb_disable_wire(iwb_node, data->hwirq);
+
+	irq_domain_reset_irq_data(data);
+
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+}
+
+/*
+ * Our parent is the ITS, which expects MSI devices with programmable
+ * event IDs. IWB event IDs are hardcoded.
+ *
+ * Use the msi_alloc_info_t structure to convey both our DeviceID
+ * (scratchpad[0]), and the wire that we are attempting to map to an LPI in
+ * the ITT (scratchpad[1]).
+ */
+static int iwb_alloc_lpi_irq_parent(struct irq_domain *domain,
+				    unsigned int virq, irq_hw_number_t hwirq)
+{
+	msi_alloc_info_t info;
+	struct gicv5_iwb_chip_data *iwb_node = domain->host_data;
+
+	info.scratchpad[0].ul = iwb_node->device_id;
+	info.scratchpad[1].ul = hwirq;
+	info.hwirq = hwirq;
+
+	return irq_domain_alloc_irqs_parent(domain, virq, 1, &info);
+}
+
+static int gicv5_iwb_irq_domain_alloc(struct irq_domain *domain,
+				      unsigned int virq, unsigned int nr_irqs,
+				      void *arg)
+{
+	int ret;
+	irq_hw_number_t hwirq;
+	unsigned int type = IRQ_TYPE_NONE;
+	struct irq_fwspec *fwspec = arg;
+	struct irq_data *irqd;
+	struct gicv5_iwb_chip_data *iwb_node;
+
+	if (WARN_ON(nr_irqs != 1))
+		return -EINVAL;
+
+	ret = gicv5_iwb_irq_domain_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
+	iwb_node = domain->host_data;
+
+	if (iwb_alloc_lpi_irq_parent(domain, virq, hwirq))
+		return -EINVAL;
+
+	gicv5_iwb_enable_wire(iwb_node, hwirq);
+
+	irq_domain_set_info(domain, virq, hwirq, &gicv5_iwb_chip, iwb_node,
+			    handle_fasteoi_irq, NULL, NULL);
+	irq_set_probe(virq);
+	irqd_set_single_target(irqd);
+
+	return 0;
+}
+
+static int gicv5_iwb_irq_domain_select(struct irq_domain *d,
+				       struct irq_fwspec *fwspec,
+				       enum irq_domain_bus_token bus_token)
+{
+	struct gicv5_iwb_chip_data *iwb_node;
+
+	/* Not for us */
+	if (fwspec->fwnode != d->fwnode)
+		return 0;
+
+	iwb_node = d->host_data;
+
+	return (d == iwb_node->domain);
+}
+
+static const struct irq_domain_ops gicv5_iwb_irq_domain_ops = {
+	.translate	= gicv5_iwb_irq_domain_translate,
+	.alloc		= gicv5_iwb_irq_domain_alloc,
+	.free		= gicv5_iwb_irq_domain_free,
+	.select		= gicv5_iwb_irq_domain_select
+};
+
+static struct gicv5_iwb_chip_data *
+__init gicv5_iwb_init_bases(void __iomem *iwb_base,
+			     struct fwnode_handle *handle,
+			     struct irq_domain *parent_domain, u32 device_id)
+{
+	u32 nr_wires, idr0, cr0;
+	struct gicv5_iwb_chip_data *iwb_node;
+	struct msi_domain_info *msi_info;
+	struct gicv5_its_chip_data *its;
+	struct gicv5_its_dev *its_dev;
+	int ret;
+
+	msi_info = msi_get_domain_info(parent_domain);
+	its = msi_info->data;
+	if (!its) {
+		pr_warn("IWB %pOF can't find parent ITS, bailing\n",
+			to_of_node(handle));
+		return ERR_PTR(-ENODEV);
+	}
+
+	iwb_node = kzalloc(sizeof(*iwb_node), GFP_KERNEL);
+	if (!iwb_node)
+		return ERR_PTR(-ENOMEM);
+
+	iwb_node->iwb_base = iwb_base;
+	iwb_node->device_id = device_id;
+
+	idr0 = iwb_readl(iwb_node, GICV5_IWB_IDR0);
+	nr_wires = (FIELD_GET(GICV5_IWB_IDR0_IW_RANGE, idr0) + 1) * 32;
+
+	iwb_node->domain = irq_domain_create_hierarchy(parent_domain, 0,
+			   nr_wires, handle, &gicv5_iwb_irq_domain_ops,
+			   iwb_node);
+	irq_domain_update_bus_token(iwb_node->domain, DOMAIN_BUS_WIRED);
+
+	cr0 = iwb_readl(iwb_node, GICV5_IWB_CR0);
+	if (!FIELD_GET(GICV5_IWB_CR0_IWBEN, cr0)) {
+		pr_err("IWB %s must be enabled in firmware\n",
+		       fwnode_get_name(handle));
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	iwb_node->nr_regs = FIELD_GET(GICV5_IWB_IDR0_IW_RANGE, idr0) + 1;
+
+	for (unsigned int n = 0; n < iwb_node->nr_regs; n++)
+		iwb_writel(iwb_node, 0, GICV5_IWB_WENABLER + (sizeof(u32) * n));
+
+	ret = gicv5_iwb_wait_for_wenabler(iwb_node);
+	if (ret)
+		goto out_free;
+
+	guard(mutex)(&its->dev_alloc_lock);
+
+	its_dev = gicv5_its_alloc_device(its, roundup_pow_of_two(nr_wires),
+					 device_id, true);
+	if (IS_ERR(its_dev)) {
+		ret = -ENODEV;
+		goto out_free;
+	}
+
+	return iwb_node;
+out_free:
+	irq_domain_remove(iwb_node->domain);
+	kfree(iwb_node);
+
+	return ERR_PTR(ret);
+}
+
+static int __init gicv5_iwb_of_init(struct device_node *node)
+{
+	struct gicv5_iwb_chip_data *iwb_node;
+	void __iomem *iwb_base;
+	u32 device_id;
+	struct irq_domain *parent_domain;
+	struct device_node *parent_its __free(device_node) = NULL;
+	struct of_phandle_args args;
+	int ret;
+
+	iwb_base = of_io_request_and_map(node, 0, "IWB");
+	if (IS_ERR(iwb_base)) {
+		pr_err("%pOF: unable to map GICv5 IWB registers\n", node);
+		return PTR_ERR(iwb_base);
+	}
+
+	ret = of_parse_phandle_with_args(node, "msi-parent", "#msi-cells", 0,
+					 &args);
+	if (ret) {
+		pr_err("%pOF: Can't retrieve deviceID\n", node);
+		goto out_unmap;
+	}
+
+	parent_its = args.np;
+	parent_domain = irq_find_matching_host(parent_its, DOMAIN_BUS_NEXUS);
+	if (!parent_domain) {
+		pr_err("Unable to find the parent ITS domain for %pOF!\n", node);
+		ret = -ENXIO;
+		goto out_unmap;
+	}
+
+	device_id = args.args[0];
+	pr_debug("IWB deviceID: 0x%x\n", device_id);
+
+	iwb_node = gicv5_iwb_init_bases(iwb_base, &node->fwnode, parent_domain,
+					device_id);
+	if (IS_ERR(iwb_node)) {
+		ret = PTR_ERR(iwb_node);
+		goto out_unmap;
+	}
+
+	return 0;
+out_unmap:
+	iounmap(iwb_base);
+	return ret;
+}
+
+void __init gicv5_iwb_of_probe(struct device_node *parent)
+{
+	int ret;
+	struct device_node *np;
+
+	for_each_available_child_of_node(parent, np) {
+		if (!of_device_is_compatible(np, "arm,gic-v5-iwb"))
+			continue;
+
+		ret = gicv5_iwb_of_init(np);
+		if (ret)
+			pr_err("Failed to init IWB %s\n", np->full_name);
+	}
+}
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 13145d8b0a038b7c13fee32a3b1bc235029e38f1..798c9772c2963f4dc08520673b90d43b88ae3fa2 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1219,6 +1219,8 @@ static int __init gicv5_of_init(struct device_node *node,
 
 	gicv5_irs_its_probe();
 
+	gicv5_iwb_of_probe(node);
+
 	return 0;
 }
 IRQCHIP_DECLARE(gic_v5, "arm,gic-v5", gicv5_of_init);
diff --git a/drivers/irqchip/irq-gic-v5.h b/drivers/irqchip/irq-gic-v5.h
index b5c3f69305f30dfa6332fd50c0b98300e3484a05..9cd4fa98a6640de7c30ef46120a65c0f7c73c789 100644
--- a/drivers/irqchip/irq-gic-v5.h
+++ b/drivers/irqchip/irq-gic-v5.h
@@ -236,6 +236,20 @@
 #define GICV5_ITS_HWIRQ_DEVICE_ID		GENMASK_ULL(31, 0)
 #define GICV5_ITS_HWIRQ_EVENT_ID		GENMASK_ULL(63, 32)
 
+#define GICV5_IWB_IDR0				0x0000
+#define GICV5_IWB_CR0				0x0080
+#define GICV5_IWB_WENABLE_STATUSR		0x00c0
+#define GICV5_IWB_WENABLER			0x2000
+#define GICV5_IWB_WTMR				0x4000
+
+#define GICV5_IWB_IDR0_INT_DOMS			GENMASK(14, 11)
+#define GICV5_IWB_IDR0_IW_RANGE			GENMASK(10, 0)
+
+#define GICV5_IWB_CR0_IDLE			BIT(1)
+#define GICV5_IWB_CR0_IWBEN			BIT(0)
+
+#define GICV5_IWB_WENABLE_STATUSR_IDLE		BIT(0)
+
 struct gicv5_chip_data {
 	struct fwnode_handle	*fwnode;
 	struct irq_domain	*ppi_domain;
@@ -332,6 +346,7 @@ struct gicv5_its_dev {
 	u32				num_events;
 	u32				num_mapped_events;
 	bool				shared;
+	bool				is_iwb;
 };
 
 void gicv5_init_lpi(u32 max);
@@ -341,4 +356,17 @@ int gicv5_alloc_lpi_range(u32 nr_lpis, u32 *base);
 int gicv5_free_lpi_range(u32 base, u32 nr_lpis);
 
 void __init gicv5_its_of_probe(struct device_node *parent);
+struct gicv5_its_dev *gicv5_its_alloc_device(struct gicv5_its_chip_data *its,
+			   int nvec, u32 dev_id, bool is_iwb);
+
+struct gicv5_iwb_chip_data {
+	void __iomem		*iwb_base;
+	struct irq_domain	*domain;
+	u64			flags;
+	u32			device_id;
+	u16			nr_regs;
+};
+
+void gicv5_iwb_of_probe(struct device_node *parent);
+
 #endif

-- 
2.48.0

