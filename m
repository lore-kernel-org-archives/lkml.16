Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA99D201002
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588770; cv=none; b=H64tDOi2g6rVmLuuXpH0FUXAPNpfqz1ff9iy3C77DBJmMrzByemRS+/g08Wnsz5aFUZre/jo3mLbgz8A6PYL5teAu5Wk5A6XnNSyEF9Jj/cymZauW5fvE62BRGXHgs2Ol4ZbIXXyHdlxy27zsF2m9r3wgryJ+ItKopu8ufE5+98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588770; c=relaxed/simple;
	bh=GwHcaSUnBbTlnt9P4defvyw2EyqA3eDCPkjEwzhSn8k=;
	h=From:To:Cc:Subject:Message-ID:Content-Type:MIME-Version:Date; b=u6NqfJ5+/UUYiRux8x0eJN2RcbpdaV0UUAoCpLuSEF8MCnaqqVXrfZfRWZ6sYqgw/9Gc/qvuansU6wW7LnQycNf1b5GOcTgIp5AbrWY0I/MVSv/iT4yaa5z040AHAPi45a7oip0pUi8eafLghO3KwcnculpNh8xIJ+M19Ui/qyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZPZJsx92; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0Ca4/toO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZPZJsx92";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0Ca4/toO"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738588767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vpQWo+rf75JKmxwMoYuneWDuu2PJ+3RH647+mGY5EBk=;
	b=ZPZJsx92AXEdi+LR+3xZdBN+Uz/sPtROIPED9zj1k4qNrNPqynfNiba7CQf8Ze0rCk6dnC
	Vocni5EjUBsOoj7eBAAoXTkTKLZCE+FUTCGAVQDuyj4A+5+9kiz+E5p6Xw3sjZlflQHcSi
	ziccRFuJqM5iQW8aVqDpSLzigrW1cD2IRA9E+qsB4/1kPzZ57+N1U5V1Oy2jxaHSPNPePg
	GuVaZ+linKUSUeYKfxypxolOIb9KPsKKVNXN7vOKF10WrjmNW6GL8Wsx5Xgx3uAEueuVRe
	JveAJ/Jy4EMi4XvKDeMVNWLW8TW24a44zWM9uI491HgQ+0bDtxZLSSPYzqTL1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738588767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vpQWo+rf75JKmxwMoYuneWDuu2PJ+3RH647+mGY5EBk=;
	b=0Ca4/toOFUbMrUf6BZLL4lfgIkfNVWxW3uF+Yt0GKJWes8pJj046fEbrbCVmTyYu6p7TM1
	7jjGRVBZtBDfJsAg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] irq/urgent for v6.14-rc2
Message-ID: 
 <173858836845.600052.7603327021374821758.tglx@xen13.tec.linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon,  3 Feb 2025 14:19:26 +0100 (CET)

Linus,

please pull the latest irq/urgent branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-=
02-03

up to:  698244bbb3bf: irqchip/apple-aic: Only handle PMC interrupt as FIQ whe=
n configured so


Updates for the interrupt subsystem:

 - Ensure ordering of memory and device I/O for IPIs on RISCV

   The RISCV interrupt controllers use writel_relaxed() for generating an
   IPI. That's a device I/O write which is not guaranteed to be ordered
   against preceding memory writes. As a consequence a IPI receiving CPU
   might not be able to observe the actual IPI data which is required to
   handle it. Switch to writel() which contains the necessary memory
   barriers to enforce ordering.

 - Fix up the fallout of the MSI conversion in the MVEVBU ICU driver.

   The conversion failed to handle the change of the data storage and kept
   the original code which uses the domain::host_data pointer
   unchanged. After the conversion domain::host_data points to the new
   msi_domain_info structure and not longer to the MVEBU specific MSI data,
   which is now stored in a member of msi_domain_info. This leads to
   malfunction of the transalate() callback.

 - Only handle the PMC in FIQ mode when it is configured that way.

   The original check was incorrect as it did not explicitely check for the
   proper conditions, which led to malfunctions of the PMU interrupt.

 - Improve Kconfig dependencies for the LAN966x Outband Interrupt
   controller to avoid pointless pronmpts.

Thanks,

	tglx

------------------>
Geert Uytterhoeven (2):
      dt-bindings: interrupt-controller: microchip,lan966x-oic: Clarify endpo=
