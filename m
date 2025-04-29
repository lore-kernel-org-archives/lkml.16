Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE2F29CB5E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909711; cv=none; b=pXECL0X0oiLFuV5k6NhLULWTq/9AOpv9OjnsQReSSUN/bK35hxbLGbEbh3N19z/vBJCgRRq0RjGQCrVC5pRoY48PuhegLsPbt72V1wLz9y+/SkzF6VES4dnvet0KOvOEMcwr+nrqdG2ukejLn0J/MuPwDQgFyTnnoQ3U+tqZ/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909711; c=relaxed/simple;
	bh=SWruWjq7NrJh4GW6JpsESKSHFkheXo+rUk/pWg501Ec=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=NKY3LJsoMBG7l52VHMxGfuP8nMO5S0wGJpCV5QzKjQ63q2ocQ0byWNX00F5MMB1PY4onnvdyQWNzJ1MTl93hfUQUiIsp7gqESQpj9qmPleeYUEu+1SSRBprPJnhB/HMzCy+Ha75KjtMfQB0pckCTGtoJPJQyNWM+FguB/8Xd6oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JXdU1HIF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YhBI99P0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JXdU1HIF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YhBI99P0"
Message-ID: <20250429065420.804683349@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=tLeDTvhOlopO8mWHtAUXcGd29hb+8xAyrOVF30gQF8M=;
	b=JXdU1HIFeCnjI28W0/ytZosx3sr53KS/ldcUzhj4Qe7oXP2bFdmUJMNJv4h3NFpF2HvNpo
	Mieh0FNDuf8dvhamNeJG4JzajMLrCs7I3zEAmBliJbyLzdyUPzkq+sEtwS8qhEfu9dDrTU
	NefbKYKJZomfxRn+9KOpUY8yxrFbc4MBvTyB5Ouf1Qh2ziCgiU4FNALbxp4Txb5/NA39h9
	fundFwkYk3e+fAgi0fv4xHUm/BNKm4u1P/ou7PWHMvjIn9zQiVnEcIbyas1gSEIkYCTDeg
	uiGxOCp+O9HOOwMsL8zuTq5z4sMKqSpoAcsU0q5LSogQIX4e7kyd+B8nJGGR0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=tLeDTvhOlopO8mWHtAUXcGd29hb+8xAyrOVF30gQF8M=;
	b=YhBI99P0kCXy6laG1EbV1KSVTGDp97HGrjzrgReD2Dy5GUsbb2Hx7cjWcWNTbNamy2hMwO
	29pT8V6VXqGUNxBQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 13/45] genirq/chip: Rework handle_simple_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:07 +0200 (CEST)

Use the new helpers to decide whether the interrupt should be handled and
switch the descriptor locking to guard().

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -538,35 +538,25 @@ void handle_nested_irq(unsigned int irq)
 EXPORT_SYMBOL_GPL(handle_nested_irq);
 
 /**
- *	handle_simple_irq - Simple and software-decoded IRQs.
- *	@desc:	the interrupt description structure for this irq
+ * handle_simple_irq - Simple and software-decoded IRQs.
+ * @desc:	the interrupt description structure for this irq
  *
- *	Simple interrupts are either sent from a demultiplexing interrupt
- *	handler or come from hardware, where no interrupt hardware control
- *	is necessary.
+ * Simple interrupts are either sent from a demultiplexing interrupt
+ * handler or come from hardware, where no interrupt hardware control is
+ * necessary.
  *
- *	Note: The caller is expected to handle the ack, clear, mask and
- *	unmask issues if necessary.
+ * Note: The caller is expected to handle the ack, clear, mask and unmask
+ * issues if necessary.
  */
 void handle_simple_irq(struct irq_desc *desc)
 {
-	raw_spin_lock(&desc->lock);
+	guard(raw_spinlock)(&desc->lock);
 
-	if (!irq_can_handle_pm(desc))
-		goto out_unlock;
-
-	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
-
-	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
-		desc->istate |= IRQS_PENDING;
-		goto out_unlock;
-	}
+	if (!irq_can_handle(desc))
+		return;
 
 	kstat_incr_irqs_this_cpu(desc);
 	handle_irq_event(desc);
-
-out_unlock:
-	raw_spin_unlock(&desc->lock);
 }
 EXPORT_SYMBOL_GPL(handle_simple_irq);
 



