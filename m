Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853B82797B3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909702; cv=none; b=kYjUE8UK4wu/1e6T7sE4WSuWdGXtP2jw2/8FHhAOpAWAzNLi7YaDIgcQQic/xRCT/pUmy0sea0snhGkMtTUhysaKHDQdoS4aAWrLA1OSL9WpJmgWG8S8jhn8jvLrj82qNn6/3qlzkWGLTfg+gzFodo4IwBumpEpydLiJv6rqDx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909702; c=relaxed/simple;
	bh=edtEWB4k+k/L4w/yDTmAXNYh2BhBLKh0TvCU/HTNNwA=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=tRWcRxL57AaPFJ5f1Dwb1mY28kIHg8ku62utVybH8Kf7g3wZCKZxp0rNaEysSdDUiUymKwaT2l+FOjlNyrW77DcdXjf1iuuueWbr3cisgS6HCyov4jm9q0z42m3+XHqy8uc8X12WqLSrnSviT8JWwIUv+Eog3W6WIW3qxfHjElk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wNiKn1GW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yqrOTY5J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wNiKn1GW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yqrOTY5J"
Message-ID: <20250429065420.437285102@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Dkh13FM0z5C9yReJqSNpjRvp0mM9pBI+DFdk+sv+vbw=;
	b=wNiKn1GW3L+EuYNiJ42xvWLIvhFbFa5cyxz2D5hrvbr8nGLQNiXmG4xItvnP7azVt7Tq0+
	iYeGHsw9nUylMvqF62m3f5fuA0nh96ctlx59GzsCEslyXJ/+zWE9Owyx9GvHdWO7H0i3Jz
	NV8Z0LTfJmEyLCNMr5+3Il2isSvGyerA+hZGYU1N28Ajp0Idu0GCr5edS5SDYslvFdypUe
	xeTDd85qqRCU1ZEA3Hb12s8H/LgKiXVA8+pSRjgUKsMpcAgfqFb0Ss6ocu+1gkcc3Lkq7v
	O0o+dO+lTicetjJ4O0uKBXsIGkg388orLH2rVd6M8ttep77ZuREeFtZ76BkC7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Dkh13FM0z5C9yReJqSNpjRvp0mM9pBI+DFdk+sv+vbw=;
	b=yqrOTY5Jh8kun+Ppy+Rve/PIvF85Ljxr4e0NyC3+F5/kd+xQdNW2t8Tt3qYQxOL4UoBtFe
	HPDrBQU2WNsJK+Cw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 07/45] genirq/spurious: Cleanup code
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:54:58 +0200 (CEST)

Clean up the coding style

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/spurious.c |   74 ++++++++++++++++++--------------------------------
 1 file changed, 28 insertions(+), 46 deletions(-)

--- a/kernel/irq/spurious.c
+++ b/kernel/irq/spurious.c
@@ -34,8 +34,9 @@ static atomic_t irq_poll_active;
  * true and let the handler run.
  */
 bool irq_wait_for_poll(struct irq_desc *desc)
