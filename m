Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E14425A642
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017362; cv=none; b=PGGRDRKTpSvWzCtQMhxlzrx6aAeXR3uqvmAcfgtekhYIloT6KqiEdwWqWbQsWhGwPTntLMvVR+VgdEs37FCxnKQoL5TqzcD0Q7jDxhVG04bdWKXUQWv9X+yFI7Hi82EggZXOdktqefXpR4uols5UX3/x6ugVrKyh2SQXb3WJ8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017362; c=relaxed/simple;
	bh=1C++YjDsa5RnXjhEI5j5wOX/Zy2nXMMy4M7wFdyAqak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hk27Aunm9QurX+CI8FwDUF4bgmeHnZ8KsEAv8lBFHOS/WewmO7Gy9P8EdNWf+MweYZM68tnHROlTx5RXE4f4bCeLZ0FN3Yn3ZmVfGpd8mCkzohOLqqSRQSck9E996xf5PiGFQfB5lYm/f/uv1Rf2KQMsHhwCbcUvcFgrpAgqjlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kAWWXWw2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e8paeF3q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kAWWXWw2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e8paeF3q"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746017359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kN9/S8fUEjRGtNVrgAXcPrHRvDS6szRMX0XdjXr/M2M=;
	b=kAWWXWw2DsM20ai/XKxdRQw8ewyVgMpbXvceSl96SUi0kcX14+qJ2vQPUkYDiLFMJmU93c
	Yhqb7e8j2bRBX5DxR3h6FQuRN7UHKA6w9/mJOeQCyLgSbuNsXr8z8Cac2ZaD2vtqmSjxRV
	PEX2leB/kMvdqtp0xH18j5EySJxAfec5I4pRebQ+swr3W1fc6sNH78EdSufFsxXTzHnJ9y
	msN32scHtbSbBB3RFhGFxPyGuEmsnDsZKmV4K+RF9er2Jlzsn6hzqL+EXdP/C+WdgtEMta
	dPHVMFfvi3nlLU/nkCGVGphNUsyUnaCRr3yLaaOL4ebLfhwr2OvGUv99Uc6OhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746017359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kN9/S8fUEjRGtNVrgAXcPrHRvDS6szRMX0XdjXr/M2M=;
	b=e8paeF3qit//QurMnGYhDc47LbIqsr/YcZv5D6Zvy3Ua1wp5XFdKe+C8hvo8sYG/FuiLFf
	BmM7Sv6r4O3UHiAw==
To: Jiri Slaby <jirislaby@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2a 32/45] genirq/manage: Rework irq_set_vcpu_affinity()
In-Reply-To: <4f323802-d31d-4ba0-8a55-6e9f5e3cd152@kernel.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065421.954584482@linutronix.de>
 <4f323802-d31d-4ba0-8a55-6e9f5e3cd152@kernel.org>
Date: Wed, 30 Apr 2025 14:49:19 +0200
Message-ID: <87ikmlq0fk.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

From: Thomas Gleixner <tglx@linutronix.de>
Subject: genirq/manage: Rework irq_set_vcpu_affinity()
Date: Thu, 13 Mar 2025 17:00:39 +0100

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2a: Get rid of 'ret' - Jiry
---
 kernel/irq/manage.c |   39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -629,32 +629,25 @@ int irq_setup_affinity(struct irq_desc *
  */
 int irq_set_vcpu_affinity(unsigned int irq, void *vcpu_info)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
-	struct irq_data *data;
-	struct irq_chip *chip;
-	int ret = -ENOSYS;
+	scoped_irqdesc_get_and_lock(irq, 0) {
+		struct irq_desc *desc = scoped_irqdesc;
+		struct irq_data *data;
+		struct irq_chip *chip;
 
-	if (!desc)
-		return -EINVAL;
+		data = irq_desc_get_irq_data(desc);
+		do {
+			chip = irq_data_get_irq_chip(data);
+			if (chip && chip->irq_set_vcpu_affinity)
+				break;
 
-	data = irq_desc_get_irq_data(desc);
-	do {
-		chip = irq_data_get_irq_chip(data);
-		if (chip && chip->irq_set_vcpu_affinity)
-			break;
-#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
-		data = data->parent_data;
-#else
-		data = NULL;
-#endif
-	} while (data);
+			data = irqd_get_parent_data(data);
+		} while (data);
 
-	if (data)
-		ret = chip->irq_set_vcpu_affinity(data, vcpu_info);
-	irq_put_desc_unlock(desc, flags);
-
-	return ret;
+		if (!data)
+			return -ENOSYS;
+		return chip->irq_set_vcpu_affinity(data, vcpu_info);
+	}
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(irq_set_vcpu_affinity);
 
