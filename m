Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84122275855
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909710; cv=none; b=D2kD+gSQ+X/2YMWp6OGQkHogc9x+DlE0X6HGlpvZCjIW3onIGZBAxwTXchVN7wmdMIcsFqgGE1KsEq82xw0XAsljI3ynEKRgbXCjExte+keybTmAYwyKzlcG9a3CPBByJqJ0zNCaQgWvSB76RNFcKBeaoy2sdSPE6GWKQjVUH1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909710; c=relaxed/simple;
	bh=vQdhMB02L4GMfUK8MWk+sLjTzs62NpK5Bm59ZUweYSM=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=gjDDh45SfPZZ5faLXQFhMR9kls1Q/AdjPjDgrpjgGBTmOjJrfMkRsfwKd6kvVmcw8vqsTkGzMdRChyjQo6lZhdO6Wv06GhE8VlpGcZClF8DMskTFHvEh5+UvQ38uWybSPByj4KhXlZ0G6cgzJSvyFqrudtjIKAkp3WAmO5Sn1m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ARFDm+6K; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=95LXb03J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ARFDm+6K";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="95LXb03J"
Message-ID: <20250429065420.744042890@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Elt7wbsb65w2Qe5D8R4S76SkUL3H0H5hKtbrtwxL6nI=;
	b=ARFDm+6Kf5Uyj5S8beCPR9hjLgHr0BXivrbypI7du0N96JKtYwEwJSVU6DfJ/+XN2mRuhS
	YExfHO+zepiQNNdCXyFY6hHxJmLXHvkBwwnahghPoZK84UWLHzEuflMZ0qhPHGjNeMdt5K
	VD3wT7kEwf4Heu6FOH4SrQVE6hY3gY0kzYqWgDJ+8c8eXWj+Ql6Pm2wFtwj+Mqass66Cfp
	YNUAbuOb7wqB6SVHp2aJpXTS1x/LQtrvqoYzSrDzlfr2JDiUh0o2lL4XKzTe2fs7fYdP1O
	PPzkf87+pTQbG07tlgDSpcPpLR8umLL2rM5AZTG/IfP707lUTvJ1XFbLwF9PEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Elt7wbsb65w2Qe5D8R4S76SkUL3H0H5hKtbrtwxL6nI=;
	b=95LXb03JzMnoq+Ya027eVGF4H5t6x7zfw345kmySsspwOoE0hY+8nLdAPeSVL1PIsiDny4
	GFDWHp7bywQCYpCA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 12/45] genirq/chip: Rework handle_nested_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:05 +0200 (CEST)

Use the new helpers to decide whether the interrupt should be handled and
switch the descriptor locking to guard().

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   78 ++++++++++++++++++++++++------------------------------
 1 file changed, 36 insertions(+), 42 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -450,48 +450,6 @@ void unmask_threaded_irq(struct irq_desc
 	unmask_irq(desc);
 }
 
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
-	struct irq_desc *desc = irq_to_desc(irq);
-	struct irqaction *action;
-	irqreturn_t action_ret;
-
-	might_sleep();
-
-	raw_spin_lock_irq(&desc->lock);
-
-	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
-
-	action = desc->action;
-	if (unlikely(!action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |= IRQS_PENDING;
-		raw_spin_unlock_irq(&desc->lock);
-		return;
-	}
-
-	kstat_incr_irqs_this_cpu(desc);
-	atomic_inc(&desc->threads_active);
-	raw_spin_unlock_irq(&desc->lock);
-
-	action_ret = IRQ_NONE;
-	for_each_action_of_desc(desc, action)
-		action_ret |= action->thread_fn(action->irq, action->dev_id);
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
@@ -544,6 +502,42 @@ static inline bool irq_can_handle(struct
 }
 
 /**
+ * handle_nested_irq - Handle a nested irq from a irq thread
+ * @irq:	the interrupt number
+ *
+ * Handle interrupts which are nested into a threaded interrupt
+ * handler. The handler function is called inside the calling threads
+ * context.
+ */
+void handle_nested_irq(unsigned int irq)
+{
+	struct irq_desc *desc = irq_to_desc(irq);
+	struct irqaction *action;
+	irqreturn_t action_ret;
+
+	might_sleep();
+
+	scoped_guard(raw_spinlock_irq, &desc->lock) {
+		if (irq_can_handle_actions(desc))
+			return;
+
+		action = desc->action;
+		kstat_incr_irqs_this_cpu(desc);
+		atomic_inc(&desc->threads_active);
+	}
+
+	action_ret = IRQ_NONE;
+	for_each_action_of_desc(desc, action)
+		action_ret |= action->thread_fn(action->irq, action->dev_id);
+
+	if (!irq_settings_no_debug(desc))
+		note_interrupt(desc, action_ret);
+
+	wake_threads_waitq(desc);
+}
+EXPORT_SYMBOL_GPL(handle_nested_irq);
+
+/**
  *	handle_simple_irq - Simple and software-decoded IRQs.
  *	@desc:	the interrupt description structure for this irq
  *



