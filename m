Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF122C2585
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928364; cv=none; b=WDNxJcWIUDrj+m6P9kdwKhOJ5DAoDNCWLf2qKiazB5UBTTKKN6UjH7um+zXU7lTlleySQIZlYYJKVP8wThMJqqKJMyig1k8e+zb1hGF2teQRV5A3Sv1yEEG57WYxeQ/x4tyGkGqt6uuJSqCBiM7iQ6nzIQUE74/2AJL66zL49as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928364; c=relaxed/simple;
	bh=+0l3ptfgZl3EjMVDuk3Tbk+CKJTDFxhazbZHuhKWLAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZxdpFgIzi/zucHKqaxk9ofVecGROY6LsOSWW94Wh1amphP8hePqDc/wXyPbbKOagqYD48d14M6eaKWnJOEe46AH0y80ClDHAsiMJNRL8asi/jf7CR7BRsyokYdYr6VmlKf7vgz5AJbpvg+matNuoL6xBcn/HAKzbXeEA5xcUEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FXXJXtB5; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FXXJXtB5"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso12152351a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745928360; x=1746533160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D7tNecfQ6UWhDnFq/GK5HMaDn7Esf244PeKVu/8kNKg=;
        b=FXXJXtB5lRrrhw2gHuIzd0gpiWb5PdE5rQ0wN4QyghEAyAAwMuBLELEHm/SL/i3YS1
         nl3OT1hOWpXi/jw1lukndIM+kdQ9R7x4aB5nkhrmkO7dloOcymYe538lPZjyMgqiSpML
         kBW9+vBJcRm9mzPeWyL/PBCKjKQq3zrm913N8Dw7SBqDHxg8DtaG5aCmFr8p+yvjoAfP
         DEQagpuH3Uxz7nGuA3HKMwhkuGqJ+dQMnWlBFd7VgQ6QMSG8ouRv5WZXseDGACxklCjb
         SoFyViVxRLDC/jpJ9i0Sd6+1fMubdeh7lHEaTNdYTfFXOUsW+7tLfcoFcbX4GbYQtM+h
         BHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928360; x=1746533160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7tNecfQ6UWhDnFq/GK5HMaDn7Esf244PeKVu/8kNKg=;
        b=pWp52ymi51yTeMDXgS38YQ6d4r5wBfPz/D4rQfz7fiYfGNpXkMnMB/PtsRQTNuxWJc
         M0scOhRF6meTsTGqXwDFNG4cWQd571+xPy/cU3Fu+Fm+N+IX2ceL2V8Vx49jj4PFiTZ3
         y9SsphDTCprNCi7+lHFfLRNPvQWGJAoY8yVGRY3zofycSEevLI7NkwWw7pow19yBQ3KI
         BXZsQplBWNc9Sc1yGAnxnKV8yGm4JKHz2nMQGq/1d5m5VTs/ATrxSbTm/A818PvqWdio
         u1VQ5xXsePJ1ohW2/Mqt7OxmkRjMWoOuxhH9OhK5eqfug+0uzklITrR+D61Tue31Pa5G
         Hdqw==
X-Gm-Message-State: AOJu0YzK0SZaoFLOMkqMVi7Q+WmvDqGfjbKf2Rnz9MX9oFQaO+kljYQu
	q9dAUzPn7lq+OTg/TvQ9pnOIg5t/hc2mxdsi7xXv1FH9p5PxUBhX0AF0fGOAgLY=
X-Gm-Gg: ASbGnct2Lebx3DC4ovj0al3CqTFk7TbI4DtcU4qLNNaliw0iks7aJXD9lOi/ZBp5Xo9
	QJPUhXBN0ndisfA4c7fMkJXNr1QXkNjadKgonv3C/6qUj+k83uccDPrf4RGbwAqdIsdac+FPYR/
	CSi+QNjRioxhFJtYUxtEiDfVLShbv1TPaPlcpeLZAQ0rt/TspZ54y1NmUpWSxsMJvfpbB1fU2D/
	tvt/5cXFpbmoFToSjkrQFu59tTVQxoCDBRIMDyRzQHc/P/llNCQWyn105b1pnO/lDAKBd36Ozih
	O046rEwph//HeVgxomZewwTsNaGb4Y6vXNHmG3uc
X-Google-Smtp-Source: AGHT+IHUriq9uicMt2JVdQBqyXsv2Js32+jpGojBX6MMVsVpedwM5MDVCy/bN6BgntIuCqi+STVr0Q==
X-Received: by 2002:a17:907:970d:b0:ace:c2ab:a72d with SMTP id a640c23a62f3a-acec6bf6c98mr242379766b.25.1745928360110;
        Tue, 29 Apr 2025 05:06:00 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm768082866b.85.2025.04.29.05.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:05:59 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:05:58 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Message-ID: <aBDAptg0sMY8Pdt7@pathway.suse.cz>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-11-paulmck@kernel.org>
 <aA-f0jpBBbdfsmn7@pathway.suse.cz>
 <58153904-1d2f-44aa-b97d-56486e91a787@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58153904-1d2f-44aa-b97d-56486e91a787@paulmck-laptop>

On Mon 2025-04-28 12:49:18, Paul E. McKenney wrote:
> On Mon, Apr 28, 2025 at 05:33:38PM +0200, Petr Mladek wrote:
> > On Thu 2025-04-24 17:28:17, Paul E. McKenney wrote:
> > > Currently, rate limiting being disabled results in an immediate early
> > > return with no state changes.  This can result in false-positive drops
> > > when re-enabling rate limiting.  Therefore, mark the ratelimit_state
> > > structure "uninitialized" when rate limiting is disabled.
> > > 
> > > Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> > > Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > Cc: Petr Mladek <pmladek@suse.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> > > Cc: Mateusz Guzik <mjguzik@gmail.com>
> > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > Cc: John Ogness <john.ogness@linutronix.de>
> > > Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > ---
> > >  lib/ratelimit.c | 15 ++++++++++++++-
> > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > > index 7a7ba4835639f..52aab9229ca50 100644
> > > --- a/lib/ratelimit.c
> > > +++ b/lib/ratelimit.c
> > > @@ -35,11 +35,24 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> > >  	unsigned long flags;
> > >  	int ret;
> > >  
> > > +	/*
> > > +	 * Zero interval says never limit, otherwise, non-positive burst
> > > +	 * says always limit.
> > > +	 */
> > >  	if (interval <= 0 || burst <= 0) {
> > >  		ret = interval == 0 || burst > 0;
> > > +		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> > > +		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
> > 
> > I though more about this. And I am not sure if this is safe.
> > 
> > We are here when the structure has not been initialized yet.
> > The spin lock is going to be likely still initialized.
> > In theory, it might happen in parallel:
> > 
> > CPU0				CPU1
> > 
> > ___ratelimit()
> >   if (interval <= 0 || burst <= 0)
> >     // true on zero initialized struct
> > 
> >     if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> >       // same here
> >       !raw_spin_trylock_irqsave(&rs->lock, flags)) {
> >       // success???
> > 
> > 				ratelimit_state_init()
> > 				  raw_spin_lock_init(&rs->lock);
> > 
> > 
> >       raw_spin_unlock_irqrestore(&rs->lock, flags);
> > 
> > BANG: Unlocked rs->lock which has been initialized in the meantime.
> > 
> > 
> > Note: The non-initialized structure can be used in ext4 code,
> >       definitely, see
> >       https://lore.kernel.org/r/aAnp9rdPhRY52F7N@pathway.suse.cz
> > 
> >       Well, I think that it happens in the same CPU. So, it should
> >       be "safe".
> > 
> > 
> > Sigh, I guess that this patch is needed to fix the lib/tests/test_ratelimit.c.
> > It works because the test modifies .burst and .interval directly.
> > 
> > What is a sane behavior/API?
> > 
> > IMHO:
> > 
> > 1. Nobody, including ext4 code, should use non-initialized
> >    struct ratelimit_state. It is a ticking bomb.
> > 
> >    IMHO, it should trigger a warning and the callers should get fixed.
> 
> I agree in principle, but in practice it will at best take some time to
> drive the change into the other systems.  So let's make the this code
> work with the existing client code, get that accepted, and then separately
> I can do another round of cleanup.  (Or you can, if you prefer.)
> 
> After that, the WARN_ONCE() can be upgraded to complain if both interval
> and burst are zero.

Fair enough. This patchset already is huge...

> > 2. Nobody, including the selftest, should modify struct ratelimit_state
> >    directly.
> > 
> >    This patchset adds ratelimit_state_reset_interval() for this
> >    purpose. It clears ~RATELIMIT_INITIALIZED. So this patch won't
> >    be needed when the API was used in the selftest.
> > 
> > It was actually great that ___ratelimit() was able to handle
> > non-initialized struct ratelimit_state without taking
> > the bundled lock.
> > 
> > What do you think, please?
> 
> Hmmm...
> 
> It sounds like I need to avoid acquiring that lock if both interval
> and burst are zero.  A bit inelegant, but it seems to be what needs
> to happen.
> 
> In the short term, how about the patch shown below?
> 						Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index 626f04cabb727..859c251b23ce2 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -42,7 +42,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>  	if (interval <= 0 || burst <= 0) {
>  		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
>  		ret = interval == 0 || burst > 0;
> -		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> +		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) || (!interval && !burst) ||
>  		    !raw_spin_trylock_irqsave(&rs->lock, flags))
>  			goto nolock_ret;
>  

It looks good as a short term solution.

Let's see how long it would stay in the code. ;-)

Best Regards,
Petr

PS: I am not sure how much you are motivated on doing a further
    clean up. You did great changes. But I guess that it has already
    went much further than you expected.

    I could continue when time permits. But I rather do not
    promise anything.
