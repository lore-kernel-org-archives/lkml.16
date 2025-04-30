Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A309925DD15
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017300; cv=none; b=B7gk4dInSsXOl3kJMa3RTN1RXot+3jo3Mvzzm5z6EHGA+BD5DlWGav6f9adDEmm8sCsJeR2daA+FHY3fG6kjTw3FJa5eQ/stUR4RW0diQejqtA1nXJHHwB15FHnKmoYijbcLLWtoRzu9LYJz9RWXluBYAtFpC+1iMceYdDUakZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017300; c=relaxed/simple;
	bh=iXqh6JMClLUAps5gEZsQzUHOSiUBzXhckx9408MiJ1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jS68B48nE3Mp4hTEIt1du/W62F0731PXgky8G+B35/2qWlfugXlfSwjdgK4RywTW/SCI/TuSq1adRBjRKU6O20BMj+X7sxYtAVACjq0Emp3ugra6JZKTSAiTUo9x6FTZWCBGNyjDdb0Hu7CWGVLiZLzj6fWgkDTP4Mr210V9WRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fcIEHrLV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OKusDwoc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fcIEHrLV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OKusDwoc"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746017295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CbMS+i5KjJobTHjv4nAKAOXl90tIbvktu5yABmTMxQA=;
	b=fcIEHrLVL4rzwx+TfU+lLRAHhSgKY/xM7seWlECXwVpdy/Xm+9D3PwmWlV2gAu2Ss9lx9+
	63xCgB41/Vm/pmNsst8jsycKad7g/5nMNnrbz6Tmt5hge61m20mto0rI/hJBb5YXTrk3+c
	nsmL5FWMg7OoBoAcegRMIH5gdmz0FLxvUUKDmYFMJ8y26bX1wkgUK44KrfJm4VnSSxlP1e
	qRq33nHZS4QNEXf0FpiPJph5fuKHTxZ+OC19UjSqIWk1h1QwToN9jc30xSlj7edMbSiAle
	gyiWvcyB//73jAtgqN5i3OwOe/pQUAADXNP3rGvpQfWfJG9PGSkMYERX1xIGmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746017295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CbMS+i5KjJobTHjv4nAKAOXl90tIbvktu5yABmTMxQA=;
	b=OKusDwockcIUpQe9TJVlUdrkMbB1sByfjvpgjmHkN1XpWCsNR5Jrw18Q3QhTkF7QEbd5jn
	zM4Lt+2A0CSNMRDA==
To: Jiri Slaby <jirislaby@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2a 35/45] genirq/manage: Rework irq_set_irq_wake()
In-Reply-To: <87plgtq0qb.ffs@tglx>
References: <20250429065337.117370076@linutronix.de>
 <20250429065422.128859754@linutronix.de>
 <e9a0abc5-7ee0-4ee1-9e19-37d43a5d41de@kernel.org> <87plgtq0qb.ffs@tglx>
Date: Wed, 30 Apr 2025 14:48:15 +0200
Message-ID: <87ldrhq0hc.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2a: Fix the return value for the on/off paths - Jiry
---
 kernel/irq/manage.c |   65 ++++++++++++++++++++++++----------------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -846,45 +846,40 @@ static int set_irq_wake_real(unsigned in
  */
 int irq_set_irq_wake(unsigned int irq, unsigned int on)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
-	int ret = 0;
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		struct irq_desc *desc = scoped_irqdesc;
+		int ret = 0;
 
-	if (!desc)
-		return -EINVAL;
+		/* Don't use NMIs as wake up interrupts please */
+		if (irq_is_nmi(desc))
+			return -EINVAL;
 
-	/* Don't use NMIs as wake up interrupts please */
-	if (irq_is_nmi(desc)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
-
-	/* wakeup-capable irqs can be shared between drivers that
-	 * don't need to have the same sleep mode behaviors.
-	 */
-	if (on) {
-		if (desc->wake_depth++ == 0) {
-			ret = set_irq_wake_real(irq, on);
-			if (ret)
-				desc->wake_depth = 0;
-			else
-				irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
-		}
-	} else {
-		if (desc->wake_depth == 0) {
-			WARN(1, "Unbalanced IRQ %d wake disable\n", irq);
-		} else if (--desc->wake_depth == 0) {
-			ret = set_irq_wake_real(irq, on);
-			if (ret)
-				desc->wake_depth = 1;
-			else
-				irqd_clear(&desc->irq_data, IRQD_WAKEUP_STATE);
+		/*
+		 * wakeup-capable irqs can be shared between drivers that
+		 * don't need to have the same sleep mode behaviors.
+		 */
+		if (on) {
+			if (desc->wake_depth++ == 0) {
+				ret = set_irq_wake_real(irq, on);
+				if (ret)
+					desc->wake_depth = 0;
+				else
+					irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
+			}
+		} else {
+			if (desc->wake_depth == 0) {
+				WARN(1, "Unbalanced IRQ %d wake disable\n", irq);
+			} else if (--desc->wake_depth == 0) {
+				ret = set_irq_wake_real(irq, on);
+				if (ret)
+					desc->wake_depth = 1;
+				else
+					irqd_clear(&desc->irq_data, IRQD_WAKEUP_STATE);
+			}
 		}
+		return ret;
 	}
-
-out_unlock:
-	irq_put_desc_busunlock(desc, flags);
-	return ret;
+	return -EINVAL;
 }
 EXPORT_SYMBOL(irq_set_irq_wake);
 
