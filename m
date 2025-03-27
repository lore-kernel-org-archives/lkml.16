Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024E322B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079305; cv=none; b=dBunhI5ADR6zYCK2tLOx8zDRSPUJ9pZFXdtr5Eh08Hiq/w7Ol/cR7fA9AqEAkJYRZzInaIWgalEgjBQw4kLrXP0kKULv8imk7y9JSqgBZT9GY0MrCOHnwhSlQfBKHujtEma9j9JAxu/OcyQsEH6SvtagQtIxMnYZHmugxNUb3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079305; c=relaxed/simple;
	bh=3ECEl/NX/Jn9j/dpT2zSyV4SoXO/iMCmymPyi1rFue8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZoHsXCyfwEEhJR2EVSpX9BAXcaytovKV2nDDj3Kcjkcmsl1GF6dv6d7DYb7x5WgQDdzqUvDHUOIzBXmGuJimYjqsj7oxN+RxepSt0oBYC40yVbmjJPzwxjPSVe5wVd7HaeoOOprnD7a4iPMkxpRiL+izq3qhWBHaPaOV33oASw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wAErWEWa; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wAErWEWa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O+A64R/LqWZmWuQwTs3JlV4X4sGVXRXZaReSlXcbmhY=; b=wAErWEWaSZUwSyIQYuDLx6mWHx
	ClVrKbIpPnvmm9caHL85QTvQ+QdCTtnaEfctqfAcnxb23SBXiPV/lmo2BQ8B6M/EXGZtR01N1uak/
	o+mIYSV/0riB9kWnxngrRgPGxccPNIcG017P9qTBv9qVHge4htmN8RnPZcpv7UCdYRyXrhiUDIKku
	BuMlZ3M+N2B+0nfIiFJknGE1a0SZ/9KRze3k2qzmMbmb+NxHFcoY8FLiTx+QhwpA9ybJ9XgWYma+Q
	xxNo2w2XHuz3HuF/p/8a8wbQ7x548DSMAk+BzS657XPOf9EF8kjUeqdNr1C5tGrXRjEVpp7m6c67U
	fh/J6JBA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmYH-0000000BrS8-3chg;
	Thu, 27 Mar 2025 12:41:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6F2FB3004AF; Thu, 27 Mar 2025 13:41:41 +0100 (CET)
Date: Thu, 27 Mar 2025 13:41:41 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 4/5] bugs/x86: Augment warnings output by concatenating
 'cond_str' with the regular __FILE__ string in _BUG_FLAGS()
Message-ID: <20250327124141.GC31358@noisy.programming.kicks-ass.net>
References: <20250326084751.2260634-1-mingo@kernel.org>
 <20250326084751.2260634-5-mingo@kernel.org>
 <20250326085343.GB25239@noisy.programming.kicks-ass.net>
 <Z-UcIJAQsNXoxMXG@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-UcIJAQsNXoxMXG@gmail.com>

On Thu, Mar 27, 2025 at 10:36:32AM +0100, Ingo Molnar wrote:

> > > diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> > > index aff1c6b7a7f3..e966199c8ef7 100644
> > > --- a/arch/x86/include/asm/bug.h
> > > +++ b/arch/x86/include/asm/bug.h
> > > @@ -50,7 +50,7 @@ do {									\
> > >  		     "\t.org 2b+%c3\n"					\
> > >  		     ".popsection\n"					\
> > >  		     extra						\
> > > -		     : : "i" (__FILE__), "i" (__LINE__),		\
> > > +		     : : "i" (cond_str __FILE__), "i" (__LINE__),		\
> > >  			 "i" (flags),					\
> > >  			 "i" (sizeof(struct bug_entry)));		\
> > >  } while (0)
> > 
> > Sneaky :-)
> 
> BTW., any reason why we go all the trouble with the bug_entry::line u16 
> number, instead of storing it in the bug_entry::file string with a
> :__LINE__ postfix or so?

I have no clue; this is well before my time. But yes, that seems a
viable option indeed.
