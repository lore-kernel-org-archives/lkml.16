Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCFF1F37BC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627565; cv=none; b=GF0Ni2/khIAGuWysG71oFDUtcDrDq48lVLhHV9ko6oLV2Dltyjba4Wpj3TUFATgoqM6Bgk4Gs85u/YTapmCn0MJdj6ZR22gLdamGEDv2B1ZhaKJrasCow+aUlB+rhjmQe+DVD8bFHNHmqZkfmlRN7cnO8JhM66knptl8eVTQV/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627565; c=relaxed/simple;
	bh=cuapBNZyNdsxDR6Q/4sXdL588hXIJkYVNaB3sohDqwA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UsFTFNLORJNNf6jEucEApGkYJxPOziNbprwi8//OCAlkTwWb+jThgDfq73cFkos3SoRKRYPkNRgplBebxQtKNzwDy6qV5ypATHsCaLx9tIGBmMdBiOtNTE69iu3UH5X4V+ieGdE41mMyMoPhBnGL7shC8sRUI0ERoferUfCbC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZ3oBg3c; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZ3oBg3c"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so107125f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743627562; x=1744232362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVAmhe0Lrl3o3k4eVESe7v9cB1pIfxqbntuG2PUrFk0=;
        b=IZ3oBg3cOVRw+yRgTXdsF2JtZDn+M+E6CVr5yiyq5cgbvueueyh/sHvfQerCeLGBLX
         76GWbYtDezz3cly1J8QWHv93R+3e36AE1qIjKnvygS/Qc/4h6n0mdmFbzQydB7ThVS7R
         4dbnycNr5XDREoMuecXEeChkF8p2a6dEqlLPBA1GPx7Y5x93cj+K7bnMxMjWs+LlSTX9
         Fuv5I2PghWedPBWqYa921YwREvTmeEqmm0hS4r1CA2LvaJ5MdVeKFUtoFD+D+WM3Ta4O
         vOVJzQoLWVrovHNTs/jcZx2SVNcVNiCEclbRL9/C4bzHUjHsqRNYG8VvF+4XVzwsR+oC
         La0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627562; x=1744232362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVAmhe0Lrl3o3k4eVESe7v9cB1pIfxqbntuG2PUrFk0=;
        b=PEUTjGXDadpTnEnG8CIvqd12KwaaXNHKfImVjn6Jss8Y3erXc7+RPkPYonGm4RqvHG
         BP92Ix36i5Uw84Gas0uVQ8Do47ihh6mYpYdpzYhsVDfn/ue8hEcbEC5aHTpHrwzo7B/w
         V7UDuvReTaWikIG4mxDf2pLMrwEHuiY0jlD4CQmm3NlNiJ6TDx/tTmbPbHc/9fWTFuEn
         ob9Y4MDAdM7FaripQ091HNUsuMaggfedYhIHmtvtcdyIHckflog4a/EZ60quAkSi4Im4
         zIdgmV8ab63J9VIjnWoP7qr1Gy+4HBx/KWBDQBX/QngdcBiocfFKLyaR1grGLEOW8gmI
         2Jdw==
X-Forwarded-Encrypted: i=1; AJvYcCXXSwp7OJridpcdDte5+VhWBG+xDIy8NCwPhngYAU+aqiDe43c9u3OYEvB2TAYQp1AMUlurkyXQYZv3uZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+n3lTYprJznBUOQAfmTjmg5unaZoYIT2DnlKEoK1PwJ65Bgo2
	wMx22hKIrCkbppKBM+ZIZ4baB2kTyPXjnvfTzHrDFhg+EntNd+x+
