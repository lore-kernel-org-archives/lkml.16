Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D371280A4D;
	Tue,  6 May 2025 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534342; cv=none; b=bAb/Or26Hc/C0ee2Whjz48b/v7p5RJ6CQtzU0Tn05nLu/OrSQbSterNwsPXNdcyQsAmlEYdh0DBqPoCNlLNbPycqgzob98VIr3xpmMg2kZmn4gqyusXq2V/FuNhelL5OzVLr8/iT3YnFE1mALdyDCHsDD3NX+ixDbUTICP6Z3QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534342; c=relaxed/simple;
	bh=b8y2q8GE/lpW2dmJu8iJNqqJM/E6ZKtJ8GNGL4ORKrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwY//pW370ASHtPZfXUlMhDzRV7pm6xeAPGdlDZ9rNrhh8Y+RyVmfQhXK+k04Oew+KoMe2ID7kLIMiwbT7rNPkZeeTADi+h0PCl/KwwprhFvg9jXcU3D9Qkpwxc0wkCNOXrBcg7Zmh8cX9b6BmEhCkTXCIpDllnc/WsaFAYPaQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTotnHgz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTotnHgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB8DC4CEED;
	Tue,  6 May 2025 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534342;
	bh=b8y2q8GE/lpW2dmJu8iJNqqJM/E6ZKtJ8GNGL4ORKrs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GTotnHgz0xV0+fZFbBSLclZVcfl8kWyHkrVqMu97R65oT2ipe0dN3rHDZeffn0DMt
	 6wWpOEz+VoEQI5rWjcPkA+jJd1DJYOUSesDb13IYDEM7B9Pc99GNQLQjxITAk10nNO
	 L6WbykgH1CpFAYO3on+umZjvLWRYKctheMP7NF/oX9gn4KgLDXEw76uA6pBJa319c8
	 UnRBy0ToAVgtwUE72y5ZqaJcsKVv/NgZ8aulLFHQH/pjmZttqDLVtt1mW+t4qZPR8Q
	 pfUz/zplG4ADW4UxoqjBCFvW+imtpsezXnZHgkqWQbOFyqyu1wTfJhvREi0imJ/pdP
	 iAl2SwnsrfB+Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:52 +0200
Subject: [PATCH v3 23/25] irqchip/gic-v5: Enable GICv5 SMP booting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-23-6edd5a92fd09@kernel.org>
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

Set up IPIs by allocating IPI IRQs for all cpus and call into
arm64 core code to initialise IPIs IRQ descriptors and
request the related IRQ.

Implement hotplug callback to enable interrupts on a cpu
and register the cpu with an IRS.

Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index c2c05f4411197365079c7d997665c81e3a0f4b74..e4bb02a1988b01a23db61288ff1b1fe3db02e0e4 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"GICv5: " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/idr.h>
 #include <linux/irqdomain.h>
 #include <linux/slab.h>
@@ -875,6 +876,8 @@ static void gicv5_cpu_enable_interrupts(void)
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
 }
 
+static int base_ipi_virq;
+
 static int gicv5_starting_cpu(unsigned int cpu)
 {
 	if (WARN(!gicv5_cpuif_has_gcie(),
@@ -886,6 +889,22 @@ static int gicv5_starting_cpu(unsigned int cpu)
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
+					      num_ipis, NUMA_NO_NODE, NULL);
+	if (WARN(base_ipi_virq <= 0, "IPI IRQ allocation was not successful"))
+		return;
+
+	set_smp_ipi_range_percpu(base_ipi_virq, GICV5_IPIS_PER_CPU, nr_cpu_ids);
+}
+
 static void __init gicv5_free_domains(void)
 {
 	if (gicv5_global_data.ppi_domain)
@@ -1010,6 +1029,8 @@ static int __init gicv5_of_init(struct device_node *node, struct device_node *pa
 	if (ret)
 		goto out_int;
 
+	gicv5_smp_init();
+
 	return 0;
 out_int:
 	gicv5_cpu_disable_interrupts();

-- 
2.48.0

