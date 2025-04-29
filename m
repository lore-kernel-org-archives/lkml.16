Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826712BD5B3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909723; cv=none; b=Cx2LS18H/jEaWwOFEe4L9PMCyD2qcuUCrsDVo/H3VtslHzPxYVpiLqJsRZVholk3nxJq6YN0SiF6fYfghU8muVlpHR9w3gWFhvCNthdJ4uZNROj4NfEypYXOlU3v87fu05DixL4HDU+D5DfX70/LFql0fo0w4MG3zVDB37rrtRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909723; c=relaxed/simple;
	bh=48+VKlH9tu2Xh4CZBWtpL24Y/bts9hBSVsFJXgZcKfY=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=ZHLxySBoPh0oQj9lFi2WvnIFejqbLy/QzYonfPCx6oMNhIdgvrmM6+pxsNxjct4A8wKFAqKEr9LCkE6RIAt7pz5eOflFnSqOOWKAal3iP8NxHNmZ3SANEjEths8Kbo/pdJQte4Ngd40jSPmx1xHJaMMhJM9aEnfn2u77u/Z4yGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g0H5VOAB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CsO35V/b; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g0H5VOAB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CsO35V/b"
Message-ID: <20250429065421.295400891@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=5NWvdpRY8bOYsaM2bFB6TtpfUvkrriNDslgB4IH7rF4=;
	b=g0H5VOABiYT8vzBOQo4EsYOGq51MLi7dfwgu3r1O2bTulv/FnwGh4GtYIu1EZWr4EuUQ92
	Qe3yaytUUOKC6CSGIkdVrQDBRc3LQf7t8hWF4ESWm4ukYnl03Jz3OF1OMna4y7qgNhrfN0
	aosw8XkD3D6bXsgfbv1mNUzZgfgZa1edL6peDW1eL3jBdg+HS9AtPxk2joh+pI/oXZaAHq
	FZ83MuWKbrlDM0dP2jaPK1QegQbqKGZyVLRCG8iblrq+oHDY3bp4OvfxKZBbxBBd3+IjsY
	xdBsCoprFfu+TTZxC28smMI5f3SmHohANKUm2xGHXFmmQT3bSBdQeSP8djqYKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=5NWvdpRY8bOYsaM2bFB6TtpfUvkrriNDslgB4IH7rF4=;
	b=CsO35V/bcWQNrM0HPa/HJCsmhORUa4GmZqa30Kj9WUxR+sWFcSa2DnggPOerFROaWH6YqN
	9dlE/jCRo0BgD8CA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 21/45] genirq/chip: Rework irq_set_chip()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:19 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -34,26 +34,22 @@ struct irqaction chained_action = {
 };
 
 /**
- *	irq_set_chip - set the irq chip for an irq
- *	@irq:	irq number
- *	@chip:	pointer to irq chip description structure
+ * irq_set_chip - set the irq chip for an irq
+ * @irq:	irq number
+ * @chip:	pointer to irq chip description structure
  */
 int irq_set_chip(unsigned int irq, const struct irq_chip *chip)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
+	int ret = -EINVAL;
 
-	if (!desc)
-		return -EINVAL;
-
-	desc->irq_data.chip = (struct irq_chip *)(chip ?: &no_irq_chip);
-	irq_put_desc_unlock(desc, flags);
-	/*
-	 * For !CONFIG_SPARSE_IRQ make the irq show up in
-	 * allocated_irqs.
-	 */
-	irq_mark_irq(irq);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		scoped_irqdesc->irq_data.chip = (struct irq_chip *)(chip ?: &no_irq_chip);
+		ret = 0;
+	}
+	/* For !CONFIG_SPARSE_IRQ make the irq show up in allocated_irqs. */
+	if (!ret)
+		irq_mark_irq(irq);
+	return ret;
 }
 EXPORT_SYMBOL(irq_set_chip);
 



