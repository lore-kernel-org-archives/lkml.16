Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9F6DF49
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745438080; cv=none; b=eJXYA/lRl1ZUJWOOr45IdRhPrsvl1UNuWublZNNswei6CTB68S60NPDOuOGe8Ql/dSTfPpFH52w+I/6BHcTXNS2Gdx4phYcIOnoRt2S4khetDLIALuTVxIC7ycOSRkPj3Js1GNLmCj6QYwfzLZ1EZEI+vIqdwIldHbEFHO3932Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745438080; c=relaxed/simple;
	bh=7wjM1H+MUY1clmde2I4sUwbkRdmCSUfGbIWJfKN5aWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNOh3LMlvhgCKCcGXt5jGmRZ0/ryQFsBU3qxdlWbPo8dxNiwzemOUtXMFobKyEupb6SAe144fQM+EAxG1L0MkM8l9NUQ8nFSiy3dIee6TjcqjfU8liM0/ni/8TBumWDDjgVEaEProfLF2ktvqDovg2B8ktu9udaH16vvYmcrnkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhr7dI6X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhr7dI6X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29536C4CEE2;
	Wed, 23 Apr 2025 19:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745438080;
	bh=7wjM1H+MUY1clmde2I4sUwbkRdmCSUfGbIWJfKN5aWI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=mhr7dI6Xew0XbZkQxWHHpNG8ByCNU4f/jJuOQAye8n355wuOn/drmF2a5EFKRofn6
	 Wzmaxpd/6dLjbAVODYum+OStoSS66DWoQvtOV0BJ7AtkuTGZxLbrFo2esvSxNcDbDw
	 xaefmwn4w/8n5MkNqPetQG6/maxWMVqZEQF61kx54c246A3tdZ7RDgcM5nkA3kGT1n
	 lgrO6/5lI5QSARApkId4o5ImM3Ws1djCki/K4ypgytuqcHM5wvw7FoLUzSnhXCxXga
	 MaTpyChoFPWFAwCoRlEEYULpPZKXhxPIsbKWM6BqcNbMbaMKGncqi3zDky++48lXUl
	 kv7xR3IV7MjoQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D252CCE0B75; Wed, 23 Apr 2025 12:54:39 -0700 (PDT)
Date: Wed, 23 Apr 2025 12:54:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Aishwarya.TCV@arm.com, sraithal@amd.com
Subject: Re: [PATCH v2 ratelimit 11/14] ratelimit: Force re-initialization
 when rate-limiting re-enabled
Message-ID: <fbcffae4-8d88-4bc8-8791-12713f0dc8c1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <20250418171359.1187719-11-paulmck@kernel.org>
 <257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk>
 <559db775-f151-4694-86e6-72809b386097@paulmck-laptop>
 <98e5ab65-7601-452e-9ebc-bb3a7426313e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98e5ab65-7601-452e-9ebc-bb3a7426313e@sirena.org.uk>

On Wed, Apr 23, 2025 at 07:59:11PM +0100, Mark Brown wrote:
> On Wed, Apr 23, 2025 at 11:20:59AM -0700, Paul E. McKenney wrote:
> > On Wed, Apr 23, 2025 at 04:59:49PM +0100, Mark Brown wrote:
> 
> > They reported that the replacing the offending commit with the following
> > patch fixed things up:
> 
> >  
> > -	if (!interval || !burst)
> > +	if (interval <= 0 || burst <= 0)
> >  		return 1;
> >  
> 
> That fixes things, yes.
> 
> > If that fixes things for you, could you also please try the following,
> > also replacing that same commit?
> 
> >  
> > -	if (!interval || !burst)
> > +	if (interval <= 0 || burst <= 0) {
> > +		ret = burst > 0;
> >  		return 1;
> > +	}
> 
> Are you sure about that - the value set for ret will be ignored, we
> still return 1 regardless of the value of burst as for the first patch
> AFAICT?  I tried instead:
> 
> +	if (interval <= 0 || burst <= 0) {
> +		return burst > 0;
> +	}
> 
> which failed.

Thank you (and Bert) very much for testing this!

You are of course quite right.  But my previous patch above, the one
that just returned 1 if either interval or burst was non-positive,
was also wrong.

Before that patch, if both burst and interval were negative, rate limiting
would be imposed unconditionally.  With that patch, if if both burst and
interval were negative, rate limiting would never happen, which might
come as a nasty surprise to someone setting burst to zero in order to
unconditionally suppress output.

To preserve necessary portions of the old semantics, I believe that we
need something like this:


	interval:	<0	=0	>0

burst:
	<0		RL	!RL	RL

	=0		RL	!RL	RL

	>0		!RL	!RL	?RL


Here, "RL" says to always do rate-limiting, "!RL" says to never do
rate-limiting, and "?RL" says to let the atomic decrement decide.

The idea is that if interval is =0, rate-limiting never happens.  But if
interval <0, then burst has full control, so that burst <=0 always
rate-limits and burst >0 never rate-limits.  Finally, if interval >0,
burst again has full control, but while burst <=0 always rate-limits,
burst >0 lets the atomic decrement decide.

Except that in the "?RL" case, the "if" condition directs execution
elsewhere anyway, so I believe that the "interval == 0 || burst > 0"
condition in my updated patch (see below) fixes things.

Could you please try the patch shown below?  I might actually have
it right this time.  ;-)

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 04f16b8e24575..d6531e5c6ec4e 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,8 +35,8 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
-	if (!interval || !burst)
-		return 1;
+	if (interval <= 0 || burst <= 0)
+		return interval == 0 || burst > 0;
 
 	/*
 	 * If we contend on this state's lock then just check if
