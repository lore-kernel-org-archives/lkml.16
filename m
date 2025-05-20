Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58E2550D7
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706054; cv=none; b=baYvCjhJ9GLWYBO+Trli3Aa6JPymPfHlWY2E0FDSbL2Gye11wUXiKJL3GB7xa9YwKp0PbUh46dn29gkGLTw3bDZcnGOsQV0tteRTkK+j6xfamxQ+2WXFR6914FSllPptf4VBeEEAB0h7VjjSU/pU5yVjVteB19CZdCluDPTWilo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706054; c=relaxed/simple;
	bh=7nvcSkN76Mw5x/FQRSaQVgDbK2jkVz7KJt6If6VomMs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dH2IUs0hQvs9a4YE1QkbE1KRaPuAUYlP6DDKinUARuxayJFD5TVS33sSYUgu+COEqaHsQRq6chowoOzI9vktXF5wG3XKUYQcQcNIgt+Id6yhV4nzC29W77i8d5SKk5/fp7MdGVf0snaOoGSuzcbG6m+7iAl4wiYwD15zXSJc1HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hfbuTAFk; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hfbuTAFk"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f8c0c8da93so50355786d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747706049; x=1748310849; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7uYrrsx6cVByAdEaiTvqjKxnW9sCudZuEdNLZnCQdi4=;
        b=hfbuTAFkKaDPIKu+1ocIxAT6UZ5noBxLdoCuhzck+krarQWWOpM/pdC7EUdkzm2hsM
         YoKBDsN89/kKFPv/umipdmsDBpyMSxA0BKQ2rcxQ2OdikbTLFtxmQisH3q2KE31o5hPd
         RSFfrckacp6famZASsh85Fifi9t2A00DzkPQpkMjii1brRo8xnxFMQG8HOol/brI2odu
         etQ6VcUL+oSUZwwO8BBQKfBUnbt6BDGA49zZP35jRBrglEz0nQIIjf9vf70b3IjrLkt+
         Xe4PqqSGeLMF7JRUJNrU4jWeTejwRTbEpye0xsaPnRezS+Qwky7Ky+jqRH4CD4c88mXi
         85wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747706049; x=1748310849;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uYrrsx6cVByAdEaiTvqjKxnW9sCudZuEdNLZnCQdi4=;
        b=jWWDU7Q0w9NBueQE+SIcyXImKtDspXQLysJS1a3tV8wQIvg5EC1XmB7FZjgAytpTDd
         nOVe1xO7qljpLaKavcpoYm+YF517esSnD8+uhHONdS9kkLX6LOQT8aVnOQY8egpRWzBm
         WYWRzH+1FMVWIla66e57Ul3gLVZszqRFIDFxs1Nt7ZdxGs9hvXgwj2i7Jj/U+arZfBER
         BM/ZHRzf7oRKLSR43TxhByZXi4VMM8X/TUFBJlc2vKrLrowQmwrDRGdSN+9jwiIZUrOO
         b3scLL6Ij31CxBeD6XGxymulPRN2wNs9LhfoA6nTeJrURCw9CgG3PrYrqFUtF6Cda+0C
         PpBA==
X-Forwarded-Encrypted: i=1; AJvYcCWlYXUaEgKQyuZAW7zgezrMKqSdWrNaREQoK7d07tYmJVvmeOoOdJGMAHZ/JWx/TPv+jUUmXqejGB79+VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYss4m5R5f/Pa09/2W4ZFUl8eqjNemNWZZd6hbh4aNefaweOt4
	HFQi6O7mVQ/QomY4uu1n9Y153bM3YOsedxdzGfXaPJU8AtOveOHmbjElvorIDe/vKPc=
