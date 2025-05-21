Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89764143C69
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839984; cv=none; b=iFmSLRhTlDXZiLXf1d+IzG6+aVYls5QF9Y2/U4VFG2FXrWH31pBkDPvhaUAvid3zQz8dCyYn2Ra12c/q1jNMLjyQ2Z7oRa4qBCBbXzaFdVfZgfQEtRp6F4w7qfnYRJj+4i5jBE5NfzUp0yNBxr0jw7dHFPxmtlI7VPEJ4uKuf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839984; c=relaxed/simple;
	bh=rGXcnoZpVSuS2ShN8BMqK/q3oENti/BbAzaKdrf+o1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upU1pO64sEeJ0fboO1i3FxNj8rG2mY7B4+1N+1AflwggbL/VpZv9RCIf5dk/yJi/h7h1VWbtu+8PlW9hNn75D1kT4GTEoslcciU9p3I3OrhaCE9hay355C47n2dQRGSku5tNQeTetmm3dYud4CwrxGeRJPOZ9FGwgKyrDPxHp3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaYXP2+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaYXP2+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC820C4CEE4;
	Wed, 21 May 2025 15:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747839984;
	bh=rGXcnoZpVSuS2ShN8BMqK/q3oENti/BbAzaKdrf+o1c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=BaYXP2+B7pvOSPDtpEMBU3Q/5W7exzbc4xBO68gGPOlxyfT1PhpTPHuFSVBs7kYH7
	 sP5RVdjHaDC8LNvrumrfvG3YwQaBwRdaKs3dLHlayIJmUgBUPe10Gq9SE4CotB+8kr
	 41qy1O+hrMkz4P0M3UnvPA4hpifH1FV3JKgZNmWh7bhv/5Ev/0ckr2mNts5QbdwPxK
	 SYO8NnP1L2cS/nmgflfGIkCgpNV0uI4XU5Cvx7hCTUgyCAZQ6u5G/8shEIij54DjCM
	 H/irSymF7p1ZesVs5NFiyblyAHIlNUe8e0pO3n1Z+8cvsADIXDUCz1Aq4WActnf2lR
	 vEwbUf5+7R66g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 911E7CE083F; Wed, 21 May 2025 08:06:23 -0700 (PDT)
Date: Wed, 21 May 2025 08:06:23 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: John Ogness <john.ogness@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>
Subject: Re: printk NMI splat on boot
Message-ID: <734c6c65-b9f4-40a9-b6a8-abcb08ee83f5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a93e1a96-3685-41c3-8979-472b20dfca14@kernel.dk>
 <84a577t590.fsf@jogness.linutronix.de>
 <c99232fa-e861-48ec-8438-028e61d3b744@kernel.dk>
 <36ccb46d-5041-47ce-b419-f49ccaeece9b@kernel.dk>
 <fe455126-7b33-4246-b626-44ef33013765@paulmck-laptop>
 <0779b400-b99e-4fa2-8b18-de06fb4e77cc@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0779b400-b99e-4fa2-8b18-de06fb4e77cc@kernel.dk>

On Wed, May 21, 2025 at 07:05:09AM -0600, Jens Axboe wrote:
> On 5/21/25 12:06 AM, Paul E. McKenney wrote:
> > On Tue, May 20, 2025 at 02:41:40PM -0600, Jens Axboe wrote:
> >> On 5/20/25 2:18 PM, Jens Axboe wrote:
> >>>> What values are you using for CONFIG_RCU_EXP_CPU_STALL_TIMEOUT and
> >>>> CONFIG_RCU_CPU_STALL_TIMEOUT?
> >>>
> >>> CONFIG_RCU_CPU_STALL_TIMEOUT=21
> >>> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=2
> >>
> >> This was =20 btw, guess it could cut a bit too much...
> > 
> > Just confirming that setting CONFIG_RCU_EXP_CPU_STALL_TIMEOUT to two
> > milliseconds is more than a bit on the aggressive side.  ;-)
> 
> Sorry guess I wasn't clear - I had pasted in =2, but the setting in my
> config was =20.

Ah, got it!  Less aggressive, but not recommended for other than small
devices, such as Android smartphones.

> > Setting it to 20 milliseconds is OK for smartphone-class devices, but
> > to the best of my knowledge, setting it less than 21 seconds (as in
> > 21,000 milliseconds) has not been tested on any other platform.
> > 
> >> Changed them to:
> >>
> >> CONFIG_RCU_CPU_STALL_TIMEOUT=100
> >> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
> >>
> >> and complaining is gone.
> > 
> > This makes it take the default, which in this case would be the specified
> > CONFIG_RCU_CPU_STALL_TIMEOUT value of 100 seconds.  Which is an unusually
> > long timeout -- mainline these days is 21 seconds and some distros still
> > use the old value of 60 seconds.
> 
> IMHO the settings for these are very odd. Which I guess is fine for
> debugging kind of infrastructure, but fairly nonsensical in any case.
> But not really that important - looks like RCU_EXP_CPU_STALL_TIMEOUT has
> a default of '0' so not sure how on earth I ended up with 20 in that
> one. Most likely from not reading the help entry and hence setting it
> similarly to RCU_CPU_STALL_TIMEOUT.

Agreed, it would be better if both had the same units.  But back 20 years
ago, milliseconds would have seemed insane for RCU_CPU_STALL_TIMEOUT,
in fact, many would have argued that the current setting of "only"
21 seconds would be insane.  And then a few years ago, people really
needed milliseconds for RCU_EXP_CPU_STALL_TIMEOUT, so here we are...

Me, I should have seen it coming.  After all, the equivalent to
RCU_CPU_STALL_TIMEOUT in DYNIX/ptx was 1.5 seconds.  But, again, here
we are...

							Thanx, Paul
