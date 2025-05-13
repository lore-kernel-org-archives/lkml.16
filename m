Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD42C0853;
	Tue, 13 May 2025 17:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158626; cv=none; b=RqqTpHbamwLYgK4GjSMLR6oBeO26dt+O5Xkdh6nMy0dg2puLp00+Si4KQDPz/+XZLI4Q6y08QkwdKSOwlI+y4f0xKDLGcYDIlKyaBCnhkBx7GD2YVIwmS5SHoCTS+yAf5Lwfeb3+9+3y9T51txUhGGuXRJj3OEBlBoPHKLyS9Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158626; c=relaxed/simple;
	bh=GRO5C91x4nRjJaonyEac6BdBi5b8arg0698FOQ6/DWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNCY2gynthimrW7f6Yu2BZVaoh4OU+dNeNF0KTPuYUoL16Za9YgPM292nVxqpM8eAGeDMBB18zO05XkXUb40mP45FXQ1nxLFKUlNAecQ1GSMIN1viA+P/W5bj7uxOgJpCFO+SZvO/8x2sg0GcyIVkjVUtjGYm65We25SSgEK+3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLbnqF+i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLbnqF+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021F3C4CEEF;
	Tue, 13 May 2025 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158625;
	bh=GRO5C91x4nRjJaonyEac6BdBi5b8arg0698FOQ6/DWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NLbnqF+iNmXaoN1tXom+9Ysuuk1U3o1uZ3j3PvMchjp94eGFrrRkbhRX0AMkW/m69
	 7V7hND/4C1BaYwNM/9vsX47p95NtpmxIvYHUtIQIK306riuN4ssuuiAcUBcy9ja5KF
	 lOBHiRQB7FPqGndq5Taq8NINXPJw5UvI1cu/4yhJcz4vFWF5yn+fCrIV1jz1yIZyZE
	 63FyQNutmTYzawrOJlwzVMI5zagWf8T+qd4HZ9hVvAic5xEVpMfDqKbbdBFsCjIQYb
	 XmXdQ+1ZkpYYYYIJQFgruSUeuqx1bHrBOjMzosMYTYrMH/ex1Mne1YuV6lYUJzynIJ
	 YICmgbJ15xuDg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:18 +0200
Subject: [PATCH v4 25/26] irqchip/gic-v5: Add GICv5 IWB support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-25-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
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

The GICv5 architecture implements the Interrupt Wire Bridge (IWB) in
order to support wired interrupts that cannot be connected directly
to an IRS and instead uses the ITS to translate a wire event into
an IRQ signal.

Add the wired-to-MSI IWB driver to manage IWB wired interrupts.

An IWB is connected to an ITS and it has its own deviceID for all
interrupt wires that it manages; the IWB input wire number must be
exposed to the ITS as an eventID with a 1:1 mapping.

This eventID is not programmable and therefore requires a new
msi_alloc_info_t flag to make sure the ITS driver does not allocate
an eventid for the wire but rather it uses the msi_alloc_info_t.hwirq
number to gather the ITS eventID.

Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/Makefile           |   3 +-
 drivers/irqchip/irq-gic-v5-its.c   |  40 ++++--
 drivers/irqchip/irq-gic-v5-iwb.c   | 285 +++++++++++++++++++++++++++++++++++++
 include/asm-generic/msi.h          |   1 +
 include/linux/irqchip/arm-gic-v5.h |  14 ++
 5 files changed, 333 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 18724910f2bdc20597d3d3e4852d593a4bd163da..1f1b22c4a39ea3c72c521c01efcc63ab0a77b31f 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -36,7 +36,8 @@ obj-$(CONFIG_ARM_GIC_ITS_PARENT)	+= irq-gic-its-msi-parent.o
 obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o
 obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
 obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
-obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o irq-gic-v5-its.o
+obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o irq-gic-v5-its.o \
+					   irq-gic-v5-iwb.o
 obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
 obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
 obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index e26becc5ce504acf4ed83c4c3b1b8d7903426ba4..f01b8e832c40a908e709ff75f7388baf21751bf7 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -863,19 +863,41 @@ static void gicv5_its_unmap_event(struct gicv5_its_dev *its_dev, u16 event_id)
 	gicv5_its_itt_cache_inv(its, its_dev->device_id, event_id);
 }
 
