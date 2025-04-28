Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4267D2BD04;
	Mon, 28 Apr 2025 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745799768; cv=none; b=H6n4YO0QvyNo7ot9qR1RT7y1WdGNp9GYPUgRYO8vUN/182c0Hsbtl8/rWRfXr4BFjk21ImBoCozW8yDGljitUGjllvCDJIhGDr5x9cKykYiE18YWwiksBXeJOb7k50MebxWz2bUdmJUOUH+rSsv7LRTg6b+eO04RbwUW91cs54U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745799768; c=relaxed/simple;
	bh=o3Y8++em6BntFy/iJ0Bs+leDdTUv+5UcJkVxqNnXJ3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8vJ1B6xfdHSyo5LqbMyGUVirr3gTqMMeGO1hkuvLlUI7bCykSbw4OH+mtCQR/OB8RziEXM91xL7LLD2X9czWpq4f8y/keLlxkQ55vYqLKMOsuS8Gn8K2EBEoOJ7E7+fuz6n0eAtWUugY/Zm9oKz3HoYM474GQOlKfsloy159v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtI/lOBy; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtI/lOBy"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f8657f29so42488406d6.3;
        Sun, 27 Apr 2025 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745799766; x=1746404566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HJCWQZW4hGQGf67LTdXxkCl/qK/WpfJzH4jOsILNh4=;
        b=YtI/lOBy1QE2d9fniaq+hJFdc0N/5mQaQZjL7RJ5n/22xoZxrdy2y1CQ9gx5coCGXV
         3nmieacy9og7Y0TulTOwXHnCAqDKWj8gg5rtuHLZjJbmoCmPnXLHRJUZfbgKErMoyCjA
         USGqNnmlAEpCCcUoP4+/POBivHJnDk+QDCWETZ8QWrstpLoNf+gOZH1+XbPYJwU0N6FG
         4CT7y83Q0GjK7TF2c7wxygWyDr2Wh2CvIBwYrzjkOWeGgRjA2cV4TXePzPEPoPZe+qYf
         74FaKdHKFp1KWpNH+Q2b4KiWiGSatOzP62ooPt9fXBYFpZe5n6BAda+YBlBcsXfO9S2q
         6U8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745799766; x=1746404566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HJCWQZW4hGQGf67LTdXxkCl/qK/WpfJzH4jOsILNh4=;
        b=WfNucShKsYJ7DYv2R8hRbxuNAC6NA2XTm8Jnwn1gtFuIa2k0Rp6y2DPScs9yUcBB86
         99kPzyhsTUhnHMUyAo2Zac8swvD15WnOMtxiCHOgtoZVhj+y84T4dgrVmZnYEFzpQIGA
         c5/j8b8pXQTGF5jodImZ2oEp3bUkQfUgOfxWBrLxARj5BnzwJrsSlZ7Z4uuJP6LYM7F8
         lCHOijQ+cmB2udFTsRqjvd9ATdDLkeI8xwpvSWpdf/2Qfp7+5ysVcOIw15boCYv+/SOT
         9SNB6GTWwHWwcY0I9Xc6J6DAbnzFmMH9q8Pi8BBMUO+Hnr7CYY0mSN5i+rUdKrEUIAbR
         Xzkw==
X-Forwarded-Encrypted: i=1; AJvYcCVR/REirVB9BH3m5EArYRgtToNiTj1P272yb9KeIbhqLhTDNSHmcQjD7QnvjLm24QPke9Hlon7tkcEBumqA@vger.kernel.org, AJvYcCW2oqvtEa/tIUMAXNa3r+5TKHGZbAEKOMITnxYvOa8AmcjuNL/K8lqdP/9EQe0t2ZviJJbpT5A4u+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YybjmU/oUfEc4KbP28DXMuaHFn/bYPZANHZb5Wu8+3Grpa4raa1
	uqizTQT70dBFVLu5aKBe8S/inah/9bPdjLchFXOIRIDr7lqRuMvD
