Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9922BEC5A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909734; cv=none; b=d6sOfJ5E8ZyCROrdVb58pYA/kGgV6+SEn/aR6r86FD8Sn2SJj5cu4oSQKsJ7e+ssMJn69/KFyxmvdRcYvUYoGxN22ttDcxMLBYNaRVfMibrTNUZ6wjxpbgl3Vur6/2c5pitD6VivVas6mDADveB0TRKOFPmhht2LGsvwLGntHWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909734; c=relaxed/simple;
	bh=eDJKE5DgOvPqgcB2EUysQTDX13M5iNO35ssASXREp80=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=lDfOnnJxKvQEM3Qx/Y23cP4x7WMoYs6rFbH9g/KNIl7vpGVbFJH2KHFsilOX+N5KLADq4CpFx9gR3geHIpHaHHTjvKY95SWYEIvnxFjmtAw5p/8pxJrrS8N04jOoSelqhFpxuPRC181HhOTdzkx3w8wo+ujIxQMAcnZENCycjaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CSDLvBS3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pgf1CxYD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CSDLvBS3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pgf1CxYD"
Message-ID: <20250429065421.771476066@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=tJZIepXVGTfxsjDYJGDWC0tG+TVomFfCu/lJ+mn8OZE=;
	b=CSDLvBS3gfKA9C63WL+xU2fA8QoE0UUslXRBlIj7Xs9N8uHTxQFc4BnQa0l2pGVo3Uk7wi
	3Y5B2EcAEstZ046GJos056gDaZq3jd4tQempuzBi0BqEYvw6cAojU4YB4sH6LNCm/IlazN
	x8M15eUSEBm6DYfc6k6Wf3nd+hjURAm+z8upzYoajCOZ+BAUb/ff5lB5XtJHAdOk5PR6/b
	I/b9Peb5thEddHpRsjmgvR1HhPE1NW112yd5pXij0LQx2LvSTLMufRvNXnuhqcYZ7fuOJs
	hBwtbvGKBAjAbWWgewaYOqcGSJZfVgK0c4r3CtmjyQMWKdgPDo3d1DQyxXA90Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=tJZIepXVGTfxsjDYJGDWC0tG+TVomFfCu/lJ+mn8OZE=;
	b=pgf1CxYDmFUdlZRREVNHKLCIPGHKZdvvr20gITyo1wLEEGD3EpuaXRj3YsqcYeiBaBzTef
	K6DRiqzTfTxvTXBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 29/45] genirq/manage: Convert to lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:31 +0200 (CEST)

Convert lock/unlock pairs to guards.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |  155 +++++++++++++++++++---------------------------------
 1 file changed, 58 insertions(+), 97 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -41,8 +41,6 @@ static void __synchronize_hardirq(struct
 	bool inprogress;
 
 	do {
-		unsigned long flags;
-
 		/*
 		 * Wait until we're out of the critical section.  This might
 		 * give the wrong answer due to the lack of memory barriers.
@@ -51,7 +49,7 @@ static void __synchronize_hardirq(struct
 			cpu_relax();
 
 		/* Ok, that indicated we're done: double-check carefully. */
-		raw_spin_lock_irqsave(&desc->lock, flags);
+		guard(raw_spinlock_irqsave)(&desc->lock);
 		inprogress = irqd_irq_inprogress(&desc->irq_data);
 
 		/*
@@ -67,8 +65,6 @@ static void __synchronize_hardirq(struct
 			__irq_get_irqchip_state(irqd, IRQCHIP_STATE_ACTIVE,
 						&inprogress);
 		}
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
-
 		/* Oops, that failed? */
 	} while (inprogress);
 }
@@ -456,16 +452,12 @@ static int __irq_set_affinity(unsigned i
 			      bool force)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
-	unsigned long flags;
-	int ret;
 
 	if (!desc)
 		return -EINVAL;
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	ret = irq_set_affinity_locked(irq_desc_get_irq_data(desc), mask, force);
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-	return ret;
+	guard(raw_spinlock_irqsave)(&desc->lock);
+	return irq_set_affinity_locked(irq_desc_get_irq_data(desc), mask, force);
 }
 
 /**
@@ -520,17 +512,16 @@ static void irq_affinity_notify(struct w
 		container_of(work, struct irq_affinity_notify, work);
 	struct irq_desc *desc = irq_to_desc(notify->irq);
 	cpumask_var_t cpumask;
-	unsigned long flags;
 
 	if (!desc || !alloc_cpumask_var(&cpumask, GFP_KERNEL))
 		goto out;
 
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
 
 	notify->notify(notify, cpumask);
 
@@ -554,7 +545,6 @@ int irq_set_affinity_notifier(unsigned i
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 	struct irq_affinity_notify *old_notify;
-	unsigned long flags;
 
 	/* The release function is promised process context */
 	might_sleep();
