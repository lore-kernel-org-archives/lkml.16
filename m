Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5ED2C10B9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909742; cv=none; b=dV8kUVr5LqyL0vLpX/7Rlf937qbKcYKWsa1C/GBKpNXT+dhWcMysCPQe2Z/tycZJP0/xfGQeQs1X8JFwF7i5xlBE2Kpx9wgcVcaqWr0jx+bbJmsQxxUToj7bnHLmXkDI4RfayP6F/6b3K4WVHwiCNpI4dUUU/epbQFU9wule6vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909742; c=relaxed/simple;
	bh=BeD5kZT74bu3qyAzu3fyRx9ZyaUisi/okyxKpdNbjSY=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=JbBXxrAvFSDpDnpLXatUIk4frThKbFjcJVuTuwnlbv0kTe9KS0yL6KPXWxyz+iaZf5hzadVUGRr78+pOYy/Q6LKtg2YZA9HGmtQhKrR/OoqqxscGAlkCnSlnLJ4uXmNmYzxAjaIhZr+miF6AU/iv6Ax4u+az3+D8tVHaE7fKook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nWhVKtSk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=grGXVVIj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nWhVKtSk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="grGXVVIj"
Message-ID: <20250429065422.071157729@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oRbFP2vqazsQwq3w2vtQwN8kPro/wwr3nyA7EAA8DbE=;
	b=nWhVKtSkWMo1lTQqzeMWKJe5HV7E1xkRvPMXzQHpwNkZoNr4rgxKlDbwHOwRNMfO7WHDJy
	62Ic8qG1hQfBQfeEvYqMaPX3sMZb+1/OX2NQq/ITO/QeAGiDUn6AKb63VuoBYLubFbL9u+
	kUHEbrAo6tbS+pAMzu650SIEhbmoqWHEQ8sskIV+2ocDFw/JnUMMhiufkLCdvyIvlpp1vJ
	076caJA4aiQGSLxdpTR85lIOi9eIYhnOEs/sgty3t6be7P+zxfSfG1vkg83B8o0LZq5QaK
	Ovr19kw6l/snFTNGdJIiOQcLjydMQH+XXdc5BWUGsKzSmArLrl3cr2EFsp51JQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oRbFP2vqazsQwq3w2vtQwN8kPro/wwr3nyA7EAA8DbE=;
	b=grGXVVIjqeruCd2YEMqJ7gthA+2wTKP3qyxH62JFFQYdkSJeS2IBdaJB6QrWx2i9uDJDfv
	qCIm6zndJDNwJwBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 34/45] genirq/manage: Rework enable_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:38 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -788,18 +788,13 @@ void __enable_irq(struct irq_desc *desc)
  */
 void enable_irq(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		struct irq_desc *desc = scoped_irqdesc;
 
-	if (!desc)
-		return;
-	if (WARN(!desc->irq_data.chip,
-		 KERN_ERR "enable_irq before setup/request_irq: irq %u\n", irq))
-		goto out;
-
-	__enable_irq(desc);
-out:
-	irq_put_desc_busunlock(desc, flags);
+		if (WARN(!desc->irq_data.chip, "enable_irq before setup/request_irq: irq %u\n", irq))
+			return;
+		__enable_irq(desc);
+	}
 }
 EXPORT_SYMBOL(enable_irq);
 