int use
      irqchip/lan966x-oic: Make CONFIG_LAN966X_OIC depend on CONFIG_MCHP_LAN9=
66X_PCI

Nick Chan (1):
      irqchip/apple-aic: Only handle PMC interrupt as FIQ when configured so

Stefan Eichenberger (1):
      irqchip/irq-mvebu-icu: Fix access to msi_data from irq_domain::host_data

Xu Lu (1):
      irqchip/riscv: Ensure ordering of memory writes and IPI writes


 .../bindings/interrupt-controller/microchip,lan966x-oic.yaml         | 5 ++-=
--
 drivers/irqchip/Kconfig                                              | 1 +
 drivers/irqchip/irq-apple-aic.c                                      | 3 ++-
 drivers/irqchip/irq-mvebu-icu.c                                      | 3 ++-
 drivers/irqchip/irq-riscv-imsic-early.c                              | 2 +-
 drivers/irqchip/irq-thead-c900-aclint-sswi.c                         | 2 +-
 6 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip=
,lan966x-oic.yaml b/Documentation/devicetree/bindings/interrupt-controller/mi=
crochip,lan966x-oic.yaml
index b2adc7174177..dca16e202da9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/microchip,lan966=
x-oic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,lan966=
x-oic.yaml
@@ -14,9 +14,8 @@ allOf:
=20
 description: |
   The Microchip LAN966x outband interrupt controller (OIC) maps the internal
-  interrupt sources of the LAN966x device to an external interrupt.
-  When the LAN966x device is used as a PCI device, the external interrupt is
-  routed to the PCI interrupt.
+  interrupt sources of the LAN966x device to a PCI interrupt when the LAN966x
+  device is used as a PCI device.
=20
 properties:
   compatible:
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index be063bfb50c4..c11b9965c4ad 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -169,6 +169,7 @@ config IXP4XX_IRQ
=20
 config LAN966X_OIC
 	tristate "Microchip LAN966x OIC Support"
+	depends on MCHP_LAN966X_PCI || COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 	help
diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index da5250f0155c..2b1684c60e3c 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -577,7 +577,8 @@ static void __exception_irq_entry aic_handle_fiq(struct p=
t_regs *regs)
 						  AIC_FIQ_HWIRQ(AIC_TMR_EL02_VIRT));
 	}
=20
-	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & PMCR0_IACT) {
+	if ((read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & (PMCR0_IMODE | PMCR0_IACT)) =3D=
=3D
+			(FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
 		int irq;
 		if (cpumask_test_cpu(smp_processor_id(),
 				     &aic_irqc->fiq_aff[AIC_CPU_PMU_P]->aff))
diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index b337f6c05f18..4eebed39880a 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -68,7 +68,8 @@ static int mvebu_icu_translate(struct irq_domain *d, struct=
 irq_fwspec *fwspec,
 			       unsigned long *hwirq, unsigned int *type)
 {
 	unsigned int param_count =3D static_branch_unlikely(&legacy_bindings) ? 3 :=
 2;
-	struct mvebu_icu_msi_data *msi_data =3D d->host_data;
+	struct msi_domain_info *info =3D d->host_data;
+	struct mvebu_icu_msi_data *msi_data =3D info->chip_data;
 	struct mvebu_icu *icu =3D msi_data->icu;
=20
 	/* Check the count of the parameters in dt */
diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-ri=
scv-imsic-early.c
index c5c2e6929a2f..275df5005705 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -27,7 +27,7 @@ static void imsic_ipi_send(unsigned int cpu)
 {
 	struct imsic_local_config *local =3D per_cpu_ptr(imsic->global.local, cpu);
=20
-	writel_relaxed(IMSIC_IPI_ID, local->msi_va);
+	writel(IMSIC_IPI_ID, local->msi_va);
 }
=20
 static void imsic_ipi_starting_cpu(void)
diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/i=
rq-thead-c900-aclint-sswi.c
index b0e366ade427..8ff6e7a1363b 100644
--- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
+++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
@@ -31,7 +31,7 @@ static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
=20
 static void thead_aclint_sswi_ipi_send(unsigned int cpu)
 {
-	writel_relaxed(0x1, per_cpu(sswi_cpu_regs, cpu));
+	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
 }
=20
 static void thead_aclint_sswi_ipi_clear(void)

