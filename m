Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107FD4C81
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952459; cv=none; b=mwp8rPlz6bgXv8zXcW9qlHkjiG0owtcES3lVw6ARqXZaBIovRAvwZNRqrGAUMc6vC0tWOgiFlNS2pfBsTgjmqqgZU3SU/DjI92YD6UzPbIg6ihpQeh+a+ytfnWOAOKZ50TSiO3n4L2Ol9SsID2dMoKy/C8tj59ZEM6grV0HdX0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952459; c=relaxed/simple;
	bh=vw2WrqN9KS7JEXQfzjPp/ZkptHDi5d+yw2RImucZhLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRgpFO0kagsW24tEJ0uNRH2id/DLBPo4vQrXbbZaECaz5fhmt8zl9+5onlC+y10crkmtY3sPyR40EERDtX21HI+E8H+SVrAYh85Gqj9otUbOdCE8o+wza+KMkikYc++1oYf8kTGd8ksQModsDAyJ1P4MJ2aLhpob3LL9Zb1cmv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=deBxPIZv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="deBxPIZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D140C4CEE3;
	Tue, 29 Apr 2025 18:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745952458;
	bh=vw2WrqN9KS7JEXQfzjPp/ZkptHDi5d+yw2RImucZhLQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=deBxPIZvYNHEXlb/ta0nZVjYfmuTsdMwTibNFxU+MxV/VK9XHacOjH7dUJA2RfJmi
	 z53/W4+gnxni5O65HWr3IkFqx1KrpmNLpcQcgs4QlMkFqnpdu+iGFIgRYzUzKFuR96
	 z61RnQ0mNrZCgKz/sC0io+6xe9GU3qPOVWyNdB6aBtztPr7amqJFiq1ii9H1Z6hx/z
	 zTlpalSqAFFXYq5uobOcWNSUgM7w9QW7zpC5PZqn52tOihdAE0ToyXZEk/BFgmL6H2
	 6TFywA6Jt8fII6cooxpmsP7CL4zEKwZHHLd96F6YOj0+IIcchcLjzc9zvjKKeoj1/n
	 sbxKhr/fYWpwQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 14A3BCE091E; Tue, 29 Apr 2025 11:47:37 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:47:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v3 11/20] ratelimit: Force re-initialization when
 rate-limiting re-enabled
Message-ID: <febe8195-ea9e-4ac0-8382-6725ac969bb4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-11-paulmck@kernel.org>
 <aA-f0jpBBbdfsmn7@pathway.suse.cz>
 <58153904-1d2f-44aa-b97d-56486e91a787@paulmck-laptop>
 <aBDAptg0sMY8Pdt7@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBDAptg0sMY8Pdt7@pathway.suse.cz>

