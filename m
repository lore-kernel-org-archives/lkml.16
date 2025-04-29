Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2432C2ACD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909755; cv=none; b=O6j0mKy/ND92Gg5mUATQUfx6T6zc3LKwF3zi0sbWM2KWvqL2OcWawfwqsXG4W1iNtqhjM2J8JZkF/H5fTj6Bj4gdFSBbnbS1i8GpHJDDyCL2RcF0mHKwdxJ4Z5HHsUyF5hwJ4XrCr8exEKNwlHgk/yv0DK+MCev/lEEiOPMav4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909755; c=relaxed/simple;
	bh=CqOoBoxPn59Lk+B8VXRAe/PpXesnV+W6WcfsyWXUY9g=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=PShqk/P/Qj2b3IKPpc/cXgBL98ks6UDXttI750pZvzCJJAy2mFiLsZHW8ycCGH9xxf6F/1bM/WvtC3FoLAZLb3Ps3cg9S6H04GF/6xj+/SprTBx/lsRrDrxbvSgakXMiBxQNd+G1jrlns8RU03ut84zjHChS1SHcg7n9SHIutyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gv2fJPta; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qOJenP7O; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Gv2fJPta";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qOJenP7O"
Message-ID: <20250429065422.612184618@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EEtdnupWv9I26kCA+YPdjj0rMnyT0nFIZklaHgPYBc8=;
	b=Gv2fJPtavN/1+d1lJIKPjlOIGFdxz/bK2L5cC49n8lrUiEoIRXLioIEeNBzqqjzf7WUOLO
	xIzb99Vx1Mfg03g3pVZ2LKyzRLNTQ0xWYJw+pxX5tu1UMWAdughQA2mPYbYDYiiGRJiRs3
	0jDrUeKmjoE8nEdVcMLAT3OL5apPCy0jwxRC3CTtZEvuaSXcKZE3LisU6IJX+uPCQfGnOd
	eNRRnVXVGDk/6DEE7FBbplQngOBu5HcX975HBmKQXa+unSJ1zhy3rbPxpelQTKMKxnFbVR
	28QQmmMNU6Av5cXkunWPdql96WDWlkGSQtk4t/lbVRgVZShktsQnZBYX2OKpZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=EEtdnupWv9I26kCA+YPdjj0rMnyT0nFIZklaHgPYBc8=;
	b=qOJenP7OARXJogVZmxGOZuzyZyQTbI/jNRZASdD4HY25YUp9WrYvghrQ/f9Ao/0sMmkHfS
	FqRxl14Jrk4fQ/Dg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 43/45] genirq/manage: Rework irq_get_irqchip_state()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:52 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2678,24 +2678,14 @@ int __irq_get_irqchip_state(struct irq_d
  * This function should be called with preemption disabled if the interrupt
  * controller has per-cpu registers.
  */
-int irq_get_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
-			  bool *state)
+int irq_get_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bool *state)
 {
-	struct irq_desc *desc;
-	struct irq_data *data;
-	unsigned long flags;
-	int err = -EINVAL;
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
 
-	desc = irq_get_desc_buslock(irq, &flags, 0);
-	if (!desc)
-		return err;
-
-	data = irq_desc_get_irq_data(desc);
-
-	err = __irq_get_irqchip_state(data, which, state);
-
-	irq_put_desc_busunlock(desc, flags);
-	return err;
+		return __irq_get_irqchip_state(data, which, state);
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(irq_get_irqchip_state);
 



