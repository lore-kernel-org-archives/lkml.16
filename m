Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360517A2F2
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 20:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206428; cv=none; b=Mn8e0EaiPH9mQQYLBf4N9z1tr+KNDpnyJnr3Y4iciHn97nUXIFnoNCAp702jUxtfB45vias+NzSN7hOhXsSPFYlGqbsOu4bYcDOyrHZbL53F2PXgoPy5M6oKrY7OhatkNlGIiTfIJP9rWXse5B73iMoUDbnoY4Vsx6Xpv5IxsOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206428; c=relaxed/simple;
	bh=t9r7hoTqe2Zju4Cu/6dlAWNuxpHGn6u7ouDCZre9tGE=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=Z12TBIsKPJ76P0kcdt7oL+ZcSRMRjm0hVSXf0gqoDoA1TEGcxOlt5CY1QVtDgVP4Kg6T6mHzkeZ+RlUmgAzh+etfXT4bhbdeLlmJVu+aHMex0aISJp4BlwrSikfLZH2SWGuqHnAq54dZDFmALuXM2NPM75dqVO0n6Au/s0X34OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i1vyNNfo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VOIYrczJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i1vyNNfo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VOIYrczJ"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748206419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=/iKWWAOGWB8dJfFwLLLeQblnHB3MtJeUqiabb8gtxFo=;
	b=i1vyNNfomod05xKERCbZPVBhcV7z812vhJLsq7O3yjqoZKwpRoPvnSHME9KNt/FCRzjN7E
	NXR1NW3eVndq+hm5OsLHktYwulWRH3j7QFEfY1d7hd0v3tDVcfy8NeOWSXZhi8RwiMowgC
	cTQN8Jvp72M4M07n5+IlfNi6VgbTi28QDJWEL9dEx/kP1V2cDLxXoo/zj4+IA7p/BGoVmH
	KvXF+OOcbJgbttMveNFlKNrUR9nDNJRRyV4rK6M3VgnTOWIEusvBI9dIiV6Majv6aoV25K
	IkwU8jgozNuWCwhmiZIiEC/zMiEIhdX6g+Mho1xSKd61ECtC/M2PLpB6xwzZGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748206419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=/iKWWAOGWB8dJfFwLLLeQblnHB3MtJeUqiabb8gtxFo=;
	b=VOIYrczJYr9EPeIZgFlJdPA5gNnTXG45qiq/m5Cx6p3eCmleD9LGe8BoIYXtwHzdgN6P5j
	Eai5DQnO5K5dzqAQ==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] irq/core for v6.16-rc1
References: <174820637262.238682.1985899398053030312.tglx@xen13>
Message-ID: <174820637449.238682.15099827741796061971.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 May 2025 22:53:38 +0200 (CEST)

Linus,

please pull the latest irq/core branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-core-2025-05=
-25

up to:  a510bb87da72: genirq/irqdesc: Remove double locking in hwirq_show()


Updates for the generic interrupt subsystem core code:

  - Address a long standing subtle problem in the CPU hotplug code for
    affinity-managed interrupts.

    Affinity-managed interrupts are shut down by the core code when the
    last CPU in the affinity set goes offline and started up again when the
    first CPU in the affinity set becomes online again. This unfortunately
    does not take into account whether an interrupt has been disabled
    before the last CPU goes offline and starts up the interrupt
    unconditionally when the first CPU becomes online again. That's
    obviously not what drivers expect.

    Address this by preserving the disabled state for affinity-managed
    interrupts accross these CPU hotplug operations. All non-managed
    interrupts are not affected by this because startup/shutdown is coupled
    to request/free_irq() which obviously has to reset state.

  - Support three-cell scheme interrupts to allow GPIO drivers to specify
    interrupts from an already existing scheme

  - Switch the interrupt subsystem core to lock guards. This gets rid of
    quite some copy & pasta boilerplate code all over the place.

  - The usual small cleanups and improvements all over the place

Thanks,

	tglx

------------------>
Andy Shevchenko (4):
      genirq/irqdesc: Use sysfs_emit() to instead of s*printf()
      genirq/irqdesc: Decrease indentation level in __irq_get_desc_lock()
      genirq: Consistently use '%u' format specifier for unsigned int variabl=
es
      genirq: Bump the size of the local variable for sprintf()

Brian Norris (1):
      genirq: Retain disable depth for managed interrupts across CPU hotplug

Cheng-Yang Chou (1):
      genirq: Fix typo in IRQ_NOTCONNECTED comment

Claudiu Beznea (1):
      genirq/irqdesc: Remove double locking in hwirq_show()

Dr. David Alan Gilbert (1):
      genirq: Remove unused remove_percpu_irq()

Jon Hunter (1):
      genirq/manage: Use the correct lock guard in irq_set_irq_wake()

Nathan Chancellor (1):
      genirq: Ensure flags in lock guard is consistently initialized

Thomas Gleixner (48):
      genirq: Provide conditional lock guards
      genirq/irqdesc: Switch to lock guards
      genirq/autoprobe: Switch to lock guards
      genirq/pm: Switch to lock guards
      genirq/resend: Switch to lock guards
      genirq/proc: Switch to lock guards
      genirq/spurious: Cleanup code
      genirq/spurious: Switch to lock guards
      genirq/cpuhotplug: Convert to lock guards
      genirq/debugfs: Convert to lock guards
      genirq/chip: Prepare for code reduction
      genirq/chip: Rework handle_nested_irq()
      genirq/chip: Rework handle_simple_irq()
      genirq/chip: Rework handle_untracked_irq()
      genirq/chip: Rework handle_level_irq()
      genirq/chip: Rework handle_eoi_irq()
      genirq/chip: Rework handle_edge_irq()
      genirq/chip: Rework handle_fasteoi_ack_irq()
      genirq/chip: Rework handle_fasteoi_mask_irq()
      genirq/chip: Use lock guards where applicable
      genirq/chip: Rework irq_set_chip()
      genirq/chip: Rework irq_set_irq_type()
      genirq/chip: Rework irq_set_handler_data()
      genirq/chip: Rework irq_set_msi_desc_off()
      genirq/chip: Rework irq_set_chip_data()
      genirq/chip: Rework irq_set_handler() variants
      genirq/chip: Rework irq_modify_status()
      genirq/manage: Cleanup kernel doc comments
      genirq/manage: Convert to lock guards
      genirq/manage: Rework irq_update_affinity_desc()
      genirq/manage: Rework __irq_apply_affinity_hint()
      genirq/manage: Rework irq_set_vcpu_affinity()
      genirq/manage: Rework __disable_irq_nosync()
      genirq/manage: Rework enable_irq()
      genirq/manage: Rework irq_set_irq_wake()
      genirq/manage: Rework can_request_irq()
      genirq/manage: Rework irq_set_parent()
      genirq/manage: Rework enable_percpu_irq()
      genirq/manage: Rework irq_percpu_is_enabled()
      genirq/manage: Rework disable_percpu_irq()
      genirq/manage: Rework prepare_percpu_nmi()
      genirq/manage: Rework teardown_percpu_nmi()
      genirq/manage: Rework irq_get_irqchip_state()
      genirq/manage: Rework irq_set_irqchip_state()
      genirq: Remove irq_[get|put]_desc*()
      genirq: Use scoped_guard() to shut clang up
      genirq/cpuhotplug: Fix up lock guards conversion brainf..t
      genirq: Fix inverted condition in handle_nested_irq()

Yixun Lan (1):
      irqdomain: Support three-cell scheme interrupts


 include/linux/interrupt.h |    2 +-
 include/linux/irq.h       |    3 +-
 include/linux/irqdomain.h |   20 +-
 kernel/irq/autoprobe.c    |   26 +-
 kernel/irq/chip.c         |  631 ++++++++++--------------
 kernel/irq/cpuhotplug.c   |   12 +-
 kernel/irq/debugfs.c      |    7 +-
 kernel/irq/internals.h    |   48 +-
 kernel/irq/irqdesc.c      |  176 +++----
 kernel/irq/irqdomain.c    |   56 +++
 kernel/irq/manage.c       | 1166 +++++++++++++++++++------------------------=
--
 kernel/irq/pm.c           |   38 +-
 kernel/irq/proc.c         |   67 +--
 kernel/irq/resend.c       |   50 +-
 kernel/irq/spurious.c     |  104 ++--
 15 files changed, 1026 insertions(+), 1380 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index c782a74d2a30..51b6484c0493 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -140,7 +140,7 @@ extern irqreturn_t no_action(int cpl, void *dev_id);
 /*
  * If a (PCI) device interrupt is not connected we set dev->irq to
  * IRQ_NOTCONNECTED. This causes request_irq() to fail with -ENOTCONN, so we
- * can distingiush that case from other error returns.
+ * can distinguish that case from other error returns.
  *
  * 0x80000000 is guaranteed to be outside the available range of interrupts
  * and easy to distinguish from other possible incorrect values.
diff --git a/include/linux/irq.h b/include/linux/irq.h
index dd5df1e2d032..810e44ee297f 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -597,7 +597,6 @@ enum {
=20
 struct irqaction;
 extern int setup_percpu_irq(unsigned int irq, struct irqaction *new);
-extern void remove_percpu_irq(unsigned int irq, struct irqaction *act);
=20
 #ifdef CONFIG_DEPRECATED_IRQ_CPU_ONOFFLINE
 extern void irq_cpu_online(void);
@@ -700,7 +699,7 @@ extern void note_interrupt(struct irq_desc *desc, irqretu=
rn_t action_ret);
 extern int noirqdebug_setup(char *str);
=20
 /* Checks whether the interrupt can be requested by request_irq(): */
-extern int can_request_irq(unsigned int irq, unsigned long irqflags);
+extern bool can_request_irq(unsigned int irq, unsigned long irqflags);
=20
 /* Dummy irq-chip implementations: */
 extern struct irq_chip no_irq_chip;
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index bb7111105296..df7e9278c8ac 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -571,16 +571,16 @@ int irq_domain_xlate_twocell(struct irq_domain *d, stru=
ct device_node *ctrlr,
 int irq_domain_xlate_onetwocell(struct irq_domain *d, struct device_node *ct=
rlr,
 			const u32 *intspec, unsigned int intsize,
 			irq_hw_number_t *out_hwirq, unsigned int *out_type);
-
-int irq_domain_translate_twocell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
-
-int irq_domain_translate_onecell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
+int irq_domain_xlate_twothreecell(struct irq_domain *d, struct device_node *=
ctrlr,
+				  const u32 *intspec, unsigned int intsize,
+				  irq_hw_number_t *out_hwirq, unsigned int *out_type);
+
+int irq_domain_translate_onecell(struct irq_domain *d, struct irq_fwspec *fw=
spec,
+				 unsigned long *out_hwirq, unsigned int *out_type);
+int irq_domain_translate_twocell(struct irq_domain *d, struct irq_fwspec *fw=
spec,
+				 unsigned long *out_hwirq, unsigned int *out_type);
+int irq_domain_translate_twothreecell(struct irq_domain *d, struct irq_fwspe=
c *fwspec,
+				      unsigned long *out_hwirq, unsigned int *out_type);
=20
 /* IPI functions */
 int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest);
diff --git a/kernel/irq/autoprobe.c b/kernel/irq/autoprobe.c
index ae60cae24e9a..d0af8a8b3ae6 100644
--- a/kernel/irq/autoprobe.c
+++ b/kernel/irq/autoprobe.c
@@ -43,18 +43,16 @@ unsigned long probe_irq_on(void)
 	 * flush such a longstanding irq before considering it as spurious.
 	 */
 	for_each_irq_desc_reverse(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (!desc->action && irq_settings_can_probe(desc)) {
 			/*
 			 * Some chips need to know about probing in
 			 * progress:
 			 */
 			if (desc->irq_data.chip->irq_set_type)
-				desc->irq_data.chip->irq_set_type(&desc->irq_data,
-							 IRQ_TYPE_PROBE);
+				desc->irq_data.chip->irq_set_type(&desc->irq_data, IRQ_TYPE_PROBE);
 			irq_activate_and_startup(desc, IRQ_NORESEND);
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
=20
 	/* Wait for longstanding interrupts to trigger. */
@@ -66,13 +64,12 @@ unsigned long probe_irq_on(void)
 	 * happened in the previous stage, it may have masked itself)
 	 */
 	for_each_irq_desc_reverse(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (!desc->action && irq_settings_can_probe(desc)) {
 			desc->istate |=3D IRQS_AUTODETECT | IRQS_WAITING;
 			if (irq_activate_and_startup(desc, IRQ_NORESEND))
 				desc->istate |=3D IRQS_PENDING;
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
=20
 	/*
@@ -84,18 +81,16 @@ unsigned long probe_irq_on(void)
 	 * Now filter out any obviously spurious interrupts
 	 */
 	for_each_irq_desc(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
-
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (desc->istate & IRQS_AUTODETECT) {
 			/* It triggered already - consider it spurious. */
 			if (!(desc->istate & IRQS_WAITING)) {
 				desc->istate &=3D ~IRQS_AUTODETECT;
 				irq_shutdown_and_deactivate(desc);
-			} else
-				if (i < 32)
-					mask |=3D 1 << i;
+			} else if (i < 32) {
+				mask |=3D 1 << i;
+			}
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
=20
 	return mask;
@@ -121,7 +116,7 @@ unsigned int probe_irq_mask(unsigned long val)
 	int i;
=20
 	for_each_irq_desc(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (desc->istate & IRQS_AUTODETECT) {
 			if (i < 16 && !(desc->istate & IRQS_WAITING))
 				mask |=3D 1 << i;
@@ -129,7 +124,6 @@ unsigned int probe_irq_mask(unsigned long val)
 			desc->istate &=3D ~IRQS_AUTODETECT;
 			irq_shutdown_and_deactivate(desc);
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
 	mutex_unlock(&probing_active);
=20
@@ -160,8 +154,7 @@ int probe_irq_off(unsigned long val)
 	struct irq_desc *desc;
=20
 	for_each_irq_desc(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
-
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (desc->istate & IRQS_AUTODETECT) {
 			if (!(desc->istate & IRQS_WAITING)) {
 				if (!nr_of_irqs)
@@ -171,7 +164,6 @@ int probe_irq_off(unsigned long val)
 			desc->istate &=3D ~IRQS_AUTODETECT;
 			irq_shutdown_and_deactivate(desc);
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
 	mutex_unlock(&probing_active);
=20
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 36cf1b09cc84..b0e0a7332993 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -34,98 +34,80 @@ struct irqaction chained_action =3D {
 };
=20
 /**
- *	irq_set_chip - set the irq chip for an irq
- *	@irq:	irq number
- *	@chip:	pointer to irq chip description structure
+ * irq_set_chip - set the irq chip for an irq
+ * @irq:	irq number
+ * @chip:	pointer to irq chip description structure
  */
 int irq_set_chip(unsigned int irq, const struct irq_chip *chip)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, 0);
+	int ret =3D -EINVAL;
=20
-	if (!desc)
-		return -EINVAL;
-
-	desc->irq_data.chip =3D (struct irq_chip *)(chip ?: &no_irq_chip);
-	irq_put_desc_unlock(desc, flags);
-	/*
-	 * For !CONFIG_SPARSE_IRQ make the irq show up in
-	 * allocated_irqs.
-	 */
-	irq_mark_irq(irq);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		scoped_irqdesc->irq_data.chip =3D (struct irq_chip *)(chip ?: &no_irq_chip=
);
+		ret =3D 0;
+	}
+	/* For !CONFIG_SPARSE_IRQ make the irq show up in allocated_irqs. */
+	if (!ret)
+		irq_mark_irq(irq);
+	return ret;
 }
 EXPORT_SYMBOL(irq_set_chip);
=20
 /**
- *	irq_set_irq_type - set the irq trigger type for an irq
- *	@irq:	irq number
- *	@type:	IRQ_TYPE_{LEVEL,EDGE}_* value - see include/linux/irq.h
+ * irq_set_irq_type - set the irq trigger type for an irq
+ * @irq:	irq number
+ * @type:	IRQ_TYPE_{LEVEL,EDGE}_* value - see include/linux/irq.h
  */
 int irq_set_irq_type(unsigned int irq, unsigned int type)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CH=
ECK_GLOBAL);
-	int ret =3D 0;
-
-	if (!desc)
-		return -EINVAL;
-
-	ret =3D __irq_set_trigger(desc, type);
-	irq_put_desc_busunlock(desc, flags);
-	return ret;
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL)
+		return __irq_set_trigger(scoped_irqdesc, type);
+	return -EINVAL;
 }
 EXPORT_SYMBOL(irq_set_irq_type);
=20
 /**
- *	irq_set_handler_data - set irq handler data for an irq
- *	@irq:	Interrupt number
- *	@data:	Pointer to interrupt specific data
+ * irq_set_handler_data - set irq handler data for an irq
+ * @irq:	Interrupt number
+ * @data:	Pointer to interrupt specific data
  *
- *	Set the hardware irq controller data for an irq
+ * Set the hardware irq controller data for an irq
  */
 int irq_set_handler_data(unsigned int irq, void *data)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, 0);
-
-	if (!desc)
-		return -EINVAL;
-	desc->irq_common_data.handler_data =3D data;
-	irq_put_desc_unlock(desc, flags);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		scoped_irqdesc->irq_common_data.handler_data =3D data;
+		return 0;
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL(irq_set_handler_data);
=20
 /**
- *	irq_set_msi_desc_off - set MSI descriptor data for an irq at offset
- *	@irq_base:	Interrupt number base
- *	@irq_offset:	Interrupt number offset
- *	@entry:		Pointer to MSI descriptor data
+ * irq_set_msi_desc_off - set MSI descriptor data for an irq at offset
+ * @irq_base:	Interrupt number base
+ * @irq_offset:	Interrupt number offset
+ * @entry:		Pointer to MSI descriptor data
  *
- *	Set the MSI descriptor entry for an irq at offset
+ * Set the MSI descriptor entry for an irq at offset
  */
-int irq_set_msi_desc_off(unsigned int irq_base, unsigned int irq_offset,
-			 struct msi_desc *entry)
-{
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq_base + irq_offset, &flags, =
IRQ_GET_DESC_CHECK_GLOBAL);
-
-	if (!desc)
-		return -EINVAL;
-	desc->irq_common_data.msi_desc =3D entry;
-	if (entry && !irq_offset)
-		entry->irq =3D irq_base;
-	irq_put_desc_unlock(desc, flags);
-	return 0;
+int irq_set_msi_desc_off(unsigned int irq_base, unsigned int irq_offset, str=
uct msi_desc *entry)
+{
+	scoped_irqdesc_get_and_lock(irq_base + irq_offset, IRQ_GET_DESC_CHECK_GLOBA=
L) {
+		scoped_irqdesc->irq_common_data.msi_desc =3D entry;
+		if (entry && !irq_offset)
+			entry->irq =3D irq_base;
+		return 0;
+	}
+	return -EINVAL;
 }
=20
 /**
- *	irq_set_msi_desc - set MSI descriptor data for an irq
- *	@irq:	Interrupt number
- *	@entry:	Pointer to MSI descriptor data
+ * irq_set_msi_desc - set MSI descriptor data for an irq
+ * @irq:	Interrupt number
+ * @entry:	Pointer to MSI descriptor data
  *
- *	Set the MSI descriptor entry for an irq
+ * Set the MSI descriptor entry for an irq
  */
 int irq_set_msi_desc(unsigned int irq, struct msi_desc *entry)
 {
@@ -133,22 +115,19 @@ int irq_set_msi_desc(unsigned int irq, struct msi_desc =
*entry)
 }
=20
 /**
- *	irq_set_chip_data - set irq chip data for an irq
- *	@irq:	Interrupt number
- *	@data:	Pointer to chip specific data
+ * irq_set_chip_data - set irq chip data for an irq
+ * @irq:	Interrupt number
+ * @data:	Pointer to chip specific data
  *
- *	Set the hardware irq chip data for an irq
+ * Set the hardware irq chip data for an irq
  */
 int irq_set_chip_data(unsigned int irq, void *data)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, 0);
-
-	if (!desc)
-		return -EINVAL;
-	desc->irq_data.chip_data =3D data;
-	irq_put_desc_unlock(desc, flags);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		scoped_irqdesc->irq_data.chip_data =3D data;
+		return 0;
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL(irq_set_chip_data);
=20
@@ -223,6 +202,19 @@ __irq_startup_managed(struct irq_desc *desc, const struc=
t cpumask *aff,
 		return IRQ_STARTUP_ABORT;
 	return IRQ_STARTUP_MANAGED;
 }
+
+void irq_startup_managed(struct irq_desc *desc)
+{
+	/*
+	 * Only start it up when the disable depth is 1, so that a disable,
+	 * hotunplug, hotplug sequence does not end up enabling it during
+	 * hotplug unconditionally.
+	 */
+	desc->depth--;
+	if (!desc->depth)
+		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
+}
+
 #else
 static __always_inline int
 __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
@@ -290,6 +282,7 @@ int irq_startup(struct irq_desc *desc, bool resend, bool =
force)
 			ret =3D __irq_startup(desc);
 			break;
 		case IRQ_STARTUP_ABORT:
+			desc->depth =3D 1;
 			irqd_set_managed_shutdown(d);
 			return 0;
 		}
