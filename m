Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D0A21CC49
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009397; cv=none; b=Axq6CwDWId+z1spL8Z+5QQkzrRAMzir0xFQQhrYiji6f/cpsF/1ltUsRRFzTXU3o8I2ypewCimf/KxLdiBuouiytqG9+sU8AAgzNXownmdandKHDV2jfMjk9uNGFFXYBTAKpcFN9880/85ymB9BYHt1QXcno1i9zDr6nOaYb+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009397; c=relaxed/simple;
	bh=A2CiZ5p9ZwxSvzLtqzeCeZ9ots/HoctrE8Ce7wmHzZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLTiMY744CPfUa2ZeJrIFT3VA3hc8v9cP0rTlWlRhAaCARMHbCs0jfb+Vujg+paj2Qko5eZBg/awELtLHzyRfHN6ZbDEGCRAadlkOphH7otUBktXJuFzZeKjp71aKa7t6r9UkEPZZbs/tD7eYchQlqQW0PhWWGfBMXiPa/qNDSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55R7Tiot004686;
	Fri, 27 Jun 2025 09:29:44 +0200
Date: Fri, 27 Jun 2025 09:29:44 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH 3/3] tools/nolibc: add a new "install_all_archs"
 target
Message-ID: <20250627072944.GD4540@1wt.eu>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-4-w@1wt.eu>
 <92eda9ff-116e-4ec1-930c-7474da9652fc@t-8ch.de>
 <b14da196-84cc-4d13-baa2-952ba22f5a3e@app.fastmail.com>
 <89a2e713-edfd-4556-b321-cdccc3437a43@t-8ch.de>
 <20250627054618.GA4540@1wt.eu>
 <20250627054918.GB4540@1wt.eu>
 <cdf2ebbf-8bfe-40f8-a071-10d56221c202@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdf2ebbf-8bfe-40f8-a071-10d56221c202@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jun 27, 2025 at 09:27:10AM +0200, Thomas Weißschuh wrote:
> On 2025-06-27 07:49:18+0200, Willy Tarreau wrote:
> > On Fri, Jun 27, 2025 at 07:46:18AM +0200, Willy Tarreau wrote:
> > > On Fri, Jun 27, 2025 at 07:11:45AM +0200, Thomas Weißschuh wrote:
> > > > On 2025-06-26 23:15:07+0200, Arnd Bergmann wrote:
> > > (...)
> > > > With the symlink, a given generic UAPI tree can be specialized to one
> > > > specific architecture. But here we want to create a full sysroot that works
> > > > for all architectures *at the same time*. So a symlink would not be enough.
> > > 
> > > Exactly!
> > > 
> > > > > If it's indeed possible to concatenate the path name (I couldn't
> > > > > figure that out either), that could also be done in place of the
> > > > > symlink but simpler than the #if/#elif/#elif/... block, like
> > > > > 
> > > > > #include <arch.h> // defines ARCH_PREFIX
> > > > > #include CONCAT(ARCH_PREFIX, ioctl.h)
> > > > 
> > > > If we can't get it to work like this I would still prefer to have a
> > > > template header file which gets specialized with sed instead of the
> > > > Makefile loop.
> > > 
> > > The thing is that it's not a single header, it's for each header file
> > > present in asm/. And we can't request that anyone adding anything into
> > > asm would also have to maintain one extra template for each of them.
> > > 
> > > Or I'm simply not getting how you would envision it maybe.
> > 
> > Or do you mean a template that contains all #ifdef/#include for all
> > archs, that serves as the basis to rebuild all headers, and that we
> > still have the loop on all files in the makefile ? I.e. you simply
> > want to drop the arch loop ? If that's it, yes I'm fine with this as
> > well and can give it a try.
> 
> This is exactly what I meant.

OK then, I'll have a look to this and Arnd's idea, hopefully we'll
find something better than the current proposal.

willy
