Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E02066CB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655705; cv=none; b=VPsELqbNMkRHAZAwJuVFP+3QoOZ7aC0vftpiNwVMr5ld4YBr5rzzMBZ6uAJALO7LBht/cIKDsaszM2DyeTgtT6Xm6jdvp61uzzx83lHV2owpXJUPZtmKLj4YGpXBneHv8rHCQpIIhv0Es4oPWUswlZVt+Nvq36GUnlLdn1elMPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655705; c=relaxed/simple;
	bh=7gJvPid3DXWBaccKmSGjzDBxql86EbMZzc8CNdQfv6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnkK62MHJ0eKsvuGjl0mYuDy3PZk01R19u0FQVD1+JY8CN9LyOOjhJFCQQ+khBMzucaMkcG1poKDJ5gQUVqf5Gyl3deFYQ7f3dV/YfHLzJjhSTymrkMlefgHY17t52nBxKrsccVuQVRcLlKSg14v9la8ngBbtYc3qQ27zE4AZWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TqhXKk8Z; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TqhXKk8Z"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6edb82f85so781548185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655701; x=1739260501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zt4BUR1O09akAiE35kyzRFyQQsTBDdGx/Mpea27bkKs=;
        b=TqhXKk8ZmjzO0exmvbn6ft+3bO+lynt7U3P+AtHsFqkrnDZc+pH8JZSeiCp6Kg1xdn
         EjKeG7sQAn5urAdJXhwufHKgzYiTk6gmnTQdVAreaMwWBcnxIzYcdRJC5gh/NA/GK4Tm
         yPWXIojtaFKxP8FH4QNPIJ25cbFmuDO5iq8pnqglVYkGMvnlIyQrr48FhAy+/DXlM79Y
         iK9SatUDnbyxHHOxpYfRdYljIE6+HnaPuBdLnJo50DR83lhQRTUmiCkkcV9PHuIuuWke
         FWBNulrYkrTOf8ehbBp+26rfHBxFxjZN6N9cNUPP2zXg3ZbISmFyU2IsV2fu8lg8uw3G
         cO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655701; x=1739260501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt4BUR1O09akAiE35kyzRFyQQsTBDdGx/Mpea27bkKs=;
        b=OJb8nkA2PdoQIVCZz6aj7Y+ZMyzIZTZTnjLmjiY9CuIkzvCv1UlCmXOLbR5DjkRsfV
         O6p4WcY2taAd1HxlsBqgWOYRtAN7CA4En/hWAS2Bq9qz6M+QS2Vr47fHtoS5tBPin9be
         nCm+3qAeSnphhJj3jYc0n1YMwDKyc1GWjA8Nh5V9sjPsn8wTNOaPQxboN44aNeG6A3jh
         N20sdKsP4DN0Pq4Oj73tEFiNUedzYGYDz5Cr2voGITxMP3y+dvMNrPRVBdp4i7spX0SZ
         cHzZpAWNATMqwV4I2p2aebK28ZkDG0WwqpEk8js6DrGz6MDzwvnjvtfUE1VpZM2BJb0D
         URTw==
X-Forwarded-Encrypted: i=1; AJvYcCWigXnsG5wOI0REkcRgq+fxkh2XAk/yn6IcFwQuP08Xju1r/PNf2G7wZrfq7BdEqg0Wl1RIWDnkkvjDkZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeCJ7D+9MyOhGHxccPuoCOdJaAs+mutTnmWdBY3AEbRH4XSEOp
	12xTau43b/r0Lci+mPWSQkYagPG0Y9OrWywAXGN75q9azuNUnzeExL/ITv3Qmv8=
X-Gm-Gg: ASbGncvpyXRLEAyV8SsXxZkXqR0cSK084M7OURD+IOefmIG9ViY4ipTa5WQVHPIYNZW
	x+Tis9wg/OQZzjechcnGGDneiBRoTOoh7rFhP03sbCFBbvFeUABUNhIJQ78F2T8PCsllSqgCuo0
	IhGF6+ShJMi2L9V1/uRqV1ZnqL1c9xaX9W9YFX9BTVhY01rw7cWa/uVcZHdLRLo7mFmma9t7YPs
	1McJVoW3ELYUuqRzULsZUVVW6CD4ny40lcQTLn+36wB/nfOmR+XpUvgMj9cBGu626bZ26gkK85I
	m+AntE1YcMVslX4jcCYIg6npRvdAsQsg7pmv1Fq7OWqa6PHcKgaWzl0=
X-Google-Smtp-Source: AGHT+IEHo/ibp+o6qeQRlJusLW8jVVXpZtzwcNrNItHHxjlGS/8JBTsdvSnSG8vOxPC1otd04HpYwA==
X-Received: by 2002:a05:620a:240a:b0:7be:3965:7452 with SMTP id af79cd13be357-7bffcd06b08mr4023625385a.32.1738655701483;
        Mon, 03 Feb 2025 23:55:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:01 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 04/10] irqchip/riscv-imsic: Move to common MSI lib
Date: Tue,  4 Feb 2025 13:23:59 +0530
Message-ID: <20250204075405.824721-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