@@ -322,7 +315,13 @@ void irq_shutdown(struct irq_desc *desc)
 {
 	if (irqd_is_started(&desc->irq_data)) {
 		clear_irq_resend(desc);
-		desc->depth =3D 1;
+		/*
+		 * Increment disable depth, so that a managed shutdown on
+		 * CPU hotunplug preserves the actual disabled state when the
+		 * CPU comes back online. See irq_startup_managed().
+		 */
+		desc->depth++;
+
 		if (desc->irq_data.chip->irq_shutdown) {
 			desc->irq_data.chip->irq_shutdown(&desc->irq_data);
 			irq_state_set_disabled(desc);
@@ -450,48 +449,6 @@ void unmask_threaded_irq(struct irq_desc *desc)
 	unmask_irq(desc);
 }
=20
-/*
- *	handle_nested_irq - Handle a nested irq from a irq thread
- *	@irq:	the interrupt number
- *
- *	Handle interrupts which are nested into a threaded interrupt
- *	handler. The handler function is called inside the calling
- *	threads context.
- */
-void handle_nested_irq(unsigned int irq)
-{
-	struct irq_desc *desc =3D irq_to_desc(irq);
-	struct irqaction *action;
-	irqreturn_t action_ret;
-
-	might_sleep();
-
-	raw_spin_lock_irq(&desc->lock);
-
-	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
-
-	action =3D desc->action;
-	if (unlikely(!action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |=3D IRQS_PENDING;
-		raw_spin_unlock_irq(&desc->lock);
-		return;
-	}
-
-	kstat_incr_irqs_this_cpu(desc);
-	atomic_inc(&desc->threads_active);
-	raw_spin_unlock_irq(&desc->lock);
-
-	action_ret =3D IRQ_NONE;
-	for_each_action_of_desc(desc, action)
-		action_ret |=3D action->thread_fn(action->irq, action->dev_id);
-
-	if (!irq_settings_no_debug(desc))
-		note_interrupt(desc, action_ret);
-
-	wake_threads_waitq(desc);
-}
-EXPORT_SYMBOL_GPL(handle_nested_irq);
-
 static bool irq_check_poll(struct irq_desc *desc)
 {
 	if (!(desc->istate & IRQS_POLL_INPROGRESS))
@@ -499,7 +456,7 @@ static bool irq_check_poll(struct irq_desc *desc)
 	return irq_wait_for_poll(desc);
 }
=20
-static bool irq_may_run(struct irq_desc *desc)
+static bool irq_can_handle_pm(struct irq_desc *desc)
 {
 	unsigned int mask =3D IRQD_IRQ_INPROGRESS | IRQD_WAKEUP_ARMED;
=20
@@ -524,77 +481,111 @@ static bool irq_may_run(struct irq_desc *desc)
 	return irq_check_poll(desc);
 }
=20
+static inline bool irq_can_handle_actions(struct irq_desc *desc)
+{
+	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
+
+	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
+		desc->istate |=3D IRQS_PENDING;
+		return false;
+	}
+	return true;
+}
+
+static inline bool irq_can_handle(struct irq_desc *desc)
+{
+	if (!irq_can_handle_pm(desc))
+		return false;
+
+	return irq_can_handle_actions(desc);
+}
+
 /**
- *	handle_simple_irq - Simple and software-decoded IRQs.
- *	@desc:	the interrupt description structure for this irq
- *
- *	Simple interrupts are either sent from a demultiplexing interrupt
- *	handler or come from hardware, where no interrupt hardware control
- *	is necessary.
+ * handle_nested_irq - Handle a nested irq from a irq thread
+ * @irq:	the interrupt number
  *
- *	Note: The caller is expected to handle the ack, clear, mask and
- *	unmask issues if necessary.
+ * Handle interrupts which are nested into a threaded interrupt
+ * handler. The handler function is called inside the calling threads
+ * context.
  */
-void handle_simple_irq(struct irq_desc *desc)
+void handle_nested_irq(unsigned int irq)
 {
-	raw_spin_lock(&desc->lock);
+	struct irq_desc *desc =3D irq_to_desc(irq);
+	struct irqaction *action;
+	irqreturn_t action_ret;
=20
-	if (!irq_may_run(desc))
-		goto out_unlock;
+	might_sleep();
=20
-	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
+	scoped_guard(raw_spinlock_irq, &desc->lock) {
+		if (!irq_can_handle_actions(desc))
+			return;
=20
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |=3D IRQS_PENDING;
-		goto out_unlock;
+		action =3D desc->action;
+		kstat_incr_irqs_this_cpu(desc);
+		atomic_inc(&desc->threads_active);
 	}
=20
+	action_ret =3D IRQ_NONE;
+	for_each_action_of_desc(desc, action)
+		action_ret |=3D action->thread_fn(action->irq, action->dev_id);
+
+	if (!irq_settings_no_debug(desc))
+		note_interrupt(desc, action_ret);
+
+	wake_threads_waitq(desc);
+}
+EXPORT_SYMBOL_GPL(handle_nested_irq);
+
+/**
+ * handle_simple_irq - Simple and software-decoded IRQs.
+ * @desc:	the interrupt description structure for this irq
+ *
+ * Simple interrupts are either sent from a demultiplexing interrupt
+ * handler or come from hardware, where no interrupt hardware control is
+ * necessary.
+ *
+ * Note: The caller is expected to handle the ack, clear, mask and unmask
+ * issues if necessary.
+ */
+void handle_simple_irq(struct irq_desc *desc)
+{
+	guard(raw_spinlock)(&desc->lock);
+
+	if (!irq_can_handle(desc))
+		return;
+
 	kstat_incr_irqs_this_cpu(desc);
 	handle_irq_event(desc);
-
-out_unlock:
-	raw_spin_unlock(&desc->lock);
 }
 EXPORT_SYMBOL_GPL(handle_simple_irq);
=20
 /**
- *	handle_untracked_irq - Simple and software-decoded IRQs.
- *	@desc:	the interrupt description structure for this irq
+ * handle_untracked_irq - Simple and software-decoded IRQs.
+ * @desc:	the interrupt description structure for this irq
  *
- *	Untracked interrupts are sent from a demultiplexing interrupt
- *	handler when the demultiplexer does not know which device it its
- *	multiplexed irq domain generated the interrupt. IRQ's handled
- *	through here are not subjected to stats tracking, randomness, or
- *	spurious interrupt detection.
+ * Untracked interrupts are sent from a demultiplexing interrupt handler
+ * when the demultiplexer does not know which device it its multiplexed irq
+ * domain generated the interrupt. IRQ's handled through here are not
+ * subjected to stats tracking, randomness, or spurious interrupt
+ * detection.
  *
- *	Note: Like handle_simple_irq, the caller is expected to handle
- *	the ack, clear, mask and unmask issues if necessary.
+ * Note: Like handle_simple_irq, the caller is expected to handle the ack,
+ * clear, mask and unmask issues if necessary.
  */
 void handle_untracked_irq(struct irq_desc *desc)
 {
-	raw_spin_lock(&desc->lock);
-
-	if (!irq_may_run(desc))
-		goto out_unlock;
-
-	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
+	scoped_guard(raw_spinlock, &desc->lock) {
+		if (!irq_can_handle(desc))
+			return;
=20
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |=3D IRQS_PENDING;
-		goto out_unlock;
+		desc->istate &=3D ~IRQS_PENDING;
+		irqd_set(&desc->irq_data, IRQD_IRQ_INPROGRESS);
 	}
=20
-	desc->istate &=3D ~IRQS_PENDING;
-	irqd_set(&desc->irq_data, IRQD_IRQ_INPROGRESS);
-	raw_spin_unlock(&desc->lock);
-
 	__handle_irq_event_percpu(desc);
=20
-	raw_spin_lock(&desc->lock);
-	irqd_clear(&desc->irq_data, IRQD_IRQ_INPROGRESS);
-
-out_unlock:
-	raw_spin_unlock(&desc->lock);
+	scoped_guard(raw_spinlock, &desc->lock)
+		irqd_clear(&desc->irq_data, IRQD_IRQ_INPROGRESS);
 }
 EXPORT_SYMBOL_GPL(handle_untracked_irq);
=20
@@ -617,40 +608,26 @@ static void cond_unmask_irq(struct irq_desc *desc)
 }
=20
 /**
- *	handle_level_irq - Level type irq handler
- *	@desc:	the interrupt description structure for this irq
+ * handle_level_irq - Level type irq handler
+ * @desc:	the interrupt description structure for this irq
  *
- *	Level type interrupts are active as long as the hardware line has
- *	the active level. This may require to mask the interrupt and unmask
- *	it after the associated handler has acknowledged the device, so the
- *	interrupt line is back to inactive.
+ * Level type interrupts are active as long as the hardware line has the
+ * active level. This may require to mask the interrupt and unmask it after
+ * the associated handler has acknowledged the device, so the interrupt
+ * line is back to inactive.
  */
 void handle_level_irq(struct irq_desc *desc)
 {
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
 	mask_ack_irq(desc);
=20
-	if (!irq_may_run(desc))
-		goto out_unlock;
-
-	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
-
-	/*
-	 * If its disabled or no action available
-	 * keep it masked and get out of here
-	 */
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |=3D IRQS_PENDING;
-		goto out_unlock;
-	}
+	if (!irq_can_handle(desc))
+		return;
=20
 	kstat_incr_irqs_this_cpu(desc);
 	handle_irq_event(desc);
=20
 	cond_unmask_irq(desc);
-
-out_unlock:
-	raw_spin_unlock(&desc->lock);
 }
 EXPORT_SYMBOL_GPL(handle_level_irq);
=20
@@ -675,42 +652,43 @@ static void cond_unmask_eoi_irq(struct irq_desc *desc, =
struct irq_chip *chip)
 	}
 }
=20
+static inline void cond_eoi_irq(struct irq_chip *chip, struct irq_data *data)
+{
+	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
+		chip->irq_eoi(data);
+}
+
 /**
- *	handle_fasteoi_irq - irq handler for transparent controllers
- *	@desc:	the interrupt description structure for this irq
+ * handle_fasteoi_irq - irq handler for transparent controllers
+ * @desc:	the interrupt description structure for this irq
  *
- *	Only a single callback will be issued to the chip: an ->eoi()
- *	call when the interrupt has been serviced. This enables support
- *	for modern forms of interrupt handlers, which handle the flow
- *	details in hardware, transparently.
+ * Only a single callback will be issued to the chip: an ->eoi() call when
+ * the interrupt has been serviced. This enables support for modern forms
+ * of interrupt handlers, which handle the flow details in hardware,
+ * transparently.
  */
 void handle_fasteoi_irq(struct irq_desc *desc)
 {
 	struct irq_chip *chip =3D desc->irq_data.chip;
=20
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
=20
 	/*
 	 * When an affinity change races with IRQ handling, the next interrupt
 	 * can arrive on the new CPU before the original CPU has completed
 	 * handling the previous one - it may need to be resent.
 	 */
-	if (!irq_may_run(desc)) {
+	if (!irq_can_handle_pm(desc)) {
 		if (irqd_needs_resend_when_in_progress(&desc->irq_data))
 			desc->istate |=3D IRQS_PENDING;
-		goto out;
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
 	}
=20
-	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
-
-	/*
-	 * If its disabled or no action available
-	 * then mask it and get out of here:
-	 */
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |=3D IRQS_PENDING;
+	if (!irq_can_handle_actions(desc)) {
 		mask_irq(desc);
-		goto out;
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
 	}
=20
 	kstat_incr_irqs_this_cpu(desc);
@@ -726,13 +704,6 @@ void handle_fasteoi_irq(struct irq_desc *desc)
 	 */
 	if (unlikely(desc->istate & IRQS_PENDING))
 		check_irq_resend(desc, false);
-
-	raw_spin_unlock(&desc->lock);
-	return;
-out:
-	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
-		chip->irq_eoi(&desc->irq_data);
-	raw_spin_unlock(&desc->lock);
 }
 EXPORT_SYMBOL_GPL(handle_fasteoi_irq);
=20
@@ -770,40 +741,27 @@ void handle_fasteoi_nmi(struct irq_desc *desc)
 EXPORT_SYMBOL_GPL(handle_fasteoi_nmi);
=20
 /**
- *	handle_edge_irq - edge type IRQ handler
- *	@desc:	the interrupt description structure for this irq
+ * handle_edge_irq - edge type IRQ handler
+ * @desc:	the interrupt description structure for this irq
  *
- *	Interrupt occurs on the falling and/or rising edge of a hardware
- *	signal. The occurrence is latched into the irq controller hardware
- *	and must be acked in order to be reenabled. After the ack another
- *	interrupt can happen on the same source even before the first one
- *	is handled by the associated event handler. If this happens it
- *	might be necessary to disable (mask) the interrupt depending on the
- *	controller hardware. This requires to reenable the interrupt inside
- *	of the loop which handles the interrupts which have arrived while
- *	the handler was running. If all pending interrupts are handled, the
- *	loop is left.
+ * Interrupt occurs on the falling and/or rising edge of a hardware
+ * signal. The occurrence is latched into the irq controller hardware and
+ * must be acked in order to be reenabled. After the ack another interrupt
+ * can happen on the same source even before the first one is handled by
+ * the associated event handler. If this happens it might be necessary to
+ * disable (mask) the interrupt depending on the controller hardware. This
+ * requires to reenable the interrupt inside of the loop which handles the
+ * interrupts which have arrived while the handler was running. If all
+ * pending interrupts are handled, the loop is left.
  */
 void handle_edge_irq(struct irq_desc *desc)
 {
-	raw_spin_lock(&desc->lock);
-
-	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
-
-	if (!irq_may_run(desc)) {
-		desc->istate |=3D IRQS_PENDING;
-		mask_ack_irq(desc);
-		goto out_unlock;
-	}
+	guard(raw_spinlock)(&desc->lock);
=20
-	/*
-	 * If its disabled or no action available then mask it and get
-	 * out of here.
-	 */
-	if (irqd_irq_disabled(&desc->irq_data) || !desc->action) {
+	if (!irq_can_handle(desc)) {
 		desc->istate |=3D IRQS_PENDING;
 		mask_ack_irq(desc);
-		goto out_unlock;
+		return;
 	}
=20
 	kstat_incr_irqs_this_cpu(desc);
@@ -814,7 +772,7 @@ void handle_edge_irq(struct irq_desc *desc)
 	do {
 		if (unlikely(!desc->action)) {
 			mask_irq(desc);
-			goto out_unlock;
+			return;
 		}
=20
 		/*
@@ -830,11 +788,7 @@ void handle_edge_irq(struct irq_desc *desc)
=20
 		handle_irq_event(desc);
=20
-	} while ((desc->istate & IRQS_PENDING) &&
-		 !irqd_irq_disabled(&desc->irq_data));
-
-out_unlock:
-	raw_spin_unlock(&desc->lock);
+	} while ((desc->istate & IRQS_PENDING) && !irqd_irq_disabled(&desc->irq_dat=
a));
 }
 EXPORT_SYMBOL(handle_edge_irq);
=20
@@ -1007,35 +961,23 @@ __irq_do_set_handler(struct irq_desc *desc, irq_flow_h=
andler_t handle,
 	}
 }
=20
-void
-__irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int is_chaine=
d,
-		  const char *name)
+void __irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int is_c=
hained,
+		       const char *name)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_buslock(irq, &flags, 0);
-
-	if (!desc)
-		return;
-
-	__irq_do_set_handler(desc, handle, is_chained, name);
-	irq_put_desc_busunlock(desc, flags);
+	scoped_irqdesc_get_and_lock(irq, 0)
+		__irq_do_set_handler(scoped_irqdesc, handle, is_chained, name);
 }
 EXPORT_SYMBOL_GPL(__irq_set_handler);
=20
-void
-irq_set_chained_handler_and_data(unsigned int irq, irq_flow_handler_t handle,
-				 void *data)
+void irq_set_chained_handler_and_data(unsigned int irq, irq_flow_handler_t h=
andle,
+				      void *data)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_buslock(irq, &flags, 0);
-
-	if (!desc)
-		return;
-
-	desc->irq_common_data.handler_data =3D data;
-	__irq_do_set_handler(desc, handle, 1, NULL);
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_desc *desc =3D scoped_irqdesc;
=20
-	irq_put_desc_busunlock(desc, flags);
+		desc->irq_common_data.handler_data =3D data;
+		__irq_do_set_handler(desc, handle, 1, NULL);
+	}
 }
 EXPORT_SYMBOL_GPL(irq_set_chained_handler_and_data);
=20
@@ -1050,38 +992,34 @@ EXPORT_SYMBOL_GPL(irq_set_chip_and_handler_name);
=20
 void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long se=
t)
 {
-	unsigned long flags, trigger, tmp;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, 0);
-
-	if (!desc)
-		return;
-
-	/*
-	 * Warn when a driver sets the no autoenable flag on an already
-	 * active interrupt.
-	 */
-	WARN_ON_ONCE(!desc->depth && (set & _IRQ_NOAUTOEN));
-
-	irq_settings_clr_and_set(desc, clr, set);
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		struct irq_desc *desc =3D scoped_irqdesc;
+		unsigned long trigger, tmp;
+		/*
+		 * Warn when a driver sets the no autoenable flag on an already
+		 * active interrupt.
+		 */
+		WARN_ON_ONCE(!desc->depth && (set & _IRQ_NOAUTOEN));
=20
-	trigger =3D irqd_get_trigger_type(&desc->irq_data);
+		irq_settings_clr_and_set(desc, clr, set);
=20
-	irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
-		   IRQD_TRIGGER_MASK | IRQD_LEVEL);
-	if (irq_settings_has_no_balance_set(desc))
-		irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
-	if (irq_settings_is_per_cpu(desc))
-		irqd_set(&desc->irq_data, IRQD_PER_CPU);
-	if (irq_settings_is_level(desc))
-		irqd_set(&desc->irq_data, IRQD_LEVEL);
+		trigger =3D irqd_get_trigger_type(&desc->irq_data);
=20
-	tmp =3D irq_settings_get_trigger_mask(desc);
-	if (tmp !=3D IRQ_TYPE_NONE)
-		trigger =3D tmp;
+		irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
+			   IRQD_TRIGGER_MASK | IRQD_LEVEL);
+		if (irq_settings_has_no_balance_set(desc))
+			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
+		if (irq_settings_is_per_cpu(desc))
+			irqd_set(&desc->irq_data, IRQD_PER_CPU);
+		if (irq_settings_is_level(desc))
+			irqd_set(&desc->irq_data, IRQD_LEVEL);
=20
-	irqd_set(&desc->irq_data, trigger);
+		tmp =3D irq_settings_get_trigger_mask(desc);
+		if (tmp !=3D IRQ_TYPE_NONE)
+			trigger =3D tmp;
=20
-	irq_put_desc_unlock(desc, flags);
+		irqd_set(&desc->irq_data, trigger);
+	}
 }
 EXPORT_SYMBOL_GPL(irq_modify_status);
