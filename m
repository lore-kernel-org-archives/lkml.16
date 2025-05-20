Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA2E25F7B7
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779904; cv=none; b=o0TAUy1ZZVv+lAZUx5CUSlYVNRW3Hx96icPrTmEPX7fodzf01Z5+Z8oCqyJ2XCFVLY/6P3ycAhoenCruzxpD1A9Zlm4I0JijLXvWbkW88h/G1ZP0LW6hIaqj7LCghwd/B8/m5xB8RRBW6TRi/zXrLJlkmeZFHLTzrw8g+Y3wdc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779904; c=relaxed/simple;
	bh=B6r5hTWpoh1U2740qk7rYCJkSWyhycNyNqe9N32aM1w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OYkdtSaOXeb/4xCAoPD+UbRE2mgI0DXOfnwEkauvIJCyJXmqoldWuQef7RPq5B8kLw6DZhzJU5D99OskxMt+N5o2ZFqsMXR0Cey0OIbSY58Ca2FcSgjeStIv9KqTOI4wVVY8lEqo2OLjf4GHK22EKKJ9gL2XigOPE6iBOwuAVQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HzVx3PT1; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HzVx3PT1"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476ac73c76fso88672021cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747779899; x=1748384699; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=++WPZvoZ0IgHd+3LaXjNjz7H44vasBaQPAgtiA1Awa8=;
        b=HzVx3PT1V6WgiwCfBkGXAeNVDIV2sfPnW/l8XzHE+XccY/qDUgbrXlTRVjf4LZdPu0
         YQnmEbDHZUxXH421V6bfy1BSOTPIPeU6G2sg2NsFzaoJq43rrpq8oNO388PW+fIrLIAq
         v40+bce7Tl8YJUItRJPQ2ZYzTBV6gx/pU06F/gcnONPpijCooZ5fjSwetCILsL/sn49K
         qgQReluCMb+gTZ3OlNSlrQ7cZUNmdYi4vXY/2ZiOOfFtfIG0p8nie2zZMVU8fQ3yk/Mg
         TE5UxD+VybAdY0Xl0Fo7LvQAtSd4FGldstZCjIIXlMuG175PUjQAPh88wCqNRJ0JPlPb
         2F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779899; x=1748384699;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++WPZvoZ0IgHd+3LaXjNjz7H44vasBaQPAgtiA1Awa8=;
        b=vemM4znvnAPXg9QYBx3eKDTGGGSlobfaU5T+Piavd7Q9vXqsWsg172g/QVQ0zIK//V
         n4iSksPiogZpyhZkRlE7NhfUR2E5hja525zC61s/9VgSgSKnzKkJDW+fo5EPAXTYmaY6
         hmVSBq8Yt2gHIsebXM6b6EDK22MjBpYh9NJL0otdN7KulA/Cx4Qg9aXUr0ypBSQKbuiE
         1/QVDg3EHZHQ3uJ0vxqhXf3p4GQBeDSkKBaQPxRmdThSnGMuOaDc489lHDmwz6RnPGXK
         EfXw9mzIyplw+wGc35kriSKTYRvxVobcYhAQ7Be43jhJooX848GZ50xMAvlmdZNx1v4Y
         RDfw==
X-Forwarded-Encrypted: i=1; AJvYcCXm6dpZekJd+YTdrFwei85YsZuGZORAd/G710asjJTlakOc6i6kH+earuVMwdWaZIEYOcin7vP7JYjB0po=@vger.kernel.org
X-Gm-Message-State: AOJu0YycTkNBttHd3O+H3HExnbttOhlijJrpn7e9XV+2Kby43R10IaB/
	V361LQIHuYVBxcJC7dT/XgxFRyAMIiXJElRMXBWUn0QXXC+YCOh2L4NOLjsdFdbKwaE=
