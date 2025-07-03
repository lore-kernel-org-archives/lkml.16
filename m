Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E444126BFF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554266; cv=none; b=cxFbVEv7Zju7I8RSZNMrLRpAzI14oaJ7WSA/237F4ZgEYWulreraAz3vVy6TaMDcPvwYw1gQ0OHOJ0PY+x6hZkLOvGsyvHC2lvZ1UnkM1Uz/GRYzVWDHBSXVmF57l92s5DxdomzWgTmxe5uQK5cbmhOnVb+HBU3/cfd3MROxQCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554266; c=relaxed/simple;
	bh=ungV5mqcl2Vy/iMA+d0vGPS8BMXuCHpRTM0Lj3frlVw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fDTNN7V8PI6/zexEwQQthLqAmony7MJOm24Vx7X9RqYjnJ6otmuleexj9Iktf0lWgNzCmnFggvAXJqiFqRGnU93t+xh7CdBcOPhd9sBDqDpXHn3OV6XgVQPjp5ADX2aU+qRDvTzNCnE5uJqA++MEjaDVRwtnD2zmgrq5iS31cJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=ARII5J7R; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="ARII5J7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1751554262;
	bh=ungV5mqcl2Vy/iMA+d0vGPS8BMXuCHpRTM0Lj3frlVw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ARII5J7RARR77OUKyZx/cYaFk5r8rItHWIj95vdjX2POX1SCy+ZIchA3/K+FScSXh
	 iIoMYJFx4xkZd+Rc22ZoYL2vEAIlOeF+yv5gfZQyNQiqJD5LGTURZCUAOLir41eaP4
	 TIm7nCUiZkeTEV3AzdZ19BzBl1E++KdohU6j+5fU=
Received: by gentwo.org (Postfix, from userid 1003)
	id BD825401F6; Thu,  3 Jul 2025 07:51:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id BC33C401C4;
	Thu,  3 Jul 2025 07:51:02 -0700 (PDT)
Date: Thu, 3 Jul 2025 07:51:02 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Thomas Gleixner <tglx@linutronix.de>
cc: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, sh@gentwo.org, 
    Darren Hart <dvhart@infradead.org>, Arjan van de Ven <arjan@infradead.org>
Subject: Re: [PATCH] Skew tick for systems with a large number of
 processors
In-Reply-To: <87ms9lwscq.ffs@tglx>
Message-ID: <96b6702a-8e3d-0ff9-2a86-75120bac189e@gentwo.org>
References: <87sejew87r.ffs@tglx> <fb0dba1d-0edf-52a8-b546-750a68e55323@gentwo.org> <87ms9lwscq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Jul 2025, Thomas Gleixner wrote:

> >> So while you preserved the behaviour of the command line option in the
> >> most obscure way, you did not even make an attempt to explain why this
> >> change does not bring back the issues which caused the removal in commit
> >> af5ab277ded0 or why they are irrelevant today.
> >
> > As pointed out in the patch description: The synchronized tick (aside from
> > the jitter) also causes power spikes on large core systems which can cause
> > system instabilities.
>
> That's a _NEW_ problem and has nothing to do with the power saving
> concerns which led to af5ab277ded0.

The contemporary "advanced on chip power savings" really bite in this
scenario. ;-) It was rather suprising to see what can happen.

> It's not rocket science to validate whether these power saving concerns
> still apply and to reach out to people who have been involved in this
> and ask them to revalidate. I just Cc'ed Arjan for you.

They definitely apply on an Android phone with fewer cores. There you
would want to reduce the number of wakeups as much as possible to
conserver power so it needs synchronized mode.

That is why my initial thought was to make it dependent on the number of
active processors.

> There is only a limited range of scenarios, which need to be looked at:
>
>       - Big servers and the power saving issues on lightly loaded
>         machines

If it is only a few active cores and the system is basically idle then
it is better to have a synchronized tick but if the system has lots of
active processors then the tick should be skewed. So maybe one idea
would be to have a counter of active ticks and skew them if that number
gets too high.

>       - Battery operated devices

These usually have 1-4 cores. So synchronized is obviously the best.

>       - Virtualization (guests)

I think there is work to do here to sync the ticks between host and guest
for further power savings.

> That might not cover 100% of the use cases, but should be a good enough
> coverage to base an informed decision on.

Yea lets see what others say on the matter.




> If we could have predicted the future and the consequences of ad hoc
> decisions, we wouldn't have had a BKL, which took only 20 years of
> effort to get rid of (except for the well hidden leftovers in tty).

Oh the BKL was good. Synchronization was much faster after all and less
complex. I am sure a BKL approach on small systems would still improve
performance.