=20
@@ -1094,25 +1032,21 @@ EXPORT_SYMBOL_GPL(irq_modify_status);
  */
 void irq_cpu_online(void)
 {
-	struct irq_desc *desc;
-	struct irq_chip *chip;
-	unsigned long flags;
 	unsigned int irq;
=20
 	for_each_active_irq(irq) {
-		desc =3D irq_to_desc(irq);
+		struct irq_desc *desc =3D irq_to_desc(irq);
+		struct irq_chip *chip;
+
 		if (!desc)
 			continue;
=20
-		raw_spin_lock_irqsave(&desc->lock, flags);
-
+		guard(raw_spinlock_irqsave)(&desc->lock);
 		chip =3D irq_data_get_irq_chip(&desc->irq_data);
 		if (chip && chip->irq_cpu_online &&
 		    (!(chip->flags & IRQCHIP_ONOFFLINE_ENABLED) ||
 		     !irqd_irq_disabled(&desc->irq_data)))
 			chip->irq_cpu_online(&desc->irq_data);
-
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
 	}
 }
=20
@@ -1124,25 +1058,21 @@ void irq_cpu_online(void)
  */
 void irq_cpu_offline(void)
 {
-	struct irq_desc *desc;
-	struct irq_chip *chip;
-	unsigned long flags;
 	unsigned int irq;
=20
 	for_each_active_irq(irq) {
-		desc =3D irq_to_desc(irq);
+		struct irq_desc *desc =3D irq_to_desc(irq);
+		struct irq_chip *chip;
+
 		if (!desc)
 			continue;
=20
-		raw_spin_lock_irqsave(&desc->lock, flags);
-
+		guard(raw_spinlock_irqsave)(&desc->lock);
 		chip =3D irq_data_get_irq_chip(&desc->irq_data);
 		if (chip && chip->irq_cpu_offline &&
 		    (!(chip->flags & IRQCHIP_ONOFFLINE_ENABLED) ||
 		     !irqd_irq_disabled(&desc->irq_data)))
 			chip->irq_cpu_offline(&desc->irq_data);
-
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
 	}
 }
 #endif
@@ -1151,102 +1081,69 @@ void irq_cpu_offline(void)
=20
 #ifdef CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS
 /**
- *	handle_fasteoi_ack_irq - irq handler for edge hierarchy
- *	stacked on transparent controllers
+ * handle_fasteoi_ack_irq - irq handler for edge hierarchy stacked on
+ *			    transparent controllers
  *
- *	@desc:	the interrupt description structure for this irq
+ * @desc:	the interrupt description structure for this irq
  *
- *	Like handle_fasteoi_irq(), but for use with hierarchy where
- *	the irq_chip also needs to have its ->irq_ack() function
- *	called.
+ * Like handle_fasteoi_irq(), but for use with hierarchy where the irq_chip
+ * also needs to have its ->irq_ack() function called.
  */
 void handle_fasteoi_ack_irq(struct irq_desc *desc)
 {
 	struct irq_chip *chip =3D desc->irq_data.chip;
=20
-	raw_spin_lock(&desc->lock);
-
-	if (!irq_may_run(desc))
-		goto out;
+	guard(raw_spinlock)(&desc->lock);
=20
-	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
+	if (!irq_can_handle_pm(desc)) {
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
+	}
=20
-	/*
-	 * If its disabled or no action available
-	 * then mask it and get out of here:
-	 */
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |=3D IRQS_PENDING;
+	if (unlikely(!irq_can_handle_actions(desc))) {
 		mask_irq(desc);
-		goto out;
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
 	}
=20
 	kstat_incr_irqs_this_cpu(desc);
 	if (desc->istate & IRQS_ONESHOT)
 		mask_irq(desc);
=20
-	/* Start handling the irq */
 	desc->irq_data.chip->irq_ack(&desc->irq_data);
=20
 	handle_irq_event(desc);
=20
 	cond_unmask_eoi_irq(desc, chip);
-
-	raw_spin_unlock(&desc->lock);
-	return;
-out:
-	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
-		chip->irq_eoi(&desc->irq_data);
-	raw_spin_unlock(&desc->lock);
 }
 EXPORT_SYMBOL_GPL(handle_fasteoi_ack_irq);
=20
 /**
- *	handle_fasteoi_mask_irq - irq handler for level hierarchy
- *	stacked on transparent controllers
+ * handle_fasteoi_mask_irq - irq handler for level hierarchy stacked on
+ *			     transparent controllers
  *
- *	@desc:	the interrupt description structure for this irq
+ * @desc:	the interrupt description structure for this irq
  *
- *	Like handle_fasteoi_irq(), but for use with hierarchy where
- *	the irq_chip also needs to have its ->irq_mask_ack() function
- *	called.
+ * Like handle_fasteoi_irq(), but for use with hierarchy where the irq_chip
+ * also needs to have its ->irq_mask_ack() function called.
  */
 void handle_fasteoi_mask_irq(struct irq_desc *desc)
 {
 	struct irq_chip *chip =3D desc->irq_data.chip;
=20
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
 	mask_ack_irq(desc);
=20
-	if (!irq_may_run(desc))
-		goto out;
-
-	desc->istate &=3D ~(IRQS_REPLAY | IRQS_WAITING);
-
-	/*
-	 * If its disabled or no action available
-	 * then mask it and get out of here:
-	 */
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |=3D IRQS_PENDING;
-		mask_irq(desc);
-		goto out;
+	if (!irq_can_handle(desc)) {
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
 	}
=20
 	kstat_incr_irqs_this_cpu(desc);
-	if (desc->istate & IRQS_ONESHOT)
-		mask_irq(desc);
=20
 	handle_irq_event(desc);
=20
 	cond_unmask_eoi_irq(desc, chip);
-
-	raw_spin_unlock(&desc->lock);
-	return;
-out:
-	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
-		chip->irq_eoi(&desc->irq_data);
-	raw_spin_unlock(&desc->lock);
 }
 EXPORT_SYMBOL_GPL(handle_fasteoi_mask_irq);
=20
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index 15a7654eff68..f07529ae4895 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -177,9 +177,8 @@ void irq_migrate_all_off_this_cpu(void)
 		bool affinity_broken;
=20
 		desc =3D irq_to_desc(irq);
-		raw_spin_lock(&desc->lock);
-		affinity_broken =3D migrate_one_irq(desc);
-		raw_spin_unlock(&desc->lock);
+		scoped_guard(raw_spinlock, &desc->lock)
+			affinity_broken =3D migrate_one_irq(desc);
=20
 		if (affinity_broken) {
 			pr_debug_ratelimited("IRQ %u: no longer affine to CPU%u\n",
@@ -219,7 +218,7 @@ static void irq_restore_affinity_of_irq(struct irq_desc *=
desc, unsigned int cpu)
 		return;
=20
 	if (irqd_is_managed_and_shutdown(data))
-		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
+		irq_startup_managed(desc);
=20
 	/*
 	 * If the interrupt can only be directed to a single target
@@ -244,9 +243,8 @@ int irq_affinity_online_cpu(unsigned int cpu)
 	irq_lock_sparse();
 	for_each_active_irq(irq) {
 		desc =3D irq_to_desc(irq);
-		raw_spin_lock_irq(&desc->lock);
-		irq_restore_affinity_of_irq(desc, cpu);
-		raw_spin_unlock_irq(&desc->lock);
+		scoped_guard(raw_spinlock_irq, &desc->lock)
+			irq_restore_affinity_of_irq(desc, cpu);
 	}
 	irq_unlock_sparse();
=20
diff --git a/kernel/irq/debugfs.c b/kernel/irq/debugfs.c
index ca142b9a4db3..3527defd2890 100644
--- a/kernel/irq/debugfs.c
+++ b/kernel/irq/debugfs.c
@@ -160,7 +160,7 @@ static int irq_debug_show(struct seq_file *m, void *p)
 	struct irq_desc *desc =3D m->private;
 	struct irq_data *data;
=20
-	raw_spin_lock_irq(&desc->lock);
+	guard(raw_spinlock_irq)(&desc->lock);
 	data =3D irq_desc_get_irq_data(desc);
 	seq_printf(m, "handler:  %ps\n", desc->handle_irq);
 	seq_printf(m, "device:   %s\n", desc->dev_name);
@@ -178,7 +178,6 @@ static int irq_debug_show(struct seq_file *m, void *p)
 	seq_printf(m, "node:     %d\n", irq_data_get_node(data));
 	irq_debug_show_masks(m, desc);
 	irq_debug_show_data(m, data, 0);
-	raw_spin_unlock_irq(&desc->lock);
 	return 0;
 }
=20
@@ -226,12 +225,12 @@ void irq_debugfs_copy_devname(int irq, struct device *d=
ev)
=20
 void irq_add_debugfs_entry(unsigned int irq, struct irq_desc *desc)
 {
-	char name [10];
+	char name [12];
=20
 	if (!irq_dir || !desc || desc->debugfs_file)
 		return;
=20
-	sprintf(name, "%d", irq);
+	sprintf(name, "%u", irq);
 	desc->debugfs_file =3D debugfs_create_file(name, 0644, irq_dir, desc,
 						 &dfs_irq_ops);
 }
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index b0290849c395..aebfe225c9a6 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -87,6 +87,7 @@ extern void __enable_irq(struct irq_desc *desc);
 extern int irq_activate(struct irq_desc *desc);
 extern int irq_activate_and_startup(struct irq_desc *desc, bool resend);
 extern int irq_startup(struct irq_desc *desc, bool resend, bool force);
+extern void irq_startup_managed(struct irq_desc *desc);
=20
 extern void irq_shutdown(struct irq_desc *desc);
 extern void irq_shutdown_and_deactivate(struct irq_desc *desc);
@@ -141,6 +142,10 @@ extern int irq_setup_affinity(struct irq_desc *desc);
 static inline int irq_setup_affinity(struct irq_desc *desc) { return 0; }
 #endif
=20
+
+#define for_each_action_of_desc(desc, act)			\
+	for (act =3D desc->action; act; act =3D act->next)
+
 /* Inline functions for support of irq chips on slow busses */
 static inline void chip_bus_lock(struct irq_desc *desc)
 {
@@ -160,38 +165,33 @@ static inline void chip_bus_sync_unlock(struct irq_desc=
 *desc)
 #define IRQ_GET_DESC_CHECK_GLOBAL	(_IRQ_DESC_CHECK)
 #define IRQ_GET_DESC_CHECK_PERCPU	(_IRQ_DESC_CHECK | _IRQ_DESC_PERCPU)
=20
-#define for_each_action_of_desc(desc, act)			\
-	for (act =3D desc->action; act; act =3D act->next)
-
-struct irq_desc *
-__irq_get_desc_lock(unsigned int irq, unsigned long *flags, bool bus,
-		    unsigned int check);
+struct irq_desc *__irq_get_desc_lock(unsigned int irq, unsigned long *flags,=
 bool bus,
+				     unsigned int check);
 void __irq_put_desc_unlock(struct irq_desc *desc, unsigned long flags, bool =
bus);
=20
-static inline struct irq_desc *
-irq_get_desc_buslock(unsigned int irq, unsigned long *flags, unsigned int ch=
eck)
-{
-	return __irq_get_desc_lock(irq, flags, true, check);
-}
+__DEFINE_CLASS_IS_CONDITIONAL(irqdesc_lock, true);
+__DEFINE_UNLOCK_GUARD(irqdesc_lock, struct irq_desc,
+		      __irq_put_desc_unlock(_T->lock, _T->flags, _T->bus),
+		      unsigned long flags; bool bus);
=20
-static inline void
-irq_put_desc_busunlock(struct irq_desc *desc, unsigned long flags)
+static inline class_irqdesc_lock_t class_irqdesc_lock_constructor(unsigned i=
nt irq, bool bus,
+								  unsigned int check)
 {
-	__irq_put_desc_unlock(desc, flags, true);
-}
+	class_irqdesc_lock_t _t =3D { .bus =3D bus, };
=20
-static inline struct irq_desc *
-irq_get_desc_lock(unsigned int irq, unsigned long *flags, unsigned int check)
-{
-	return __irq_get_desc_lock(irq, flags, false, check);
-}
+	_t.lock =3D __irq_get_desc_lock(irq, &_t.flags, bus, check);
=20
-static inline void
-irq_put_desc_unlock(struct irq_desc *desc, unsigned long flags)
-{
-	__irq_put_desc_unlock(desc, flags, false);
+	return _t;
 }
=20
+#define scoped_irqdesc_get_and_lock(_irq, _check)		\
+	scoped_guard(irqdesc_lock, _irq, false, _check)
+
+#define scoped_irqdesc_get_and_buslock(_irq, _check)		\
+	scoped_guard(irqdesc_lock, _irq, true, _check)
+
+#define scoped_irqdesc		((struct irq_desc *)(__guard_ptr(irqdesc_lock)(&scop=
e)))
+
 #define __irqd_to_state(d) ACCESS_PRIVATE((d)->common, state_use_accessors)
=20
 static inline unsigned int irqd_get(struct irq_data *d)
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 4258cd6bd3b4..b64c57b44c20 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -246,8 +246,7 @@ static struct kobject *irq_kobj_base;
 #define IRQ_ATTR_RO(_name) \
 static struct kobj_attribute _name##_attr =3D __ATTR_RO(_name)
=20
-static ssize_t per_cpu_count_show(struct kobject *kobj,
-				  struct kobj_attribute *attr, char *buf)
+static ssize_t per_cpu_count_show(struct kobject *kobj, struct kobj_attribut=
e *attr, char *buf)
 {
 	struct irq_desc *desc =3D container_of(kobj, struct irq_desc, kobj);
 	ssize_t ret =3D 0;
@@ -257,112 +256,83 @@ static ssize_t per_cpu_count_show(struct kobject *kobj,
 	for_each_possible_cpu(cpu) {
 		unsigned int c =3D irq_desc_kstat_cpu(desc, cpu);
=20
-		ret +=3D scnprintf(buf + ret, PAGE_SIZE - ret, "%s%u", p, c);
+		ret +=3D sysfs_emit_at(buf, ret, "%s%u", p, c);
 		p =3D ",";
 	}
=20
-	ret +=3D scnprintf(buf + ret, PAGE_SIZE - ret, "\n");
+	ret +=3D sysfs_emit_at(buf, ret, "\n");
 	return ret;
 }
 IRQ_ATTR_RO(per_cpu_count);
=20
-static ssize_t chip_name_show(struct kobject *kobj,
-			      struct kobj_attribute *attr, char *buf)
+static ssize_t chip_name_show(struct kobject *kobj, struct kobj_attribute *a=
ttr, char *buf)
 {
 	struct irq_desc *desc =3D container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret =3D 0;
-
-	raw_spin_lock_irq(&desc->lock);
-	if (desc->irq_data.chip && desc->irq_data.chip->name) {
-		ret =3D scnprintf(buf, PAGE_SIZE, "%s\n",
-				desc->irq_data.chip->name);
-	}
-	raw_spin_unlock_irq(&desc->lock);
=20
-	return ret;
+	guard(raw_spinlock_irq)(&desc->lock);
+	if (desc->irq_data.chip && desc->irq_data.chip->name)
+		return sysfs_emit(buf, "%s\n", desc->irq_data.chip->name);
+	return 0;
 }
 IRQ_ATTR_RO(chip_name);
=20
-static ssize_t hwirq_show(struct kobject *kobj,
-			  struct kobj_attribute *attr, char *buf)
+static ssize_t hwirq_show(struct kobject *kobj, struct kobj_attribute *attr,=
 char *buf)
 {
 	struct irq_desc *desc =3D container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret =3D 0;
=20
-	raw_spin_lock_irq(&desc->lock);
+	guard(raw_spinlock_irq)(&desc->lock);
 	if (desc->irq_data.domain)
-		ret =3D sprintf(buf, "%lu\n", desc->irq_data.hwirq);
-	raw_spin_unlock_irq(&desc->lock);
-
-	return ret;
+		return sysfs_emit(buf, "%lu\n", desc->irq_data.hwirq);
+	return 0;
 }
 IRQ_ATTR_RO(hwirq);
=20
-static ssize_t type_show(struct kobject *kobj,
-			 struct kobj_attribute *attr, char *buf)
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, =
char *buf)
 {
 	struct irq_desc *desc =3D container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret =3D 0;
=20
-	raw_spin_lock_irq(&desc->lock);
-	ret =3D sprintf(buf, "%s\n",
-		      irqd_is_level_type(&desc->irq_data) ? "level" : "edge");
-	raw_spin_unlock_irq(&desc->lock);
-
-	return ret;
+	guard(raw_spinlock_irq)(&desc->lock);
+	return sysfs_emit(buf, "%s\n", irqd_is_level_type(&desc->irq_data) ? "level=
" : "edge");
=20
 }
 IRQ_ATTR_RO(type);
=20
-static ssize_t wakeup_show(struct kobject *kobj,
-			   struct kobj_attribute *attr, char *buf)
+static ssize_t wakeup_show(struct kobject *kobj, struct kobj_attribute *attr=
, char *buf)
 {
 	struct irq_desc *desc =3D container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret =3D 0;
-
-	raw_spin_lock_irq(&desc->lock);
-	ret =3D sprintf(buf, "%s\n", str_enabled_disabled(irqd_is_wakeup_set(&desc-=
>irq_data)));
-	raw_spin_unlock_irq(&desc->lock);
-
-	return ret;
=20
+	guard(raw_spinlock_irq)(&desc->lock);
+	return sysfs_emit(buf, "%s\n", str_enabled_disabled(irqd_is_wakeup_set(&des=
c->irq_data)));
 }
 IRQ_ATTR_RO(wakeup);
=20
-static ssize_t name_show(struct kobject *kobj,
-			 struct kobj_attribute *attr, char *buf)
+static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr, =
char *buf)
 {
 	struct irq_desc *desc =3D container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret =3D 0;
=20
-	raw_spin_lock_irq(&desc->lock);
+	guard(raw_spinlock_irq)(&desc->lock);
 	if (desc->name)
-		ret =3D scnprintf(buf, PAGE_SIZE, "%s\n", desc->name);
-	raw_spin_unlock_irq(&desc->lock);
-
-	return ret;
+		return sysfs_emit(buf, "%s\n", desc->name);
+	return 0;
 }
 IRQ_ATTR_RO(name);
