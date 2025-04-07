Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165101CB337;
	Mon,  7 Apr 2025 20:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744058798; cv=none; b=jsYU+dp38V6tbcWNU5S2Xrb1tWPvL1xkhbUhwfFqsou6AyhPSnYFcOqCGyZKJrZb47djKrUxKwCQW6Fk7XeKEl8I7lbHAxyY3dSl8cmscPep5rGyHe1YP/3pI0HB/Y2tXAtofNsXsitHMwZpUgJMzMCuRt4+t/w01QyD75NHkiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744058798; c=relaxed/simple;
	bh=iB9D5wE/9tCMm0C28EHmkJdL/Ho9v5VD5tSpttA5WsI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mLxkmKCAooLoFcKzOxzZ4TLgjAe7MvgVyncWMI5cyIqp6DqTNO7X8M3BACYfIpKAY/XfmaR24vj0KRkh3l12Sdv0ofD/npRHajREvB2wTCuNrv1/tZ7szDIh9X29F5wEh2dQwfMEWm5sPW21/hRdTxjdNlEBihUSo/94gSj9dag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7671092009C; Mon,  7 Apr 2025 22:46:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6F1B792009B;
	Mon,  7 Apr 2025 21:46:26 +0100 (BST)
Date: Mon, 7 Apr 2025 21:46:26 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Richard Henderson <richard.henderson@linaro.org>, 
    Ivan Kokshaysky <ink@unseen.parts>, Matt Turner <mattst88@gmail.com>, 
    Arnd Bergmann <arnd@arndb.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Magnus Lindholm <linmag7@gmail.com>, 
    "Paul E. McKenney" <paulmck@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
    linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data
 consistency
In-Reply-To: <alpine.DEB.2.21.2502202106200.65342@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2504072042350.29566@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk> <CAHk-=wgBZk1FFOyiTKLnz4jNe-eZtYsrztcYRRXZZxF8evk1Rw@mail.gmail.com> <alpine.DEB.2.21.2502202106200.65342@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Feb 2025, Maciej W. Rozycki wrote:

> > Again, I don't think we care, and it works in practice, but it does
> > mean that I *really* think that:
> > 
> >  (c) you should not handle the kernel case at all.
> > 
> > If the kernel does an unaligned ld_l/st_c, that's a fundamental kernel
> > bug. Don't emulate it. Particularly when the emulation fundamentally
> > is not truly atomic wrt other accesses.
> 
>  Good point actually, I think I mentally drove myself into a dead end 
> here.  Yes, absolutely, it is not expected to happen unless we have a bug 
> in our code somewhere!

 Well, I take it back.  I knew I had something in mind while writing this 
code, just couldn't remember at the time of the reply, and I now brought 
it back at a mental relief break: it's networking.

 It's been decades ago, but I kept in memory a discussion when Alpha still 
was a thing, up to remembering it was DaveM saying we chose to use aligned 
frame/packet header accesses for performance reasons even where we don't 
know beforehand whether a given piece of networking data will or will not 
be actually aligned, so as not to penalise the common aligned case.

 Here's one reference I could track down: "TCP SYNs broken in 2.3.41", 
<https://marc.info/?l=linux-kernel&m=94927689929463> (not present on lore; 
I have the original thread of discussion with complete e-mail headers in 
my personal archive though), likely the very one I remembered.

 So unless I'm proved otherwise (e.g. that all such code paths are now 
gone from networking, which may or may not be the case: I saw IPX go but I 
can see AppleTalk still around; or that no sub-longword accesses are ever 
used in the relevant networking paths), I'm going to keep kernel emulation 
in v2, because what just used to be wrapped in an unaligned LDQ/STQ pair, 
which we trapped on and emulated, will now become an LDQ_L/STQ_C loop.

 Do you happen to know what the situation is here?

 NB my network usage with my Alpha environment is virtually exclusively 
FDDI, and there the wrong alignment phenomena may or may not be present at 
all for the various networking protocols, owing to different link-layer 
framing (and including the Packet Request Header used by the Motorola FDDI 
chipset the way it does for the very purpose to keep things aligned).  I 
don't know offhand, my FDDI-fu is a bit dusty even in the areas I have 
already explored, and this is a new one; I've certainly not tried (to 
learn anything about) AppleTalk over FDDI (or indeed otherwise).

 All in all the lack of kernel unaligned traps in my setup and hence no 
recorded way to trigger them merely means I haven't used any of the stuff 
that used to cause them.

  Maciej
