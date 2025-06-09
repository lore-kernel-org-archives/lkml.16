Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB21925C6EA;
	Mon,  9 Jun 2025 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477077; cv=none; b=av9Jdga0+oudBDIendxuAPWN0mR1IoMejg0fBi1xItxZsEXeVhlG2qMfifwZxFch0zOXZbcToeFOqOsdCOIA4jNayuP0I0/l9vROjeHoyB5Sl+s/bRk5rYeZK/LYWvCYO9H6F0gPhZ1bRWRuSsHQR+GGOs0fo/e4FCkuu1+6CBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477077; c=relaxed/simple;
	bh=tu5z8u1lDe/kUWmMU3P/i61oS/ojU9qnxLRE5DvBUns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n90Kde/WY8Fb5fl6G/x9PkCzrbi7mel5poO59e8DQTs0m9A/fujqHShCTtMNoNmBCvpZi22UxVnsd/sKrkutd72Lwb60srSLwuMOct2+WnQ8OpH10GKL7s4F/5xLVNlvcZw04iXFY+G7y22DfvVTgJtM6B0boDq370/DeNmf5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=cr+exX8i reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="cr+exX8i"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749477075; x=1781013075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tu5z8u1lDe/kUWmMU3P/i61oS/ojU9qnxLRE5DvBUns=;
  b=cr+exX8iKy8IxZH4VBlXuIrrooo48Lfaojbg6ODUadZKKtP7Y9vYWr2s
   EeUjVXpxsekQhMKRboq5tcTz+k96srb93bwTqUo5rymqy+SQLCOO+ep68
   pyveeKH7xL5MzA5Kw623uyTNzaumHhWBznOrba6BplePWWDwZh6CUPzWS
   RifkJfvVtMwX34maimSJCSCmXY9Qp58pblrwFxigoE2Bm6EuY03kOPjoz
   Kg3CB6TKrWw5m8xwwLdUrMq6oA3mCJ/V2QVVcJSjFk1dOl4OwWeIukXZF
   D9b4LM1Bd+BH+Z5w/jaHo2iwK7cH0Zb7lxDdqn5hpav2/ohJyV0fMpC8b
   w==;
X-CSE-ConnectionGUID: yn9h3P1jRZ2wK6r2MNhrWg==
X-CSE-MsgGUID: DCc/ovJSTnak5bxE7DxOzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:48:02 +0300
X-CSE-ConnectionGUID: OXAvsiJLSAaiXtw1PDsdmg==
X-CSE-MsgGUID: zhNKjDfDQJicecnKCsumyw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces01_data.me-corp.lan with SMTP; 09 Jun 2025 16:48:00 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:48:00 +0300
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
Subject: [PATCH v1 4/7] irqchip: introduce generic Risc-V aclint-sswi
Date: Mon,  9 Jun 2025 16:47:46 +0300
Message-ID: <20250609134749.1453835-5-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor Thead specific implementation of the ACLINT-SSWI
irqchip, providing generic one, according to the Risc-V spec [1]

Preserve Thead-specific version, do it as a customized
variant of the generic one.

Link: https://github.com/riscvarchive/riscv-aclint [1]

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/Kconfig                       | 12 +++
 drivers/irqchip/Makefile                      |  2 +-
 ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 91 +++++++++++++------
 3 files changed, 76 insertions(+), 29 deletions(-)
 rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (68%)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 0d196e447142..c1132dad238e 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -634,12 +634,24 @@ config STARFIVE_JH8100_INTC
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ACLINT_SSWI
+	bool "RISC-V ACLINT S-mode IPI Interrupt Controller"
+	depends on RISCV
+	depends on SMP
+	select IRQ_DOMAIN_HIERARCHY
+	select GENERIC_IRQ_IPI_MUX
+	help
+	  This enables support for generic ACLINT SSWI device
+
+	  If you don't know what to do here, say Y.
+
 config THEAD_C900_ACLINT_SSWI
 	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
 	depends on RISCV
 	depends on SMP
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_IPI_MUX
+	select RISCV_ACLINT_SSWI
 	help
 	  This enables support for T-HEAD specific ACLINT SSWI device
 	  support.
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 23ca4959e6ce..1168ec92376e 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -105,7 +105,7 @@ obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
-obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
+obj-$(CONFIG_RISCV_ACLINT_SSWI)		+= irq-aclint-sswi.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
 obj-$(CONFIG_IMX_MU_MSI)		+= irq-imx-mu-msi.o
diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
similarity index 68%
rename from drivers/irqchip/irq-thead-c900-aclint-sswi.c
rename to drivers/irqchip/irq-aclint-sswi.c
index 8ff6e7a1363b..dfba34f712ff 100644
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
 
@@ -146,22 +136,66 @@ static int __init thead_aclint_sswi_probe(struct fwnode_handle *fwnode)
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
+/* generic variant */
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
+IRQCHIP_DECLARE(generic_aclint_sswi, "riscv,aclint-sswi", generic_aclint_sswi_early_probe);
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
 
@@ -174,3 +208,4 @@ static int __init thead_aclint_sswi_early_probe(struct device_node *node,
 	return thead_aclint_sswi_probe(&node->fwnode);
 }
 IRQCHIP_DECLARE(thead_aclint_sswi, "thead,c900-aclint-sswi", thead_aclint_sswi_early_probe);
+#endif /* CONFIG_THEAD_C900_ACLINT_SSWI */
-- 
2.43.0

