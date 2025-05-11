Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F31E485;
	Sun, 11 May 2025 23:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747006226; cv=none; b=fXfD6o7yovYxdJGjC0D0MVxxzwy1zjJMG3YR3xotD4Qk287Tg9yufKeij0NDXdANpdOYaIqhutsFFjy1PdblTTYVdSx46NO063aFei4cpbJguVZsVWGi+8MhVvjdBroFG+OKKZeJ7xDoY+9VL6Cv3Qa+Q2xnMYf9m+Ls+zMLMtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747006226; c=relaxed/simple;
	bh=kxS9RGUJfGYHYRC6/YRlAu+5nrctscMWll9hzu5mfPw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=o3xxsatoNQ9KvBOfTqBBmvLAhHHTg3OVAxgH5Dp5U8dLSqEwomCizXuEYiUdj9ac4q0oaUuCJpYvqPjZOSG5qH8j3kJi7qTPnuE0NnwYYk9Dt3Z5Uu7V8/yuSj4W5Iyk2sgLOMRpHPoHkyTc9a8lt8oiCZmYBnB/552T5mGHfuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5xFv9CW; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5xFv9CW"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-879e8e2237dso2136150241.0;
        Sun, 11 May 2025 16:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747006224; x=1747611024; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FuAxY1FnwLvvV5y/w1jLzmRCbR2PH85UKoUxJqV9epg=;
        b=D5xFv9CWjEpo+EMQJNA0Ze7UV14onpW7Kfi8RnAz6rDAT3pxVF9Xnoxyj+Dg9PVtGl
         i8sPbPuK/FO0yxlsvDWraf++x9W2nkZTtW9vrXKxRbnYH+aJdazveMraC3Wz3cItZC9X
         i75/PSR8Ypuik7x0MYdMSCJ82oTo5veeXLAph7jgrxocIfSsr1itZtV22elkfbMX6H3j
         cqtr/shdPpRHQcaZ9mvtJ2A6x7Zn7NMNuFuw+yPs3yHiwhXGu6LRi2TBCqV/GakD2bEx
         4ATWkAIMjW6B/IzNNuCvpb1n19zBSe9/HVk2Hdr9WshEOqrR3mUMYu2DUU1K9/anwfC2
         r8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747006224; x=1747611024;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuAxY1FnwLvvV5y/w1jLzmRCbR2PH85UKoUxJqV9epg=;
        b=OLr26QSHb+7HOf4lrggFGFPGF8OFUBqXhG30foWNcDKmbxoO3crtT6OzbsEH57BGzM
         uvufmu2EbJ2ZgTCIDTth4UvTn0XrXfZijhBdPfAV9JyrofU07bPKUO4ziYAVPQrWSZqr
         b6Vp0fXPi0aWcTn4ahfaKKzfO4otwXS6Yrv8zcDaDcLWk2nG7JcD7ZTp4STDC7KUASyk
         A9bBY4F57kbI3koocO1CGuSaPKk5brWgQnhTcAWijI7fseYhay8493LyRJHcE/MFImsq
         geOzFawzkFVOGXcxtNqTpSrlfJp8kT4sck4Rk++aoYZ5LlrnymGOTu//53SBPTaTixh2
         kD+A==
X-Forwarded-Encrypted: i=1; AJvYcCUmneW2mS1FliW/wxMsGiJhs6Du9y4c6nZm5PsaFZfL0mLsEmXdGsKTnX7E+FTCRVGtNy60blEaYEE6XCSh@vger.kernel.org, AJvYcCVPrij1VLlw1vWV+gkHg+ULU+EXPoU/s+5w2R25Kam1yP/bv427lxS0E8K5UyjBZSz5G6Kw1qfKGTaYPonGoRbny7tlvQ==@vger.kernel.org, AJvYcCW9usKEUqbCMKsb5nzYMm30FQRT0aRJfL1QguqW++MnIIFtiMdYTR1VhwKVy0MR8rAbBElOfTAAEqQ=@vger.kernel.org, AJvYcCWKudGQlBCOYC3Na2DC4aYhPxgcdUeAhvJ0EYo386EOYQYi5hVoz8VwMclbM+1MKNXM5Q7YRImjVOFB0z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuQuhW0NY559Iv+RGvOFGCxUUyoXirafYJzuXImwXiUiWi02b
	v0IKlAA3VmG4lRkVNAopSTgPDs37UnLIrIE89JGQWTSjo7zyz9u9
