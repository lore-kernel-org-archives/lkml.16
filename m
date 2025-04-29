Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F282BCF61
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909718; cv=none; b=SxOuh4SPAmZxFCnAPVqdYjhmIbfTZ+6C0UyULpCgettSpqRQ3MsYVkKSVjNThaK0ZPO4EoA3vrlG5WZtOVzgMaRQDGhaWFua1U/AknA2ClR5rNp0Vwurf8laY1uQoVU4amUDrxkanqUGsN1sJLev3JPOCWdrHdZ5UkGUoQyu4vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909718; c=relaxed/simple;
	bh=DbnTL4qlJcYqzE7rRzgjCwtX1JxogP9NhfoJkwo0RAA=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=u/E2CMqRoZairYOGRQFh+zezDcHqB4m8g+B5MWNpTefved8jftIqkW5W5d5N9IH/gQ04qA/eltv+6uOqismuTUqrcSyzDocxP9Dk6gOtK3Jmhy8Kn9CB9ctFVSBZC2/alTxh5CfH0+D+rF2oXditkPyi3QGeZi8lPD58tisoHMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F/QJobC6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N+2GAs4J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F/QJobC6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N+2GAs4J"
Message-ID: <20250429065421.105015800@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lGutETkITAVxGTPxI1jmGIcy6NGL7xFgPOTePO5qpzc=;
	b=F/QJobC6Jju23iJFpIMnyrP90p0XCRcu7dLF9Tr8s/ugSZ3SsoGsvNJhy5wi6uw6yAk7sf
	4AixrqDD5/6vcImKizRG/wKF87W/FRCGQV/KHDbi70gSlAA/xFbwTKo9udiM664AbXD1gV
	/pWcntNgz/NJ1G773/SguEFEPENXX90r1M+LCAhGk7/4dGGVQdwnZEoXYgUd0+FNdxj3zn
	d+epYFYmFdbrH7JT5GEUBo1X/FDzdBggygiAMYoSJohmhtWKEuPb8NKUNRhVMH6YXhQnRH
	k1g7J4p9Y++tt4bZYDeTK5Ob0gFuFivZqTNQEVIIrBgcYiQs8jNWIDh6899TTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lGutETkITAVxGTPxI1jmGIcy6NGL7xFgPOTePO5qpzc=;
	b=N+2GAs4JSsMSeh1E5Ao+cyC2k0cEe4r9KZB75u9sQ1vmykS+BitTf3bNLjVCBiEN79Jzw5
	Faw1BF4PIagbDQAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 18/45] genirq/chip: Rework handle_fasteoi_ack_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:14 +0200 (CEST)

Use the new helpers to decide whether the interrupt should be handled and
switch the descriptor locking to guard().

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   39 +++++++++++++--------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1138,53 +1138,40 @@ void irq_cpu_offline(void)
 
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
 	struct irq_chip *chip = desc->irq_data.chip;
 
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
 
-	if (!irq_can_handle_pm(desc))
-		goto out;
-
-	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
+	if (!irq_can_handle_pm(desc)) {
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
+	}
 
-	/*
-	 * If its disabled or no action available
-	 * then mask it and get out of here:
-	 */
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |= IRQS_PENDING;
+	if (unlikely(!irq_can_handle_actions(desc))) {
 		mask_irq(desc);
-		goto out;
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
 	}
 
 	kstat_incr_irqs_this_cpu(desc);
 	if (desc->istate & IRQS_ONESHOT)
 		mask_irq(desc);
 
-	/* Start handling the irq */
 	desc->irq_data.chip->irq_ack(&desc->irq_data);
 
 	handle_irq_event(desc);
 
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
 