X-Gm-Gg: ASbGncs6UWhv8Z2oyoZJJw0jccjz8RMdAf6x13ozxvFMonfzlpyBg9t4ebbGad86m+O
	rQqd/+wyGh5WX/polsdP9d3nY1+v4wpuU3M5ZuQ9oNICbTd30trR0oalDDmuearZpAzDzAgq+YW
	EiM1ZYq/j85xaBS59OvgE+qKmm+JyJVuTftyv1Sjtuj4HXHDNHUXdTRWQR5veo2xjyJ/kpzWAYb
	bcNsH7SUPJGFSC88fTFjQ+SR9jk6A2owJhZx7sijj/Rgva34IkuxtV/9yL0ls7LOlptgeVIQd+C
	g4JMHdwZHKuJmne5nkZq2WIngPNlshWimP/QAQiV+kTT/xJPtz8/M8vdp52UHNdr0HxnIfvLl4N
	2FtN/xXc=
X-Google-Smtp-Source: AGHT+IG9XM/04o/biomZ8comXjrN4tg2H7sTdbWaSntEyCn3iRM0q10caZqQ1Ngkt86GZqIrvtBurQ==
X-Received: by 2002:a05:6000:1ac8:b0:39c:1a86:e473 with SMTP id ffacd0b85a97d-39c2f958dd7mr64090f8f.56.1743627561569;
        Wed, 02 Apr 2025 13:59:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6589e4sm18191121f8f.10.2025.04.02.13.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 13:59:21 -0700 (PDT)
Date: Wed, 2 Apr 2025 21:59:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <20250402215919.2b933752@pumpkin>
In-Reply-To: <gqqxuoz5jfrlsmrxdhwevfo7kflxjqhbkfy2ksnsdcadbk52hd@yaitrauy52xg>
References: <20250321131813.6a332944@pumpkin>
	<epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
	<20250331195357.012c221f@pumpkin>
	<mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
	<20250401202640.13342a97@pumpkin>
	<15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz>
	<46368602-13n7-s878-s7o2-76sr0q67n9q4@syhkavp.arg>
	<20250401223731.7102103d@pumpkin>
	<2wwrj6aid2elnnotzfkazierqmzmzpfywyf33ahqs36xh5xz32@rszeetrztsiz>
	<20250402135219.28b24e94@pumpkin>
	<gqqxuoz5jfrlsmrxdhwevfo7kflxjqhbkfy2ksnsdcadbk52hd@yaitrauy52xg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Apr 2025 17:01:49 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> Hello David,
