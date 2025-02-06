Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E72F156C5E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871530; cv=none; b=JLYGl03sC35P2WQGtJGn4xkVmYtiC8VG3Q67NzEdTuZ5kqvNPT8QfS3DAsruR9MbLjJWQDw067rnfqtNb793xJtMlh6p2R4Uh2xQUUefyUZiEm2ybA/X4hZ1svYwwYZmtTf9AbQtu4D5EY2ca6eokjxdvYXd+HexsKLtqgChmZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871530; c=relaxed/simple;
	bh=PpnJEVX9uPQq7xOvsIIeCXDrY666Jsxu0wjXSvv/fd4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DV5lwPqmGO+yfnn1MHi9XpXxrRP4BsVAO9Px8i8ArgpAul2AbwxTSSIbRmCCeCWLhe84ENJJ84qPyXgDNYqA8e8emi8I3kiP5JT4dWfY2s4gsZ32EtQebA/OqQGK7vjb9NsCdOb7QQflyJkRiG7cSjI+MurXhrrc5gAWKFMJygU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Hai6fiwK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=In2qLTow; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Hai6fiwK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="In2qLTow"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738871526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/YQbTVl1XECBKjsxRqEitzCpv7mr8eiCWRehuBFxjY4=;
	b=Hai6fiwKEjTcZT4y04Au5+oASrrOKrr6Oqs28Acu7Uw1C5YEz6mfHez7YeGhZJxCexQCMs
	LV0I2FGt3aJYH/U/SJs+12zbdX+ZktEtxfS1y6PPF7sOnCOKmZ7C/5plXgnb9ffJNlPTTJ
	W9m/Bx0KgiiD8NyXWwp/dRcdGHUgqVMgM/Kxe74ju20IxGUTdh4aTQmyXeCeP+Jib9sTW2
	DvISzmQmJMja9qZlEqTXik8IjGGkqP0R7h/Xek6txKEVdvTNIDwhN2vDPX8JR5SlA0hrQ9
	TUDkYdEf8A9l7Y0ou6NwhUXxfUTbqiUqGsTr7ZjT8bwNvt984p+B9Gg/jr2Dww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738871526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/YQbTVl1XECBKjsxRqEitzCpv7mr8eiCWRehuBFxjY4=;
	b=In2qLTowTLF4YI2VQ8JfUOHTyz4pT0OP595XXM5vI23I4+V1O93KNEAxWgRLLwFaS2jfzD
	zqEYyQWHur+PWWCg==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 04/11] genirq: Introduce common
 irq_force_complete_move() implementation
In-Reply-To: <20250205155948.81385-5-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
 <20250205155948.81385-5-apatel@ventanamicro.com>
Date: Thu, 06 Feb 2025 20:52:05 +0100
Message-ID: <87r04an95m.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 05 2025 at 21:29, Anup Patel wrote:
> The GENERIC_PENDING_IRQ requires an arch specific implementation
> of irq_force_complete_move(). At the moment, only x86 implements
> this but for RISC-V the irq_force_complete_move() is only needed
> when RISC-V IMSIC driver is in use and not needed otherwise.
>
> To address the above, introduce common weak implementation of
> the irq_force_complete_move() which lets irqchip do the actual
> irq_force_complete_move().
>  
> +void __weak irq_force_complete_move(struct irq_desc *desc)
> +{
> +	struct irq_data *d = irq_desc_get_irq_data(desc);
> +	struct irq_chip *chip = irq_data_get_irq_chip(d);
> +
> +	if (chip && chip->irq_force_complete_move)
> +		chip->irq_force_complete_move(d);
> +}

I seriously doubt that works as intended.

In patch 9 you implement this as callback for the imsic_irq_base_chip,
but that's not the top level chip in the hierarchy. The top level chip
is the PCI/MSI device domain chip, which obviously does not have that
callback set.

Something like uncompiled below should work. That avoids the weak
function and handles x86 in exactly the same way.

Thanks,

        tglx
---
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -888,8 +888,85 @@ static int apic_set_affinity(struct irq_
 	return err ? err : IRQ_SET_MASK_OK;
 }
 