=20
-static ssize_t actions_show(struct kobject *kobj,
-			    struct kobj_attribute *attr, char *buf)
+static ssize_t actions_show(struct kobject *kobj, struct kobj_attribute *att=
r, char *buf)
 {
 	struct irq_desc *desc =3D container_of(kobj, struct irq_desc, kobj);
 	struct irqaction *action;
 	ssize_t ret =3D 0;
 	char *p =3D "";
=20
-	raw_spin_lock_irq(&desc->lock);
-	for_each_action_of_desc(desc, action) {
-		ret +=3D scnprintf(buf + ret, PAGE_SIZE - ret, "%s%s",
-				 p, action->name);
-		p =3D ",";
+	scoped_guard(raw_spinlock_irq, &desc->lock) {
+		for_each_action_of_desc(desc, action) {
+			ret +=3D sysfs_emit_at(buf, ret, "%s%s", p, action->name);
+			p =3D ",";
+		}
 	}
-	raw_spin_unlock_irq(&desc->lock);
=20
 	if (ret)
-		ret +=3D scnprintf(buf + ret, PAGE_SIZE - ret, "\n");
-
+		ret +=3D sysfs_emit_at(buf, ret, "\n");
 	return ret;
 }
 IRQ_ATTR_RO(actions);
@@ -418,19 +388,14 @@ static int __init irq_sysfs_init(void)
 	int irq;
=20
 	/* Prevent concurrent irq alloc/free */
-	irq_lock_sparse();
-
+	guard(mutex)(&sparse_irq_lock);
 	irq_kobj_base =3D kobject_create_and_add("irq", kernel_kobj);
-	if (!irq_kobj_base) {
-		irq_unlock_sparse();
+	if (!irq_kobj_base)
 		return -ENOMEM;
-	}
=20
 	/* Add the already allocated interrupts */
 	for_each_irq_desc(irq, desc)
 		irq_sysfs_add(irq, desc);
-	irq_unlock_sparse();
-
 	return 0;
 }
 postcore_initcall(irq_sysfs_init);
@@ -573,12 +538,12 @@ static int alloc_descs(unsigned int start, unsigned int=
 cnt, int node,
 	return -ENOMEM;
 }
=20
-static int irq_expand_nr_irqs(unsigned int nr)
+static bool irq_expand_nr_irqs(unsigned int nr)
 {
 	if (nr > MAX_SPARSE_IRQS)
-		return -ENOMEM;
+		return false;
 	nr_irqs =3D nr;
-	return 0;
+	return true;
 }
=20
 int __init early_irq_init(void)
@@ -656,11 +621,9 @@ EXPORT_SYMBOL(irq_to_desc);
 static void free_desc(unsigned int irq)
 {
 	struct irq_desc *desc =3D irq_to_desc(irq);
-	unsigned long flags;
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	desc_set_defaults(irq, desc, irq_desc_get_node(desc), NULL, NULL);
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &desc->lock)
+		desc_set_defaults(irq, desc, irq_desc_get_node(desc), NULL, NULL);
 	delete_irq_desc(irq);
 }
=20
@@ -679,16 +642,15 @@ static inline int alloc_descs(unsigned int start, unsig=
ned int cnt, int node,
 	return start;
 }
=20
-static int irq_expand_nr_irqs(unsigned int nr)
+static inline bool irq_expand_nr_irqs(unsigned int nr)
 {
-	return -ENOMEM;
+	return false;
 }
=20
 void irq_mark_irq(unsigned int irq)
 {
-	mutex_lock(&sparse_irq_lock);
+	guard(mutex)(&sparse_irq_lock);
 	irq_insert_desc(irq, irq_desc + irq);
-	mutex_unlock(&sparse_irq_lock);
 }
=20
 #ifdef CONFIG_GENERIC_IRQ_LEGACY
@@ -827,11 +789,9 @@ void irq_free_descs(unsigned int from, unsigned int cnt)
 	if (from >=3D nr_irqs || (from + cnt) > nr_irqs)
 		return;
=20
-	mutex_lock(&sparse_irq_lock);
+	guard(mutex)(&sparse_irq_lock);
 	for (i =3D 0; i < cnt; i++)
 		free_desc(from + i);
-
-	mutex_unlock(&sparse_irq_lock);
 }
 EXPORT_SYMBOL_GPL(irq_free_descs);
=20
@@ -848,11 +808,10 @@ EXPORT_SYMBOL_GPL(irq_free_descs);
  *
  * Returns the first irq number or error code
  */
-int __ref
-__irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,
-		  struct module *owner, const struct irq_affinity_desc *affinity)
+int __ref __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, in=
t node,
+			    struct module *owner, const struct irq_affinity_desc *affinity)
 {
-	int start, ret;
+	int start;
=20
 	if (!cnt)
 		return -EINVAL;
@@ -870,22 +829,17 @@ __irq_alloc_descs(int irq, unsigned int from, unsigned =
int cnt, int node,
 		from =3D arch_dynirq_lower_bound(from);
 	}
=20
-	mutex_lock(&sparse_irq_lock);
+	guard(mutex)(&sparse_irq_lock);
=20
 	start =3D irq_find_free_area(from, cnt);
-	ret =3D -EEXIST;
 	if (irq >=3D0 && start !=3D irq)
-		goto unlock;
+		return -EEXIST;
=20
 	if (start + cnt > nr_irqs) {
-		ret =3D irq_expand_nr_irqs(start + cnt);
-		if (ret)
-			goto unlock;
+		if (!irq_expand_nr_irqs(start + cnt))
+			return -ENOMEM;
 	}
-	ret =3D alloc_descs(start, cnt, node, affinity, owner);
-unlock:
-	mutex_unlock(&sparse_irq_lock);
-	return ret;
+	return alloc_descs(start, cnt, node, affinity, owner);
 }
 EXPORT_SYMBOL_GPL(__irq_alloc_descs);
=20
@@ -900,27 +854,27 @@ unsigned int irq_get_next_irq(unsigned int offset)
 	return irq_find_at_or_after(offset);
 }
