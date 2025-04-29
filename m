Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479432C2ADE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909756; cv=none; b=q8I6/sHom4cPvOW062h7XrYyfzkheBW5gxag1S6JhBT7u2J2THcFR3aQqmgRRYfLx90GAcidr1r9NB+pSriyRkukVCj92f7x2noNyM/qbQRwTkekFPtazKxjVOtkIV6teiLxy9iZZyPzz7LWo442KaBsn7XxDI9WJYBltVBsQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909756; c=relaxed/simple;
	bh=Pty16V0aUdjfc4iLm9KGFQyZNC+KLWVQ8C8jh9Mvng4=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=fv3+/8tTruIqX1Vg6bqnAvHCWW8Ql/2i2O9KVZcX2ZC7zuIs+9M6NLpQo5dtmyZYAKO77/035Z4j6erkgPs9JLBpAzCIrkYxuQks2kcS6gsslGYS8oYSz2THy6EIgUFdpIjtpOwGcWTTgSIO4KTdMOd38VTRLfBs83p3CU7XpgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JOZF6pR8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o3zdPGuW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JOZF6pR8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o3zdPGuW"
Message-ID: <20250429065422.670808288@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CREQ8Y0Hd7OuMmIhnKzrHG4hV9t2fLzNznUeP+yjxsw=;
	b=JOZF6pR8Sv/5j0E2OohaYJAddo0dGj4MNuaN/GNmYo8/ZyHeL537YQDfHtoQKHdkeyjlP6
	FH26fv+Ehgc5+P1GEvRMqY+yGPV5PIP2lzibtF7lEABmo7DFzheD+ca2a1Z+YSXtdc3QUH
	FdfktvpywHLLO0uq6+niiCzCV8k/5xx7KrBRNn1RKC79Nx40kQEXJS85xsqB7rZD6jCy6p
	4ygUQbrpbpTX/MWkTeSJ3PV7/qPk6/truBwDjHpinze+n/EpXvFD+MLUlMPMd8aETFuu8S
	pkc9E3R0aWl8wV1IXcxbC/dhJbVgoBOtMdz0aO9JpKpxeL818JDrGlIi0hCKtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=CREQ8Y0Hd7OuMmIhnKzrHG4hV9t2fLzNznUeP+yjxsw=;
	b=o3zdPGuW4pqyEaqyQ/guKsqKVDOpT0ZbmiI68Mmq5zJhUJrtV6NsQ6SXiEJ3QZajZHgagL
	D50LIncXtjUOqjDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 44/45] genirq/manage: Rework irq_set_irqchip_state()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:53 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   53 +++++++++++++++++++---------------------------------
 1 file changed, 20 insertions(+), 33 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2703,39 +2703,26 @@ EXPORT_SYMBOL_GPL(irq_get_irqchip_state)
  */
 int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which, bool val)
 {
-	struct irq_desc *desc;
-	struct irq_data *data;
-	struct irq_chip *chip;
-	unsigned long flags;
-	int err = -EINVAL;
-
-	desc = irq_get_desc_buslock(irq, &flags, 0);
-	if (!desc)
-		return err;
-
-	data = irq_desc_get_irq_data(desc);
-
-	do {
-		chip = irq_data_get_irq_chip(data);
-		if (WARN_ON_ONCE(!chip)) {
-			err = -ENODEV;
-			goto out_unlock;
-		}
-		if (chip->irq_set_irqchip_state)
-			break;
-#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
-		data = data->parent_data;
-#else
-		data = NULL;
-#endif
-	} while (data);
-
-	if (data)
-		err = chip->irq_set_irqchip_state(data, which, val);
-
-out_unlock:
-	irq_put_desc_busunlock(desc, flags);
-	return err;
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
+		struct irq_chip *chip;
+
+		do {
+			chip = irq_data_get_irq_chip(data);
+
+			if (WARN_ON_ONCE(!chip))
+				return -ENODEV;
+
+			if (chip->irq_set_irqchip_state)
+				break;
+
+			data = irqd_get_parent_data(data);
+		} while (data);
+
+		if (data)
+			return chip->irq_set_irqchip_state(data, which, val);
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(irq_set_irqchip_state);
 



