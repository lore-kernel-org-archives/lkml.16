Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16171A31
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451748; cv=none; b=ZJRHfW0dPHCL2/jmrAEXt9l+LClbpWCTCDe0qjwxOWhfx3YcLcSfDIFBlNb1dnkgCHRDCv6FsTDaJEjFEUQmBct2pLJTfFhK6j+zu3vzux/PjSUFAOXi1YBZ/f30HDEC7EgFwFDRP3j/t8Jc/c9RfsGr2paHsWO15Hbt0skYfYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451748; c=relaxed/simple;
	bh=b24Qst2fKSAScQfecfcL/poD6Wp9bKhMNzlabhQZrpY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iml625yxoxhtXAFF+YeakrlKU6OqT6xegQ+1BTqlWqtPkRRZofmlRuWxjeMBMlGp7qRi5cIA/67StNcVDJf5EkJukz3vaqBlhYTElcImazJaig55tSILdIkA4lQEgmtrVFjLWsP0i+ECpXRDykAZQ8GgVfdXZAIi94Z5x2YjQn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QTNdPYKu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ml0ejzP7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QTNdPYKu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ml0ejzP7"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746451745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oHlO/+yvnwebE1oTIDnLJd+7mx3RUOVyGLziY676hbU=;
	b=QTNdPYKu3oNQ1gHAhaK3r/C8Qdvin4ziCN3Z4x5MsVqqSu40WVmVnM+dknhuCe2ScnAQgY
	EgggSrNGO5UGg2ILfJaDYmbe6at4XNgJeDmAikXk8yeu/YUgulHMUYuQ7N8TI/St7zr09X
	F/q7vtmKEgAMk8ObN8dynNeI0jks5kG7BE3oTMu4UqFEDi1xnwv2lCLO3xIJm7pDT0Ll62
	azdRLjPrsNzU9aih8bs6OrLJ8ndzy4Gxya3qY9Wh8odVKocvVbwTbVry5E715/WZ8OS7jg
	UChFDqAjyr9ccOYdZdSkFmQkk9+NhEgNC3j7V4Eqc3jN86bkp77efjjqSJ5W5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746451745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oHlO/+yvnwebE1oTIDnLJd+7mx3RUOVyGLziY676hbU=;
	b=Ml0ejzP7FXYJkUTchbZ/SZh3E95ZNbfEtn7Ji7TbcjZAIRjCWlR1j56wTC1+GagR1hyGNL
	IeEZTyBHJndUrxBw==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource/i8253: Acquire the lock disabled interrupts.
In-Reply-To: <20250404133116.p-XRWJXf@linutronix.de>
References: <20250404133116.p-XRWJXf@linutronix.de>
Date: Mon, 05 May 2025 15:29:04 +0200
Message-ID: <87r013nq3j.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 04 2025 at 15:31, Sebastian Andrzej Siewior wrote:
> On x86 during boot, clockevent_i8253_disable() can be invoked via
> x86_late_time_init -> hpet_time_init() -> pit_timer_init() which happens
> with enabled interrupts.
> If some of the old i8253 hardware is actually used then lockdep will
> notice that i8253_lock is used in hardirq context. This causes lockdep
> to complain because it observed the lock being acquired with enabled
> interrupts and in hardirq context.
>
> Make clockevent_i8253_disable() acquire the lock with disabled
> interrupts.

This sentence does not make sense. I'll fix it up...

> Fixes: c8c4076723dac ("x86/timer: Skip PIT initialization on modern chipsets")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/clocksource/i8253.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/i8253.c b/drivers/clocksource/i8253.c
> index 39f7c2d736d16..67dcd9c8f1875 100644
> --- a/drivers/clocksource/i8253.c
> +++ b/drivers/clocksource/i8253.c
> @@ -103,8 +103,9 @@ int __init clocksource_i8253_init(void)
>  #ifdef CONFIG_CLKEVT_I8253
>  void clockevent_i8253_disable(void)
>  {
> -	raw_spin_lock(&i8253_lock);
> +	unsigned long flags;
>  
> +	raw_spin_lock_irqsave(&i8253_lock, flags);
>  	/*
>  	 * Writing the MODE register should stop the counter, according to
>  	 * the datasheet. This appears to work on real hardware (well, on
> @@ -133,7 +134,7 @@ void clockevent_i8253_disable(void)
>  
>  	outb_p(0x30, PIT_MODE);
>  
> -	raw_spin_unlock(&i8253_lock);
> +	raw_spin_unlock_irqrestore(&i8253_lock, flags);
>  }
>  
>  static int pit_shutdown(struct clock_event_device *evt)
