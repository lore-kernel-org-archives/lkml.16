Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803322BE0EC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909725; cv=none; b=H3opC25CI8zIN4OXIMwJCq/Z1QTz6p7spXFcYIh2A7nziEMzmRTnl4c9l0BRHJ0oAyxyIJFbPhjLKkvm2uPNos8lYytr9HkonSOwCa0V5lnEeWXMP9yj0PGzvVVV9LqIRXb/uCXwfiyhzisWyo3iudpf6ljVStTQ9Y2oFy3tvwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909725; c=relaxed/simple;
	bh=Yuvj5vXczApFsUTUfuq/AFPun9HkDFo5MSzEN/HdA2M=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=Sw39NKWkmQy/+buJ0abXjQ/ytnDpJiEipOSYjWqX/rkxYY5BJzI6R+Bto9kjdFrgoGfJf6+7/nEub4ETisspFkoZj0oSb2EOAYvGZwoDv96QdE/UiJQAmKwZhqVjL1by6eHfUUS3g01xdvL4Ueqgtb3s9/pHUqd7Ey8IJM3uftg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pCx4+HgZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eVl3gGU8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pCx4+HgZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eVl3gGU8"
Message-ID: <20250429065421.355673840@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=mBJqPlklc0FYu+2IBvY7En8BpltE37+szQDuVdfinoE=;
	b=pCx4+HgZ6/T6w8PE3ZoEmVEN3aUeyaipV02ceOJj+V4ech4NkaTEWOPaofU/tMGPT0se5o
	6g9Acxa+imcsxCtUKVf3llsQZK9eLZ489rIFlcIWWE0VDzfbhE9ypn/ukpMtbKMT6cEp32
	tpz3oZpju7LyXVChStnMR9RK5FkIU0rDVH4Y+udIjD8N0f463PEtc2knpYsNi6GdRGPn7/
	/fEB2Ih4Mo/PL+aexS7DQzzO7myoeeQoFa8ddxEF492FK5hDXh6lA5W06vACfIFE97dST8
	4pvgnFLotZfmvzcSiMY0P5x/7N3Mdbhwma5iphQTHGOm5UxOuAhscMwwOT2Egw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=mBJqPlklc0FYu+2IBvY7En8BpltE37+szQDuVdfinoE=;
	b=eVl3gGU8381JQaz+AgKCYzFfUgHCivD970bhyROOuh5UmJxIFsK8YfpbAPyDA+FCIECRDL
	EAML/qx+4+HlUUCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 22/45] genirq/chip: Rework irq_set_irq_type()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:20 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -54,22 +54,15 @@ int irq_set_chip(unsigned int irq, const
 EXPORT_SYMBOL(irq_set_chip);
 
 /**
- *	irq_set_irq_type - set the irq trigger type for an irq
- *	@irq:	irq number
- *	@type:	IRQ_TYPE_{LEVEL,EDGE}_* value - see include/linux/irq.h
+ * irq_set_irq_type - set the irq trigger type for an irq
+ * @irq:	irq number
+ * @type:	IRQ_TYPE_{LEVEL,EDGE}_* value - see include/linux/irq.h
  */
 int irq_set_irq_type(unsigned int irq, unsigned int type)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
-	int ret = 0;
-
-	if (!desc)
-		return -EINVAL;
-
-	ret = __irq_set_trigger(desc, type);
-	irq_put_desc_busunlock(desc, flags);
-	return ret;
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL)
+		return __irq_set_trigger(scoped_irqdesc, type);
+	return -EINVAL;
 }
 EXPORT_SYMBOL(irq_set_irq_type);
 



