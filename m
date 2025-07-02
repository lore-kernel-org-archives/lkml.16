Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FD223A99E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751494511; cv=none; b=kDwzz7j5wlviLX3NPaBXl3bHozbYyxvaoq9tuMCzJ2nBRaE+GijK1aDMI0TlPTZegy+3mRzwdr7mWpWP51e28VEYZ9CIteu7VkXbB0aLhvtbHKuwkhsZa5rnpY7MqEzlt9HCpr0LloD07wAQ1zenoHi/XcYDMKwreZZAC+1cIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751494511; c=relaxed/simple;
	bh=wC49taDXzmgdz6Pd+Y+a2MEUWnaelCAc7PZvn62ApOI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=W22qkJR6fGxjH484kAmtd7Uw/wbUCkrOy3n+x94ze9gzbhGFgvszj9KERS3HLcgsmCVTt3wshHVc8bt3y+9XQA/ocwvTxI+3NT5K7Fl0K6EEhkgaGzZMtQiIl7+5OAuvlGPxjGBu89f50yhuiNAkQpqa/afMSSn3oJNq0gCxnqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KX7tUCqj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a7Ho1+rH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KX7tUCqj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a7Ho1+rH"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751494504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=RZb4TuPSsxuStgzyCzXshm9KXsVdzW7EFuWMfv5so1U=;
	b=KX7tUCqj21OraL63r5pvq5dJc/03gkwozim1iAF8O3ywsrEiPyNGUnCLrtjIqFcMk0iyE1
	c71xp4zV/YwgZf6EYjJp1RUc+7qYqCwUf4YY/8KUvwuoHG2jhRQD0GelH903jwHsZ2BqCK
	CNAUdi3Z5u/HlmYQlak8G44RsnG4Lnmsfw0OhK5LkoI4vZpjEen37DpZPtWvEHXUudeeJA
	leezf2GoSccNgIqKKZ51k/jRJ8HIp/28xQIXg7OvZtqt3l7lIlalH5JFuPgogAZn19Yt4R
	FvoMn+PHtOPLcg+/k1JXneDzLK1WZybM0CiDB8fMRdVCMgTLzADH4CetAZ7sMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751494504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=RZb4TuPSsxuStgzyCzXshm9KXsVdzW7EFuWMfv5so1U=;
	b=a7Ho1+rH9oOKcbkjPsQkPpdAUiuFOy9DBYfdBonsQ99y1sNYKv9l3L7yQns1dIrXaiWJGr
	CW2jEtebTMJpqGCA==
To: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, sh@gentwo.org, Darren
 Hart <dvhart@infradead.org>, "Christoph Lameter (Ampere)" <cl@gentwo.org>
Subject: Re: [PATCH] Skew tick for systems with a large number of processors
In-Reply-To: <20250702-tick_skew-v1-1-ff8d73035b02@gentwo.org>
Date: Thu, 03 Jul 2025 00:15:04 +0200
Message-ID: <87sejew87r.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Christoph!

On Wed, Jul 02 2025 at 12:42, Christoph Lameter via wrote:

Subject starts with a subsystem followed by a colon and then the short
log. That has been that way forever and is clearly documented. You're
not really new to kernel development and I pointed that out to you
before:

  https://lore.kernel.org/all/87o74m1oq7.ffs@tglx

No?

> From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
>
> Synchronized ticks mean that all processors will simultaneously process
> ticks and enter the scheduler. So the contention increases as the number
> of cpu increases. The contention causes latency jitter that scales with
> the number of processors.
>
> Staggering the timer interrupt also helps mitigate voltage droop related
> issues that may be observed in SOCs with large core counts.
> See https://semiengineering.com/mitigating-voltage-droop/ for a more
> detailed explanation.
>
> Switch to skewed tick for systems with more than 64 processors.

This lacks a proper explanation why that does not have any negative side
effects on existing deployments and application scenarios.

> --- a/kernel/Kconfig.hz
> +++ b/kernel/Kconfig.hz

The tick related Kconfig options are in kernel/time/Kconfig

> +
> +config TICK_SKEW_LIMIT
> +	int
> +	default 64

That wants a

        range 0 NR_CPUS

or such

> +	help
> +	  If the kernel is booted on systems with a large number of cpus then the
> +	  concurrent execution of timer ticks causes long holdoffs due to
> +	  serialization. Synchrononous executions of interrupts can also cause
> +	  voltage droop in SOCs. So switch to skewed mode. This mechanism

What does 'So switch to skewed mode.' help the user to select any
useful value?

This wants to have a proper explanation for picking a value which is
understandable by mere mortals and not some useless "expert" word salad.

> +	  can be overridden by specifying "tick_skew=x" on the kernel command line.

Neither does it explain how that override affects the chosen value nor
update the documentation of the command line value to make users aware
of this behavioural change. For the casual reader this suggests, that
tick_skew=x allows to change that number on the kernel command line,
which it does not.

> -static int sched_skew_tick;
> +static int sched_skew_tick = -1;

What's this magic -1 here? Can we please have some obvious and
understandable define for this?

>  static int __init skew_tick(char *str)
>  {
> @@ -1572,6 +1572,16 @@ void tick_setup_sched_timer(bool hrtimer)
>  {
>  	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
>  
> +	/* Figure out if we should skew the tick */
> +	if (sched_skew_tick < 0) {

This is incompatible with the existing code, which is unfortunately
stupid already. Today 'tick_skew=-1' causes the tick to be skewed. Now
it gets a different meaning. Not that it matters much, but change logs
are supposed to mention user visible behavioural differences and argue
why they don't matter, no?

> +		if (num_possible_cpus() >= CONFIG_TICK_SKEW_LIMIT) {
> +			sched_skew_tick = 1;
> +			pr_info("Tick skewed mode enabled. Possible cpus %u > %u\n",
> +				num_possible_cpus(), CONFIG_TICK_SKEW_LIMIT);

I'm not convinced that this is useful, but that's the least of the issues.

> +		} else

The else clause wants curly brackets for symmetry.

> +			sched_skew_tick = 0;

The above aside. As you completely failed to provide at least the
minimal historical background in the change log, let me fill in the
blanks.

commit 3704540b4829 ("tick management: spread timer interrupt") added the
skew unconditionally in 2007 to avoid lock contention on xtime lock.

commit af5ab277ded0 ("clockevents: Remove the per cpu tick skew")
removed it in 2010 because the xtime lock contention was gone and the
skew affected the power consumption of slightly loaded _large_ servers.

commit 5307c9556bc1 ("tick: Add tick skew boot option") brought it back
with a command line option to address contention and jitter issues on
larger systems.

So while you preserved the behaviour of the command line option in the
most obscure way, you did not even make an attempt to explain why this
change does not bring back the issues which caused the removal in commit
af5ab277ded0 or why they are irrelevant today.

"Scratches my itch" does not work and you know that. This needs to be
consolidated both on the implementation side and also on the user
side.

Thanks for making me do your homework,

        tglx