+/*
+ * Called from fixup_irqs() with @desc->lock held and interrupts disabled.
+ */
+static void apic_force_complete_move(struct irq_data *irqd)
+{
+	unsigned int cpu = smp_processor_id();
+	struct apic_chip_data *apicd;
+	unsigned int vector;
+
+	guard(raw_spinlock)(&vector_lock);
+	apicd = apic_chip_data(irqd);
+	if (!apicd)
+		return;
+
+	/*
+	 * If prev_vector is empty or the descriptor is neither currently
+	 * nor previously on the outgoing CPU no action required.
+	 */
+	vector = apicd->prev_vector;
+	if (!vector || (apicd->cpu != cpu && apicd->prev_cpu != cpu))
+		return;
+
+	/*
+	 * This is tricky. If the cleanup of the old vector has not been
+	 * done yet, then the following setaffinity call will fail with
+	 * -EBUSY. This can leave the interrupt in a stale state.
+	 *
+	 * All CPUs are stuck in stop machine with interrupts disabled so
+	 * calling __irq_complete_move() would be completely pointless.
+	 *
+	 * 1) The interrupt is in move_in_progress state. That means that we
+	 *    have not seen an interrupt since the io_apic was reprogrammed to
+	 *    the new vector.
+	 *
+	 * 2) The interrupt has fired on the new vector, but the cleanup IPIs
+	 *    have not been processed yet.
+	 */
+	if (apicd->move_in_progress) {
+		/*
+		 * In theory there is a race:
+		 *
+		 * set_ioapic(new_vector) <-- Interrupt is raised before update
+		 *			      is effective, i.e. it's raised on
+		 *			      the old vector.
+		 *
+		 * So if the target cpu cannot handle that interrupt before
+		 * the old vector is cleaned up, we get a spurious interrupt
+		 * and in the worst case the ioapic irq line becomes stale.
+		 *
+		 * But in case of cpu hotplug this should be a non issue
+		 * because if the affinity update happens right before all
+		 * cpus rendezvous in stop machine, there is no way that the
+		 * interrupt can be blocked on the target cpu because all cpus
+		 * loops first with interrupts enabled in stop machine, so the
+		 * old vector is not yet cleaned up when the interrupt fires.
+		 *
+		 * So the only way to run into this issue is if the delivery
+		 * of the interrupt on the apic/system bus would be delayed
+		 * beyond the point where the target cpu disables interrupts
+		 * in stop machine. I doubt that it can happen, but at least
+		 * there is a theoretical chance. Virtualization might be
+		 * able to expose this, but AFAICT the IOAPIC emulation is not
+		 * as stupid as the real hardware.
+		 *
+		 * Anyway, there is nothing we can do about that at this point
+		 * w/o refactoring the whole fixup_irq() business completely.
+		 * We print at least the irq number and the old vector number,
+		 * so we have the necessary information when a problem in that
+		 * area arises.
+		 */
+		pr_warn("IRQ fixup: irq %d move in progress, old vector %d\n",
+			irqd->irq, vector);
+	}
+	free_moved_vector(apicd);
+}
+
 #else
-# define apic_set_affinity	NULL
+# define apic_set_affinity		NULL
+# define apic_force_complete_move	NULL
 #endif
 
 static int apic_retrigger_irq(struct irq_data *irqd)
@@ -923,11 +1000,12 @@ static void x86_vector_msi_compose_msg(s
 }
 
 static struct irq_chip lapic_controller = {
-	.name			= "APIC",
-	.irq_ack		= apic_ack_edge,
-	.irq_set_affinity	= apic_set_affinity,
-	.irq_compose_msi_msg	= x86_vector_msi_compose_msg,
-	.irq_retrigger		= apic_retrigger_irq,
+	.name				= "APIC",
+	.irq_ack			= apic_ack_edge,
+	.irq_set_affinity		= apic_set_affinity,
+	.irq_compose_msi_msg		= x86_vector_msi_compose_msg,
+	.irq_force_complete_move	= apic_force_complete_move,
+	.irq_retrigger			= apic_retrigger_irq,
 };
 
 #ifdef CONFIG_SMP
@@ -1068,99 +1146,6 @@ void irq_complete_move(struct irq_cfg *c
 		__vector_schedule_cleanup(apicd);
 }
 
