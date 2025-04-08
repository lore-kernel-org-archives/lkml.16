Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A51E22D4E3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142774; cv=none; b=odSmraUjciUuUxVe4pm+TDC5mjImr33S+GNR9GLR2l1RVpRV5NgNQ1yEUB4KUgqSz0e3VgGrn5secTZQuBHfWcNVz1nTqwfY2HbGdDPfSsWUQJxbWFrzG5cvGVHrM8mfgXPVNtEebcMt+1gYMsnPlwCTMgf7MaV/SyptRcsSgro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142774; c=relaxed/simple;
	bh=R9PCiNpANQ/2Ogq9pBPCw9qkkYLJ7a61+GaIpIVoMnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANz/NFJx5Ujor4KaXAbYhNypLsUDhuJ16omaySmr77aXVz5RP8c6WT/7fnEJRSuCH+je6wPrqEWOWexz015w4oWEKC/vboCg44C3/dy7ZDkDuedpESnBhxPec/yl8pb8eKIjkZrML1HxKFy3iTrpO3ZP3tx0VAvr+PlOn4t6vyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xqgaMMh1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xqgaMMh1"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so10795583a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744142770; x=1744747570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8JzI2Fad1qStdj7myeloioDMtZwRVS+qT9EnHWQFGp0=;
        b=xqgaMMh1nx0GMjBkVvbKiCbVry+iksAqWB45zEoRmiZhhd6+72ORQXUNK4BIvcR6ah
         gIFvsAJWdbm0nmvhWYoC/r8znolp3YfJJAfOozcgCiUgTxt+8LheKre467ENNA8hHsN5
         iqMME34m3zhVNS+4R8jYZaV2LRKMpYbPHylgzCOLsRER/14FMzTW6V4UfCb+OouOHC6D
         3aspmi8/Og6x+32ZiLsCA3DHDsL1y9NhQB0s4bXMoPgxwWqSDaDY8yR2nc+PPI2dJL+0
         gXb+Lg1BUo6uI9K+tE38dlnWaSRd7z2zKAiVZI88tAg2lH5NxGVDdWNM1ZV5sXvVn3oS
         j5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142770; x=1744747570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JzI2Fad1qStdj7myeloioDMtZwRVS+qT9EnHWQFGp0=;
        b=kmDiJrJTPSHLv+KAPPtSooQGL0U/EwPVGQ+PZyYHr2aUBSa2ZVuaM2vPu+G+CByws4
         pzimQSa7LzN2ZI+RYl5CHR81GnXH0z/clvL9T02Ae3sL41xmIEWlypJC7BossUh6wWlA
         I/6tE/40FBN9ZlJycQEewhdFInjGKA5ZHIWmNYQpqnOTzBaOmpI7C3YswpJIl4lOZPID
         91LwG5zG09oeDXkfBK83Phvpzq6Zk/C6sDRkvUj31Cc6J/LZejSQ13Av6vjiAr9Vwfw8
         HYJ6FCp527aSHWlsx1MODbHs7tc/6VNj26dUJh2GH5n2dQVbFFtBztHq9vlQv7jm7NAv
         67FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAIT8xf5CJpYtHrESCBtxJ8tZK2WP1Mt3W9Hhqs9dqFpUfjFgFPr7p265fj594G+Q3I5S3mKQ9SaqTQvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF00GlOL1TYxzrWKPq1+nUXHREntfQuak7SRn5CnGtQa2OeEzx
	UE67dwWiuv3fjyxyz2HEvj6+k7NU8/DKYO64Ay0RsulO9jShvWGxzJlzdQv7d7rdZnuRZkIxoTy
	wv3c=
X-Gm-Gg: ASbGnctiTinMs77ktNxzuX0TY8JHvCDo++NHkfZMcchjdobK1EJnX9doEVo4yvlag3r
	hPGZSK+q3s09e4rP0UGOwuLhrfsG1rQQY5u1cgsJhBEC5DxSHWj5q/CEpbAlBkTWB2WQ04ulWzS
	VkqNb7cW5e33JUcfn++0rCmUCfanfcfXHzvSQhyBm4xXwW7AL0kx8Qptff5X23xUSHam2vxkm2Y
	LgyfDLfmThat5RG6cRJgwKbF494OuYC35NDGDEhuAwGesu7NiH7RUSNv5fkAJDaCKQIaTFi+fh/
	KSnEtO0fbMzM2JN5OzopnmRWKNBWg40AcXVAg3Ab3zFood9hS8v7nylhncyU
X-Google-Smtp-Source: AGHT+IE49M/kqxjtubfVfqnLxbn/lTtUD71TX2aCNejDDB0JUePKUsJRrv4E8awwYqNM81Srnj6e8g==
X-Received: by 2002:a17:907:9727:b0:ac7:18c9:2975 with SMTP id a640c23a62f3a-aca9b747a88mr39391566b.48.1744142769597;
        Tue, 08 Apr 2025 13:06:09 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7c013fda7sm964912966b.117.2025.04.08.13.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:06:09 -0700 (PDT)
Date: Tue, 8 Apr 2025 22:06:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Kent Gibson <warthog618@gmail.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] pwm: Add support for pwmchip devices for faster
 and easier userspace access
Message-ID: <fhcqdkipkqymssquk5d2vx5rthbibqxgxn6p4nu2lez4jjjac7@gwamk3plmet4>
References: <cover.1744120697.git.ukleinek@kernel.org>
 <f31fea4002d62ba5c1f9f95ca58a182ecc5bc3a6.1744120697.git.ukleinek@kernel.org>
 <6779558a-3ebd-4fab-a0fb-95f2936b726c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qpeszjvxckqxqszi"
