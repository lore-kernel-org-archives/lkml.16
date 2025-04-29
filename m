Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB029DB98
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909713; cv=none; b=Pg3V1m3mSFHydDzROs1C98v2WiCW3qXgdWvbwypAXDbLsDESLLHJnazFkASAuFNfOGSiqcNV8rzIxcg6/lDHO42suPtw/UJvk63x0dbhbCHGw2cFV4D8qY4EPHWbZ5XdiyZlPAT/0FZvAdaG1lCE6JSWtu/7TPc6oSHagsXCwgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909713; c=relaxed/simple;
	bh=4uy/0MQtewojBOepFXdoI7S1S1htmg9NVRaV1ckApQM=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=Tz6Q5nBO/qKX2c3t8RjkzaAIYzPaa89Ufp6ZWIsFsRpSM+ZkUDE03J+Qht6jBh8915O/UkHH5jLqb1aYtDNzQ/Bjbf0qLEdgtxvPZwFUXP8PN03i6f8QB2OOhV0Jr40rCp8KY4XJak1sPOBhNSc6T3js31ZBy2IQzRWRfJitUrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=idyFHCGU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=78oqSr89; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="idyFHCGU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="78oqSr89"
Message-ID: <20250429065420.926362488@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=RuDZMp9D+gp8EySkGfhyFxWNuHAfWXE5BrBGEQsh6Ng=;
	b=idyFHCGUFBlRXyUWIJKrfens/GtUD0M+zfYuZ5mrgCSSFiqkrDgStT/w34Y/RZ7xhejPWx
	a9pRmm8DIAUm74xDgWp/HAgeYnL1XXgu4wsRWVSBoa/sZDOV1v83yyvONr6IoN6OJZVIgU
	ygF7hpmVIOb+vyRActbtyNB4gU+631ZQvzfymsOpOGM1ZuNPGHsDjOaHrPmoOw3k9CCep7
	NxpA+xZgGrLjTMzSnS6H3L0SMVr/WJilVyLYPsWNuOFppKn9wkqRxP6QqFPUOleW/yp1Dn
	juVoHbo3KoXJxhkdOuBGUQEIpQrzMmdFfs5Uqyhg9NgJBzRDWOq9jphGfzbxTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=RuDZMp9D+gp8EySkGfhyFxWNuHAfWXE5BrBGEQsh6Ng=;
	b=78oqSr89tz6yVE72vDA6aRYn0vN/54kz9l8PpteSeN3LCMBC52ntvIr3uf+IXt+clPJYdI
	aBLFI4OsVTmD3KDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 15/45] genirq/chip: Rework handle_level_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:10 +0200 (CEST)

Use the new helpers to decide whether the interrupt should be handled and
switch the descriptor locking to guard().

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -609,40 +609,26 @@ static void cond_unmask_irq(struct irq_d
 }
 
 /**
- *	handle_level_irq - Level type irq handler
- *	@desc:	the interrupt description structure for this irq
+ * handle_level_irq - Level type irq handler
+ * @desc:	the interrupt description structure for this irq
  *
- *	Level type interrupts are active as long as the hardware line has
- *	the active level. This may require to mask the interrupt and unmask
- *	it after the associated handler has acknowledged the device, so the
- *	interrupt line is back to inactive.
+ * Level type interrupts are active as long as the hardware line has the
+ * active level. This may require to mask the interrupt and unmask it after
+ * the associated handler has acknowledged the device, so the interrupt
+ * line is back to inactive.
  */
 void handle_level_irq(struct irq_desc *desc)
 {
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
 	mask_ack_irq(desc);
 
-	if (!irq_can_handle_pm(desc))
-		goto out_unlock;
-
-	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
-
-	/*
-	 * If its disabled or no action available
-	 * keep it masked and get out of here
-	 */
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |= IRQS_PENDING;
-		goto out_unlock;
-	}
+	if (!irq_can_handle(desc))
+		return;
 
 	kstat_incr_irqs_this_cpu(desc);
 	handle_irq_event(desc);
 
 	cond_unmask_irq(desc);
-
-out_unlock:
-	raw_spin_unlock(&desc->lock);
 }
 EXPORT_SYMBOL_GPL(handle_level_irq);
 



