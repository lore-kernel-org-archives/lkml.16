Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B949526B2D3;
	Tue,  8 Apr 2025 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109525; cv=none; b=Dxcm8vAMh0WeFV8ugBekCblaAWxBREYjbVDqziI9kcFjM3IuEq1JJ5rNOBaoH5hJdNBb96JwslOvZJ1Z6ycZ8C139VJihdiUkuB4S9XQqDWGygQSaPngXHw+fljFp+oaeiLJl21AL737a/eVMsdQ3uA5pPmqumzz0R/VYVxNHGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109525; c=relaxed/simple;
	bh=D/+rC6w5Q4F5lWg5Dnv7jXrhOy3R2o7m8ettK5W6kbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YyvQdIluE7auS9UDoaVFXsURgw8SVaCXeFGoMLHTQdh8VEk/woZdEY0J6AeydO5/odH7Fl8t+rMlJBuaiK6kCNvlGaI21eE1MDOqil4/I6AUZo6SwWEzH+yPuShJYlD4FNf04r/8dRwZEIdhJBV+YWf8Nfdgk2L27xEAVQmFg9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwsJN+JI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwsJN+JI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6FAC4CEEC;
	Tue,  8 Apr 2025 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109525;
	bh=D/+rC6w5Q4F5lWg5Dnv7jXrhOy3R2o7m8ettK5W6kbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JwsJN+JIUpF4no0YRkWLBYsTjWq/YvmA9FgsFGAtB3SyzR7dfvtH+0YPU0CvTRsTD
	 m0qlfqyYwVfgD1hu/TwVbkB6LAFkr0/ZT1W6DErcM1IR1o7rl0vln6YPBGACW4rljK
	 jvUZpvjmS6wJknzfhzrQZydfElElk/3lZ/+A8pCQBaVg7AoCFdxJm9ltYIDsUZOvav
	 8+kG62nigGokhXoNoFKd0P80gj4/O8tpdxEQDohAGrKCtqAQjQMUOZIYsldZEmChdI
	 1jYZxJzLaye/6ntNPRsx2cBIgeLbihhBPAu9jAbEtHtxPt42YTyXEHpKtxnNA6brgg
	 YyFoDwPuF4Img==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:20 +0200
Subject: [PATCH 21/24] irqchip/gic-v5: Enable GICv5 SMP booting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-21-1f26db465f8d@kernel.org>
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

Set up IPIs by allocating IPI IRQs for all cpus and call into
arm64 core code to initialise IPIs IRQ descriptors and
request the related IRQ.

Implement hotplug callback to enable interrupts on a cpu
and register the cpu with an IRS.

Implement hotplug callback to check the IRS affinity setup
for IPIs on each CPU in order to ensure that each CPU's IPIs
affinity is what it is expected to be.

Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5.c | 84 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 85d951bfd807fc1b67b616dbadeebc150848293f..24789e9590115e6de7007cd4a74376ae34702ed6 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"GICv5: " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 #include <linux/maple_tree.h>
@@ -992,6 +993,68 @@ static void gicv5_cpu_enable_interrupts(void)
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
 }
 
+static int base_ipi_virq;
+
+static int gicv5_check_ipi_affinity(unsigned int cpu)
+{
+	int ret;
+	u64 cdrcfg, icsr;
+	u16 programmed_iaffid, requested_iaffid;
+	struct irq_data *d;
+	unsigned int i, virq_base = base_ipi_virq + cpu * GICV5_IPIS_PER_CPU;
+
+	for (i = 0; i < GICV5_IPIS_PER_CPU; i++) {
+		d = irq_get_irq_data(virq_base + i);
+
+		if (WARN_ON(!d))
+			return -ENODEV;
+
+		/*
+		 * We need to know the actual LPI that is being used, rather
+		 * than the IPI domain hwirq.
+		 *
+		 * Hence, use the hwirq from the parent (LPI domain) here.
+		 */
+		cdrcfg = d->parent_data->hwirq |
+			 FIELD_PREP(GICV5_HWIRQ_TYPE, GICV5_HWIRQ_TYPE_LPI);
+		preempt_disable();
+		gic_insn(cdrcfg, GICV5_OP_GIC_CDRCFG);
+		isb();
+		icsr = read_sysreg_s(SYS_ICC_ICSR_EL1);
+		preempt_enable();
+
+		if (FIELD_GET(ICC_ICSR_EL1_F, icsr)) {
+			pr_err("SYS_ID_ICC_ICSR_EL1 is not valid");
+			return -ENXIO;
+		}
+
+		if (!FIELD_GET(ICC_ICSR_EL1_Enabled, icsr)) {
+			pr_err("interrupt is disabled");
+			return -ENXIO;
+		}
+
+		if (FIELD_GET(ICC_ICSR_EL1_IRM, icsr)) {
+			pr_debug("Interrupt not using targeted routing");
+			return -ENXIO;
+		}
+
+		programmed_iaffid = (u16)FIELD_GET(ICC_ICSR_EL1_IAFFID, icsr);
+
+		ret = gicv5_irs_cpu_to_iaffid(cpu, &requested_iaffid);
+		if (ret)
+			return ret;
+
+		if (programmed_iaffid != requested_iaffid) {
+			pr_err("Mismatch between programmed_iaffid (%u) and requested_iaffid (%u)",
+			       programmed_iaffid, requested_iaffid);
+
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
 static int gicv5_starting_cpu(unsigned int cpu)
 {
 	if (WARN(!gicv5_cpuif_has_gcie(),
@@ -1003,6 +1066,25 @@ static int gicv5_starting_cpu(unsigned int cpu)
 	return gicv5_irs_register_cpu(cpu);
 }
 
+static void __init gicv5_smp_init(void)
+{
+	unsigned int num_ipis = GICV5_IPIS_PER_CPU * nr_cpu_ids;
+
+	cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_GIC_STARTING,
+				  "irqchip/arm/gicv5:starting",
+				  gicv5_starting_cpu, NULL);
+
+	base_ipi_virq = irq_domain_alloc_irqs(gicv5_global_data.ipi_domain,
+					  num_ipis, NUMA_NO_NODE, NULL);
+	if (WARN(base_ipi_virq <= 0, "IPI IRQ allocation was not successful"))
+		return;
+
+	set_smp_ipi_range_percpu(base_ipi_virq, GICV5_IPIS_PER_CPU, nr_cpu_ids);
+
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "irqchip/arm/gicv5:online",
+				  gicv5_check_ipi_affinity, NULL);
+}
+
 static void __init gicv5_free_domains(void)
 {
 	if (gicv5_global_data.ppi_domain)
@@ -1133,6 +1215,8 @@ static int __init gicv5_of_init(struct device_node *node,
 		return ret;
 	}
 
+	gicv5_smp_init();
+
 	return 0;
 }
 IRQCHIP_DECLARE(gic_v5, "arm,gic-v5", gicv5_of_init);

-- 
2.48.0

