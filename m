Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFE01FC7F9
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777457; cv=none; b=r0tI3u/ItUNQolzrcMNtFhhw6zrMzsD9H+Ph186bpEV0JKFYcLCle6RRXfko+7mUnpJscj3DE2WlXIFOEkAYkerX37qMFE5oZZDPvyLKlRvy9w3JP0JWj7HIi8Hevs/TslE4vjRJPd4UQGct4xf5wher6hjLhjJl8jpBiXGAfOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777457; c=relaxed/simple;
	bh=E6uwQ2kxNgc+rDx5CYdoWHlMu6FPslTzwxlYXYE8OVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jpo/grbk27XWkjVlXHhD+ZK2D1EdmYZvnULCdU1uFgP5/TRq2XjLMgJiGjoupxfwO11Aqs2xmuJUKnlhHkXjxfr5ZI2uIhNzouO/QyXLd+7GsDfbQa1AMiIjH5AryCHmEezehQSbmwLGckdlxu9Vb3cjiGWyweuOY/owlMqXnFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdHtr7Vp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdHtr7Vp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68BCC4CED1;
	Wed,  5 Feb 2025 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738777454;
	bh=E6uwQ2kxNgc+rDx5CYdoWHlMu6FPslTzwxlYXYE8OVE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hdHtr7VpKAb4YcceLo24wgi5Psy///gcAnK41PD65wSLppwWZtUjy3gNvHuL6KwZ6
	 5Un90iLHp21qpTBPmBBzDqI+DBYCrHoJna8O7+CbxC9zoNOoVroFqTKtrtDWw8kK07
	 r1XF/CMb22qFg2x6IEFeNmr3fSV5OTq4hOHM8fBt2U2viBfbRqPHeadc77i5wV1g9S
	 SJytgsjkw11lEbxmBLG87sQuRJr97gWjl836FoYvgC9DAqkox4YK+0Rt2xbhjqkCuk
	 AigbR/koLkHn5+QjCOpD63pOJiVCnY8bArwxaeLPzjWFwTJR7hID9CznJduxP3p1W4
	 lrDIC+sbpZIjQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 42DFCCE0749; Wed,  5 Feb 2025 09:44:14 -0800 (PST)
Date: Wed, 5 Feb 2025 09:44:14 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, vschneid@redhat.com, leitao@debian.org
Subject: Re: [PATCH RFC context_tracking] Make RCU watch
 ct_kernel_exit_state() warning
Message-ID: <85c23bc1-d271-4c0b-98d4-b727edd48935@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <19bebbeb-db36-4801-bc3d-2c39989b6152@paulmck-laptop>
 <Z6OaKXsPuyl2hO0J@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6OaKXsPuyl2hO0J@localhost.localdomain>

On Wed, Feb 05, 2025 at 06:04:41PM +0100, Frederic Weisbecker wrote:
> Le Sat, Feb 01, 2025 at 10:44:02AM -0800, Paul E. McKenney a écrit :
> > The WARN_ON_ONCE() in ct_kernel_exit_state() follows the call to
> > ct_state_inc(), which means that RCU is not watching this WARN_ON_ONCE().
> > This can (and does) result in extraneous lockdep warnings when this
> > WARN_ON_ONCE() triggers.  These extraneous warnings are the opposite
> > of helpful.
> > 
> > Therefore, invert the WARN_ON_ONCE() condition and move it before the
> > call to ct_state_inc().  This does mean that the ct_state_inc() return
> > value can no longer be used in the WARN_ON_ONCE() condition, so discard
> > this return value and instead use a call to rcu_is_watching_curr_cpu().
> > This call is executed only in CONFIG_RCU_EQS_DEBUG=y kernels, so there
> > is no added overhead in production use.
> > 
> > Reported-by: Breno Leitao <leitao@debian.org>
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Frederic Weisbecker <frederic@kernel.org>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> 
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Thank you!  I will apply this on my next rebase.

							Thanx, Paul

> > diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> > index 938c48952d26..fb5be6e9b423 100644
> > --- a/kernel/context_tracking.c
> > +++ b/kernel/context_tracking.c
> > @@ -80,17 +80,16 @@ static __always_inline void rcu_task_trace_heavyweight_exit(void)
> >   */
> >  static noinstr void ct_kernel_exit_state(int offset)
> >  {
> > -	int seq;
> > -
> >  	/*
> >  	 * CPUs seeing atomic_add_return() must see prior RCU read-side
> >  	 * critical sections, and we also must force ordering with the
> >  	 * next idle sojourn.
> >  	 */
> >  	rcu_task_trace_heavyweight_enter();  // Before CT state update!
> > -	seq = ct_state_inc(offset);
> > -	// RCU is no longer watching.  Better be in extended quiescent state!
> > -	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && (seq & CT_RCU_WATCHING));
> > +	// RCU is still watching.  Better not be in extended quiescent state!
> > +	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !rcu_is_watching_curr_cpu());
> > +	(void)ct_state_inc(offset);
> > +	// RCU is no longer watching.
> >  }
> >  
> >  /*