X-Gm-Gg: ASbGncuCrOh0GlUhySWseLFOsTJaoUrAz2d6icAu5wLKwnF8+Dls/14OUoM8uD5bsr6
	jJ//MmZqtkNxZqAhr8XEOfjNus6+bjOl+ITRGdEC6qRNXyW9SPAylQsVF8PuThK97h00C9yhhCi
	SPoD20pubXwcxOMVTxNWlQIzGvTg0AXLM0WgNDV8W8EuhZMT4hF+d9bow+aMaOxjCdITBtcTWU7
	bk0TrBu020Yeful0WOsBaXRb5sRdk9iaUfGN9NRDsil9Way9KY6tfvTBmYS+J4qyRkQM9ULf0xP
	kYPiKK/JsvxXwIqB++J3wxRGdlH2E6/30s6g0Oan6VgUcXKFeFLdrwpsplMD0qIG0V7rjRVfSlr
	EnvTkuia+nCzP5DCE7Q+d3pNU
X-Google-Smtp-Source: AGHT+IHZ78x4PPFdmeFGI+AW7zin5/2qKYFowktJCMaVJePji9n+cxMZZiG9D3Gqm2JScM0cqn4veg==
X-Received: by 2002:a05:6214:e85:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f8b082e9a0mr265784646d6.27.1747706049073;
        Mon, 19 May 2025 18:54:09 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b584bb4bsm58048126d6.68.2025.05.19.18.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 18:54:08 -0700 (PDT)
Date: Mon, 19 May 2025 21:54:07 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
In-Reply-To: <20250519125912.79e09cb2@pumpkin>
Message-ID: <6np32077-n924-q742-6n24-7qn9nn3r2n3n@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com> <20250518133848.5811-3-david.laight.linux@gmail.com> <uc3g3fgwirwczxjbh5qxgz3pzqmlmiymdeh7m2dzznx2fap4vc@6hvvrgpbyg5q> <20250519125912.79e09cb2@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463781375-590446451-1747706048=:1059861"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463781375-590446451-1747706048=:1059861
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 19 May 2025, David Laight wrote:

> On Mon, 19 May 2025 08:10:50 +0200
> Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
> 
> > On Sun, May 18, 2025 at 02:38:46PM +0100, David Laight wrote:
> > > Do an explicit BUG_ON(!divisor) instead of hoping the 'undefined
> > > behaviour' the compiler generated for a compile-time 1/0 is in any
> > > way useful.
> > > 
> > > It may be better to define the function to return ~(u64)0 for
> > > divide by zero.
> > > 
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > ---
> > > 
> > > A new change for v2 of the patchset.
> > > Whereas gcc inserts (IIRC) 'ud2' clang is likely to let the code
> > > continue and generate 'random' results for any 'undefined bahaviour'.
> > > 
> > >  lib/math/div64.c | 10 +++-------
> > >  1 file changed, 3 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > > index a5c966a36836..c426fa0660bc 100644
> > > --- a/lib/math/div64.c
> > > +++ b/lib/math/div64.c
> > > @@ -186,6 +186,9 @@ EXPORT_SYMBOL(iter_div_u64_rem);
> > >  #ifndef mul_u64_u64_div_u64
> > >  u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> > >  {
> > > +	/* Trigger exception if divisor is zero */
> > > +	BUG_ON(!d);
> > > +  
> > 
> > I'm unsure if I should like the BUG_ON better than return 1/0. My gut
> > feeling is that mul_u64_u64_div_u64() should behave in the same way as
> > e.g. div64_u64 (which is just `return dividend / divisor;` for 64bit
> > archs and thus triggers the same exception as `return 1/0;`.
> 
> You need to execute a run-time 1/0 not a compile-time one.
> clang is likely to decide it is 'undefined behaviour' and just not
> generate any code at all - including removing the 'if (!d)' condition.

The code as it is works perfectly with both gcc and clang: it triggers 
the proper trap or
or call the corresponding exception handler. 

> For x86 gcc does (sometimes at least) generate 'if (!d) asm("ud2")'

And that's perfect. Did you find any occurrence when it is not the case?

> but BUG_ON() adds a table entry for the fault site.

You should really be as close as the behavior you get with a runtime x/y 
where y = 0. When that happens there are no BUG_ON().


Nicolas
---1463781375-590446451-1747706048=:1059861--