X-Gm-Gg: ASbGncvhVYrd22DBXHjjPMMGjuJwG73qXsm5ybnPIn/DwKR2svLb5mSZsIqmLP3Oin5
	habtAWsaY3/+sGq0j+CQ33Mh1GdalVbTJRPMeshr3XO97K87IKI+Ua+kfU3sD0aNC8etwWZFPow
	7x8GgXgtsWRmZ7DrlSU7vgKV3QM1zvL7HTkqKg2IZ4sqfLsFtOMuPTZPQZhlU5uxyQ9ChXhdNAt
	z8pbAQkBpHk4lQ5VMRzyxkDkNUps90akLWaov64fD++3DwuUblbHTgR2oZxYJU/YGY5/uGCZxtA
	qf5/Uwk6hZvyCwUyiFROpiykbwUm61+8diFqkF0c
X-Google-Smtp-Source: AGHT+IGoZE/scbIyCQO8VQ2U32mc4lOUJMKFNJupy8GAMuIBcPUOdIOTT/ACOpZAR4tz/4tAoQuvnA==
X-Received: by 2002:a05:6214:c84:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6f4d1eeb8f3mr135298516d6.6.1745799765883;
        Sun, 27 Apr 2025 17:22:45 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0ab1131sm51998826d6.115.2025.04.27.17.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 17:22:44 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8CBBF420A693; Mon, 28 Apr 2025 07:22:37 +0700 (WIB)
Date: Mon, 28 Apr 2025 07:22:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ruben Wauters <rubenru09@aol.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: fix unexpected indentation in docs
Message-ID: <aA7KTVwwI3Wvz_JI@archie.me>
References: <20250428001249.112238-1-rubenru09.ref@aol.com>
 <20250428001249.112238-1-rubenru09@aol.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YFeX9WsCB8go/Toj"
Content-Disposition: inline
In-Reply-To: <20250428001249.112238-1-rubenru09@aol.com>


--YFeX9WsCB8go/Toj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 01:01:41AM +0100, Ruben Wauters wrote:
> make htmldocs reports unexpected indentation on line 1119 in the kernel
> doc comment. This was due to alignment of numbers (except the minus)
> which caused indentation. This also had unintended effects on the
> compiled documentation, with breaks and indentation after the -1 option.
>=20
> This patch fixes the error, and changes the format of the options to be
> more in line with others in the file, while still keeping it readable on
> the code side.
>=20
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index b9a1ef343c79..6ddfd3ace2ba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1116,10 +1116,10 @@ module_param_named(rebar, amdgpu_rebar, int, 0444=
);
>  /**
>   * DOC: user_queue (int)
>   * Enable user queues on systems that support user queues.
> - * -1 =3D auto (ASIC specific default)
> - *  0 =3D user queues disabled
> - *  1 =3D user queues enabled and kernel queues enabled (if supported)
> - *  2 =3D user queues enabled and kernel queues disabled
> + * (-1 =3D auto (ASIC specific default),
> + * 0 =3D user queues disabled,
> + * 1 =3D user queues enabled and kernel queues enabled (if supported),
> + * 2 =3D user queues enabled and kernel queues disabled)
>   */
>  MODULE_PARM_DESC(user_queue, "Enable user queues (-1 =3D auto (default),=
 0 =3D disable, 1 =3D enable, 2 =3D enable UQs and disable KQs)");
>  module_param_named(user_queue, amdgpu_user_queue, int, 0444);

Already addressed by [1]. Thanks!

[1]: https://lore.kernel.org/linux-doc/20250427023625.14327-2-bagasdotme@gm=
ail.com/

--=20
An old man doll... just what I always wanted! - Clara

--YFeX9WsCB8go/Toj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaA7KSQAKCRD2uYlJVVFO
o2vHAQDWQrSZ+f+jeX8db64tRLxnS5g+NAZR4wUfI0JnrIhWPQD/ZdlwDSG9slj3
0GjiSMBt5SG5kq6GPFJ615LABFDFtAM=
=2nVY
-----END PGP SIGNATURE-----

--YFeX9WsCB8go/Toj--
