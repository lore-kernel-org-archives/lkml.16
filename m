Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A06C2BF3D7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909737; cv=none; b=LChptnZVPsjPOxdy8GGRqCVEYHPOIY2iRKwb5q5A2U03TE/LP5NLtgPi8qw3RzCinuGcqmpepoAhfiuA3DJVk5y84GVwU9KFti6F+OpJVh370Vno/tZ9+TBQHghkguTpt1AGXOv553Wrtc08eAWTyLM3RE+Emv/WeHRp8IQJh4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909737; c=relaxed/simple;
	bh=fm3PuL0Z5EVw/Xl29bOskHTN/0mrNZWUMhnYiWNkOz4=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=KA+ZWjv2dzVua+UO8dp6eKEB7oHkqoPdSoZYHBlmIaANXlAhTK33b78VZqq4Phyhragemef6dpL859/0OW4sZdhYbTcIDkN8KizTAL8+/8Ssq3aphJtYx4sSToeEzs6MzVEQmJYAiIe4HGcJRuAGY4tKRsM7nK2fThy+pGaxqKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fj/A/K2b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9M6dYs/G; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fj/A/K2b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9M6dYs/G"
Message-ID: <20250429065421.897188799@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=WseL2vuiLU0EnidX1w6WyZGxzdmKSxETXXKWL4AxYeU=;
	b=fj/A/K2bmaYqHF18c74cgOYP9rhZ5yQsF5Q6s+46NXza2H/9Ssf3Rh4CRKgWGfLopNDV+Y
	bNX/lNFkLHUKoYpIo+UwP0X/FFCi1nywZ3dcG/0a3p9YHrTmPG1nbCLKVkUWB0of1gZduF
	D2M2iIVAuf1JBeI4Zv1pmpRgISLaAs2jaL87S2Z0AZet1pnrzb8kJfjY7opydlDIbGeSR2
	plYx7Bkx4H3ik4BlL64ZPld7/OXiqlyxjD4KiwbA85SScpSqZWnhrFIJkf6ZtbqieJcWbz
	1yuOOFuptJxB5CtqxucHRS66uwL8/Vz+N+D0pfklbSVsQdKvynqUSTyPgjMkUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=WseL2vuiLU0EnidX1w6WyZGxzdmKSxETXXKWL4AxYeU=;
	b=9M6dYs/G8fuMbVjWMFkzc6wwixSYR53Qdy7R1hQYzAl9+VxKrXnnUOIJiIaG2nIrK6ac3r
	DmqX6ttiJAM3TyDw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 31/45] genirq/manage: Rework __irq_apply_affinity_hint()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:34 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -478,26 +478,24 @@ int irq_force_affinity(unsigned int irq,
 }
 EXPORT_SYMBOL_GPL(irq_force_affinity);
 
-int __irq_apply_affinity_hint(unsigned int irq, const struct cpumask *m,
-			      bool setaffinity)
+int __irq_apply_affinity_hint(unsigned int irq, const struct cpumask *m, bool setaffinity)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
+	int ret = -EINVAL;
 
-	if (!desc)
-		return -EINVAL;
-	desc->affinity_hint = m;
-	irq_put_desc_unlock(desc, flags);
-	if (m && setaffinity)
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		scoped_irqdesc->affinity_hint = m;
+		ret = 0;
+	}
+
+	if (!ret && m && setaffinity)
 		__irq_set_affinity(irq, m, false);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(__irq_apply_affinity_hint);
 
 static void irq_affinity_notify(struct work_struct *work)
 {
-	struct irq_affinity_notify *notify =
-		container_of(work, struct irq_affinity_notify, work);
+	struct irq_affinity_notify *notify = container_of(work, struct irq_affinity_notify, work);
 	struct irq_desc *desc = irq_to_desc(notify->irq);
 	cpumask_var_t cpumask;
 



