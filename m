Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B97E198E75
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660524; cv=none; b=JPQYHphaZPB2mO25YkESkEpWztzm2Gsa8XUjCPMqbAbpm+kuqbBxvwTaVrtHKCsqSdQCIuozew5pa8/f1jCoT6xAqPOIgH084JDduoX7De0cDlzNbZVZbPtCJKgvCITrseDobM+PdaHbNMsCHSeONwBPftRM/bqqInfp+Nmy/0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660524; c=relaxed/simple;
	bh=kSXHyaGkKCfT3DWWEDAff/JBbBKpI4DWn9x2YuyszIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sotBTgPgHuTDtDblS6hSguZOjxUxttYi+G4HYVUBkwOF6kG6X7YxhDEfftrUltFevWY6TFwZHPmh743T9rqfWd8ndVLAmiWQ81g+aN7IsV/fJlKUMmM/9/58zFGyVq9AU3MdWJnwgCXVKuXl0DfNQO+P4gvJk2e/J4ZMG5bkqeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v2Lij/5f; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v2Lij/5f"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abf3d64849dso69006666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 23:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743660519; x=1744265319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8wUfXthro4dK9Vk6W7jH0ILqAhuBvllRgp+IHiV0uMY=;
        b=v2Lij/5fu1qoxinN5hi2kc99ppEBhuK9LrD4LCL1ZThye16vWBrTactnZbWYJWs1NY
         UMLFZpE+m3pRgTJEwtWiOA1+GChQ+eZ87gM22mRDgQ3d+PQ0X5q2renJZQ5YFqUNGP0K
         8/WWsQiRtvng/sHScgZr8FXasE++QFH5Z/BiPDnftEUCvAGJwrm4qs5MAVUaYY7GZi8V
         0ZgSQySEPvHMZZ2wfwxBsy5AcZsbr+i9Kly5zSKBE89NeysU31+hbKBW1nFL8sUbqxOt
         nvWaP0bdw9ehqz0e6SigIQibtmRpZaECx7OVo6VRt3v5d9UIxRrKchhOrsCOaK7oZZph
         INXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743660519; x=1744265319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wUfXthro4dK9Vk6W7jH0ILqAhuBvllRgp+IHiV0uMY=;
        b=t5lwgU4H4p6Jb9+Nd7rwCsUjVm6p5oBMDAiOE0CKw0En+XoCoF3alHw4PagHTXIyTR
         sIu7HQFYV/kp13KYp+98jcmQGEYA2SJgfLm4H386BdZO90KNqDcEZvrjUThwz0HsyRx0
         SiLxtgRHFyP3e+r9p8u0eZlO5ez1zjBLWHStrywUEDU5pZs1DbDWzpmGHUQwoom/rPC1
         b3I9qyKnUNCUq0BRXYLJQUN/oMyEEpVUfZHJ//Eg+f1nZZWBQZhj71AXm8U818qd9M7R
         em0dyHDj+2OtgrHKJq9hMt6TA2mWsylJSgwinMrnPx7YX8tKKKbLLANUX6GY4TrDoTGI
         II3A==
X-Forwarded-Encrypted: i=1; AJvYcCWziPLSYy4sAoAKvk/RpK4xmuz3mESotgQf+6vqnizuQECfn09wjy52qyKhL7q7PGUQCvd9DvHOhKIdiC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqUo+HHPSAeYYUyhGkeL/15gNHdokVcIicCH8XCfGp7YpwnE+T
	FB7w/3fd9kkUGMW1+nzLOJ7de0H9QVu3Z/LPz2dp6oQPJbXDJt6zbjMLqEIZ2Xg=
X-Gm-Gg: ASbGnctyn80M+7GdgE8KdB8oPewzQCpyclhTlFkkfn5udCjSmXYZ4mWy3CGRZ8xtBm2
	A+6m5jqFyCsuLJ16qZBfde1zYF6mlchUYx7I+F02OYkYo/fbkgQALTVeP3I2Z1qX3GcO39EunHZ
	07L2dcrlnpxshoQKTP9GpALexPfb6XWWGhEyhSMU1KKRyOJiVaVs5Pi+ZqxutY25m8W0X01qy7S
	EySf4AjkoHcydBzER2oePc139JNNrVtJQxVwHQSn3KK291cJ2CH6fZrCbPdMlsjMYDNjD2vnZJ4
	EULi2hFt7nAeyLfcZYByMF+qsGi0oa8E7r5j0p5mjCx8pCrfJw==
