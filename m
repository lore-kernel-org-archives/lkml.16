Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A10226170
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635058; cv=none; b=iqSyWyU9itE6yruRsQ/y0+N3six5UwUIM6L0ejZxgmH0GmUEFh0HqbZMvBGkRq33OfP4WwZ3g2tXaL45c9+RQub2yObop7Id4yNWTVWNP9D62IzIrBi9H1HG6Tpr2kZ6azkTwLsMGQakFsfkOlecLeFQOKY9mBvoq0j885Ik6/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635058; c=relaxed/simple;
	bh=a8aE6HOLKRKkfb4O6GoRzHp2G2aPiC2zjUJtFQmAOtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVlaQhZT58wz8AwMFwMGqmwOk5hHaBr4asFf7z5CaTxuyHZdmj9wz8JKf6Imf//ptlgt8dKyjm03l60GIBE+ThSMv9+dZgZ54BRUtgl4mIWRi5BvL77uV9SaTz0WeGhh5H4W2p28WH+ez+m8UzfgH7Q4gRrK8hsvRQMhGgrewPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WhsmGx9z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WhsmGx9z"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so43483875e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 23:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747635052; x=1748239852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=93fzfnh2Rf+TZri/YfZ24AYrBz/sd3EAjjDvJIYHFpM=;
        b=WhsmGx9zinbUoJ8IkxrPC0tgpGPxzWtqK46VCLSqvhPBD4RlglVIZSMFvMoms6ot26
         c4a2YB8Y692x8CiuNW1rvJYjn1qlaunQ8bi9eSBf/72HEgkLg+6X+nLLKvCX1OA1Qnft
         EY7ZSDvAqf4a0NVkYdkvPUGdR1MVUtGJM+KFZm08syTH08EKXC5cvBnDDljgY2T7j/0M
         KG6F/RbqS5Svr0wRqBfXh+3oJcwoRnIBSNB2PUtFBrMPtzt6RKNL1Esr1xyfUGHsBCH7
         WgHgKBXbnYFKsUYb+aIw4Lh6tCc7+F2NlP1W9OzIQ9VhtWKSBsplO6lS6ty9L7T+cFCU
         TPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747635052; x=1748239852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93fzfnh2Rf+TZri/YfZ24AYrBz/sd3EAjjDvJIYHFpM=;
        b=Fb5wsIyTPJHKRRR7AN0qaaBNBb24bfapYUGzuFauFtPhYkW52FkY3eAuC2l8Yihw4g
         bhLmrvP1nJOj39Jgm/3yfsEF8gj8PQUZLuWP8eRZG12Huq/bK/WLYAIgkTmR8Kc6Z55c
         b2JN1qWyhCw2jjstS+ozIdYIO9LCzIPhJXCbOEXLwPKBeR0vivFkyeBdlHjDfnLHzeD1
         ziwNrvU4ghSvDlhP/s4W8zwxtZ/ylaOiGQBv3IovrGvV+ykP3LBFCWAzYF07E13oAHsy
         2eka19FxpICsxnDQ4ZjFf9BFS0ywxC1xsMxYPgU7zrIfc9I9Q5hoNkG8HW+vjed9/uNS
         LY8A==
X-Forwarded-Encrypted: i=1; AJvYcCVm46A1eC6zsH9E0Vr01u2Q2XXq4hVR3au1VuwOWpmL4oEgPaNi9Aed0LEIC6vjZpe5z6c4AAgu0c8nmpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/z5+/VgOq2CsLaONpIR9haiO5YQriMlw8U8yuZxgvL8Ws/PE2
	nbxJYOidmgTwc2RuCxg9vejaZ0DvcbztODo+NN8Wya/yySGY3J7vmkDe9MV9jpfSsqM=
X-Gm-Gg: ASbGnct8imWNxL3e2xAJvji94FELJ/gSzNOPO+fo+F8xqBHy3JpggpMWsKadqzmslPx
	KZk1dxGKaAryT4W2qF16WraJtFqG2lRaGaVB18zxIXJhpjxl3+K7E2NHdr6jSR7HmFC7Aa+CAeq
	d0MCOalz6/OYKzRTU9osYdQGKPok3botob9KtgyY3aSIo+LNNGgn8VJkkj5owFF41habn3alBv0
	U7AlquRj5fbE1UiV5snAo48RFz5AKnbid402CbVMqLstBXr0R6C2PhAxiXviph92r3k/cmtG4y3
	iDCuHjbcgpoHqQ8CPpDeZXnq/ZnFFMddzORc43c9gh2T1a4fgEiP9jLf3+2DNYFgRpzbfLAtdvG
	vWabcAhGjQFtVP+PsADoabnnzzvuM
