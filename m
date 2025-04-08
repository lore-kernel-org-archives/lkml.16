Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25A11B6CFE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134983; cv=none; b=TIZ/q2X+qvDkQ7YGitUc+W2mYx7yQvPuH3UWb447TzotzeQYk7P0iZ0CucguqJrlueAuYhcaO0p6R0II0t/UB9ZY8i7ZBpKU+fm8OnvF2aFC8vx56h7DOAHtFA7Ln3BK+kT1qGaOZNadyQBGKWF1Lx4IRA73hpSJpEFblK/5PC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134983; c=relaxed/simple;
	bh=fVbx+2XoxcL2GZdj8r/TkTmRM7oLptiW9yL/H4eW950=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHt7GbvASoUApROtOyfhajgwM5VYRG1b3lLiXs8fXEF2LbaIVmLfX/tVFuMikgVhiUG4KWM+Wkq20c7ArcRmz0qITsZpAKo2LPtddT6WqnIW7jRm47qWUAm6b0EHRHfei8sPIEUUwT4yuUc7tVJDsNgC+bXLib5yNQ5WkknyIyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k71uwMUG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k71uwMUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7B0C4CEE5;
	Tue,  8 Apr 2025 17:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744134983;
	bh=fVbx+2XoxcL2GZdj8r/TkTmRM7oLptiW9yL/H4eW950=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=k71uwMUGzlYr0J4MzVq2jdLOQq7AFjbT0ddVjOto+hA8ijcKpkuRy+oFFoDPmCdKo
	 mkAo02Fv3qk1zB4rcyVaQJaI7JfX52JaiCxHlNs+r8W40WKUuLk1l3yf5Dse7wcJwT
	 8HskUipbneiAwAvugkSmFitYECXS2ce4u7QjJH2nM3mzNxvpLpkIFe1tfDRNdQ4ZcK
	 lRDHn6b43+ac0lfj9Dl1j+QSiIzdoVlnd3l6uaVTZ+kT95U2fqZz66v+e8m2BwkPP3
	 Gsbeavs9iAyyVm3FKllFlpisvHYZJGxbubb6zAocjAAGRScYMWJ/FA7wuGKJWaVeY9
	 ZTbuRkHKNbs0w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AF09ACE0F64; Tue,  8 Apr 2025 10:56:22 -0700 (PDT)
Date: Tue, 8 Apr 2025 10:56:22 -0700
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
Subject: Re: [PATCH RFC 8/9] ratelimit: Reduce ratelimit's false-positive
 misses
Message-ID: <915686b0-12e7-4ec5-8771-639cdcaae19d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <20250403211514.985900-8-paulmck@kernel.org>
 <Z_VRo63o2UsVoxLG@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VRo63o2UsVoxLG@pathway.suse.cz>

On Tue, Apr 08, 2025 at 06:41:07PM +0200, Petr Mladek wrote:
> On Thu 2025-04-03 14:15:13, Paul E. McKenney wrote:
> > The current ratelimit implementation can suffer from false-positive
> > misses.  That is, ___ratelimit() might return zero (causing the caller
> > to invoke rate limiting, for example, by dropping printk()s) even when
> > the current burst has not yet been consumed.  This happens when one CPU
> > holds a given ratelimit structure's lock and some other CPU concurrently
> > invokes ___ratelimit().  The fact that the lock is a raw irq-disabled
> > spinlock might make low-contention trylock failure seem unlikely, but
> > vCPU preemption, NMIs, and firmware interrupts can greatly extend the
> > trylock-failure window.
> > 
> > Avoiding these false-positive misses is especially important when
> > correlating console logged hardware failures with other information.
> > 
> > Therefore, instead of attempting to acquire the lock on each call to
> > ___ratelimit(), construct a lockless fastpath and only acquire the lock
> > when retriggering (for the next burst) or when resynchronizing (due to
> > either a long idle period or due to ratelimiting having been disabled).
> > This reduces the number of lock-hold periods that can be extended
> > by vCPU preemption, NMIs and firmware interrupts, but also means that
> > these extensions must be of much longer durations (generally moving from
> > milliseconds to seconds) before they can result in false-positive drops.
> > 
> > In addition, the lockless fastpath gets a 10-20% speedup compared to
> > the old fully locked code on my x86 laptop.  Your mileage will of course
> > vary depending on your hardware, workload, and configuration.
> > 
> > [ paulmck: Apply feedback from Dan Carpenter. ]

