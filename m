Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1B442A96
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750495377; cv=none; b=s/arKJUyZiS45vCmikbCACIVke47eQQ3Q6oY9WWVFnpQtWIZwkFOsmi4ykrycdDzIf277kMeHSDv8xPI1Qd33jz7TXfEFGCQ+q3s11ACZOXPEnS8dUpRnBUxf3i80ncLdHHfvC6VW88Xy34TgaGnnAqThxyygogWVpJVwDJ77wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750495377; c=relaxed/simple;
	bh=LJL1u14B/iB4Hf2UFRUO3x3r1Wh6cVhZuH3jkGStHEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9rdRtY5frI+888TMaaqU2rr7PjT5qa9HYGWqSyPJ+hu/c/N1L4iqUwrBQgFGLor7IWdf4s1eVxjLVpd2CRaMXqtf5Xv6btzWYLAet7+YFVDsUiubHW5cAqWkB9B4sXpg1mzeiyIa0F2I9x+BWVdfgQ6yIx8zzNaXXIxvTapc2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55L8gYFW026946;
	Sat, 21 Jun 2025 10:42:34 +0200
Date: Sat, 21 Jun 2025 10:42:34 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] tools/nolibc: add missing memchr() to string.h
Message-ID: <20250621084234.GA26934@1wt.eu>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-5-w@1wt.eu>
 <d7b81639-c53c-4186-9e30-04137576a1f1@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7b81639-c53c-4186-9e30-04137576a1f1@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Jun 21, 2025 at 10:27:11AM +0200, Thomas Weißschuh wrote:
> On 2025-06-20 12:02:51+0200, Willy Tarreau wrote:
> > Surprisingly we forgot to add this common one. It was added with a
> > per-arch guard allowing to later implement it in arch-specific asm
> > code like was done for a few other ones.
> > 
> > The test verifies that we don't search past the indicated length.
> > 
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > ---
> >  tools/include/nolibc/string.h                | 15 +++++++++++++++
> >  tools/testing/selftests/nolibc/nolibc-test.c |  2 ++
> >  2 files changed, 17 insertions(+)
> > 
> > diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
> > index 163a17e7dd38b..4000926f44ac4 100644
> > --- a/tools/include/nolibc/string.h
> > +++ b/tools/include/nolibc/string.h
> > @@ -93,6 +93,21 @@ void *memset(void *dst, int b, size_t len)
> >  }
> >  #endif /* #ifndef NOLIBC_ARCH_HAS_MEMSET */
> >  
> > +#ifndef NOLIBC_ARCH_HAS_MEMCHR
> 
> So far we only have added these guards when necessary,
> which they aren't here. Can we drop them?

I intentionally placed them so that we can easily override them,
as we did for the other ones on x86 where string operations are
super short (repnz scasb is two bytes once you have the registers
already loaded).

> > +static __attribute__((unused))
> > +void *memchr(const void *s, int c, size_t len)
> > +{
> > +	char *p = (char *)s;
> 
> The docs say that they are interpreted as "unsigned char".

It does not change anything here, except adding an extra
modifier (since we'll then also have to do it in the loop
when comparing against c), thus IMHO it's extra noise.

> Also, can we keep the const?

It's memchr()'s definition which requires to return a void* so the
const needs to be dropped somewhere. Here I found visually cleaner to
have a single cast during the variable assignment rather than have a
second one on the return statement. But it's a matter of taste. I
tend to hate casts as they confuse the reader and remove the ability
of the compiler to produce relevant warnings, so for me the less the
better.

Thanks,
Willy
