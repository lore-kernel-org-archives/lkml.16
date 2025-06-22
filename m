Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F77163
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750622207; cv=none; b=lwFu7EAZeVv7ahxMNManrLF3vz/H1WFore6OqU/EoMX/Aw0HJ7R15R4HPq14yXhmPV/AlZNSHNYXWJjP/qTVBCXrLwyF1d2/MKe2hQrWSObfAu/MMEKWQlXTwd1Nxa5E33neKKSqnpp/HbFpN0PT9rWuI2PWxFdugLFfHPF2DVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750622207; c=relaxed/simple;
	bh=eB8FTrkm9dHMeY1RIOWnw1F0LX5g/smaeTzanP+AN7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0VDgntfa835BRQ4R0DKXj0B0cGA/fU/+4cKHFPhOWO8pu2ZhjzKZKblv+I4Ddmg150aanRy4E7XgE2Jc+hFPKSsrQIHtOjRoyU7rRhAgGOaxysM1ReTv+5ElMFXnJqC/t/gSbiJhQKIGCaQFO26ofa3kLjJlP7z00lyHPsQnPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=I9Ji9FGA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="I9Ji9FGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1750622196; bh=eB8FTrkm9dHMeY1RIOWnw1F0LX5g/smaeTzanP+AN7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I9Ji9FGAgS5W95UEquR8hqzxBvRf5x0iHX/T41AqyGqIAviDCNWXawqFkdoyHSwE+
	 vLJBifoi+pv2on6iKHxv21ddcB47dA/zdrOW/lTjl1+JKrMehZttAgcXcL12+fq48C
	 pFWAE0jlbVJ54Qn3QJf+n4FRdQUSncCmHC0Trsm0=
Date: Sun, 22 Jun 2025 21:56:35 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] tools/nolibc: add missing memchr() to string.h
Message-ID: <50d5308c-8969-4cad-9b5e-ab7f86918c1c@t-8ch.de>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-5-w@1wt.eu>
 <d7b81639-c53c-4186-9e30-04137576a1f1@t-8ch.de>
 <20250621084234.GA26934@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250621084234.GA26934@1wt.eu>

On 2025-06-21 10:42:34+0200, Willy Tarreau wrote:
> On Sat, Jun 21, 2025 at 10:27:11AM +0200, Thomas Weißschuh wrote:
> > On 2025-06-20 12:02:51+0200, Willy Tarreau wrote:
> > > Surprisingly we forgot to add this common one. It was added with a
> > > per-arch guard allowing to later implement it in arch-specific asm
> > > code like was done for a few other ones.
> > > 
> > > The test verifies that we don't search past the indicated length.
> > > 
> > > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > > ---
> > >  tools/include/nolibc/string.h                | 15 +++++++++++++++
> > >  tools/testing/selftests/nolibc/nolibc-test.c |  2 ++
> > >  2 files changed, 17 insertions(+)
> > > 
> > > diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
> > > index 163a17e7dd38b..4000926f44ac4 100644
> > > --- a/tools/include/nolibc/string.h
> > > +++ b/tools/include/nolibc/string.h
> > > @@ -93,6 +93,21 @@ void *memset(void *dst, int b, size_t len)
> > >  }
> > >  #endif /* #ifndef NOLIBC_ARCH_HAS_MEMSET */
> > >  
> > > +#ifndef NOLIBC_ARCH_HAS_MEMCHR
> > 
> > So far we only have added these guards when necessary,
> > which they aren't here. Can we drop them?
> 
> I intentionally placed them so that we can easily override them,
> as we did for the other ones on x86 where string operations are
> super short (repnz scasb is two bytes once you have the registers
> already loaded).

Okay.

We do have different override mechanisms.
Both NOLIBC_ARCH_HAS_* and for example the mechanism for sys_fork.
Not sure if it is worth aligning them.

> > > +static __attribute__((unused))
> > > +void *memchr(const void *s, int c, size_t len)
> > > +{
> > > +	char *p = (char *)s;
> > 
> > The docs say that they are interpreted as "unsigned char".
> 
> It does not change anything here, except adding an extra
> modifier (since we'll then also have to do it in the loop
> when comparing against c), thus IMHO it's extra noise.

Fair enough.

> > Also, can we keep the const?
> 
> It's memchr()'s definition which requires to return a void* so the
> const needs to be dropped somewhere. Here I found visually cleaner to
> have a single cast during the variable assignment rather than have a
> second one on the return statement. But it's a matter of taste. I
> tend to hate casts as they confuse the reader and remove the ability
> of the compiler to produce relevant warnings, so for me the less the
> better.

Ditto.
