Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035D82C60
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751640130; cv=none; b=Cg9PpFE3ZEcP9yQhy5eJCic+SQUu+V65aIaviqJTRDbLoiDeFIV+yWOi6RkJWDVUsNglLPvQd+0kdOeDk2u4ceD/vVj30tc9upUQ73sRMktkn6KWora/T65lfiwyTTlRAlcvXCuvfgmfLi56sp5PBoTzyTWAhQHKtbzHtjmU/4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751640130; c=relaxed/simple;
	bh=jzgzIQq0NH4+dITKH3aVitK0r0MrqcavKPuI2SyGzn0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=stcUfSLtS6u6Zbb3saMziloBpA2pN0w/9C1VDB6M0hHXmlTmklyvqFM6QRS4+q30yBe6ifyB6RejKWzbYcFpWd6bOc6tjULtc8YAJEXtdzFAWge4QMVk9bLhEbqEQKQ7hwPxC6qrC25i9kCR87kSj7QuOzdO19C7mRMgNfZC5h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yaR+7889; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kftSKAmB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yaR+7889";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kftSKAmB"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751640127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sSgQN4gJVEWaNIRhXA+y1OBK57ub0h1qW04DyZY6zjU=;
	b=yaR+7889iuwJ5A88AN/6HXjeBYR7g+sWKg6oat+0Nr7KgD2ZGZdh1kbghOlHPWcRw9q5H/
	+raWh7gAb784yOtJknp6a1rahA2FI/GtBOVvAmU9nuyZVC9WKLTMFAfW6Z7wAJRAuLTfb0
	+6hBMkLr3Po1sILn2Y8LgQZKAjyNLvZMNJCQC3YAk9RkVit4tNSgtusMYBJWj+oyNNWz55
	YmfmRUd4IJtO2J8/ISjPUeSIX8+41p0z+aObbHA7AGFHtFzAU0f/oM1TNpgcarwKRvxagj
	Thm5TpG0ArDYYlapcQdZQhC2I+wTgia5hwyUBAd1wt1wocO3LP0IY7SysJJynQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751640127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sSgQN4gJVEWaNIRhXA+y1OBK57ub0h1qW04DyZY6zjU=;
	b=kftSKAmBXqys+FPHPw1WUuL49oeJwSAAbZ8huoBe0PaTtHzbp4bdM27W7Yls65eR87CkMd
	jAlmrGVVfbhva1CQ==
To: Liangyan <liangyan.peng@bytedance.com>
Cc: linux-kernel@vger.kernel.org, Yicong Shen
 <shenyicong.1023@bytedance.com>, ziqianlu@bytedance.com,
 songmuchun@bytedance.com, yuanzhu@bytedance.com
Subject: Re: [External] Re: [RFC] genirq: Fix lockup in handle_edge_irq
In-Reply-To: <f3608ef2-1d9f-406c-92f3-fa69486e1644@google.com>
References: <20250701163558.2588435-1-liangyan.peng@bytedance.com>
 <87a55mlok9.ffs@tglx> <f3608ef2-1d9f-406c-92f3-fa69486e1644@google.com>
Date: Fri, 04 Jul 2025 16:42:05 +0200
Message-ID: <87o6u0rpaa.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Liangyan!

Please don't top post and trim your reply. See:

  https://people.kernel.org/tglx/notes-about-netiquette

for further explanation.

On Thu, Jul 03 2025 at 23:31, Liangyan wrote:
> We have this softlockup issue in guest vm, so the related IRQ is from 
> virtio-net tx queue, the interrupt controller is virt pci msix 
> controller, related components have pci_msi_controller, virtio_pci, 
> virtio_net and qemu.

That's a random list of pieces, which are not necessarily related to the
interrupt control flow. You have to look at the actual interrupt domain
hierarchy of the interrupt in question. /sys/kernel/debug/irq/irqs/$N.

> And according to qemu msix.c source code, when irq is unmasked, it will 
> fire new one if the msix pending bit is set.
> Seems that for msi-x controller, it will not lose interrupt during 
> unmask period.

That's correct and behaving according to specification. Though
unfortunately not all PCI-MSI-X implementations are specification
compliant, so we can't do that unconditionally. There is also no way to
detect whether there is a sane implementation in the hardware
[emulation] or not.

So playing games with the unmask is not really feasible. But let's take
a step back and look at the actual problem.

