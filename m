Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A022E7083A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869761; cv=none; b=qDyHv/DjrpRd9UTQy8dfm46gtqDGjHjoeypYKZb26gg9pMqi4Gaz8J/0uUYRxS8DG5tZRZBMluZxqBlZq59fgWVr/ef76NCEvoHi1El+tNfmVy5saK0sRrg970q5Hu+eYv85ErDG5QvADY55+xaG37BsliNqm1Z+m46LIw251Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869761; c=relaxed/simple;
	bh=3gXmrcYdj9Gg8cyq0OuSZ9rTbwiNa/jM9SCJyzRX0xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdZ2bUCElLDIFG6+tBMaMr8IlgwgCI8nm8vykzYCl3xTfqtEcIJ3ls2wL4I+vvJric7pdoXzoBehyd6KBJioCRJCRXiRu81Y9NSzpmQB7EkHQZtsqSbTnPTP+GMzVS0ohAYDQoTPE5tpIfqGRFxNtFWKGVvNe9VoRIgx899lW7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLOR2IVd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLOR2IVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21710C4CEE9;
	Mon, 28 Apr 2025 19:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745869760;
	bh=3gXmrcYdj9Gg8cyq0OuSZ9rTbwiNa/jM9SCJyzRX0xY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=OLOR2IVd++SJZhFumRlgPaZ84LJZ6PWoV7TfSGZ+pnCLTi+yAsx+HjM8wl8398QiJ
	 lrStoJRPfGtzNVWJed9YC+pamtFJtkPdqSQA0maeKp+bCVx2c60dj5fvefOo37MLsJ
	 LUEjANYhzczk6SzjnxBIW9b/XnVeILo6JlHQIyEQ0xxhZRVRMjXNnQABxIaqU1ynrD
	 PfwdX4mF0yFdqFEcemUKM5FcadIG3dpRxVKkk/WIkbrFk/mkMKSVLlEgmHyMa9lkmu
	 yzr/Ms2iu9yIhI3Kh8KXXVhtS966gdmdmAz54yG8+2hH+2kBZyEk6D2D3q0wtKLs5G
	 GoXuMDWSt3T4Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0FBA1CE0838; Mon, 28 Apr 2025 12:49:18 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:49:18 -0700
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
Message-ID: <58153904-1d2f-44aa-b97d-56486e91a787@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-11-paulmck@kernel.org>
 <aA-f0jpBBbdfsmn7@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA-f0jpBBbdfsmn7@pathway.suse.cz>

On Mon, Apr 28, 2025 at 05:33:38PM +0200, Petr Mladek wrote:
> On Thu 2025-04-24 17:28:17, Paul E. McKenney wrote:
> > Currently, rate limiting being disabled results in an immediate early
> > return with no state changes.  This can result in false-positive drops
> > when re-enabling rate limiting.  Therefore, mark the ratelimit_state
> > structure "uninitialized" when rate limiting is disabled.
> > 
> > Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> > Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> > Cc: Mateusz Guzik <mjguzik@gmail.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: John Ogness <john.ogness@linutronix.de>
> > Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  lib/ratelimit.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index 7a7ba4835639f..52aab9229ca50 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -35,11 +35,24 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> >  	unsigned long flags;
> >  	int ret;
> >  
> > +	/*
> > +	 * Zero interval says never limit, otherwise, non-positive burst
> > +	 * says always limit.
> > +	 */
> >  	if (interval <= 0 || burst <= 0) {
> >  		ret = interval == 0 || burst > 0;
> > +		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> > +		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
> 
> I though more about this. And I am not sure if this is safe.
> 
> We are here when the structure has not been initialized yet.
> The spin lock is going to be likely still initialized.
> In theory, it might happen in parallel:
> 
> CPU0				CPU1
> 
> ___ratelimit()
>   if (interval <= 0 || burst <= 0)
>     // true on zero initialized struct
> 
>     if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
>       // same here
>       !raw_spin_trylock_irqsave(&rs->lock, flags)) {
>       // success???
> 
> 				ratelimit_state_init()
> 				  raw_spin_lock_init(&rs->lock);
> 
> 
>       raw_spin_unlock_irqrestore(&rs->lock, flags);
> 
> BANG: Unlocked rs->lock which has been initialized in the meantime.
> 
> 
> Note: The non-initialized structure can be used in ext4 code,
>       definitely, see
>       https://lore.kernel.org/r/aAnp9rdPhRY52F7N@pathway.suse.cz
> 
>       Well, I think that it happens in the same CPU. So, it should
>       be "safe".
> 
> 
> Sigh, I guess that this patch is needed to fix the lib/tests/test_ratelimit.c.
> It works because the test modifies .burst and .interval directly.
> 
> What is a sane behavior/API?
> 
> IMHO:
> 
> 1. Nobody, including ext4 code, should use non-initialized
>    struct ratelimit_state. It is a ticking bomb.
> 
>    IMHO, it should trigger a warning and the callers should get fixed.

I agree in principle, but in practice it will at best take some time to
drive the change into the other systems.  So let's make the this code
work with the existing client code, get that accepted, and then separately
I can do another round of cleanup.  (Or you can, if you prefer.)

After that, the WARN_ONCE() can be upgraded to complain if both interval
and burst are zero.

> 2. Nobody, including the selftest, should modify struct ratelimit_state
>    directly.
> 
>    This patchset adds ratelimit_state_reset_interval() for this
>    purpose. It clears ~RATELIMIT_INITIALIZED. So this patch won't
>    be needed when the API was used in the selftest.
> 
> It was actually great that ___ratelimit() was able to handle
> non-initialized struct ratelimit_state without taking
> the bundled lock.
> 
> What do you think, please?

Hmmm...

It sounds like I need to avoid acquiring that lock if both interval
and burst are zero.  A bit inelegant, but it seems to be what needs
to happen.

In the short term, how about the patch shown below?

						Thanx, Paul

------------------------------------------------------------------------

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 626f04cabb727..859c251b23ce2 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -42,7 +42,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	if (interval <= 0 || burst <= 0) {
 		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
 		ret = interval == 0 || burst > 0;
-		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
+		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) || (!interval && !burst) ||
 		    !raw_spin_trylock_irqsave(&rs->lock, flags))
 			goto nolock_ret;
 