X-Gm-Gg: ASbGncuFssSA3FFRaD8GAVj7+xGvc7IcE74p0pxunktVWZF5eq4RMLjBoVSPfshVJLe
	gH5NBLCpVFUDKjdNBPlfBJRzj8VA366uwUZ1HYQbE7xALBOXdBxnGKDncidzkh/LrNIdmoaUNJB
	RcEKD8iFDTEzmS7Eo57WZ9jOrlbfv15JoWX4v63Y+mDXdo6lFjFd0L7N9GdeGkw0xGYCPdOjWRQ
	5jlHo35oHNFR7vNCx+4We8HGs2IfsBKDACD40+BOLlg9FQ2kTvMS9Q5QIGGSya8vyw6boQ3xVk4
	UcVbhsYn47bGUoM/lYoQ6ZtWGWoUefDIZ02Z3OPQrrG4+o5ZR0r4ZPiMkAAGp2gaA+PMBKRVWgG
	tV6GNmanl6sZLTIoq+TuKci8/
X-Google-Smtp-Source: AGHT+IHsgVes1i2RPfj5sNlf3VtNl5vNdoTvDSNQD6pn13mL9QEgkpNxostYgEKzTG191QW/9MunKw==
X-Received: by 2002:a05:622a:1dc7:b0:48a:4465:bfd8 with SMTP id d75a77b69052e-494ae4cb62fmr314051021cf.49.1747779899503;
        Tue, 20 May 2025 15:24:59 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3cef4csm76090371cf.1.2025.05.20.15.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:24:59 -0700 (PDT)
Date: Tue, 20 May 2025 18:24:58 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 3/4] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250520223700.2ec735fd@pumpkin>
Message-ID: <148nop5q-s958-n0q4-66r8-o91ns4pnr4on@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com> <20250518133848.5811-4-david.laight.linux@gmail.com> <321rs9r7-8858-p195-263n-49q78q8rn25o@onlyvoer.pbz> <20250520223700.2ec735fd@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 May 2025, David Laight wrote:

