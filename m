Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B132C2594
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909751; cv=none; b=PuWQ/WHvI2zSbe5m+RkhDs0nJs6F4v80F0d5aZnNed/V2E+oke/Zl7aXE5T9gVn1H67mI3kc+3860UubBg3SXNtM0b5uk3wrB2se33KcnlNWs1eHbGcqXHxt4uCProuNr4vRhHGPeEdLOcP2I5+dkZTiZYSYNF6G88fdT3jlXWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909751; c=relaxed/simple;
	bh=P42hnB6j3DJbVSHlLu4GOxnDjvWen9dRzM9wM4+LWJA=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=qbiewwr5VeT7dl1g1Jyy6MxSzKKfNMlrIeJbkHJYCzDi5Xkh8UGhajxYGNrVESIEfX04DurK+880SLCJnKoVoo5pVeVxfhAmjt0R7ej02oMRcoUnSll6Wy9YoepOAX5BmFJ9KMas0f4S2t21VYac0Th4OV22Z+mJgc73fkAZqZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P7PybItJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dFE1BBCf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P7PybItJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dFE1BBCf"
Message-ID: <20250429065422.435932527@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=65sRjBqgyaDaw21QgaT0ciFt04GaxsOuuK1XPfRRKqc=;
	b=P7PybItJVQhnSagNun2aEZEXGnz3La+FRvDPBBRznjoUhthU8zS56yDrLto0wKtKkuErl+
	qsMeOw2fIl0WhbMtd6b/J6bpobM+nrev8Vt5ChKfeo+UflbU/0hSwfTwIXbacFQL1/Bg8r
	U3i/GHNT6KlqhzC1AsroPZIgO+Ck7LMSl2Qt3wWGNQIDOaj8gV0wrdWQL42fk/gniPmKPP
	JxHFp//T9bZ6dqYkdgyjG6BXufJZdyXz0W2pGmNvY657iD/qgYMA8eV0NJZzHyLVJdJEeH
	fEnXd9mm6ELFo3geyzs+Jx1JTb7y68115ZNWeM6EOjm9HvJRTfh03zn9HcQRPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=65sRjBqgyaDaw21QgaT0ciFt04GaxsOuuK1XPfRRKqc=;
	b=dFE1BBCf2Dmv2DSE3hZphaOrXYsD06DjVLuLx/N1TmPYNIiANJFHenjpmvuDHdVjbGr9HR
	ESMdqDiJl1TY6eBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 40/45] genirq/manage: Rework disable_percpu_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:47 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2329,15 +2329,8 @@ EXPORT_SYMBOL_GPL(irq_percpu_is_enabled)
 
 void disable_percpu_irq(unsigned int irq)
 {
-	unsigned int cpu = smp_processor_id();
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, IRQ_GET_DESC_CHECK_PERCPU);
-
-	if (!desc)
-		return;
-
-	irq_percpu_disable(desc, cpu);
-	irq_put_desc_unlock(desc, flags);
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU)
+		irq_percpu_disable(scoped_irqdesc, smp_processor_id());
 }
 EXPORT_SYMBOL_GPL(disable_percpu_irq);
 