X-Google-Smtp-Source: AGHT+IGV9MyA4HRmPoevp8WU5WilX2sedkxzKIXi0dVkdQnehBR1iPexHMWCvDQH/7MCjJfvoRx7Kw==
X-Received: by 2002:a05:600c:64ca:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-442fd664a1emr84826385e9.25.1747635052376;
        Sun, 18 May 2025 23:10:52 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442f39e8578sm206555125e9.29.2025.05.18.23.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 23:10:51 -0700 (PDT)
Date: Mon, 19 May 2025 08:10:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Nicolas Pitre <npitre@baylibre.com>, 
	Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
Message-ID: <uc3g3fgwirwczxjbh5qxgz3pzqmlmiymdeh7m2dzznx2fap4vc@6hvvrgpbyg5q>
References: <20250518133848.5811-1-david.laight.linux@gmail.com>
 <20250518133848.5811-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bf364gsxhuzuu76b"
Content-Disposition: inline
In-Reply-To: <20250518133848.5811-3-david.laight.linux@gmail.com>


--bf364gsxhuzuu76b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
MIME-Version: 1.0

On Sun, May 18, 2025 at 02:38:46PM +0100, David Laight wrote:
> Do an explicit BUG_ON(!divisor) instead of hoping the 'undefined
> behaviour' the compiler generated for a compile-time 1/0 is in any
> way useful.
>=20
> It may be better to define the function to return ~(u64)0 for
> divide by zero.
>=20
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>=20
> A new change for v2 of the patchset.
> Whereas gcc inserts (IIRC) 'ud2' clang is likely to let the code
> continue and generate 'random' results for any 'undefined bahaviour'.
>=20
>  lib/math/div64.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index a5c966a36836..c426fa0660bc 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -186,6 +186,9 @@ EXPORT_SYMBOL(iter_div_u64_rem);
>  #ifndef mul_u64_u64_div_u64
>  u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  {
> +	/* Trigger exception if divisor is zero */
> +	BUG_ON(!d);
> +

I'm unsure if I should like the BUG_ON better than return 1/0. My gut
feeling is that mul_u64_u64_div_u64() should behave in the same way as
e.g. div64_u64 (which is just `return dividend / divisor;` for 64bit
archs and thus triggers the same exception as `return 1/0;`.

If BUG_ON should be it, I'd prefer

	BUG_ON(unlikely(d =3D=3D 0));

which keeps the unlikely() that is already in the check removed below
and is more explicit that checking for !d.

>  	if (ilog2(a) + ilog2(b) <=3D 62)
>  		return div64_u64(a * b, d);
> =20
> @@ -212,13 +215,6 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> =20
>  #endif
> =20
> -	/* make sure d is not zero, trigger exception otherwise */
> -#pragma GCC diagnostic push
> -#pragma GCC diagnostic ignored "-Wdiv-by-zero"
> -	if (unlikely(d =3D=3D 0))
> -		return 1/0;
> -#pragma GCC diagnostic pop
> -
>  	int shift =3D __builtin_ctzll(d);
> =20
>  	/* try reducing the fraction in case the dividend becomes <=3D 64 bits =
*/

Best regards
Uwe

--bf364gsxhuzuu76b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgqy2cACgkQj4D7WH0S
/k7mlggAqRzC6p1EhQh+NHINxBwQTlSI7KsYLf9yycKup/sFDiNonSrvEB7P9SSu
ydw4KfYt06yMlpvclyyrMaM3qOEcgRBklp99w+XG1TAf2GJu+OOIt6Fo/5GClai2
IldU0m45vclzlcHZmKGGzchSE3RC4MdU66AMR1XblLQeMwhQ5nVzvBsIDxDeIcxc
n56MqdBAff/SwccQlsIKM/5cWtZmRncl4D6SPEiy6F2zCK4mVa55EZp9xBwFVHQg
cwhjtSkZCvVFxbESYcXVo2rFo64bKANbiNorXZ4ik6AUM/5qgBbjpKueVY1tcjaJ
jzWuKUq60Nrqs7oZbi99jCftpeH5sQ==
=8PFg
-----END PGP SIGNATURE-----

--bf364gsxhuzuu76b--
