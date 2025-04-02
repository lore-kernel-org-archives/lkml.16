Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A93F4E2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581786; cv=none; b=gzok508tpZ1mLfw0QxC2jWCXrfRkZHrdA1RerbDdzDe0Ln3UIBDB5HzNsSnYle4zQ+AXy8BcdKHRm4LzWaxNl0+2QKUTDPq0Kd/lMzuscHcSZO7dh3zhVg5112/NTlcWIkH7fEKcPzEBmmTaJmJRsPB5vdPTLSdFlNGdVoAm9J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581786; c=relaxed/simple;
	bh=2R08nNXH+ksS+D9gJQ6xeXHMkDiHQ4m12HD4ePibf4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqpaI3SsNBNY2+jx0rsW4uZ30JHYxnmyTZ+ZZS0434hoWX0SyhgnWJI3Hg/2WYGKXrRZcpM0SugLywKeePYLXIX4NR2K2YddC2ozmxLXelNTOMdiTMpLx+ORsKVFxUQngoeos6s3027nKgqGEWYf/nn9UawyscuAKQqwddW08HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JHnqy1AG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JHnqy1AG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso283490f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743581781; x=1744186581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDCwlpjL2w/BkhcAwGHexxF7aVltu/71lKFkhQsvmIw=;
        b=JHnqy1AGDxCode2zOSR5veA63EGTew85mCwoLWVHOuRcsY2bw27/sbIVYaC56JTKwC
         bQeAd2xzrVC5ACVtr21XCbuOX8ta+H6c7WBJEQ/6NNeuS/E5mWMJVdXhqZRgSgGZ5uA/
         jg0tZ3i2ApFzA3SCOKp9VThbcIskPeDZwN77fUjN6WeaCfdIFy9Dg0VvTrAUC3+Crq78
         +zvexr5aeTQzpXQILoTHnZ4hij6oUUK5/PC33c3KyX/L6TZV5d6jfP7vqMm21rmyJsfi
         VLth4k2u6XpB9sdayBX7NJGrN80qT5D1vQlyYed3j0Y/f8b1Olf4LWpXMErz07LmQwxo
         Id9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581781; x=1744186581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDCwlpjL2w/BkhcAwGHexxF7aVltu/71lKFkhQsvmIw=;
        b=THuFDKq6aHPp0OdQIZbckOgTOYOvUHP4Amum3zV4RCdathR0Uy40Wuad43eTUwcY1F
         0wTLq/g96Giv9wBUOJLZCdFixLOfN+NauKnZ6ch8aqKOYaMlxPJV1nXSAopaMgbBUySW
         LAao25kDYIE4/So1f56GeC+jiAJ8c1bxyFXrSx9BhnvR8hCwF9vo0+kkg7Puk8EEGf0+
         F9p4oN9LnyGxn1l6THVJqHeqjAsD/i5EGi7V28u8P56RUFnCzmOEawk0sHVeGm6LYTOD
         LywZuR1msJHYBkP3h4JMhAW00iYzibyHrS5/ObXyhcubQL/j/7rCStK/hZAjuXZ5OMIS
         2WfA==
X-Forwarded-Encrypted: i=1; AJvYcCVujNpZsaanPjD7+KYd0rthuZRdgkhT9NZmdFgnnq4fHNIenrPi72lhstB1n64k27YctbbqufT85ktKrrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFtfjpGDbq438hqGAjnNtn8Ax8y+eYX3kmCThYfQMObiIQnFo
	z4G+aRoT6bUnvNIUXWdXJf75NV1IqFbZBr0WwJgLxRDf3IMo1IXYknCcA98bVriXHYtWtMnjfMt
	l
X-Gm-Gg: ASbGncvaD8aizlUtXuDu7zeOq7ozehAhABYEdP8Ws4ERTsr8OeHmOUTF9E32ryKvhQU
	alZqJx5Fasg56vxuOCLWnLR4PT/+EaS6LK7azcEOr05ZDAuXtvapj4tqfn5PxGI51pXmox6jiW4
	6eWJAVgIfg1kk0U4JCNqqCc3rrlK4xqtyCPN734A4Ek4Er02TXxHjEvhG3DBcdgpmjqINWyh7+3
	51VRpdxHKqcFMVvHRyrV0RMOpeWKIxDPvFC7dRR4gBLN38kmNN8mYR1Rg1nxSfxYmrVOHcwD0cs
	9jNUu3ZSMltdNQuGxLBjOmXjVHkHL633TogtJp4BI34jVzdQaolTGnAzUyrbdpff0UZIlaEDagp
	RhTtiNKSN4vQ1ksL7WemcKQ==