X-Gm-Gg: ASbGncvL1ogPhRU/Y0VeENRbDDn3mJ2wCxHZw6GzOEQ20R66/E/c+RlrjtKUDcBwGIG
	8Kzvxj+Dy3bCNbcfvKljZU+gpgfWV777PuNsKCRkYQsLaxjxiJbhRcNtfgBtgg87OwKv2XpySfF
	HsLxcIn9hq/hGvsG3FlSZ4On/hY6h6P4cw30KqwwLcsr223BSVoBj+UtNnjtiOJHDrgAjtRi8Y1
	2a7ssxd86AqLPWA4NQLwImGwfx89K4TAuA4X8gDcBmUWnfNS2XcRAen+Taka5cmuADk/uz2fnc8
	OZ4fnJyetyDPgEoeM/zKdF2s3wWSmqZg2S8uzAbZJnG+8cZz5dZsb/c=
X-Google-Smtp-Source: AGHT+IGLAPxCLFkep0vlw76XA5pXelgzr8XBayNAzLNhNympu2KSsPefmv4d83vBHWQJt8DoWywtcA==
X-Received: by 2002:a05:6102:2c02:b0:4c1:9288:906c with SMTP id ada2fe7eead31-4deed33c572mr10054589137.9.1747006223621;
        Sun, 11 May 2025 16:30:23 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb2018611sm4186579137.20.2025.05.11.16.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 16:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1917ec96a486740fa601ecfd0c45a92a45394f0234bd152b47b6d3031405;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 11 May 2025 20:30:11 -0300
Message-Id: <D9TQ0LYKISGB.3QAOHFXVL9PEO@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Hans
 de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan
 curves/platform profile/tdp/battery limiting
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 <platform-driver-x86@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>

--1917ec96a486740fa601ecfd0c45a92a45394f0234bd152b47b6d3031405
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Antheas,

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> This draft patch series brings into parity the msi-wmi-platform driver wi=
th
> the MSI Center M Windows application for the MSI Claw (all models).
> Unfortunately, MSI Center M and this interface do not have a discovery AP=
I,
> necessitating the introduction of a quirk system.
>
> While this patch series is fully functional and tested, there are still
> some issues that need to be addressed:
>   - Armin notes we need to disable fan curve support by default and quirk
>     it as well, as it is not supported on all models. However, the way
>     PWM enable ops work, this makes it a bit difficult, so I would like
>     some suggestions on how to rework this.

If I understood the question correctly, then you should control the
visibility of all "curve" related attributes with the quirk.

The custom hwmon attribute_group has an is_visible callback, and so do
the hwmon_ops.

>   - It turns out that to fully disable the fan curve, we have to restore
>     the default fan values. This is also what is done on the OEM software=
.
>     For this, the last patch in the series is used, which is a bit dirty.

I have a couple questions about this.

* What are the default fan curves? Can these be statically defined?
* Are user-defined fan curves persistent between reboots?

I have some doubts about the approach you took on the last patch, but I
want to understand how the platform works first.

>
> Sleep was tested with all values being preserved during S0iX (platform
> profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
> least for the Claw devices.
>
> For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
> his new high level interface is merged beforehand, we can use that instea=
d.

Hopefully!

--=20
 ~ Kurt

>
> Antheas Kapenekakis (8):
>   platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
>   platform/x86: msi-wmi-platform: Add quirk system
>   platform/x86: msi-wmi-platform: Add platform profile through shift
>     mode
>   platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
>     attributes
>   platform/x86: msi-wmi-platform: Add charge_threshold support
>   platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
>   platform/x86: msi-wmi-platform: Update header text
>   platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
>     unload
>
> Armin Wolf (2):
>   platform/x86: msi-wmi-platform: Use input buffer for returning result
>   platform/x86: msi-wmi-platform: Add support for fan control
>
>  .../wmi/devices/msi-wmi-platform.rst          |   26 +
>  drivers/platform/x86/Kconfig                  |    3 +
>  drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
>  3 files changed, 1156 insertions(+), 54 deletions(-)
>
>
> base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2


--1917ec96a486740fa601ecfd0c45a92a45394f0234bd152b47b6d3031405
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCEzCAAKCRAWYEM49J/U
ZvMVAP90EoPkVW7VqHuwNlfls7tgNzziX1CAK5Eu6S5HKDVw+QD/VFui/pt6/cZX
xPsGAD7Fgq9WqgM4WaErpofj5IHf2gw=
=ZTi6
-----END PGP SIGNATURE-----

--1917ec96a486740fa601ecfd0c45a92a45394f0234bd152b47b6d3031405--