>=20
> On Wed, Apr 02, 2025 at 01:52:19PM +0100, David Laight wrote:
> > On Wed, 2 Apr 2025 10:16:19 +0200
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:
> >  =20
> > > On Tue, Apr 01, 2025 at 10:37:31PM +0100, David Laight wrote: =20
> > > > On Tue, 1 Apr 2025 16:30:34 -0400 (EDT)
> > > > Nicolas Pitre <nico@fluxnic.net> wrote:
> > > >    =20
> > > > > On Tue, 1 Apr 2025, Nicolas Pitre wrote:
> > > > >    =20
> > > > > > On Tue, 1 Apr 2025, David Laight wrote:
> > > > > >      =20
> > > > > > > Looking at the C version, I wonder if the two ilog2() calls a=
re needed.
> > > > > > > They may not be cheap, and are the same as checking 'n_hi =3D=
=3D 0'.     =20
> > > > > >=20
> > > > > > Which two calls? I see only one.     =20
> > > > >=20
> > > > > Hmmm, sorry. If by ilog2() you mean the clz's then those are chea=
p. Most=20
> > > > > CPUs have a dedicated instruction for that. The ctz, though, is m=
ore=20
> > > > > expensive (unless it is ARMv7 and above with an RBIT instruction)=
.   =20
> > > >=20
> > > > The code (6.14-rc6) starts:
> > > >=20
> > > > u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> > > > {
> > > > 	if (ilog2(a) + ilog2(b) <=3D 62)
> > > > 		return div64_u64(a * b, c);
> > > >=20
> > > > Now ilog2() is (probably) much the same as clz - but not all cpu ha=
ve it.
> > > > Indeed clz(a) + clz(b) >=3D 64 would be a more obvious test.   =20
> > >=20
> > > Ack, the more intuitive check might be
> > >=20
> > > 	if (fls64(a) + fls64(b) <=3D 64)
> > >  		return div64_u64(a * b, c);
> > >=20
> > > then, but maybe "intuitive" is subjective here? =20
> >=20
> > Depends on whether you grok 'clz' or 'fls' :-) =20
>=20
> And it also depends on the availability of the respective functions.
> There is a fls64 function provided by include/asm-generic/bitops/fls64.h
> and in several arch-specific arch/*/include/asm/bitops.h, but I didn't
> find a clz function apart from one for arch=3Darc.
>=20
> > > > On 32bit a check for a >> 32 | b >> 32 before the multiply might be=
 sane.   =20
> > >=20
> > > Not 100% sure I'm following. `a >> 32 | b >> 32` is just an indicator
> > > that a * b fits into an u64 and in that case the above check is the
> > > better one as this also catches e.g. a =3D (1ULL << 32) and b =3D 42.=
 =20
> >=20
> > That is to optimise the multiple as well as the divide.
> > It is also a very cheap test. =20
>=20
> OK, so we have:
>=20
> 	                                 `a >> 32 | b >> 32` | `fls64(a) + fls64=
(b) <=3D 64`
> 	cheap                          |          =E2=9C=93          |          =
   =E2=9C=93

fls() isn't always cheap.
x86 has had bsr since the 386, but I don't remember seeing it in arm32 or p=
pc.
The 'a >> 32 | b >> 32' is very cheap on 32bit.

> 	allows to skip multiplication  |          =E2=9C=93          |          =
   =E2=9C=93
> 	allows to skip 128bit division |          =E2=9C=93          |          =
   =E2=9C=93
> 	catches all skip possibilities |          x          |             =E2=
=9C=93
>=20
> > > > > > And please explain how it can be the same as checking 'n_hi =3D=
=3D 0'.     =20
> > > > >=20
> > > > > This question still stands.   =20
> > > >=20
> > > > 'ni_hi =3D=3D 0' is exactly the condition under which you can do a =
64 bit divide.
> > > > Since it is when 'a * b' fits in 64 bits.
> > > >=20
> > > > If you assume that most calls need the 128bit product (or why use t=
he function)
> > > > then there is little point adding code to optimise for the unusual =
case.   =20
> > >=20
> > > n_hi won't be zero when the branch
> > >=20
> > > 	if (ilog2(a) + ilog2(b) <=3D 62)
> > > 		return div64_u64(a * b, c);
> > >=20
> > > wasn't taken? =20
> >=20
> > Right, but you can remove that test and check n_hi instead.
> > The multiplies are cheap compared to the divide loop.
> > (Especially when uint128 exists.) =20
>=20
> But you can check n_hi only after you completed the multiplication, so
> checking `ilog2(a) + ilog2(b) <=3D 62` (or `fls64(a) + fls64(b) <=3D 64` =
or
> `clz(a) + clz(b) >=3D 64`) sounds like a good idea to me.

Depends on how much of the time you think the multiply is needed.
If it is needed most of the time you want to do it first.
If it is hardly ever needed then the initial check is likely to be a gain.

	David

>=20
> > I also think you can do a much better divide loop (for many cpu).
> > Shift 'c' so that clz(c) is 32.
> > Shift 'n_hi/n_lo' so that clz(n_hi) is 1.
> > Do a 64 by 32 divide and remainder (probably about 32 or 64 clocks).
> > If bits of 'c' were discarded multiple and subtract (with overflow chec=
k).
> > 'Rinse and repeat' with the remainder.
> > Build the quotient out of all the partial values. =20
>=20
> I let this for Nicolas to reply. I guess he is much more into these
> details than me.
>=20
> Best regards
> Uwe

