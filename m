Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA229E050
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909716; cv=none; b=aOjQxpAxytNqiADIjw9XgZ44zopU4BuC9SO3Zu3O9OrgVwdIM7U5rq30rBHNhO8/+WHO7pw5e0aOV9A2TJc5OG+79bkBaXSe+TjPAbhxr6/CuhqaisCv6fsUk0j8umYf0jnq/gakQL17T8/PA/lXyKllLmRdBfcx2plgbQHvNE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909716; c=relaxed/simple;
	bh=mGCb5zTix+6ZenP8v2HFCcBeJlKvwLORLxBK/RyV4DI=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=pEWo+aKBU7z9ABe03d1AB96OefIQM3GgQetdkDzKSeUu5RaWq/svZ4S8q9xVnDia/dIpFNATpvIhxaBnbUAuk91+ZeNFyhFQiqK7pU2+48QPq5s7u62TxJ1dVRqWs/8PTFIPJTn8Jt5HyVArzHS5UCE3ZcNNipFeyeCeBxGfcqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qhyVDgXY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W50/P351; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qhyVDgXY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W50/P351"
Message-ID: <20250429065421.045492336@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=bRM/R0aUzWZeAfZCtlDdcrEw9RKacHntnf1+QoxDFCA=;
	b=qhyVDgXYG1/A7ISYKyPU14l9raThkpExtaD0YZpedhrNkEGyLK/S8FxpqXet5gOQg72X35
	XvAAG75NVxyd0C/IG6GNIN5ew32VC7KgRhiSqjK9GUe3cvUHhM03jLFQ/GM1A47kKQ2CuD
	fsUXmhKUE7vKLvqX+GYA7tGSv6n2i1V7yCEdcGj35oMX0WVjF88ptlmKEJByGIoix5H7pf
	Qbkyvnq1g3icxfrm9ozheW2S564APeOhIPvQ9Lg6qNisedaqTbK7NubzJOpED3uESXtakJ
	7Vcn9uEBnSkZ0mEy07tJR7bU57YWSbLi/qgEkyKKhkcyP+VpJLbq9wgY2lJlFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=bRM/R0aUzWZeAfZCtlDdcrEw9RKacHntnf1+QoxDFCA=;
	b=W50/P3518dMdO2uYvbKG8Nu03yu1hoJninO35aBHUTFwBcyInW5KTGg0hVBTDG4sL/pA37
	qYknYgxI1L9DrVDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 17/45] genirq/chip: Rework handle_edge_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:13 +0200 (CEST)

Use the new helpers to decide whether the interrupt should be handled and
switch the descriptor locking to guard().

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   49 ++++++++++++++++---------------------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -742,40 +742,27 @@ void handle_fasteoi_nmi(struct irq_desc
 EXPORT_SYMBOL_GPL(handle_fasteoi_nmi);
 
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
+	guard(raw_spinlock)(&desc->lock);
 
-	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
-
-	if (!irq_can_handle_pm(desc)) {
-		desc->istate |= IRQS_PENDING;
-		mask_ack_irq(desc);
-		goto out_unlock;
-	}
-
-	/*
-	 * If its disabled or no action available then mask it and get
-	 * out of here.
-	 */
-	if (irqd_irq_disabled(&desc->irq_data) || !desc->action) {
+	if (!irq_can_handle(desc)) {
 		desc->istate |= IRQS_PENDING;
 		mask_ack_irq(desc);
-		goto out_unlock;
+		return;
 	}
 
 	kstat_incr_irqs_this_cpu(desc);
@@ -786,7 +773,7 @@ void handle_edge_irq(struct irq_desc *de
 	do {
 		if (unlikely(!desc->action)) {
 			mask_irq(desc);
-			goto out_unlock;
+			return;
 		}
 
 		/*
@@ -802,11 +789,7 @@ void handle_edge_irq(struct irq_desc *de
 
 		handle_irq_event(desc);
 
-	} while ((desc->istate & IRQS_PENDING) &&
-		 !irqd_irq_disabled(&desc->irq_data));
-
-out_unlock:
-	raw_spin_unlock(&desc->lock);
+	} while ((desc->istate & IRQS_PENDING) && !irqd_irq_disabled(&desc->irq_data));
 }
 EXPORT_SYMBOL(handle_edge_irq);
 



