Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6D25F781;
	Mon, 12 May 2025 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050636; cv=none; b=kDy2ZIrBNcRP2qWDIbKffOKDw29j3E3YGmZyWSXBrUgNC1xbpMo6u7oa1BigBoKHmo20deVI5BdIbvYGtdUhTousyga1oFQe+fSDzUX68Te6F5pmCaZeJzJpCN2k/0HuVNVPwJJwNGIQOWBMfGTmc+9qd9pZasn7R0Du17dt6WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050636; c=relaxed/simple;
	bh=JN5peLSh0AwCANNu9zwVzWJjdSn1bSj6lqHMZVB9QYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6+AzK0JHxa29i9FSlAGkD/EfEYmcpH8qaKoPeqUlfAir4wzzLLOkKAC3L7VM3z2aLoi7m2yzDtabYhPaQHujhcAouAn6kfKdRaakeByxgIxg+asFrF2UkFL43oEGFW5iVEVf+6BIcDuD9yTcDb+tnEg3dFPdzSOEBCzL+8GD6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=F4VyUJ+J; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="F4VyUJ+J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=gTYrY24hx52txmsL9HPT3mdHpmxzXrMYsHxWBh70XWQ=; b=F4VyUJ+JTCQfCaNu
	4hX0qz3EorbaU4dbcAt4m9Qht58mZ45609zPcz1ZA9duLHlMG55Vv+BU8SSWHbIUNdVyvD3kAgbtK
	frC9vcbmjKAX8jrZl3eMaX2qNNNmiWBWlgviDHpAX9ey0vlR9GLDfy+qbmTVDRJDIHX/zzmMCgy/0
	kp9BoH+GJ4zF0dIPOUI0rl7SoLNeClUhjMvddrxT5BwYReUP1J2hz90v5O6BtKPsLiFPqHYRD3flA
	tkkjbStGpR+9Hr1xxadHBbY6K7BL3wFasKDlsha6h++2s0dbZ8vFTBqcHgdl5r/C6w4MsJoi5Ni5y
	/pz9rIWnIJZraOvH7g==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uERfs-0031El-2o;
	Mon, 12 May 2025 11:50:24 +0000
Date: Mon, 12 May 2025 11:50:24 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	andriy.shevchenko@linux.intel.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	viro@zeniv.linux.org.uk, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
Message-ID: <aCHggEc3MdlL6t7j@gallifrey>
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCFPRhfxKUeRu1Qh@gallifrey>
 <CAL+tcoBKZ4FMk9ozFidWUgfrEyRBrHCsh4cMMbTOA_e-wn0UJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL+tcoBKZ4FMk9ozFidWUgfrEyRBrHCsh4cMMbTOA_e-wn0UJQ@mail.gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 11:25:31 up 14 days, 19:39,  1 user,  load average: 0.09, 0.03, 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Jason Xing (kerneljasonxing@gmail.com) wrote:
> On Mon, May 12, 2025 at 9:30 AM Dr. David Alan Gilbert
> <linux@treblig.org> wrote:
> >
> > * Jason Xing (kerneljasonxing@gmail.com) wrote:
> > > Hi All,
> >
> > Hi Jason,
> >
> > > I noticed this patch "relay: Remove unused relay_late_setup_files"
> > > appears in the mm branch already[1], which I totally missed. Sorry for
> > > joining the party late.
> > >
> > > I have a different opinion on this. For me, I'm very cautious about
> > > what those so-called legacy interfaces are and how they can work in
> > > different cases and what the use case might be... There are still a
> > > small number of out-of-tree users like me heavily relying on relayfs
> > > mechanism. So my humble opinion is that if you want to remove
> > > so-called dead code, probably clearly state why it cannot be used
> > > anymore in the future.
> >
> > We've got lots of deadcode, why it's dead varies a lot; for example
> > people forgetting to clean it up after other patches etc - so this
> > _could_ be used but hasn't been for well over 7 years.
> >
> > > Dr. David, I appreciate your patch, but please do not simply do the
> > > random cleanup work __here__. If you take a deep look at the relayfs,
> > > you may find there are other interfaces/functions no one uses in the
> > > kernel tree.
> >
> > Actually, that was the only interface in relay that I found unused.
> 
> Not really. More than this single one, say, __relay_write() and
> subbuf_start_reserve()...

Ah, my tools only spot unused symbols, they're header inlines; I've
not found a way to spot those yet.

> > > I'm now checking this kind of patch in relayfs one by one to avoid
> > > such a thing happening. I'm trying to maintain it as much as possible
> > > since we internally use it in the networking area to output useful
> > > information in the hot paths, a little bit like blktrace. BTW, relayfs
> > > is really a wonderful one that helps kernel modules communicate with
> > > userspace very efficiently. I'm trying to revive it if I can.
> >
> > If you've got a use for that function, then I'm more than happy to suggest
> > just dropping my patch.
> >
> > However, it is a fairly chunky function that is built into distro
> > kernels - so I think it should have a little thought put to it.
> >
> > As I say, if you are using it, it's fine by me just to drop this patch.
> 
> For now, I'm not using it but still considering what the use case
> might be in the future. As I mentioned earlier, I'm trying to make
> relayfs more robust with more realistic functions.
> 
> IMHO, it's not really a dead code to me unless you can clarify why
> it's obsolete instead of claiming "no one is using it".

i'm very gentle about this; I'm not pushing back hard if someone
says actually they want to keep something.

I'd say my 'claim' is fairly good as even you say
  'I'm not using it but still considering..'

You don't need to push back quite as hard on me!

> If you insist
> on the point, then most of relayfs would be removed, which is
> apparently not what I'm wishing for.

You could forgive me for thinking this is unused;
  a) There are no callers in the tree - I can't possibly imagine all
   other trees to check; especially those on someones local disk
   or thoughts still bouncing around in your brain!

  b) There's no listed maintainer, so I can't assume anyone is actively
  working on it

  c) The only changes in years in the tree are cleanups, like strcpy
  variants.

We do have other APIs that people care about and aren't in use;
now if those are nicely thought out APIs etc I think that's fine.
(I've had others say they want to keep some because they like them or
they're part of a well thought out API)

> Probably it will be finally removed, but not at the moment. Evidence
> is still not clear to me :S
> 
> For sure, the last call would be made by Andrew and Jens. Please help
> review this patch one more time. Thanks!

Why don't you add a MAINTAINERS section with you added just as a 
reviewer?   That at least gets you told if someone dares to clean it up
in the future!

Dave

> Thanks,
> Jason
> 
> >
> > Dave
> >
> > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-everything&id=46aa76118ee365c25911806e34d28fc2aa5ef997
> > >
> > > Thanks,
> > > Jason
> > --
> >  -----Open up your eyes, open up your mind, open up your code -------
> > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> > \        dave @ treblig.org |                               | In Hex /
> >  \ _________________________|_____ http://www.treblig.org   |_______/
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
