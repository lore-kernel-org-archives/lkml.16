Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F528CF44
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298128; cv=none; b=eRCLL8JobTk91rBkhCG0W+kEYBk6aB33mifP5wzdPpfovliSekva6UR/9N9QGd1rNT4ZxlA/JUbd4OuO1bpYqzqyarR8mUZoSVGMh0P2LIuCSSGpXKwIm13Hwr9nUgYgFKK3wbXkvrcA/jZsR75o/6DvAhG8bpYpgVbRPUgaDzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298128; c=relaxed/simple;
	bh=R0lIFjuLXFzsojWvKy5z/lHpiRyyhea0daF5z8sv42I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CMqjAlmimW1+Zn1IXjzR3f8YwZI0fGjbBctml2trjNUiYxBPxhjzl5v1ndQnT/EtXjiSaUbeVoOMg42ek2nVcsG+aS8MSy7H8AYafRC66LBr3xFgWoywz98Vz+ZJKsORR1mf5dixdHSygJ5nqn4DEY0VCdZXnlnekiIly7QCZX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U9+rnY/3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QReYLgc9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U9+rnY/3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QReYLgc9"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751298125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z3FFwaj24UtG8REJ9k5qrWsBLKd8309QvXEWaw7nU18=;
	b=U9+rnY/32lQdkUzflzfnioaBgMz05sDK/eDym5mIjMsNeTKZtKVkn29cw2GNdwf5KQDN01
	oN+/SxB3UCwRphfF1X6AfpfDGxX8+8DloqI859I2NjcN5J4E7wlVTqZ3ORTjzuHU/26r/K
	PxKTQl8mT+xwxcF8Qx8qn/AjbT1R5xv+6aIpEvHDb7rwC+flIdJTy+6I8Gvr27FBHmedg3
	Ca3USOcy01f3eBjjlelMtbb5gCVuS/n4Za9ZWYXcsPD2OB9aep6c5/XWyQKtcwb6Wr9tJC
	TM25pkBDeOh8+p6i0Bbrtxhyh6hTJUJrH2YbuLKh4eEP8KgxIbtfG5MCSlqL2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751298125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z3FFwaj24UtG8REJ9k5qrWsBLKd8309QvXEWaw7nU18=;
	b=QReYLgc98p/A6z2QCV1Wxw3IszBDubS3ab8HKBTax1urV0PIjAvQAiV/ai2rrgkqB9mFx8
	Z54C6hV2ut/gqTCg==
To: Wladislav Wiebe <wladislav.wiebe@nokia.com>, anna-maria@linutronix.de,
 frederic@kernel.org, mingo@kernel.org
Cc: akpm@linux-foundation.org, bigeasy@linutronix.de, peterz@infradead.org,
 linux-kernel@vger.kernel.org, wladislav.wiebe@nokia.com
Subject: Re: [PATCH] irq: add support for warning on long-running IRQ handlers
In-Reply-To: <20250630124721.18232-1-wladislav.wiebe@nokia.com>
References: <20250630124721.18232-1-wladislav.wiebe@nokia.com>
Date: Mon, 30 Jun 2025 17:42:04 +0200
Message-ID: <875xgdnsmr.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 30 2025 at 14:46, Wladislav Wiebe wrote:

The subsystem prefix is 'genirq:' See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

> Introduce a new option CONFIG_IRQ_LATENCY_WARN that enables warnings when
> IRQ handlers take an unusually long time to execute.
>
> When triggered, the warning includes the CPU, IRQ number, handler address,
> name, and execution duration, for example:
>
>   [CPU0] latency on IRQ[787:bad_irq_handler+0x1/0x34 [bad_irq]], took: 5 jiffies (~50 ms)
>
> To keep runtime overhead minimal, this implementation uses a jiffies-based
> timing mechanism. While coarse, it is sufficient to detect problematic IRQs.

Define sufficient. That really depends on your use case. For a real-time
system a hard interrupt handler running longer than a few microseconds
can be problematic.

So instead of adding some single purpose mechanism, can we please add
something flexible which can be used for a wide range of scenarios.

> +#ifdef CONFIG_IRQ_LATENCY_WARN
> +static inline void warn_on_irq_latency(struct irqaction *action, unsigned int irq,
> +				       unsigned long jiffies_start)

latency is the wrong term here. This is about the runtime, duration of
the handler.

> +{
> +	unsigned long delta = jiffies - jiffies_start;
> +
> +	/*
> +	 * Warn about long IRQ handler latency only if jiffies are reliable.

What means jiffies are reliable?

> +	 * The reporting condition hits only when there are at least two CPUs
> +	 * with active ticks.
> +	 * Jiffies updates are stalled on this CPU until MAX_STALLED_JIFFIES
> +	 * reaches and a force update happens on another CPU with active ticks.
> +	 */
> +	if (unlikely(delta >= (MAX_STALLED_JIFFIES + CONFIG_IRQ_LATENCY_WARN_THRESHOLD))) {
> +		pr_warn_ratelimited("[CPU%d] latency on IRQ[%u:%pS], took: %lu jiffies (~%u ms)\n",
> +				    smp_processor_id(), irq, action->handler,
> +				    delta, jiffies_to_msecs(delta));
> +	}
> +}
> +#else
> +static inline void warn_on_irq_latency(struct irqaction *action, unsigned int irq,
> +				       unsigned long jiffies_start) { }
> +#endif

I'm absolutely not fond of this #ifdeffery and yet more Kconfig
knobs. Something like this should just work:

DEFINE_STATIC_KEY_FALSE(handler_duration_check);

        if (static_branch_unlikely(&handler_duration_check))
		ts_start = local_clock();
	res = action->handler(irq, action->dev_id);
        if (static_branch_unlikely(&handler_duration_check))
		check_handler_duration(ts_start);

Then have a command-line option which allows the user to set a warning
threshold > 0 in microseconds. When the option is evaluated the
threshold is stored in a __ro_after_init variable and the static branch
is enabled.

Hmm?

Thanks,

        tglx
