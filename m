Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817FB2BF3C7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909736; cv=none; b=hRfq2k0UBjwuJuRB++T0Hh07qlQGDhhC2Jg2miOwuUD8iE7Ij7tT3gb5DylixtzD+q7mD1jqd7rG+NxePIgNrPCkgzLkt1OwZJLcvh2g5gEr2k9DeBoverzx9kRYgQAymjfSTehNc8hOW6AM6ZdOCfLswwU8tntgwYbe/aPHOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909736; c=relaxed/simple;
	bh=tuEEFk8TcHvWKFiT97V6fnjqa0MsE28d8fxiVRK083c=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=oFO+Cwu1yKdWdXW8XsWNI2wtf296grczuBMaPN1/ccCJEejkfMKegMnJ2ncTTa8Jl5OaeujEdo/XLLLuYTL/72E4v0cjsB+vE69Y5lsGZrIPAC9NgazfmNHWKieUpCPDEB25XyTY0uTC8kJ/0qf2veYeCGOLMpyVtepfvLG7DvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ntoeZz9a; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l6k2nIz1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ntoeZz9a";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l6k2nIz1"
Message-ID: <20250429065421.830357569@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=bYqokDAXltzvGtNSThKO/zTEdwgjP0tUlXPO/QfeS7o=;
	b=ntoeZz9aBs83duSRbsgwLsDePRFcNaJF/7bFFRTVLTYXbWHj1WO5k0eQNZt2dNdNbdWvp5
	1sQShxOVWRpVf+LDoD8zE+MyCYmjrdKAzGT7vPabjo4UEvemwc2uM+vsRZzmsW1pbk0laa
	4gmFg09bTc0gFXHeerCW2EPkz/hOVY3w/NtV1FsEtWZL30zwjYrX1xr7BF0C1xxI/F81xN
	42dUvR22cq+utqvj2Rhx5tLuumuf1gMibuuNbSi4YE8GUt562eGKLQ3aan0yIsKJD+3hBE
	l/hWJxcn4ZBBe1DBQvei/hs5m0/zrCocf26BqmjF8b3LDzdQDrQNwqLyWz9T8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=bYqokDAXltzvGtNSThKO/zTEdwgjP0tUlXPO/QfeS7o=;
	b=l6k2nIz1am1Xqa8YFmg+LG+UZZTpLQOp71Bbcw+HTaJTiQFqnV/+d/s8A5+9c84VeSV3qw
	n+2P1MTg1D1jXgCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 30/45] genirq/manage: Rework irq_update_affinity_desc()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:32 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   76 +++++++++++++++++++++-------------------------------
 1 file changed, 32 insertions(+), 44 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -393,14 +393,8 @@ int irq_set_affinity_locked(struct irq_d
  * an interrupt which is already started or which has already been configured
  * as managed will also fail, as these mean invalid init state or double init.
  */
-int irq_update_affinity_desc(unsigned int irq,
-			     struct irq_affinity_desc *affinity)
+int irq_update_affinity_desc(unsigned int irq, struct irq_affinity_desc *affinity)
 {
-	struct irq_desc *desc;
-	unsigned long flags;
-	bool activated;
-	int ret = 0;
-
 	/*
 	 * Supporting this with the reservation scheme used by x86 needs
 	 * some more thought. Fail it for now.
@@ -408,44 +402,38 @@ int irq_update_affinity_desc(unsigned in
 	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
 		return -EOPNOTSUPP;
 
-	desc = irq_get_desc_buslock(irq, &flags, 0);
-	if (!desc)
-		return -EINVAL;
-
-	/* Requires the interrupt to be shut down */
-	if (irqd_is_started(&desc->irq_data)) {
-		ret = -EBUSY;
-		goto out_unlock;
-	}
-
-	/* Interrupts which are already managed cannot be modified */
-	if (irqd_affinity_is_managed(&desc->irq_data)) {
-		ret = -EBUSY;
-		goto out_unlock;
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_desc *desc = scoped_irqdesc;
+		bool activated;
+
+		/* Requires the interrupt to be shut down */
+		if (irqd_is_started(&desc->irq_data))
+			return -EBUSY;
+
+		/* Interrupts which are already managed cannot be modified */
+		if (irqd_affinity_is_managed(&desc->irq_data))
+			return -EBUSY;
+		/*
+		 * Deactivate the interrupt. That's required to undo
+		 * anything an earlier activation has established.
+		 */
+		activated = irqd_is_activated(&desc->irq_data);
+		if (activated)
+			irq_domain_deactivate_irq(&desc->irq_data);
+
+		if (affinity->is_managed) {
+			irqd_set(&desc->irq_data, IRQD_AFFINITY_MANAGED);
+			irqd_set(&desc->irq_data, IRQD_MANAGED_SHUTDOWN);
+		}
+
+		cpumask_copy(desc->irq_common_data.affinity, &affinity->mask);
+
+		/* Restore the activation state */
+		if (activated)
+			irq_domain_activate_irq(&desc->irq_data, false);
+		return 0;
 	}
-
-	/*
-	 * Deactivate the interrupt. That's required to undo
-	 * anything an earlier activation has established.
-	 */
-	activated = irqd_is_activated(&desc->irq_data);
-	if (activated)
-		irq_domain_deactivate_irq(&desc->irq_data);
-
-	if (affinity->is_managed) {
-		irqd_set(&desc->irq_data, IRQD_AFFINITY_MANAGED);
-		irqd_set(&desc->irq_data, IRQD_MANAGED_SHUTDOWN);
-	}
-
-	cpumask_copy(desc->irq_common_data.affinity, &affinity->mask);
-
-	/* Restore the activation state */
-	if (activated)
-		irq_domain_activate_irq(&desc->irq_data, false);
-
-out_unlock:
-	irq_put_desc_busunlock(desc, flags);
-	return ret;
+	return -EINVAL;
 }
 
 static int __irq_set_affinity(unsigned int irq, const struct cpumask *mask,



