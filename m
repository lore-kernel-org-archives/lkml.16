Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090E470807
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 04:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074661; cv=none; b=ANNEjce1X7mhtCrnOMbW3loNVvVQQ7tvaPUqVwbi5ShjN9DC2VdPTjI4sAEZXIqFyw3DxWQZ0CpPtElERPlkv/N8VYI/K8uCdNFpMNOiww1Zn8WYQm90TixYiUDqlT4Tx85gHWb+rZJKt0xpzstWDgx5IMaJ+k6IDGioRY607oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074661; c=relaxed/simple;
	bh=tqqED4GgT6fv8GxxWX7wObYflu49BH84mKUSrCVBeKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cn8Q8CncMzTYoJX/TWh7CT3w5KkPqRp1onLZC56pAET/Rqrefbi7mQTExunGZJMReK6Q9WW+MiEDkhmR2GNdd3mzvV6GFX+S+VG/T6YXksMJq/ZUo9D9O0G2ACjLra6kEjokaWEOcAw7QBEZTCDa+aAc6WGPZPwPVILkqPLcgGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OFQF9Frn; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OFQF9Frn"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f3c119fe6so71873595ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 20:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074659; x=1739679459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=;
        b=OFQF9FrnuuubH7cNWm2YAZmgH0/G/ZHAj/BUiFFKxJXMYHNJrp+EJ4ivRwwjYIHeME
         Xk1SZMc/sbmxnLLBH5m67mfk0pRAhURiPAryuQdU7QJZwSoL9r0+obb1/HktQGA3QqUI
         5iGftZO8kI8DL+MLF3F9PbOsmCxadvgqdIHOg225UX70u+Xa+isuEBm1PLL6TZCWMZUC
         l7myVY5Eue4bIkJFj8A5hLGqXyjhWg/quzqZzwjudk2RmK5Y3By6HruSAGd4JsMKJ9Bf
         f7Lv+Ij5LsZeLZxDi5e73ut9SlyVpn3qiQWBqxnjAshaZKqOalpxmgMfhoi4z8UhUm+u
         ImgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074659; x=1739679459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byPW6bNJR29pmHM6qNzPiiUHTFPpVNBWTNf2HlLXfG4=;
        b=EgduV6N59/zO/zb2N9W5PX9D7yx/k78SUSSida/7adJZEj9CR69uLZALPZEIUdbbLw
         qzw/tEvTLv1jXaafUv8uSig4CW2WoYJMXrH/cBbZMzy4U0z8fXg+lynM1twFfK7ZVCDI
         PUvPeb43I1PTRvhuIRCbThYi9A6OZXgbLGf6z0X5fr5MuzC9LuVfPGL9z02WRif7oxvK
         Z8deX58/PnLXPZa6S1iZp4zJZVnuLCm/AJAM5E8jQk8SDbzsjdVCo8jeFIVfeH/KvGN4
         ARTK9ZFjsOmAmZIrut20oamBzYdg07jAF4yGwSY70as+FhC4B24QsbNna9ekryycX6EC
         J2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCX4/RR9QSOg7mf7W8DPIJ9zqqOxKlI53V+6f2hsEhO7pRt4TeaKJDZMYbXkdodxNFcbYrfV+8IOXr3clHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YygWiLGdtDU5M8apW6SLM2UGJWM/2rL9nF7LOkcvwWvoegx7tx4
	6LgaoHm8tRSBe/6IF3wGwOIaCs6RFSgqT2yDOR2wawvhvpOH35rrIfLAZkvIvUg=
X-Gm-Gg: ASbGncu8dyqHPCnSjIxMFtsGcVusPGpnrk/D7wHXSSvW+FB5zHUtSHZnFh8Q4ROSPeZ
	ECNjrOXefA6/W2DsE90XF7S0es57taYF8C4kQ0bh7abi1HEVbVBzGg+CvDwnD3boBcmobkVJP/i
	ze8ywZvHwZwtDDHqnGB0Hoz4R1qKYweAQ265OL6R/mllGyWsJi/1FfJR1/uNQH9UUQLNzK3J2lh
	UmPsGK01/868ytzLE4oxhKCk5OQYcsIcF8qR5dbFr0PsAFnFdoBERBkbW56Sm631VXNMkQcizE3
	ReSaf+V5m/8rFcgEhv4Pmgtzpmy3kXPtZJd67kUhFj78v/2vJnvVKSU=
X-Google-Smtp-Source: AGHT+IH/ik3Ur8iKEEYDe9Hd4WVhXmYUsHE6OOkf8RhOk/pD00c5WvEJC3c0LK+040dao0sK2cXHKQ==
X-Received: by 2002:a05:6a20:c6c6:b0:1db:dfc0:d342 with SMTP id adf61e73a8af0-1ee03a247admr16710991637.7.1739074659234;
        Sat, 08 Feb 2025 20:17:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v5 03/11] irqchip/riscv-imsic: Move to common MSI lib
Date: Sun,  9 Feb 2025 09:46:47 +0530
Message-ID: <20250209041655.331470-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
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
index 5d7c30ad8855..9a5e7b4541f6 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 
+#include "irq-msi-lib.h"
 #include "irq-riscv-imsic-state.h"
 
 static bool imsic_cpu_page_phys(unsigned int cpu, unsigned int guest_index,
@@ -174,22 +175,6 @@ static void imsic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
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
@@ -206,110 +191,21 @@ static void imsic_irq_debug_show(struct seq_file *m, struct irq_domain *d,
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

