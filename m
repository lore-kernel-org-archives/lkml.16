Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C60274FF2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909707; cv=none; b=SN/NldMUr6rNziiV2zREw5ljrD55ls+7jLRbB8OmkZq18QQ5g34wlCoPPzyS8sNxo3c/U+nVjo4AeaLKcMn5Z7toevkvbwqp4myvXkBnmKBxvFGhgkB5awXyHnvU0Ait3NJ1KutwqvcSiKwdGZpD3gqiqhMg40y+BCjhpI6bx0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909707; c=relaxed/simple;
	bh=VcRYaZtM9wzeeqjgdaUm7JvL7Sr89tNJHk3nn7VOPVg=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=WmqdWszuUgAROR2NpUwbl0jmpaLtoLfDDbStZEU3lXSPWfUNJ6NMqDNQiWR48LwzvfrTWMa0qEnC6X2CnvYHkH848vlbK8yVS1G9LIYVnJnvcwWwwSNcosQ5l9dIq3BJMe5NlaTOJBDCbX3KiEGneAgAXinpCLO1tagAh3x439k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=baYSX7jq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O3k9tqab; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="baYSX7jq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O3k9tqab"
Message-ID: <20250429065420.682547546@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QN6bEzxyXGVAZ9bIwLpJ9oOlP1yu1xAu69uA1smVlqE=;
	b=baYSX7jqxK4G49pyFxbjOeqOcrUJR2J2beKiaJVdPElZqJrD8oUlZzUvJeAoA6BFlItEBr
	SX+8lNhd9CrvDIv9eGXVMmDYno2syJKp+56mHO+NQGWMpW55AxhOCmfg3quvXbZZB1jpNE
	8LR+8xZpGLwTq6edSAjOT2v5bkRniiYqe3O9JD7y+u/ULk50ckCuNBoVupG2tzRHEi2Z8r
	JEc3haZeG54S5RF3mgJjM+Q5mTIS/PdolkG5uwmS/ZrB3SvEr4pATBxjj6vLjPcGWsrUHF
	7ceR7pUJSrM0PPlu16C4tXa7XVFP4n5EKJJHVk7uRKgbaWh45vH7C1SsYqgwcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=QN6bEzxyXGVAZ9bIwLpJ9oOlP1yu1xAu69uA1smVlqE=;
	b=O3k9tqabgzhqFB1//973jxggWOTYaLBHz6ojeoEqZ3fJZakaDtGc7UaOA9ki/IfN9vYR7n
	DPst2iK41z7zw7Bw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 11/45] genirq/chip: Prepare for code reduction
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:04 +0200 (CEST)

The interrupt flow handlers have similar patterns to decide whether to
handle an interrupt or not.

Provide common helper functions to allow removal of duplicated code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -499,7 +499,7 @@ static bool irq_check_poll(struct irq_de
 	return irq_wait_for_poll(desc);
 }
 
-static bool irq_may_run(struct irq_desc *desc)
+static bool irq_can_handle_pm(struct irq_desc *desc)
 {
 	unsigned int mask = IRQD_IRQ_INPROGRESS | IRQD_WAKEUP_ARMED;
 
@@ -524,6 +524,25 @@ static bool irq_may_run(struct irq_desc
 	return irq_check_poll(desc);
 }
 
+static inline bool irq_can_handle_actions(struct irq_desc *desc)
+{
+	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
+
+	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
+		desc->istate |= IRQS_PENDING;
+		return false;
+	}
+	return true;
+}
+
+static inline bool irq_can_handle(struct irq_desc *desc)
+{
+	if (!irq_can_handle_pm(desc))
+		return false;
+
+	return irq_can_handle_actions(desc);
+}
+
 /**
  *	handle_simple_irq - Simple and software-decoded IRQs.
  *	@desc:	the interrupt description structure for this irq
@@ -539,7 +558,7 @@ void handle_simple_irq(struct irq_desc *
 {
 	raw_spin_lock(&desc->lock);
 
-	if (!irq_may_run(desc))
+	if (!irq_can_handle_pm(desc))
 		goto out_unlock;
 
 	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
@@ -574,7 +593,7 @@ void handle_untracked_irq(struct irq_des
 {
 	raw_spin_lock(&desc->lock);
 
-	if (!irq_may_run(desc))
+	if (!irq_can_handle_pm(desc))
 		goto out_unlock;
 
 	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
@@ -630,7 +649,7 @@ void handle_level_irq(struct irq_desc *d
 	raw_spin_lock(&desc->lock);
 	mask_ack_irq(desc);
 
-	if (!irq_may_run(desc))
+	if (!irq_can_handle_pm(desc))
 		goto out_unlock;
 
 	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
@@ -695,7 +714,7 @@ void handle_fasteoi_irq(struct irq_desc
 	 * can arrive on the new CPU before the original CPU has completed
 	 * handling the previous one - it may need to be resent.
 	 */
-	if (!irq_may_run(desc)) {
+	if (!irq_can_handle_pm(desc)) {
 		if (irqd_needs_resend_when_in_progress(&desc->irq_data))
 			desc->istate |= IRQS_PENDING;
 		goto out;
@@ -790,7 +809,7 @@ void handle_edge_irq(struct irq_desc *de
 
 	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
 
-	if (!irq_may_run(desc)) {
+	if (!irq_can_handle_pm(desc)) {
 		desc->istate |= IRQS_PENDING;
 		mask_ack_irq(desc);
 		goto out_unlock;
@@ -1166,7 +1185,7 @@ void handle_fasteoi_ack_irq(struct irq_d
 
 	raw_spin_lock(&desc->lock);
 
-	if (!irq_may_run(desc))
+	if (!irq_can_handle_pm(desc))
 		goto out;
 
 	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
@@ -1218,7 +1237,7 @@ void handle_fasteoi_mask_irq(struct irq_
 	raw_spin_lock(&desc->lock);
 	mask_ack_irq(desc);
 
-	if (!irq_may_run(desc))
+	if (!irq_can_handle_pm(desc))
 		goto out;
 
 	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);

