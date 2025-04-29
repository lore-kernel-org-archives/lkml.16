Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEEA2BCF7A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909719; cv=none; b=JkZJ9trq5shF31bEd6H17Xgq1abdKrRAgWABEfzfLLq7XfIfB6aN5nxyr5XfpLoHYD76Kcjd80gPWRXA8eImpGqWQz9HQ0a6W/Z0RSQOtITgFFCBD+1pYt1ry/pU8vm1RN0GX9hgQtOvF8orebChI95/YyInW07J+asQwb3vL00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909719; c=relaxed/simple;
	bh=9vjPmHuG3NR0cykd0xsQqHx6qyFaDhu555aHQFVhs4E=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=ElA/4fbc8Z7/U2EFU23NQZ4mcRZX69uDSh/pV7CAVletRxbOTpTSpWfONX7lbA0G8Uyl5zk+YvVEh6S/62xyCoseBGUHC4ByAwculJW5M9CJS9kt3VWgyjIdjbJOgRUt0m+N3LbIxtn6ahEpByzoXJqV/bU139HLe8OZMKi+A9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EfFXVQAB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b2AsClC4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EfFXVQAB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b2AsClC4"
Message-ID: <20250429065421.175652864@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=FioYXungJwAP0LQRkaMmnkXo8H1/6MehVCSXXKb8ffc=;
	b=EfFXVQAB2YTPX7spVciHCh2sexAEVuPggJJwoWHApWVEAnV+6/U9G848ruO6as1ahS3Vif
	dZbBRmvyZm9iqaHlcES6BeiMxt6G4Hcb4kryBbO+g+YfmHzNFiG0rHemPKUFnV0eGh73YO
	1x2W/Nxc3p3yNeguq0N6brJZCGto5wMITTSqc90Lr+SNblZ3spwtahCZipPG9JeviArvp9
	cjr8iHbvzLFdCuaFa3Q0gB3lchLPfDkWDX8G/p0qveY4N8nNApE2Qq0UUVusp0xjsjbui+
	YCHwRHuXpOpCHYzaF5Iu2TWmuCaNOXyvm5IIut9YCvKhtL2UYCMsIVmPu9Gwrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=FioYXungJwAP0LQRkaMmnkXo8H1/6MehVCSXXKb8ffc=;
	b=b2AsClC4s5HcR2Xw5QErNH5+EO9WP/UBpXJTD2IA5FmznVmv4KxkDd0c22SDE4p0Dh2i0N
	YEEron+mPUPkgnAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 19/45] genirq/chip: Rework handle_fasteoi_mask_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:16 +0200 (CEST)

Use the new helpers to decide whether the interrupt should be handled and
switch the descriptor locking to guard().

Note: The mask_irq() operation in the second condition was redundant as the
interrupt is already masked right at the beginning of the function.

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1176,51 +1176,31 @@ void handle_fasteoi_ack_irq(struct irq_d
 EXPORT_SYMBOL_GPL(handle_fasteoi_ack_irq);
 
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
 	struct irq_chip *chip = desc->irq_data.chip;
 
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
 	mask_ack_irq(desc);
 
-	if (!irq_can_handle_pm(desc))
-		goto out;
-
-	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
-
-	/*
-	 * If its disabled or no action available
-	 * then mask it and get out of here:
-	 */
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |= IRQS_PENDING;
-		mask_irq(desc);
-		goto out;
+	if (!irq_can_handle(desc)) {
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
 	}
 
 	kstat_incr_irqs_this_cpu(desc);
-	if (desc->istate & IRQS_ONESHOT)
-		mask_irq(desc);
 
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
 EXPORT_SYMBOL_GPL(handle_fasteoi_mask_irq);
 



