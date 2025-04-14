Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4731C1BC07B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744669831; cv=none; b=JUVw/9j1RGzYq+c8fKFK32PHztQoQqo9ILFOrJhG8TeiXKraM4vUO9u3p59x7SBymDCht3i9yXYzbXKSxH4VzFb4cjS0A81hfWk2+Tzg+zXfh8LW2z9z2D3FYEhwylD2SMzM5LwrqMsYgr5Mx46jnrfmdquFjVuQEjgvhPtqVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744669831; c=relaxed/simple;
	bh=qQBx3gwR7BoGNGR16e3u+TKdmh6EonNUcNYeazUzxLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/Pt4oPO5rEsxIRFC4DsulKs90CXvvLrEjBUsRS7DKEkquVJ+qnGHThekLobFO9IIahHMHjiU7JToKG/eiLZCAp0juKbv7fZbv262K8+gKyYu9gSWgNSu9Rjse+GeZgIouWaf8bCakwpJF9kzIlRXaTGk+nug/TXdfpgKa+bqFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gdjcp/WI; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gdjcp/WI"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso9198164a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744669827; x=1745274627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJUU5/KwFR6EBw6HmiWZSj5H1CAAPNYinIfo2az6p00=;
        b=gdjcp/WIV3gt+SboT9sxx8vm8OeWUKH211hGSr3SnDH+5634HqmHDUT4hlhTd8qH3r
         JwRUSbhY6q1isNOfIP7BxqvqEl9LzDCcR8qo3QZ+LCFqmAkAkpMwjsGbwjUNaVhiTDPL
         SZt8g9K0lXbcoVq7hokJCE11toyptL3t8bqaZjlMc9N97r+uQequ1EmQ9eVAQjI9oJrO
         nYPNHWkb3WR4EIVZIekc2xsPnbWtIOuHW+4aNemm4abwfUE4fYWtrBmv0oabLOOGFaF6
         R6lioOq4JHra8OShcXbldbeTl5jHPJWxWk9ePVk+xGxOxSbd25ltfF4zwb7G0ranjUw4
         X1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744669827; x=1745274627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJUU5/KwFR6EBw6HmiWZSj5H1CAAPNYinIfo2az6p00=;
        b=L8NccyZEg3MjFo3wHaZbJfunOVn+BAPr733DEcJDv4I0BkSPv+p5pYurDSdTv3mIxu
         7PwNBJtgGQC1oyzdV6Z9t5AhHBoNq8J5HboKnbFNOJGHqzA3jbN7Sl324FwTfPARVIdB
         rAlx8I2FT5xmChvVNA4dthX/bHofu0pGlMD+P3ODOFX1jx1xzod/RQmU24DmlTW3T+J7
         Le+beu3p0I4/SvC7GBdR7lga+z0U9g+tPCQNQYX1YMrTaOXoBXWw1W3pGWpQXlEkTk7B
         HFsX0U1Wbfyzx2FXdMcOsCzIMpARWbbPRdp4tn7/mUOcu9IkGnl0H8KlfJD+3nfjapS0
         1Vxg==
X-Forwarded-Encrypted: i=1; AJvYcCWZGYV0eovEhLXkmnTf5W4bxEnRTl/O/vMnCV9lOoMXGgVaDvZgOtEZovNhe2raMih93o2JSj/4mUBnHGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXDRaLISf3O/Zk+qT0VSG2VovNmFCGAigWSBFxssS4oCdMsq4f
	PgztV9UDsdoR5I3IxIT7X+3jRKzPNEf9SjdwhCBwxaeQjK8vvPYddyEUyDOPRZ4=
X-Gm-Gg: ASbGncvibZVT56D1NO6rHSehc92Uhd0dMShlraqkOsSPq9dD9noXzs6Mw09LOb0JCi9
	vq5fTNjbu2M3R6t3WWZ3MuJlUvKZrb6vQnIrS+eAAYEs8CF3Xeb1TRnM0WU6SZ40Lf9TMK2aXSg
	lq2FwDDfQdTt4955vitOTQQabkIs1m5KoTubjsIcQdDVHBXoennSKcpw6Is/A2SRtH6YUdvHsuV
	a879qE8tenDH+IdXEWcMSa6IzKdnc6G6ybohav1eZ9mXSoFjuz2ZsQvATh2QyI/LmSl9Fy9/JoD
	xxPpGDZeubtGSr+MtRwXEslnPxhmpKNu0tjD9BJoSYunzw==
X-Google-Smtp-Source: AGHT+IHZhK+qYZqSi1SpL+1u6PEyVqPY3kj7P/rJwDZYHQs5W9C/B5usPcBT3HSPzMoZrr6flIoa1w==
X-Received: by 2002:a05:6402:3214:b0:5f4:370d:96c4 with SMTP id 4fb4d7f45d1cf-5f4370d9b5amr5203042a12.0.1744669827520;
        Mon, 14 Apr 2025 15:30:27 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f36ee54d84sm5746425a12.8.2025.04.14.15.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 15:30:26 -0700 (PDT)
Date: Tue, 15 Apr 2025 00:30:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
Message-ID: <erttkpna2hzg7zuddzlocaou2wqcwmgcxfhldwdt55yleie6dm@nfg374fv66fq>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsmmcnqrrufeyjni"
Content-Disposition: inline
In-Reply-To: <20250109-enable-rtc-v3-3-f003e8144419@baylibre.com>


--tsmmcnqrrufeyjni
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/5] rtc: Fix the RTC time comparison issues adding
 cast
