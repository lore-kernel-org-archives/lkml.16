Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A85B10E5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750647699; cv=none; b=DGE7dI4tumXHfMOKkC4/f4hyb6kxsqWQh//fXzl1gDJ9R5rxIXRT1R8cJS/2GxKziAfC1cjbhLQU/7c5VNn2qRiLMxFB8DFnc913vPsDF8Owzm82PWwpOG6w6RWjRMKN65kPGx/+T0DOhAr/Iqxv2VD53gB8DaNe2hkirOzrdHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750647699; c=relaxed/simple;
	bh=hYCDlhKG35jItz7af2mx45v3fX9KOplZoHbmerHT9Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRDQPhtA9vVdgUPj/PkimxADz1Mf8A2yanDpq2nJN8A5L1SWfKIeFBcqV5kdHIJTvLEHXBBapvFJPazrEQQ/vpAros7auxZLBwq6Drs9PK1b2/Hb1hclSbW1Rjh67BS9MEZmYbykuaFie03Q3N7UJIZpq2/x95swh+v/spdRWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55N31Wug029033;
	Mon, 23 Jun 2025 05:01:32 +0200
Date: Mon, 23 Jun 2025 05:01:32 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] tools/nolibc: add missing memchr() to string.h
Message-ID: <20250623030132.GB29015@1wt.eu>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-5-w@1wt.eu>
 <d7b81639-c53c-4186-9e30-04137576a1f1@t-8ch.de>
 <20250621084234.GA26934@1wt.eu>
 <50d5308c-8969-4cad-9b5e-ab7f86918c1c@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50d5308c-8969-4cad-9b5e-ab7f86918c1c@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jun 22, 2025 at 09:56:35PM +0200, Thomas Weißschuh wrote:
(...)
> > > > +#ifndef NOLIBC_ARCH_HAS_MEMCHR
> > > 
> > > So far we only have added these guards when necessary,
> > > which they aren't here. Can we drop them?
> > 
> > I intentionally placed them so that we can easily override them,
> > as we did for the other ones on x86 where string operations are
> > super short (repnz scasb is two bytes once you have the registers
> > already loaded).
> 
> Okay.
> 
> We do have different override mechanisms.
> Both NOLIBC_ARCH_HAS_* and for example the mechanism for sys_fork.
> Not sure if it is worth aligning them.

I don't know either, because we're speaking about doing it with standard
name functions (e.g. memchr), contrary to sys_* that we're bringing with
nolibc. I think it requires a bit more thinking to be sure we're not going
to cause trouble (e.g. with compiler builtin ones etc). At least whatever
the outcome, I agree that trying to align all definitions using the same
approach would be desirable, even if it means changing all of them.

> > > > +static __attribute__((unused))
> > > > +void *memchr(const void *s, int c, size_t len)
> > > > +{
> > > > +	char *p = (char *)s;
> > > 
> > > The docs say that they are interpreted as "unsigned char".
> > 
> > It does not change anything here, except adding an extra
> > modifier (since we'll then also have to do it in the loop
> > when comparing against c), thus IMHO it's extra noise.
> 
> Fair enough.
> 
> > > Also, can we keep the const?
> > 
> > It's memchr()'s definition which requires to return a void* so the
> > const needs to be dropped somewhere. Here I found visually cleaner to
> > have a single cast during the variable assignment rather than have a
> > second one on the return statement. But it's a matter of taste. I
> > tend to hate casts as they confuse the reader and remove the ability
> > of the compiler to produce relevant warnings, so for me the less the
> > better.
> 
> Ditto.

OK, then I'll push it.

Thank you!
Willy