=20
-struct irq_desc *
-__irq_get_desc_lock(unsigned int irq, unsigned long *flags, bool bus,
-		    unsigned int check)
+struct irq_desc *__irq_get_desc_lock(unsigned int irq, unsigned long *flags,=
 bool bus,
+				     unsigned int check)
 {
-	struct irq_desc *desc =3D irq_to_desc(irq);
+	struct irq_desc *desc;
=20
-	if (desc) {
-		if (check & _IRQ_DESC_CHECK) {
-			if ((check & _IRQ_DESC_PERCPU) &&
-			    !irq_settings_is_per_cpu_devid(desc))
-				return NULL;
-
-			if (!(check & _IRQ_DESC_PERCPU) &&
-			    irq_settings_is_per_cpu_devid(desc))
-				return NULL;
-		}
+	desc =3D irq_to_desc(irq);
+	if (!desc)
+		return NULL;
+
+	if (check & _IRQ_DESC_CHECK) {
+		if ((check & _IRQ_DESC_PERCPU) && !irq_settings_is_per_cpu_devid(desc))
+			return NULL;
=20
-		if (bus)
-			chip_bus_lock(desc);
-		raw_spin_lock_irqsave(&desc->lock, *flags);
+		if (!(check & _IRQ_DESC_PERCPU) && irq_settings_is_per_cpu_devid(desc))
+			return NULL;
 	}
+
+	if (bus)
+		chip_bus_lock(desc);
+	raw_spin_lock_irqsave(&desc->lock, *flags);
+
 	return desc;
 }
=20
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 9d5c8651492d..b294c3ff73b6 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1132,6 +1132,31 @@ int irq_domain_xlate_twocell(struct irq_domain *d, str=
uct device_node *ctrlr,
 }
 EXPORT_SYMBOL_GPL(irq_domain_xlate_twocell);
=20
+/**
+ * irq_domain_xlate_twothreecell() - Generic xlate for direct two or three c=
ell bindings
+ * @d:		Interrupt domain involved in the translation
+ * @ctrlr:	The device tree node for the device whose interrupt is translated
+ * @intspec:	The interrupt specifier data from the device tree
+ * @intsize:	The number of entries in @intspec
+ * @out_hwirq:	Pointer to storage for the hardware interrupt number
+ * @out_type:	Pointer to storage for the interrupt type
+ *
+ * Device Tree interrupt specifier translation function for two or three
+ * cell bindings, where the cell values map directly to the hardware
+ * interrupt number and the type specifier.
+ */
+int irq_domain_xlate_twothreecell(struct irq_domain *d, struct device_node *=
ctrlr,
+				  const u32 *intspec, unsigned int intsize,
+				  irq_hw_number_t *out_hwirq, unsigned int *out_type)
+{
+	struct irq_fwspec fwspec;
+
+	of_phandle_args_to_fwspec(ctrlr, intspec, intsize, &fwspec);
+
+	return irq_domain_translate_twothreecell(d, &fwspec, out_hwirq, out_type);
+}
+EXPORT_SYMBOL_GPL(irq_domain_xlate_twothreecell);
+
 /**
  * irq_domain_xlate_onetwocell() - Generic xlate for one or two cell bindings
  * @d:		Interrupt domain involved in the translation
@@ -1216,6 +1241,37 @@ int irq_domain_translate_twocell(struct irq_domain *d,
 }
 EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
=20
+/**
+ * irq_domain_translate_twothreecell() - Generic translate for direct two or=
 three cell
+ * bindings
+ * @d:		Interrupt domain involved in the translation
+ * @fwspec:	The firmware interrupt specifier to translate
+ * @out_hwirq:	Pointer to storage for the hardware interrupt number
+ * @out_type:	Pointer to storage for the interrupt type
+ *
+ * Firmware interrupt specifier translation function for two or three cell
+ * specifications, where the parameter values map directly to the hardware
+ * interrupt number and the type specifier.
+ */
+int irq_domain_translate_twothreecell(struct irq_domain *d, struct irq_fwspe=
c *fwspec,
+				      unsigned long *out_hwirq, unsigned int *out_type)
+{
+	if (fwspec->param_count =3D=3D 2) {
+		*out_hwirq =3D fwspec->param[0];
+		*out_type =3D fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	if (fwspec->param_count =3D=3D 3) {
+		*out_hwirq =3D fwspec->param[1];
+		*out_type =3D fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(irq_domain_translate_twothreecell);
+
 int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
 			   int node, const struct irq_affinity_desc *affinity)
 {
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 753eef8e041c..c94837382037 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -43,8 +43,6 @@ static void __synchronize_hardirq(struct irq_desc *desc, bo=
ol sync_chip)
 	bool inprogress;
=20
 	do {
-		unsigned long flags;
-
 		/*
 		 * Wait until we're out of the critical section.  This might
 		 * give the wrong answer due to the lack of memory barriers.
@@ -53,7 +51,7 @@ static void __synchronize_hardirq(struct irq_desc *desc, bo=
ol sync_chip)
 			cpu_relax();
=20
 		/* Ok, that indicated we're done: double-check carefully. */
-		raw_spin_lock_irqsave(&desc->lock, flags);
+		guard(raw_spinlock_irqsave)(&desc->lock);
 		inprogress =3D irqd_irq_inprogress(&desc->irq_data);
=20
 		/*
@@ -69,33 +67,30 @@ static void __synchronize_hardirq(struct irq_desc *desc, =
bool sync_chip)
 			__irq_get_irqchip_state(irqd, IRQCHIP_STATE_ACTIVE,
 						&inprogress);
 		}
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
-
 		/* Oops, that failed? */
 	} while (inprogress);
 }
=20
 /**
- *	synchronize_hardirq - wait for pending hard IRQ handlers (on other CPUs)
- *	@irq: interrupt number to wait for
+ * synchronize_hardirq - wait for pending hard IRQ handlers (on other CPUs)
+ * @irq: interrupt number to wait for
  *
- *	This function waits for any pending hard IRQ handlers for this
- *	interrupt to complete before returning. If you use this
- *	function while holding a resource the IRQ handler may need you
- *	will deadlock. It does not take associated threaded handlers
- *	into account.
+ * This function waits for any pending hard IRQ handlers for this interrupt
+ * to complete before returning. If you use this function while holding a
+ * resource the IRQ handler may need you will deadlock. It does not take
+ * associated threaded handlers into account.
  *
- *	Do not use this for shutdown scenarios where you must be sure
- *	that all parts (hardirq and threaded handler) have completed.
+ * Do not use this for shutdown scenarios where you must be sure that all
+ * parts (hardirq and threaded handler) have completed.
  *
- *	Returns: false if a threaded handler is active.
+ * Returns: false if a threaded handler is active.
  *
- *	This function may be called - with care - from IRQ context.
+ * This function may be called - with care - from IRQ context.
  *
- *	It does not check whether there is an interrupt in flight at the
- *	hardware level, but not serviced yet, as this might deadlock when
- *	called with interrupts disabled and the target CPU of the interrupt
- *	is the current CPU.
+ * It does not check whether there is an interrupt in flight at the
+ * hardware level, but not serviced yet, as this might deadlock when called
+ * with interrupts disabled and the target CPU of the interrupt is the
+ * current CPU.
  */
 bool synchronize_hardirq(unsigned int irq)
 {
@@ -121,19 +116,19 @@ static void __synchronize_irq(struct irq_desc *desc)
 }
=20
 /**
- *	synchronize_irq - wait for pending IRQ handlers (on other CPUs)
- *	@irq: interrupt number to wait for
+ * synchronize_irq - wait for pending IRQ handlers (on other CPUs)
+ * @irq: interrupt number to wait for
  *
- *	This function waits for any pending IRQ handlers for this interrupt
- *	to complete before returning. If you use this function while
- *	holding a resource the IRQ handler may need you will deadlock.
+ * This function waits for any pending IRQ handlers for this interrupt to
+ * complete before returning. If you use this function while holding a
+ * resource the IRQ handler may need you will deadlock.
  *
- *	Can only be called from preemptible code as it might sleep when
- *	an interrupt thread is associated to @irq.
+ * Can only be called from preemptible code as it might sleep when
+ * an interrupt thread is associated to @irq.
  *
- *	It optionally makes sure (when the irq chip supports that method)
- *	that the interrupt is not pending in any CPU and waiting for
- *	service.
+ * It optionally makes sure (when the irq chip supports that method)
+ * that the interrupt is not pending in any CPU and waiting for
+ * service.
  */
 void synchronize_irq(unsigned int irq)
 {
@@ -156,8 +151,8 @@ static bool __irq_can_set_affinity(struct irq_desc *desc)
 }
=20
 /**
- *	irq_can_set_affinity - Check if the affinity of a given irq can be set
- *	@irq:		Interrupt to check
+ * irq_can_set_affinity - Check if the affinity of a given irq can be set
+ * @irq:	Interrupt to check
  *
  */
 int irq_can_set_affinity(unsigned int irq)
@@ -181,13 +176,13 @@ bool irq_can_set_affinity_usr(unsigned int irq)
 }
=20
 /**
- *	irq_set_thread_affinity - Notify irq threads to adjust affinity
- *	@desc:		irq descriptor which has affinity changed
+ * irq_set_thread_affinity - Notify irq threads to adjust affinity
+ * @desc:	irq descriptor which has affinity changed
  *
- *	We just set IRQTF_AFFINITY and delegate the affinity setting
- *	to the interrupt thread itself. We can not call
- *	set_cpus_allowed_ptr() here as we hold desc->lock and this
- *	code can be called from hard interrupt context.
+ * Just set IRQTF_AFFINITY and delegate the affinity setting to the
+ * interrupt thread itself. We can not call set_cpus_allowed_ptr() here as
+ * we hold desc->lock and this code can be called from hard interrupt
+ * context.
  */
 static void irq_set_thread_affinity(struct irq_desc *desc)
 {
@@ -400,14 +395,8 @@ int irq_set_affinity_locked(struct irq_data *data, const=
 struct cpumask *mask,
  * an interrupt which is already started or which has already been configured
  * as managed will also fail, as these mean invalid init state or double ini=
t.
  */
-int irq_update_affinity_desc(unsigned int irq,
-			     struct irq_affinity_desc *affinity)
+int irq_update_affinity_desc(unsigned int irq, struct irq_affinity_desc *aff=
inity)
 {
-	struct irq_desc *desc;
-	unsigned long flags;
-	bool activated;
-	int ret =3D 0;
-
 	/*
 	 * Supporting this with the reservation scheme used by x86 needs
 	 * some more thought. Fail it for now.
@@ -415,60 +404,50 @@ int irq_update_affinity_desc(unsigned int irq,
 	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
 		return -EOPNOTSUPP;
=20
-	desc =3D irq_get_desc_buslock(irq, &flags, 0);
-	if (!desc)
-		return -EINVAL;
-
-	/* Requires the interrupt to be shut down */
-	if (irqd_is_started(&desc->irq_data)) {
-		ret =3D -EBUSY;
-		goto out_unlock;
-	}
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_desc *desc =3D scoped_irqdesc;
+		bool activated;
=20
-	/* Interrupts which are already managed cannot be modified */
-	if (irqd_affinity_is_managed(&desc->irq_data)) {
-		ret =3D -EBUSY;
-		goto out_unlock;
-	}
-
-	/*
-	 * Deactivate the interrupt. That's required to undo
-	 * anything an earlier activation has established.
-	 */
-	activated =3D irqd_is_activated(&desc->irq_data);
-	if (activated)
-		irq_domain_deactivate_irq(&desc->irq_data);
+		/* Requires the interrupt to be shut down */
+		if (irqd_is_started(&desc->irq_data))
+			return -EBUSY;
=20
-	if (affinity->is_managed) {
-		irqd_set(&desc->irq_data, IRQD_AFFINITY_MANAGED);
-		irqd_set(&desc->irq_data, IRQD_MANAGED_SHUTDOWN);
-	}
+		/* Interrupts which are already managed cannot be modified */
+		if (irqd_affinity_is_managed(&desc->irq_data))
+			return -EBUSY;
+		/*
+		 * Deactivate the interrupt. That's required to undo
+		 * anything an earlier activation has established.
+		 */
+		activated =3D irqd_is_activated(&desc->irq_data);
+		if (activated)
+			irq_domain_deactivate_irq(&desc->irq_data);
=20
-	cpumask_copy(desc->irq_common_data.affinity, &affinity->mask);
+		if (affinity->is_managed) {
+			irqd_set(&desc->irq_data, IRQD_AFFINITY_MANAGED);
+			irqd_set(&desc->irq_data, IRQD_MANAGED_SHUTDOWN);
+		}
=20
-	/* Restore the activation state */
-	if (activated)
-		irq_domain_activate_irq(&desc->irq_data, false);
+		cpumask_copy(desc->irq_common_data.affinity, &affinity->mask);
=20
-out_unlock:
-	irq_put_desc_busunlock(desc, flags);
-	return ret;
+		/* Restore the activation state */
+		if (activated)
+			irq_domain_activate_irq(&desc->irq_data, false);
+		return 0;
+	}
+	return -EINVAL;
 }
=20
 static int __irq_set_affinity(unsigned int irq, const struct cpumask *mask,
 			      bool force)
 {
 	struct irq_desc *desc =3D irq_to_desc(irq);
-	unsigned long flags;
-	int ret;
=20
 	if (!desc)
 		return -EINVAL;
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	ret =3D irq_set_affinity_locked(irq_desc_get_irq_data(desc), mask, force);
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-	return ret;
+	guard(raw_spinlock_irqsave)(&desc->lock);
+	return irq_set_affinity_locked(irq_desc_get_irq_data(desc), mask, force);
 }
=20
 /**
@@ -501,39 +480,36 @@ int irq_force_affinity(unsigned int irq, const struct c=
pumask *cpumask)
 }
 EXPORT_SYMBOL_GPL(irq_force_affinity);
=20
-int __irq_apply_affinity_hint(unsigned int irq, const struct cpumask *m,
-			      bool setaffinity)
+int __irq_apply_affinity_hint(unsigned int irq, const struct cpumask *m, boo=
l setaffinity)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, IRQ_GET_DESC_CHECK=
_GLOBAL);
+	int ret =3D -EINVAL;
=20
-	if (!desc)
-		return -EINVAL;
-	desc->affinity_hint =3D m;
-	irq_put_desc_unlock(desc, flags);
-	if (m && setaffinity)
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		scoped_irqdesc->affinity_hint =3D m;
+		ret =3D 0;
+	}
+
+	if (!ret && m && setaffinity)
 		__irq_set_affinity(irq, m, false);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(__irq_apply_affinity_hint);
=20
 static void irq_affinity_notify(struct work_struct *work)
 {
-	struct irq_affinity_notify *notify =3D
-		container_of(work, struct irq_affinity_notify, work);
+	struct irq_affinity_notify *notify =3D container_of(work, struct irq_affini=
ty_notify, work);
 	struct irq_desc *desc =3D irq_to_desc(notify->irq);
 	cpumask_var_t cpumask;
-	unsigned long flags;
=20
 	if (!desc || !alloc_cpumask_var(&cpumask, GFP_KERNEL))
 		goto out;
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	if (irq_move_pending(&desc->irq_data))
-		irq_get_pending(cpumask, desc);
-	else
-		cpumask_copy(cpumask, desc->irq_common_data.affinity);
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
+		if (irq_move_pending(&desc->irq_data))
+			irq_get_pending(cpumask, desc);
+		else
+			cpumask_copy(cpumask, desc->irq_common_data.affinity);
+	}
=20
 	notify->notify(notify, cpumask);
=20
@@ -543,22 +519,20 @@ static void irq_affinity_notify(struct work_struct *wor=
k)
 }
=20
 /**
- *	irq_set_affinity_notifier - control notification of IRQ affinity changes
- *	@irq:		Interrupt for which to enable/disable notification
- *	@notify:	Context for notification, or %NULL to disable
- *			notification.  Function pointers must be initialised;
- *			the other fields will be initialised by this function.
- *
- *	Must be called in process context.  Notification may only be enabled
- *	after the IRQ is allocated and must be disabled before the IRQ is
- *	freed using free_irq().
+ * irq_set_affinity_notifier - control notification of IRQ affinity changes
+ * @irq:	Interrupt for which to enable/disable notification
+ * @notify:	Context for notification, or %NULL to disable
+ *		notification.  Function pointers must be initialised;
+ *		the other fields will be initialised by this function.
+ *
+ * Must be called in process context.  Notification may only be enabled
+ * after the IRQ is allocated and must be disabled before the IRQ is freed
+ * using free_irq().
  */
-int
-irq_set_affinity_notifier(unsigned int irq, struct irq_affinity_notify *noti=
fy)
+int irq_set_affinity_notifier(unsigned int irq, struct irq_affinity_notify *=
notify)
 {
 	struct irq_desc *desc =3D irq_to_desc(irq);
 	struct irq_affinity_notify *old_notify;
-	unsigned long flags;
=20
 	/* The release function is promised process context */
 	might_sleep();
@@ -573,10 +547,10 @@ irq_set_affinity_notifier(unsigned int irq, struct irq_=
affinity_notify *notify)
 		INIT_WORK(&notify->work, irq_affinity_notify);
 	}
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	old_notify =3D desc->affinity_notify;
-	desc->affinity_notify =3D notify;
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
+		old_notify =3D desc->affinity_notify;
+		desc->affinity_notify =3D notify;
+	}
=20
 	if (old_notify) {
 		if (cancel_work_sync(&old_notify->work)) {
@@ -597,7 +571,8 @@ EXPORT_SYMBOL_GPL(irq_set_affinity_notifier);
 int irq_setup_affinity(struct irq_desc *desc)
 {
 	struct cpumask *set =3D irq_default_affinity;
-	int ret, node =3D irq_desc_get_node(desc);
+	int node =3D irq_desc_get_node(desc);
+
 	static DEFINE_RAW_SPINLOCK(mask_lock);
 	static struct cpumask mask;
=20
@@ -605,7 +580,7 @@ int irq_setup_affinity(struct irq_desc *desc)
 	if (!__irq_can_set_affinity(desc))
 		return 0;
=20
-	raw_spin_lock(&mask_lock);
+	guard(raw_spinlock)(&mask_lock);
 	/*
 	 * Preserve the managed affinity setting and a userspace affinity
 	 * setup, but make sure that one of the targets is online.
@@ -630,9 +605,7 @@ int irq_setup_affinity(struct irq_desc *desc)
 		if (cpumask_intersects(&mask, nodemask))
 			cpumask_and(&mask, &mask, nodemask);
 	}
-	ret =3D irq_do_set_affinity(&desc->irq_data, &mask, false);
-	raw_spin_unlock(&mask_lock);
-	return ret;
+	return irq_do_set_affinity(&desc->irq_data, &mask, false);
 }
 #else
 /* Wrapper for ALPHA specific affinity selector magic */
@@ -645,44 +618,36 @@ int irq_setup_affinity(struct irq_desc *desc)
=20
=20
 /**
- *	irq_set_vcpu_affinity - Set vcpu affinity for the interrupt
- *	@irq: interrupt number to set affinity
- *	@vcpu_info: vCPU specific data or pointer to a percpu array of vCPU
- *	            specific data for percpu_devid interrupts
- *
- *	This function uses the vCPU specific data to set the vCPU
- *	affinity for an irq. The vCPU specific data is passed from
- *	outside, such as KVM. One example code path is as below:
- *	KVM -> IOMMU -> irq_set_vcpu_affinity().
+ * irq_set_vcpu_affinity - Set vcpu affinity for the interrupt
+ * @irq:	interrupt number to set affinity
+ * @vcpu_info:	vCPU specific data or pointer to a percpu array of vCPU
+ *		specific data for percpu_devid interrupts
+ *
+ * This function uses the vCPU specific data to set the vCPU affinity for
+ * an irq. The vCPU specific data is passed from outside, such as KVM. One
+ * example code path is as below: KVM -> IOMMU -> irq_set_vcpu_affinity().
  */
 int irq_set_vcpu_affinity(unsigned int irq, void *vcpu_info)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, 0);
-	struct irq_data *data;
-	struct irq_chip *chip;
-	int ret =3D -ENOSYS;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		struct irq_desc *desc =3D scoped_irqdesc;
+		struct irq_data *data;
+		struct irq_chip *chip;
=20
-	if (!desc)
-		return -EINVAL;
-
-	data =3D irq_desc_get_irq_data(desc);
-	do {
-		chip =3D irq_data_get_irq_chip(data);
-		if (chip && chip->irq_set_vcpu_affinity)
-			break;
-#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
-		data =3D data->parent_data;
-#else
-		data =3D NULL;
-#endif
-	} while (data);
+		data =3D irq_desc_get_irq_data(desc);
+		do {
+			chip =3D irq_data_get_irq_chip(data);
+			if (chip && chip->irq_set_vcpu_affinity)
+				break;
=20
-	if (data)
-		ret =3D chip->irq_set_vcpu_affinity(data, vcpu_info);
-	irq_put_desc_unlock(desc, flags);
+			data =3D irqd_get_parent_data(data);
+		} while (data);
=20
-	return ret;
+		if (!data)
+			return -ENOSYS;
+		return chip->irq_set_vcpu_affinity(data, vcpu_info);
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(irq_set_vcpu_affinity);
=20
@@ -694,26 +659,23 @@ void __disable_irq(struct irq_desc *desc)
=20
 static int __disable_irq_nosync(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CH=
ECK_GLOBAL);
-
-	if (!desc)
-		return -EINVAL;
-	__disable_irq(desc);
-	irq_put_desc_busunlock(desc, flags);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		__disable_irq(scoped_irqdesc);
+		return 0;
+	}
+	return -EINVAL;
 }
=20
 /**
- *	disable_irq_nosync - disable an irq without waiting
- *	@irq: Interrupt to disable
+ * disable_irq_nosync - disable an irq without waiting
+ * @irq: Interrupt to disable
  *
- *	Disable the selected interrupt line.  Disables and Enables are
- *	nested.
- *	Unlike disable_irq(), this function does not ensure existing
- *	instances of the IRQ handler have completed before returning.
+ * Disable the selected interrupt line.  Disables and Enables are
+ * nested.
+ * Unlike disable_irq(), this function does not ensure existing
+ * instances of the IRQ handler have completed before returning.
  *
- *	This function may be called from IRQ context.
+ * This function may be called from IRQ context.
  */
 void disable_irq_nosync(unsigned int irq)
 {
@@ -722,17 +684,17 @@ void disable_irq_nosync(unsigned int irq)
 EXPORT_SYMBOL(disable_irq_nosync);
=20
 /**
- *	disable_irq - disable an irq and wait for completion
- *	@irq: Interrupt to disable
+ * disable_irq - disable an irq and wait for completion
+ * @irq: Interrupt to disable
+ *
+ * Disable the selected interrupt line.  Enables and Disables are nested.
  *
- *	Disable the selected interrupt line.  Enables and Disables are
- *	nested.
- *	This function waits for any pending IRQ handlers for this interrupt
- *	to complete before returning. If you use this function while
- *	holding a resource the IRQ handler may need you will deadlock.
+ * This function waits for any pending IRQ handlers for this interrupt to
+ * complete before returning. If you use this function while holding a
+ * resource the IRQ handler may need you will deadlock.
  *
- *	Can only be called from preemptible code as it might sleep when
- *	an interrupt thread is associated to @irq.
+ * Can only be called from preemptible code as it might sleep when an
+ * interrupt thread is associated to @irq.
  *
  */
 void disable_irq(unsigned int irq)
@@ -744,40 +706,39 @@ void disable_irq(unsigned int irq)
 EXPORT_SYMBOL(disable_irq);
=20
 /**
- *	disable_hardirq - disables an irq and waits for hardirq completion
- *	@irq: Interrupt to disable
+ * disable_hardirq - disables an irq and waits for hardirq completion
+ * @irq: Interrupt to disable
  *
- *	Disable the selected interrupt line.  Enables and Disables are
- *	nested.
- *	This function waits for any pending hard IRQ handlers for this
- *	interrupt to complete before returning. If you use this function while
- *	holding a resource the hard IRQ handler may need you will deadlock.
+ * Disable the selected interrupt line.  Enables and Disables are nested.
  *
- *	When used to optimistically disable an interrupt from atomic context
- *	the return value must be checked.
+ * This function waits for any pending hard IRQ handlers for this interrupt
+ * to complete before returning. If you use this function while holding a
+ * resource the hard IRQ handler may need you will deadlock.
  *
- *	Returns: false if a threaded handler is active.
+ * When used to optimistically disable an interrupt from atomic context the
+ * return value must be checked.
  *
- *	This function may be called - with care - from IRQ context.
+ * Returns: false if a threaded handler is active.
+ *
+ * This function may be called - with care - from IRQ context.
  */
 bool disable_hardirq(unsigned int irq)
 {
 	if (!__disable_irq_nosync(irq))
 		return synchronize_hardirq(irq);
-
 	return false;
 }
 EXPORT_SYMBOL_GPL(disable_hardirq);
=20
 /**
- *	disable_nmi_nosync - disable an nmi without waiting
- *	@irq: Interrupt to disable
- *
- *	Disable the selected interrupt line. Disables and enables are
- *	nested.
- *	The interrupt to disable must have been requested through request_nmi.
- *	Unlike disable_nmi(), this function does not ensure existing
- *	instances of the IRQ handler have completed before returning.
+ * disable_nmi_nosync - disable an nmi without waiting
+ * @irq: Interrupt to disable
+ *
+ * Disable the selected interrupt line. Disables and enables are nested.
+ *
+ * The interrupt to disable must have been requested through request_nmi.
+ * Unlike disable_nmi(), this function does not ensure existing
+ * instances of the IRQ handler have completed before returning.
  */
 void disable_nmi_nosync(unsigned int irq)
 {
@@ -817,41 +778,34 @@ void __enable_irq(struct irq_desc *desc)
 }
=20
 /**
- *	enable_irq - enable handling of an irq
- *	@irq: Interrupt to enable
+ * enable_irq - enable handling of an irq
+ * @irq: Interrupt to enable
  *
- *	Undoes the effect of one call to disable_irq().  If this
- *	matches the last disable, processing of interrupts on this
- *	IRQ line is re-enabled.
+ * Undoes the effect of one call to disable_irq().  If this matches the
+ * last disable, processing of interrupts on this IRQ line is re-enabled.
  *
- *	This function may be called from IRQ context only when
- *	desc->irq_data.chip->bus_lock and desc->chip->bus_sync_unlock are NULL !
+ * This function may be called from IRQ context only when
+ * desc->irq_data.chip->bus_lock and desc->chip->bus_sync_unlock are NULL !
  */
 void enable_irq(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CH=
ECK_GLOBAL);
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		struct irq_desc *desc =3D scoped_irqdesc;
=20
-	if (!desc)
-		return;
-	if (WARN(!desc->irq_data.chip,
-		 KERN_ERR "enable_irq before setup/request_irq: irq %u\n", irq))
-		goto out;
-
-	__enable_irq(desc);
-out:
-	irq_put_desc_busunlock(desc, flags);
+		if (WARN(!desc->irq_data.chip, "enable_irq before setup/request_irq: irq %=
u\n", irq))
+			return;
+		__enable_irq(desc);
+	}
 }
 EXPORT_SYMBOL(enable_irq);
=20
 /**
- *	enable_nmi - enable handling of an nmi
- *	@irq: Interrupt to enable
+ * enable_nmi - enable handling of an nmi
+ * @irq: Interrupt to enable
  *
- *	The interrupt to enable must have been requested through request_nmi.
- *	Undoes the effect of one call to disable_nmi(). If this
- *	matches the last disable, processing of interrupts on this
- *	IRQ line is re-enabled.
+ * The interrupt to enable must have been requested through request_nmi.
+ * Undoes the effect of one call to disable_nmi(). If this matches the last
+ * disable, processing of interrupts on this IRQ line is re-enabled.
  */
 void enable_nmi(unsigned int irq)
 {
@@ -873,65 +827,59 @@ static int set_irq_wake_real(unsigned int irq, unsigned=
 int on)
 }
=20
 /**
- *	irq_set_irq_wake - control irq power management wakeup
- *	@irq:	interrupt to control
- *	@on:	enable/disable power management wakeup
- *
- *	Enable/disable power management wakeup mode, which is
- *	disabled by default.  Enables and disables must match,
- *	just as they match for non-wakeup mode support.
- *
- *	Wakeup mode lets this IRQ wake the system from sleep
- *	states like "suspend to RAM".
- *
- *	Note: irq enable/disable state is completely orthogonal
- *	to the enable/disable state of irq wake. An irq can be
- *	disabled with disable_irq() and still wake the system as
- *	long as the irq has wake enabled. If this does not hold,
- *	then the underlying irq chip and the related driver need
- *	to be investigated.
+ * irq_set_irq_wake - control irq power management wakeup
+ * @irq:	interrupt to control
+ * @on:	enable/disable power management wakeup
+ *
+ * Enable/disable power management wakeup mode, which is disabled by
+ * default.  Enables and disables must match, just as they match for
+ * non-wakeup mode support.
+ *
+ * Wakeup mode lets this IRQ wake the system from sleep states like
+ * "suspend to RAM".
+ *
+ * Note: irq enable/disable state is completely orthogonal to the
+ * enable/disable state of irq wake. An irq can be disabled with
+ * disable_irq() and still wake the system as long as the irq has wake
+ * enabled. If this does not hold, then the underlying irq chip and the
+ * related driver need to be investigated.
  */
 int irq_set_irq_wake(unsigned int irq, unsigned int on)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CH=
ECK_GLOBAL);
-	int ret =3D 0;
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		struct irq_desc *desc =3D scoped_irqdesc;
+		int ret =3D 0;
=20
-	if (!desc)
-		return -EINVAL;
-
-	/* Don't use NMIs as wake up interrupts please */
-	if (irq_is_nmi(desc)) {
-		ret =3D -EINVAL;
-		goto out_unlock;
-	}
+		/* Don't use NMIs as wake up interrupts please */
+		if (irq_is_nmi(desc))
+			return -EINVAL;
=20
-	/* wakeup-capable irqs can be shared between drivers that
-	 * don't need to have the same sleep mode behaviors.
-	 */
-	if (on) {
-		if (desc->wake_depth++ =3D=3D 0) {
-			ret =3D set_irq_wake_real(irq, on);
-			if (ret)
-				desc->wake_depth =3D 0;
-			else
-				irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
-		}
-	} else {
-		if (desc->wake_depth =3D=3D 0) {
-			WARN(1, "Unbalanced IRQ %d wake disable\n", irq);
-		} else if (--desc->wake_depth =3D=3D 0) {
-			ret =3D set_irq_wake_real(irq, on);
-			if (ret)
-				desc->wake_depth =3D 1;
-			else
-				irqd_clear(&desc->irq_data, IRQD_WAKEUP_STATE);
+		/*
+		 * wakeup-capable irqs can be shared between drivers that
+		 * don't need to have the same sleep mode behaviors.
+		 */
+		if (on) {
+			if (desc->wake_depth++ =3D=3D 0) {
+				ret =3D set_irq_wake_real(irq, on);
+				if (ret)
+					desc->wake_depth =3D 0;
+				else
+					irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
+			}
+		} else {
+			if (desc->wake_depth =3D=3D 0) {
+				WARN(1, "Unbalanced IRQ %d wake disable\n", irq);
+			} else if (--desc->wake_depth =3D=3D 0) {
+				ret =3D set_irq_wake_real(irq, on);
+				if (ret)
+					desc->wake_depth =3D 1;
+				else
+					irqd_clear(&desc->irq_data, IRQD_WAKEUP_STATE);
+			}
 		}
+		return ret;
 	}
-
-out_unlock:
-	irq_put_desc_busunlock(desc, flags);
-	return ret;
+	return -EINVAL;
 }
 EXPORT_SYMBOL(irq_set_irq_wake);
=20
@@ -940,22 +888,17 @@ EXPORT_SYMBOL(irq_set_irq_wake);
  * particular irq has been exclusively allocated or is available
  * for driver use.
  */
-int can_request_irq(unsigned int irq, unsigned long irqflags)
+bool can_request_irq(unsigned int irq, unsigned long irqflags)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, 0);
-	int canrequest =3D 0;
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		struct irq_desc *desc =3D scoped_irqdesc;
=20
-	if (!desc)
-		return 0;
-
-	if (irq_settings_can_request(desc)) {
-		if (!desc->action ||
-		    irqflags & desc->action->flags & IRQF_SHARED)
-			canrequest =3D 1;
+		if (irq_settings_can_request(desc)) {
+			if (!desc->action || irqflags & desc->action->flags & IRQF_SHARED)
+				return true;
+		}
 	}
-	irq_put_desc_unlock(desc, flags);
-	return canrequest;
+	return false;
 }
