Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A93E1519BF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767930; cv=none; b=UjpGZUKX/v9kzw0WQQ9lhK6aMay008EhlrH7P+GzKUaE9Mm6azFu4Z1ssnus3JN8WGX6HWeriMuzPK6rylurZS4B0yaed+jvmuIfQabdrpCUIfk2zSNyuR6Ut7JWITSuWf8sqBJgNY51Xrc9H39mwiyVVAD9M41DMF8yNohuqEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767930; c=relaxed/simple;
	bh=ju1CvsdNGgvjOnVX1p49jYn9fWTSBVbRnizYCDow5eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J03FPHNDYIhoMUc2fw0Kn2jcHIucTEjXoA0+p8laOZITTHVdbh5BnymH1xw3dLPKD3RlHR+IpQSGyoayAvTsl+k5RrSCAK18OF/cApA64sBOQBntOvjF7UqQ4t2eaPPo2ah291Lx7O+Kax0U2Qb0LYc8b31bSQ0kpEdf7E+x6q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaJVZ7kc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaJVZ7kc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF97C4CED1;
	Wed,  5 Feb 2025 15:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738767929;
	bh=ju1CvsdNGgvjOnVX1p49jYn9fWTSBVbRnizYCDow5eE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UaJVZ7kcZBdFMyLVQDcJsawpnQLyY1shXlA5Lf4R12k8gGpwrymdbd/We7ksD9xff
	 MEQnYtvOqklf2BPnib1TzwXfIAViWqLaDmgKd42P8vqosIr45J8+xYWJHlKKlsIfww
	 KbfdQKNyb5e1cG+1Mcuk2y4O2qy06r9joYIV8OLvDOW2wX4CNMElCQgngkh24dIH/2
	 Isozsa3VuwvQqg/GUZk1om4Xr/s+Av0jhZvPyhsw6sqX2WD4z5Vj60cHyPWLxdyeaS
	 ESJuxlJDftSiVO3O13Iax47OkHjVXaMm8L+xfdSXccdEBOTBHPociGTF52bwc+RhIg
	 eNkMHX5izqTng==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 596B3CE0749; Wed,  5 Feb 2025 07:05:29 -0800 (PST)
Date: Wed, 5 Feb 2025 07:05:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, frederic@kernel.org, leitao@debian.org
Subject: Re: [PATCH RFC context_tracking] Make RCU watch
 ct_kernel_exit_state() warning
Message-ID: <550b55a0-47b6-49e9-8939-dd5316bff71e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <19bebbeb-db36-4801-bc3d-2c39989b6152@paulmck-laptop>
 <xhsmhjza4k5e5.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b0a4a163-c372-4506-bd12-43f5b4f70e09@paulmck-laptop>
 <xhsmhh658jvq4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmhh658jvq4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Wed, Feb 05, 2025 at 03:45:55PM +0100, Valentin Schneider wrote:
> On 05/02/25 04:16, Paul E. McKenney wrote:
> > On Wed, Feb 05, 2025 at 12:17:06PM +0100, Valentin Schneider wrote:
> >> On 01/02/25 10:44, Paul E. McKenney wrote:
> >> > The WARN_ON_ONCE() in ct_kernel_exit_state() follows the call to
> >> > ct_state_inc(), which means that RCU is not watching this WARN_ON_ONCE().
> >> > This can (and does) result in extraneous lockdep warnings when this
> >> > WARN_ON_ONCE() triggers.  These extraneous warnings are the opposite
> >> > of helpful.
> >> >
> >> > Therefore, invert the WARN_ON_ONCE() condition and move it before the
> >> > call to ct_state_inc().  This does mean that the ct_state_inc() return
> >> > value can no longer be used in the WARN_ON_ONCE() condition, so discard
> >> > this return value and instead use a call to rcu_is_watching_curr_cpu().
> >> > This call is executed only in CONFIG_RCU_EQS_DEBUG=y kernels, so there
> >> > is no added overhead in production use.
> >> >
> >> > Reported-by: Breno Leitao <leitao@debian.org>
> >> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >> > Cc: Frederic Weisbecker <frederic@kernel.org>
> >> > Cc: Valentin Schneider <vschneid@redhat.com>
> >> >
> >> > diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> >> > index 938c48952d26..fb5be6e9b423 100644
> >> > --- a/kernel/context_tracking.c
> >> > +++ b/kernel/context_tracking.c
> >> > @@ -80,17 +80,16 @@ static __always_inline void rcu_task_trace_heavyweight_exit(void)
> >> >   */
> >> >  static noinstr void ct_kernel_exit_state(int offset)
> >> >  {
> >> > -	int seq;
> >> > -
> >> >       /*
> >> >        * CPUs seeing atomic_add_return() must see prior RCU read-side
> >> >        * critical sections, and we also must force ordering with the
> >> >        * next idle sojourn.
> >> >        */
> >> >       rcu_task_trace_heavyweight_enter();  // Before CT state update!
> >> > -	seq = ct_state_inc(offset);
> >> > -	// RCU is no longer watching.  Better be in extended quiescent state!
> >> > -	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && (seq & CT_RCU_WATCHING));
> >> > +	// RCU is still watching.  Better not be in extended quiescent state!
> >> > +	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !rcu_is_watching_curr_cpu());
> >>
> >> Isn't this equivalent to the check done in ct_kernel_enter_state()? That
> >> is, it operates on the same context_tracking.state value that the
> >> ct_kernel_enter_state() WARN_ON_ONCE() sees, so if the warning is to fire
> >> it will fire there first.
> >
> > In theory, yes.  In practice, the bug we are trying to complain about
> > might well be due to that call to ct_kernel_enter_state() having been
> > left out completely.  Or, more likely, the call to one of its callers
> > having been left out completely.  So we cannot rely on its WARN_ON_ONCE()
> > to detect this sort of omitted-call bug.
> >
> > And these omitted-call bugs do happen when bringing up new hardware or
> > implementing new exception paths for existing hardware.
> 
> Ah, quite so, it evens says so on the tin for ct_nmi_enter() & co.
> 
> >> I don't have any better idea than something like the ugly:
> >>
> >>      if (IS_ENABLED(CONFIG_RCU_EQS_DEBUG)) {
> >>              unsigned int new_state, state = atomic_read(&ct->state);
> >>              bool ret;
> >>
> >>              do {
> >>                      new_state = state + offset;
> >>                      // RCU will no longer be watching. Better be in extended quiescent state!
> >>                      WARN_ON_ONCE(new_state & CT_RCU_WATCHING);
> >>
> >>                      ret = atomic_try_cmpxchg(&ct->state, &state, new_state);
> >>              } while (!ret);
> >>      } else {
> >>              (void)ct_state_inc(offset);
> >>      }
> >
> > This would make sense if we need to detect a bug in ct_state_inc() itself.
> > But that function is a one-liner invoking raw_atomic_add_return(),
> > and we have other tests to find bugs in atomics, correct?
> >
> > Or am I missing a trick here?
> 
> Not at all; consider my suggestion revoked and my questioning answered :-)
> 
> Reviewed-by: Valentin Schneider <vschneid@redhat.com>

Thank you!  I will add this during my next rebase.

							Thanx, Paul
