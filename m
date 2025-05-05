Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CB71B424A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430623; cv=none; b=VtHzKIbNO4Ub/GwR1ESElZQi9MhhleEFXRbXoFDi+8EGsevFVsxQ/da4TaI07E0vpdxMNr68jMoseisO0IGWCavnWC1QZJTAtedMuyVjiRZ0atENst/0chhqv2bSdmo7NcsIf91iAaGMtFWzhDhBRGbWm9GltLVV8iUPkIOdsfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430623; c=relaxed/simple;
	bh=2of4PTeNayS5YGTTm5RA4wqcScrRYbq+Jy8QJLEB4zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjgATJ/OSHQwUP5C0rIEnpycigTAtn61hX28bEwtaKyHdfFwjrqjD1uJ2ZH0MxfPo5ejJTFEZgYjXMrLdfylyPfjhLTIi0VKuU+vbfRTeRkGiWnAiom4Y2xMDTrlBgfLE/Gf3opFF4SBWM8z1x1yY3Tm3PVKagwCyZ0tek+D1S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CPwBge+k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TGD5JVll; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CPwBge+k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TGD5JVll"
Date: Mon, 5 May 2025 09:36:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746430620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tuDZBlg0gXkS2+j+aBF29+eUh2mWCFtt+exAbAV3YCU=;
	b=CPwBge+kSwghRhgls1HupQyqigPfiekNN3pR4eUgASjqkrULz/Sdj1hr4UJbffyjlfNyJT
	/Pas9MBRTmyEBMXLj2N7LJpPd33livgHbUERAoOHhDhFg9gcFqZNbom8iM6IjjyaVaYuyg
	OK1Byh15e9r6+WS7tSsEwcF4xYpA3x2L3GNFewx5ap1xS7PgRE/Eap2qA2XfUsGSDmoScU
	5QJaOBL0skzO90itO9IS6raKNA4QbU7062H63CxeqVjqMydxjtQsKBzYQ6Z0jmX1o13q1A
	W+UYiXYVZ6bknvZYxjOt32DN9wLyCUOWXqxl4prVjIVh7TeQFpc2r4PvDv2ZlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746430620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tuDZBlg0gXkS2+j+aBF29+eUh2mWCFtt+exAbAV3YCU=;
	b=TGD5JVlleoxER5H8AKfb7KzFjSGAf5dzGMA1eioGh6rZFjFvyi+20DAbGTaRz5WUvQLKvL
	LaUhjLetRR1vyqCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 21/21] selftests/futex: Add futex_numa_mpol
Message-ID: <20250505073649.6sP5O5ca@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-22-bigeasy@linutronix.de>
 <20250502191606.GC24078@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502191606.GC24078@noisy.programming.kicks-ass.net>

> > @@ -20,3 +25,32 @@ static inline int futex_waitv(volatile struct futex_waitv *waiters, unsigned lon
> >  {
> >  	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
> >  }
> > +
> > +static inline int futex2_wait(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
> > +			      unsigned long flags, struct timespec *timo, clockid_t clockid)
> > +{
> > +	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
> > +}
> 
> So this one seemed unused, deleted it and

This is odd but okay.

> > +/*
> > + * futex_wait2() - block on uaddr with optional timeout
> > + * @val:	Expected value
> > + * @flags:	FUTEX2 flags
> > + * @timeout:	Relative timeout
> > + * @clockid:	Clock id for the timeout
> > + */
> > +static inline int futex2_wait2(void *uaddr, long val, unsigned int flags,
> > +			      struct timespec *timeout, clockid_t clockid)
> > +{
> > +	return syscall(__NR_futex_wait, uaddr, val, 1, flags, timeout, clockid);
> > +}
> 
> renamed this one.

perfect.

> > +/*
> > + * futex2_wake() - Wake a number of futexes
> > + * @nr:		Number of threads to wake at most
> > + * @flags:	FUTEX2 flags
> > + */
> > +static inline int futex2_wake(void *uaddr, int nr, unsigned int flags)
> > +{
> > +	return syscall(__NR_futex_wake, uaddr, 1, nr, flags);
> > +}
> 
> Next question; you're setting bitmask to 1 instead of
> FUTEX_BITSET_MATCH_ANY, which is the default value.
> 
> I'm going to make it ~0U unless you have a reason for this 1.

No special reason. If ~0 is the default, go for it.

Sebastian
