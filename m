Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015022C10A6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909745; cv=none; b=LriodpIp+1BcWuTfbrMW0Ro+m/N8KwldXfzMKD8pVDnbTtQn9b5SZbLSWks4/e05RcneoCkLDkXPWXV2DdIgkUKMMVc5V22dXCFyl2ZMfz5yiJYA/xBAW0mgRirS+Mq0uXdonnEbGS1ViqYnc4HQRZY/nUhxlWKEy38j8Y0ybnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909745; c=relaxed/simple;
	bh=hp1XbnU/jvxo7xR1mH4pdc8VWSxrDmBVBzwN/X7WGPY=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=Q/WY/wY2hQRiWm5MS2ia+yVsC4rhgvByA99dJ3Y3q/WhM+GGYySdVqJ2YagN6Ocge6g5Yxz3/owpKz4vkbM5fY3nlPKTvz5mYu8FGmfG4FpFKgeg9WuiNhU2ns3EBO1fNwUR5BEK/42K6E9kuJVt4bd71w3h+UCZRsYe/C8DoF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SoZBHu2k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Z5tqrUB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SoZBHu2k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Z5tqrUB"
Message-ID: <20250429065422.187250840@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=7H2bRV4kA50vCHAXHxdbJBAI6o+7XpjxSy9MxMVDH2c=;
	b=SoZBHu2kxLgrpqZMw8oggbTcP1Av0Ri04+tEXXeNn1v/OgyEGZBoOxp9Ec4L+n/vbW8ElZ
	n6JYuc22lzsrrqOs2QpXXl03rvG1yPPLZDOE/dPjkthSEK7hvnleiCf1HmpGzJ9/g7aiEN
	/Rw5QPnKH2fhKuPHPsllpDXHow0tReE1gRWZrxKlgRJc8E3tyDw/An43Vs2swE3/ghPS3P
	M/OOj0xGTgrLeQ0DSY4W+/An4g7tveGG5Mj4w802Ifl9ZTx3YW1m0cRPbB6YnhjTdRynXz
	ag/QuJJt5JyFVxJg74RS0R2kzUyXQBwCqgkQpD5skPVoCwkl+HbxBrgam7OOKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=7H2bRV4kA50vCHAXHxdbJBAI6o+7XpjxSy9MxMVDH2c=;
	b=2Z5tqrUBFzYRoVSZKJPqhXg7SC9d+kmCJ65mJVl22RfOSTW+mfgr0eJQZEb2kH76KOFDsx
	U5u2Hg5wmv7B8ZCA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 36/45] genirq/manage: Rework can_request_irq()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:41 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

Make the return value boolean to reflect it's meaning.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 include/linux/irq.h |    2 +-
 kernel/irq/manage.c |   21 ++++++++-------------
 2 files changed, 9 insertions(+), 14 deletions(-)

--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -700,7 +700,7 @@ extern void note_interrupt(struct irq_de
 extern int noirqdebug_setup(char *str);
 
 /* Checks whether the interrupt can be requested by request_irq(): */
-extern int can_request_irq(unsigned int irq, unsigned long irqflags);
+extern bool can_request_irq(unsigned int irq, unsigned long irqflags);
 
 /* Dummy irq-chip implementations: */
 extern struct irq_chip no_irq_chip;
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -887,22 +887,17 @@ EXPORT_SYMBOL(irq_set_irq_wake);
  * particular irq has been exclusively allocated or is available
  * for driver use.
  */
-int can_request_irq(unsigned int irq, unsigned long irqflags)
+bool can_request_irq(unsigned int irq, unsigned long irqflags)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
-	int canrequest = 0;
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		struct irq_desc *desc = scoped_irqdesc;
 
-	if (!desc)
-		return 0;
-
-	if (irq_settings_can_request(desc)) {
-		if (!desc->action ||
-		    irqflags & desc->action->flags & IRQF_SHARED)
-			canrequest = 1;
+		if (irq_settings_can_request(desc)) {
+			if (!desc->action || irqflags & desc->action->flags & IRQF_SHARED)
+				return true;
+		}
 	}
-	irq_put_desc_unlock(desc, flags);
-	return canrequest;
+	return false;
 }
 
 int __irq_set_trigger(struct irq_desc *desc, unsigned long flags)