It only happens when the interrupt affinity is moved or the interrupt
has multiple target CPUs enabled in the effective affinity mask. x86 and
arm64 enforce the effective affinity to be a single CPU, so on those
architectures the problem only arises when the interrupt affinity
changes.

Now we can use that fact and check whether the CPU, which observes
INPROGRESS, is the target CPU in the effective affinity mask. If so,
then the obvious cure is to busy poll the INPROGRESS flag instead of
doing the mask()/PENDING/unmask() dance.

Something like the uncompiled and therefore untested patch below should
do the trick. If you find bugs in it, you can keep and fix them :)

Thanks,

        tglx
---
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -449,22 +449,31 @@ void unmask_threaded_irq(struct irq_desc
 	unmask_irq(desc);
 }
 
-static bool irq_check_poll(struct irq_desc *desc)
+/* Busy wait until INPROGRESS is cleared */
+static bool irq_wait_on_inprogress(struct irq_desc *desc)
 {
-	if (!(desc->istate & IRQS_POLL_INPROGRESS))
-		return false;
-	return irq_wait_for_poll(desc);
+	if (IS_ENABLED(CONFIG_SMP)) {
+		do {
+			raw_spin_unlock(&desc->lock);
+			while (irqd_irq_inprogress(&desc->irq_data))
+				cpu_relax();
+			raw_spin_lock(&desc->lock);
+		} while (irqd_irq_inprogress(&desc->irq_data));
+	}
+	/* Might have been disabled in meantime */
+	return !irqd_irq_disabled(&desc->irq_data) && desc->action;
 }
 
 static bool irq_can_handle_pm(struct irq_desc *desc)
 {
-	unsigned int mask = IRQD_IRQ_INPROGRESS | IRQD_WAKEUP_ARMED;
+	struct irq_data *irqd = &desc->irq_data;
+	const struct cpumask *aff;
 
 	/*
 	 * If the interrupt is not in progress and is not an armed
 	 * wakeup interrupt, proceed.
 	 */
-	if (!irqd_has_set(&desc->irq_data, mask))
+	if (!irqd_has_set(irqd, IRQD_IRQ_INPROGRESS | IRQD_WAKEUP_ARMED))
 		return true;
 
 	/*
@@ -472,13 +481,53 @@ static bool irq_can_handle_pm(struct irq
 	 * and suspended, disable it and notify the pm core about the
 	 * event.
 	 */
-	if (irq_pm_check_wakeup(desc))
+	if (unlikely(irqd_has_set(irqd, IRQD_WAKEUP_ARMED))) {
+		irq_pm_handle_wakeup(desc);
+		return false;
+	}
+
+	/* Check whether the interrupt is polled on another CPU */
+	if (unlikely(desc->istate & IRQS_POLL_INPROGRESS)) {
+		if (WARN_ONCE(irq_poll_cpu == smp_processor_id(),
+			      "irq poll in progress on cpu %d for irq %d\n",
+			      smp_processor_id(), desc->irq_data.irq))
+			return false;
+		return irq_wait_on_inprogress(desc);
+	}
+
+	if (!IS_ENABLED(CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK) ||
+	    !irqd_is_single_target(irqd) || desc->handle_irq != handle_edge_irq)
 		return false;
 
 	/*
-	 * Handle a potential concurrent poll on a different core.
+	 * If the interrupt affinity was moved to this CPU and the
+	 * interrupt is currently handled on the previous target CPU, then
+	 * busy wait for INPROGRESS to be cleared. Otherwise for edge type
+	 * interrupts the handler might get stuck on the previous target:
+	 *
+	 * CPU 0			CPU 1 (new target)
+	 * handle_edge_irq()
+	 * repeat:
+	 *	handle_event()		handle_edge_irq()
+	 *			        if (INPROGESS) {
+	 *				  set(PENDING);
+	 *				  mask();
+	 *				  return;
+	 *				}
+	 *	if (PENDING) {
+	 *	  clear(PENDING);
+	 *	  unmask();
+	 *	  goto repeat;
+	 *	}
+	 *
+	 * This happens when the device raises interrupts with a high rate
+	 * and always before handle_event() completes and the CPU0 handler
+	 * can clear INPROGRESS. This has been observed in virtual machines.
 	 */
-	return irq_check_poll(desc);
+	aff = irq_data_get_effective_affinity_mask(irqd);
+	if (cpumask_first(aff) != smp_processor_id())
+		return false;
+	return irq_wait_on_inprogress(desc);
 }
 
 static inline bool irq_can_handle_actions(struct irq_desc *desc)
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -20,6 +20,7 @@
 #define istate core_internal_state__do_not_mess_with_it
 
 extern bool noirqdebug;