=20
 int __irq_set_trigger(struct irq_desc *desc, unsigned long flags)
@@ -1016,16 +959,11 @@ int __irq_set_trigger(struct irq_desc *desc, unsigned =
long flags)
 #ifdef CONFIG_HARDIRQS_SW_RESEND
 int irq_set_parent(int irq, int parent_irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, 0);
-
-	if (!desc)
-		return -EINVAL;
-
-	desc->parent_irq =3D parent_irq;
-
-	irq_put_desc_unlock(desc, flags);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		scoped_irqdesc->parent_irq =3D parent_irq;
+		return 0;
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(irq_set_parent);
 #endif
@@ -1079,19 +1017,19 @@ static void irq_thread_check_affinity(struct irq_desc=
 *desc, struct irqaction *a
 		return;
 	}
=20
-	raw_spin_lock_irq(&desc->lock);
-	/*
-	 * This code is triggered unconditionally. Check the affinity
-	 * mask pointer. For CPU_MASK_OFFSTACK=3Dn this is optimized out.
-	 */
-	if (cpumask_available(desc->irq_common_data.affinity)) {
-		const struct cpumask *m;
+	scoped_guard(raw_spinlock_irq, &desc->lock) {
+		/*
+		 * This code is triggered unconditionally. Check the affinity
+		 * mask pointer. For CPU_MASK_OFFSTACK=3Dn this is optimized out.
+		 */
+		if (cpumask_available(desc->irq_common_data.affinity)) {
+			const struct cpumask *m;
=20
-		m =3D irq_data_get_effective_affinity_mask(&desc->irq_data);
-		cpumask_copy(mask, m);
-		valid =3D true;
+			m =3D irq_data_get_effective_affinity_mask(&desc->irq_data);
+			cpumask_copy(mask, m);
+			valid =3D true;
+		}
 	}
-	raw_spin_unlock_irq(&desc->lock);
=20
 	if (valid)
 		set_cpus_allowed_ptr(current, mask);
@@ -1259,9 +1197,8 @@ static void irq_wake_secondary(struct irq_desc *desc, s=
truct irqaction *action)
 	if (WARN_ON_ONCE(!secondary))
 		return;
=20
-	raw_spin_lock_irq(&desc->lock);
+	guard(raw_spinlock_irq)(&desc->lock);
 	__irq_wake_thread(desc, secondary);
-	raw_spin_unlock_irq(&desc->lock);
 }
=20
 /*
@@ -1334,21 +1271,19 @@ static int irq_thread(void *data)
 }
=20
 /**
- *	irq_wake_thread - wake the irq thread for the action identified by dev_id
- *	@irq:		Interrupt line
- *	@dev_id:	Device identity for which the thread should be woken
- *
+ * irq_wake_thread - wake the irq thread for the action identified by dev_id
+ * @irq:	Interrupt line
+ * @dev_id:	Device identity for which the thread should be woken
  */
 void irq_wake_thread(unsigned int irq, void *dev_id)
 {
 	struct irq_desc *desc =3D irq_to_desc(irq);
 	struct irqaction *action;
-	unsigned long flags;
=20
 	if (!desc || WARN_ON(irq_settings_is_per_cpu_devid(desc)))
 		return;
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	guard(raw_spinlock_irqsave)(&desc->lock);
 	for_each_action_of_desc(desc, action) {
 		if (action->dev_id =3D=3D dev_id) {
 			if (action->thread)
@@ -1356,7 +1291,6 @@ void irq_wake_thread(unsigned int irq, void *dev_id)
 			break;
 		}
 	}
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
 }
 EXPORT_SYMBOL_GPL(irq_wake_thread);
=20
@@ -1987,9 +1921,8 @@ static struct irqaction *__free_irq(struct irq_desc *de=
sc, void *dev_id)
 		 * There is no interrupt on the fly anymore. Deactivate it
 		 * completely.
 		 */
-		raw_spin_lock_irqsave(&desc->lock, flags);
-		irq_domain_deactivate_irq(&desc->irq_data);
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
+		scoped_guard(raw_spinlock_irqsave, &desc->lock)
+			irq_domain_deactivate_irq(&desc->irq_data);
=20
 		irq_release_resources(desc);
 		chip_bus_sync_unlock(desc);
@@ -2005,20 +1938,19 @@ static struct irqaction *__free_irq(struct irq_desc *=
desc, void *dev_id)
 }
