Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D573E2D4B51
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533945; cv=none; b=svDiCZzOIbjd9H2Me9QfrZR57CKpXmGc/aZTzGZ7KXAJaX8MNS1J/egmqnfPwEFV9Kk6lSqS71yKlTx92AZA1IxSHbokUgdV92AWAL/UqIxpmi3iYZOaJiGVm8yDLbFFbA4BvK0uD6SCSVetlV1yKudSX1GXPshnSEpuHK+jdHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533945; c=relaxed/simple;
	bh=0d0j/aPrtDHplYNwXN5+Gn+gApjNgnGCEpTHr8M50Vs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D2bI/9TIigAjBRF/0J2Vpim6OvCXsiSTaX5IVmJa/lOK0U7rudIUtn5s47pH12Jp35xEfYp5iZ5ztzPDlK5x4zRH7zGpUBu6PZjVC/MfItS30I23vjgYNnEnBSVS5Bqfkx3DekZftvgJGll/vaZLKMgC99nAY3uRAw5Z9Ci4zfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r/08NPFe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kl4gT8t3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r/08NPFe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kl4gT8t3"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751533942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BH+n0wxS5+7k1dboDiEY2RlATCZyUxvY3iUONP6tN6o=;
	b=r/08NPFepkh3tyxBDmCH/MsvcVF4miWtXz1vE8lvqonKp88riYAlOnfMTxXs/nc8zE5ElP
	UEMXioarcY4/U5m/rBcsG9MCKyVJnAxYrRfTiF3AKMHGomUqCIR/XaUVJkfIHtLUlfnDjD
	a2o3woTLEbj9Fgk7GDMQwPI6TQnsWxVFPWo5h+u6CaNvN7eAt7E0Sb30Chw7sFOmHpZU4p
	HS3ABz2qr7gD0S0Fkh37O9naNOzuE9SKGq+VbzaYaryW12EOF9YnCR9ZrfvmB6XSdjC3fY
	FJfmRI4c4HqI1NCpGlV9jlEDTcDnayMxf9Os6MHtNA4BVFYbo74Scc+tYUNqxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751533942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BH+n0wxS5+7k1dboDiEY2RlATCZyUxvY3iUONP6tN6o=;
	b=kl4gT8t3qU7My7xa4oHcC7hMACpqzS6+0MLztS0vZq2/ZxidHQZIrglA4Ya/6ks3GGmtwi
	O9L8+1U+1X4E3mBA==
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sh@gentwo.org, Darren
 Hart <dvhart@infradead.org>, Arjan van de Ven <arjan@infradead.org>
Subject: Re: [PATCH] Skew tick for systems with a large number of processors
In-Reply-To: <fb0dba1d-0edf-52a8-b546-750a68e55323@gentwo.org>
References: <87sejew87r.ffs@tglx>
 <fb0dba1d-0edf-52a8-b546-750a68e55323@gentwo.org>
Date: Thu, 03 Jul 2025 11:12:21 +0200
Message-ID: <87ms9lwscq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 02 2025 at 17:25, Christoph Lameter wrote:
> On Thu, 3 Jul 2025, Thomas Gleixner wrote:
>
>> The above aside. As you completely failed to provide at least the
>> minimal historical background in the change log, let me fill in the
>> blanks.
>>
>> commit 3704540b4829 ("tick management: spread timer interrupt") added the
>> skew unconditionally in 2007 to avoid lock contention on xtime lock.
>
> Right but that was only one reason why the timer interrupts where
> staggered.

It was the main reason because all CPUs contended on xtime lock and
other global locks. The subsequent issues you describe were not
observable back then to the extent they are today for bloody obvious
reasons.

>> commit af5ab277ded0 ("clockevents: Remove the per cpu tick skew")
>> removed it in 2010 because the xtime lock contention was gone and the
>> skew affected the power consumption of slightly loaded _large_ servers.
>
> But then the tick also executes other code that can cause contention. Why
> merge such an obvious problematic patch without considering the reasons
> for the 2007 patch?

As I said above, the main reason was contention on xtime lock and some
other global locks. These contention issues had been resolved over time,
so the initial reason to have the skew was gone.

The power consumption issue was a valid reason to remove it and the
testing back then did not show any negative side effects.

The subsequently discovered issues, were not observable and some of them
got introduced by later code changes.

Obviously the patch is problematic in hindsight, but hindsight is always
20/20.

>> commit 5307c9556bc1 ("tick: Add tick skew boot option") brought it back
>> with a command line option to address contention and jitter issues on
>> larger systems.
>
> And then issues resulted because the scaling issues where not
> considered when merging the 2010 patch.

What are you trying to do here? Playing a blame game is not helping to
find a solution.

>> So while you preserved the behaviour of the command line option in the
>> most obscure way, you did not even make an attempt to explain why this
>> change does not bring back the issues which caused the removal in commit
>> af5ab277ded0 or why they are irrelevant today.
>
> As pointed out in the patch description: The synchronized tick (aside from
> the jitter) also causes power spikes on large core systems which can cause
> system instabilities.

That's a _NEW_ problem and has nothing to do with the power saving
concerns which led to af5ab277ded0. 

>> "Scratches my itch" does not work and you know that. This needs to be
>> consolidated both on the implementation side and also on the user
>> side.
>
> We can get to that but I at least need some direction on how to approach
> this and figure out the concerns that exist. Frankly my initial idea was
> just to remove the buggy patches since this caused a regression in
> performance and system stability but I guess there were power savings
> concerns.

Guessing is not a valid engineering approach, as you might know already.

It's not rocket science to validate whether these power saving concerns
still apply and to reach out to people who have been involved in this
and ask them to revalidate. I just Cc'ed Arjan for you.

> How can we address this issue in a better way then?

By analysing the consequences of flipping the default for skew_tick to
default on, which can be evaluated upfront trivially without a single
line of code change by adding 'skew_tick=1' to the kernel command line
and running tests and asking others to help evaluating.

There is only a limited range of scenarios, which need to be looked at:

      - Big servers and the power saving issues on lightly loaded
        machines

      - Battery operated devices

      - Virtualization (guests)

That might not cover 100% of the use cases, but should be a good enough
coverage to base an informed decision on.

> The kernel should not come up all wobbly and causing power spikes
> every tick.

The kernel should not do a lot of things, but does them due to
historical decisions, which turn out to be suboptimal when technology
advances. The power spike problem simply did not exist 18 years ago at
least not to the extent that it mattered or caused concerns.

If we could have predicted the future and the consequences of ad hoc
decisions, we wouldn't have had a BKL, which took only 20 years of
effort to get rid of (except for the well hidden leftovers in tty).

But what we learned from the past is to avoid hacky ad hoc workarounds,
which are guaranteed to just make the situation worse.

Thanks,

        tglx