+extern int irq_poll_cpu;
 
 extern struct irqaction chained_action;
 
@@ -112,7 +113,6 @@ irqreturn_t handle_irq_event(struct irq_
 int check_irq_resend(struct irq_desc *desc, bool inject);
 void clear_irq_resend(struct irq_desc *desc);
 void irq_resend_init(struct irq_desc *desc);
-bool irq_wait_for_poll(struct irq_desc *desc);
 void __irq_wake_thread(struct irq_desc *desc, struct irqaction *action);
 
 void wake_threads_waitq(struct irq_desc *desc);
@@ -277,11 +277,11 @@ static inline bool irq_is_nmi(struct irq
 }
 
 #ifdef CONFIG_PM_SLEEP
-bool irq_pm_check_wakeup(struct irq_desc *desc);
+void irq_pm_handle_wakeup(struct irq_desc *desc);
 void irq_pm_install_action(struct irq_desc *desc, struct irqaction *action);
 void irq_pm_remove_action(struct irq_desc *desc, struct irqaction *action);
 #else
-static inline bool irq_pm_check_wakeup(struct irq_desc *desc) { return false; }
+static inline void irq_pm_handle_wakeup(struct irq_desc *desc) { }
 static inline void
 irq_pm_install_action(struct irq_desc *desc, struct irqaction *action) { }
 static inline void
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -13,17 +13,13 @@
 
 #include "internals.h"
 
-bool irq_pm_check_wakeup(struct irq_desc *desc)
+void irq_pm_handle_wakeup(struct irq_desc *desc)
 {
-	if (irqd_is_wakeup_armed(&desc->irq_data)) {
-		irqd_clear(&desc->irq_data, IRQD_WAKEUP_ARMED);
-		desc->istate |= IRQS_SUSPENDED | IRQS_PENDING;
-		desc->depth++;
-		irq_disable(desc);
-		pm_system_irq_wakeup(irq_desc_get_irq(desc));
-		return true;
-	}
-	return false;
+	irqd_clear(&desc->irq_data, IRQD_WAKEUP_ARMED);
+	desc->istate |= IRQS_SUSPENDED | IRQS_PENDING;
+	desc->depth++;
+	irq_disable(desc);
+	pm_system_irq_wakeup(irq_desc_get_irq(desc));
 }
 
 /*
--- a/kernel/irq/spurious.c
+++ b/kernel/irq/spurious.c
@@ -19,45 +19,10 @@ static int irqfixup __read_mostly;
 #define POLL_SPURIOUS_IRQ_INTERVAL (HZ/10)
 static void poll_spurious_irqs(struct timer_list *unused);
 static DEFINE_TIMER(poll_spurious_irq_timer, poll_spurious_irqs);
-static int irq_poll_cpu;
+int irq_poll_cpu;
 static atomic_t irq_poll_active;
 
 /*
- * We wait here for a poller to finish.
- *
- * If the poll runs on this CPU, then we yell loudly and return
- * false. That will leave the interrupt line disabled in the worst
- * case, but it should never happen.
- *
- * We wait until the poller is done and then recheck disabled and
- * action (about to be disabled). Only if it's still active, we return
- * true and let the handler run.
- */
-bool irq_wait_for_poll(struct irq_desc *desc)
-{
-	lockdep_assert_held(&desc->lock);
-
-	if (WARN_ONCE(irq_poll_cpu == smp_processor_id(),
-		      "irq poll in progress on cpu %d for irq %d\n",
-		      smp_processor_id(), desc->irq_data.irq))
-		return false;
-
-#ifdef CONFIG_SMP
-	do {
-		raw_spin_unlock(&desc->lock);
-		while (irqd_irq_inprogress(&desc->irq_data))
-			cpu_relax();
-		raw_spin_lock(&desc->lock);
-	} while (irqd_irq_inprogress(&desc->irq_data));
-	/* Might have been disabled in meantime */
-	return !irqd_irq_disabled(&desc->irq_data) && desc->action;
-#else
-	return false;
-#endif
-}
-
-
-/*
  * Recovery handler for misrouted interrupts.
  */
 static bool try_one_irq(struct irq_desc *desc, bool force)


