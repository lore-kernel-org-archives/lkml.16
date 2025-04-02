Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C88136E37
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606117; cv=none; b=aZf4P5lQX6jtNB6wGdTroWFjginYnvRUCH31TM97Jg0Loto92rjhNx3+enVlBkLY/C8YAhM/NEsKU8yCmmuRQ7UJ6029zt+RaqMqZGx+ETOX0q0RhkiEp2DkOPqSNsw5uKLfIBwAo2b8N0Y4qzCc/Vjl71s4QrlaSFL7fPc6A0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606117; c=relaxed/simple;
	bh=OTBPEmky/BTNf+rmZDohe12LjIdR+gH1TvhsyyOVRAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvbuj1Sn4LpEW+thVuxTI/C7svKm7mtWO8xLYR/4ErTOHuLI5MXpMj9EAk8VhBDNVief4ajd6n9h3MClMuVLw+Xl254/i+TzmI/uN7MCbrHYH0HgSMo6elSDzf4RPf+fyHofJmm7inkmASMIbBbprLgLQQfuvukml7Y+q6M6zPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UHW4rmc9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UHW4rmc9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3996af42857so733650f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743606112; x=1744210912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=88iKdiOHQ3gcEEN6FDSqbnC4adVDiuqR0v+j+P9kRD0=;
        b=UHW4rmc9YTEQfaJPkgpQRYvyCgO5GbY23m1o6MEKgtanWMOlb+LRYpFfyNQDqfMPH8
         cFmy+RZ76iomYxilDBQ7b+GNKTM5GrVKqSPCtx45L8S/29b+pLSl4FwPgVS5YUKx6x0+
         oQkmNp8ZJ3J+G1oNAatKOMtO2Ta8Cn4KGW1MgKNX+DWC5uYi7puezB7xfQl3mF4avNfH
         +qlxWymf7SPvFc0njOYjbZccNoHZJLu9Iwpfw2MrXNxB3xSFRwFCITXkC4D7n3vOQxQQ
         ZZqcqwYioDKwrRlzHpieDaw2hxumcANK9rbi2WejrmP97iv7x1+WNpnyHWz3y7OsTHcm
         mCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606112; x=1744210912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88iKdiOHQ3gcEEN6FDSqbnC4adVDiuqR0v+j+P9kRD0=;
        b=bvOyBl+lCTpZEunCseEa7ylMWR8bmK5Uf7i82ly8ifqjtF7ckAFcCQrrx10mODbFYK
         3g9kaRj9hFcufiDSF1rxS3Lh5DhU7OO8Tfqh9iAHLf5y1s7R1WXlFi1GennklT/9BSRz
         NwiMKd+C978ggrYKjobOxBLaWyUyv01P88B634thv3AaC4J2W6z+nw7O5aim/dsg8Mvx
         6ocvjl6/xChVH/ChvV7U+rw603I5Xbi9A4MA7FXv1nQb9cojjSUh21l5f8kPbOzerU27
         hFWx0Nye0El9y9VzTUxEQLIc5gYcOnDWCWJORM61cbtJq31rQ1lNzVcgVAL52FwBj8RC
         +sYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7bAx9+dH59I88XHaMQ6zAUSAGcE6BuxU9k0KXVhIZSAirziPIdG/lTNrDLHBTiBUOjI3qcwYs/F057Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyjjaDZQwai+p79UMiFbaFq8zMW+PbEIMHA+vHQJV1KJKiySJj
	HQXU/+N9iTbYHdHaMaKUnprExaGUvZ78sgfq2vYw0bGJW0/JWTpq34pFxLQR90k=
X-Gm-Gg: ASbGnctbj83HpHUJgDgXDZ6bDnkRhFokvfMg2nd5myYcti5rEoCfdW5Ah6T82OiIG3r
	6OfZHkmvx444Dqfp1iNp7lAi2i1fdC9pFVUtunZPph9dmQIBkqe769czwoAzbruTIMucskMou5J
	FWMf1p5dsiD2fZNFKHS5hgdXXgYQHY13rfXHLtOMFiUIjNi+4T9ciSiOqRsCpcKrxS26TGYQGOB
	uN9X6m3Xm7orw1l6WpPsjuwgx9Gb+ZA+fak9Azmexc+Eruy+8ONj1F7nVjT/kWGoIgp6DvI5lr4
	pLsGKPbVn4ZOKeEdrnSnhGzSnzOB6rZuo/yJIbeQxNJupSqEQKHhdQV2KOFJoPOR1pWUKCGcv14
	wQvGxcLZxXTY=
X-Google-Smtp-Source: AGHT+IHcvYyxlwIb5j1WSig1A8jIeb3CU8M0Sc/J4YoZHbee5I+aelSJJLREyt7vsxJtl8cprcEaUw==
X-Received: by 2002:a05:6000:4308:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-39c2a6764d6mr2282909f8f.13.1743606111479;
        Wed, 02 Apr 2025 08:01:51 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b66a8d4sm17102913f8f.45.2025.04.02.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:01:50 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:01:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <gqqxuoz5jfrlsmrxdhwevfo7kflxjqhbkfy2ksnsdcadbk52hd@yaitrauy52xg>
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nsqb2uewlg4x42qe"
Content-Disposition: inline
In-Reply-To: <20250402135219.28b24e94@pumpkin>


--nsqb2uewlg4x42qe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
MIME-Version: 1.0

Hello David,

