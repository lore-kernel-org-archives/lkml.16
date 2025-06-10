Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8624B28BAA1;
	Tue, 10 Jun 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550004; cv=none; b=PuOoGScZjeG3OaPu7a205sK0EYGRFpJyXY+T1NT+1OKaAmWQdbEPWsKrVzjBnTmYQ9t9V/A5eqkSEUA+iMxyI98vDsEGDzlX0NqLFub34Q561I259VDURWxQzn3ArP1Y19Rb2GYrJjAQXFDnRy9s5vSQ2NAnQ+otazDCFZWFe9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550004; c=relaxed/simple;
	bh=ZkonT5XOETViMq2W8Vg4OLZt5WEYIKYmN1JdAPfoIck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jK/HwK7HWZd5syP6cTBTA7e1bF2hqYl7SQyH5ZqvuRlWdT5VtbQDmSyIsFSMenyzA0uJSanHYN0DxWWaSHhrnIylch8vABhxMD0D6WVFcn2ziZ4o5lNlc+bjCxghfmJDFXdhwFlAqtoMUei+/PgC1hSiD7JTwhUtPqrin9gB3Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=BtlutIj2 reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="BtlutIj2"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550002; x=1781086002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZkonT5XOETViMq2W8Vg4OLZt5WEYIKYmN1JdAPfoIck=;
  b=BtlutIj2cc+SW0kXNalMLEobAl5YvrNKZoDvYxizLdRJj+S6ih0aY6ne
   ALBL5QsxE+GsV616wfORdDTcR4ZCp4cF7Fz6PEBe7b9YzvcKUhLOIy7wK
   5Rd5ujfqVvsvaQ/cfH4SzTB0vpwYb4uABjlAPpNHLMRBd1M2OUsOZTqAR
   62CJZr2pgokseVtrpAhZRXRic0WIke0tI5U+XGzhI75BQ/GavgeVqGFui
   2GgxF8x+/Ua72Hs54QLORo7xQDcDqNlv2eXBcTTNI2ufkjR45DLRcy0V9
   uUi0RBiZ/cbuNz+S5DFuqpJXjFmw305xv283Kqx67Hcylu5Kf6Xg37pgP
   Q==;
X-CSE-ConnectionGUID: TSqU/aK9R1y2qCI6ux7EpA==
X-CSE-MsgGUID: 4BHU+QqyTVW2LmBnbHwQvg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:39 +0300
X-CSE-ConnectionGUID: 2clGyAAhREiAocQAIdOL4Q==
X-CSE-MsgGUID: QC3bqOW8Sh66YowUez2SSQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces03_data.me-corp.lan with SMTP; 10 Jun 2025 13:06:38 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:38 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Date: Tue, 10 Jun 2025 13:05:37 +0300
Message-ID: <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor Thead specific implementation of the ACLINT-SSWI irqchip.
Factor out generic code that serves both Thead and MIPS variants.
This generic part is according to the RISC-V draft spec [1].

Link: https://github.com/riscvarchive/riscv-aclint [1]

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/Kconfig                       | 16 ++++
 drivers/irqchip/Makefile                      |  2 +-
 ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 93 +++++++++++++------
 3 files changed, 82 insertions(+), 29 deletions(-)
 rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (67%)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 0d196e447142..be9b54900482 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -634,12 +634,28 @@ config STARFIVE_JH8100_INTC
 
 	  If you don't know what to do here, say Y.
 
+config ACLINT_SSWI
+	bool
+
+config MIPS_P8700_ACLINT_SSWI
+	bool "MIPS P8700 ACLINT S-mode IPI Interrupt Controller"
+	depends on RISCV
+	depends on SMP
+	select IRQ_DOMAIN_HIERARCHY
+	select GENERIC_IRQ_IPI_MUX
+	select ACLINT_SSWI
+	help
+	  This enables support for MIPS P8700 specific ACLINT SSWI device
+
+	  If you don't know what to do here, say Y.
+
 config THEAD_C900_ACLINT_SSWI
 	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
 	depends on RISCV
 	depends on SMP
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_IPI_MUX
+	select ACLINT_SSWI
 	help
 	  This enables support for T-HEAD specific ACLINT SSWI device
 	  support.
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 23ca4959e6ce..0458d6c5d161 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -105,7 +105,7 @@ obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
-obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
+obj-$(CONFIG_ACLINT_SSWI)		+= irq-aclint-sswi.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
 obj-$(CONFIG_IMX_MU_MSI)		+= irq-imx-mu-msi.o
diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
similarity index 67%
rename from drivers/irqchip/irq-thead-c900-aclint-sswi.c
rename to drivers/irqchip/irq-aclint-sswi.c
index 8ff6e7a1363b..ec21785df518 100644
--- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -3,7 +3,7 @@
  * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
  */
 
-#define pr_fmt(fmt) "thead-c900-aclint-sswi: " fmt
+#define pr_fmt(fmt) "aclint-sswi: " fmt
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -21,56 +21,51 @@
 #include <asm/sbi.h>
 #include <asm/vendorid_list.h>
 
-#define THEAD_ACLINT_xSWI_REGISTER_SIZE		4
-
-#define THEAD_C9XX_CSR_SXSTATUS			0x5c0
-#define THEAD_C9XX_SXSTATUS_CLINTEE		BIT(17)
-
 static int sswi_ipi_virq __ro_after_init;
 static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
 
-static void thead_aclint_sswi_ipi_send(unsigned int cpu)
+static void aclint_sswi_ipi_send(unsigned int cpu)
 {
 	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
 }
 
-static void thead_aclint_sswi_ipi_clear(void)
+static void aclint_sswi_ipi_clear(void)
 {
 	writel_relaxed(0x0, this_cpu_read(sswi_cpu_regs));
 }
 
