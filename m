Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9061DF968
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004451; cv=none; b=Dulc+biTk2VXewGtN9u9ed+QizUhteU005DhDMyfKM/3Ag3QaAqZairuvE8QPxvptWyhKq03nWJxqqc7n6CmwxHcBG/ahQfj4POsgYJRu+pVYgYV9HWGht0GHjPY/393GbDNnIEd/klo4IqxULJU0ofuweLIbEcuLDdHw/oQhCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004451; c=relaxed/simple;
	bh=3CkPha7xWU+URwsyfS4QHEpZG7vBGPndNqdT009Sy1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tooY3bI05dN7+O3VWY+K9Oa71xVLVoQU5bPdZzS7g+xNE/+MnTNXUkCKhrE5t3xN1+y/icAXuqVwV7gWE8hdeuSMXnzjp1YFR+rbYJOB4+2eFOsXPJq2fu2VTblgqfTy3h9NGXHPh8Viy6QNZ3o4jwfC2oRLrmKXmGJvWOp8NYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55R67NkZ004568;
	Fri, 27 Jun 2025 08:07:23 +0200
Date: Fri, 27 Jun 2025 08:07:23 +0200
From: Willy Tarreau <w@1wt.eu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH 3/3] tools/nolibc: add a new "install_all_archs"
 target
Message-ID: <20250627060723.GC4540@1wt.eu>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-4-w@1wt.eu>
 <92eda9ff-116e-4ec1-930c-7474da9652fc@t-8ch.de>
 <b14da196-84cc-4d13-baa2-952ba22f5a3e@app.fastmail.com>
 <20250627032551.GA4224@1wt.eu>
 <50dc2d72-79be-45cc-add9-82c76099cfe1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50dc2d72-79be-45cc-add9-82c76099cfe1@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jun 27, 2025 at 07:58:58AM +0200, Arnd Bergmann wrote:
> On Fri, Jun 27, 2025, at 05:25, Willy Tarreau wrote:
> > On Thu, Jun 26, 2025 at 11:15:07PM +0200, Arnd Bergmann wrote:
> >> On Thu, Jun 26, 2025, at 22:18, Thomas Weißschuh wrote:
> 
> >> If it's indeed possible to concatenate the path name (I couldn't
> >> figure that out either), that could also be done in place of the
> >> symlink but simpler than the #if/#elif/#elif/... block, like
> >> 
> >> #include <arch.h> // defines ARCH_PREFIX
> >> #include CONCAT(ARCH_PREFIX, ioctl.h)
> >
> > I have never found how it would be possible to do that, let alone in a
> > more or less portable way, because #include doesn't take a C-string in
> > argument but a special syntax which is specific to it ("x" or <x>). It
> > doesn't support concatenating strings for example:
> >
> >   #include "stdio"".h"
> >
> >   $ gcc -E inc.h
> >   inc.h:1:17: warning: extra tokens at end of #include directive
> >       1 | #include "stdio"".h"
> >         |                 ^~~~
> >   inc.h:1:10: fatal error: stdio: No such file or directory
> >       1 | #include "stdio"".h"
> >         |          ^~~~~~~
> 
> This variant does seem to work with gcc and clang:
> 
> #define ARCH i386
> #define __ARCH_HEADER(a, b) <a ## _ ## b>
> #define _ARCH_HEADER(a, b) __ARCH_HEADER(a, b)
> #include _ARCH_HEADER(ARCH, stdio.h)
> 
> Or even simpler
> 
> #define _NOLIBC_ARCH_HEADER(file) <i386_ ## file>
> 
> The ## concatenation is a bit limited here since cpp requires
> both sides to expand to an identifier, meaning you can have
> a '_' next to it, but not a '/' or '-'.

Thanks Arnd, will give it a try this week-end.

Willy
