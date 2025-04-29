Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D072F2BE11C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909727; cv=none; b=Q3IVlezpdiabw2X+8EH0mJ4jsAuAwT+AADxijLgbLDAP4TIYuKSKCNjntLdT/ryzq5o2wSVkCH+GV2LxoSf3Ai7FBCQ1K8mnfhL1uqT55gk/dbVMVO5FrXNvmB0i3U4lz0b779XOL9/rTWFREXFgjRwRRCKfYM7LgcVXQ5Ki6Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909727; c=relaxed/simple;
	bh=kYrW1aCSFM7d/LAfW4csVW3fqi0jntKr26U57f80Ii0=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=A1V511UEnevTWKSRXO2KDRq4Whye2qv0QoL4ieziGAA3olCPtUeD4F+8+bqIJdMF2ksIg0KxZQ/Az323MBI3bJviPYMmX1gd7SeuYM8IrQsfVtOMFUXwI/qryNqd3kadtimdC3vvhx4lT5osuOynT7FNRKlUo59/whlCkAgEVr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Dg1UKJ09; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t6WAxPAF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Dg1UKJ09";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t6WAxPAF"
Message-ID: <20250429065421.473563978@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=++AIhjmIh0ASRd6AQRmDvZEsMS+B3sfFmYcYg6SfaIM=;
	b=Dg1UKJ09A5YX6kSkSrDqFuHNQSEKpOXU4UxPJPayMaSD5deFTfBd/uBGE+1fkY63pL9Zma
	9lx6wyXTKEPPyqIz98gEqP36ZGq+HatibSGPRbMr1jaj+86QURSiArKCK8EJY2ur2EXJn6
	IazkbkkKYmbcmaAgx/qZxa15edVXLQ7cfYBbx51iyzJNQDWRB0qsVznYRQEi25Uy+1Ugf9
	h2cLjrU/0+vXdHa89qKHtmL4iSYQ/vSH9w1CazEKQGUDJMbrXTCW+T1lCdByPM+cXu1ITt
	um+D4dSX1N+rqNqnlDWj76YHmM/eVzXMoKWOoOgwptaibx7NPP6vqQ8umwLNpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=++AIhjmIh0ASRd6AQRmDvZEsMS+B3sfFmYcYg6SfaIM=;
	b=t6WAxPAFK1KI76THRYboxKnfD+SudvvtnruVUwf379BtVkExbf6VEgSPvaiziacwpLfB2U
	VUc0MYMgRY5P7tDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 24/45] genirq/chip: Rework irq_set_msi_desc_off()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:23 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -84,34 +84,30 @@ int irq_set_handler_data(unsigned int ir
 EXPORT_SYMBOL(irq_set_handler_data);
 
 /**
- *	irq_set_msi_desc_off - set MSI descriptor data for an irq at offset
- *	@irq_base:	Interrupt number base
- *	@irq_offset:	Interrupt number offset
- *	@entry:		Pointer to MSI descriptor data
+ * irq_set_msi_desc_off - set MSI descriptor data for an irq at offset
+ * @irq_base:	Interrupt number base
+ * @irq_offset:	Interrupt number offset
+ * @entry:		Pointer to MSI descriptor data
  *
- *	Set the MSI descriptor entry for an irq at offset
+ * Set the MSI descriptor entry for an irq at offset
  */
-int irq_set_msi_desc_off(unsigned int irq_base, unsigned int irq_offset,
-			 struct msi_desc *entry)
+int irq_set_msi_desc_off(unsigned int irq_base, unsigned int irq_offset, struct msi_desc *entry)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq_base + irq_offset, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
-
-	if (!desc)
-		return -EINVAL;
-	desc->irq_common_data.msi_desc = entry;
-	if (entry && !irq_offset)
-		entry->irq = irq_base;
-	irq_put_desc_unlock(desc, flags);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq_base + irq_offset, IRQ_GET_DESC_CHECK_GLOBAL) {
+		scoped_irqdesc->irq_common_data.msi_desc = entry;
+		if (entry && !irq_offset)
+			entry->irq = irq_base;
+		return 0;
+	}
+	return -EINVAL;
 }
 
 /**
- *	irq_set_msi_desc - set MSI descriptor data for an irq
- *	@irq:	Interrupt number
- *	@entry:	Pointer to MSI descriptor data
+ * irq_set_msi_desc - set MSI descriptor data for an irq
+ * @irq:	Interrupt number
+ * @entry:	Pointer to MSI descriptor data
  *
- *	Set the MSI descriptor entry for an irq
+ * Set the MSI descriptor entry for an irq
  */
 int irq_set_msi_desc(unsigned int irq, struct msi_desc *entry)
 {