-static void thead_aclint_sswi_ipi_handle(struct irq_desc *desc)
+static void aclint_sswi_ipi_handle(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
 	csr_clear(CSR_IP, IE_SIE);
-	thead_aclint_sswi_ipi_clear();
+	aclint_sswi_ipi_clear();
 
 	ipi_mux_process();
 
 	chained_irq_exit(chip, desc);
 }
 
-static int thead_aclint_sswi_starting_cpu(unsigned int cpu)
+static int aclint_sswi_starting_cpu(unsigned int cpu)
 {
 	enable_percpu_irq(sswi_ipi_virq, irq_get_trigger_type(sswi_ipi_virq));
 
 	return 0;
 }
 
-static int thead_aclint_sswi_dying_cpu(unsigned int cpu)
+static int aclint_sswi_dying_cpu(unsigned int cpu)
 {
-	thead_aclint_sswi_ipi_clear();
+	aclint_sswi_ipi_clear();
 
 	disable_percpu_irq(sswi_ipi_virq);
 
 	return 0;
 }
 
-static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
-					      void __iomem *reg)
+static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
+					void __iomem *reg)
 {
 	struct of_phandle_args parent;
 	unsigned long hartid;
@@ -97,7 +92,7 @@ static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 
-		per_cpu(sswi_cpu_regs, cpu) = reg + i * THEAD_ACLINT_xSWI_REGISTER_SIZE;
+		per_cpu(sswi_cpu_regs, cpu) = reg + hart_index * 4;
 	}
 
 	pr_info("%pfwP: register %u CPU%s\n", fwnode, contexts, str_plural(contexts));
@@ -105,17 +100,12 @@ static int __init thead_aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 	return 0;
 }
 
-static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
+static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
 {
 	struct irq_domain *domain;
 	void __iomem *reg;
 	int virq, rc;
 
-	/* If it is T-HEAD CPU, check whether SSWI is enabled */
-	if (riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
-	    !(csr_read(THEAD_C9XX_CSR_SXSTATUS) & THEAD_C9XX_SXSTATUS_CLINTEE))
-		return -ENOTSUPP;
-
 	if (!is_of_node(fwnode))
 		return -EINVAL;
 
@@ -124,7 +114,7 @@ static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
 		return -ENOMEM;
 
 	/* Parse SSWI setting */
-	rc = thead_aclint_sswi_parse_irq(fwnode, reg);
+	rc = aclint_sswi_parse_irq(fwnode, reg);
 	if (rc < 0)
 		return rc;
 
@@ -146,22 +136,68 @@ static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
 	}
 
 	/* Register SSWI irq and handler */
-	virq = ipi_mux_create(BITS_PER_BYTE, thead_aclint_sswi_ipi_send);
+	virq = ipi_mux_create(BITS_PER_BYTE, aclint_sswi_ipi_send);
 	if (virq <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sswi_ipi_virq);
 		return virq < 0 ? virq : -ENOMEM;
 	}
 
-	irq_set_chained_handler(sswi_ipi_virq, thead_aclint_sswi_ipi_handle);
+	irq_set_chained_handler(sswi_ipi_virq, aclint_sswi_ipi_handle);
 
 	cpuhp_setup_state(CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
-			  "irqchip/thead-aclint-sswi:starting",
-			  thead_aclint_sswi_starting_cpu,
-			  thead_aclint_sswi_dying_cpu);
+			  "irqchip/aclint-sswi:starting",
+			  aclint_sswi_starting_cpu,
+			  aclint_sswi_dying_cpu);
 
 	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
 
+	return 0;
+}
+
+#if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
+/* generic/MIPS variant */
+static int __init generic_aclint_sswi_probe(struct fwnode_handle *fwnode)
+{
+	int rc;
+
+	rc = aclint_sswi_probe(fwnode);
+	if (rc)
+		return rc;
+
+	/* Announce that SSWI is providing IPIs */
+	pr_info("providing IPIs using ACLINT SSWI\n");
+
+	return 0;
+}
+
+static int __init generic_aclint_sswi_early_probe(struct device_node *node,
+						  struct device_node *parent)
+{
+	return generic_aclint_sswi_probe(&node->fwnode);
+}
+IRQCHIP_DECLARE(generic_aclint_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
+#endif /* CONFIG_MIPS_P8700_ACLINT_SSWI */
+
+#if defined(CONFIG_THEAD_C900_ACLINT_SSWI)
+
+#define THEAD_C9XX_CSR_SXSTATUS			0x5c0
+#define THEAD_C9XX_SXSTATUS_CLINTEE		BIT(17)
+
+/* THEAD variant */
+static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
+{
+	int rc;
+
+	/* If it is T-HEAD CPU, check whether SSWI is enabled */
+	if (riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
+	    !(csr_read(THEAD_C9XX_CSR_SXSTATUS) & THEAD_C9XX_SXSTATUS_CLINTEE))
+		return -ENOTSUPP;
+
+	rc = aclint_sswi_probe(fwnode);
+	if (rc)
+		return rc;
+
 	/* Announce that SSWI is providing IPIs */
 	pr_info("providing IPIs using THEAD ACLINT SSWI\n");
 
@@ -174,3 +210,4 @@ static int __init thead_aclint_sswi_early_probe(struct device_node *node,
 	return thead_aclint_sswi_probe(&node->fwnode);
 }
 IRQCHIP_DECLARE(thead_aclint_sswi, "thead,c900-aclint-sswi", thead_aclint_sswi_early_probe);
+#endif /* CONFIG_THEAD_C900_ACLINT_SSWI */
-- 
2.43.0

