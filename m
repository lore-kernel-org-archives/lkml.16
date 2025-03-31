Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6B4212FAB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437677; cv=none; b=ad7NHOoHe9QUZKgz2sLkSwrnZvq6bs1ripbWOM2ofCmpBBDg5KQqaVSrFdOh0K/dLTwx9ASmdD9/zeMO7cbaGOsBfvRSshjQA0wIHehYTOMWQdyd55ZmVkPLbolIZfEAQ0cBAoBnQI1UlyOWYim1W75oiIWP2JbiglgrfILgFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437677; c=relaxed/simple;
	bh=vP0u1Q5LWXpCzGYzD7Lbwx+rdNOf53YHGtbqEh2/LcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KG4QjAHctDuiaxL9gcBWFDD9paN8HMgPLjzTp2+VtJmizcgIyae8WUKLzOfWNoXAB6igc8+a/q7H8F+wt7rQgCqmB0JBKeuF+Qb+rphe+ANd+Uq9rwLRKSEQfSRiesvbGTEye1OKa+0y+JFxygRDXuiuu+sH/L2O3dhxKAfFx3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mZKG2YgL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mZKG2YgL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4114102f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743437672; x=1744042472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z3sjV3N0xbmPIKFXj5fBvHjWa9fPCg8lbbmT/I7RtBI=;
        b=mZKG2YgL100TKkjEZW7aDYxqJCogxPPT66o5NyGd0QV13QhuQI8xPOoSvu3mmRTRO0
         WXs5Hee3M9qsWtmiY5Lbu1HAwVZkq5l84/V98jUPW8xus6fiCJxZYcUsceFb9nJlUVVl
         VwQeALFa4oU+9olnrOrkF8CABRFodTX6kBeVnxqSd38WDE8z86X/UPRSFom7UGSeAXvA
         aDWFWha2mtMxlkKgbr3BfkkL1ofvkKva6Ya6sDup2Lavv15EIMZZUxo2lAyomfUVn/nk
         sT140RlvDymc1Y5b0KMsUGQfHVIbtTt3qo29GD+p38IntWkHmMgZ4u+aLdD3mCiKDKgP
         3szQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437672; x=1744042472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3sjV3N0xbmPIKFXj5fBvHjWa9fPCg8lbbmT/I7RtBI=;
        b=P1eqjTA/FZyZbQsRfMQWUhXvirKJgEd/59UqXWT7XHs8PXKa+I41zrDxLTt8Vc3Uj/
         QA3LKphRmyfjCiLaj1iEj4a0WPjQXRj0Ae1VaCJOcb8ovEwy2S2/ZN5wLhZ/GZvQHqVi
         Qq2eTCbVOwCnEelw79eIfyE2/V/jJXDZ2aggvu2/zmd4bWzZ6RlpssW0jWPPcuPmjodO
         lBOs0BCgemsdVht1E++/p1ZNehSEykDxQnL0RNN7lOVsn2HUY2TLQJsaVRND5B49EmlZ
         tK6N1Vn6xgkYqm9Jput32z41kY5bfL4EZLmo09mOFIgwPo3umSi3m/z6BUj1J9OsFjAx
         j7zA==
X-Forwarded-Encrypted: i=1; AJvYcCUOqDyEmA6j382SF0KwLnFodiYrjUks203+s+ZCyg1l3WeEOWUuq/x7FOBcfo+d4mt3NZ+yGTvATB/iJHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6W54gFa9CCbX2RtOnMy+Wb6HWc7HXCmoXkFHFlOUzB3RMkrz5
	UsG8+otJZRfG5BjBTmqrNB0bJ+X6bBO9gQYBHMEVwjo5Oh052ds89GyCNi6KwEA=
X-Gm-Gg: ASbGncsQNJ9ytE97B2KjYvIVx9gE2G1eSvzkyFNRZdDE51Bgwc0GCYYl4mUtgNnrjGX
	/qPOHD4bzuwbUyMLA2cf6aFca+JHsvXf6E8+ASkca0wObUR/tkfGe/4B1ATTshaUIfmwCCgl633
	B/QcEfzO+pbdV8pD4CcN1cvHmn5ByJgzX9qhJ4UeJkVHvoe2T2s/wgxkb06kDBJPTU4uapk6owv
	y3/a+Za0s11keXKK5RQ07HJVZzsPPLq8ZBMWUUJlVW/G0A6+DxGgX30sOGS++yF9IovMkiTiYeJ
	21HYDvByPvE8a1k50qgFOdqUjy/Z2mUAwimlkZCp6ATi0T3lVie1/CyIAmBNOIP+EGVkXUz02Xn
	C28EugOOZPYg=