> On Mon, 19 May 2025 23:03:21 -0400 (EDT)
> Nicolas Pitre <npitre@baylibre.com> wrote:
> 
> > On Sun, 18 May 2025, David Laight wrote:
> > 
> > > The existing mul_u64_u64_div_u64() rounds down, a 'rounding up'
> > > variant needs 'divisor - 1' adding in between the multiply and
> > > divide so cannot easily be done by a caller.
> > > 
> > > Add mul_u64_add_u64_div_u64(a, b, c, d) that calculates (a * b + c)/d
> > > and implement the 'round down' and 'round up' using it.
> > > 
> > > Update the x86-64 asm to optimise for 'c' being a constant zero.
> > > 
> > > For architectures that support u128 check for a 64bit product after
> > > the multiply (will be cheap).
> > > Leave in the early check for other architectures (mostly 32bit) when
> > > 'c' is zero to avoid the multi-part multiply.  
> > 
> > I agree with this, except for the "'c' is zero" part. More below.
> > 
> > > Note that the cost of the 128bit divide will dwarf the rest of the code.
> > > This function is very slow on everything except x86-64 (very very slow
> > > on 32bit).
> > > 
> > > Add kerndoc definitions for all three functions.
> > > 
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > ---
> > > Changes for v2 (formally patch 1/3):
> > > - Reinstate the early call to div64_u64() on 32bit when 'c' is zero.
> > >   Although I'm not convinced the path is common enough to be worth
> > >   the two ilog2() calls.
> > > 
> > >  arch/x86/include/asm/div64.h | 19 ++++++++++-----
> > >  include/linux/math64.h       | 45 +++++++++++++++++++++++++++++++++++-
> > >  lib/math/div64.c             | 21 ++++++++++-------
> > >  3 files changed, 70 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
> > > index 9931e4c7d73f..7a0a916a2d7d 100644
> > > --- a/arch/x86/include/asm/div64.h
> > > +++ b/arch/x86/include/asm/div64.h
> > > @@ -84,21 +84,28 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
> > >   * Will generate an #DE when the result doesn't fit u64, could fix with an
> > >   * __ex_table[] entry when it becomes an issue.
> > >   */
> > > -static inline u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div)
> > > +static inline u64 mul_u64_add_u64_div_u64(u64 a, u64 mul, u64 add, u64 div)
> > >  {
> > >  	u64 q;
> > >  
> > > -	asm ("mulq %2; divq %3" : "=a" (q)
> > > -				: "a" (a), "rm" (mul), "rm" (div)
> > > -				: "rdx");
> > > +	if (statically_true(!add)) {
> > > +		asm ("mulq %2; divq %3" : "=a" (q)
> > > +					: "a" (a), "rm" (mul), "rm" (div)
> > > +					: "rdx");
> > > +	} else {
> > > +		asm ("mulq %2; addq %3, %%rax; adcq $0, %%rdx; divq %4"
> > > +			: "=a" (q)
> > > +			: "a" (a), "rm" (mul), "rm" (add), "rm" (div)
> > > +			: "rdx");
> > > +	}
> > >  
> > >  	return q;
> > >  }
> > > -#define mul_u64_u64_div_u64 mul_u64_u64_div_u64
> > > +#define mul_u64_add_u64_div_u64 mul_u64_add_u64_div_u64
> > >  
> > >  static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 div)
> > >  {
> > > -	return mul_u64_u64_div_u64(a, mul, div);
> > > +	return mul_u64_add_u64_div_u64(a, mul, 0, div);
> > >  }
> > >  #define mul_u64_u32_div	mul_u64_u32_div
> > >  
> > > diff --git a/include/linux/math64.h b/include/linux/math64.h
> > > index 6aaccc1626ab..e1c2e3642cec 100644
> > > --- a/include/linux/math64.h
> > > +++ b/include/linux/math64.h
> > > @@ -282,7 +282,50 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
> > >  }
> > >  #endif /* mul_u64_u32_div */
> > >  
> > > -u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
> > > +/**
> > > + * mul_u64_add_u64_div_u64 - unsigned 64bit multiply, add, and divide
> > > + * @a: first unsigned 64bit multiplicand
> > > + * @b: second unsigned 64bit multiplicand
> > > + * @c: unsigned 64bit addend
> > > + * @d: unsigned 64bit divisor
> > > + *
> > > + * Multiply two 64bit values together to generate a 128bit product
> > > + * add a third value and then divide by a fourth.
> > > + * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.
> > > + *
> > > + * Return: (@a * @b + @c) / @d
> > > + */
> > > +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d);
> > > +
> > > +/**
> > > + * mul_u64_u64_div_u64 - unsigned 64bit multiply and divide
> > > + * @a: first unsigned 64bit multiplicand
> > > + * @b: second unsigned 64bit multiplicand
> > > + * @d: unsigned 64bit divisor
> > > + *
> > > + * Multiply two 64bit values together to generate a 128bit product
> > > + * and then divide by a third value.
> > > + * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.  
> > 
> > If the quotient exceeds 64 bits, the optimized x86 version truncates the 
> > value to the low 64 bits. The C version returns a saturated value i.e. 
> > UINT64_MAX (implemented with a -1). Nothing actually traps in that case.
> 
> Nope. I've only got the iAPX 286 and 80386 reference manuals to hand.
> Both say that 'interrupt 0' happens on overflow.
> I don't expect the later documentation is any different.

Hmmm... OK, you're right. I must have botched my test code initially.

> If the kernel code is going to have an explicit instruction to trap
> (rather then the code 'just trapping') it really is best to use BUG().
> If nothing else it guarantees a trap regardless of the architecture
> and compiler.

OK in the overflow case.

However in the div-by_0 case it is best if, for a given architecture, 
the behavior is coherent across all division operations.

> > > +	if (!c && ilog2(a) + ilog2(b) <= 62)
> > > +		return div64_u64(a * b, d);
> > > +  
> > 
> > Here you should do:
> > 
> > 	if (ilog2(a) + ilog2(b) <= 62) {
> > 		u64 ab = a * b;
> > 		u64 abc = ab + c;
> > 		if (ab <= abc)
> > 			return div64_u64(abc, d);
> > 	}
> > 
> > This is cheap and won't unconditionally discard the faster path when c != 0;
> 
> That isn't really cheap.
> ilog2() is likely to be a similar cost to a multiply
> (my brain remembers them both as 'latency 3' on x86).

I'm not discussing the ilog2() usage though. I'm just against limiting 
the test to !c. My suggestion is about supporting all values of c.

> My actual preference is to completely delete that test and rely
> on the post-multiply check.
> 
> The 64 by 64 multiply code is actually fairly cheap.
> On x86-64 it is only a few clocks slower than the u128 version
> (and that is (much) the same code that should be generated for 32bit).

Of course x86-64 is not the primary target here as it has its own 
optimized version.


Nicolas