Content-Disposition: inline
In-Reply-To: <6779558a-3ebd-4fab-a0fb-95f2936b726c@baylibre.com>


--qpeszjvxckqxqszi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/2] pwm: Add support for pwmchip devices for faster
 and easier userspace access
MIME-Version: 1.0

Hello David,

first of all thanks for your time and valuable feedback!

On Tue, Apr 08, 2025 at 11:20:19AM -0500, David Lechner wrote:
> On 4/8/25 9:23 AM, Uwe Kleine-K=F6nig wrote:
> > +	case PWM_IOCTL_GETWF:
> > +		{
> > +			struct pwmchip_waveform cwf;
> > +			struct pwm_waveform wf;
> > +			struct pwm_device *pwm;
> > +
> > +			ret =3D copy_from_user(&cwf,
> > +					     (struct pwmchip_waveform __user *)arg,
> > +					     sizeof(cwf));
> > +			if (ret)
> > +				return -EFAULT;
> > +
> > +			if (cwf.__pad !=3D 0)
> > +				return -EINVAL;
>=20
> Since this is get-only (argument is purly output), should we not check th=
is
> to allow userspace to be able to pass an unintialized struct without erro=
r?

No, cwf.hwpwm is an input. So I think it's reasonable to assume cwf is
properly initialized.

> > +			pwm =3D pwm_cdev_get_requested_pwm(cdata, cwf.hwpwm);
> > +			if (IS_ERR(pwm))
> > +				return PTR_ERR(pwm);
> > +
> > +			ret =3D pwm_get_waveform_might_sleep(pwm, &wf);
> > +			if (ret)
> > +				return ret;
> > +
> > +			cwf.period_length_ns =3D wf.period_length_ns;
> > +			cwf.duty_length_ns =3D wf.duty_length_ns;
> > +			cwf.duty_offset_ns =3D wf.duty_offset_ns;
>=20
> Odd to use different style for setting struct here compared to the other =
cases.
> (I prefer this one since it is less lines of code to read and less indent=
=2E)

Note there is a semantic difference:

	cwf =3D (struct pwmchip_waveform) {
		.period_length_ns =3D wf.period_length_ns,
		.duty_length_ns =3D wf.duty_length_ns,
		.duty_offset_ns =3D wf.duty_offset_ns,
	};

initializes all unspecified members (here e.g. hwpwm) to zero. I used
that idiom for ROUNDWF ioctl with

		.hwpwm =3D cwf.hwpwm,

I guess I'll update to that variant here, too.

> > +			pwm =3D pwm_cdev_get_requested_pwm(cdata, cwf.hwpwm);
> > +			if (IS_ERR(pwm))
> > +				return PTR_ERR(pwm);
> > +
> > +			return pwm_set_waveform_might_sleep(pwm, &wf,
> > +							    cmd =3D=3D PWM_IOCTL_SETEXACTWF);
>=20
> For PWM_IOCTL_SETROUNDEDWF case, should we be copying the modifed wavefor=
m back
> to userspace so that it can know what rounding what actually applied with=
out having
> to call PWM_IOCTL_GETWF?

Hmm, for pwm_set_waveform_might_sleep() and also pwm_apply_might_sleep()
the argument isn't modified. So while this might save an ioctl for
GETWF, but you might have to rewrite your state instead.

> > @@ -2115,7 +2376,13 @@ int __pwmchip_add(struct pwm_chip *chip, struct =
module *owner)
> >  	scoped_guard(pwmchip, chip)
> >  		chip->operational =3D true;
> > =20
> > -	ret =3D device_add(&chip->dev);
> > +	if (chip->id < 256 && chip->ops->write_waveform)
> > +		chip->dev.devt =3D MKDEV(MAJOR(pwm_devt), chip->id);
>=20
> if (chip->id >=3D 256 && chip->ops->write_waveform)
> dev_warn("too many PWM devices, chardev will not be created for ...") ?

I would be surprised to hit that, but I guess it's wise to do that
before it happens for the first time.

> > +/*
> > + * Modifies the passed wf according to hardware constraints. All param=
eters are
> > + * rounded down to the next possible value, unless there is no such va=
lue, then
>=20
> Technically, isn't 0 a possible value (at least for duty length/offset)?

Yes, but not all hardware's support duty_length =3D=3D 0 or duty_offset =3D=
=3D
0. For those that do, it's expected that 1 is rounded down to 0 (unless
they support 1, too). period_length isn't supposed to be round down to
0.

> So maybe more clear to say that if the requested value is non-zero then t=
he
> value will be rounded down unless the result would be zero in which case
> the resulting value will the be smallest possible non-zero value.

Yes, this applies only to period however.

All your remarks that I removed will be addressed in the next revision.

Best regards
Uwe

--qpeszjvxckqxqszi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf1gaMACgkQj4D7WH0S
/k7qIQf+OXSbZ1DSeV5vNj1SXGQzlDrwa3agtHtdN67dmANV+iBF2QhcdkzVkm+y
2AymapDUAicmJLSI2GumGk52UB0OrujWadw4LO7S2HiiWZXUuvjCLuyf7MiEtF9A
PNT+dyigGnZNGA3zhjgufUJhL1bNpd+LULLtenO6O9l1xuzP4yb9ZljF4GQPj/Ur
/niCuWl3t0cvU+i7MKe4lCWytfy5+9LxF0gnNlfqCPguJfefgiZu/v3lC1qzygw4
tz7+bUn8Yh8F3tcKVPnK3DMcddGeUGu+vlmYCmUF+uAJoOVgqHpDas8EbHOc4Rsv
iSOzjAGlvcFAu9DFcwqHUoShvKl2BQ==
=yUrO
-----END PGP SIGNATURE-----

--qpeszjvxckqxqszi--
