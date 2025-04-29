Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40CF2C2AAC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909754; cv=none; b=Vz+u8UIMc44OlfBbujF1REGjG+FyBmmT+2SrLTclkZf06xHntVV4b1qCOymEFI9T3nPZaBbWphrURKgY+D7vrwOy7yyUDh6a53SeDSaFYM4NsOmoOgby0IWVS8HBFA4kJFp9TVOsj8rP6m9/AXiF/AQGutJYsSuYepdy/KZniiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909754; c=relaxed/simple;
	bh=EscLPA6Ui9DVdZvvRYs/ZOQxb87jF2v0Kse8MMN7sfo=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=m6CSaBAkvm5+P850nhMm72+PwNV0jaYoATizgFJ6b4BudHHInpvrT6uAvyxYU0xBSOXh/hC2gnlQk2Ks7wRJuMYMyxP/PygefvADF7aOr3v03rb/7aMHX+0fTH37P9Zzpq+TwdN7oRyUa5efKCz8Kc15RuWXAbYeMjVVdlptvk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ov1kbNuo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6IZ458hB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ov1kbNuo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6IZ458hB"
Message-ID: <20250429065422.494561120@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=teNvXoruARNQEkuaxvyETAwfG95tGssxz5B3UPQFHUg=;
	b=ov1kbNuoIspQh+02lNjTXR+jaBXnpv7kdtnhxw4laYk5Moyes+9leCPE3sMlNCz3Sq4h6n
	ubZ8MX3D6fRkEN3yL7vM7SXnSB0IXS09g+pCv2PsURfhLPxKRtxQ58f7O2LM91SDIGckJT
	lwh9iAi/t9cOAKrbGO2BpISwHhrVK83k6Ap1gZ47AfO2EbSrvYkGNIfSWsbPERg8/ySimN
	R9JyCi2rbJ7BO8MW6NC5oNQ2gX2UWYKbpZhB2gWWzets+Z0KheLNQGkv7+1RKiTedTYS0r
	oVhvP/tnuIh/NwnDLp5Xn1KsEuLPJQiX+7xOTDnsM11307Byxu/bi2m4kl1Qbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=teNvXoruARNQEkuaxvyETAwfG95tGssxz5B3UPQFHUg=;
	b=6IZ458hBxnewxnk0a+FbeBnUbvaaQTv5msfge8FKmlaSK24ez2p8uFfwVnwE1i5+tpmysW
	F3hWoDMxRUzVH/BQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 41/45] genirq/manage: Rework prepare_percpu_nmi()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:49 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2605,32 +2605,19 @@ int request_percpu_nmi(unsigned int irq,
  */
 int prepare_percpu_nmi(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc;
-	int ret = 0;
+	int ret = -EINVAL;
 
 	WARN_ON(preemptible());
 
-	desc = irq_get_desc_lock(irq, &flags,
-				 IRQ_GET_DESC_CHECK_PERCPU);
-	if (!desc)
-		return -EINVAL;
-
-	if (WARN(!irq_is_nmi(desc),
-		 KERN_ERR "prepare_percpu_nmi called for a non-NMI interrupt: irq %u\n",
-		 irq)) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	ret = irq_nmi_setup(desc);
-	if (ret) {
-		pr_err("Failed to setup NMI delivery: irq %u\n", irq);
-		goto out;
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU) {
+		if (WARN(!irq_is_nmi(scoped_irqdesc),
+			 "prepare_percpu_nmi called for a non-NMI interrupt: irq %u\n", irq))
+			return -EINVAL;
+
+		ret = irq_nmi_setup(scoped_irqdesc);
+		if (ret)
+			pr_err("Failed to setup NMI delivery: irq %u\n", irq);
 	}
-
-out:
-	irq_put_desc_unlock(desc, flags);
 	return ret;
 }
 