@@ -569,10 +559,10 @@ int irq_set_affinity_notifier(unsigned i
 		INIT_WORK(&notify->work, irq_affinity_notify);
 	}
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	old_notify = desc->affinity_notify;
-	desc->affinity_notify = notify;
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
+		old_notify = desc->affinity_notify;
+		desc->affinity_notify = notify;
+	}
 
 	if (old_notify) {
 		if (cancel_work_sync(&old_notify->work)) {
@@ -593,7 +583,8 @@ EXPORT_SYMBOL_GPL(irq_set_affinity_notif
 int irq_setup_affinity(struct irq_desc *desc)
 {
 	struct cpumask *set = irq_default_affinity;
-	int ret, node = irq_desc_get_node(desc);
+	int node = irq_desc_get_node(desc);
+
 	static DEFINE_RAW_SPINLOCK(mask_lock);
 	static struct cpumask mask;
 
@@ -601,7 +592,7 @@ int irq_setup_affinity(struct irq_desc *
 	if (!__irq_can_set_affinity(desc))
 		return 0;
 
-	raw_spin_lock(&mask_lock);
+	guard(raw_spinlock)(&mask_lock);
 	/*
 	 * Preserve the managed affinity setting and a userspace affinity
 	 * setup, but make sure that one of the targets is online.
@@ -626,9 +617,7 @@ int irq_setup_affinity(struct irq_desc *
 		if (cpumask_intersects(&mask, nodemask))
 			cpumask_and(&mask, &mask, nodemask);
 	}
-	ret = irq_do_set_affinity(&desc->irq_data, &mask, false);
-	raw_spin_unlock(&mask_lock);
-	return ret;
+	return irq_do_set_affinity(&desc->irq_data, &mask, false);
 }
 #else
 /* Wrapper for ALPHA specific affinity selector magic */
@@ -1070,19 +1059,19 @@ static void irq_thread_check_affinity(st
 		return;
 	}
 
-	raw_spin_lock_irq(&desc->lock);
-	/*
-	 * This code is triggered unconditionally. Check the affinity
-	 * mask pointer. For CPU_MASK_OFFSTACK=n this is optimized out.
-	 */
-	if (cpumask_available(desc->irq_common_data.affinity)) {
-		const struct cpumask *m;
+	scoped_guard(raw_spinlock_irq, &desc->lock) {
+		/*
+		 * This code is triggered unconditionally. Check the affinity
+		 * mask pointer. For CPU_MASK_OFFSTACK=n this is optimized out.
+		 */
+		if (cpumask_available(desc->irq_common_data.affinity)) {
+			const struct cpumask *m;
 
-		m = irq_data_get_effective_affinity_mask(&desc->irq_data);
-		cpumask_copy(mask, m);
-		valid = true;
+			m = irq_data_get_effective_affinity_mask(&desc->irq_data);
+			cpumask_copy(mask, m);
+			valid = true;
+		}
 	}
-	raw_spin_unlock_irq(&desc->lock);
 
 	if (valid)
 		set_cpus_allowed_ptr(current, mask);
@@ -1250,9 +1239,8 @@ static void irq_wake_secondary(struct ir
 	if (WARN_ON_ONCE(!secondary))
 		return;
 
-	raw_spin_lock_irq(&desc->lock);
+	guard(raw_spinlock_irq)(&desc->lock);
 	__irq_wake_thread(desc, secondary);
-	raw_spin_unlock_irq(&desc->lock);
 }
 
 /*
@@ -1333,12 +1321,11 @@ void irq_wake_thread(unsigned int irq, v
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 	struct irqaction *action;
-	unsigned long flags;
 
 	if (!desc || WARN_ON(irq_settings_is_per_cpu_devid(desc)))
 		return;
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	guard(raw_spinlock_irqsave)(&desc->lock);
 	for_each_action_of_desc(desc, action) {
 		if (action->dev_id == dev_id) {
 			if (action->thread)
@@ -1346,7 +1333,6 @@ void irq_wake_thread(unsigned int irq, v
 			break;
 		}
 	}
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
 }
 EXPORT_SYMBOL_GPL(irq_wake_thread);
 
@@ -1977,9 +1963,8 @@ static struct irqaction *__free_irq(stru
 		 * There is no interrupt on the fly anymore. Deactivate it
 		 * completely.
 		 */
-		raw_spin_lock_irqsave(&desc->lock, flags);
-		irq_domain_deactivate_irq(&desc->irq_data);
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
+		scoped_guard(raw_spinlock_irqsave, &desc->lock)
+			irq_domain_deactivate_irq(&desc->irq_data);
 
 		irq_release_resources(desc);
 		chip_bus_sync_unlock(desc);
@@ -2064,8 +2049,6 @@ static const void *__cleanup_nmi(unsigne
 const void *free_nmi(unsigned int irq, void *dev_id)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
-	unsigned long flags;
-	const void *devname;
 
 	if (!desc || WARN_ON(!irq_is_nmi(desc)))
 		return NULL;
@@ -2077,14 +2060,9 @@ const void *free_nmi(unsigned int irq, v
 	if (WARN_ON(desc->depth == 0))
 		disable_nmi_nosync(irq);
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
-
+	guard(raw_spinlock_irqsave)(&desc->lock);
 	irq_nmi_teardown(desc);
-	devname = __cleanup_nmi(irq, desc);
-
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-
-	return devname;
+	return __cleanup_nmi(irq, desc);
 }
 
 /**
@@ -2288,7 +2266,6 @@ int request_nmi(unsigned int irq, irq_ha
 {
 	struct irqaction *action;
 	struct irq_desc *desc;
-	unsigned long flags;
 	int retval;
 
 	if (irq == IRQ_NOTCONNECTED)
@@ -2330,21 +2307,17 @@ int request_nmi(unsigned int irq, irq_ha
 	if (retval)
 		goto err_irq_setup;
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
-
-	/* Setup NMI state */
-	desc->istate |= IRQS_NMI;
-	retval = irq_nmi_setup(desc);
-	if (retval) {
-		__cleanup_nmi(irq, desc);
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
-		return -EINVAL;
+	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
+		/* Setup NMI state */
+		desc->istate |= IRQS_NMI;
+		retval = irq_nmi_setup(desc);
+		if (retval) {
+			__cleanup_nmi(irq, desc);
+			return -EINVAL;
+		}
+		return 0;
 	}
 
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-
-	return 0;
-
 err_irq_setup:
 	irq_chip_pm_put(&desc->irq_data);
 err_out:
@@ -2443,43 +2416,34 @@ static struct irqaction *__free_percpu_i
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 	struct irqaction *action;
-	unsigned long flags;
 
 	WARN(in_interrupt(), "Trying to free IRQ %d from IRQ context!\n", irq);
 
 	if (!desc)
 		return NULL;
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
+		action = desc->action;
+		if (!action || action->percpu_dev_id != dev_id) {
+			WARN(1, "Trying to free already-free IRQ %d\n", irq);
+			return NULL;
+		}
 
-	action = desc->action;
-	if (!action || action->percpu_dev_id != dev_id) {
-		WARN(1, "Trying to free already-free IRQ %d\n", irq);
-		goto bad;
-	}
+		if (!cpumask_empty(desc->percpu_enabled)) {
+			WARN(1, "percpu IRQ %d still enabled on CPU%d!\n",
+			     irq, cpumask_first(desc->percpu_enabled));
+			return NULL;
+		}
 
-	if (!cpumask_empty(desc->percpu_enabled)) {
-		WARN(1, "percpu IRQ %d still enabled on CPU%d!\n",
-		     irq, cpumask_first(desc->percpu_enabled));
-		goto bad;
+		/* Found it - now remove it from the list of entries: */
+		desc->action = NULL;
+		desc->istate &= ~IRQS_NMI;
 	}
 
-	/* Found it - now remove it from the list of entries: */
-	desc->action = NULL;
-
-	desc->istate &= ~IRQS_NMI;
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
 
 /**
@@ -2649,7 +2613,6 @@ int request_percpu_nmi(unsigned int irq,
 {
 	struct irqaction *action;
 	struct irq_desc *desc;
-	unsigned long flags;
 	int retval;
 
 	if (!handler)
@@ -2685,10 +2648,8 @@ int request_percpu_nmi(unsigned int irq,
 	if (retval)
 		goto err_irq_setup;
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	guard(raw_spinlock_irqsave)(&desc->lock);
 	desc->istate |= IRQS_NMI;
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-
 	return 0;
 
 err_irq_setup:



