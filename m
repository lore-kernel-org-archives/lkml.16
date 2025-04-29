Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57E42C2ABB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909754; cv=none; b=hGxdVOVNKDDiuJVGKHWoAyyX4+k44hjkhYPpRPcH/QujjjeVnXkS1gNnIgFR8JQWb3tAdyiuVnKfQieQDCGg4nBKGKmMypdyyRv0M4HUMwQROaL2rrgyu5dVIxpBiG19nvURDFmpb2Rl6V0Hc/7DMpFzhDf1uni4/lBvWUN79lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909754; c=relaxed/simple;
	bh=NysoEMc8sHk+hVKOaj5S21HDxeYCPz+SeqCFfnyod/E=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=RgUufC1bY479Ps+H71wrU4vwClNvjkqGdw/fbIpO4lihtbtayTJMmleooj1yaxRoqupxg64loRCqNy9F7LxKR3a2SYraAmJ09rIyF5kijfzGbI/GwVw7ZItbAdJxYqHzewkTNJnNreUebueyTIfkd2cMsVXE84rc6JDX1yppJl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dNQg77LH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tFa+KQgV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dNQg77LH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tFa+KQgV"
Message-ID: <20250429065422.552884529@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PZStIo/KVfZY9c2a55J+FjqPZf5Oq/jY/bI6TOIxB5I=;
	b=dNQg77LHIKLmwifjssEqntiJ+FNc5lPiSsK2jCB0wmiVG+nxIVyqdTxZJ1fBK4lNejlCJc
	BiTlq3vJfnb2vLLn5lbZkjqAaLoRTBW4qlLaVUzeePfNXylHlTK1MCNzxV54sm/ykh0fLq
	FhF7QqrrzpPvxUgKTC50w9TDmozQYIR9MIhefBqzyy/cnByN0edLN7hIig8B6bSzWe51iF
	tHcZoXZILQJaiGOsPyXGL4WeQ5N5ofh2dS8YRekNvZaZaru4pXeaqseAb/VJT9vdLpdyvE
	fH2UXjkBIDkdkGv9iWPUoIhfVlloUoxZhFmTurax/ZIhhe+HbZzO4cFPHvrIcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PZStIo/KVfZY9c2a55J+FjqPZf5Oq/jY/bI6TOIxB5I=;
	b=tFa+KQgVRUkR5YzpN+oBXj0Q/YSWvu7m3z0dB6Zl+t7ho7doQKuHCo5tN/b8dQq/oqFrUB
	v9piSMcHb1ZHF6BA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 42/45] genirq/manage: Rework teardown_percpu_nmi()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:50 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2635,22 +2635,13 @@ int prepare_percpu_nmi(unsigned int irq)
  */
 void teardown_percpu_nmi(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc;
-
 	WARN_ON(preemptible());
 
-	desc = irq_get_desc_lock(irq, &flags,
-				 IRQ_GET_DESC_CHECK_PERCPU);
-	if (!desc)
-		return;
-
-	if (WARN_ON(!irq_is_nmi(desc)))
-		goto out;
-
-	irq_nmi_teardown(desc);
-out:
-	irq_put_desc_unlock(desc, flags);
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU) {
+		if (WARN_ON(!irq_is_nmi(scoped_irqdesc)))
+			return;
+		irq_nmi_teardown(scoped_irqdesc);
+	}
 }
 
 static int __irq_get_irqchip_state(struct irq_data *data, enum irqchip_irq_state which, bool *state)

