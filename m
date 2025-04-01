Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A511E5B94
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492325; cv=none; b=YrIG99t+/0ZrSeIuDfE6FC/vfxUHKh9zOjRkvdwud8xKjY+Kh07Fi5YpZvL7Yr6tByEey0tqG33ZtjcO7uv5QF+EYsjpizPW/BG6uNAzLk6Gh3VaiRq9XQINfokS/zHiVlZ+m1cvAWpnEPkjpPcsLBhE+m8EOBXtZzhqBDmghtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492325; c=relaxed/simple;
	bh=oUgLk0T0+9XUlRc13YxuDmKvavmsaqZd/Cdxw4zhmLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3yenZPyZg9Uoksln84w3ipZ141tVINLajoHLb6p1S3ulerwi9zHJLaZwElETKDcJ0EsFuIHydulGAuqO4zzyBpYkS6QB2m+gf3Vwlzb/Y4cCa/1uPYr8vhPOJgifwOJEDv76T4NM1653S0d4o2oOpmdzelFSxfFjZAqwH7mPtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RVt5MOHK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RVt5MOHK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913958ebf2so3964597f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743492320; x=1744097120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rasrQrmInQLoUihfoYT1llqkSnscf3ggf8u4xgx8Pmc=;
        b=RVt5MOHKl7ApT9Vwnmt9E2YSSjeMpNQ2C97g9Dnw/gHgU2IsZZEVByoGkUDtCCSmER
         TqYjnOTpJbVCcVTDJi/t5olAS/JVr6jFMbUzrQ5NSp5vjZp0iACuHwazyCZ3LNAeGab0
         Fgrk+dHXJVL63AjQKqlzICyNwGgkmKk1mAxl+PnBtmB7dJMQz++/c6HO/5AjCEVu9YbM
         nXXFIwhTeY6znt1RA3AYeiNosDPlxMVibqv4jN92iZmx206KDhkqCegie3iaPkCXmBlZ
         g9Ur/an+IKEWU7sT9LTvqL5tjIoirO6YnwlN7F5X2ne40ii6oHM/pC4RdBqoKgxUR3Dr
         Gouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743492320; x=1744097120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rasrQrmInQLoUihfoYT1llqkSnscf3ggf8u4xgx8Pmc=;
        b=N05cgvEmn7PnMM8i9k9P7oYlgjUlhgcfL0uiXBrARdVtGu1gYdWggZ4WLfNMqgNPBu
         Jw45fsxhMzk+RnQaWwwO1jPzDDh1YMqp5urNLyNLNwg9dsTq1MlwsrJTUM1rTMqgFMwU
         rZdQEuL4m/yPAxkZ8cJ7LKQDQgMAG3xBol7TOpuYNHAvuuQXHeHVVx4Al2CA6GHj1AzN
         DOXknsotaBBpmF6qP1W2xlh9+NZw6dGgjCpfOEnNgTFD/oBGa37cneogtMGeVwTWyiGD
         itCwwDoM8NDzn3LGV4LKARpXVRpcg9NEixL6UZIakpgRe5u3s9aze6ia1Vv27axmFy6q
         nkbg==
X-Forwarded-Encrypted: i=1; AJvYcCVsWRwvuhh822An2yAuCQ4x50SwP1JsXsFkUVtAQRPry2u38JcJU6vERssX+1ACjZrcUTcTbuvyTAAa3Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/HQdAYOyUgLhd++glCA1w64iofKPvFbzzV0FdP9EyMO8ECIWw
	QxnCRKoXlmIMAKqlM99Bf0DWubTpegi7xZfRouCI6MVK3CEiJVeKkgebPJVmxso=
X-Gm-Gg: ASbGncuwhz7X5IAyzlP08Y1cmMmEj4ANIQolGxsk2hJDXsgMZPDVc766/F3EnduwWe2
	0rSJtfPPqKJ98bbI6h/782rqs6lHMpOvaybQo9qPeEaCYsxqxdtRW8HUVT9XOZuHRIWJbPuA5iB
	70G61dzCaVGAB6cLChPrOUOyUYroYjqF+YESAiKE/vfo+m5WsK7ofeLPZD0D5jcwLbI5goDae/8
	1vCxxBs9OC/1zI8B3gNaMPlNTmb1fO3glQfe3jzTtVVdkTSqx6dix9Oe3Um+I6s+VaCYNk6hdcz
	pblL4aO+e8O9/QaG3c9rdY/fKNAugqwGNTRTiuq5fzg6XAkt1k0VsYTtto/nV9gPN6Ya4qOsTIR
	AZlSJiAgwxFg=
X-Google-Smtp-Source: AGHT+IE5c1aS1Pug0+YxJmybCuz5v9xw0s4muAN6SLTs/b/OI+ydm7k5L6O53MXn6Y4nx9BozVSR7g==
X-Received: by 2002:a05:6000:2484:b0:39c:13fa:3eb with SMTP id ffacd0b85a97d-39c13fa059emr8762697f8f.39.1743492319889;
        Tue, 01 Apr 2025 00:25:19 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b79e136sm13388056f8f.67.2025.04.01.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 00:25:19 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:25:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com>
 <20250321131813.6a332944@pumpkin>
 <epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
 <20250331195357.012c221f@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hldtulodfgamphul"
