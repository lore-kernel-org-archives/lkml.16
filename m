Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB22C1797
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909743; cv=none; b=OGdIkrAqs2gmFJiEYjutXo3luASrBpHKp0IuM+zPWuZMcc2WmpFB9FatdJ5QEFM2Zo0ZEJyne3C+tw2TLG40zbda8fjxLIPi6Sb1WR8KxZMXuxQw8ONOBtblppNYHokaBg8WsXXYIDlSgdtBBUlbEWgHRktJZp/TT1TKeHpOKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909743; c=relaxed/simple;
	bh=EuLYauwadghvJEvsNd6VI6s0gL8WDpjyJCnEyNnJjlI=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=MoDUnlrsFJHL3vTun/fVLitXJwiloAkypv3xnDSP1ck3WBsTIXmtgGpeJy0Zp4PxeDC2FSID7g/cOyXE2eweTaf/CJORG0hqkT9HMxAp48RCBBTwWXueH7ndCaLxmOyLXdAHSsQ5CiLQ1nSdVM1zJmA+Xw/dHHO5UAI0jg1CL/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ffhiiDhB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cexvem7N; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ffhiiDhB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cexvem7N"
Message-ID: <20250429065422.128859754@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=HsKlxOdXhcjf92lznpzYlonKTEkeL+LMzog3zS1q83Y=;
	b=ffhiiDhBgstfmBgasZPSHm7SzZZrXIyY/RYMxBOgZmEgbGrF3ccMtyZ7dea6KOvmuGl0ZE
	Nnw7CDAvELM8ibLJZr2oLT7l4vdoWEmdNAW+/WhiBOfJtFLwkNYRzL9JCFnh5o+QZEWW3B
	wn05si7mswUZOsaIeOjytkTPkb/tMBDfka1fQpsZljqZTW4NInNqkHSywSAdeBh0kcC3C+
	iSulyE/UIvJ24h2odbY2Itx45p9hRAXqnf/zgiKIhqs4QWdKMz+XHhg9R7Iw8+972RWcdD
	+nFEY7CTIyy1gkPlaRN4RC/5pG1kND9PSQDr0znfv/1LlMlMtpJ1o5nZfn/8tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=HsKlxOdXhcjf92lznpzYlonKTEkeL+LMzog3zS1q83Y=;
	b=Cexvem7N6BM01y9ddj3F7PhILxJX8v3Onwit+nLxdUBk877q4KvoJstToeFlg03BB3S83W
	d/c3XyPLe6Qg/QDQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 35/45] genirq/manage: Rework irq_set_irq_wake()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:40 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   61 +++++++++++++++++++++++-----------------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -845,44 +845,39 @@ static int set_irq_wake_real(unsigned in
  */
 int irq_set_irq_wake(unsigned int irq, unsigned int on)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
-	int ret = 0;
+	int ret = -EINVAL;
 
-	if (!desc)
-		return -EINVAL;
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		struct irq_desc *desc = scoped_irqdesc;
 
-	/* Don't use NMIs as wake up interrupts please */
-	if (irq_is_nmi(desc)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+		/* Don't use NMIs as wake up interrupts please */
+		if (irq_is_nmi(desc))
+			return -EINVAL;
 
-	/* wakeup-capable irqs can be shared between drivers that
-	 * don't need to have the same sleep mode behaviors.
-	 */
-	if (on) {
-		if (desc->wake_depth++ == 0) {
-			ret = set_irq_wake_real(irq, on);
-			if (ret)
-				desc->wake_depth = 0;
-			else
-				irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
-		}
-	} else {
-		if (desc->wake_depth == 0) {
-			WARN(1, "Unbalanced IRQ %d wake disable\n", irq);
-		} else if (--desc->wake_depth == 0) {
-			ret = set_irq_wake_real(irq, on);
-			if (ret)
-				desc->wake_depth = 1;
-			else
-				irqd_clear(&desc->irq_data, IRQD_WAKEUP_STATE);
+		/*
+		 * wakeup-capable irqs can be shared between drivers that
+		 * don't need to have the same sleep mode behaviors.
+		 */
+		if (on) {
+			if (desc->wake_depth++ == 0) {
+				ret = set_irq_wake_real(irq, on);
+				if (ret)
+					desc->wake_depth = 0;
+				else
+					irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
+			}
+		} else {
+			if (desc->wake_depth == 0) {
+				WARN(1, "Unbalanced IRQ %d wake disable\n", irq);
+			} else if (--desc->wake_depth == 0) {
+				ret = set_irq_wake_real(irq, on);
+				if (ret)
+					desc->wake_depth = 1;
+				else
+					irqd_clear(&desc->irq_data, IRQD_WAKEUP_STATE);
+			}
 		}
 	}
-
-out_unlock:
-	irq_put_desc_busunlock(desc, flags);
 	return ret;
 }
 EXPORT_SYMBOL(irq_set_irq_wake);