X-Google-Smtp-Source: AGHT+IEWIoJqC3AqaGR73OI0CxR+LNG2PKoXsB8WFJ7lYRoRR+OC++EgaVRIGYf+L55z2w+ND8PWYg==
X-Received: by 2002:a17:907:1b16:b0:ab7:6606:a8b9 with SMTP id a640c23a62f3a-ac7bc23444dmr134346466b.42.1743660519001;
        Wed, 02 Apr 2025 23:08:39 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfe5c45asm39166266b.1.2025.04.02.23.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 23:08:38 -0700 (PDT)
Date: Thu, 3 Apr 2025 08:08:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <iz5kp75bwhesaw7kxga7rq7m4oahl3wasnfrdrtxukpivhvy5g@3scc5272aybh>
References: <20250331195357.012c221f@pumpkin>
 <mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
 <20250401202640.13342a97@pumpkin>
 <15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz>
 <46368602-13n7-s878-s7o2-76sr0q67n9q4@syhkavp.arg>
 <20250401223731.7102103d@pumpkin>
 <2wwrj6aid2elnnotzfkazierqmzmzpfywyf33ahqs36xh5xz32@rszeetrztsiz>
 <20250402135219.28b24e94@pumpkin>
 <gqqxuoz5jfrlsmrxdhwevfo7kflxjqhbkfy2ksnsdcadbk52hd@yaitrauy52xg>
 <20250402215919.2b933752@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s3w3cnm76xj7iuqh"
Content-Disposition: inline
In-Reply-To: <20250402215919.2b933752@pumpkin>


--s3w3cnm76xj7iuqh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
MIME-Version: 1.0

On Wed, Apr 02, 2025 at 09:59:19PM +0100, David Laight wrote:
> On Wed, 2 Apr 2025 17:01:49 +0200
> Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:
>=20
> > Hello David,
> >=20
> > On Wed, Apr 02, 2025 at 01:52:19PM +0100, David Laight wrote:
> > > On Wed, 2 Apr 2025 10:16:19 +0200
> > > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:
> > >  =20
> > > > On Tue, Apr 01, 2025 at 10:37:31PM +0100, David Laight wrote: =20
> > > > > On Tue, 1 Apr 2025 16:30:34 -0400 (EDT)
> > > > > Nicolas Pitre <nico@fluxnic.net> wrote:
> > > > >    =20
> > > > > > On Tue, 1 Apr 2025, Nicolas Pitre wrote:
> > > > > >    =20
> > > > > > > On Tue, 1 Apr 2025, David Laight wrote:
> > > > > > >      =20
> > > > > > > > Looking at the C version, I wonder if the two ilog2() calls=
 are needed.
> > > > > > > > They may not be cheap, and are the same as checking 'n_hi =
=3D=3D 0'.     =20
> > > > > > >=20
> > > > > > > Which two calls? I see only one.     =20
> > > > > >=20
> > > > > > Hmmm, sorry. If by ilog2() you mean the clz's then those are ch=
eap. Most=20
> > > > > > CPUs have a dedicated instruction for that. The ctz, though, is=
 more=20
