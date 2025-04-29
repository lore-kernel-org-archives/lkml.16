Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F9A2C1E16
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909746; cv=none; b=Zq2fFf0+DiGeIz9fhXPJPdV5cVs/WwF679pV/W/lh8Eerd0FE+9qgIHE+G4yah+HjmAX8Vmv1OhYG9GFWYP/daljZISod6HSC18nRqSTE+AesaN5AkVL4mxFdsh+f4CkhsiDNqaALXyf28uNFzJ30QM34pjUA3rQ3ykjAzOIHMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909746; c=relaxed/simple;
	bh=uWc/0dk9VurpXJBAwPLXkPXP89nU98zgJYgRWU00PYA=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=HUTYB2RmXAYtTCAsgt4MHf9YW6WzrQiz0HZ3MII6SNzBh1pAy0x/fAV7sJGQ1CR0UnojeILJLgT420DsD11U1KNxMtkbPpMYdMAsrLV8KZvsZ5lcHjc1UZa6bRKeaxKvT6MoLQdtG2ypCEOcp2k+EG8Zv/1IvgU6y98zulY/olg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PEGcj1uu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jcN4XojN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PEGcj1uu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jcN4XojN"
Message-ID: <20250429065422.258216558@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=O9cC3l3NuY11K5tWj89mtb2MBOMdw0xdTbcCSn48HHM=;
	b=PEGcj1uuWU46c2Y4Gm25jDN6dNg32QjkiNb4ccNzatu/hha9j/ruxErXuDDU1brAMlnk4E
	wZFtM2rTCBqyGMbJZQ6prGpxc2zJU+e41qVPibdEfuj/b/pOz/0TAT6z+OBWHYAxxJe24d
	4V0PkE/Vdl0ZdeaHy8ehTrYkDIUHpUjXLSe9t7eUOVkCmalEic9DOpC2+UJmZhmIeZBlIn
	OU9YIL0+IlNG7zAzIMFekfa/R/mfY5MdsqA+xv+vgv6qhUKSAsr71yoZHZ71Tb2Imh7vMl
	+yv6ESpbKWITiZOzM7H5RTfrawgHBi5b53gxB9LKqfQuAjuvhYHWaYrDz+HVXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=O9cC3l3NuY11K5tWj89mtb2MBOMdw0xdTbcCSn48HHM=;
	b=jcN4XojNxPhYlaZadgxvlbgOf2OzCvQmPS6CXjaVMRRTg2ca1qRY9swCDtJIiUEYNnPXfW
	/RNNyyK9909yiyBQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 37/45] genirq/manage: Rework irq_set_parent()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:43 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -958,16 +958,11 @@ int __irq_set_trigger(struct irq_desc *d
 #ifdef CONFIG_HARDIRQS_SW_RESEND
 int irq_set_parent(int irq, int parent_irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
-
-	if (!desc)
-		return -EINVAL;
-
-	desc->parent_irq = parent_irq;
-
-	irq_put_desc_unlock(desc, flags);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		scoped_irqdesc->parent_irq = parent_irq;
+		return 0;
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(irq_set_parent);
 #endif