=20
 /**
- *	free_irq - free an interrupt allocated with request_irq
- *	@irq: Interrupt line to free
- *	@dev_id: Device identity to free
+ * free_irq - free an interrupt allocated with request_irq
+ * @irq:	Interrupt line to free
+ * @dev_id:	Device identity to free
  *
- *	Remove an interrupt handler. The handler is removed and if the
- *	interrupt line is no longer in use by any driver it is disabled.
- *	On a shared IRQ the caller must ensure the interrupt is disabled
- *	on the card it drives before calling this function. The function
- *	does not return until any executing interrupts for this IRQ
- *	have completed.
+ * Remove an interrupt handler. The handler is removed and if the interrupt
+ * line is no longer in use by any driver it is disabled.  On a shared IRQ
+ * the caller must ensure the interrupt is disabled on the card it drives
+ * before calling this function. The function does not return until any
+ * executing interrupts for this IRQ have completed.
  *
- *	This function must not be called from interrupt context.
+ * This function must not be called from interrupt context.
  *
- *	Returns the devname argument passed to request_irq.
+ * Returns the devname argument passed to request_irq.
  */
 const void *free_irq(unsigned int irq, void *dev_id)
 {
@@ -2075,8 +2007,6 @@ static const void *__cleanup_nmi(unsigned int irq, stru=
ct irq_desc *desc)
 const void *free_nmi(unsigned int irq, void *dev_id)
 {
 	struct irq_desc *desc =3D irq_to_desc(irq);
-	unsigned long flags;
-	const void *devname;
=20
 	if (!desc || WARN_ON(!irq_is_nmi(desc)))
 		return NULL;
@@ -2088,53 +2018,46 @@ const void *free_nmi(unsigned int irq, void *dev_id)
 	if (WARN_ON(desc->depth =3D=3D 0))
 		disable_nmi_nosync(irq);
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
-
+	guard(raw_spinlock_irqsave)(&desc->lock);
 	irq_nmi_teardown(desc);
-	devname =3D __cleanup_nmi(irq, desc);
-
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-
-	return devname;
+	return __cleanup_nmi(irq, desc);
 }
=20
 /**
- *	request_threaded_irq - allocate an interrupt line
- *	@irq: Interrupt line to allocate
- *	@handler: Function to be called when the IRQ occurs.
- *		  Primary handler for threaded interrupts.
- *		  If handler is NULL and thread_fn !=3D NULL
- *		  the default primary handler is installed.
- *	@thread_fn: Function called from the irq handler thread
- *		    If NULL, no irq thread is created
- *	@irqflags: Interrupt type flags
- *	@devname: An ascii name for the claiming device
- *	@dev_id: A cookie passed back to the handler function
- *
- *	This call allocates interrupt resources and enables the
- *	interrupt line and IRQ handling. From the point this
- *	call is made your handler function may be invoked. Since
- *	your handler function must clear any interrupt the board
- *	raises, you must take care both to initialise your hardware
- *	and to set up the interrupt handler in the right order.
- *
- *	If you want to set up a threaded irq handler for your device
- *	then you need to supply @handler and @thread_fn. @handler is
- *	still called in hard interrupt context and has to check
- *	whether the interrupt originates from the device. If yes it
- *	needs to disable the interrupt on the device and return
- *	IRQ_WAKE_THREAD which will wake up the handler thread and run
- *	@thread_fn. This split handler design is necessary to support
- *	shared interrupts.
- *
- *	Dev_id must be globally unique. Normally the address of the
- *	device data structure is used as the cookie. Since the handler
- *	receives this value it makes sense to use it.
- *
- *	If your interrupt is shared you must pass a non NULL dev_id
- *	as this is required when freeing the interrupt.
- *
- *	Flags:
+ * request_threaded_irq - allocate an interrupt line
+ * @irq:	Interrupt line to allocate
+ * @handler:	Function to be called when the IRQ occurs.
+ *		Primary handler for threaded interrupts.
+ *		If handler is NULL and thread_fn !=3D NULL
+ *		the default primary handler is installed.
+ * @thread_fn:	Function called from the irq handler thread
+ *		If NULL, no irq thread is created
+ * @irqflags:	Interrupt type flags
+ * @devname:	An ascii name for the claiming device
+ * @dev_id:	A cookie passed back to the handler function
+ *
+ * This call allocates interrupt resources and enables the interrupt line
+ * and IRQ handling. From the point this call is made your handler function
+ * may be invoked. Since your handler function must clear any interrupt the
+ * board raises, you must take care both to initialise your hardware and to
+ * set up the interrupt handler in the right order.
+ *
+ * If you want to set up a threaded irq handler for your device then you
+ * need to supply @handler and @thread_fn. @handler is still called in hard
+ * interrupt context and has to check whether the interrupt originates from
+ * the device. If yes it needs to disable the interrupt on the device and
+ * return IRQ_WAKE_THREAD which will wake up the handler thread and run
+ * @thread_fn. This split handler design is necessary to support shared
+ * interrupts.
+ *
+ * @dev_id must be globally unique. Normally the address of the device data
+ * structure is used as the cookie. Since the handler receives this value
+ * it makes sense to use it.
+ *
+ * If your interrupt is shared you must pass a non NULL dev_id as this is
+ * required when freeing the interrupt.
+ *
+ * Flags:
  *
  *	IRQF_SHARED		Interrupt is shared
  *	IRQF_TRIGGER_*		Specify active edge(s) or level
@@ -2232,21 +2155,20 @@ int request_threaded_irq(unsigned int irq, irq_handle=
r_t handler,
 EXPORT_SYMBOL(request_threaded_irq);
=20
 /**
- *	request_any_context_irq - allocate an interrupt line
- *	@irq: Interrupt line to allocate
- *	@handler: Function to be called when the IRQ occurs.
- *		  Threaded handler for threaded interrupts.
- *	@flags: Interrupt type flags
- *	@name: An ascii name for the claiming device
- *	@dev_id: A cookie passed back to the handler function
- *
- *	This call allocates interrupt resources and enables the
- *	interrupt line and IRQ handling. It selects either a
- *	hardirq or threaded handling method depending on the
- *	context.
- *
- *	On failure, it returns a negative value. On success,
- *	it returns either IRQC_IS_HARDIRQ or IRQC_IS_NESTED.
+ * request_any_context_irq - allocate an interrupt line
+ * @irq:	Interrupt line to allocate
+ * @handler:	Function to be called when the IRQ occurs.
+ *		Threaded handler for threaded interrupts.
+ * @flags:	Interrupt type flags
+ * @name:	An ascii name for the claiming device
+ * @dev_id:	A cookie passed back to the handler function
+ *
+ * This call allocates interrupt resources and enables the interrupt line
+ * and IRQ handling. It selects either a hardirq or threaded handling
+ * method depending on the context.
+ *
+ * Returns: On failure, it returns a negative value. On success, it returns =
either
+ * IRQC_IS_HARDIRQ or IRQC_IS_NESTED.
  */
 int request_any_context_irq(unsigned int irq, irq_handler_t handler,
 			    unsigned long flags, const char *name, void *dev_id)
@@ -2273,37 +2195,35 @@ int request_any_context_irq(unsigned int irq, irq_han=
dler_t handler,
 EXPORT_SYMBOL_GPL(request_any_context_irq);
=20
 /**
- *	request_nmi - allocate an interrupt line for NMI delivery
- *	@irq: Interrupt line to allocate
- *	@handler: Function to be called when the IRQ occurs.
- *		  Threaded handler for threaded interrupts.
- *	@irqflags: Interrupt type flags
- *	@name: An ascii name for the claiming device
- *	@dev_id: A cookie passed back to the handler function
- *
- *	This call allocates interrupt resources and enables the
- *	interrupt line and IRQ handling. It sets up the IRQ line
- *	to be handled as an NMI.
- *
- *	An interrupt line delivering NMIs cannot be shared and IRQ handling
- *	cannot be threaded.
- *
- *	Interrupt lines requested for NMI delivering must produce per cpu
- *	interrupts and have auto enabling setting disabled.
- *
- *	Dev_id must be globally unique. Normally the address of the
- *	device data structure is used as the cookie. Since the handler
- *	receives this value it makes sense to use it.
- *
- *	If the interrupt line cannot be used to deliver NMIs, function
- *	will fail and return a negative value.
+ * request_nmi - allocate an interrupt line for NMI delivery
+ * @irq:	Interrupt line to allocate
+ * @handler:	Function to be called when the IRQ occurs.
+ *		Threaded handler for threaded interrupts.
+ * @irqflags:	Interrupt type flags
+ * @name:	An ascii name for the claiming device
+ * @dev_id:	A cookie passed back to the handler function
+ *
+ * This call allocates interrupt resources and enables the interrupt line
+ * and IRQ handling. It sets up the IRQ line to be handled as an NMI.
+ *
+ * An interrupt line delivering NMIs cannot be shared and IRQ handling
+ * cannot be threaded.
+ *
+ * Interrupt lines requested for NMI delivering must produce per cpu
+ * interrupts and have auto enabling setting disabled.
+ *
+ * @dev_id must be globally unique. Normally the address of the device data
+ * structure is used as the cookie. Since the handler receives this value
+ * it makes sense to use it.
+ *
+ * If the interrupt line cannot be used to deliver NMIs, function will fail
+ * and return a negative value.
  */
 int request_nmi(unsigned int irq, irq_handler_t handler,
 		unsigned long irqflags, const char *name, void *dev_id)
 {
 	struct irqaction *action;
 	struct irq_desc *desc;
-	unsigned long flags;
 	int retval;
=20
 	if (irq =3D=3D IRQ_NOTCONNECTED)
@@ -2345,21 +2265,17 @@ int request_nmi(unsigned int irq, irq_handler_t handl=
er,
 	if (retval)
 		goto err_irq_setup;
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
-
-	/* Setup NMI state */
-	desc->istate |=3D IRQS_NMI;
-	retval =3D irq_nmi_setup(desc);
-	if (retval) {
-		__cleanup_nmi(irq, desc);
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
-		return -EINVAL;
+	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
+		/* Setup NMI state */
+		desc->istate |=3D IRQS_NMI;
+		retval =3D irq_nmi_setup(desc);
+		if (retval) {
+			__cleanup_nmi(irq, desc);
+			return -EINVAL;
+		}
+		return 0;
 	}
=20
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-
-	return 0;
-
 err_irq_setup:
 	irq_chip_pm_put(&desc->irq_data);
 err_out:
@@ -2370,35 +2286,25 @@ int request_nmi(unsigned int irq, irq_handler_t handl=
er,
=20
 void enable_percpu_irq(unsigned int irq, unsigned int type)
 {
-	unsigned int cpu =3D smp_processor_id();
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, IRQ_GET_DESC_CHECK=
_PERCPU);
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU) {
+		struct irq_desc *desc =3D scoped_irqdesc;
=20
-	if (!desc)
-		return;
-
-	/*
-	 * If the trigger type is not specified by the caller, then
-	 * use the default for this interrupt.
-	 */
-	type &=3D IRQ_TYPE_SENSE_MASK;
-	if (type =3D=3D IRQ_TYPE_NONE)
-		type =3D irqd_get_trigger_type(&desc->irq_data);
-
-	if (type !=3D IRQ_TYPE_NONE) {
-		int ret;
-
-		ret =3D __irq_set_trigger(desc, type);
-
-		if (ret) {
-			WARN(1, "failed to set type for IRQ%d\n", irq);
-			goto out;
+		/*
+		 * If the trigger type is not specified by the caller, then
+		 * use the default for this interrupt.
+		 */
+		type &=3D IRQ_TYPE_SENSE_MASK;
+		if (type =3D=3D IRQ_TYPE_NONE)
+			type =3D irqd_get_trigger_type(&desc->irq_data);
+
+		if (type !=3D IRQ_TYPE_NONE) {
+			if (__irq_set_trigger(desc, type)) {
+				WARN(1, "failed to set type for IRQ%d\n", irq);
+				return;
+			}
 		}
+		irq_percpu_enable(desc, smp_processor_id());
 	}
-
-	irq_percpu_enable(desc, cpu);
-out:
-	irq_put_desc_unlock(desc, flags);
 }
 EXPORT_SYMBOL_GPL(enable_percpu_irq);
=20
@@ -2416,33 +2322,16 @@ void enable_percpu_nmi(unsigned int irq, unsigned int=
 type)
  */
 bool irq_percpu_is_enabled(unsigned int irq)
 {
-	unsigned int cpu =3D smp_processor_id();
-	struct irq_desc *desc;
-	unsigned long flags;
-	bool is_enabled;
-
-	desc =3D irq_get_desc_lock(irq, &flags, IRQ_GET_DESC_CHECK_PERCPU);
-	if (!desc)
-		return false;
-
-	is_enabled =3D cpumask_test_cpu(cpu, desc->percpu_enabled);
-	irq_put_desc_unlock(desc, flags);
-
-	return is_enabled;
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU)
+		return cpumask_test_cpu(smp_processor_id(), scoped_irqdesc->percpu_enabled=
);
+	return false;
 }
 EXPORT_SYMBOL_GPL(irq_percpu_is_enabled);
=20
 void disable_percpu_irq(unsigned int irq)
 {
-	unsigned int cpu =3D smp_processor_id();
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_lock(irq, &flags, IRQ_GET_DESC_CHECK=
_PERCPU);
-
-	if (!desc)
-		return;
-
-	irq_percpu_disable(desc, cpu);
-	irq_put_desc_unlock(desc, flags);
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU)
+		irq_percpu_disable(scoped_irqdesc, smp_processor_id());
 }
 EXPORT_SYMBOL_GPL(disable_percpu_irq);
=20
@@ -2458,71 +2347,47 @@ static struct irqaction *__free_percpu_irq(unsigned i=
nt irq, void __percpu *dev_
 {
 	struct irq_desc *desc =3D irq_to_desc(irq);
 	struct irqaction *action;
-	unsigned long flags;
=20
 	WARN(in_interrupt(), "Trying to free IRQ %d from IRQ context!\n", irq);
=20
 	if (!desc)
 		return NULL;
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
+		action =3D desc->action;
+		if (!action || action->percpu_dev_id !=3D dev_id) {
+			WARN(1, "Trying to free already-free IRQ %d\n", irq);
+			return NULL;
+		}
=20
-	action =3D desc->action;
-	if (!action || action->percpu_dev_id !=3D dev_id) {
-		WARN(1, "Trying to free already-free IRQ %d\n", irq);
-		goto bad;
-	}
+		if (!cpumask_empty(desc->percpu_enabled)) {
+			WARN(1, "percpu IRQ %d still enabled on CPU%d!\n",
+			     irq, cpumask_first(desc->percpu_enabled));
+			return NULL;
+		}
=20
-	if (!cpumask_empty(desc->percpu_enabled)) {
-		WARN(1, "percpu IRQ %d still enabled on CPU%d!\n",
-		     irq, cpumask_first(desc->percpu_enabled));
-		goto bad;
+		/* Found it - now remove it from the list of entries: */
+		desc->action =3D NULL;
+		desc->istate &=3D ~IRQS_NMI;
 	}
=20
-	/* Found it - now remove it from the list of entries: */
-	desc->action =3D NULL;
-
-	desc->istate &=3D ~IRQS_NMI;
-
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-
 	unregister_handler_proc(irq, action);
-
 	irq_chip_pm_put(&desc->irq_data);
 	module_put(desc->owner);
 	return action;
-
-bad:
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-	return NULL;
 }
=20
 /**
- *	remove_percpu_irq - free a per-cpu interrupt
- *	@irq: Interrupt line to free
- *	@act: irqaction for the interrupt
+ * free_percpu_irq - free an interrupt allocated with request_percpu_irq
+ * @irq:	Interrupt line to free
+ * @dev_id:	Device identity to free
  *
- * Used to remove interrupts statically setup by the early boot process.
- */
-void remove_percpu_irq(unsigned int irq, struct irqaction *act)
-{
-	struct irq_desc *desc =3D irq_to_desc(irq);
-
-	if (desc && irq_settings_is_per_cpu_devid(desc))
-	    __free_percpu_irq(irq, act->percpu_dev_id);
-}
-
-/**
- *	free_percpu_irq - free an interrupt allocated with request_percpu_irq
- *	@irq: Interrupt line to free
- *	@dev_id: Device identity to free
+ * Remove a percpu interrupt handler. The handler is removed, but the
+ * interrupt line is not disabled. This must be done on each CPU before
+ * calling this function. The function does not return until any executing
+ * interrupts for this IRQ have completed.
  *
- *	Remove a percpu interrupt handler. The handler is removed, but
- *	the interrupt line is not disabled. This must be done on each
- *	CPU before calling this function. The function does not return
- *	until any executing interrupts for this IRQ have completed.
- *
- *	This function must not be called from interrupt context.
+ * This function must not be called from interrupt context.
  */
 void free_percpu_irq(unsigned int irq, void __percpu *dev_id)
 {
@@ -2551,9 +2416,9 @@ void free_percpu_nmi(unsigned int irq, void __percpu *d=
ev_id)
 }
=20
 /**
- *	setup_percpu_irq - setup a per-cpu interrupt
- *	@irq: Interrupt line to setup
- *	@act: irqaction for the interrupt
+ * setup_percpu_irq - setup a per-cpu interrupt
+ * @irq:	Interrupt line to setup
+ * @act:	irqaction for the interrupt
  *
  * Used to statically setup per-cpu interrupts in the early boot process.
  */
@@ -2578,21 +2443,20 @@ int setup_percpu_irq(unsigned int irq, struct irqacti=
on *act)
 }
=20
 /**
- *	__request_percpu_irq - allocate a percpu interrupt line
- *	@irq: Interrupt line to allocate
- *	@handler: Function to be called when the IRQ occurs.
- *	@flags: Interrupt type flags (IRQF_TIMER only)
- *	@devname: An ascii name for the claiming device
- *	@dev_id: A percpu cookie passed back to the handler function
- *
- *	This call allocates interrupt resources and enables the
- *	interrupt on the local CPU. If the interrupt is supposed to be
- *	enabled on other CPUs, it has to be done on each CPU using
- *	enable_percpu_irq().
- *
- *	Dev_id must be globally unique. It is a per-cpu variable, and
- *	the handler gets called with the interrupted CPU's instance of
- *	that variable.
+ * __request_percpu_irq - allocate a percpu interrupt line
+ * @irq:	Interrupt line to allocate
+ * @handler:	Function to be called when the IRQ occurs.
+ * @flags:	Interrupt type flags (IRQF_TIMER only)
+ * @devname:	An ascii name for the claiming device
+ * @dev_id:	A percpu cookie passed back to the handler function
+ *
+ * This call allocates interrupt resources and enables the interrupt on the
+ * local CPU. If the interrupt is supposed to be enabled on other CPUs, it
+ * has to be done on each CPU using enable_percpu_irq().
+ *
+ * @dev_id must be globally unique. It is a per-cpu variable, and
+ * the handler gets called with the interrupted CPU's instance of
+ * that variable.
  */
 int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
 			 unsigned long flags, const char *devname,
@@ -2640,32 +2504,31 @@ int __request_percpu_irq(unsigned int irq, irq_handle=
r_t handler,
 EXPORT_SYMBOL_GPL(__request_percpu_irq);
=20
 /**
- *	request_percpu_nmi - allocate a percpu interrupt line for NMI delivery
- *	@irq: Interrupt line to allocate
- *	@handler: Function to be called when the IRQ occurs.
- *	@name: An ascii name for the claiming device
- *	@dev_id: A percpu cookie passed back to the handler function
+ * request_percpu_nmi - allocate a percpu interrupt line for NMI delivery
+ * @irq:	Interrupt line to allocate
+ * @handler:	Function to be called when the IRQ occurs.
+ * @name:	An ascii name for the claiming device
+ * @dev_id:	A percpu cookie passed back to the handler function
  *
- *	This call allocates interrupt resources for a per CPU NMI. Per CPU NMIs
- *	have to be setup on each CPU by calling prepare_percpu_nmi() before
- *	being enabled on the same CPU by using enable_percpu_nmi().
+ * This call allocates interrupt resources for a per CPU NMI. Per CPU NMIs
+ * have to be setup on each CPU by calling prepare_percpu_nmi() before
+ * being enabled on the same CPU by using enable_percpu_nmi().
  *
- *	Dev_id must be globally unique. It is a per-cpu variable, and
- *	the handler gets called with the interrupted CPU's instance of
- *	that variable.
+ * @dev_id must be globally unique. It is a per-cpu variable, and the
+ * handler gets called with the interrupted CPU's instance of that
+ * variable.
  *
- *	Interrupt lines requested for NMI delivering should have auto enabling
- *	setting disabled.
+ * Interrupt lines requested for NMI delivering should have auto enabling
+ * setting disabled.
  *
- *	If the interrupt line cannot be used to deliver NMIs, function
- *	will fail returning a negative value.
+ * If the interrupt line cannot be used to deliver NMIs, function
+ * will fail returning a negative value.
  */
 int request_percpu_nmi(unsigned int irq, irq_handler_t handler,
 		       const char *name, void __percpu *dev_id)
 {
 	struct irqaction *action;
 	struct irq_desc *desc;
-	unsigned long flags;
 	int retval;
=20
 	if (!handler)
@@ -2701,10 +2564,8 @@ int request_percpu_nmi(unsigned int irq, irq_handler_t=
 handler,
 	if (retval)
 		goto err_irq_setup;
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	desc->istate |=3D IRQS_NMI;
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-
+	scoped_guard(raw_spinlock_irqsave, &desc->lock)
+		desc->istate |=3D IRQS_NMI;
 	return 0;
=20
 err_irq_setup:
@@ -2716,79 +2577,55 @@ int request_percpu_nmi(unsigned int irq, irq_handler_=
t handler,
 }
=20
 /**
- *	prepare_percpu_nmi - performs CPU local setup for NMI delivery
- *	@irq: Interrupt line to prepare for NMI delivery
+ * prepare_percpu_nmi - performs CPU local setup for NMI delivery
+ * @irq: Interrupt line to prepare for NMI delivery
  *
- *	This call prepares an interrupt line to deliver NMI on the current CPU,
- *	before that interrupt line gets enabled with enable_percpu_nmi().
+ * This call prepares an interrupt line to deliver NMI on the current CPU,
+ * before that interrupt line gets enabled with enable_percpu_nmi().
  *
- *	As a CPU local operation, this should be called from non-preemptible
- *	context.
+ * As a CPU local operation, this should be called from non-preemptible
+ * context.
  *
- *	If the interrupt line cannot be used to deliver NMIs, function
- *	will fail returning a negative value.
+ * If the interrupt line cannot be used to deliver NMIs, function will fail
+ * returning a negative value.
  */
 int prepare_percpu_nmi(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc;
-	int ret =3D 0;
+	int ret =3D -EINVAL;
=20
 	WARN_ON(preemptible());
=20
-	desc =3D irq_get_desc_lock(irq, &flags,
-				 IRQ_GET_DESC_CHECK_PERCPU);
-	if (!desc)
-		return -EINVAL;
-
-	if (WARN(!irq_is_nmi(desc),
-		 KERN_ERR "prepare_percpu_nmi called for a non-NMI interrupt: irq %u\n",
-		 irq)) {
-		ret =3D -EINVAL;
-		goto out;
-	}
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU) {
+		if (WARN(!irq_is_nmi(scoped_irqdesc),
+			 "prepare_percpu_nmi called for a non-NMI interrupt: irq %u\n", irq))
+			return -EINVAL;
=20
-	ret =3D irq_nmi_setup(desc);
-	if (ret) {
-		pr_err("Failed to setup NMI delivery: irq %u\n", irq);
-		goto out;
+		ret =3D irq_nmi_setup(scoped_irqdesc);
+		if (ret)
+			pr_err("Failed to setup NMI delivery: irq %u\n", irq);
 	}
-
-out:
-	irq_put_desc_unlock(desc, flags);
 	return ret;
 }
=20
 /**
- *	teardown_percpu_nmi - undoes NMI setup of IRQ line
- *	@irq: Interrupt line from which CPU local NMI configuration should be
- *	      removed
- *
- *	This call undoes the setup done by prepare_percpu_nmi().
+ * teardown_percpu_nmi - undoes NMI setup of IRQ line
+ * @irq: Interrupt line from which CPU local NMI configuration should be rem=
oved
  *
- *	IRQ line should not be enabled for the current CPU.
+ * This call undoes the setup done by prepare_percpu_nmi().
  *
- *	As a CPU local operation, this should be called from non-preemptible
- *	context.
+ * IRQ line should not be enabled for the current CPU.
+ * As a CPU local operation, this should be called from non-preemptible
+ * context.
  */
 void teardown_percpu_nmi(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc;
-
 	WARN_ON(preemptible());
=20
-	desc =3D irq_get_desc_lock(irq, &flags,
-				 IRQ_GET_DESC_CHECK_PERCPU);
-	if (!desc)
-		return;
-
-	if (WARN_ON(!irq_is_nmi(desc)))
-		goto out;
-
-	irq_nmi_teardown(desc);
-out:
-	irq_put_desc_unlock(desc, flags);
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU) {
+		if (WARN_ON(!irq_is_nmi(scoped_irqdesc)))
+			return;
+		irq_nmi_teardown(scoped_irqdesc);
+	}
 }
=20
 static int __irq_get_irqchip_state(struct irq_data *data, enum irqchip_irq_s=
tate which, bool *state)
@@ -2815,87 +2652,62 @@ static int __irq_get_irqchip_state(struct irq_data *d=
ata, enum irqchip_irq_state
 }
=20
 /**
- *	irq_get_irqchip_state - returns the irqchip state of a interrupt.
- *	@irq: Interrupt line that is forwarded to a VM
- *	@which: One of IRQCHIP_STATE_* the caller wants to know about
- *	@state: a pointer to a boolean where the state is to be stored
+ * irq_get_irqchip_state - returns the irqchip state of a interrupt.
+ * @irq:	Interrupt line that is forwarded to a VM
+ * @which:	One of IRQCHIP_STATE_* the caller wants to know about
+ * @state:	a pointer to a boolean where the state is to be stored
  *
- *	This call snapshots the internal irqchip state of an
- *	interrupt, returning into @state the bit corresponding to
- *	stage @which
+ * This call snapshots the internal irqchip state of an interrupt,
+ * returning into @state the bit corresponding to stage @which
  *
- *	This function should be called with preemption disabled if the
- *	interrupt controller has per-cpu registers.
+ * This function should be called with preemption disabled if the interrupt
+ * controller has per-cpu registers.
  */
-int irq_get_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
-			  bool *state)
+int irq_get_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bo=
ol *state)
 {
-	struct irq_desc *desc;
-	struct irq_data *data;
-	unsigned long flags;
-	int err =3D -EINVAL;
-
-	desc =3D irq_get_desc_buslock(irq, &flags, 0);
-	if (!desc)
-		return err;
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_data *data =3D irq_desc_get_irq_data(scoped_irqdesc);
=20
-	data =3D irq_desc_get_irq_data(desc);
-
-	err =3D __irq_get_irqchip_state(data, which, state);
-
-	irq_put_desc_busunlock(desc, flags);
-	return err;
+		return __irq_get_irqchip_state(data, which, state);
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(irq_get_irqchip_state);
=20
 /**
- *	irq_set_irqchip_state - set the state of a forwarded interrupt.
- *	@irq: Interrupt line that is forwarded to a VM
- *	@which: State to be restored (one of IRQCHIP_STATE_*)
- *	@val: Value corresponding to @which
+ * irq_set_irqchip_state - set the state of a forwarded interrupt.
+ * @irq:	Interrupt line that is forwarded to a VM
+ * @which:	State to be restored (one of IRQCHIP_STATE_*)
+ * @val:	Value corresponding to @which
  *
- *	This call sets the internal irqchip state of an interrupt,
- *	depending on the value of @which.
+ * This call sets the internal irqchip state of an interrupt, depending on
+ * the value of @which.
  *
- *	This function should be called with migration disabled if the
- *	interrupt controller has per-cpu registers.
+ * This function should be called with migration disabled if the interrupt
+ * controller has per-cpu registers.
  */
-int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
-			  bool val)
+int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bo=
ol val)
 {
-	struct irq_desc *desc;
-	struct irq_data *data;
-	struct irq_chip *chip;
-	unsigned long flags;
-	int err =3D -EINVAL;
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_data *data =3D irq_desc_get_irq_data(scoped_irqdesc);
+		struct irq_chip *chip;
=20
-	desc =3D irq_get_desc_buslock(irq, &flags, 0);
-	if (!desc)
-		return err;
+		do {
+			chip =3D irq_data_get_irq_chip(data);
=20
-	data =3D irq_desc_get_irq_data(desc);
+			if (WARN_ON_ONCE(!chip))
+				return -ENODEV;
=20
-	do {
-		chip =3D irq_data_get_irq_chip(data);
-		if (WARN_ON_ONCE(!chip)) {
-			err =3D -ENODEV;
-			goto out_unlock;
-		}
-		if (chip->irq_set_irqchip_state)
-			break;
-#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
-		data =3D data->parent_data;
-#else
-		data =3D NULL;
-#endif
-	} while (data);
+			if (chip->irq_set_irqchip_state)
+				break;
=20
-	if (data)
-		err =3D chip->irq_set_irqchip_state(data, which, val);
+			data =3D irqd_get_parent_data(data);
+		} while (data);
=20
-out_unlock:
-	irq_put_desc_busunlock(desc, flags);
-	return err;
+		if (data)
+			return chip->irq_set_irqchip_state(data, which, val);
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(irq_set_irqchip_state);
=20
diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
index c556bc49d213..445912d51033 100644
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -46,8 +46,7 @@ void irq_pm_install_action(struct irq_desc *desc, struct ir=
qaction *action)
 		desc->cond_suspend_depth++;
=20
 	WARN_ON_ONCE(desc->no_suspend_depth &&
-		     (desc->no_suspend_depth +
-			desc->cond_suspend_depth) !=3D desc->nr_actions);
+		     (desc->no_suspend_depth + desc->cond_suspend_depth) !=3D desc->nr_act=
ions);
 }
=20
 /*
@@ -134,14 +133,12 @@ void suspend_device_irqs(void)
 	int irq;
=20
 	for_each_irq_desc(irq, desc) {
-		unsigned long flags;
 		bool sync;
=20
 		if (irq_settings_is_nested_thread(desc))
 			continue;
-		raw_spin_lock_irqsave(&desc->lock, flags);
-		sync =3D suspend_device_irq(desc);
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
+		scoped_guard(raw_spinlock_irqsave, &desc->lock)
+			sync =3D suspend_device_irq(desc);
=20
 		if (sync)
 			synchronize_irq(irq);
@@ -186,18 +183,15 @@ static void resume_irqs(bool want_early)
 	int irq;
=20
 	for_each_irq_desc(irq, desc) {
-		unsigned long flags;
-		bool is_early =3D desc->action &&
-			desc->action->flags & IRQF_EARLY_RESUME;
+		bool is_early =3D desc->action &&	desc->action->flags & IRQF_EARLY_RESUME;
=20
 		if (!is_early && want_early)
 			continue;
 		if (irq_settings_is_nested_thread(desc))
 			continue;
=20
-		raw_spin_lock_irqsave(&desc->lock, flags);
+		guard(raw_spinlock_irqsave)(&desc->lock);
 		resume_irq(desc);
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
 	}
 }
=20
@@ -207,22 +201,16 @@ static void resume_irqs(bool want_early)
  */
 void rearm_wake_irq(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc =3D irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CH=
ECK_GLOBAL);
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		struct irq_desc *desc =3D scoped_irqdesc;
=20
-	if (!desc)
-		return;
-
-	if (!(desc->istate & IRQS_SUSPENDED) ||
-	    !irqd_is_wakeup_set(&desc->irq_data))
-		goto unlock;
-
-	desc->istate &=3D ~IRQS_SUSPENDED;
-	irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
-	__enable_irq(desc);
+		if (!(desc->istate & IRQS_SUSPENDED) || !irqd_is_wakeup_set(&desc->irq_dat=
a))
+			return;
=20
-unlock:
-	irq_put_desc_busunlock(desc, flags);
+		desc->istate &=3D ~IRQS_SUSPENDED;
+		irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
+		__enable_irq(desc);
+	}
 }