Thank you for digging into this!

> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index bd6e3b429e333..03704c6f8899e 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -26,55 +26,161 @@
> >   */
> >  int ___ratelimit(struct ratelimit_state *rs, const char *func)
> >  {
> > -	/* Paired with WRITE_ONCE() in .proc_handler().
> > -	 * Changing two values seperately could be inconsistent
> > -	 * and some message could be lost.  (See: net_ratelimit_state).
> > -	 */
> > -	int interval = READ_ONCE(rs->interval);
> > +	unsigned long begin;
> >  	int burst = READ_ONCE(rs->burst);
> > +	int delta = 0;
> >  	unsigned long flags;
> > -	int ret;
> > -
> > -	if (!interval)
> > -		return 1;
> > +	bool gotlock = false;
> > +	bool initialized;
> > +	int interval = READ_ONCE(rs->interval);
> > +	unsigned long j;
> > +	int n_left;
> >  
> >  	/*
> > -	 * If we contend on this state's lock then almost
> > -	 * by definition we are too busy to print a message,
> > -	 * in addition to the one that will be printed by
> > -	 * the entity that is holding the lock already:
> > +	 * If the burst or interval settings mark this ratelimit_state
> > +	 * structure as disabled, then clear the RATELIMIT_INITIALIZED bit
> > +	 * in ->flags to force resetting of the ratelimiting interval when
> > +	 * this ratelimit_state structure is next re-enabled.
> >  	 */
> > -	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
> > -		ratelimit_state_inc_miss(rs);
> > -		return 0;
> > +	if (burst <= 0 || interval <= 0) {
> > +		if ((READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) &&
> > +		    raw_spin_trylock_irqsave(&rs->lock, flags)) {
> > +			if (READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED)
> > +				smp_store_release(&rs->flags, rs->flags & ~RATELIMIT_INITIALIZED);
> > +			raw_spin_unlock_irqrestore(&rs->lock, flags);
> > +		}
> > +		return true;
> >  	}
> >  
> > -	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
> > -		rs->begin = jiffies;
> > -		rs->flags |= RATELIMIT_INITIALIZED;
> > +	/*
> > +	 * If this structure has just now been ratelimited, but not yet
> > +	 * reset for the next rate-limiting interval, take an early and
> > +	 * low-cost exit.
> > +	 */
> > +	if (atomic_read_acquire(&rs->rs_n_left) <= 0) /* Pair with release. */
> > +		goto limited;
> > +
> > +	/*
> > +	 * If this structure is marked as initialized and has been
> > +	 * recently used, pick up its ->begin field.  Otherwise, pick up
> > +	 * the current time and attempt to re-initialized the structure.
> > +	 */
> > +	j = jiffies;
> > +	initialized = smp_load_acquire(&rs->flags) & RATELIMIT_INITIALIZED; /* Pair with release. */
> > +	if (initialized) {
> > +		begin = READ_ONCE(rs->begin);
> > +	} else {
> > +		/*
> > +		 * Uninitialized or long idle, so reset ->begin and
> > +		 * mark initialized.  If we fail to acquire the lock,
> > +		 * let the lock holder do the work.
> > +		 */
> > +		begin = j;
> > +		if (raw_spin_trylock_irqsave(&rs->lock, flags)) {
> > +			if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED)) {
> > +				begin = jiffies;
> > +				j = begin;
> > +				WRITE_ONCE(rs->begin, begin);
> > +				smp_store_release(&rs->flags, /* Pair with acquire. */
> > +						  rs->flags | RATELIMIT_INITIALIZED);
> > +				initialized = true;
> > +			}
> > +			raw_spin_unlock_irqrestore(&rs->lock, flags);
> > +		}
> >  	}
> >  
> > -	if (time_is_before_jiffies(rs->begin + interval)) {
> > -		int m = ratelimit_state_reset_miss(rs);
> > +	/*
> > +	 * If this structure is still in the interval in which has
> > +	 * already hit the rate limit, take an early and low-cost exit.
> > +	 */
> > +	if (initialized && time_before(begin - 2 * interval, j) && time_before(j, begin))
> 
> How do we know that the previous interval was ratelimited, please?
> I have to admit that I still do not fully get the new logic ;-)