On Wed, Apr 02, 2025 at 01:52:19PM +0100, David Laight wrote:
> On Wed, 2 Apr 2025 10:16:19 +0200
> Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:
>=20
> > On Tue, Apr 01, 2025 at 10:37:31PM +0100, David Laight wrote:
> > > On Tue, 1 Apr 2025 16:30:34 -0400 (EDT)
> > > Nicolas Pitre <nico@fluxnic.net> wrote:
> > >  =20
> > > > On Tue, 1 Apr 2025, Nicolas Pitre wrote:
> > > >  =20
> > > > > On Tue, 1 Apr 2025, David Laight wrote:
> > > > >    =20
> > > > > > Looking at the C version, I wonder if the two ilog2() calls are=
 needed.
> > > > > > They may not be cheap, and are the same as checking 'n_hi =3D=
=3D 0'.   =20
> > > > >=20
> > > > > Which two calls? I see only one.   =20
> > > >=20
> > > > Hmmm, sorry. If by ilog2() you mean the clz's then those are cheap.=
 Most=20
> > > > CPUs have a dedicated instruction for that. The ctz, though, is mor=
e=20
> > > > expensive (unless it is ARMv7 and above with an RBIT instruction). =
=20
> > >=20
> > > The code (6.14-rc6) starts:
> > >=20
> > > u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> > > {
> > > 	if (ilog2(a) + ilog2(b) <=3D 62)
> > > 		return div64_u64(a * b, c);
> > >=20
> > > Now ilog2() is (probably) much the same as clz - but not all cpu have=
 it.
> > > Indeed clz(a) + clz(b) >=3D 64 would be a more obvious test. =20
> >=20
> > Ack, the more intuitive check might be
> >=20
> > 	if (fls64(a) + fls64(b) <=3D 64)
> >  		return div64_u64(a * b, c);
> >=20
> > then, but maybe "intuitive" is subjective here?
>=20
> Depends on whether you grok 'clz' or 'fls' :-)

And it also depends on the availability of the respective functions.
There is a fls64 function provided by include/asm-generic/bitops/fls64.h
and in several arch-specific arch/*/include/asm/bitops.h, but I didn't
find a clz function apart from one for arch=3Darc.

> > > On 32bit a check for a >> 32 | b >> 32 before the multiply might be s=
ane. =20
> >=20
> > Not 100% sure I'm following. `a >> 32 | b >> 32` is just an indicator
> > that a * b fits into an u64 and in that case the above check is the
> > better one as this also catches e.g. a =3D (1ULL << 32) and b =3D 42.
>=20
> That is to optimise the multiple as well as the divide.
> It is also a very cheap test.

OK, so we have:

	                                 `a >> 32 | b >> 32` | `fls64(a) + fls64(b=
) <=3D 64`
	cheap                          |          =E2=9C=93          |            =
 =E2=9C=93
	allows to skip multiplication  |          =E2=9C=93          |            =
 =E2=9C=93
	allows to skip 128bit division |          =E2=9C=93          |            =
 =E2=9C=93
	catches all skip possibilities |          x          |             =E2=9C=
=93

> > > > > And please explain how it can be the same as checking 'n_hi =3D=
=3D 0'.   =20
> > > >=20
> > > > This question still stands. =20
> > >=20
> > > 'ni_hi =3D=3D 0' is exactly the condition under which you can do a 64=
 bit divide.
> > > Since it is when 'a * b' fits in 64 bits.
> > >=20
> > > If you assume that most calls need the 128bit product (or why use the=
 function)
> > > then there is little point adding code to optimise for the unusual ca=
se. =20
> >=20
> > n_hi won't be zero when the branch
> >=20
> > 	if (ilog2(a) + ilog2(b) <=3D 62)
> > 		return div64_u64(a * b, c);
> >=20
> > wasn't taken?
>=20
> Right, but you can remove that test and check n_hi instead.
> The multiplies are cheap compared to the divide loop.
> (Especially when uint128 exists.)

But you can check n_hi only after you completed the multiplication, so
checking `ilog2(a) + ilog2(b) <=3D 62` (or `fls64(a) + fls64(b) <=3D 64` or
`clz(a) + clz(b) >=3D 64`) sounds like a good idea to me.

> I also think you can do a much better divide loop (for many cpu).
> Shift 'c' so that clz(c) is 32.
> Shift 'n_hi/n_lo' so that clz(n_hi) is 1.
> Do a 64 by 32 divide and remainder (probably about 32 or 64 clocks).
> If bits of 'c' were discarded multiple and subtract (with overflow check).
> 'Rinse and repeat' with the remainder.
> Build the quotient out of all the partial values.

I let this for Nicolas to reply. I guess he is much more into these
details than me.

Best regards
Uwe

--nsqb2uewlg4x42qe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmftUVoACgkQj4D7WH0S
/k6tCgf+Oa4P61tJ/TsyWqVHG4fDLNyJ3bOl4kBkOu8luFhvF5Gz7ehXZXdKIWny
9cuERIMmt4MvZHv/YOqYJSV0dXmTu3ausMgVwWWgz+AxIBb3iGdzYhW+evx0nf4d
yRjSELcb6cWJAVoTzV9ZmULGGoldpPdGXi11KeTj+UfEz9l+lLTqLr/g+cZNrGhl
BZVelHew9tCkHZIimUZQ/qAg27VUbirWbhBI9Of7livB2hChmJXxtqPjCjU68kt5
O/uirPciZObR8KnCrJTfMq7MUc0hM9Xmnk87YP5I22RChhZDJST4q1LOCTyemCpX
ra3pDpmY8cC+AfBj+Xxaxu+aAyrGAA==
=uWyp
-----END PGP SIGNATURE-----

--nsqb2uewlg4x42qe--