Content-Disposition: inline
In-Reply-To: <20250331195357.012c221f@pumpkin>


--hldtulodfgamphul
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
MIME-Version: 1.0

Hello David,

On Mon, Mar 31, 2025 at 07:53:57PM +0100, David Laight wrote:
> On Mon, 31 Mar 2025 18:14:29 +0200
> Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> wrote:
> > On Fri, Mar 21, 2025 at 01:18:13PM +0000, David Laight wrote:
> > > On Wed, 19 Mar 2025 18:14:25 +0100
> > > Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> wrote:
> > >  =20
> > > > This is needed (at least) in the pwm-stm32 driver. Currently the
> > > > pwm-stm32 driver implements this function itself. This private
> > > > implementation can be dropped as a followup of this patch.
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > > > ---
> > > >  include/linux/math64.h |  1 +
> > > >  lib/math/div64.c       | 15 +++++++++++++++
> > > >  2 files changed, 16 insertions(+)
> > > >=20
> > > > diff --git a/include/linux/math64.h b/include/linux/math64.h
> > > > index 6aaccc1626ab..0c545b3ddaa5 100644
> > > > --- a/include/linux/math64.h
> > > > +++ b/include/linux/math64.h
> > > > @@ -283,6 +283,7 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mu=
l, u32 divisor)
> > > >  #endif /* mul_u64_u32_div */
> > > > =20
> > > >  u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
> > > > +u64 mul_u64_u64_div_u64_roundup(u64 a, u64 mul, u64 div);
> > > > =20
> > > >  /**
> > > >   * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor r=
ounded up
> > > > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > > > index 5faa29208bdb..66beb669992d 100644
> > > > --- a/lib/math/div64.c
> > > > +++ b/lib/math/div64.c
> > > > @@ -267,3 +267,18 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> > > >  }
> > > >  EXPORT_SYMBOL(mul_u64_u64_div_u64);
> > > >  #endif
> > > > +
> > > > +#ifndef mul_u64_u64_div_u64_roundup
> > > > +u64 mul_u64_u64_div_u64_roundup(u64 a, u64 b, u64 c)
> > > > +{
> > > > +	u64 res =3D mul_u64_u64_div_u64(a, b, c);
> > > > +	/* Those multiplications might overflow but it doesn't matter */
> > > > +	u64 rem =3D a * b - c * res;
> > > > +
> > > > +	if (rem)
> > > > +		res +=3D 1; =20
> > >=20
> > > Ugg...
> > > 	return (((unsigned __int128_t)a * b) + (c - 1)) / c;
> > > nearly works (on 64bit) but needs a u64 div_128_64() =20
> >=20
> > Both mul_u64_u64_div_u64_roundup() and mul_u64_u64_div_u64() would not
> > be needed if we had a 128 bit type and a corresponding division on all
> > supported architectures.
>=20
> True, but the compiler would be doing a 128 by 128 divide - which isn't
> needed here.
>=20
> But you can rework the code to add in the offset between the multiply
> and divide - just needs a 'tweak' to mul_u64_u64_div_u64().

Yes, that would be a possibility, but I'm not convinced this gives an
advantage. Yes it simplifies mul_u64_u64_div_u64_roundup() a bit, in
return to making mul_u64_u64_div_u64() a bit more complicated (which is
quite complicated already).

With this patch applied and drivers/pwm/pwm-stm32.c making use of it we
have:

linux$ git grep '\<mul_u64_u64_div_u64\>' | wc -l
56
linux$ git grep '\<mul_u64_u64_div_u64_roundup\>' | wc -l
7

where 13 of the former and 4 of the latter are matches of the respective
implementation or in comments and tests, so ~14 times more users of the
downrounding variant and I don't want to penalize these.

Best regards
Uwe

--hldtulodfgamphul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfrlNIACgkQj4D7WH0S
/k6+sAf5AZeQVBqNTj0zkgrkp3KUfeDgK3xlqAe7GcdqncDlsqD6wbwMrz9sOu/y
g9wS/pSB4qKbe9f729uetFN7y8caHdqhczDSqbfxRUtYXmG7dwOQ10TDB76+4aFV
Xr0ZNBWM2PLThjuVtYU+w6Euppx0JrXFI0QrnxSyFLDmJ+qXwBxmeCljb9vvbxJU
hNEgPAiq++P0xWiYNtGvYfIUtN6Qu86BLjhRyXs1uHE2EPpLiN6H6FgdQ8i+18O4
zcajhNOKbXGOyFKmHCichnBZ8iPSndwvTWPLSEmSSYloyXHjI4FcqHz96nyaOrt7
cLi3UGn5oVN9GJj/a0paq5rrEMLF8w==
=+rCk
-----END PGP SIGNATURE-----

--hldtulodfgamphul--
