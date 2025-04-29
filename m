Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278A41E515
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909701; cv=none; b=q9cH5fpTWii9zKNveRFUB14BBolA7CUU2rxacM25/qzlsDxot9u9H8GWd7yR6yMp2OM1VbRZWeM2GFMlLqBs5zbIYVFljovx9hwca6ebXw5jpsyt71ddolEVNHCizV2nyE/Mv9lOeQLRDtFShFQ3IU8hhWFQHIDJ5nzW+fcLYqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909701; c=relaxed/simple;
	bh=p83oHxttfdm0y+u5gX77fDL5atQ/kVFM8a5AB9t5GRY=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=Q/KELKuLpFrjBw5M+OAD2Btcz6rPYwL3Ds8A0KqaSpBvvwXJCQIKhnJ1p1XiSsZpqaowCgcJ6BvgO8XWht5LskN3YAvw3zc9qx4fqvl7O2OFGpLiPGF2LdbkYLA2h0RWmZfF5UXBoi58J2QU0p2TxQQXQH0yAxTNZPBCXnBI5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vBNmukrA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ps5vujrM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vBNmukrA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ps5vujrM"
Message-ID: <20250429065420.373998838@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QWjg99Fn1vizO7Nd6kXsxIDLfeT41JKoGSwCBQRcpL0=;
	b=vBNmukrAqaK06OdFINBr9e6huVENz4qtzvWMJuwegJGxwfj0do10QV7zYhYs3oGABz3AFO
	8452U+bdYaIVyFPWuj4EjmRIG6g7RLbxjv37idnWYzfSahFFRaLIGS5YbBXXMEyS3FalAi
	v52liM6uCW9U7XgCwjaRfJ/1Uko14hNPu7H/Iy50xbS7jUleS/OE1e05FBxsEu7c4V8+QA
	RsPwgBHPNqXfOHxx1Il3uhvwl5TbEZEFe0NdBjmwJlLINnWJrWcUYIJB0O7sJFdiUDEkLW
	wetsgLrvmXnbCXMRNEs6tOC4FDSrovBmxm58UycpK4YnAy/zk2GFETYO4CxGTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QWjg99Fn1vizO7Nd6kXsxIDLfeT41JKoGSwCBQRcpL0=;
	b=Ps5vujrMWu6U44wQfK2NIEcWP4nNybkYCXSl5BWaGf7DCiZDIhE+H+aDcMP0Z9bwVjAwBi
	vv4IQ/iKGHXpqjCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 06/45] genirq/proc: Switch to lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:54:56 +0200 (CEST)

Convert all lock/unlock pairs to guards and tidy up the code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/proc.c |   65 +++++++++++++++++++-----------------------------------
 1 file changed, 24 insertions(+), 41 deletions(-)

--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -81,20 +81,18 @@ static int show_irq_affinity(int type, s
 static int irq_affinity_hint_proc_show(struct seq_file *m, void *v)
 {
 	struct irq_desc *desc = irq_to_desc((long)m->private);
-	unsigned long flags;
 	cpumask_var_t mask;
 
 	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
 		return -ENOMEM;
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	if (desc->affinity_hint)
-		cpumask_copy(mask, desc->affinity_hint);
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
+	scoped_guard(raw_spinlock_irq, &desc->lock) {
+		if (desc->affinity_hint)
+			cpumask_copy(mask, desc->affinity_hint);
+	}
 
 	seq_printf(m, "%*pb\n", cpumask_pr_args(mask));
 	free_cpumask_var(mask);
-
 	return 0;
 }
 
@@ -295,23 +293,18 @@ static int irq_spurious_proc_show(struct
 
 #define MAX_NAMELEN 128
 
-static int name_unique(unsigned int irq, struct irqaction *new_action)
+static bool name_unique(unsigned int irq, struct irqaction *new_action)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 	struct irqaction *action;
-	unsigned long flags;
-	int ret = 1;
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	guard(raw_spinlock_irq)(&desc->lock);
 	for_each_action_of_desc(desc, action) {
 		if ((action != new_action) && action->name &&
-				!strcmp(new_action->name, action->name)) {
-			ret = 0;
-			break;
-		}
+		    !strcmp(new_action->name, action->name))
+			return false;
 	}
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-	return ret;
+	return true;
 }
 
 void register_handler_proc(unsigned int irq, struct irqaction *action)