X-Google-Smtp-Source: AGHT+IEHBG/BTVs6hRh4079T6ieA5EIuK2djmqTjAi93ImNCsauANbqmU8TlcWod9Or7NFbhbRUyig==
X-Received: by 2002:a05:6000:430b:b0:391:3207:2e68 with SMTP id ffacd0b85a97d-39c2a34ce11mr908407f8f.9.1743581781473;
        Wed, 02 Apr 2025 01:16:21 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb60ec915sm12810195e9.28.2025.04.02.01.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:16:20 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:16:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <2wwrj6aid2elnnotzfkazierqmzmzpfywyf33ahqs36xh5xz32@rszeetrztsiz>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com>
 <20250321131813.6a332944@pumpkin>
 <epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
 <20250331195357.012c221f@pumpkin>
 <mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
 <20250401202640.13342a97@pumpkin>
 <15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz>
 <46368602-13n7-s878-s7o2-76sr0q67n9q4@syhkavp.arg>
 <20250401223731.7102103d@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="biggbanxbt6sayp2"
Content-Disposition: inline
In-Reply-To: <20250401223731.7102103d@pumpkin>


--biggbanxbt6sayp2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
MIME-Version: 1.0

On Tue, Apr 01, 2025 at 10:37:31PM +0100, David Laight wrote:
> On Tue, 1 Apr 2025 16:30:34 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
>=20
> > On Tue, 1 Apr 2025, Nicolas Pitre wrote:
> >=20
> > > On Tue, 1 Apr 2025, David Laight wrote:
> > >  =20
> > > > Looking at the C version, I wonder if the two ilog2() calls are nee=
ded.
> > > > They may not be cheap, and are the same as checking 'n_hi =3D=3D 0'=
=2E =20
> > >=20
> > > Which two calls? I see only one. =20
> >=20
> > Hmmm, sorry. If by ilog2() you mean the clz's then those are cheap. Mos=
t=20
> > CPUs have a dedicated instruction for that. The ctz, though, is more=20
> > expensive (unless it is ARMv7 and above with an RBIT instruction).
>=20
> The code (6.14-rc6) starts:
>=20
> u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> {
> 	if (ilog2(a) + ilog2(b) <=3D 62)
> 		return div64_u64(a * b, c);
>=20
> Now ilog2() is (probably) much the same as clz - but not all cpu have it.
> Indeed clz(a) + clz(b) >=3D 64 would be a more obvious test.

Ack, the more intuitive check might be

	if (fls64(a) + fls64(b) <=3D 64)
 		return div64_u64(a * b, c);

then, but maybe "intuitive" is subjective here?

> On 32bit a check for a >> 32 | b >> 32 before the multiply might be sane.

Not 100% sure I'm following. `a >> 32 | b >> 32` is just an indicator
that a * b fits into an u64 and in that case the above check is the
better one as this also catches e.g. a =3D (1ULL << 32) and b =3D 42.

> > > And please explain how it can be the same as checking 'n_hi =3D=3D 0'=
=2E =20
> >=20
> > This question still stands.
>=20
> 'ni_hi =3D=3D 0' is exactly the condition under which you can do a 64 bit=
 divide.
> Since it is when 'a * b' fits in 64 bits.
>=20
> If you assume that most calls need the 128bit product (or why use the fun=
ction)
> then there is little point adding code to optimise for the unusual case.

n_hi won't be zero when the branch

	if (ilog2(a) + ilog2(b) <=3D 62)
		return div64_u64(a * b, c);

wasn't taken?

Best regards
Uwe

--biggbanxbt6sayp2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfs8lEACgkQj4D7WH0S
/k6iBQf/UUoGWVIBVJZhj/MDS/JG7mdUIIfdbuDfPb6Dq2A6ADo3Ye6s0k6gABJ0
fhg3qRAFBaDPMbRsN9EAFPfYuPPtk3iELmYXbjbdq0n3GEbEiZawHakFHXT5U6a+
1KwMb8hfZitTaPKTi+c3LcF0P47otf2M5PvsMhtwBM+CUYhgDEK1tVuOdNA9IdXc
V2Etrhee3aU94D3jtumJCTxNeew2brmZa/mQuCHtAyZTw8AqZ7lilgK2LdERuBI/
cG2Dcy++swhAqMxMyUMSrXc2rnJ12gPMyJprf9i1JlDqXStbs2O3L7nJFvcpIOqM
BTdUjLaPrqivmBsR5sFsnczuWsoLfA==
=4LJO
-----END PGP SIGNATURE-----

--biggbanxbt6sayp2--
