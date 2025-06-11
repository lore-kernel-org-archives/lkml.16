Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D35AC133
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749624626; cv=none; b=MKEDCYsmy0VcvaZyyrTPklAyN+jcaAEVi/HhmMocQ+mTI00Xchys/OUy2VEhSEeX8qyUlPkP+tpdp4LXIIH3ZHuLplg8MGeFu+mvkvjdv3a2yZv/Jx+Sm8v+kYbXbefVsW4YhGwBCerfGa0lBakb8afJb8trLcarHrrKBx5I7tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749624626; c=relaxed/simple;
	bh=zbMt++xWMg4n/Zall9/2pW/vPi7/zSrvPAL3EDtmDY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sRi8pTHHIeQUfhvNXG/wiIZANcbyqoaww5SJbcXcDe1tw7viilUV+uNZylxmj/pfPii8oo29BGrdCvWBYMxL19o+/akqSiz80HWxfcSZ6pbwhzYmbiBxwO3gkUDujVIBXJ3WDt9uHAJmo/R7d0wSk/W+fLXrHMBZTjrQrfO2+Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m2bIyOfr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JJdIKemE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m2bIyOfr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JJdIKemE"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749624622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x0fiKSrR3ukWqajPYBCK09iOBRkiHsShaARb7yP1dNk=;
	b=m2bIyOfr8wkgSyB8kYSuKFqvDCaeEpevaPDX70TJfbnQ+vPv3U2U6bxo3V/6i72fTXdsOz
	UU9oP12ZPkmleM0ySBH2zy5LaldM5qPAvR1WZvbpak0//5VcHjbC780xVn/LkeBJtrG/G7
	m8IzkX54QJvlYphK46luSXi1uJfS8BwykcIaSd9PLBJ34lEryG2u55nXsgRjlvRqkSfXuD
	MkFF6c241RcPWoUgnab0l69BvwIpObHXKpYkhLnxiaAxHhDuGgn/sVR23RhcTJF/pyD35h
	Wnf1OdysqYEObgUxGoBKKpjQ0negtwwBltnzbmYknSoIW3WHLytzNuuYeQEInQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749624622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x0fiKSrR3ukWqajPYBCK09iOBRkiHsShaARb7yP1dNk=;
	b=JJdIKemEB1WVFaOzLvk2IkoT3A69r5E9Ft37REJO5wiSwsPfCosOmE5iWjuJS3dBDhki56
	sJmCuqts2X2p78AQ==
To: Brian Norris <briannorris@chromium.org>, Aleksandrs Vinarskis
 <alex.vinarskis@gmail.com>
Cc: Tsai Sung-Fu <danielsftsai@google.com>, Douglas Anderson
 <dianders@chromium.org>, linux-kernel@vger.kernel.org, Johan Hovold
 <johan@kernel.org>
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
In-Reply-To: <aEiQitCsXq9XSBcZ@google.com>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
 <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
 <aEiQitCsXq9XSBcZ@google.com>
Date: Wed, 11 Jun 2025 08:50:22 +0200
Message-ID: <87qzzqojpt.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 10 2025 at 13:07, Brian Norris wrote:
> On Mon, Jun 09, 2025 at 08:19:58PM +0200, Aleksandrs Vinarskis wrote:
>  
>  void irq_startup_managed(struct irq_desc *desc)
>  {
> +	struct irq_data *d = irq_desc_get_irq_data(desc);
> +
>  	/*
>  	 * Only start it up when the disable depth is 1, so that a disable,
>  	 * hotunplug, hotplug sequence does not end up enabling it during
>  	 * hotplug unconditionally.
>  	 */
>  	desc->depth--;
> +	irqd_clr_managed_shutdown(d);

If depth > 0, then it's still shutdown and the subsequent enable
operation which brings it down to 0 will take care of it. So what are
you trying to solve here?

>  	if (!desc->depth)
>  		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
>  }
> diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
> index f07529ae4895..755346ea9819 100644
> --- a/kernel/irq/cpuhotplug.c
> +++ b/kernel/irq/cpuhotplug.c
> @@ -210,13 +210,6 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
>  	    !irq_data_get_irq_chip(data) || !cpumask_test_cpu(cpu, affinity))
>  		return;
>  
> -	/*
> -	 * Don't restore suspended interrupts here when a system comes back
> -	 * from S3. They are reenabled via resume_device_irqs().
> -	 */
> -	if (desc->istate & IRQS_SUSPENDED)
> -		return;
> -

Huch? Care to read:

a60dd06af674 ("genirq/cpuhotplug: Skip suspended interrupts when restoring affinity")

Thanks,

        tglx
