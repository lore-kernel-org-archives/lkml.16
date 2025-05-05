Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E31D5ADC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430413; cv=none; b=O+zpEM5KptX2DfeOUdUbNSOIEB+K5w8V4/PEE3izPxFpdLC0+DO5rWajWtMcaPSy9VSsQ8glswCmzcBirGd8wE1qDhIiOrX261oiziQ9aQC3tbQx7qwGwzcBdJt/qRbIOWMQVeTuNt9/ieJet1zWW/eiGSUlIjxF2l8yu7w9vg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430413; c=relaxed/simple;
	bh=0XkG1rhDDdkzr4vxxq+ni5pkurrsCo1DaBkTzd2qMDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkv9hRjPUcEVGjp9lBUchFTMoQGS95eAedc09g/BfUlnvW9pcb17oreWeCcXYcUz6NV5PGjv7Icspii3UpKNsLNG3IGDZ5zV6aVqkkIZKmM2mf+jp0Afj3CYoMK1aVT0TaZjmnfNuCLbYKGrEoVFjfjmB0aVWdLTGAgLH/8RDpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sX8+DbPY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oI7y3cP8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sX8+DbPY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oI7y3cP8"
Date: Mon, 5 May 2025 09:33:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746430410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLwEBdjvQahjJSYq8z8eni9Njb//2FpLv9Dx89BPmLg=;
	b=sX8+DbPYCsZSXj7XsOakuqLfGLEHw1Nd4nkA5Sw3eN39GsGxZit+wVOw1o6B1Z8QFtKwi8
	INcFwTn7otcE0y+lCILL6Jm+316FpKRRqqRTLuEzyW/IYFiLKLpCe8nYKpSEtry004/VKf
	AcCTZaP67YPA+8dkPQqV0jG+q7cSB9gIWKcaZ5dlJNJ4PtWFjkPWVJkQ0fSsh7KC/LyOjj
	R5DMuYkPzDCsKlxJ8wMAoCijtljQDPnEVQnPD1TSIKUYHPvC9FU4RgPiJRneRr/7C6aepc
	IY3cZs40OMxZWfkz7m6nHGrWp9xdMXy/scf3i1b8t1aVUSgXlcQfwZUx7iAt+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746430410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLwEBdjvQahjJSYq8z8eni9Njb//2FpLv9Dx89BPmLg=;
	b=oI7y3cP8B33FLfDyM7+FCJheUoMRtzra4Mmq6fSZW+D3oLsiQ+SFSZJcffpfAEVRbJFzyQ
	hMzh8K4p/V38VkDw==
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
Message-ID: <20250505073321.7isb-eaO@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-22-bigeasy@linutronix.de>
 <20250502190838.GB24078@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502190838.GB24078@noisy.programming.kicks-ass.net>

On 2025-05-02 21:08:38 [+0200], Peter Zijlstra wrote:
> On Wed, Apr 16, 2025 at 06:29:21PM +0200, Sebastian Andrzej Siewior wrote:
> > diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/testing/selftests/futex/include/futex2test.h
> > index 9d305520e849b..b664e8f92bfd7 100644
> > --- a/tools/testing/selftests/futex/include/futex2test.h
> > +++ b/tools/testing/selftests/futex/include/futex2test.h
> > @@ -8,6 +8,11 @@
> >  
> >  #define u64_to_ptr(x) ((void *)(uintptr_t)(x))
> >  
> > +struct futex32_numa {
> > +	futex_t futex;
> > +	futex_t numa;
> > +};
> > +
> >  /**
> >   * futex_waitv - Wait at multiple futexes, wake on any
> >   * @waiters:    Array of waiters
> > @@ -20,3 +25,32 @@ static inline int futex_waitv(volatile struct futex_waitv *waiters, unsigned lon
> >  {
> >  	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
> >  }
> > +
> > +static inline int futex2_wait(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
> > +			      unsigned long flags, struct timespec *timo, clockid_t clockid)
> > +{
> > +	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
> 
> I'm confused, sure this should be __NR_futex_wait
> 
> > +}
> > +
> > +/*
> > + * futex_wait2() - block on uaddr with optional timeout
> > + * @val:	Expected value
> > + * @flags:	FUTEX2 flags
> > + * @timeout:	Relative timeout
> > + * @clockid:	Clock id for the timeout
> > + */
> > +static inline int futex2_wait2(void *uaddr, long val, unsigned int flags,
> > +			      struct timespec *timeout, clockid_t clockid)
> 
> And this should be futex2_wait().

Yes. I didn't want to change it right away but yes. There already is a
futex2_wait() which uses the waitv syscall.

> 
> > +{
> > +	return syscall(__NR_futex_wait, uaddr, val, 1, flags, timeout, clockid);
> > +}
> > +
> > +/*
> > + * futex2_wake() - Wake a number of futexes
> > + * @nr:		Number of threads to wake at most
> > + * @flags:	FUTEX2 flags
> > + */
> > +static inline int futex2_wake(void *uaddr, int nr, unsigned int flags)
> > +{
> > +	return syscall(__NR_futex_wake, uaddr, 1, nr, flags);
> > +}

Sebastian
