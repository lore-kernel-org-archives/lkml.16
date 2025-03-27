Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423571C6BE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743095716; cv=none; b=ghw9uRWydiasUBhd00Xl+b5+he3xb8qMFkv5yBUrB/5Apjk9WFJUcm0JkT4X5p9+fxM25rFiQlgQbwc5YHo2QTbv32CdGpE59tPclTozDNihCBNhzjdqZcKEjDPN1azLs2cO6i1ESPVb6NFkN7J3kZePkxGQHNUIyLGX4i+1rMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743095716; c=relaxed/simple;
	bh=XaxcQXpPxWph3tPLDdKeyJZT3+t/ezOqoO9iEb5MYJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V5Dt7zzmItkRGXc18vlNzqb59EEUxkqGAaDY4IsibCPTuQoMU5mXT7FjgOtc07G808Dg0hae/qDkWblQrnhC8GCek8PCKGC2nnlCVxLBUuMnIJ/ttYO9YWCdMF//bNvp2/W9tkO/2iWw3yvU7XoIEpdFFRwDqnVVTB89gKyabII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4cNmFeCk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w3QRts2A; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4cNmFeCk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w3QRts2A"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743095707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJDk75Im6ervBBRjq6fKnSLFVU+dlDo/KKEKEkr7Auk=;
	b=4cNmFeCkW2iZ8ZUEGQivwsJp+uCH9mMA0h4rC/EuafqSzgZ8gzhMm8jbLncWzaQWq1d02u
	SC1wZsp5muYbgjWtyHKvVsRzCdKv2qs3pAzyzWiTeMjRLRjzRI/lvM3oEt9SCnx8NztgHX
	/iXUrK6Zif/RHo7GZyMyjFEoHDotTl26zPcd0YEUeSYDl5IqD7MtoQG8v3tpzZm8+Ma78Z
	jfhwF29LIHnaYVT+yd0jZHa0KIdQQ6EnixIbmoHzKVTpVqQboimheYKNAAQSE5ougFq0s9
	ElqN2WDA5y7+4zFNOV8zWPjzJRAxajmtNk7jxSGNMCY0zYWfglxE2FoHO6fuGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743095707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJDk75Im6ervBBRjq6fKnSLFVU+dlDo/KKEKEkr7Auk=;
	b=w3QRts2ASOC8iwk9se3XLKqDsMDTioEv833GA9oFFKlGqZOsFzbBs6gnRzVJoTOrDV9Xwc
	7WrduEYRd817nbAQ==
To: Fernando Fernandez Mancera <ffmancera@riseup.net>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, mhkelley@outlook.com, mingo@kernel.org, Fernando
 Fernandez Mancera <ffmancera@riseup.net>
Subject: Re: [PATCH v2] x86/i8253: fix possible deadlock when turning off
 the PIT
In-Reply-To: <20250327152258.3097-1-ffmancera@riseup.net>
References: <20250327152258.3097-1-ffmancera@riseup.net>
Date: Thu, 27 Mar 2025 18:15:05 +0100
Message-ID: <87ecyixuna.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Mar 27 2025 at 16:22, Fernando Fernandez Mancera wrote:
> As the PIT could be disabled during the init, it can possibly cause a
> deadlock. hpet_time_init()->pit_timer_init() is called without IRQ off.
> It assumes that clockevent_i8253_disable() is IRQ-safe, which it isn't.

It assumes nothing and all the missing interrupt disable is causing is a
lockdep false positive.

Lockdep complains correctly due to the observed contexts, but in reality
there is no possible deadlock at all. Definitely not the one your
subject line is claiming to be possible.

At the point where pit_timer_init() is invoked there is no other usage
of 8253_lock possible because the system is still in the very early boot
stage.

So disabling interrupt here just prevents lockdep triggering a false
positive and not more.

Please analyze problems properly instead of assuming that the lockdep
splat is the ultimate truth.

>  bool __init pit_timer_init(void)
>  {
> +	unsigned long flags;
> +
>  	if (!use_pit()) {
>  		/*
>  		 * Don't just ignore the PIT. Ensure it's stopped, because
>  		 * VMMs otherwise steal CPU time just to pointlessly waggle
>  		 * the (masked) IRQ.
>  		 */
> +		local_irq_save(flags);

Why save()? You just established that interrupts are enabled here, so
this really wants to be:

                scoped_guard(irq)()
	              	clockevent_i8253_disable();
  		return false;

Thanks,

        tglx