X-Google-Smtp-Source: AGHT+IFFSHNGA/Nh4o334lgzC+OZkNexnxkkevOyP1p/8qwteAUO+btTUVGDASlIKa9DDKKSh+AVKg==
X-Received: by 2002:a05:6000:2181:b0:39c:1257:cd41 with SMTP id ffacd0b85a97d-39c1257d4f0mr5016665f8f.59.1743437671810;
        Mon, 31 Mar 2025 09:14:31 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b6656a0sm11731555f8f.37.2025.03.31.09.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:14:31 -0700 (PDT)
Date: Mon, 31 Mar 2025 18:14:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nicolas Pitre <npitre@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com>
 <20250321131813.6a332944@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="chsgngpqzz5524fb"
Content-Disposition: inline
In-Reply-To: <20250321131813.6a332944@pumpkin>


--chsgngpqzz5524fb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
MIME-Version: 1.0

Hello,

On Fri, Mar 21, 2025 at 01:18:13PM +0000, David Laight wrote:
> On Wed, 19 Mar 2025 18:14:25 +0100
> Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> wrote:
>=20
> > This is needed (at least) in the pwm-stm32 driver. Currently the
> > pwm-stm32 driver implements this function itself. This private
> > implementation can be dropped as a followup of this patch.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> >  include/linux/math64.h |  1 +
> >  lib/math/div64.c       | 15 +++++++++++++++
> >  2 files changed, 16 insertions(+)
> >=20
> > diff --git a/include/linux/math64.h b/include/linux/math64.h
> > index 6aaccc1626ab..0c545b3ddaa5 100644
> > --- a/include/linux/math64.h
> > +++ b/include/linux/math64.h
> > @@ -283,6 +283,7 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u=
32 divisor)
> >  #endif /* mul_u64_u32_div */
> > =20
> >  u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
> > +u64 mul_u64_u64_div_u64_roundup(u64 a, u64 mul, u64 div);
> > =20
> >  /**
> >   * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor round=
ed up
> > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > index 5faa29208bdb..66beb669992d 100644
> > --- a/lib/math/div64.c
> > +++ b/lib/math/div64.c
> > @@ -267,3 +267,18 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> >  }
> >  EXPORT_SYMBOL(mul_u64_u64_div_u64);
> >  #endif
> > +
> > +#ifndef mul_u64_u64_div_u64_roundup
> > +u64 mul_u64_u64_div_u64_roundup(u64 a, u64 b, u64 c)
> > +{
> > +	u64 res =3D mul_u64_u64_div_u64(a, b, c);
> > +	/* Those multiplications might overflow but it doesn't matter */
> > +	u64 rem =3D a * b - c * res;
> > +
> > +	if (rem)
> > +		res +=3D 1;
>=20
> Ugg...
> 	return (((unsigned __int128_t)a * b) + (c - 1)) / c;
> nearly works (on 64bit) but needs a u64 div_128_64()

Both mul_u64_u64_div_u64_roundup() and mul_u64_u64_div_u64() would not
be needed if we had a 128 bit type and a corresponding division on all
supported architectures.

So given we're not in that situation, I wonder if Andrew is still
considering this patch or if someone else would pick up this patch?

Best regards
Uwe

--chsgngpqzz5524fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfqv2IACgkQj4D7WH0S
/k4WPgf/dMxbxjILjB7fwnpgCvp2JPx26IrBHrUrCKhfyVhjVWbeSZ3PNypPcxp9
QUamkKmYARTIRGgzs6rGuv4PrmOy0Sz1+bVXGKAXibb28peu3Y5NHY8Vdtuy+5FH
cG+NewRS8IZponlKC1gqx+xvRieW+OBphv7GBD2dmm2kDMhOJy+qPWSyrPPpsU4T
NvIyVQk2lLjUSDbGVJqsBZuQKUEwSavkde/Izro2fjRw3Myqzf11dEC4fscBuWud
oENHShLoUjWZ8vRS1Z15q8oEYjrwEz8ppFQ7NE55LHlhVkQSbumUOOEkvAcfLFwI
aW0XcnPChFpAQkDJbmAwfpBz9aXw6Q==
=bax1
-----END PGP SIGNATURE-----

--chsgngpqzz5524fb--
