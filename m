Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D66280A57
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909704; cv=none; b=aL1Pulexka/iyXbWSm9DPlQEFqoAGfdB+VTur//Ig+J3QBS/kLzn7KMXNK4QLMSKSJAiLuwnBZPETzcYLc65iXCucaQ2d/l7rx2JkWp73CSNt8qWKd32fSvQEg68JDMcc/4XmtJmLInCowgKLWoLhjpNjw49F+5Zhn9BzWQkBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909704; c=relaxed/simple;
	bh=+pGm+87RV33jEvsOAQNhY7ERqZsLYXRP2LLkYG9zh0g=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=JdHTkGpmPaju3JWlGlAXgbuoNH/yebBgQw45mgAsZeqQc5uhUCcd10L+GsxPBp+RlLHmWqypBqospmcpy+h14f2JFXtygFsd/COJ5YosDPfOI6MDUzrzEeEk3/QMcym5pVbw18a9xXhzSjzZrLl30DCrrW4B1hGuJscBoH+N2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F6MU4OIL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A9WZ9W9Y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F6MU4OIL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A9WZ9W9Y"
Message-ID: <20250429065420.560083665@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1fztzzmyuBZmFHvPkzd1352r9hM/gYhsCUv4KQIAziY=;
	b=F6MU4OIL878vuFRwhz/BTpiBhHS6CawswyZgqz+IkA1qPo/qASkToxtmLyjvDnsmS8OzEU
	Saais4m8hXaQA5LjUMjMlcPlNrUtXCcd13/oHGzCPan1mcDgBJHYXlRoBZpgBgQVpefbSp
	zCXaPL7Wlt8SjfVLfN7ELM7fIwFIjbQrOW3MbxyLPtyNZ0FKMN79I/5R0qu4rVHddWetDM
	Z/mtC89hQvEFaKxXHIBQfDCeDMOHp8vFNcJrNp6E+Ek4Km4v3WftDgT9ZnZhdZvr2/dxSP
	FWT191etjyQBr4oBx7qOnpqR3P1k5JF1BXepiJLNJYc03lhJ/4dNb0sH3LOp2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1fztzzmyuBZmFHvPkzd1352r9hM/gYhsCUv4KQIAziY=;
	b=A9WZ9W9YmY6V8l1DHrlwdkOkg83o678pfMHc2Yp2+2wBxZUNwMwsLTMUaNzagFG3AIABbV
	AnXYFTZYBUv2VMCA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 09/45] genirq/cpuhotplug: Convert to lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:01 +0200 (CEST)

Convert all lock/unlock pairs to guards and tidy up the code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/cpuhotplug.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -177,9 +177,8 @@ void irq_migrate_all_off_this_cpu(void)
 		bool affinity_broken;
 
 		desc = irq_to_desc(irq);
-		raw_spin_lock(&desc->lock);
-		affinity_broken = migrate_one_irq(desc);
-		raw_spin_unlock(&desc->lock);
+		scoped_guard(raw_spinlock, &desc->lock)
+			affinity_broken = migrate_one_irq(desc);
 
 		if (affinity_broken) {
 			pr_debug_ratelimited("IRQ %u: no longer affine to CPU%u\n",
@@ -244,9 +243,8 @@ int irq_affinity_online_cpu(unsigned int
 	irq_lock_sparse();
 	for_each_active_irq(irq) {
 		desc = irq_to_desc(irq);
-		raw_spin_lock_irq(&desc->lock);
-		irq_restore_affinity_of_irq(desc, cpu);
-		raw_spin_unlock_irq(&desc->lock);
+		scoped_guard(raw_spinlock, &desc->lock)
+			irq_restore_affinity_of_irq(desc, cpu);
 	}
 	irq_unlock_sparse();
 



