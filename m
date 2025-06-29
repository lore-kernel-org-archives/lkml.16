Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E46288D6
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751189157; cv=none; b=goPSSbKIRdN792hoWIF83yebBBEN7aTr8WIjbNvS+2FbGHTPIuQC47nBVnLQJ7rksPNx5cnb249XGU53SOQO7WZ4Xq7UU0v6VhrBs4BTmL9F1VMMaVBbqH5crw1RaOo/3Il1J/GD8/N8CvZYRTTVb7DHQ6LUFcmbCrzn1dDqQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751189157; c=relaxed/simple;
	bh=1kNCLJZ/ciaTGIgINK/ugaISwGJxLPu20X1bipBxqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSq30I+Yq4PXiPEpaYU8q3nyfkdfoS6Fve5xlz/Wu+1kew9G+dqfJ7rNiQWtXkd8Xz/5ND0PCloCwfDMpyRxj28LevbGjkKD0r9x+M9pO2hPpvwom+aENshYrsyD2nHob5JMDuWPkwAJl4F9VAUwOCfbc3BCleBqpAmDwNQI3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55T9Pq8p019295;
	Sun, 29 Jun 2025 11:25:52 +0200
Date: Sun, 29 Jun 2025 11:25:52 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <20250629092552.GA30947@1wt.eu>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-4-w@1wt.eu>
 <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
 <20250622071958.GA3384@1wt.eu>
 <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
 <20250623025618.GA29015@1wt.eu>
 <20250629084628.GA7992@1wt.eu>
 <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jun 29, 2025 at 10:53:34AM +0200, Thomas Weißschuh wrote:
> On 2025-06-29 10:46:28+0200, Willy Tarreau wrote:
> > On Mon, Jun 23, 2025 at 04:56:18AM +0200, Willy Tarreau wrote:
> > > On Sun, Jun 22, 2025 at 09:58:52PM +0200, Thomas Weißschuh wrote:
> > > > On 2025-06-22 09:19:58+0200, Willy Tarreau wrote:
> > > > > Hi Thomas,
> > > > > 
> > > > > On Sat, Jun 21, 2025 at 10:21:47AM +0200, Thomas Weißschuh wrote:
> > > > > > On 2025-06-20 12:02:50+0200, Willy Tarreau wrote:
> > > > > > > Modern programs tend to include sys/select.h to get FD_SET() and
> > > > > > > FD_CLR() definitions as well as struct fd_set, but in our case it
> > > > > > > didn't exist. Let's move these definitions from types.h to sys/select.h
> > > > > > > to help port existing programs.
> > > > > > > 
> > > > > > > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > > > > > 
> > > > > > <snip>
> > > > > > 
> > > > > > > diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> > > > > > > index 16c6e9ec9451f..0b51ede4e0a9c 100644
> > > > > > > --- a/tools/include/nolibc/types.h
> > > > > > > +++ b/tools/include/nolibc/types.h
> > > > > > > @@ -10,6 +10,7 @@
> > > > > > >  #ifndef _NOLIBC_TYPES_H
> > > > > > >  #define _NOLIBC_TYPES_H
> > > > > > >  
> > > > > > > +#include "sys/select.h"
> > > > > > 
> > > > > > Is this really necessary?
> > > > > 
> > > > > Not sure what you mean. Do you mean that you would have preferred it
> > > > > to be included from nolibc.h instead (which I'm equally fine with) or
> > > > > that you'd prefer to have an empty sys/select.h ?
> > > > 
> > > > The former.
> > > 
> > > OK thanks, you're right, that's more consistent with the rest,
> > > I'll do that and push it.
> > 
> > Trying it has reopened the circular dependencies can of worms :-(
> > It's the same problem as usual that we've worked around till now
> > by placing some types in types.h, except that this time fd_set is
> > defined based on the macros FD_* that I moved to sys/select.h.
> 
> Can't fd_set also move to sys/select.h? This is how I read fd_set(3).

That was what I did and precisely what was causing the problem. We
have sys.h defining select() with fd_set in it with sys/select not yet
being included. I moved sys.h after all sys/* and it broke something
else instead.

> Even if it is not standards compliant, for nolibc it won't matter as in
> the end everything is available anyaways.

Yeah I totally agree with you on that!

> > I'm giving up on this one for now as I don't want us to revisit
> > that painful dependencies sequence. In theory it should be as simple
> > as guarding types and function definitions independently, but in
> > reality it's never as rocket science as it can also pop up in macros
> > and rare typedefs.
> 
> Also the headers are always included in the order written down in
> nolibc.h, so sys/select could be above types.h there.

In an ideal world we'd have all sys/* *before* anything else. But I
do remember that we faced a few issues doing this. This can be refined
though. I'm just careful because we have not been annoyed in a while,
so I suspect we're close to something good and it's easy to cause more
breakage than fixes by touching all of this.

> > Instead I'll just provide a stub for sys/select.h just like for
> > inttypes so that user code compiles without changing existing files.
> 
> That works for me, too.

That's what I did in the end. We're just addressing annoying build
issues and not providing new stuff that deserves a full reorganization!

Cheers,
Willy
