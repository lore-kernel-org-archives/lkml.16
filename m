Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F70244670
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952727; cv=none; b=dJG+4Q+To2B8x8EEzh+4sNaCvKO5wnOVY5wAvUHmebRIAszNUH6TC9BJVFPqWgDOp5+vDRy9ELp58Ne1+c78HZJCfWCDnBs7AGwhJnObwB26mOLbnJddXMtuKmAWXjSMe3nZIie925g4YNyJ1tNZYM3MFCYSL+1olkDmpdyV7mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952727; c=relaxed/simple;
	bh=GAS0aYhnCMQLgtXpMhbOSOKqoNQ3bj2q+babqBOzsx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkjgbeFHBL5znk5HpeonN1hV8C/fJmHqJsM4xBUbw9e9ioBTDh7w5TUmdq3g80lYtWqKjzZ8k1FqNQ4i9krtZwmRU8l5hczapocusf17vcNeJbqHh1ExwJGpOv3zLd+gzxwlieSI+mUuDUy4L2WZxWU7Ti4MnkLsaufI1eAEguA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jP2Mh1/u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jP2Mh1/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F85C4CEE3;
	Tue, 29 Apr 2025 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745952725;
	bh=GAS0aYhnCMQLgtXpMhbOSOKqoNQ3bj2q+babqBOzsx8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=jP2Mh1/uP6RIpO+MkshbnadFuIw+6CFZz5Xi/GAgpzYPcX7gYr/NgF2yXB8Jc9JBM
	 rDFfHxHEHpgbfaSGu8LvZnpI+P0UhiMbph4e8iBkJrD5II3smBQT1bfcmTEQlh8hRe
	 mJ6MihMQBIsMgkv/c+8TGs5xxM2uz94mpXvyyFN1WX2leRsZ1lyHsslvfGE7g9vwr0
	 R8Q54HtjKnre2tlN+32kZXTHvRhrrKMAAK3naGTcUUGnUm5oIig7woojJY0eV274+y
	 Ta1ygNJtxbtSHqRVBhFTX/b1oY/K7YgI3UXf1bfXMcPJx6octifsMzroE1FKtYgU49
	 5ZwzerCHU2/IQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6E97ACE091E; Tue, 29 Apr 2025 11:52:04 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:52:04 -0700
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
Subject: Re: [PATCH v3 15/20] ratelimit: Warn if ->interval or ->burst are
 negative
Message-ID: <1cc77290-ec8d-4c51-85c6-4f0bbcaaa8b4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-15-paulmck@kernel.org>
 <aBDEtcmUEhiL5-zO@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBDEtcmUEhiL5-zO@pathway.suse.cz>

On Tue, Apr 29, 2025 at 02:23:17PM +0200, Petr Mladek wrote:
> On Thu 2025-04-24 17:28:21, Paul E. McKenney wrote:
> > From: Petr Mladek <pmladek@suse.com>
> > 
> > Currently, ___ratelimit() treats a negative ->interval or ->burst as
> > if it was zero, but this is an accident of the current implementation.
> > Therefore, splat in this case, which might have the benefit of detecting
> > use of uninitialized ratelimit_state structures on the one hand or easing
> > addition of new features on the other.
> > 
> > Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> > Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> > Signed-off-by: Petr Mladek <pmladek@suse.com>
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> > Cc: Mateusz Guzik <mjguzik@gmail.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: John Ogness <john.ogness@linutronix.de>
> > Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  lib/ratelimit.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index 4f5d8fb6919f7..63efb1191d71a 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -40,6 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
> >  	 * says always limit.
> >  	 */
> >  	if (interval <= 0 || burst <= 0) {
> > +		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
> 
> Just for record, I agree with having this patch in this form
> in this series.
> 
> That said, I think that we should warn even about using zero
> initialized structure in the long term because of a possible use of
> to-be-initialized spin lock. But it would require fixing
> existing users and it is beyond scope of this patchset.
> It is related to the discussion at
> https://lore.kernel.org/r/aA-f0jpBBbdfsmn7@pathway.suse.cz .

Agreed, it would be good to get to a more principled destination.

In contrast, this series is what I can come up with that deals with the
current ratelimit clients without too much violence to the current code
base, but we can clearly do better longer term.

And thank you for the Reviewed-by on the other patches!  I will apply
these later today, Pacific Time.

							Thanx, Paul
