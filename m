Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168B9277002
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909697; cv=none; b=CqWf07poQS9bIeSdvTMjIx9b7HOFOzLjuKnIxdxnAh7MUA3UvuhKpa+JiRIpNQcuA/MHSrfbQlPQLPGoMHKSob16ZZgM1mh6QwlUcnF6+2+9SF0lZcxOd3emdpvJXfY0dpljniCqGxKFCQXZCJzu3e7P2mUUNz/40sJdyywEoY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909697; c=relaxed/simple;
	bh=5e8N7AhvOi0OtytDRRtSyTsFfv+PPBlDCnk0DxMSIbE=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=gyheihQ2EJJFP6RzX7CA0IOHGeopqVHd/auNcJOYcSS8KVjFX2cwr1ZkOdpW75hXQivNO+SBwn4nQiQ33z7RkCww7sZV+5BLtECC6SnlfPvQTrPl0BvPf4lhhu0fzOP33kMkGQh6MdbmtYXnxyGCIvvo5JjPLTmXFXpHahj9krI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2WAx6HTO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qwsB585x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2WAx6HTO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qwsB585x"
Message-ID: <20250429065420.251299112@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dzug9PSb1hRGMbAMs5O0DoRZ9PXFq2b5flFpCdZwkw4=;
	b=2WAx6HTOgvruBzHCLLPo267oIajhucSXyc9iahp7kcMNZVwSQnR8pVIukjtNbYRnBMd4GX
	QByhiF+hNeyif0oY1qmKxScWZgVHbtjIzXInIYGBYxCxUerqLEdbCj0nz6upknA1NQpDZq
	PLeokLOUdOHMhxroah3UBjCLq2w5OpJY5CszN/Gu4mjELHcQOtGZgeYYwZgmKPjbKwIfu+
	RfDUbHNMTSIR/RKjlHLARnE9eqbIwkWAQRCn9rfK2sQFGbWfFWXG9TuOWjfehXJn9ey8nQ
	lE0s1dAKtQC/pnyy5LLlypTQcsIMzwM3+Ojy9uZB/XBk5JVJ4eiaOKC5pzgMOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dzug9PSb1hRGMbAMs5O0DoRZ9PXFq2b5flFpCdZwkw4=;
	b=qwsB585xxlLceRAtnhT4OtwZjlzlptdcdCYMh5MVzHmnKKbygcJdAOM2IQVZNAo13mSY2I
	I+ViehBUfmuUp8DA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 04/45] genirq/pm: Switch to lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:54:53 +0200 (CEST)

Convert all lock/unlock pairs to guards and tidy up the code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/pm.c |   38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -46,8 +46,7 @@ void irq_pm_install_action(struct irq_de
 		desc->cond_suspend_depth++;
 
 	WARN_ON_ONCE(desc->no_suspend_depth &&
-		     (desc->no_suspend_depth +
-			desc->cond_suspend_depth) != desc->nr_actions);
+		     (desc->no_suspend_depth + desc->cond_suspend_depth) != desc->nr_actions);
 }
 
 /*
@@ -134,14 +133,12 @@ void suspend_device_irqs(void)
 	int irq;
 
 	for_each_irq_desc(irq, desc) {
-		unsigned long flags;
 		bool sync;
 
 		if (irq_settings_is_nested_thread(desc))
 			continue;
-		raw_spin_lock_irqsave(&desc->lock, flags);
-		sync = suspend_device_irq(desc);
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
+		scoped_guard(raw_spinlock_irqsave, &desc->lock)
+			sync = suspend_device_irq(desc);
 
 		if (sync)
 			synchronize_irq(irq);
@@ -186,18 +183,15 @@ static void resume_irqs(bool want_early)
 	int irq;
 
 	for_each_irq_desc(irq, desc) {
-		unsigned long flags;
-		bool is_early = desc->action &&
-			desc->action->flags & IRQF_EARLY_RESUME;
+		bool is_early = desc->action &&	desc->action->flags & IRQF_EARLY_RESUME;
 
 		if (!is_early && want_early)
 			continue;
 		if (irq_settings_is_nested_thread(desc))
 			continue;
 
-		raw_spin_lock_irqsave(&desc->lock, flags);
+		guard(raw_spinlock_irqsave)(&desc->lock);
 		resume_irq(desc);
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
 	}
 }
 
@@ -207,22 +201,16 @@ static void resume_irqs(bool want_early)
  */
 void rearm_wake_irq(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		struct irq_desc *desc = scoped_irqdesc;
 
-	if (!desc)
-		return;
-
-	if (!(desc->istate & IRQS_SUSPENDED) ||
-	    !irqd_is_wakeup_set(&desc->irq_data))
-		goto unlock;
-
-	desc->istate &= ~IRQS_SUSPENDED;
-	irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
-	__enable_irq(desc);
+		if (!(desc->istate & IRQS_SUSPENDED) || !irqd_is_wakeup_set(&desc->irq_data))
+			return;
 
-unlock:
-	irq_put_desc_busunlock(desc, flags);
+		desc->istate &= ~IRQS_SUSPENDED;
+		irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
+		__enable_irq(desc);
+	}
 }
 
 /**



