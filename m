Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD00D4C85;
	Mon,  2 Jun 2025 01:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748827715; cv=none; b=ie3vEBV5Z1EUO+AQVzqXG1fsuUm8rZHKnYNsuvM0rMEN1zctQqqt4zEWTy7oZwq7o+8lhXYBxLYS1ZHujZNnth5rOxDbD5xd9FATV5X/a+luU+UHGlL4Xgsaqx3qp7Ray+SRMZEKNmOKra4qYEm5EaYPahTSQ7AQsYkwZixpDjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748827715; c=relaxed/simple;
	bh=GSMhuCkUTouMCO3Mw3XiI2bRPu+XGj80R3s5HZm28sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZP3ADO/06wUamGKJvHUtZZPYTOEYDKJu5Be6etJkp0g1jQuOb82N7aVEfl6WQ98V7VHR8MCNth/KVkRixLgQ/8BkkPHL2yIloZ0JHQnPWXo9Likacd+3DW0JaoweVkKGTAeJSlRn8rbNHKmYn6TvxVXIOi4uVVD8IsjROmejMLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvoYAsGc; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvoYAsGc"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c46611b6so4594001b3a.1;
        Sun, 01 Jun 2025 18:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748827713; x=1749432513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rIuuG42987mfkoJzwQaJbrpT4E2UM7n24cZCLeM9y+o=;
        b=KvoYAsGcBctqOAK3tKXVkL0j2hQ8PtKoEci9tTsRYT22ibDceppwqu9yqR9wkIXviV
         jk1cWdVAuCby8IdhaQ3Qifi4p1bgBGaXGc3NaJuSvcBBi+AFvv52EYlzk8rlIZqMTweu
         BM8u3DOmbiYSR/zbYlqBaLxgEzh7RM8muv0s7RgvgmPMeHvkbm5PD/YvIQrn+JXQr1NI
         VpNYtrpjHoABGq+yq3Oes8EM5SZUnBxise6o5OsKOuoaLCBYdEUfljAp4ojdIbD7LQ+n
         KQMkTGPdTDUPnpc8b8GNizha9kPtvoMbwvq+v2HpXc/DrnoReJFUiqwzHGSpV5W+x+F6
         EyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748827713; x=1749432513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIuuG42987mfkoJzwQaJbrpT4E2UM7n24cZCLeM9y+o=;
        b=sAsteQkjXRA1RM+R04lCtlsAgseXud9Q9nDombrBMOcBVViUoEVTxXziufOoF6169D
         ru5b8zeqgR9wUi6n0zIj4wLHRHHmOuT3Fb6UJjn6IgzYvIY3fVp5AhF1JRFz0QgG26LV
         CDvRB0gw0tSqDRwnv5GSGSHjOC/R+E7x6CZLuJ91FdJJxryM7IQVlkj44js5ePubtQtB
         0KB1r+Aym8dxu955Hz+5PPbw/tQEmiHi2fm8jMzptD0lSo298Hy9IXYZkTBvgxJ4vTjB
         W4NLSz9aoPAspo/Abo8CF2rtNKeyGu1HE8ElyguD3/RqLdguZ4ovrvyxNlOYCubbot2a
         k8xA==
X-Forwarded-Encrypted: i=1; AJvYcCUDH8E/qdY31zF/mKHCKZmG9tBZavyEPdijCPGUMP5kQ9n801weHrNBgnoqsAvjqf1hiuixoW0hLkCqlf7u@vger.kernel.org, AJvYcCXXNANDuF5UUgXoqcnGevk6IhC4UDk8FquvQouPkKmcVbsBc4aYVJNVEVnFmNltG9xoWS2yX55PZm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwojarkoZ12ZJh9TZFUn9XhhqG3IZuG/amlVaaT7INqeo2bPziM
	ZGQwlQs3deGhVDEp1pNLEr55xmwLy0e1gM3alebBrjWvRQH1dMll3KbP