-	__must_hold(&desc->lock)
 {
+	lockdep_assert_held(&desc->lock);
+
 	if (WARN_ONCE(irq_poll_cpu == smp_processor_id(),
 		      "irq poll in progress on cpu %d for irq %d\n",
 		      smp_processor_id(), desc->irq_data.irq))
@@ -157,8 +158,7 @@ static void poll_spurious_irqs(struct ti
 			 continue;
 
 		/* Racy but it doesn't matter */
-		state = desc->istate;
-		barrier();
+		state = READ_ONCE(desc->istate);
 		if (!(state & IRQS_SPURIOUS_DISABLED))
 			continue;
 
@@ -168,8 +168,7 @@ static void poll_spurious_irqs(struct ti
 	}
 out:
 	atomic_dec(&irq_poll_active);
-	mod_timer(&poll_spurious_irq_timer,
-		  jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
+	mod_timer(&poll_spurious_irq_timer, jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
 }
 
 static inline int bad_action_ret(irqreturn_t action_ret)
@@ -195,15 +194,12 @@ static void __report_bad_irq(struct irq_
 	struct irqaction *action;
 	unsigned long flags;
 
-	if (bad_action_ret(action_ret)) {
-		printk(KERN_ERR "irq event %d: bogus return value %x\n",
-				irq, action_ret);
-	} else {
-		printk(KERN_ERR "irq %d: nobody cared (try booting with "
-				"the \"irqpoll\" option)\n", irq);
-	}
+	if (bad_action_ret(action_ret))
+		pr_err("irq event %d: bogus return value %x\n", irq, action_ret);
+	else
+		pr_err("irq %d: nobody cared (try booting with the \"irqpoll\" option)\n", irq);
 	dump_stack();
-	printk(KERN_ERR "handlers:\n");
+	pr_err("handlers:\n");
 
 	/*
 	 * We need to take desc->lock here. note_interrupt() is called
@@ -213,11 +209,10 @@ static void __report_bad_irq(struct irq_
 	 */
 	raw_spin_lock_irqsave(&desc->lock, flags);
 	for_each_action_of_desc(desc, action) {
-		printk(KERN_ERR "[<%p>] %ps", action->handler, action->handler);
+		pr_err("[<%p>] %ps", action->handler, action->handler);
 		if (action->thread_fn)
-			printk(KERN_CONT " threaded [<%p>] %ps",
-					action->thread_fn, action->thread_fn);
-		printk(KERN_CONT "\n");
+			pr_cont(" threaded [<%p>] %ps", action->thread_fn, action->thread_fn);
+		pr_cont("\n");
 	}
 	raw_spin_unlock_irqrestore(&desc->lock, flags);
 }
@@ -232,18 +227,17 @@ static void report_bad_irq(struct irq_de
 	}
 }
 
-static inline int
-try_misrouted_irq(unsigned int irq, struct irq_desc *desc,
-		  irqreturn_t action_ret)
+static inline bool try_misrouted_irq(unsigned int irq, struct irq_desc *desc,
+				     irqreturn_t action_ret)
 {
 	struct irqaction *action;
 
 	if (!irqfixup)
-		return 0;
+		return false;
 
 	/* We didn't actually handle the IRQ - see if it was misrouted? */
 	if (action_ret == IRQ_NONE)
-		return 1;
+		return true;
 
 	/*
 	 * But for 'irqfixup == 2' we also do it for handled interrupts if
@@ -251,19 +245,16 @@ try_misrouted_irq(unsigned int irq, stru
 	 * traditional PC timer interrupt.. Legacy)
 	 */
 	if (irqfixup < 2)
-		return 0;
+		return false;
 
 	if (!irq)
-		return 1;
+		return true;
 
 	/*
 	 * Since we don't get the descriptor lock, "action" can
-	 * change under us.  We don't really care, but we don't
-	 * want to follow a NULL pointer. So tell the compiler to
-	 * just load it once by using a barrier.
+	 * change under us.
 	 */
-	action = desc->action;
-	barrier();
+	action = READ_ONCE(desc->action);
 	return action && (action->flags & IRQF_IRQPOLL);
 }
 
@@ -273,8 +264,7 @@ void note_interrupt(struct irq_desc *des
 {
 	unsigned int irq;
 
-	if (desc->istate & IRQS_POLL_INPROGRESS ||
-	    irq_settings_is_polled(desc))
+	if (desc->istate & IRQS_POLL_INPROGRESS || irq_settings_is_polled(desc))
 		return;
 
 	if (bad_action_ret(action_ret)) {
@@ -420,13 +410,12 @@ void note_interrupt(struct irq_desc *des
 		/*
 		 * Now kill the IRQ
 		 */
-		printk(KERN_EMERG "Disabling IRQ #%d\n", irq);
+		pr_emerg("Disabling IRQ #%d\n", irq);
 		desc->istate |= IRQS_SPURIOUS_DISABLED;
 		desc->depth++;
 		irq_disable(desc);
 
-		mod_timer(&poll_spurious_irq_timer,
-			  jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
+		mod_timer(&poll_spurious_irq_timer, jiffies + POLL_SPURIOUS_IRQ_INTERVAL);
 	}
 	desc->irqs_unhandled = 0;
 }
@@ -436,11 +425,9 @@ bool noirqdebug __read_mostly;
 int noirqdebug_setup(char *str)
 {
 	noirqdebug = 1;
-	printk(KERN_INFO "IRQ lockup detection disabled\n");
-
+	pr_info("IRQ lockup detection disabled\n");
 	return 1;
 }
-
 __setup("noirqdebug", noirqdebug_setup);
 module_param(noirqdebug, bool, 0644);
 MODULE_PARM_DESC(noirqdebug, "Disable irq lockup detection when true");
@@ -452,12 +439,10 @@ static int __init irqfixup_setup(char *s
 		return 1;
 	}
 	irqfixup = 1;
-	printk(KERN_WARNING "Misrouted IRQ fixup support enabled.\n");
-	printk(KERN_WARNING "This may impact system performance.\n");
-
+	pr_warn("Misrouted IRQ fixup support enabled.\n");
+	pr_warn("This may impact system performance.\n");
 	return 1;
 }
-
 __setup("irqfixup", irqfixup_setup);
 module_param(irqfixup, int, 0644);
 
@@ -468,11 +453,8 @@ static int __init irqpoll_setup(char *st
 		return 1;
 	}
 	irqfixup = 2;
-	printk(KERN_WARNING "Misrouted IRQ fixup and polling support "
-				"enabled\n");
-	printk(KERN_WARNING "This may significantly impact system "
-				"performance\n");
+	pr_warn("Misrouted IRQ fixup and polling support enabled\n");
+	pr_warn("This may significantly impact system performance\n");
 	return 1;
 }
-
 __setup("irqpoll", irqpoll_setup);



