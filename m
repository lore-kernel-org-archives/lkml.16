Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBF727A939
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909703; cv=none; b=DEDILUccrSRt9LTuShNbkYDZtewJzwbvYl1m/U+Ce4O87Sj75Eo8MVwgojTxmP+I3z6+r4UXYeEsXTJ9UOB2cS/BQh79yHPDR5lgzk+X2oHBSxDakRARKGrViJdctAfzgaNhAcRi1kXfmrD7k/wSu+3N60dyqLlSMqSTfoqWMcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909703; c=relaxed/simple;
	bh=/v+Xz0j5Au5Flc7pmD0k4+c5Q3zYLPRIknNWV/nC/1Y=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=oEIXBJZO8459U39LTzr3qkCGvjPendyppXPoZaLpRNN2cTB6aRrWd0rAvOBFJfyKg77gxkXXeCbTttNK02eXtLRh3W/lE4bQQ7Enf02v7tFrseUIEz4QPHFOz/HW3EwUZsx3lLKNcIgCdovGtIGfC02L4F851VuDqw/JRAzg88E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I3JqWjIC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UYrWv4OS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I3JqWjIC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UYrWv4OS"
Message-ID: <20250429065420.497714413@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EJsNgAsLYnt1Rjy6yLuTAVVOslcX0E45dn2ezz2Rn1c=;
	b=I3JqWjICAaybHZRt0pUktTLrWtDvLfUOOPPkSt/LjIREg9A3nqVNwljdXTATLR6p0SvFRy
	R0Au0WFRuifAJKNe94+r8eybNcTOi8kT5aQrMTJRzOHEUQBbW6WFa4BkKSo/qqso8PeMjr
	gNMIbTIYStYqs/ygjPLOr4pBi7/ycHvnF9m+mXW/vEz4jEtRB0PUCNkYx0CQQvCUS9T7p4
	2YZmmVKUNS7uAPex0Wzl0GV7p4+wglskRDYseAU0BppHn9o3Vv7YFiB/ckVqa9nBEAqV+P
	7iYS+OJZy69R8ybiSNbOe9yij7yype5h0fBfq9kAjMI6pT8FuIbuO69zFk0Djw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EJsNgAsLYnt1Rjy6yLuTAVVOslcX0E45dn2ezz2Rn1c=;
	b=UYrWv4OSTF/55utDOhZIcFhoA3uhovIzXW+9oeg8FAXllFLAHTNkLtffDiKuty2mdiWgrD
	YOOx7fkp6M7fQeDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 08/45] genirq/spurious: Switch to lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:54:59 +0200 (CEST)

Convert all lock/unlock pairs to guards and tidy up the code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/spurious.c |   30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

--- a/kernel/irq/spurious.c
+++ b/kernel/irq/spurious.c
@@ -60,37 +60,35 @@ bool irq_wait_for_poll(struct irq_desc *
 /*
  * Recovery handler for misrouted interrupts.
  */
-static int try_one_irq(struct irq_desc *desc, bool force)
+static bool try_one_irq(struct irq_desc *desc, bool force)
 {
-	irqreturn_t ret = IRQ_NONE;
 	struct irqaction *action;
+	bool ret = false;
 
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
 
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
 
 	/*
 	 * Do not poll disabled interrupts unless the spurious
 	 * disabled poller asks explicitly.
 	 */
 	if (irqd_irq_disabled(&desc->irq_data) && !force)
-		goto out;
+		return false;
 
 	/*
 	 * All handlers must agree on IRQF_SHARED, so we test just the
 	 * first.
 	 */
 	action = desc->action;
-	if (!action || !(action->flags & IRQF_SHARED) ||
-	    (action->flags & __IRQF_TIMER))
-		goto out;
+	if (!action || !(action->flags & IRQF_SHARED) || (action->flags & __IRQF_TIMER))
+		return false;
 
 	/* Already running on another processor */
 	if (irqd_irq_inprogress(&desc->irq_data)) {
@@ -99,21 +97,19 @@ static int try_one_irq(struct irq_desc *
 		 * CPU to go looking for our mystery interrupt too
 		 */
 		desc->istate |= IRQS_PENDING;
-		goto out;
+		return false;
 	}
 
 	/* Mark it poll in progress */
 	desc->istate |= IRQS_POLL_INPROGRESS;
 	do {
 		if (handle_irq_event(desc) == IRQ_HANDLED)
-			ret = IRQ_HANDLED;
+			ret = true;
 		/* Make sure that there is still a valid action */
 		action = desc->action;
 	} while ((desc->istate & IRQS_PENDING) && action);
 	desc->istate &= ~IRQS_POLL_INPROGRESS;
-out:
-	raw_spin_unlock(&desc->lock);
-	return ret == IRQ_HANDLED;
+	return ret;
 }
 
 static int misrouted_irq(int irq)
@@ -192,7 +188,6 @@ static void __report_bad_irq(struct irq_
 {
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct irqaction *action;
-	unsigned long flags;
 
 	if (bad_action_ret(action_ret))
 		pr_err("irq event %d: bogus return value %x\n", irq, action_ret);
@@ -207,14 +202,13 @@ static void __report_bad_irq(struct irq_
 	 * with something else removing an action. It's ok to take
 	 * desc->lock here. See synchronize_irq().
 	 */
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	guard(raw_spinlock_irqsave)(&desc->lock);
 	for_each_action_of_desc(desc, action) {
 		pr_err("[<%p>] %ps", action->handler, action->handler);
 		if (action->thread_fn)
 			pr_cont(" threaded [<%p>] %ps", action->thread_fn, action->thread_fn);
 		pr_cont("\n");
 	}
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
 }
 
 static void report_bad_irq(struct irq_desc *desc, irqreturn_t action_ret)



