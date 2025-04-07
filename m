Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093182236FC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744060319; cv=none; b=rGIwgxYfOl0q56G3OkJ1l6SW6zoL2J+c4L0sdMXLZE4z3WLorBlcIpR4Msw5vxWGvWMt11yalXjfiODMQu3GS2K+ZaA5s2t4snfXDQQfDdLRrt4SUxImJv1/W1qj8KYCrBDMELJ94hSE48ilAN7P6chSH17QIB2rKN8A98Mu9h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744060319; c=relaxed/simple;
	bh=cR6fyTJ1l0ao1DRGrKqZ1gTqGYbGtCvH5cd7+LJHy6M=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bD8XefvNSNGPd3nB/cC7lsR+ME3bQEDpDPyg9cYtMtmzrKVxqaMPii9UYpAG5I7eus8Y9oPRV166Mzh1ls6F+Lpqrt0EZAvfVpZEniH7FEves/jbsGKwf1vHkPzr6XtOjoJmSURQqcuqhd5FM7kHaj9e/O0E6674FsgW6/T/lew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cfMm1r2u; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cNDOwg1H; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cfMm1r2u";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cNDOwg1H"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744060314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=33eB0XJEihdFu7uaA2YoXjeNopOx78bqYoFb1asG3U8=;
	b=cfMm1r2u0L0heM73VpvfdQrU+Usb2myH5nL4Okwu4tuwo+4degqzJF/PHHZsba4cZ/S/aW
	GANlBdwhVxaMTly6gHdDAinHR+Di0rvEAqdSRX9l376eHOoXasHFkF3AG3qx7pLvYiRZS5
	K8CVyo5aJGdA/e9vHEpkyQFbXxD5JELVV3EjhyRihHWedPuqIW5xDj2NoRpatCuE7iUEm1
	NjeJbxtJsOyFM/1FomkBajhRzJ30YC1qlFWB6HbCRJ6d04jM1Cb3V4V4AnFYVSvD+XM1tR
	VfQyZKkK5eWJv8/Z30SAkGxC/iNtMdVfJbFiOtvpvV3Db4swKpEdRIb1/Xg24Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744060314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=33eB0XJEihdFu7uaA2YoXjeNopOx78bqYoFb1asG3U8=;
	b=cNDOwg1H6N3TNeBQw8FgWHEXokZ9o7ZglMD2kL5kjeaBsoRk8PiTYKJMDv66bUB0ODLLYa
	IJWaRs8AQoGAWAAQ==
To: Maxim Kochetkov <fido_max@inbox.ru>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peterz@infradead.org, elver@google.com,
 namcao@linutronix.de, samuel.holland@sifive.com,
 daniel.lezcano@linaro.org, apatel@ventanamicro.com
Subject: Re: [PATCH 1/1] time/sched_clock: move sched_clock_register() out
 of .init section
In-Reply-To: <f57e8a74-4124-457c-b5c9-d193505ba093@inbox.ru>
References: <20250404050540.13507-1-fido_max@inbox.ru> <8734ekwkqk.ffs@tglx>
 <f57e8a74-4124-457c-b5c9-d193505ba093@inbox.ru>
Date: Mon, 07 Apr 2025 23:11:54 +0200
Message-ID: <87wmbvvfqd.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 07 2025 at 10:25, Maxim Kochetkov wrote:
> 07.04.2025 09:26, Thomas Gleixner wrote:
>> On Fri, Apr 04 2025 at 08:05, Maxim Kochetkov wrote:
>>> The sched_clock_register() is widely used by clocksource timer
>>> drivers. The __init prefix forces them to be initialized using
>>> macro TIMER_OF_DECLARE with __init prefixed function.
>> 
>> No, it does not. It requires that they are built in, not more.
>
> Thank you for review.
>
> Let me explain some more. I'm trying to solve similar problem, as 
> described at 
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20240312192519.1602493-1-samuel.holland@sifive.com/#25759271
>
> I have both PLIC and clocksource module configured as Y (not m) in 
> Kconfig. So both of them are included in kernel Image binary. But I 
> still unable to probe clocksource device because it depends of PLIC irq.
> And PLIC probes much later than TIMER_OF_DECLARE part of the clocksource 
> driver.

Which is not a problem as all built-in drivers probe _before_ the init
section is discarded.

> I tried to convert clocksource driver to regular platform device and
> it works fine except warning:
>
> WARNING: modpost: vmlinux: section mismatch in reference: 
> dw_apb_timer_probe+0x136 (section: .text.unlikely) -> 
> sched_clock_register (section: .init.text)

Of course. The warning is because you invoke sched_clock_register()
from dw_apb_timer_probe(), which is regular text. See

drivers/clocksource/ingenic-ost.c
drivers/clocksource/timer-cadence-ttc.c

how to implement a builtin platform driver, which does not suffer from
that problem despite invoking sched_clock_register() from their init
functions.

> Dropping __init from sched_clock_register() helps to solve this issue.

It solves it at the wrong point for a builtin platform driver

> Anyway, this patch opens opportunity to compile clocksource drivers as 
> modules and probe them much later.

That's an orthogonal issue and needs to be discussed seperately from the
problem at hand.

Thanks,

        tglx
