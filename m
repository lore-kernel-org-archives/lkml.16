Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A820C038
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208154; cv=none; b=iN/Ukd/equFJkC/P142EOITVfgMFNKHrupQPheuBkqBv2CXUfu3NI2PspGF9Dn+f4fODrRV8K5bRCVziYvAHllvNrgiuz5DRsfjCBhxLhOpOB1dg+NleBFVi9EeQRsHYlkjFJwoyLSf//t3qHRg7WhwHFsU2BIOaLkVGomgwEAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208154; c=relaxed/simple;
	bh=bsg6bw0yPfNZ4O08qHdudsUY91A0rZ+kVoO8mgYHzzA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z1txquR8fHovPOuXfAH5ANKnes3nT7ostx8RxNYStY540GxP2yd7OTJ6V/UECdSWJ8xCTKBJYkb3RS/KVgR5q7El6XVx6gd44Zec8ae/silkXQzgnoBnmqIUYr0syAs/EbT2uwFbABiqDyKReV/EwkfCxRqXJY7ITJB4AU5aXcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nNgNkH+N; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NtAYZTz7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nNgNkH+N";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NtAYZTz7"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747208150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xF4E5LVzONdS3f7YqJRhw616wWVZro5wISDTX0iuhEA=;
	b=nNgNkH+NwoKusOWd5fvUACBLqXIt3SKSuR+6DttQBbby9p00EDh6Sk+9aNuibxCaK16thw
	xa0JqZJnB6k5UI6CWWqpxJKQVdhNTtwGxENw7mP0sYrTWbN9rfvpxFyzQW40nWvZELPhqR
	f8ZzJ0oZj55sUBbcOO5pbnTij9spptCB6vljwtjW//4pB+Hcc6/uu0mTlRFRbQNaodPDAk
	SSzp7ZFwHhCU0JBwbYq68dPCJ8sIDglcnKhQy1NYiavMPcQJBD1WmcVQ4iHPEQNm95COoT
	oyNbWFx6VB53QJyjNLD7pUasQEpz6c/B9BvAYSsPkksQYHiCafB/H3EjfAp57w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747208150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xF4E5LVzONdS3f7YqJRhw616wWVZro5wISDTX0iuhEA=;
	b=NtAYZTz7zkP1E60poG9LK42fTjWAXipEYuS8rual0CM9qeGI5taQLyvmPa9rKjUhgiXuj7
	8L5OVSeP7yntyJBA==
To: Brian Norris <briannorris@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>, Tsai Sung-Fu
 <danielsftsai@google.com>, linux-kernel@vger.kernel.org, Brian Norris
 <briannorris@chromium.org>
Subject: Re: [PATCH 2/2] genirq: Retain disable depth across irq
 shutdown/startup
In-Reply-To: <20250513224402.864767-3-briannorris@chromium.org>
References: <20250513224402.864767-1-briannorris@chromium.org>
 <20250513224402.864767-3-briannorris@chromium.org>
Date: Wed, 14 May 2025 09:35:49 +0200
Message-ID: <877c2jk5ka.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 13 2025 at 15:42, Brian Norris wrote:
> If an IRQ is shut down and restarted while it was already disabled, its
> depth is clobbered and reset to 0. This can produce unexpected results,
> as:
> 1) the consuming driver probably expected it to stay disabled and
> 2) the kernel starts complaining about "Unbalanced enable for IRQ N" the
>    next time the consumer calls enable_irq()
>
> This problem can occur especially for affinity-managed IRQs that are
> already disabled before CPU hotplug.

Groan.

> I'm not very confident this is a fully correct fix, as I'm not sure I've
> grokked all the startup/shutdown logic in the IRQ core. This probably
> serves better as an example method to pass the tests in patch 1.

It's close enough except for a subtle detail.

> @@ -272,7 +272,9 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
>  	const struct cpumask *aff = irq_data_get_affinity_mask(d);
>  	int ret = 0;
>  
> -	desc->depth = 0;
> +	desc->depth--;
> +	if (desc->depth)
> +		return 0;

This breaks a

     request_irq()
     disable_irq()
     free_irq()
     request_irq()

sequence.
  
So the only case where the disable depth needs to be preserved is for
managed interrupts in the hotunplug -> shutdown -> hotplug -> startup
scenario. Making that explicit avoids chasing all other places and
sprinkle desc->depth = 1 into them. Something like the uncompiled below
should do the trick.

Thanks,

        tglx
---
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 36cf1b09cc84..b88e9d36d933 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -223,6 +223,19 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
 		return IRQ_STARTUP_ABORT;
 	return IRQ_STARTUP_MANAGED;
 }
+
+void irq_startup_managed(struct irq_desc *desc)
+{
+	/*
+	 * Only start it up when the disable depth is 1, so that a disable,
+	 * hotunplug, hotplug sequence does not end up enabling it during
+	 * hotplug unconditionally.
+	 */
+	desc->depth--;
+	if (!desc->depth)
+		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
+}
+
 #else
 static __always_inline int
 __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
@@ -290,6 +303,7 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
 			ret = __irq_startup(desc);
 			break;
 		case IRQ_STARTUP_ABORT:
+			desc->depth = 1;
 			irqd_set_managed_shutdown(d);
 			return 0;
 		}
@@ -322,7 +336,13 @@ void irq_shutdown(struct irq_desc *desc)
 {
 	if (irqd_is_started(&desc->irq_data)) {
 		clear_irq_resend(desc);
-		desc->depth = 1;
+		/*
+		 * Increment disable depth, so that a managed shutdown on
+		 * CPU hotunplug preserves the actual disabled state when the
+		 * CPU comes back online. See irq_startup_managed().
+		 */
+		desc->depth++;
+
 		if (desc->irq_data.chip->irq_shutdown) {
 			desc->irq_data.chip->irq_shutdown(&desc->irq_data);
 			irq_state_set_disabled(desc);
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index 15a7654eff68..3ed5b1592735 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -219,7 +219,7 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
 		return;
 
 	if (irqd_is_managed_and_shutdown(data))
-		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
+		irq_startup_managed(desc);
 
 	/*
 	 * If the interrupt can only be directed to a single target
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index b0290849c395..8d2b3ac80ef3 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -87,6 +87,7 @@ extern void __enable_irq(struct irq_desc *desc);
 extern int irq_activate(struct irq_desc *desc);
 extern int irq_activate_and_startup(struct irq_desc *desc, bool resend);
 extern int irq_startup(struct irq_desc *desc, bool resend, bool force);
+void irq_startup_managed(struct irq_desc *desc);
 
 extern void irq_shutdown(struct irq_desc *desc);
 extern void irq_shutdown_and_deactivate(struct irq_desc *desc);
