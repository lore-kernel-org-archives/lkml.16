Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C12777E4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909699; cv=none; b=EataXbtZLwu4AiQVbzUC6Ygq7dBI1IdmyQhrLnN9qqHWZ1Osaik5pW3fkXt/FbPUYLiZJ36IYTdwKMEoBufwgEJVJclF/3H4R2sYwdEeZRkBCGFYBiFQJEoOUEIV3RCcDe/oEyREFD29vEVnnCScttsJ4x0bsHYbEAngQTIW6gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909699; c=relaxed/simple;
	bh=8cOz+mxhqrNemsJxNIB2y98DSQNypLkLtwrZ6EtsqtQ=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=Eo6u9hdmyCXckFQf6iIivxpcm1xMy7Eus+87rJko7j50ijZWvVEpFS9VDr/yX2W7Q2Eowt80r4MRIITTbZbC1cx+dqqDLkE5h3aJS/eKSLTSY/cUgUy63eB5tZ9jXDjvHDQLNLNt9pgkcJ4K3jO3tRcOm0823OnGmvLIfCqBuME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BR13VEf4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C0ipgEmM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BR13VEf4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C0ipgEmM"
Message-ID: <20250429065420.312487167@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=B+/JBq3ESzVGFoGKqyWN21BcIWknHhWUvKsJOEZWk7c=;
	b=BR13VEf4Mvl9LZ12oZOsvbtj8l7fl+gQPPJB76/AVpxKdsZC99cf2IaLuh8VyZxxyg06mz
	85ZNEzM4hx8RYlLkGatEhrJCJQhA+vb7HYkKvtqvILRi5T721Vv1LKkhv3PpOfKSB00Rph
	f8WhLN9KWsse25JNIxEkZSVGLEWf1eCAk9lhPv8WDrcZiTo1s8rXl+whlnBFFRD/vAQ+W4
	1d/0XD4CksdM/i9j8DGr2E2ZnRA35QMIXSOYlZ0/dxcBdBv+2cXvYCwIsjch4fEBeDl1vr
	OpEqQVkDkW1pBZS+PkEpV+mbh1sK69BBUO7ZweGCzxO5EaWHWvBZvNTiFaskoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=B+/JBq3ESzVGFoGKqyWN21BcIWknHhWUvKsJOEZWk7c=;
	b=C0ipgEmMz5hGMb6E6FaAVkd6utJwzvv/LXKwYIjhEonyIhbZjrhhXY4jc1Z0cwUGLakjUC
	qcKuVZl0bEKoZmCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 05/45] genirq/resend: Switch to lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:54:55 +0200 (CEST)

Convert all lock/unlock pairs to guards and tidy up the code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/resend.c |   50 +++++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

--- a/kernel/irq/resend.c
+++ b/kernel/irq/resend.c
@@ -30,18 +30,17 @@ static DEFINE_RAW_SPINLOCK(irq_resend_lo
  */
 static void resend_irqs(struct tasklet_struct *unused)
 {
-	struct irq_desc *desc;
-
-	raw_spin_lock_irq(&irq_resend_lock);
+	guard(raw_spinlock_irq)(&irq_resend_lock);
 	while (!hlist_empty(&irq_resend_list)) {
-		desc = hlist_entry(irq_resend_list.first, struct irq_desc,
-				   resend_node);
+		struct irq_desc *desc;
+
+		desc = hlist_entry(irq_resend_list.first, struct irq_desc,  resend_node);
 		hlist_del_init(&desc->resend_node);
+
 		raw_spin_unlock(&irq_resend_lock);
 		desc->handle_irq(desc);
 		raw_spin_lock(&irq_resend_lock);
 	}
-	raw_spin_unlock_irq(&irq_resend_lock);
 }
 
 /* Tasklet to handle resend: */
@@ -75,19 +74,18 @@ static int irq_sw_resend(struct irq_desc
 	}
 
 	/* Add to resend_list and activate the softirq: */
-	raw_spin_lock(&irq_resend_lock);
-	if (hlist_unhashed(&desc->resend_node))
-		hlist_add_head(&desc->resend_node, &irq_resend_list);
-	raw_spin_unlock(&irq_resend_lock);
+	scoped_guard(raw_spinlock, &irq_resend_lock) {
+		if (hlist_unhashed(&desc->resend_node))
+			hlist_add_head(&desc->resend_node, &irq_resend_list);
+	}
 	tasklet_schedule(&resend_tasklet);
 	return 0;
 }
 
 void clear_irq_resend(struct irq_desc *desc)
 {
-	raw_spin_lock(&irq_resend_lock);
+	guard(raw_spinlock)(&irq_resend_lock);
 	hlist_del_init(&desc->resend_node);
-	raw_spin_unlock(&irq_resend_lock);
 }
 
 void irq_resend_init(struct irq_desc *desc)
@@ -172,30 +170,24 @@ int check_irq_resend(struct irq_desc *de
  */
 int irq_inject_interrupt(unsigned int irq)
 {
-	struct irq_desc *desc;
-	unsigned long flags;
-	int err;
+	int err = -EINVAL;
 
 	/* Try the state injection hardware interface first */
 	if (!irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true))
 		return 0;
 
 	/* That failed, try via the resend mechanism */
-	desc = irq_get_desc_buslock(irq, &flags, 0);
-	if (!desc)
-		return -EINVAL;
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_desc *desc = scoped_irqdesc;
 
-	/*
-	 * Only try to inject when the interrupt is:
-	 *  - not NMI type
-	 *  - activated
-	 */
-	if (irq_is_nmi(desc) || !irqd_is_activated(&desc->irq_data))
-		err = -EINVAL;
-	else
-		err = check_irq_resend(desc, true);
-
-	irq_put_desc_busunlock(desc, flags);
+		/*
+		 * Only try to inject when the interrupt is:
+		 *  - not NMI type
+		 *  - activated
+		 */
+		if (!irq_is_nmi(desc) && irqd_is_activated(&desc->irq_data))
+			err = check_irq_resend(desc, true);
+	}
 	return err;
 }
 EXPORT_SYMBOL_GPL(irq_inject_interrupt);



