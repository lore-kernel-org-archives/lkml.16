Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988AC2BE7CF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909730; cv=none; b=i7KMAnpAGOWR5L1h/hxvM2xOLIqDlHDkzATyd/acZlPFaxPWHNwyc23HzE5jjvBIrn9No7tQrUL7TzenYjjT3BPpNvEN6TQ38Ak+y2B6ftGZ6NvfUQWkmg4vi9soP8ZEz1eJhqTG2+AZPq7MFRudjQlLPiG1kYs5EleqOxmUN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909730; c=relaxed/simple;
	bh=fsBTkKRPpH+5EGM8jon02QuU9oxuKW8qdaYnPm2x5CU=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=U0sx7A3X1RgJT++6q3yf81L71MRx3F7mJj0VAXWopxyJuOx0zkNY4Itkm42Cvx4t4rXc2dZTjiC3m+M37wzg9Bzv7ufKin3mEL7OTesomDvZvJAceTbGE7nOlBPZz5m5NMkf4THjxJBib1P45OzMVYqdC+DkksFb8Pto/+/Zlpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Lo2XaxJL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bM6/BKLZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Lo2XaxJL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bM6/BKLZ"
Message-ID: <20250429065421.590753128@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=5k0UxYxBzX3GM/fq2LsOBR7xYTZrMu1uT7QHB/rdNx0=;
	b=Lo2XaxJLY8oyozrFmzF+QgZD5OroumDvFE7I6sQI1+vgfJglMOeJfhn2ozDRjX75e7QVKb
	fnp9kRUYn0ZfVRXg6d2ajchVSQF2KGtExiOabHVzIo3fRTn6TrC1dZzvw5z37XVoqAyvv9
	22I8m5yp/TNGrg2RY4uRcRZOeKxpEJtDOWpxDKFdFmLAl3158ACRUd3TztWH+RmHQ919yG
	WoYooCmQ5mPeEhQP48bkDJhAU/CwsO61vWMN2Xvyndr9wJS/CW3FWbFvatTQuXHvk8M7dD
	b3PYV/ha6vWuSuJjKRqE+RlE8l1zRZJxBpRhoUO4qSKYoFRcS/Q3mDO++LM11Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=5k0UxYxBzX3GM/fq2LsOBR7xYTZrMu1uT7QHB/rdNx0=;
	b=bM6/BKLZo3CC5EozKTcBtLfLdttKur7UUPc2iowjj9rpMiL7xTScvhVogvZ23sjdMb98+h
	PKPiBvmzK76mYDDQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 26/45] genirq/chip: Rework irq_set_handler() variants
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:26 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

Fixup the kernel doc comment while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/chip.c |   34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -973,35 +973,23 @@ static void
 	}
 }
 
-void
-__irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int is_chained,
-		  const char *name)
+void __irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int is_chained,
+		       const char *name)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, 0);
-
-	if (!desc)
-		return;
-
-	__irq_do_set_handler(desc, handle, is_chained, name);
-	irq_put_desc_busunlock(desc, flags);
+	scoped_irqdesc_get_and_lock(irq, 0)
+		__irq_do_set_handler(scoped_irqdesc, handle, is_chained, name);
 }
 EXPORT_SYMBOL_GPL(__irq_set_handler);
 
-void
-irq_set_chained_handler_and_data(unsigned int irq, irq_flow_handler_t handle,
-				 void *data)
+void irq_set_chained_handler_and_data(unsigned int irq, irq_flow_handler_t handle,
+				      void *data)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, 0);
-
-	if (!desc)
-		return;
+	scoped_irqdesc_get_and_buslock(irq, 0) {
+		struct irq_desc *desc = scoped_irqdesc;
 
-	desc->irq_common_data.handler_data = data;
-	__irq_do_set_handler(desc, handle, 1, NULL);
-
-	irq_put_desc_busunlock(desc, flags);
+		desc->irq_common_data.handler_data = data;
+		__irq_do_set_handler(desc, handle, 1, NULL);
+	}
 }
 EXPORT_SYMBOL_GPL(irq_set_chained_handler_and_data);
 