Simplify the leaf MSI domain handling in the RISC-V IMSIC driver by
using msi_lib_init_dev_msi_info() and msi_lib_irq_domain_select()
provided by common MSI lib.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 114 +--------------------
 2 files changed, 6 insertions(+), 116 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index be063bfb50c4..bc3f12af2dc7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -589,13 +589,7 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
-
-config RISCV_IMSIC_PCI
-	bool
-	depends on RISCV_IMSIC
-	depends on PCI
-	depends on PCI_MSI
-	default RISCV_IMSIC
+	select IRQ_MSI_LIB
 
 config SIFIVE_PLIC
 	bool
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index dc6f63f657e4..2fab20d2ce3e 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 
+#include "irq-msi-lib.h"
 #include "irq-riscv-imsic-state.h"
 
 static bool imsic_cpu_page_phys(unsigned int cpu, unsigned int guest_index,
@@ -201,22 +202,6 @@ static void imsic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
 
-static int imsic_irq_domain_select(struct irq_domain *domain, struct irq_fwspec *fwspec,
-				   enum irq_domain_bus_token bus_token)
-{
-	const struct msi_parent_ops *ops = domain->msi_parent_ops;
-	u32 busmask = BIT(bus_token);
-
-	if (fwspec->fwnode != domain->fwnode || fwspec->param_count != 0)
-		return 0;
-
-	/* Handle pure domain searches */
-	if (bus_token == ops->bus_select_token)
-		return 1;
-
-	return !!(ops->bus_select_mask & busmask);
-}
-
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
 				 struct irq_data *irqd, int ind)
@@ -233,110 +218,21 @@ static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
 static const struct irq_domain_ops imsic_base_domain_ops = {
 	.alloc		= imsic_irq_domain_alloc,
 	.free		= imsic_irq_domain_free,
-	.select		= imsic_irq_domain_select,
+	.select		= msi_lib_irq_domain_select,
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 	.debug_show	= imsic_irq_debug_show,
 #endif
 };
 
-#ifdef CONFIG_RISCV_IMSIC_PCI
-
-static void imsic_pci_mask_irq(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void imsic_pci_unmask_irq(struct irq_data *d)
-{
-	irq_chip_unmask_parent(d);
-	pci_msi_unmask_irq(d);
-}
-
-#define MATCH_PCI_MSI		BIT(DOMAIN_BUS_PCI_MSI)
-
-#else
-
-#define MATCH_PCI_MSI		0
-
-#endif
-
-static bool imsic_init_dev_msi_info(struct device *dev,
-				    struct irq_domain *domain,
-				    struct irq_domain *real_parent,
-				    struct msi_domain_info *info)
-{
-	const struct msi_parent_ops *pops = real_parent->msi_parent_ops;
-
-	/* MSI parent domain specific settings */
-	switch (real_parent->bus_token) {
-	case DOMAIN_BUS_NEXUS:
-		if (WARN_ON_ONCE(domain != real_parent))
-			return false;
-#ifdef CONFIG_SMP
-		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
-#endif
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return false;
-	}
-
-	/* Is the target supported? */
-	switch (info->bus_token) {
-#ifdef CONFIG_RISCV_IMSIC_PCI
-	case DOMAIN_BUS_PCI_DEVICE_MSI:
-	case DOMAIN_BUS_PCI_DEVICE_MSIX:
-		info->chip->irq_mask = imsic_pci_mask_irq;
-		info->chip->irq_unmask = imsic_pci_unmask_irq;
-		break;
-#endif
-	case DOMAIN_BUS_DEVICE_MSI:
-		/*
-		 * Per-device MSI should never have any MSI feature bits
-		 * set. It's sole purpose is to create a dumb interrupt
-		 * chip which has a device specific irq_write_msi_msg()
-		 * callback.
-		 */
-		if (WARN_ON_ONCE(info->flags))
-			return false;
-
-		/* Core managed MSI descriptors */
-		info->flags |= MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS |
-			       MSI_FLAG_FREE_MSI_DESCS;
-		break;
-	case DOMAIN_BUS_WIRED_TO_MSI:
-		break;
-	default:
-		WARN_ON_ONCE(1);
-		return false;
-	}
-
-	/* Use hierarchial chip operations re-trigger */
-	info->chip->irq_retrigger = irq_chip_retrigger_hierarchy;
-
-	/*
-	 * Mask out the domain specific MSI feature flags which are not
-	 * supported by the real parent.
-	 */
-	info->flags &= pops->supported_flags;
-
-	/* Enforce the required flags */
-	info->flags |= pops->required_flags;
-
-	return true;
-}
-
-#define MATCH_PLATFORM_MSI		BIT(DOMAIN_BUS_PLATFORM_MSI)
-
 static const struct msi_parent_ops imsic_msi_parent_ops = {
 	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
 				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
-				  MSI_FLAG_USE_DEF_CHIP_OPS,
+				  MSI_FLAG_USE_DEF_CHIP_OPS |
+				  MSI_FLAG_PCI_MSI_MASK_PARENT,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
-	.init_dev_msi_info	= imsic_init_dev_msi_info,
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
 int imsic_irqdomain_init(void)
-- 
2.43.0