-/*
- * Called from fixup_irqs() with @desc->lock held and interrupts disabled.
- */
-void irq_force_complete_move(struct irq_desc *desc)
-{
-	unsigned int cpu = smp_processor_id();
-	struct apic_chip_data *apicd;
-	struct irq_data *irqd;
-	unsigned int vector;
-
-	/*
-	 * The function is called for all descriptors regardless of which
-	 * irqdomain they belong to. For example if an IRQ is provided by
-	 * an irq_chip as part of a GPIO driver, the chip data for that
-	 * descriptor is specific to the irq_chip in question.
-	 *
-	 * Check first that the chip_data is what we expect
-	 * (apic_chip_data) before touching it any further.
-	 */
-	irqd = irq_domain_get_irq_data(x86_vector_domain,
-				       irq_desc_get_irq(desc));
-	if (!irqd)
-		return;
-
-	raw_spin_lock(&vector_lock);
-	apicd = apic_chip_data(irqd);
-	if (!apicd)
-		goto unlock;
-
-	/*
-	 * If prev_vector is empty or the descriptor is neither currently
-	 * nor previously on the outgoing CPU no action required.
-	 */
-	vector = apicd->prev_vector;
-	if (!vector || (apicd->cpu != cpu && apicd->prev_cpu != cpu))
-		goto unlock;
-
-	/*
-	 * This is tricky. If the cleanup of the old vector has not been
-	 * done yet, then the following setaffinity call will fail with
-	 * -EBUSY. This can leave the interrupt in a stale state.
-	 *
-	 * All CPUs are stuck in stop machine with interrupts disabled so
-	 * calling __irq_complete_move() would be completely pointless.
-	 *
-	 * 1) The interrupt is in move_in_progress state. That means that we
-	 *    have not seen an interrupt since the io_apic was reprogrammed to
-	 *    the new vector.
-	 *
-	 * 2) The interrupt has fired on the new vector, but the cleanup IPIs
-	 *    have not been processed yet.
-	 */
-	if (apicd->move_in_progress) {
-		/*
-		 * In theory there is a race:
-		 *
-		 * set_ioapic(new_vector) <-- Interrupt is raised before update
-		 *			      is effective, i.e. it's raised on
-		 *			      the old vector.
-		 *
-		 * So if the target cpu cannot handle that interrupt before
-		 * the old vector is cleaned up, we get a spurious interrupt
-		 * and in the worst case the ioapic irq line becomes stale.
-		 *
-		 * But in case of cpu hotplug this should be a non issue
-		 * because if the affinity update happens right before all
-		 * cpus rendezvous in stop machine, there is no way that the
-		 * interrupt can be blocked on the target cpu because all cpus
-		 * loops first with interrupts enabled in stop machine, so the
-		 * old vector is not yet cleaned up when the interrupt fires.
-		 *
-		 * So the only way to run into this issue is if the delivery
-		 * of the interrupt on the apic/system bus would be delayed
-		 * beyond the point where the target cpu disables interrupts
-		 * in stop machine. I doubt that it can happen, but at least
-		 * there is a theoretical chance. Virtualization might be
-		 * able to expose this, but AFAICT the IOAPIC emulation is not
-		 * as stupid as the real hardware.
-		 *
-		 * Anyway, there is nothing we can do about that at this point
-		 * w/o refactoring the whole fixup_irq() business completely.
-		 * We print at least the irq number and the old vector number,
-		 * so we have the necessary information when a problem in that
-		 * area arises.
-		 */
-		pr_warn("IRQ fixup: irq %d move in progress, old vector %d\n",
-			irqd->irq, vector);
-	}
-	free_moved_vector(apicd);
-unlock:
-	raw_spin_unlock(&vector_lock);
-}
-
 #ifdef CONFIG_HOTPLUG_CPU
 /*
  * Note, this is not accurate accounting, but at least good enough to
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -486,6 +486,7 @@ static inline irq_hw_number_t irqd_to_hw
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -537,6 +538,8 @@ struct irq_chip {
 	int		(*irq_nmi_setup)(struct irq_data *data);
 	void		(*irq_nmi_teardown)(struct irq_data *data);
 
+	void		(*irq_force_complete_move)(struct irq_data *data);
+
 	unsigned long	flags;
 };
 
@@ -619,11 +622,9 @@ static inline void irq_move_irq(struct i
 		__irq_move_irq(data);
 }
 void irq_move_masked_irq(struct irq_data *data);
-void irq_force_complete_move(struct irq_desc *desc);
 #else
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
-static inline void irq_force_complete_move(struct irq_desc *desc) { }
 #endif
 
 extern int no_irq_affinity;
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -442,6 +442,7 @@ static inline struct cpumask *irq_desc_g
 	return desc->pending_mask;
 }
 bool irq_fixup_move_pending(struct irq_desc *desc, bool force_clear);
+void irq_force_complete_move(struct irq_desc *desc);
 #else /* CONFIG_GENERIC_PENDING_IRQ */
 static inline bool irq_can_move_pcntxt(struct irq_data *data)
 {
@@ -467,6 +468,7 @@ static inline bool irq_fixup_move_pendin
 {
 	return false;
 }
+static inline void irq_force_complete_move(struct irq_desc *desc) { }
 #endif /* !CONFIG_GENERIC_PENDING_IRQ */
 
 #if !defined(CONFIG_IRQ_DOMAIN) || !defined(CONFIG_IRQ_DOMAIN_HIERARCHY)
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -35,6 +35,16 @@ bool irq_fixup_move_pending(struct irq_d
 	return true;
 }
 
+void irq_force_complete_move(struct irq_desc *desc)
+{
+	for (struct irq_data *d = irq_desc_get_irq_data(desc); d; d = d->parent_data) {
+		if (d->chip && d->chip->irq_force_complete_move) {
+			d->chip->irq_force_complete_move(d);
+			return;
+		}
+	}
+}
+
 void irq_move_masked_irq(struct irq_data *idata)
 {
 	struct irq_desc *desc = irq_data_to_desc(idata);