-static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev,
+static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev, msi_alloc_info_t *info,
 				   unsigned int nr_irqs, u32 *eventid)
 {
-	int ret;
+	int event_id_base;
 
-	ret = bitmap_find_free_region(its_dev->event_map,
-				      its_dev->num_events,
-				      get_count_order(nr_irqs));
+	if (!(info->flags & MSI_ALLOC_FLAGS_FIXED_MSG_DATA)) {
+		event_id_base = bitmap_find_free_region(its_dev->event_map,
+							its_dev->num_events,
+							get_count_order(nr_irqs));
+		if (event_id_base < 0)
+			return event_id_base;
+	} else {
+		/*
+		 * We want to have a fixed EventID mapped for hardcoded
+		 * message data allocations.
+		 */
+		if (WARN_ON_ONCE(nr_irqs != 1))
+			return -EINVAL;
 
-	if (ret < 0)
-		return ret;
+		event_id_base = info->hwirq;
 
-	*eventid = ret;
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
 }
@@ -905,7 +927,7 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
 	msi_info = msi_get_domain_info(domain);
 	its = msi_info->data;
 
-	ret = gicv5_its_alloc_eventid(its_dev, nr_irqs, &event_id_base);
+	ret = gicv5_its_alloc_eventid(its_dev, info, nr_irqs, &event_id_base);
 	if (ret)
 		return ret;
 
diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
new file mode 100644
index 0000000000000000000000000000000000000000..d65afc8f0192977836dc5d7a4a7d3db1a06242f2
--- /dev/null
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024-2025 ARM Limited, All Rights Reserved.
+ */
+#define pr_fmt(fmt)	"GICv5 IWB: " fmt
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/msi.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+#include <linux/irqchip.h>
+#include <linux/irqchip/arm-gic-v5.h>
+
+struct gicv5_iwb_chip_data {
+	void __iomem		*iwb_base;
+	u16			nr_regs;
+};
+
+static u32 iwb_readl_relaxed(struct gicv5_iwb_chip_data *iwb_node, const u32 reg_offset)
+{
+	return readl_relaxed(iwb_node->iwb_base + reg_offset);
+}
+
+static void iwb_writel_relaxed(struct gicv5_iwb_chip_data *iwb_node, const u32 val,
+			       const u32 reg_offset)
+{
+	writel_relaxed(val, iwb_node->iwb_base + reg_offset);
+}
+
+static int gicv5_iwb_wait_for_wenabler(struct gicv5_iwb_chip_data *iwb_node)
+{
+	return gicv5_wait_for_op_atomic(iwb_node->iwb_base, GICV5_IWB_WENABLE_STATUSR,
+					GICV5_IWB_WENABLE_STATUSR_IDLE, NULL);
+}
+
+static int __gicv5_iwb_set_wire_enable(struct gicv5_iwb_chip_data *iwb_node,
+				       u32 iwb_wire, bool enable)
+{
+	u32 n = iwb_wire / 32;
+	u8 i = iwb_wire % 32;
+	u32 val;
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
+	val = iwb_readl_relaxed(iwb_node, GICV5_IWB_WENABLER + (4 * n));
+	if (enable)
+		val |= BIT(i);
+	else
+		val &= ~BIT(i);
+	iwb_writel_relaxed(iwb_node, val, GICV5_IWB_WENABLER + (4 * n));
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
+static void gicv5_iwb_irq_disable(struct irq_data *d)
+{
+	struct gicv5_iwb_chip_data *iwb_node = irq_data_get_irq_chip_data(d);
+
+	gicv5_iwb_disable_wire(iwb_node, d->hwirq);
+	irq_chip_disable_parent(d);
+}
+
+static void gicv5_iwb_irq_enable(struct irq_data *d)
+{
+	struct gicv5_iwb_chip_data *iwb_node = irq_data_get_irq_chip_data(d);
+
+	gicv5_iwb_enable_wire(iwb_node, d->hwirq);
+	irq_chip_enable_parent(d);
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
+	if (n >= iwb_node->nr_regs) {
+		pr_err_once("reg %u out of range\n", n);
+		return -EINVAL;
+	}
+
+	wtmr = iwb_readl_relaxed(iwb_node, GICV5_IWB_WTMR + (4 * n));
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
+	iwb_writel_relaxed(iwb_node, wtmr, GICV5_IWB_WTMR + (4 * n));
+
+	return 0;
+}
+
+static void gicv5_iwb_domain_set_desc(msi_alloc_info_t *alloc_info, struct msi_desc *desc)
+{
+	alloc_info->desc = desc;
+	alloc_info->hwirq = (u32)desc->data.icookie.value;
+}
+
+static int gicv5_iwb_irq_domain_translate(struct irq_domain *d,
+					  struct irq_fwspec *fwspec,
+					  irq_hw_number_t *hwirq,
+					  unsigned int *type)
+{
+	if (!is_of_node(fwspec->fwnode))
+		return -EINVAL;
+
+	if (fwspec->param_count < 2)
+		return -EINVAL;
+
+	/*
+	 * param[0] is be the wire
+	 * param[1] is the interrupt type
+	 */
+	*hwirq = fwspec->param[0];
+	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+
+	return 0;
+}
+
+static void gicv5_iwb_write_msi_msg(struct irq_data *d, struct msi_msg *msg) {}
+
+static const struct msi_domain_template iwb_msi_template = {
+	.chip = {
+		.name			= "GICv5-IWB",
+		.irq_mask		= irq_chip_mask_parent,
+		.irq_unmask		= irq_chip_unmask_parent,
+		.irq_enable		= gicv5_iwb_irq_enable,
+		.irq_disable		= gicv5_iwb_irq_disable,
+		.irq_eoi		= irq_chip_eoi_parent,
+		.irq_set_type		= gicv5_iwb_set_type,
+		.irq_write_msi_msg	= gicv5_iwb_write_msi_msg,
+		.irq_set_affinity	= irq_chip_set_affinity_parent,
+		.irq_get_irqchip_state	= irq_chip_get_parent_state,
+		.irq_set_irqchip_state	= irq_chip_set_parent_state,
+		.flags			= IRQCHIP_SET_TYPE_MASKED |
+					  IRQCHIP_SKIP_SET_WAKE |
+					  IRQCHIP_MASK_ON_SUSPEND,
+	},
+
+	.ops = {
+		.set_desc		= gicv5_iwb_domain_set_desc,
+		.msi_translate		= gicv5_iwb_irq_domain_translate,
+	},
+
+	.info = {
+		.bus_token		= DOMAIN_BUS_WIRED_TO_MSI,
+		.flags			= MSI_FLAG_USE_DEV_FWNODE,
+	},
+
+	.alloc_info = {
+		.flags			= MSI_ALLOC_FLAGS_FIXED_MSG_DATA,
+	},
+};
+
+static bool gicv5_iwb_create_device_domain(struct device *dev, unsigned int size,
+				     struct gicv5_iwb_chip_data *iwb_node)
+{
+	if (WARN_ON_ONCE(!dev->msi.domain))
+		return false;
+
+	return msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
+					    &iwb_msi_template, size,
+					    NULL, iwb_node);
+}
+
+static struct gicv5_iwb_chip_data *
+gicv5_iwb_init_bases(void __iomem *iwb_base, struct platform_device *pdev)
+{
+	struct gicv5_iwb_chip_data *iwb_node __free(kfree) = NULL;
+	u32 nr_wires, idr0, cr0;
+	unsigned int n;
+	int ret;
+
+	iwb_node = kzalloc(sizeof(*iwb_node), GFP_KERNEL);
+	if (!iwb_node)
+		return ERR_PTR(-ENOMEM);
+
+	iwb_node->iwb_base = iwb_base;
+
+	idr0 = iwb_readl_relaxed(iwb_node, GICV5_IWB_IDR0);
+	nr_wires = (FIELD_GET(GICV5_IWB_IDR0_IW_RANGE, idr0) + 1) * 32;
+
+	cr0 = iwb_readl_relaxed(iwb_node, GICV5_IWB_CR0);
+	if (!FIELD_GET(GICV5_IWB_CR0_IWBEN, cr0)) {
+		dev_err(&pdev->dev, "IWB must be enabled in firmware\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	iwb_node->nr_regs = FIELD_GET(GICV5_IWB_IDR0_IW_RANGE, idr0) + 1;
+
+	for (n = 0; n < iwb_node->nr_regs; n++)
+		iwb_writel_relaxed(iwb_node, 0, GICV5_IWB_WENABLER + (sizeof(u32) * n));
+
+	ret = gicv5_iwb_wait_for_wenabler(iwb_node);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (!gicv5_iwb_create_device_domain(&pdev->dev, nr_wires, iwb_node))
+		return ERR_PTR(-ENOMEM);
+
+	return_ptr(iwb_node);
+}
+
+static int gicv5_iwb_device_probe(struct platform_device *pdev)
+{
+	struct gicv5_iwb_chip_data *iwb_node;
+	void __iomem *iwb_base;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	iwb_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!iwb_base) {
+		dev_err(&pdev->dev, "failed to ioremap %pR\n", res);
+		return -ENOMEM;
+	}
+
+	iwb_node = gicv5_iwb_init_bases(iwb_base, pdev);
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
+static const struct of_device_id gicv5_iwb_of_match[] = {
+	{ .compatible = "arm,gic-v5-iwb" },
+	{ /* END */ }
+};
+MODULE_DEVICE_TABLE(of, gicv5_iwb_of_match);
+
+static struct platform_driver gicv5_iwb_platform_driver = {
+	.driver = {
+		.name			= "GICv5 IWB",
+		.of_match_table		= gicv5_iwb_of_match,
+		.suppress_bind_attrs	= true,
+	},
+	.probe				= gicv5_iwb_device_probe,
+};
+
+module_platform_driver(gicv5_iwb_platform_driver);
diff --git a/include/asm-generic/msi.h b/include/asm-generic/msi.h
index 124c734ca5d9fc0a204a2a3d951036e8270056f0..92cca4b23f138f7a8005dbdbe7f78b20e97f494c 100644
--- a/include/asm-generic/msi.h
+++ b/include/asm-generic/msi.h
@@ -33,6 +33,7 @@ typedef struct msi_alloc_info {
 
 /* Device generating MSIs is proxying for another device */
 #define MSI_ALLOC_FLAGS_PROXY_DEVICE	(1UL << 0)
+#define MSI_ALLOC_FLAGS_FIXED_MSG_DATA	(1UL << 1)
 
 #define GENERIC_MSI_DOMAIN_OPS		1
 
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index 4e90b0ac1e139f101f059d17315625194e1c2ad2..6a8206ca31b1d43a20d13819749234c98ee6a078 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
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

-- 
2.48.0

