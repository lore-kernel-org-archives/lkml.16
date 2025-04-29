Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD8D2BEC2F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909732; cv=none; b=eZe/SxEWEvECGlkNo2YQhs5b0QbpfgHdCeryGUNhy7UoQpfSEM5u4EJU9xb2z1pNY+phdqfYnKFAYSjewP6Qi3uv6wXOlPMKo/32o1sDK60ck/nWAYuaIx6EMWQAZcUgfXZMxiTObM5gfB+Dn3QM9YZ6fBFnyrQgaTj+TNV3n4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909732; c=relaxed/simple;
	bh=bvApdSitIIcDFjuPFEEzU1FSqU95bWDNnJJJe2q6exs=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=Up5IsOuIGZOXbHmw9kn0StscUnsbYTbqjsiRchh/R6lp69zmQ3WbkFPD4RPbxw/ZG9FfZvQQ1AVDgsZyDWxW4xmPo1fiHKYng2MVAY9JX/z5+imExgzypKXEfR00rprOXVu5bPXRiaWOWisLYaxWLIfqNFno2Q4HIWzv8jEF8PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tjmxrlV8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fffWh6cd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tjmxrlV8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fffWh6cd"
Message-ID: <20250429065421.650454052@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=cYWKdRXEr+TFQ30HnuL3MaDMsBDCslh0hKjVi8Z4UC4=;
	b=tjmxrlV8xiE2BeyDEopWrIP2Sv3gu7LaxVx+ca+cXh7D0HYbRwPCHDRvMNhOH7XjzMa088
	LlJYfsFxyZWF/yDzf+inzasm3YKo32ZOBOGlFwn12a8QW7cbHryAEMLhRBVOGP/KF90yAl
	ngnjiza75HG+CZ/5LdRFFTHU3BefQVxOrRVCRl3ahDz+ivOCNrUX7ON1ZnNn+NTtW4KKh6
	U8r3DxDxL05yn6mSFQtyKiq6P1f9nf7dXzlAYdGs9pDWIUZD6Venfh6lp0CJ4AgSGwdygx
	fpYSCfPtXqkcE+gF+0BeDOrrCs4gbMr5ViRbcIibbAlBl1a0NjYWa8QYn68zUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=cYWKdRXEr+TFQ30HnuL3MaDMsBDCslh0hKjVi8Z4UC4=;
	b=fffWh6cdHlqftSlCRWyzwsPOYkylD8p9POYyFwhR4Tc6+JNwVpKQQbPwWEYm9aABdjEBBY
	Ganu2VN+RXPv2cDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 27/45] genirq/chip: Rework irq_modify_status()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:28 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   58 +++++++++++++++++++++++++-----------------------------
 1 file changed, 27 insertions(+), 31 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1004,38 +1004,34 @@ EXPORT_SYMBOL_GPL(irq_set_chip_and_handl
 
 void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
 {
-	unsigned long flags, trigger, tmp;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		struct irq_desc *desc = scoped_irqdesc;
+		unsigned long trigger, tmp;
+		/*
+		 * Warn when a driver sets the no autoenable flag on an already
+		 * active interrupt.
+		 */
+		WARN_ON_ONCE(!desc->depth && (set & _IRQ_NOAUTOEN));
+
+		irq_settings_clr_and_set(desc, clr, set);
+
+		trigger = irqd_get_trigger_type(&desc->irq_data);
+
+		irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
+			   IRQD_TRIGGER_MASK | IRQD_LEVEL);
+		if (irq_settings_has_no_balance_set(desc))
+			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
+		if (irq_settings_is_per_cpu(desc))
+			irqd_set(&desc->irq_data, IRQD_PER_CPU);
+		if (irq_settings_is_level(desc))
+			irqd_set(&desc->irq_data, IRQD_LEVEL);
+
+		tmp = irq_settings_get_trigger_mask(desc);
+		if (tmp != IRQ_TYPE_NONE)
+			trigger = tmp;
 
-	if (!desc)
-		return;
-
-	/*
-	 * Warn when a driver sets the no autoenable flag on an already
-	 * active interrupt.
-	 */
-	WARN_ON_ONCE(!desc->depth && (set & _IRQ_NOAUTOEN));
-
-	irq_settings_clr_and_set(desc, clr, set);
-
-	trigger = irqd_get_trigger_type(&desc->irq_data);
-
-	irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
-		   IRQD_TRIGGER_MASK | IRQD_LEVEL);
-	if (irq_settings_has_no_balance_set(desc))
-		irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
-	if (irq_settings_is_per_cpu(desc))
-		irqd_set(&desc->irq_data, IRQD_PER_CPU);
-	if (irq_settings_is_level(desc))
-		irqd_set(&desc->irq_data, IRQD_LEVEL);
-
-	tmp = irq_settings_get_trigger_mask(desc);
-	if (tmp != IRQ_TYPE_NONE)
-		trigger = tmp;
-
-	irqd_set(&desc->irq_data, trigger);
-
-	irq_put_desc_unlock(desc, flags);
+		irqd_set(&desc->irq_data, trigger);
+	}
 }
 EXPORT_SYMBOL_GPL(irq_modify_status);
 



