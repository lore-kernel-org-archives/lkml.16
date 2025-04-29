Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF8829DB7B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909712; cv=none; b=N2/PkCzjviQi+kYXZ42GvUUlm38Cn31pHbylGwgB48Caibm1l9hYVAy/B8/PCnWjA9dMsCKZjfpAIFzDXQniMmmXrHCj4b6+pwz2aQxKm93PB36J9g4jLLb7EZG7ACTno/EB4phJb2gXk7jhDJoEwCqWD1Yxk2j+3HqDnO7NT6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909712; c=relaxed/simple;
	bh=9ADQ8q4irEqvsLxBjscvDczzPCp3K6JV4Zg7QYDEZTM=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=CL9Qcr4Ae03LgvBIN90F1IKNhaNvBClfZzuyFH2mte25dZriOOk4gaoyyKoVA4Ee0IGyBmvxN/MeHASlo48uHNhWDgSJb7KuBh4oWnHnX3RFhHJDWBxPehanWVAkvPnhvB5AjdYxDjzElPHmmaUMV00pzx6UQ6c4rLM7PjGbZ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EiUNVPWh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nRqEJ0zC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EiUNVPWh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nRqEJ0zC"
Message-ID: <20250429065420.865212916@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/1C8I6OREyZIk5Yy5HonLyBS6RAOxNzQN5SHdHA4gxk=;
	b=EiUNVPWhDYsW/wzEJzLt+tq71AdVtPm8s60OOs9nWU8VhAnae80FZ34TaOj8kZ6uAdRTj+
	FnhMrD9wy58zdehy8/QXTISzfl+HEZ10UH0cBAB+R0GJe/6j1muTu0xc2a91zQSQ70uIOh
	TNsdXHj7CHwyuTAEk8Wofqi1+Zs215so490//woG0jDUe25CBU755vlJxUNsbb4QYrEKIg
	CyMH+eOw62INaeyN4Ev7ghjk8THS/zH1NFQlFAGjo1c7hlrr7AaDemblV0b8MxYSOrisTF
	lS3c1w5Y65FmLpXbJeYuUJbJBk7906rWK2tnWYO/ja3ypOu3mJwDYLsWv5ClxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/1C8I6OREyZIk5Yy5HonLyBS6RAOxNzQN5SHdHA4gxk=;
	b=nRqEJ0zCEluVCBQELyeaHCAbYeKAG3uZHjyOBRAynyLsFk7yWJk1QwVUUilW/M9BMl3viW
	WPCHC/p28WnKGIBg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 14/45] genirq/chip: Rework handle_untracked_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:08 +0200 (CEST)

Use the new helpers to decide whether the interrupt should be handled and
switch the descriptor locking to guard().

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   43 ++++++++++++++++---------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -561,43 +561,32 @@ void handle_simple_irq(struct irq_desc *
 EXPORT_SYMBOL_GPL(handle_simple_irq);
 
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
+	scoped_guard(raw_spinlock, &desc->lock) {
+		if (!irq_can_handle(desc))
+			return;
 
-	if (!irq_can_handle_pm(desc))
-		goto out_unlock;
-
-	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
-
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |= IRQS_PENDING;
-		goto out_unlock;
+		desc->istate &= ~IRQS_PENDING;
+		irqd_set(&desc->irq_data, IRQD_IRQ_INPROGRESS);
 	}
 
-	desc->istate &= ~IRQS_PENDING;
-	irqd_set(&desc->irq_data, IRQD_IRQ_INPROGRESS);
-	raw_spin_unlock(&desc->lock);
-
 	__handle_irq_event_percpu(desc);
 
-	raw_spin_lock(&desc->lock);
-	irqd_clear(&desc->irq_data, IRQD_IRQ_INPROGRESS);
-
-out_unlock:
-	raw_spin_unlock(&desc->lock);
+	scoped_guard(raw_spinlock, &desc->lock)
+		irqd_clear(&desc->irq_data, IRQD_IRQ_INPROGRESS);
 }
 EXPORT_SYMBOL_GPL(handle_untracked_irq);
 