X-Gm-Gg: ASbGncuFiVG9dongOERwaQ4ASZU7saoCqSFLu3KCiVukA41FekGlP9lP4Pa4Dh99Ydr
	rO6ONT1p/2DrF9CRaZU03bv3oEr0QmDU87PdYqVFwi4Qv9ORJKGS4r0Gbb0mzZpuz5wsBEvSwi1
	du2SE9rIgtj8nG0E0y3sAQUUL3v15vw7DGFysYte45M1pPe3Ttnwzi/WOPdTMoLJkGOK4d107Bv
	/xDsrdBDm7eG+d3c+kEcMVlZSv2NQbcAxrGVRycGMDXenqb3Gzzd5OA0IVVEFzIR0ozi9yn+ICa
	mzOdpn0b7S/yIdOsRgSwzmTW3Pb8BxzL8CEFkxErfSdEyqTGVvw5LhxWvfQXnw==
X-Google-Smtp-Source: AGHT+IEBKCmgKDbpBseOlmrgXxmiDooBrj9LseBav0q71CMCKp7QIsKPUb/WVhWv1cwtRXM5cn0jGw==
X-Received: by 2002:a05:6a00:809:b0:736:3be3:3d76 with SMTP id d2e1a72fcca58-747c1c2f569mr12167910b3a.17.1748827712939;
        Sun, 01 Jun 2025 18:28:32 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafab3sm6468548b3a.88.2025.06.01.18.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 18:28:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 590B24209E8C; Mon, 02 Jun 2025 08:28:30 +0700 (WIB)
Date: Mon, 2 Jun 2025 08:28:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm: add overview diagram for drm stack
Message-ID: <aDz-Pq4eMAYmzqsJ@archie.me>
References: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0m9bGV+m6U5l6pls"
Content-Disposition: inline
In-Reply-To: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>


--0m9bGV+m6U5l6pls
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 01, 2025 at 06:18:47PM -0400, Abdulrasaq Lawani wrote:
> Add an overview diagram of Linux DRM architecture for
> graphics and compute to introduction.rst
>=20
> Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> ---
> <snipped>...
> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/intro=
duction.rst
> index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec52a4=
5d0f3f4561424e0 100644
> --- a/Documentation/gpu/introduction.rst
> +++ b/Documentation/gpu/introduction.rst
> @@ -14,7 +14,45 @@ including the TTM memory manager, output configuration=
 and mode setting,
>  and the new vblank internals, in addition to all the regular features
>  found in current kernels.
> =20
> -[Insert diagram of typical DRM stack here]
> +Overview of the Linux DRM Architecture
> +--------------------------------------
> +::
> +
> +        +-----------------------------+
> +        |     User-space Apps         |
> +        | (Games, Browsers, ML, etc.) |
> +        +-----------------------------+
> +                      |
> +                      v
> +        +---------------------------------------+
> +        |    Graphics APIs   |   Compute APIs   |
> +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> +        +---------------------------------------+
> +                |                   |
> +                v                   v
> +        +---------------------+  +-----------------------+
> +        |  User-space Driver  |  |    Compute Runtime    |
> +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> +        +---------------------+  +-----------------------+
> +                |                   |
> +                +--------+----------+
> +                         |
> +                         v
> +                +-----------------------+
> +                |   libdrm (DRM API)    |
> +                +-----------------------+
> +                          |
> +                          v
> +        +-------------------------------------------+
> +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> +        |     nouveau, etc.)                        |
> +        +-------------------------------------------+
> +                |                       |
> +                v                       v
> +        +----------------+     +-------------------+
> +        | GPU Display HW |     | GPU Compute Units |
> +        +----------------+     +-------------------+
> +
> =20
>  Style Guidelines
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20

The patch LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--0m9bGV+m6U5l6pls
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDz+PgAKCRD2uYlJVVFO
o9tLAP0Sow5tlzIKu7aF+0vKKkRtHELvknXuFL5ejOAt+TAvmQEAiYUMmJTAcXAz
YTpp61irGM5dwEpWDqxDhJ0J+PspnAE=
=L4Sj
-----END PGP SIGNATURE-----

--0m9bGV+m6U5l6pls--
