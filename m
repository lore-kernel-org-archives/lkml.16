Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AA02BD5AF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909722; cv=none; b=OxUSe8qfCEmM6KvV1btVj/2p7z+XKPtPg/KzPC8ZGV8BkuE5AICqb/K+xMTl6EkhBEoT/HlzBVpVMdO/xnor/eT64Vn3mBOZLPx2ylPIDwn9t7YXbDIJm7BlBrCM9jGsuQb11HuHeHeKhGG8Mn2vLtYgF+LcoXUUDLZPSQgQZSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909722; c=relaxed/simple;
	bh=Zyyn0b8pYfYTNd082gEspst2f0gS5WpoAJ7EljKJ5tU=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=HFLY8avwp5dVlbgfKdP8kq/DejgQR2UXnIYL9nASJbxagdHeGjUjWOKOQSnZWJ1LtZB9LmBPRNKuTq9CbjBAi0DL5oTYgUGtXYgmoGwmRT0+a2R+MMCbXvrZzdfbXVCkV5DXnESFp28Zgmu3y7a30j2Q6svn0uFn0ALLvHb5Xi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xf+3+cuX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SIJw9+IV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xf+3+cuX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SIJw9+IV"
Message-ID: <20250429065421.236248749@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=+KV90yNo+Gg1NpgnhoaNuQuxScQl8JaVVsaQRxBDSbM=;
	b=xf+3+cuXDQpMgYGRdhc9vWIDH3k3PARVie5iqu2iojIhaImjpezQbmZrI2St0o/lw07+Eg
	KvnIKd6C/D1A27WS8u4PAJkimhKgMAFTcu8nbJXF1tCe6S2eMuQ830tI69585NxQJ7p8R8
	wTL48cJ8dk14G+cUEXOAuUuYDMctEfcCUnQyxs0DABCUFNTxaA3YUNtUd3q06Fu48KXMh8
	91K3pxIpqRjH6E0BSsBk3+3WP76ncPzuCLNuruHT/JMd0K0xfod6GQYkZRJ5ux70UDZ9K8
	vnLAq5idO5Fk6qiDxBdQXSL7yxICfKHrGfm7ivBXKo8vVaA13GLS83iAZViUqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=+KV90yNo+Gg1NpgnhoaNuQuxScQl8JaVVsaQRxBDSbM=;
	b=SIJw9+IVlube8rFlbvNGzjt/e52dNLsT3ljTrBPJdvdqL2Eq6KVj5ACc0wlJKCjszuImXU
	CBZRa+oKCqoPjFAw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 20/45] genirq/chip: Use lock guards where applicable
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:17 +0200 (CEST)

Convert all lock/unlock pairs to guards and tidy up the code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1081,25 +1081,21 @@ EXPORT_SYMBOL_GPL(irq_modify_status);
  */
 void irq_cpu_online(void)
 {
-	struct irq_desc *desc;
-	struct irq_chip *chip;
-	unsigned long flags;
 	unsigned int irq;
 
 	for_each_active_irq(irq) {
-		desc = irq_to_desc(irq);
+		struct irq_desc *desc = irq_to_desc(irq);
+		struct irq_chip *chip;
+
 		if (!desc)
 			continue;
 
-		raw_spin_lock_irqsave(&desc->lock, flags);
-
+		guard(raw_spinlock_irqsave)(&desc->lock);
 		chip = irq_data_get_irq_chip(&desc->irq_data);
 		if (chip && chip->irq_cpu_online &&
 		    (!(chip->flags & IRQCHIP_ONOFFLINE_ENABLED) ||
 		     !irqd_irq_disabled(&desc->irq_data)))
 			chip->irq_cpu_online(&desc->irq_data);
-
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
 	}
 }
 
@@ -1111,25 +1107,21 @@ void irq_cpu_online(void)
  */
 void irq_cpu_offline(void)
 {
-	struct irq_desc *desc;
-	struct irq_chip *chip;
-	unsigned long flags;
 	unsigned int irq;
 
 	for_each_active_irq(irq) {
-		desc = irq_to_desc(irq);
+		struct irq_desc *desc = irq_to_desc(irq);
+		struct irq_chip *chip;
+
 		if (!desc)
 			continue;
 
-		raw_spin_lock_irqsave(&desc->lock, flags);
-
+		guard(raw_spinlock_irqsave)(&desc->lock);
 		chip = irq_data_get_irq_chip(&desc->irq_data);
 		if (chip && chip->irq_cpu_offline &&
 		    (!(chip->flags & IRQCHIP_ONOFFLINE_ENABLED) ||
 		     !irqd_irq_disabled(&desc->irq_data)))
 			chip->irq_cpu_offline(&desc->irq_data);
-
-		raw_spin_unlock_irqrestore(&desc->lock, flags);
 	}
 }
 #endif



