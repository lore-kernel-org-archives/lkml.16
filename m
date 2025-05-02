Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406702566C4
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199679; cv=none; b=A4VRfRmLNqnE1rHfTWV4Xg0QqL00KQRQJyYajjJ3syYF7mFnEsoxAlKToTFkFzIX4Ou339LrHwwweT8MyWv48g4XfCShz1X8JM1U0s8+AyM/1wkCbBRdgxawj0BZTU2q9kzAZ3y/9uoyzrqhpsirMn0v2u1dE8r50eJnVel29t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199679; c=relaxed/simple;
	bh=4weMKX/f56u6bCj2LZB9oMAd5PSdJu79dhab/WLfRek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuzZVHnQ1tHAaM9+SLU2W5kPnDOKrnh8Ddm4XRjBoKgGmHLzB6rRLMyWV8M/Ntw6HnYd+ALg0G6rseK1xXOL1OxaEq1xw8o9ihkMH7A3A0oNtF3YewdSX8sC974jI9I4Jkl+NWVUXd8zRZc0lC/WH/6ErrHPofWVasqPLDozYuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QEXODUTJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OkVBKWiR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QEXODUTJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OkVBKWiR"
Date: Fri, 2 May 2025 17:27:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746199675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9u2c5ICeond78u4b7Xh3mM2BvXPPwGDFmRURAjhwE80=;
	b=QEXODUTJOYmvzD+ILoYjmJLGEd1iCuwmvNrei1ilZrcbEA0Ju/Ax+mIWhDJoUXswjzFIaO
	b+ECZPxiuW3yEpvLmo2jd+s1Duy/7dx5lY7ep+U6WxslTQGwug7JBrd6mt1A6Tl6nKL0L0
	A4Twz1V3yVtBelWcTskFUKeXnUMNvfWD8GQACH4E7Y0ZYr0ecXl2YV4IQA8d54+wnKFQiw
	6pJXAt+DIGvJTkG8Op74GsU9tIaJGSz1WsAUsnmINgXQegSVen9Rf1BAB+pAzgWYt+EIhL
	q0AR8hGnwUhnQ8fGCU5nvrIVXAFf0AaRqOm4ln9fGokOdYi5pqkLCmxCY4rBvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746199675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9u2c5ICeond78u4b7Xh3mM2BvXPPwGDFmRURAjhwE80=;
	b=OkVBKWiRGcRC+HLZMPf8JujVKVizj9DA1A+RyDmTaHmjeaAIsV9SJEEvs0YQyit6FMTnc/
	SS0gvsVQLmmqAfDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	kprateek.nayak@amd.com
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Message-ID: <20250502152753.aFffUGVv@linutronix.de>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
 <20250502123433.AHDVLZdY@linutronix.de>
 <20250502143544.GW4439@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250502143544.GW4439@noisy.programming.kicks-ass.net>

On 2025-05-02 16:35:44 [+0200], Peter Zijlstra wrote:
> On Fri, May 02, 2025 at 02:34:33PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2025-05-02 01:59:52 [+0000], Prakash Sangappa wrote:
> > > diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> > > index 20154572ede9..b26adccb32df 100644
> > > --- a/kernel/entry/common.c
> > > +++ b/kernel/entry/common.c
> > > @@ -98,8 +99,12 @@ __always_inline unsigned long exit_to_user_mode_lo=
op(struct pt_regs *regs,
> > > =20
> > >  		local_irq_enable_exit_to_user(ti_work);
> > > =20
> > > -		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
> > > -			schedule();
> > > +		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
> >=20
> > I asked to limit this to LAZY only.
>=20
> No -- this should work irrespective of the preemption model chosen.

Focusing on LAZY would easily exclude the tasks with priorities.

> It should also have a default time that is shorter than the scheduling
> delay normally observed.
>=20
> It should probably also have a PR_WARN on raising the sysctl value.
>=20
> I know you worry about RT, but show me a trace where it is a problem.

The default extends the wakeup by 50us. With a 250us period this extends
the wakeup in worst case by 20% of the period. With 1ms it gets just to
5% of the whole period. You basically expect that everything is well
timed and this delay does not hurt anyone.
This delays interrupt driven wakeups (timer, hardware) and not every
wake up as I assumed initially so it is not as bad but still worse than
in has to be.

On top of that sched(7) says:
|   SCHED_FIFO: First in-first out scheduling
|      SCHED_FIFO  can be used only with static priorities higher than 0, w=
hich
|      means that when a SCHED_FIFO thread becomes runnable, it will always
|      immediately preempt any currently running SCHED_OTHER, SCHED_BATCH, =
or
|      SCHED_IDLE thread.  SCHED_FIFO is a simple scheduling algorithm with=
out
|      time slicing.  For threads scheduled under the SCHED_FIFO  policy,  =
the
=E2=80=A6
|   SCHED_DEADLINE: Sporadic task model deadline scheduling
=E2=80=A6
|      if any SCHED_DEADLINE thread is runnable, it will preempt any thread
|      scheduled under
=E2=80=A6

With this change, this "immediately preempt any currently running" is no
longer true.

While we could continue to argue how much the delay really is, I don't
understand why we can't exclude real time scheduling policy from this.

Sebastian
