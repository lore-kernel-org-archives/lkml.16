Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082B2BE7BD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909729; cv=none; b=myir7Vci60XSfP1iQt7oRWJN27KCoYFt9f85uz7BErgL3bnc4+XtRgB56B8TG+4RyCOp3kh9A0NGG9IQ65M3uZgbfl9UbdxndYOJcqMp5qhu/NmOtnuuywgpadrEe6KL5kPo/xP+gK8KesnX3C+3nkfsmLBcVtRkplJpXoEzsNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909729; c=relaxed/simple;
	bh=/xFqWxDOQcLY5sARogn1L8CamXbgGc5iEeMfrjVgUhw=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=rX5wv4B3pguyxGqZdycLY3iWaaKfA3o7+50fQKHM9s+eoWS/tuzKC/IQ/LFYqQH1aNMnyOYvrm+dAMNMlBX7RSfZu3uN3vkB/ygifCgUx/pD2L2wWqG7SXxJyE7cggFglt01XqNdSyylbX9NTRHwXvbbODc84g8aWU1wGNlfVs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J6AQIgvz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Jl9laiI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J6AQIgvz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Jl9laiI"
Message-ID: <20250429065421.532308759@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dawquaW1ByrXorIP1SoqONqlwfMGSrQIBJriFwabwNQ=;
	b=J6AQIgvzamqvO/pClcTpPJ+1Vufdm11/qr7IWT2OroAoEmuoR+j6qDUMhX3yfnCAos4ZBc
	Xdv7aPnI/UwjQc+BCK2+QK4G2ciL0Yk9FiPHW+nZhaLelCk6ageQRxRpfhmmch+XoeYUfG
	X/JsOgHLlovrCHOHtmJ6/izigs5RxSRTmYEhE+6DHgjFHQFJeiMr6lRlqt/Joc18+pJ2aq
	/kRhnBDfmrYbLcABhnUYrM+MkQEFjatzRadQsJdzcGkWgNznBwosn8RXFWHo1YIFWEpxJ0
	LoYBZY8kH5Snm20AN+px587E1Kq384fW4Rtnx8CJAyMOmJp4hXBjip3RRLMr5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dawquaW1ByrXorIP1SoqONqlwfMGSrQIBJriFwabwNQ=;
	b=2Jl9laiIqnruA5fbLkQ0qD5jUGJ6Mq5XhkpLsHNQGVIZtTM6pQdO35T92zSmrDrkXHV8ut
	09LuNwDecVLT9fCA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 25/45] genirq/chip: Rework irq_set_chip_data()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:25 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -115,22 +115,19 @@ int irq_set_msi_desc(unsigned int irq, s
 }
 
 /**
- *	irq_set_chip_data - set irq chip data for an irq
- *	@irq:	Interrupt number
- *	@data:	Pointer to chip specific data
+ * irq_set_chip_data - set irq chip data for an irq
+ * @irq:	Interrupt number
+ * @data:	Pointer to chip specific data
  *
- *	Set the hardware irq chip data for an irq
+ * Set the hardware irq chip data for an irq
  */
 int irq_set_chip_data(unsigned int irq, void *data)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
-
-	if (!desc)
-		return -EINVAL;
-	desc->irq_data.chip_data = data;
-	irq_put_desc_unlock(desc, flags);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		scoped_irqdesc->irq_data.chip_data = data;
+		return 0;
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL(irq_set_chip_data);
 



