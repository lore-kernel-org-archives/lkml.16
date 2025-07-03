Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB3F770E2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576384; cv=none; b=uKjAfAh1eYyT+K3scOgwcgEpfl/4cXHtN6rPdEMo8Hg4FZFoXjqfqIWGWcEVMAYcmYkAQtnxAXaV+YNhmIoa03alSzVfTdiC2u+9+R60LMjOZOWWn9tQqANePYZqieUmpnG2P393tXIO43OqhBc++fOXyAYsJP22LMnT+pHhb1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576384; c=relaxed/simple;
	bh=q1HXzZCKe+WU8zeTxusGqPb3t5lQPTGT04MNAOAOVVs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e0ocff5wmyfeevfCX/alQVoTgRI9Arj42CgxLvoq1yPtd52EvXvcCzRNP/rVAYeaYlrq/Q54R4ft+nkY2Qby/TWv1WaAsXK+22FEdV5C3ozWp1pDzCh3NJDyagy63macixiSjz0zSZUZpfKobUQaWiYJdwAbx6D4P6UR+X9ygUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gyUwQHXq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xxZgy+uk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gyUwQHXq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xxZgy+uk"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751576381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CCRmMU2DqQB/WGYJD/I/B9KAT5c7zyCLdXM1Ty+fbzk=;
	b=gyUwQHXqlKlMgNVo6c+8R6S7PRDZM98IX0JPdLsDat90oIN2tKjeeXzJ6u6Dsd2RFvRMTJ
	zpuj9dr1lkAnrd9kfwb8vcTsPQ/h8QRwK0iWcM93mRqvhxKjy16nkyhF5D8fM7ti3FawHs
	y34VT/VU2dNujTNpsRklvcsbJXpK6e53eQQNhRfbVXTND/nxT+4fnCIIlswFbV88NA6pYg
	orzXyigoFdWKAzpkapqqRab+PNiSzX7VDCsNqeEg3Y4lMLxms2EG6/ZyxY4mJ800mwWTJk
	qZG/lDqSKoFQWk0OAMkYOrr7PSAWL2VrZoom1RxzIiBJwMnU4fcCS039YTVUVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751576381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CCRmMU2DqQB/WGYJD/I/B9KAT5c7zyCLdXM1Ty+fbzk=;
	b=xxZgy+ukjndFizJvg452/dOHMfF8atJjUT4EB3JdR5DollsgfG6qnDk1aS7vM/C9PQuTd0
	2oSsSwXEq/tutrDw==
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sh@gentwo.org, Darren
 Hart <dvhart@infradead.org>, Arjan van de Ven <arjan@infradead.org>
Subject: Re: [PATCH] Skew tick for systems with a large number of processors
In-Reply-To: <96b6702a-8e3d-0ff9-2a86-75120bac189e@gentwo.org>
References: <87sejew87r.ffs@tglx>
 <fb0dba1d-0edf-52a8-b546-750a68e55323@gentwo.org> <87ms9lwscq.ffs@tglx>
 <96b6702a-8e3d-0ff9-2a86-75120bac189e@gentwo.org>
Date: Thu, 03 Jul 2025 22:59:40 +0200
Message-ID: <8734bdt2gz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 03 2025 at 07:51, Christoph Lameter wrote:
> On Thu, 3 Jul 2025, Thomas Gleixner wrote:
>> It's not rocket science to validate whether these power saving concerns
>> still apply and to reach out to people who have been involved in this
>> and ask them to revalidate. I just Cc'ed Arjan for you.
>
> They definitely apply on an Android phone with fewer cores. There you
> would want to reduce the number of wakeups as much as possible to
> conserver power so it needs synchronized mode.

That's kinda obvious, but with the new timer migration model, which
stops to place timers by crystalball logic, this might not longer be
true and needs actual data to back up that claim.

> That is why my initial thought was to make it dependent on the number of
> active processors.
>
>> There is only a limited range of scenarios, which need to be looked at:
>>
>>       - Big servers and the power saving issues on lightly loaded
>>         machines
>
> If it is only a few active cores and the system is basically idle then
> it is better to have a synchronized tick but if the system has lots of
> active processors then the tick should be skewed.

I agree with the latter, but is your 'few active cores' claim backed by
actual data taken from a current kernel or based on historical evidence
and hearsay?

> So maybe one idea would be to have a counter of active ticks and skew
> them if that number gets too high.

The idea itself is not that horrible. Though we should tap into the
existing accounting resources to figure that out instead of adding yet
another ill defined global counter to the mess. All the required metrics
should be there already.

Actually it should be solvable if you look at it just from a per CPU
perspective. This assumes that NOHZ_IDLE is active, because if it is not
then you can just go and skew unconditionally.

If a CPU is busy, then it just arms the tick skewed. If it goes idle,
then it looks at the expected idle time, which is what NOHZ does already
today. If it decides to stop the tick until the next timer list expires,
then it aligns it. Earlier expiring high resolution timers obviously
override the initial decision, but that's not much different from what
is happening today already.

>>       - Battery operated devices
>
> These usually have 1-4 cores. So synchronized is obviously the best.

Same question as above.

>> If we could have predicted the future and the consequences of ad hoc
>> decisions, we wouldn't have had a BKL, which took only 20 years of
>> effort to get rid of (except for the well hidden leftovers in tty).
>
> Oh the BKL was good. Synchronization was much faster after all and less
> complex. I am sure a BKL approach on small systems would still improve
> performance.

Feel free to scale back to 4 cores and enjoy the undefined BKL
semantics forever in your own fork of 2.2.final :)

Thanks,

        tglx
