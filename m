Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7AC2BE0F6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909725; cv=none; b=kd25Uxn1C4vIIHaGkAg+1bE05PeU6d0oWFI0JF09MbcdIOg0+Kd2/Cp3HbglgS9y5QXYGIR7i4OPU2I6vDjkGMD1GUlCuBb4l0KVTyCQaMaVxIGrtDxwyeaHDl+lw62gKoVFp2qST+jRS7VoXQ177RP+d5sDcavNw1Mebi3HcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909725; c=relaxed/simple;
	bh=WnaFCQNi32Ga6a3ETJu1H0bGRqKZ2xjzvnigGEf+zKw=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=J+MvuNd8ougA0xXcAC01KHtbmHGMgXHyzWtpnzUoD5BERxfgdgcb7zYsyJ4gexCjjEmFJ/w35Gdc9yx+qs/Ut6zxmnD5bM+UaPlJ7SRgK1oXdzVDxGtTtg3SE0VUKqEIv61rpJO+TFzx5dfbObtl+u2ybnFvGcQ9JgdHn7WYaLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PegEv+8f; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Szd7QekR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PegEv+8f";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Szd7QekR"
Message-ID: <20250429065421.415072350@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BRLQLQgqt1HIYMINIP9eLa5+g/xohe4V4/YURrXVr3A=;
	b=PegEv+8fj9Cq52bAWee4Q2CecG0qam6JFntVsU6BFJCrU/w+GoWRnE4y8sZVEf5G2BY1de
	aybY+ZgVtiKGNmHhG86DXGzMLRVKHKxKxKmGk54hO+gbpfRRGbTUwUbWc8pddzfGeblTr2
	CgO4yOxVqGkDr47UW8DLddD3G3BWbn62yUg4zyJQD29nabbtwwZhnhWr5n3beKJGZxtbjP
	KoJf33P0HIMzvdFJA1bEl/PvWCPYa5QAm1tW1iEgy2dfsglVzCpy4O0K/xQFcezL4hZA2N
	uuRKeg/BhUvaS2NG+FcLsyL9dvAOf1JKPnUQIsZ/CfOpZi+3LBQhWNn3FDM4dA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BRLQLQgqt1HIYMINIP9eLa5+g/xohe4V4/YURrXVr3A=;
	b=Szd7QekRIvgBYI0DpCqVqspDJbuJftOrgQDGC6subMi6RwhsVfhIiPT8YIVk3PLGFUEb6/
	dp7Zd++Y9C8FpTCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 23/45] genirq/chip: Rework irq_set_handler_data()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:22 +0200 (CEST)

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
@@ -67,22 +67,19 @@ int irq_set_irq_type(unsigned int irq, u
 EXPORT_SYMBOL(irq_set_irq_type);
 
 /**
- *	irq_set_handler_data - set irq handler data for an irq
- *	@irq:	Interrupt number
- *	@data:	Pointer to interrupt specific data
+ * irq_set_handler_data - set irq handler data for an irq
+ * @irq:	Interrupt number
+ * @data:	Pointer to interrupt specific data
  *
- *	Set the hardware irq controller data for an irq
+ * Set the hardware irq controller data for an irq
  */
 int irq_set_handler_data(unsigned int irq, void *data)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
-
-	if (!desc)
-		return -EINVAL;
-	desc->irq_common_data.handler_data = data;
-	irq_put_desc_unlock(desc, flags);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		scoped_irqdesc->irq_common_data.handler_data = data;
+		return 0;
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL(irq_set_handler_data);
 