MIME-Version: 1.0

Hello Alex,

On Fri, Apr 11, 2025 at 02:35:56PM +0200, Alexandre Mergnat wrote:
> The RTC subsystem was experiencing comparison issues between signed and
> unsigned time values. When comparing time64_t variables (signed) with
> potentially unsigned range values, incorrect results could occur leading
> to runtime errors.
>=20
> Adds explicit type casts to time64_t for critical RTC time comparisons
> in both class.c and interface.c files. The changes ensure proper
> handling of negative time values during range validation and offset
> calculations, particularly when dealing with timestamps before 1970.
>=20
> The previous implementation might incorrectly interpret negative values
> as extremely large positive values, causing unexpected behavior in the
> RTC hardware abstraction logic.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/rtc/class.c     | 6 +++---
>  drivers/rtc/interface.c | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index e31fa0ad127e9..1ee3f609f92ea 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -282,7 +282,7 @@ static void rtc_device_get_offset(struct rtc_device *=
rtc)
>  	 * then we can not expand the RTC range by adding or subtracting one
>  	 * offset.
>  	 */
> -	if (rtc->range_min =3D=3D rtc->range_max)
> +	if (rtc->range_min =3D=3D (time64_t)rtc->range_max)
>  		return;

For which values of range_min and range_max does this change result in a
different semantic?

Trying to answer that question myself I wrote two functions:

	#include <stdint.h>

	int compare_unsigned(uint64_t a, int64_t b)
	{
		return a =3D=3D b;
	}

	int compare_signed(uint64_t a, int64_t b)
	{
		return (int64_t)a =3D=3D b;
	}

When I compile this (with gcc -Os) the assembly for both functions is
the same (tested for x86_64 and arm32).

>  	ret =3D device_property_read_u32(rtc->dev.parent, "start-year",
> @@ -299,7 +299,7 @@ static void rtc_device_get_offset(struct rtc_device *=
rtc)
>  	if (!rtc->set_start_time)
>  		return;
> =20
> -	range_secs =3D rtc->range_max - rtc->range_min + 1;
> +	range_secs =3D (time64_t)rtc->range_max - rtc->range_min + 1;

In the case where no overflow (or underflow) happens, the result is the
same, isn't it? If there is an overflow, the unsigned variant is
probably the better choice because overflow for signed variables is
undefined behaviour (UB).

Respective demo program looks as follows:

	#include <stdint.h>

	int test_unsigned(uint64_t a)
	{
		return a + 3 > a;
	}

	int test_signed(int64_t a)
	{
		return a + 3 > a;
	}

Using again `gcc -Os`, the signed variant is compiled to a function that
returns true unconditionally while the unsigned one implements the
expected semantic.

>  	/*
>  	 * If the start_secs is larger than the maximum seconds (rtc->range_max)
> @@ -327,7 +327,7 @@ static void rtc_device_get_offset(struct rtc_device *=
rtc)
>  	 *
>  	 * Otherwise the offset seconds should be 0.
>  	 */
> -	if (rtc->start_secs > rtc->range_max ||

The original comparison uses unsigned semantics. With start_secs signed
and range_max unsigned, this might become true if start_secs is less
than 0.

> +	if (rtc->start_secs > (time64_t)rtc->range_max ||

This new comparison has a similar problem: If range_max is bigger than
INT64_MAX, its value interpreted as signed 64bit integer might be a
negative number and so this comparison might become true unexpectedly.

So even if UB doesn't play a role here (I'm not sure), it's not clear to
me why you consider the issue of the unsigned comparison worse than the
signed one.

If this is indeed beneficial, it needs a better explanation than "When
comparing time64_t variables (signed) with potentially unsigned range
values, incorrect results could occur leading to runtime errors.".

Maybe you have to replace

	rtc->start_secs > rtc->range_max

by:

	rtc->start_secs >=3D 0 && rtc->start_secs > rtc->range_max

instead?

>  	    rtc->start_secs + range_secs - 1 < rtc->range_min)
>  		rtc->offset_secs =3D rtc->start_secs - rtc->range_min;
>  	else if (rtc->start_secs > rtc->range_min)

I didn't check the other hunks.

All in all I would suggest to split this series in two:

 - Adding support for mt6357 in the rtc-mt6359 driver
 - Fixing overflow issues in the rtc core

Given that I don't understand the intend of this patch, I cannot say if
it should be included in the 2nd series, or if this is yet another
standalone topic.

Best regards
Uwe

--tsmmcnqrrufeyjni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf9jH4ACgkQj4D7WH0S
/k51FwgAsL7mzjW04I3FbsimeTdILk9y1+3zCv9FAZYVpWnaNgF1Ug6wloE92sfC
A6VZrP7eNxWVQ9EcrpIqph4n6AnLEukD2eY9MeSndzqnJJQWJuJ06aafMX7DvkJh
lvvXOn6lX1VI0gjX/pYu4ayTiJ2iBLyXJXM5Pk1E2raJJfF1r5cuRJPXPk0HNwgL
pHIOgpIQKEO1OxYFY8Q7W/af63h/ZmqvQadBh4gPEpDGDKvHG5DgA3G2BMAhqiDX
fvNL/hqBmRa8FC7e274ACveXF00oTDU5uGP/ezWx+U5J2K5wIb3kBzd1BDhIaNFS
oOLoIX9qnbCZ1GOtLtXWLAkT7Wjm4A==
=bJIL
-----END PGP SIGNATURE-----

--tsmmcnqrrufeyjni--
