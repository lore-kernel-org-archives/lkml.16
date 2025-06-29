Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B491E1E521D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751187224; cv=none; b=KECXR1p7onjiPsr7o8a9sLqbRE9VaTjFd0QNJt8e/zs7ARX/gEk1Z+sZsIl/Lo2/97oqdnq677wRjKRlypu36BlBOTmPNykgmw5coqeRfPfvZ15SB7oNHGL5YDMorA4Ac2WStt3qrQs+cXgufO5DT0K+djdB2j2jsLNsuR6dcp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751187224; c=relaxed/simple;
	bh=ww3g+Oxw+MaFQjQEv4EwL+pZtVT3lNMUJGi7DPhSD/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAsllw5ckSkqMewCmO3p0HK+IkGB7/MvNBReZA2YFbbJFO3rMum3YYgE2v7t2w5/y9+sFXm4oMwInk5wjmIa0jepiCarBqCzRUxszYaRn40hWavifA36jILiKbuUsnr+FDC9t6vh2QdlDT0g8Gj5IPNZXm9FhdjKc4tWLtWFP9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TI7SpB7c; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TI7SpB7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751187215;
	bh=ww3g+Oxw+MaFQjQEv4EwL+pZtVT3lNMUJGi7DPhSD/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TI7SpB7ckZQdPSF1tWKq0DaNoduGJNTMJG28b1Uu9ZbPcn9gyn0H2C0A7SXA14B6S
	 3gBSLeXwWeDFqcBDlwIRPKtKIPYcsBkR1ENqclvPiq6lCHAmMbrtWEo5WSL/1ysBnf
	 YZs1M0lH+DKn9riARundoU5HZF9YR2r067+AMe0g=
Date: Sun, 29 Jun 2025 10:53:34 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-4-w@1wt.eu>
 <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
 <20250622071958.GA3384@1wt.eu>
 <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
 <20250623025618.GA29015@1wt.eu>
 <20250629084628.GA7992@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629084628.GA7992@1wt.eu>

On 2025-06-29 10:46:28+0200, Willy Tarreau wrote:
> On Mon, Jun 23, 2025 at 04:56:18AM +0200, Willy Tarreau wrote:
> > On Sun, Jun 22, 2025 at 09:58:52PM +0200, Thomas Weißschuh wrote:
> > > On 2025-06-22 09:19:58+0200, Willy Tarreau wrote:
> > > > Hi Thomas,
> > > > 
> > > > On Sat, Jun 21, 2025 at 10:21:47AM +0200, Thomas Weißschuh wrote:
> > > > > On 2025-06-20 12:02:50+0200, Willy Tarreau wrote:
> > > > > > Modern programs tend to include sys/select.h to get FD_SET() and
> > > > > > FD_CLR() definitions as well as struct fd_set, but in our case it
> > > > > > didn't exist. Let's move these definitions from types.h to sys/select.h
> > > > > > to help port existing programs.
> > > > > > 
> > > > > > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > > > > 
> > > > > <snip>
> > > > > 
> > > > > > diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> > > > > > index 16c6e9ec9451f..0b51ede4e0a9c 100644
> > > > > > --- a/tools/include/nolibc/types.h
> > > > > > +++ b/tools/include/nolibc/types.h
> > > > > > @@ -10,6 +10,7 @@
> > > > > >  #ifndef _NOLIBC_TYPES_H
> > > > > >  #define _NOLIBC_TYPES_H
> > > > > >  
> > > > > > +#include "sys/select.h"
> > > > > 
> > > > > Is this really necessary?
> > > > 
> > > > Not sure what you mean. Do you mean that you would have preferred it
> > > > to be included from nolibc.h instead (which I'm equally fine with) or
> > > > that you'd prefer to have an empty sys/select.h ?
> > > 
> > > The former.
> > 
> > OK thanks, you're right, that's more consistent with the rest,
> > I'll do that and push it.
> 
> Trying it has reopened the circular dependencies can of worms :-(
> It's the same problem as usual that we've worked around till now
> by placing some types in types.h, except that this time fd_set is
> defined based on the macros FD_* that I moved to sys/select.h.

Can't fd_set also move to sys/select.h? This is how I read fd_set(3).
Even if it is not standards compliant, for nolibc it won't matter as in
the end everything is available anyaways.

> I'm giving up on this one for now as I don't want us to revisit
> that painful dependencies sequence. In theory it should be as simple
> as guarding types and function definitions independently, but in
> reality it's never as rocket science as it can also pop up in macros
> and rare typedefs.

Also the headers are always included in the order written down in
nolibc.h, so sys/select could be above types.h there.

> Instead I'll just provide a stub for sys/select.h just like for
> inttypes so that user code compiles without changing existing files.

That works for me, too.
