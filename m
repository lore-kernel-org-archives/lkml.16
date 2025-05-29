Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC4719EED3;
	Thu, 29 May 2025 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748482093; cv=none; b=bVK5V/C7tmQryRgjTjSKnA1/iMIj9RiJoFuLebRq6Hja7tSpQXvkp33mZEgQhuhklOmspVaYAd+j9vkY2FHr1bTZ4dnpA1ARh/wHG+KCuxCxHakhllqrho3hsC4756TYsYme9siWTANmWzJSN88RYoIX/qkRJ9QdtyV7S8os/kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748482093; c=relaxed/simple;
	bh=jqnorrBw8WKXKlYbmOCJtgDiXmZMkG7t4CSzybmUHBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtKc1M9YiOijJmydvQUAjwqFo57bMQg3SSVfq8s/ONPirUa+CtSYpraNi3mt5AddKsXGFe+RksIOFdL5cXlAzNEX5Ta2eH9QF5b4IXAao2FoT2JbFVKn5vuI0VAscEjnwnc+LS8/rQXimB83dxsQOViCcykoW5BkSBWeiLGC2mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzJE8iWc; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzJE8iWc"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso275738b3a.0;
        Wed, 28 May 2025 18:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748482091; x=1749086891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hoeXSFYRWh2i4KgtON46+79vyPFN+5fYuOEhE49cAOI=;
        b=XzJE8iWcwHdxqV+FY2qX8Al8Kog+XeT4F9CTIf6XMphfElD3fC8j/JWU1ijpHoCj6F
         wlRxXzrcDXZwA6DC8gpIJqpfu20IJxTlaftIBBdOOjSYGIeeiAIN2GTux8vEuLPeMd/7
         TOupmZ1KQ1HI2IlLMqqFNB+Eh4eDQt3+yOn6DSFojpfl3PVZCJMj96qkGZ1WoRVLFZo2
         metbrIspDrVi0uGQdlcjYGUXPx3xWBBl6fuFr77lj5Vf0lks/0qzxt0XP1vtr0XFyGT2
         /Ppv7Y4daGF2W+nfDUCTGBg4njdnaMbL897oc1SG2PABL5QVHTeQmASNIsE3x7OiNsao
         oIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748482091; x=1749086891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoeXSFYRWh2i4KgtON46+79vyPFN+5fYuOEhE49cAOI=;
        b=o2GjXIwBuC5xxR6b0lLox/pgi9iHl+KH2MKruSqM/AyG/RXwhcEfG0QjlfpwxhN/aw
         Poa5Fe+r/CVGaOaXKpYm0dnAkfOh9zCSz5E/xFpa+ddPM+JWDtTlusgq8yvIeYhNYelQ
         r+cL9kKgdC59oLmnaIPVmBaMSOQSxlKMcyVPoylMexyXjqJWWw33nxRYUScm+8Hxw+a/
         lAEMj6IVL3o2dA4QWmGaMCQD+mBJSW7ks0K7OVDd9eCIGI5lluNmUn8g99tD9U/LZamp
         Ep/a5ir1/tLeOAX3L9qfAcE74r3M99nqPRKPnrSh9422Tst326Rd8EwEo5+CO0GNFs6T
         l1HA==
X-Forwarded-Encrypted: i=1; AJvYcCUqBph/TZVgRUHRBlmMynbET9vlCn2eHpfu2L8up6Ul7L5t3jXLoz8kvUgaw2vEeZOWXqL6Z8HTexz/Z8qE@vger.kernel.org, AJvYcCXlgCTzQlFM4l1lUl1guGUZWnWy18QUjyfj1pkSeQo7ma2waBPP3voOLrA0MmTWZ5BJ446Ueysf/WY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcB3HY2ViradU1A8N1lQnC2N1+PSpRV4yrm7G3zbq53tTWsw0D
	/v/XBtNOv39vloC9IfI8eRctrVWShHPZ5rzd99kzDpAOGVHachqne5Ak
X-Gm-Gg: ASbGncsUFXZi6/KkX2gPYHqBSiHFr8ZLjWdExQ1OwhjJUYfoJSCInuYsQsnOFfxSTKN
	O0Vl0tXZKmq8cMlH9wwStjbUd4TCTVnG4p+aZLFYJWKyn6mtK1bn8+vpao+8TxNs0SmrJsZ+gX1
	yJhI24OH6WDhn/ZqRJiRy5uUz+g+6QInCTF4iWaOSwBKyCjX6iGrkGpDToZXpnrh/QO1TyP3HnQ
	3aJ91uMnnmQy1unCCYfmjn1w+DlQbqkJ9iHcDcPpgpf84DnETOfr5ox3rqB5+xX3/dZBw8Z2YKC
	kgCOl/FLg/CbBgSln/G1TgU7gvLfVUbTeqN7lHg6/A8cp6r+c56GQUZJxebLDQ==
X-Google-Smtp-Source: AGHT+IEz+1R42eNysUwZ0fqEej6CVAYfSf8TKl3yY1k7/5eS4TAR5HPasxyR4xeGfgyqO10P1uKdmA==
X-Received: by 2002:a05:6a00:3994:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-745fe083439mr27047681b3a.19.1748482090915;
        Wed, 28 May 2025 18:28:10 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab6a7sm253212b3a.59.2025.05.28.18.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 18:28:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0B67041E4844; Thu, 29 May 2025 08:28:07 +0700 (WIB)
Date: Thu, 29 May 2025 08:28:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm: add overview diagram for drm stack
Message-ID: <aDe4J8Cmlzicggx2@archie.me>
References: <20250527-drm-doc-updates-v3-1-58e97a831d03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aC/adGMqQaMC2iPq"
Content-Disposition: inline
In-Reply-To: <20250527-drm-doc-updates-v3-1-58e97a831d03@gmail.com>


--aC/adGMqQaMC2iPq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 03:17:43AM -0400, Abdulrasaq Lawani wrote:
> revert promotion of overview diagram title to that
> of previous commit in introduction.rst
>=20

The patch description doesn't really describe the diff below, which is
to add overview diagram instead. Maybe you can replace that with from your =
v1?

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

The diff itself looks good.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--aC/adGMqQaMC2iPq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDe4JwAKCRD2uYlJVVFO
o1vSAP9RDdnvD215ocVJi8rTafh7HN5OcFggjOd1N/NN53BQMAEA1/hsLPZqX2Zd
BajmnAxuQKkeSKG/0y85fJPYpq7JNQc=
=1KWA
-----END PGP SIGNATURE-----

--aC/adGMqQaMC2iPq--