On Tue, Apr 29, 2025 at 02:05:58PM +0200, Petr Mladek wrote:
> On Mon 2025-04-28 12:49:18, Paul E. McKenney wrote:
> > On Mon, Apr 28, 2025 at 05:33:38PM +0200, Petr Mladek wrote:
> > > On Thu 2025-04-24 17:28:17, Paul E. McKenney wrote:
> > > > Currently, rate limiting being disabled results in an immediate early
> > > > return with no state changes.  This can result in false-positive drops
> > > > when re-enabling rate limiting.  Therefore, mark the ratelimit_state
> > > > structure "uninitialized" when rate limiting is disabled.
> > > > 
> > > > Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> > > > Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> > > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > > Cc: Petr Mladek <pmladek@suse.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> > > > Cc: Mateusz Guzik <mjguzik@gmail.com>
> > > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > > Cc: John Ogness <john.ogness@linutronix.de>
> > > > Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > > ---
> > > >  lib/ratelimit.c | 15 ++++++++++++++-
> > > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > > > index 7a7ba4835639f..52aab9229ca50 100644
> > > > --- a/lib/ratelimit.c
> > > > +++ b/lib/ratelimit.c
> > > > @@ -35,11 +35,24 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> > > >  	unsigned long flags;
> > > >  	int ret;
> > > >  
> > > > +	/*
> > > > +	 * Zero interval says never limit, otherwise, non-positive burst
> > > > +	 * says always limit.
> > > > +	 */
> > > >  	if (interval <= 0 || burst <= 0) {
> > > >  		ret = interval == 0 || burst > 0;
> > > > +		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> > > > +		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
> > > 
> > > I though more about this. And I am not sure if this is safe.
> > > 
> > > We are here when the structure has not been initialized yet.
> > > The spin lock is going to be likely still initialized.
> > > In theory, it might happen in parallel:
> > > 
> > > CPU0				CPU1
> > > 
> > > ___ratelimit()
> > >   if (interval <= 0 || burst <= 0)
> > >     // true on zero initialized struct
> > > 
> > >     if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> > >       // same here
> > >       !raw_spin_trylock_irqsave(&rs->lock, flags)) {
> > >       // success???
> > > 
> > > 				ratelimit_state_init()
> > > 				  raw_spin_lock_init(&rs->lock);
> > > 
> > > 
> > >       raw_spin_unlock_irqrestore(&rs->lock, flags);
> > > 
> > > BANG: Unlocked rs->lock which has been initialized in the meantime.
> > > 
> > > 
> > > Note: The non-initialized structure can be used in ext4 code,
> > >       definitely, see
> > >       https://lore.kernel.org/r/aAnp9rdPhRY52F7N@pathway.suse.cz
> > > 
> > >       Well, I think that it happens in the same CPU. So, it should
> > >       be "safe".
> > > 
> > > 
> > > Sigh, I guess that this patch is needed to fix the lib/tests/test_ratelimit.c.
> > > It works because the test modifies .burst and .interval directly.
> > > 
> > > What is a sane behavior/API?
> > > 
> > > IMHO:
> > > 
> > > 1. Nobody, including ext4 code, should use non-initialized
> > >    struct ratelimit_state. It is a ticking bomb.
> > > 
> > >    IMHO, it should trigger a warning and the callers should get fixed.
> > 
> > I agree in principle, but in practice it will at best take some time to
> > drive the change into the other systems.  So let's make the this code
> > work with the existing client code, get that accepted, and then separately
> > I can do another round of cleanup.  (Or you can, if you prefer.)
> > 
> > After that, the WARN_ONCE() can be upgraded to complain if both interval
> > and burst are zero.
> 
> Fair enough. This patchset already is huge...
> 
> > > 2. Nobody, including the selftest, should modify struct ratelimit_state
> > >    directly.
> > > 
> > >    This patchset adds ratelimit_state_reset_interval() for this
> > >    purpose. It clears ~RATELIMIT_INITIALIZED. So this patch won't
> > >    be needed when the API was used in the selftest.
> > > 
> > > It was actually great that ___ratelimit() was able to handle
> > > non-initialized struct ratelimit_state without taking
> > > the bundled lock.
> > > 
> > > What do you think, please?
> > 
> > Hmmm...
> > 
> > It sounds like I need to avoid acquiring that lock if both interval
> > and burst are zero.  A bit inelegant, but it seems to be what needs
> > to happen.
> > 
> > In the short term, how about the patch shown below?
> > 						Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index 626f04cabb727..859c251b23ce2 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -42,7 +42,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> >  	if (interval <= 0 || burst <= 0) {
> >  		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
> >  		ret = interval == 0 || burst > 0;
> > -		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> > +		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) || (!interval && !burst) ||
> >  		    !raw_spin_trylock_irqsave(&rs->lock, flags))
> >  			goto nolock_ret;
> >  
> 
> It looks good as a short term solution.

Thank you!

> Let's see how long it would stay in the code. ;-)

Excellent question.  ;-)

> Best Regards,
> Petr
> 
> PS: I am not sure how much you are motivated on doing a further
>     clean up. You did great changes. But I guess that it has already
>     went much further than you expected.

And this will be some fun due to the fact that the external modifications
of the ->burst and ->interval fields are often via sysfs or similar.
And these tend to take pointers to these fields.

From what I can see, these are currently validated on a field-by-field
basis, but we would want to check both fields.  This is because it would
be OK to set either field to zero, but not both of them.

Except that if both fields are zero, we need the lock to be initialized
first.  But that won't play nicely with a subsequent initialization of
the lock.

So some care may be required on the journey from where we are to a more
prinicipled destination.  ;-)

>     I could continue when time permits. But I rather do not
>     promise anything.

My current thought is to get what I have set up.  I would of course be
more than happy to let you do the subsequent work.  But let's see how
things look at that point.

							Thanx, Paul