=20
 /**
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 8e29809de38d..29c2404e743b 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -81,20 +81,18 @@ static int show_irq_affinity(int type, struct seq_file *m)
 static int irq_affinity_hint_proc_show(struct seq_file *m, void *v)
 {
 	struct irq_desc *desc =3D irq_to_desc((long)m->private);
-	unsigned long flags;
 	cpumask_var_t mask;
=20
 	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
 		return -ENOMEM;
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	if (desc->affinity_hint)
-		cpumask_copy(mask, desc->affinity_hint);
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
+	scoped_guard(raw_spinlock_irq, &desc->lock) {
+		if (desc->affinity_hint)
+			cpumask_copy(mask, desc->affinity_hint);
+	}
=20
 	seq_printf(m, "%*pb\n", cpumask_pr_args(mask));
 	free_cpumask_var(mask);
-
 	return 0;
 }
=20
@@ -295,32 +293,26 @@ static int irq_spurious_proc_show(struct seq_file *m, v=
oid *v)
=20
 #define MAX_NAMELEN 128
=20
-static int name_unique(unsigned int irq, struct irqaction *new_action)
+static bool name_unique(unsigned int irq, struct irqaction *new_action)
 {
 	struct irq_desc *desc =3D irq_to_desc(irq);
 	struct irqaction *action;
-	unsigned long flags;
-	int ret =3D 1;
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	guard(raw_spinlock_irq)(&desc->lock);
 	for_each_action_of_desc(desc, action) {
 		if ((action !=3D new_action) && action->name &&
-				!strcmp(new_action->name, action->name)) {
-			ret =3D 0;
-			break;
-		}
+		    !strcmp(new_action->name, action->name))
+			return false;
 	}
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-	return ret;
+	return true;
 }
=20
 void register_handler_proc(unsigned int irq, struct irqaction *action)
 {
-	char name [MAX_NAMELEN];
+	char name[MAX_NAMELEN];
 	struct irq_desc *desc =3D irq_to_desc(irq);
=20
-	if (!desc->dir || action->dir || !action->name ||
-					!name_unique(irq, action))
+	if (!desc->dir || action->dir || !action->name || !name_unique(irq, action))
 		return;
=20
 	snprintf(name, MAX_NAMELEN, "%s", action->name);
@@ -347,17 +339,16 @@ void register_irq_proc(unsigned int irq, struct irq_des=
c *desc)
 	 * added, not when the descriptor is created, so multiple
 	 * tasks might try to register at the same time.
 	 */
-	mutex_lock(&register_lock);
+	guard(mutex)(&register_lock);
=20
 	if (desc->dir)
-		goto out_unlock;
-
-	sprintf(name, "%d", irq);
+		return;
=20
 	/* create /proc/irq/1234 */
+	sprintf(name, "%u", irq);
 	desc->dir =3D proc_mkdir(name, root_irq_dir);
 	if (!desc->dir)
-		goto out_unlock;
+		return;
=20
 #ifdef CONFIG_SMP
 	umode_t umode =3D S_IRUGO;
@@ -366,31 +357,27 @@ void register_irq_proc(unsigned int irq, struct irq_des=
c *desc)
 		umode |=3D S_IWUSR;
=20
 	/* create /proc/irq/<irq>/smp_affinity */
-	proc_create_data("smp_affinity", umode, desc->dir,
-			 &irq_affinity_proc_ops, irqp);
+	proc_create_data("smp_affinity", umode, desc->dir, &irq_affinity_proc_ops, =
irqp);
=20
 	/* create /proc/irq/<irq>/affinity_hint */
 	proc_create_single_data("affinity_hint", 0444, desc->dir,
-			irq_affinity_hint_proc_show, irqp);
+				irq_affinity_hint_proc_show, irqp);
=20
 	/* create /proc/irq/<irq>/smp_affinity_list */
 	proc_create_data("smp_affinity_list", umode, desc->dir,
 			 &irq_affinity_list_proc_ops, irqp);
=20
-	proc_create_single_data("node", 0444, desc->dir, irq_node_proc_show,
-			irqp);
+	proc_create_single_data("node", 0444, desc->dir, irq_node_proc_show, irqp);
 # ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
 	proc_create_single_data("effective_affinity", 0444, desc->dir,
-			irq_effective_aff_proc_show, irqp);
+				irq_effective_aff_proc_show, irqp);
 	proc_create_single_data("effective_affinity_list", 0444, desc->dir,
-			irq_effective_aff_list_proc_show, irqp);
+				irq_effective_aff_list_proc_show, irqp);
 # endif
 #endif
 	proc_create_single_data("spurious", 0444, desc->dir,
-			irq_spurious_proc_show, (void *)(long)irq);
+				irq_spurious_proc_show, (void *)(long)irq);
=20
-out_unlock:
-	mutex_unlock(&register_lock);
 }
=20
 void unregister_irq_proc(unsigned int irq, struct irq_desc *desc)
@@ -468,7 +455,6 @@ int show_interrupts(struct seq_file *p, void *v)
 	int i =3D *(loff_t *) v, j;
 	struct irqaction *action;
 	struct irq_desc *desc;
-	unsigned long flags;
=20
 	if (i > ACTUAL_NR_IRQS)
 		return 0;
@@ -487,13 +473,13 @@ int show_interrupts(struct seq_file *p, void *v)
 		seq_putc(p, '\n');
 	}
=20
-	rcu_read_lock();
+	guard(rcu)();
 	desc =3D irq_to_desc(i);
 	if (!desc || irq_settings_is_hidden(desc))
-		goto outsparse;
+		return 0;
=20
 	if (!desc->action || irq_desc_is_chained(desc) || !desc->kstat_irqs)
-		goto outsparse;
+		return 0;
=20
 	seq_printf(p, "%*d:", prec, i);
 	for_each_online_cpu(j) {
@@ -503,7 +489,7 @@ int show_interrupts(struct seq_file *p, void *v)
 	}
 	seq_putc(p, ' ');
=20
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	guard(raw_spinlock_irq)(&desc->lock);
 	if (desc->irq_data.chip) {
 		if (desc->irq_data.chip->irq_print_chip)
 			desc->irq_data.chip->irq_print_chip(&desc->irq_data, p);
@@ -532,9 +518,6 @@ int show_interrupts(struct seq_file *p, void *v)
 	}
=20
 	seq_putc(p, '\n');
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-outsparse:
-	rcu_read_unlock();
 	return 0;
 }
 #endif
diff --git a/kernel/irq/resend.c b/kernel/irq/resend.c
index 1b7fa72968bd..ca9cc1b806a9 100644
--- a/kernel/irq/resend.c
+++ b/kernel/irq/resend.c
@@ -30,18 +30,17 @@ static DEFINE_RAW_SPINLOCK(irq_resend_lock);
  */
 static void resend_irqs(struct tasklet_struct *unused)
 {
-	struct irq_desc *desc;
-
-	raw_spin_lock_irq(&irq_resend_lock);
+	guard(raw_spinlock_irq)(&irq_resend_lock);
 	while (!hlist_empty(&irq_resend_list)) {
-		desc =3D hlist_entry(irq_resend_list.first, struct irq_desc,
-				   resend_node);
+		struct irq_desc *desc;
+
+		desc =3D hlist_entry(irq_resend_list.first, struct irq_desc,  resend_node);
 		hlist_del_init(&desc->resend_node);
+
 		raw_spin_unlock(&irq_resend_lock);
 		desc->handle_irq(desc);
 		raw_spin_lock(&irq_resend_lock);
 	}
-	raw_spin_unlock_irq(&irq_resend_lock);
 }
=20
 /* Tasklet to handle resend: */
@@ -75,19 +74,18 @@ static int irq_sw_resend(struct irq_desc *desc)
 	}
=20
 	/* Add to resend_list and activate the softirq: */
-	raw_spin_lock(&irq_resend_lock);
-	if (hlist_unhashed(&desc->resend_node))
-		hlist_add_head(&desc->resend_node, &irq_resend_list);
-	raw_spin_unlock(&irq_resend_lock);
+	scoped_guard(raw_spinlock, &irq_resend_lock) {
+		if (hlist_unhashed(&desc->resend_node))
+			hlist_add_head(&desc->resend_node, &irq_resend_list);
+	}
 	tasklet_schedule(&resend_tasklet);
 	return 0;
 }
=20
 void clear_irq_resend(struct irq_desc *desc)
 {
-	raw_spin_lock(&irq_resend_lock);
+	guard(raw_spinlock)(&irq_resend_lock);
 	hlist_del_init(&desc->resend_node);
-	raw_spin_unlock(&irq_resend_lock);
 }
=20
 void irq_resend_init(struct irq_desc *desc)
@@ -172,30 +170,24 @@ int check_irq_resend(struct irq_desc *desc, bool inject)
  */
 int irq_inject_interrupt(unsigned int irq)
 {
-	struct irq_desc *desc;
-	unsigned long flags;
-	int err;
+	int err =3D -EINVAL;
=20
 	/* Try the state injection hardware interface first */
 	if (!irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true))
 		return 0;
=20
 	/* That failed, try via the resend mechanism */
-	desc =3D irq_get_desc_buslock(irq, &flags, 0);
-	if (!desc)
-		return -EINVAL;
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_desc *desc =3D scoped_irqdesc;
=20
-	/*
-	 * Only try to inject when the interrupt is:
-	 *  - not NMI type
-	 *  - activated
-	 */
-	if (irq_is_nmi(desc) || !irqd_is_activated(&desc->irq_data))
-		err =3D -EINVAL;
-	else
-		err =3D check_irq_resend(desc, true);
-
-	irq_put_desc_busunlock(desc, flags);
+		/*
+		 * Only try to inject when the interrupt is:
+		 *  - not NMI type
+		 *  - activated
+		 */
+		if (!irq_is_nmi(desc) && irqd_is_activated(&desc->irq_data))
+			err =3D check_irq_resend(desc, true);
+	}
 	return err;
 }
 EXPORT_SYMBOL_GPL(irq_inject_interrupt);
diff --git a/kernel/irq/spurious.c b/kernel/irq/spurious.c
index 02b2daf07441..8f26982e7300 100644
--- a/kernel/irq/spurious.c
+++ b/kernel/irq/spurious.c
@@ -34,8 +34,9 @@ static atomic_t irq_poll_active;
  * true and let the handler run.
  */
 bool irq_wait_for_poll(struct irq_desc *desc)
-	__must_hold(&desc->lock)
 {
+	lockdep_assert_held(&desc->lock);
+
 	if (WARN_ONCE(irq_poll_cpu =3D=3D smp_processor_id(),
 		      "irq poll in progress on cpu %d for irq %d\n",
 		      smp_processor_id(), desc->irq_data.irq))
@@ -59,37 +60,35 @@ bool irq_wait_for_poll(struct irq_desc *desc)
 /*
  * Recovery handler for misrouted interrupts.
  */
-static int try_one_irq(struct irq_desc *desc, bool force)
+static bool try_one_irq(struct irq_desc *desc, bool force)
 {
-	irqreturn_t ret =3D IRQ_NONE;
 	struct irqaction *action;
+	bool ret =3D false;
=20
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
=20
 	/*
 	 * PER_CPU, nested thread interrupts and interrupts explicitly
 	 * marked polled are excluded from polling.
 	 */
-	if (irq_settings_is_per_cpu(desc) ||
-	    irq_settings_is_nested_thread(desc) ||
+	if (irq_settings_is_per_cpu(desc) || irq_settings_is_nested_thread(desc) ||
 	    irq_settings_is_polled(desc))
-		goto out;
+		return false;
=20
 	/*
 	 * Do not poll disabled interrupts unless the spurious
 	 * disabled poller asks explicitly.
 	 */
 	if (irqd_irq_disabled(&desc->irq_data) && !force)
-		goto out;
+		return false;
=20
 	/*
 	 * All handlers must agree on IRQF_SHARED, so we test just the
 	 * first.
 	 */
 	action =3D desc->action;
-	if (!action || !(action->flags & IRQF_SHARED) ||
-	    (action->flags & __IRQF_TIMER))
-		goto out;
+	if (!action || !(action->flags & IRQF_SHARED) || (action->flags & __IRQF_TI=
MER))
+		return false;
=20
 	/* Already running on another processor */
 	if (irqd_irq_inprogress(&desc->irq_data)) {
@@ -98,21 +97,19 @@ static int try_one_irq(struct irq_desc *desc, bool force)
 		 * CPU to go looking for our mystery interrupt too
 		 */
 		desc->istate |=3D IRQS_PENDING;
-		goto out;
+		return false;
 	}
=20
 	/* Mark it poll in progress */
 	desc->istate |=3D IRQS_POLL_INPROGRESS;
 	do {
 		if (handle_irq_event(desc) =3D=3D IRQ_HANDLED)
-			ret =3D IRQ_HANDLED;
+			ret =3D true;
 		/* Make sure that there is still a valid action */
 		action =3D desc->action;
 	} while ((desc->istate & IRQS_PENDING) && action);
 	desc->istate &=3D ~IRQS_POLL_INPROGRESS;
-out:
-	raw_spin_unlock(&desc->lock);
-	return ret =3D=3D IRQ_HANDLED;
+	return ret;
 }
=20
 static int misrouted_irq(int irq)
@@ -157,8 +154,7 @@ static void poll_spurious_irqs(struct timer_list *unused)
 			 continue;
=20
 		/* Racy but it doesn't matter */
-		state =3D desc->istate;
-		barrier();
+		state =3D READ_ONCE(desc->istate);
 		if (!(state & IRQS_SPURIOUS_DISABLED))
 			continue;
=20
@@ -168,8 +164,7 @@ static void poll_spurious_irqs(struct timer_list *unused)
 	}
 out:
 	atomic_dec(&irq_poll_active);
-	mod_timer(&poll_spurious_irq_timer,
-		  jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
+	mod_timer(&poll_spurious_irq_timer, jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
 }
=20
 static inline int bad_action_ret(irqreturn_t action_ret)
@@ -193,17 +188,13 @@ static void __report_bad_irq(struct irq_desc *desc, irq=
return_t action_ret)
 {
 	unsigned int irq =3D irq_desc_get_irq(desc);
 	struct irqaction *action;
-	unsigned long flags;
=20
-	if (bad_action_ret(action_ret)) {
-		printk(KERN_ERR "irq event %d: bogus return value %x\n",
-				irq, action_ret);
-	} else {
-		printk(KERN_ERR "irq %d: nobody cared (try booting with "
-				"the \"irqpoll\" option)\n", irq);
-	}
+	if (bad_action_ret(action_ret))
+		pr_err("irq event %d: bogus return value %x\n", irq, action_ret);
+	else
+		pr_err("irq %d: nobody cared (try booting with the \"irqpoll\" option)\n",=
 irq);
 	dump_stack();
-	printk(KERN_ERR "handlers:\n");
+	pr_err("handlers:\n");
=20
 	/*
 	 * We need to take desc->lock here. note_interrupt() is called
@@ -211,15 +202,13 @@ static void __report_bad_irq(struct irq_desc *desc, irq=
return_t action_ret)
 	 * with something else removing an action. It's ok to take
 	 * desc->lock here. See synchronize_irq().
 	 */
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	guard(raw_spinlock_irqsave)(&desc->lock);
 	for_each_action_of_desc(desc, action) {
-		printk(KERN_ERR "[<%p>] %ps", action->handler, action->handler);
+		pr_err("[<%p>] %ps", action->handler, action->handler);
 		if (action->thread_fn)
-			printk(KERN_CONT " threaded [<%p>] %ps",
-					action->thread_fn, action->thread_fn);
-		printk(KERN_CONT "\n");
+			pr_cont(" threaded [<%p>] %ps", action->thread_fn, action->thread_fn);
+		pr_cont("\n");
 	}
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
 }
=20
 static void report_bad_irq(struct irq_desc *desc, irqreturn_t action_ret)
@@ -232,18 +221,17 @@ static void report_bad_irq(struct irq_desc *desc, irqre=
turn_t action_ret)
 	}
 }
=20
-static inline int
-try_misrouted_irq(unsigned int irq, struct irq_desc *desc,
-		  irqreturn_t action_ret)
+static inline bool try_misrouted_irq(unsigned int irq, struct irq_desc *desc,
+				     irqreturn_t action_ret)
 {
 	struct irqaction *action;
=20
 	if (!irqfixup)
-		return 0;
+		return false;
=20
 	/* We didn't actually handle the IRQ - see if it was misrouted? */
 	if (action_ret =3D=3D IRQ_NONE)
-		return 1;
+		return true;
=20
 	/*
 	 * But for 'irqfixup =3D=3D 2' we also do it for handled interrupts if
@@ -251,19 +239,16 @@ try_misrouted_irq(unsigned int irq, struct irq_desc *de=
sc,
 	 * traditional PC timer interrupt.. Legacy)
 	 */
 	if (irqfixup < 2)
-		return 0;
+		return false;
=20
 	if (!irq)
-		return 1;
+		return true;
=20
 	/*
 	 * Since we don't get the descriptor lock, "action" can
-	 * change under us.  We don't really care, but we don't
-	 * want to follow a NULL pointer. So tell the compiler to
-	 * just load it once by using a barrier.
+	 * change under us.
 	 */
-	action =3D desc->action;
-	barrier();
+	action =3D READ_ONCE(desc->action);
 	return action && (action->flags & IRQF_IRQPOLL);
 }
=20
@@ -273,8 +258,7 @@ void note_interrupt(struct irq_desc *desc, irqreturn_t ac=
tion_ret)
 {
 	unsigned int irq;
=20
-	if (desc->istate & IRQS_POLL_INPROGRESS ||
-	    irq_settings_is_polled(desc))
+	if (desc->istate & IRQS_POLL_INPROGRESS || irq_settings_is_polled(desc))
 		return;
=20
 	if (bad_action_ret(action_ret)) {
@@ -420,13 +404,12 @@ void note_interrupt(struct irq_desc *desc, irqreturn_t =
action_ret)
 		/*
 		 * Now kill the IRQ
 		 */
-		printk(KERN_EMERG "Disabling IRQ #%d\n", irq);
+		pr_emerg("Disabling IRQ #%d\n", irq);
 		desc->istate |=3D IRQS_SPURIOUS_DISABLED;
 		desc->depth++;
 		irq_disable(desc);
=20
-		mod_timer(&poll_spurious_irq_timer,
-			  jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
+		mod_timer(&poll_spurious_irq_timer, jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
 	}
 	desc->irqs_unhandled =3D 0;
 }
@@ -436,11 +419,9 @@ bool noirqdebug __read_mostly;
 int noirqdebug_setup(char *str)
 {
 	noirqdebug =3D 1;
-	printk(KERN_INFO "IRQ lockup detection disabled\n");
-
+	pr_info("IRQ lockup detection disabled\n");
 	return 1;
 }
-
 __setup("noirqdebug", noirqdebug_setup);
 module_param(noirqdebug, bool, 0644);
 MODULE_PARM_DESC(noirqdebug, "Disable irq lockup detection when true");
@@ -452,12 +433,10 @@ static int __init irqfixup_setup(char *str)
 		return 1;
 	}
 	irqfixup =3D 1;
-	printk(KERN_WARNING "Misrouted IRQ fixup support enabled.\n");
-	printk(KERN_WARNING "This may impact system performance.\n");
-
+	pr_warn("Misrouted IRQ fixup support enabled.\n");
+	pr_warn("This may impact system performance.\n");
 	return 1;
 }
-
 __setup("irqfixup", irqfixup_setup);
 module_param(irqfixup, int, 0644);
=20
@@ -468,11 +447,8 @@ static int __init irqpoll_setup(char *str)
 		return 1;
 	}
 	irqfixup =3D 2;
-	printk(KERN_WARNING "Misrouted IRQ fixup and polling support "
-				"enabled\n");
-	printk(KERN_WARNING "This may significantly impact system "
-				"performance\n");
+	pr_warn("Misrouted IRQ fixup and polling support enabled\n");
+	pr_warn("This may significantly impact system performance\n");
 	return 1;
 }
-
 __setup("irqpoll", irqpoll_setup);