Because otherwise "begin" would still be before "j".  The fact that
"begin" is after "j" means that we have already hit the limit and we
are reset for the new interval that will start at time "begin".

> > +		goto limited;
> >  
> > -		if (m) {
> > -			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
> > -				printk_deferred(KERN_WARNING
> > -						"%s: %d callbacks suppressed\n", func, m);
> > -			}
> > +	/*
> > +	 * Register another request, and take an early (but not low-cost)
> > +	 * exit if rate-limiting just nowcame into effect.
> > +	 */
> > +	n_left = atomic_dec_return(&rs->rs_n_left);
> > +	if (n_left < 0)
> > +		goto limited; /* Just now started ratelimiting. */
> > +	if (n_left > 0) {
> > +		/*
> > +		 * Otherwise, there is not yet any rate limiting for the
> > +		 * current interval, and furthermore there is at least one
> > +		 * last count remaining.  But check to see if initialization
> > +		 * is required or if we have run off the end of the interval
> > +		 * without rate limiting having been imposed.  Either way,
> > +		 * we eventually return @true to tell our caller to go ahead.
> > +		 */
> > +		if (initialized &&
> > +		    time_before(begin - interval, j) && time_before(j, begin + interval))
> > +			return true;  /* Nothing special to do. */
> > +		if (!raw_spin_trylock_irqsave(&rs->lock, flags))
> > +			return true; /* Let lock holder do special work. */
> > +		interval = READ_ONCE(rs->interval);
> > +		begin = rs->begin;
> > +		initialized = smp_load_acquire(&rs->flags) & RATELIMIT_INITIALIZED;
> > +		if (interval <= 0 ||
> > +		    (initialized &&
> > +		     time_before(begin - interval, j) && time_before(j, begin + interval))) {
> > +			/*
> > +			 * Someone else beat us to the special work,
> > +			 * so release the lock and return.
> > +			 */
> 
> I am confused by the comment. IMHO, we are here when we do not need
> to reset the interval. It happens either when the interval is
> infinite (interval < 0) or when we are still in the currrent interval
> and more calls are allowed (n_left > 0).

We ran off the end of the previous window before exhausting its
->rs_n_left.  So the counts we didn't use during that interval we now
lose and we start over with ->rs_n_left reset to ->burst.

Except that in this case, by the time we actually acquired the lock,
someone else had already done that reset for us.

> > +			raw_spin_unlock_irqrestore(&rs->lock, flags);
> > +			return true;
> >  		}
> > -		rs->begin   = jiffies;
> > -		rs->printed = 0;
> > +
> > +		/* We have the lock and will do initialization. */
> > +		gotlock = true;
> > +		delta = -1;
> >  	}
> > -	if (burst && burst > rs->printed) {
> > -		rs->printed++;
> > -		ret = 1;
> > -	} else {
> > -		ratelimit_state_inc_miss(rs);
> > -		ret = 0;
> > +	if (!gotlock) {
> > +		/*
> > +		 * We get here if we got the last count (n_left == 0),
> > +		 * so that rate limiting is in effect for the next caller.
> > +		 * We will return @true to tell our caller to go ahead,
> > +		 * but first we acquire the lock and set things up for
> > +		 * the next rate-limiting interval.
> > +		 */
> > +		raw_spin_lock_irqsave(&rs->lock, flags);
> 
> I do not have a good feeling about this. It could cause a deadlock
> in panic() when other CPUs are stopped or in NMI. And the ratelimit
> used to be "safe" in this context.

Ah, then this needs to be a trylock.  I did miss that point, thank you.

> Honestly, the new code is a bit hard to follow for me. The original
> logic was more strightforward. I wonder if we could reduce the problem
> "just" by checking the remaining allowed count.

And I could repair this, but let's look at what you have.

> I mean to introduce the atomic rs_n_left and check it when
> it is not possible to take the lock. But keep most of
> the current logic. Something like:
> 
> >From 1df6d1a79645dd5c0ad7cef7c94b802de202057e Mon Sep 17 00:00:00 2001
> From: Petr Mladek <pmladek@suse.com>
> Date: Tue, 8 Apr 2025 16:00:22 +0200
> Subject: [PATCH 1/2] ratelimit: Reduce ratelimit's false-positive
>  (alternative)
> 
> ---
>  include/linux/ratelimit.h       |  2 +-
>  include/linux/ratelimit_types.h |  2 +-
>  lib/ratelimit.c                 | 51 ++++++++++++++++++++++++---------
>  3 files changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/include/linux/ratelimit.h b/include/linux/ratelimit.h
> index adfec24061d1..7aaad158ee37 100644
> --- a/include/linux/ratelimit.h
> +++ b/include/linux/ratelimit.h
> @@ -44,7 +44,7 @@ static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, in
>  	raw_spin_lock_irqsave(&rs->lock, flags);
>  	rs->interval = interval_init;
>  	rs->flags &= ~RATELIMIT_INITIALIZED;
> -	rs->printed = 0;
> +	atomic_set(&rs->rs_n_left, rs->burst);
>  	ratelimit_state_reset_miss(rs);
>  	raw_spin_unlock_irqrestore(&rs->lock, flags);
>  }
> diff --git a/include/linux/ratelimit_types.h b/include/linux/ratelimit_types.h
> index ef6711b6b229..b19c4354540a 100644
> --- a/include/linux/ratelimit_types.h
> +++ b/include/linux/ratelimit_types.h
> @@ -18,7 +18,7 @@ struct ratelimit_state {
>  
>  	int		interval;
>  	int		burst;
> -	int		printed;
> +	atomic_t	rs_n_left;
>  	atomic_t	missed;
>  	unsigned int	flags;
>  	unsigned long	begin;
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index bd6e3b429e33..90c9fe57eb42 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -39,12 +39,22 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>  		return 1;
>  
>  	/*
> -	 * If we contend on this state's lock then almost
> -	 * by definition we are too busy to print a message,
> -	 * in addition to the one that will be printed by
> -	 * the entity that is holding the lock already:
> +	 * If we contend on this state's lock then just check if
> +	 * the current burst is used or not. It might cause
> +	 * false positive when we are past the interval and
> +	 * the current lock owner is just about to reset it.
>  	 */
>  	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
> +		unsigned int rs_flags = READ_ONCE(rs->flags);
> +
> +		if (rs_flags & RATELIMIT_INITIALIZED && burst) {
> +			int n_left;
> +
> +			n_left = atomic_dec_return(&rs->rs_n_left);
> +			if (n_left >= 0)
> +				return 1;
> +		}
> +
>  		ratelimit_state_inc_miss(rs);
>  		return 0;
>  	}
> @@ -52,27 +62,42 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>  	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
>  		rs->begin = jiffies;
>  		rs->flags |= RATELIMIT_INITIALIZED;
> +		atomic_set(&rs->rs_n_left, rs->burst);
>  	}
>  
>  	if (time_is_before_jiffies(rs->begin + interval)) {
> -		int m = ratelimit_state_reset_miss(rs);
> +		int m;
>  
> +		/*
> +		 * Reset rs_n_left ASAP to reduce false positives
> +		 * in parallel calls, see above.
> +		 */
> +		atomic_set(&rs->rs_n_left, rs->burst);
> +		rs->begin = jiffies;
> +
> +		m = ratelimit_state_reset_miss(rs);
>  		if (m) {
>  			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
>  				printk_deferred(KERN_WARNING
>  						"%s: %d callbacks suppressed\n", func, m);
>  			}
>  		}
> -		rs->begin   = jiffies;
> -		rs->printed = 0;
>  	}
> -	if (burst && burst > rs->printed) {
> -		rs->printed++;
> -		ret = 1;
> -	} else {
> -		ratelimit_state_inc_miss(rs);
> -		ret = 0;
> +	if (burst) {
> +		int n_left;
> +
> +		/* The burst might have been taken by a parallel call. */
> +		n_left = atomic_dec_return(&rs->rs_n_left);
> +		if (n_left >= 0) {
> +			ret = 1;
> +			goto unlock_ret;
> +		}
>  	}
> +
> +	ratelimit_state_inc_miss(rs);
> +	ret = 0;
> +
> +unlock_ret:
>  	raw_spin_unlock_irqrestore(&rs->lock, flags);
>  
>  	return ret;
> -- 

This looks like a plausible approach, and it certainly is a simpler
change.  I will look more closely.

> 2.49.0
> 
> It is still racy. But I think that all versions were somehow racy.
> 
> BTW: The new selftest fails with it. There seems to be two kind of
>      problems:
> 
> 1. Timing. The test seems to be a bit sensitive on timing.
>    It helped me to do not go that close to the "interval":
> 
> diff --git a/lib/test_ratelimit.c b/lib/test_ratelimit.c
> index 3d6db9be6be2..539aa968e858 100644
> --- a/lib/test_ratelimit.c
> +++ b/lib/test_ratelimit.c
> @@ -24,19 +24,19 @@ static void test_ratelimit_smoke(struct kunit *test)
>  	test_ratelimited(test, true);
>  	test_ratelimited(test, false);
>  
> -	schedule_timeout_idle(TESTRL_INTERVAL - 20);
> +	schedule_timeout_idle(TESTRL_INTERVAL - 40);
>  	test_ratelimited(test, false);
>  
> -	schedule_timeout_idle(30);
> +	schedule_timeout_idle(50);
>  	test_ratelimited(test, true);
>  
>  	schedule_timeout_idle(2 * TESTRL_INTERVAL);
>  	test_ratelimited(test, true);
>  	test_ratelimited(test, true);
>  
> -	schedule_timeout_idle(TESTRL_INTERVAL - 20);
> +	schedule_timeout_idle(TESTRL_INTERVAL - 40);
>  	test_ratelimited(test, true);
> -	schedule_timeout_idle(30);
> +	schedule_timeout_idle(50);
>  	test_ratelimited(test, true);
>  	test_ratelimited(test, true);
>  	test_ratelimited(test, true);

Fair enough.  I am not fond of my fixed delays, but have not yet come
up with anything better.

> 2. It still failed on burst = 0 test:
> 
> 	// Test disabling.
> 	testrl.burst = 0;
> 	test_ratelimited(test, true);
> 
>    I haven't tried the selftest with the original code. But it looks
>    to me like it always returned "false" here as well. But I agree
>    that it would make more sense to return "true" here.

Thank you again, and I will look into this more carefully.  My plan is
to both trylock-ify my code and look carefully at your code.  If all
else turns out to be equal, your simpler code of course wins.

							Thanx, Paul