@@ -319,8 +312,7 @@ void register_handler_proc(unsigned int
 	char name [MAX_NAMELEN];
 	struct irq_desc *desc = irq_to_desc(irq);
 
-	if (!desc->dir || action->dir || !action->name ||
-					!name_unique(irq, action))
+	if (!desc->dir || action->dir || !action->name || !name_unique(irq, action))
 		return;
 
 	snprintf(name, MAX_NAMELEN, "%s", action->name);
@@ -347,17 +339,16 @@ void register_irq_proc(unsigned int irq,
 	 * added, not when the descriptor is created, so multiple
 	 * tasks might try to register at the same time.
 	 */
-	mutex_lock(&register_lock);
+	guard(mutex)(&register_lock);
 
 	if (desc->dir)
-		goto out_unlock;
-
-	sprintf(name, "%d", irq);
+		return;
 
 	/* create /proc/irq/1234 */
+	sprintf(name, "%d", irq);
 	desc->dir = proc_mkdir(name, root_irq_dir);
 	if (!desc->dir)
-		goto out_unlock;
+		return;
 
 #ifdef CONFIG_SMP
 	umode_t umode = S_IRUGO;
@@ -366,31 +357,27 @@ void register_irq_proc(unsigned int irq,
 		umode |= S_IWUSR;
 
 	/* create /proc/irq/<irq>/smp_affinity */
-	proc_create_data("smp_affinity", umode, desc->dir,
-			 &irq_affinity_proc_ops, irqp);
+	proc_create_data("smp_affinity", umode, desc->dir, &irq_affinity_proc_ops, irqp);
 
 	/* create /proc/irq/<irq>/affinity_hint */
 	proc_create_single_data("affinity_hint", 0444, desc->dir,
-			irq_affinity_hint_proc_show, irqp);
+				irq_affinity_hint_proc_show, irqp);
 
 	/* create /proc/irq/<irq>/smp_affinity_list */
 	proc_create_data("smp_affinity_list", umode, desc->dir,
 			 &irq_affinity_list_proc_ops, irqp);
 
-	proc_create_single_data("node", 0444, desc->dir, irq_node_proc_show,
-			irqp);
+	proc_create_single_data("node", 0444, desc->dir, irq_node_proc_show, irqp);
 # ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
 	proc_create_single_data("effective_affinity", 0444, desc->dir,
-			irq_effective_aff_proc_show, irqp);
+				irq_effective_aff_proc_show, irqp);
 	proc_create_single_data("effective_affinity_list", 0444, desc->dir,
-			irq_effective_aff_list_proc_show, irqp);
+				irq_effective_aff_list_proc_show, irqp);
 # endif
 #endif
 	proc_create_single_data("spurious", 0444, desc->dir,
-			irq_spurious_proc_show, (void *)(long)irq);
+				irq_spurious_proc_show, (void *)(long)irq);
 
-out_unlock:
-	mutex_unlock(&register_lock);
 }
 
 void unregister_irq_proc(unsigned int irq, struct irq_desc *desc)
@@ -468,7 +455,6 @@ int show_interrupts(struct seq_file *p,
 	int i = *(loff_t *) v, j;
 	struct irqaction *action;
 	struct irq_desc *desc;
-	unsigned long flags;
 
 	if (i > ACTUAL_NR_IRQS)
 		return 0;
@@ -487,13 +473,13 @@ int show_interrupts(struct seq_file *p,
 		seq_putc(p, '\n');
 	}
 
-	rcu_read_lock();
+	guard(rcu)();
 	desc = irq_to_desc(i);
 	if (!desc || irq_settings_is_hidden(desc))
-		goto outsparse;
+		return 0;
 
 	if (!desc->action || irq_desc_is_chained(desc) || !desc->kstat_irqs)
-		goto outsparse;
+		return 0;
 
 	seq_printf(p, "%*d:", prec, i);
 	for_each_online_cpu(j) {
@@ -503,7 +489,7 @@ int show_interrupts(struct seq_file *p,
 	}
 	seq_putc(p, ' ');
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
+	guard(raw_spinlock_irq)(&desc->lock);
 	if (desc->irq_data.chip) {
 		if (desc->irq_data.chip->irq_print_chip)
 			desc->irq_data.chip->irq_print_chip(&desc->irq_data, p);
@@ -532,9 +518,6 @@ int show_interrupts(struct seq_file *p,
 	}
 
 	seq_putc(p, '\n');
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
-outsparse:
-	rcu_read_unlock();
 	return 0;
 }
 #endif



