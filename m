Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6F429E05D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909715; cv=none; b=DxNCBvzXIuLjtfcpw4ZKKMe0+UNDe+Fc9OCfIxTnmKa38bVKl6pK5uhPrRcvQcOBilSFUYo4oEag/2E/KvsQ4BDBJH+T67fHpBNSCVKaPGuHnvl2bpSGQKOPfc2TLPLDs1osvLOfiIRmymgOpUhwePP7gPjoumvDHwvLkbIdU+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909715; c=relaxed/simple;
	bh=JY55ckGPun0VFenj+VGvTxnmtiBk05Qfzvupa8ijVCk=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=TukVmThEDQVecIAbBOROyB1+DUfzFB4twcPV+FJXhQppSwfYBAfrX86j67yE5oXj5ByvkwB864CvwdelAEzfDkzQ5AMKWEOKuH33BzBLsmEkkmBwnq49FjzdcqZU2UYBfengJ0v9cLpai21UzhkUqfEGWTkxbO4L6FF/ajn2pFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MZ1fYCDn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HxjN2Emm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MZ1fYCDn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HxjN2Emm"
Message-ID: <20250429065420.986002418@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=En6C3bol8LI9sAhXjlJqBpxjtJUTEi/+UmlYb37p1m0=;
	b=MZ1fYCDnF2HEr6HLJ9UTYVH5iOep70Qd96CRNlfG9JOVSsJ8E2LH9lM7vE10acDq2BkNvL
	Be5bejF4iVmyEbF8wkd0qQFymSVZ9tQD32Sxq5qxrTuYoLFdMFvjfiWoWlejmXC4Onbxn1
	Wbla15LpXO2/pn/GY4TOcEIkX2qiUXL2MSzkmtBxe5xaq5dhmg9NIHvDtkar9JKdzKhsUt
	wEOUO8bnc8Z37oCj3OZ9QO94QB4ZD6t1DuV1gCJagWmIL9c6yrn2ayec7DEFysZSdLDSZV
	d3MDUYEqRYlQn9vTNUYUkuG6OupiJadZouRy/6fD8z/LhHovlYlGdCDdaoCybw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=En6C3bol8LI9sAhXjlJqBpxjtJUTEi/+UmlYb37p1m0=;
	b=HxjN2EmmqUkW7ONqtmPlfuyAEojSt31LNnBLZ+H9oJrpRhzdtLqGp5uEXf27TxI3HG6tiO
	7IiIbQIHU5bpJnDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 16/45] genirq/chip: Rework handle_eoi_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:11 +0200 (CEST)

Use the new helpers to decide whether the interrupt should be handled and
switch the descriptor locking to guard().

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   42 ++++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -653,20 +653,26 @@ static void cond_unmask_eoi_irq(struct i
 	}
 }
 
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
 	struct irq_chip *chip = desc->irq_data.chip;
 
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
 
 	/*
 	 * When an affinity change races with IRQ handling, the next interrupt
@@ -676,19 +682,14 @@ void handle_fasteoi_irq(struct irq_desc
 	if (!irq_can_handle_pm(desc)) {
 		if (irqd_needs_resend_when_in_progress(&desc->irq_data))
 			desc->istate |= IRQS_PENDING;
-		goto out;
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
 	}
 
-	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
-
-	/*
-	 * If its disabled or no action available
-	 * then mask it and get out of here:
-	 */
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |= IRQS_PENDING;
+	if (!irq_can_handle_actions(desc)) {
 		mask_irq(desc);
-		goto out;
+		cond_eoi_irq(chip, &desc->irq_data);
+		return;
 	}
 
 	kstat_incr_irqs_this_cpu(desc);
@@ -704,13 +705,6 @@ void handle_fasteoi_irq(struct irq_desc
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
 



