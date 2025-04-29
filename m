Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F5F2C1E2A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909747; cv=none; b=QY0e2giQy3jfYEDEqn0tKp6tE/VLpfzSXyJlhQvM38G5/FY46Z7hn3wqWMEb7sNd0ilR1qGKhOj56KnveFmaAPYCi2u3C1hHP/Nt9vCLu1BmHUEdbziSqRLgRhwA0odEK4Uj3llq20Wq140pE/pwdltqDhRPyZzQq7AMrRbBek0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909747; c=relaxed/simple;
	bh=pSdGud0pdsDuQAiwZsJxWzc1blchhGKzeVzdfQKR/zU=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=FuizVUkjxIKMmttv6NwirIbI00pnM7Aioinf+0bCIdhjIByfEx+XydeOHr1YVCjkt/6+bjWuIkfjonsnWJ5CGVoZajJUK9sNWYQPrOvxD6JN7VhF+8O4ivv4uC+84Vxqh6vCGictGi9F0Yap921mVcFmfn3Rs2O4xHktWtV7eeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qmJMyjJ5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yPcABZS7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qmJMyjJ5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yPcABZS7"
Message-ID: <20250429065422.315844964@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=iRPvvR1vdljT5JQUmMeQpQOdsqp0lDA5a4Uza/350Bs=;
	b=qmJMyjJ500SPKH9ibcJK5SAP2wRH5PL/7gsMaqhHl/VEa2IlCLhadnPpXOJsN2kd+hcyxj
	+h+CHu7TE3T6C59bxFBFrimZCjjT1ePSAB0n2GE/Hmg1xCfBCEDanGbv6elzx6JrDIaB/B
	JDD3lu8J4Zej4J3EaFtJGzxMLsoqPMsktvi1tY7T6eXRPR4/MVMpkr9zgaUqWP4Y0Xmlop
	L7DoU4XfDi/nXwr6W1r8z30+iOdyLk5luWWFj7JnYWnUWEWaorLAerYJbSbY03aaeNOLbk
	NhRjKBaiz4kzjnTVzgZnIIWTG98eQZF392Lb4yN6D3ZjB7sKXEjs8A6XLoi1hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=iRPvvR1vdljT5JQUmMeQpQOdsqp0lDA5a4Uza/350Bs=;
	b=yPcABZS7z54UcEPsg05FQX7oe1hF0WE/qG4sH1S7WL/7ZuP9MfiaQAIrNjQ2rQ5MNM95Ez
	fy8N7YEgKhdTBEDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 38/45] genirq/manage: Rework enable_percpu_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:44 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   42 ++++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2285,35 +2285,25 @@ int request_nmi(unsigned int irq, irq_ha
 
 void enable_percpu_irq(unsigned int irq, unsigned int type)
 {
-	unsigned int cpu = smp_processor_id();
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, IRQ_GET_DESC_CHECK_PERCPU);
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU) {
+		struct irq_desc *desc = scoped_irqdesc;
 
-	if (!desc)
-		return;
-
-	/*
-	 * If the trigger type is not specified by the caller, then
-	 * use the default for this interrupt.
-	 */
-	type &= IRQ_TYPE_SENSE_MASK;
-	if (type == IRQ_TYPE_NONE)
-		type = irqd_get_trigger_type(&desc->irq_data);
-
-	if (type != IRQ_TYPE_NONE) {
-		int ret;
-
-		ret = __irq_set_trigger(desc, type);
-
-		if (ret) {
-			WARN(1, "failed to set type for IRQ%d\n", irq);
-			goto out;
+		/*
+		 * If the trigger type is not specified by the caller, then
+		 * use the default for this interrupt.
+		 */
+		type &= IRQ_TYPE_SENSE_MASK;
+		if (type == IRQ_TYPE_NONE)
+			type = irqd_get_trigger_type(&desc->irq_data);
+
+		if (type != IRQ_TYPE_NONE) {
+			if (__irq_set_trigger(desc, type)) {
+				WARN(1, "failed to set type for IRQ%d\n", irq);
+				return;
+			}
 		}
+		irq_percpu_enable(desc, smp_processor_id());
 	}
-
-	irq_percpu_enable(desc, cpu);
-out:
-	irq_put_desc_unlock(desc, flags);
 }
 EXPORT_SYMBOL_GPL(enable_percpu_irq);
 