> > > > > > expensive (unless it is ARMv7 and above with an RBIT instructio=
n).   =20
> > > > >=20
> > > > > The code (6.14-rc6) starts:
> > > > >=20
> > > > > u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> > > > > {
> > > > > 	if (ilog2(a) + ilog2(b) <=3D 62)
> > > > > 		return div64_u64(a * b, c);
> > > > >=20
> > > > > Now ilog2() is (probably) much the same as clz - but not all cpu =
have it.
> > > > > Indeed clz(a) + clz(b) >=3D 64 would be a more obvious test.   =
=20
> > > >=20
> > > > Ack, the more intuitive check might be
> > > >=20
> > > > 	if (fls64(a) + fls64(b) <=3D 64)
> > > >  		return div64_u64(a * b, c);
> > > >=20
> > > > then, but maybe "intuitive" is subjective here? =20
> > >=20
> > > Depends on whether you grok 'clz' or 'fls' :-) =20
> >=20
> > And it also depends on the availability of the respective functions.
> > There is a fls64 function provided by include/asm-generic/bitops/fls64.h
> > and in several arch-specific arch/*/include/asm/bitops.h, but I didn't
> > find a clz function apart from one for arch=3Darc.
> >=20
> > > > > On 32bit a check for a >> 32 | b >> 32 before the multiply might =
be sane.   =20
> > > >=20
> > > > Not 100% sure I'm following. `a >> 32 | b >> 32` is just an indicat=
or
> > > > that a * b fits into an u64 and in that case the above check is the
> > > > better one as this also catches e.g. a =3D (1ULL << 32) and b =3D 4=
2. =20
> > >=20
> > > That is to optimise the multiple as well as the divide.
> > > It is also a very cheap test. =20
> >=20
> > OK, so we have:
> >=20
> > 	                                 `a >> 32 | b >> 32` | `fls64(a) + fls=
64(b) <=3D 64`
> > 	cheap                          |          =E2=9C=93          |        =
     =E2=9C=93
>=20
> fls() isn't always cheap.
> x86 has had bsr since the 386, but I don't remember seeing it in arm32 or=
 ppc.

I don't know about ppc, but arm32 has a clz instruction. With the
definition of fls64 for BITS_PER_LONG =3D=3D 32 in
include/asm-generic/bitops/fls64.h:

	static __always_inline int fls64(__u64 x)
	{
		__u32 h =3D x >> 32;
		if (h)
			return fls(h) + 32;
		return fls(x);
	}

and fls from include/asm-generic/bitops/builtin-fls.h:

	static __always_inline int fls(unsigned int x)
	{
		return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
	}

I'd claim this qualifies for "cheap". Agreed, it's still more expensive
than a >> 32 | b >> 32, but its result is also better. I guess we cannot
judge without a deeper analysis and profiling and a guess about likely
values of a and b.

[Side note: gcc also has a __builtin_clzll which might be a good fit to
implement fls64.]

> The 'a >> 32 | b >> 32' is very cheap on 32bit.
>=20
> > 	allows to skip multiplication  |          =E2=9C=93          |        =
     =E2=9C=93
> > 	allows to skip 128bit division |          =E2=9C=93          |        =
     =E2=9C=93
> > 	catches all skip possibilities |          x          |             =E2=
=9C=93
> >=20
> > > > > > > And please explain how it can be the same as checking 'n_hi =
=3D=3D 0'.     =20
> > > > > >=20
> > > > > > This question still stands.   =20
> > > > >=20
> > > > > 'ni_hi =3D=3D 0' is exactly the condition under which you can do =
a 64 bit divide.
> > > > > Since it is when 'a * b' fits in 64 bits.
> > > > >=20
> > > > > If you assume that most calls need the 128bit product (or why use=
 the function)
> > > > > then there is little point adding code to optimise for the unusua=
l case.   =20
> > > >=20
> > > > n_hi won't be zero when the branch
> > > >=20
> > > > 	if (ilog2(a) + ilog2(b) <=3D 62)
> > > > 		return div64_u64(a * b, c);
> > > >=20
> > > > wasn't taken? =20
> > >=20
> > > Right, but you can remove that test and check n_hi instead.
> > > The multiplies are cheap compared to the divide loop.
> > > (Especially when uint128 exists.) =20
> >=20
> > But you can check n_hi only after you completed the multiplication, so
> > checking `ilog2(a) + ilog2(b) <=3D 62` (or `fls64(a) + fls64(b) <=3D 64=
` or
> > `clz(a) + clz(b) >=3D 64`) sounds like a good idea to me.
>=20
> Depends on how much of the time you think the multiply is needed.
> If it is needed most of the time you want to do it first.
> If it is hardly ever needed then the initial check is likely to be a gain.

It also depends on the costs of the two checks. If they are similar,
doing the early check is better.

Anyhow, this discussion is quite a bit away from what I want to achieve.
My objective is to drop the local implementatino of
mul_u64_u64_div_u64_roundup() from the pwm-stm32 driver. So I suggest we
either add my suggested mul_u64_u64_div_u64_roundup() now or you care
about adding an optimized variant of it (in a timely manner is
welcomed).

Best regards
Uwe

--s3w3cnm76xj7iuqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfuJeIACgkQj4D7WH0S
/k7rgQgAoKkC/2hG+TjG/Re73zG/peBrwiZlA3nRUPRc0qujUlHnTXBGzjBQGdJy
98+JI4DTqEGBTw/CCXjsD4Dq3hVYExcjuO9ckZ6Oqn9KTCby77Y/XfukjGp2DYsb
BP7AJDfeIHidz52zyCYigOCnPT4cHhydbr48RqsFa22fad/zn2kol+JJ8NyP/mBb
z2hKfe+s5XlyWJ9aLhUTX1k3TwdijKLsdsqbQIJp6NdsU2RjDpJUNNvc0EhFJ5NO
Y5FcQGABUgmOxmalTnfuYeUgaMV1RETWRDI/ybqNyviMCM8928+1QEEB1KcEe5Js
iG2hxsLSIevAv+Zb8RadeSuLJtQiqQ==
=cK3w
-----END PGP SIGNATURE-----

--s3w3cnm76xj7iuqh--
