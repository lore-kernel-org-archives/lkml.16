Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC26EEA8;
	Sat, 28 Jun 2025 01:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751074227; cv=none; b=QpFRFPnJXs/18kLFJzy0IqG9KPw7lUEZsuV+YRFSlNCtKXA3gEuZ+SxgKB+hEaRdYiXwILIfwNa5OZ61YxpiLQJPlq/PgN274W+EZk4NLllRaqZ/SIIXo8h4eSMRn5QBvMGuZyCTKcJgYX7GWjmqTtyBOG4EoAyCct66aZZmkKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751074227; c=relaxed/simple;
	bh=4Qqib250C3wp/3ZPlTZ2Y0hOef25YveIWChH8p0ROng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXlJr42D4iswOaX2Q9Hz0C5QiAaOp16JU8fqhmVqDim+A7Vm2eSvgWSXMbs0FMso32ZYgOe/M7rRELSNF6C5U0ko39MlO8HmhJzhJ6Rfh2JAWBQhebUvwbwW80sQLzIefVCCIHXSp1mDAWB0WtICdOJyXPOH6+h2vwVyXffoAtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaAcVVAq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaAcVVAq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235f9ea8d08so23379825ad.1;
        Fri, 27 Jun 2025 18:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751074226; x=1751679026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y8AXPmpG2VMuBb/O9YnQP2cAp0A39EaY7EJfwm1hV+c=;
        b=RaAcVVAqnux7vagv3HarICFaaclQ8DeyOM+42A/t/YZrKlO/bjY3Zt22h1QrjaHnAK
         hVDqbx0BgsimJmncYWO4x0pHbzoHg/j2HiCAtQBAYSbcVIeR6QiedB2WAL6XkfUZOKb5
         /ylU2KR77E/94xCww2+ROfW0VR4RD3nxsXSaU3fM6Bp3uG6bwEPwXI4fV4XjyV3TqlBy
         ERuDcZRXsNKwp91n1xjoBRvJltqfm+MG5RWQiARLzMkPU2S2+RyWGVhj7Z0CUMzs3eyG
         uDGpgrGyTEEpkuEByZ8lr9wkHcWloPtQQDCHwTQxygGzek1wwiL5R3SAk5AgKm2vHAxO
         ckxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751074226; x=1751679026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8AXPmpG2VMuBb/O9YnQP2cAp0A39EaY7EJfwm1hV+c=;
        b=R5xXmA9Qy/vKZYmEHew7yxdA4HmiYmoD/ncMuHA9VlhNOR5s0bjem4Wr3aGPZWuexj
         aowk0XgJy5WwZfXG7s8mwlQ8RFZLAMbEMNYR83Rs9Gk1N+7FBprNAlu8YgD+GvEoJKyl
         b9uVjr+cQPNiPUqpRsGEiDVy2XeZVXkK0CJShcJJBl0VioZyWx7kRJgBDE9ZRSKChZ8D
         8yKM6XkvIax+riJGmSG0/gbtPKnPYzTgytm8nGLEtPxwdHjmo1N3hd791QsE5beLfZtX
         3FxxekVZ3LKX40RFYTpfvaGDHPMZNLSzIikQvP3qLHZGNQo+DqAwjOITIkjuVtR0Nw+E
         sZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpKD4qKDH+QqznXKYJvMYecCMsdt/HDUr1ImQKJvLx0+M2bW20dKRWtL8JDU/aBBkQAnf887rqa8pL4aOM@vger.kernel.org, AJvYcCW6/8to1WAzP8KzCdndgZFhBOZYBN+Ap1tALFiAQVhf2uCgn7X1nuyf4rLxSLB3uZLYdrQY3Gm+Zuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLjrswcnxmd5OEdILnZZdKwD6ex3g2/VsNWMsmiEL6/39P5Ywc
	6/WxonbSngSLBZaVGHSjMX+gB+cmQEft4Q64WrltwCmdbFR79+Tetsuj
X-Gm-Gg: ASbGncsNTpq+AQLi+owZSEwJXiLJsZqI1x5aqA9yRm7fOgfSGgU8mF1WuIjvQRcl8GV
	YNH9oNZG4VJyqdXI5OX4yysvOCqrktLjSJqVHt/+PCIG/XllkM4yuliW3JwCylOZdgl3DYyxmXs
	0jfxp8aKGdDY3ujTQEPSAfhZzTFrZgOV4RjP8pJyJHDzpXyYYC0+15v+rTLkNbQC2uVkM5hkhah
	HrZj6Sh1TATAdtAOKNzjnPD0oOvj5CmLc3xKyyLzQd+Esbw8sTxWiNMcxtzAu7/qAhXUhvErG/V
	Kxe5RuOcfb0zKaNCRZ9Xfl29ieGSepec3/lJbR2eE+vRl/9aBRJslVv8uno80A==
X-Google-Smtp-Source: AGHT+IEhpBuJ3GjJ2GV96K93NPQPaz+CSELR+iF2uzhaORXUXQQfB5dul2kwwnAmFKMrTiXr3jo19Q==
X-Received: by 2002:a17:902:c401:b0:235:f4f7:a62b with SMTP id d9443c01a7336-23ac4665179mr88553105ad.41.1751074225506;
        Fri, 27 Jun 2025 18:30:25 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c90d5sm26854075ad.247.2025.06.27.18.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:30:24 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7A3DF423BF27; Sat, 28 Jun 2025 08:30:21 +0700 (WIB)
Date: Sat, 28 Jun 2025 08:30:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>, airlied@gmail.com,
	simona@ffwll.ch
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2] workaround for Sphinx false positive preventing
 indexing
Message-ID: <aF9FrVzkZHrIRKEa@archie.me>
References: <20250627115718.17673-1-kevinpaul468@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jygN2+v8Ef8hw9M2"
Content-Disposition: inline
In-Reply-To: <20250627115718.17673-1-kevinpaul468@gmail.com>


--jygN2+v8Ef8hw9M2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc'ing Mauro]

On Fri, Jun 27, 2025 at 05:27:18PM +0530, Kevin Paul Reddy Janagari wrote:
> Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
> indexed in the documentation because there are structs with the same name=
=20
> and sphinx is only indexing one of them, Added them to namespaces as a
> workaround for suppressing the warnings and indexing the functions
>=20
> This is a bug of Sphinx >=3D3.1, first reported by Mauro in September 2020
> Link: https://github.com/sphinx-doc/sphinx/issues/8241
>=20
> Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
> ---
>  Documentation/gpu/drm-kms.rst  | 4 ++++
>  Documentation/gpu/drm-uapi.rst | 2 ++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index abfe220764e1..b18a99869b6d 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -357,8 +357,10 @@ Format Functions Reference
>  .. kernel-doc:: include/drm/drm_fourcc.h
>     :internal:
> =20
> +.. c:namespace-push:: gpu_drm
>  .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
>     :export:
> +.. c:namespace-pop::
> =20
>  .. _kms_dumb_buffer_objects:
> =20
> @@ -473,8 +475,10 @@ KMS Locking
>  .. kernel-doc:: include/drm/drm_modeset_lock.h
>     :internal:
> =20
> +.. c:namespace:: gpu_drm
>  .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
>     :export:
> +.. c:namespace-pop::
> =20
>  KMS Properties
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 69f72e71a96e..e9d7b7282a19 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -554,8 +554,10 @@ DRM specific patterns. Note that ENOTTY has the slig=
htly unintuitive meaning of
>  .. kernel-doc:: include/drm/drm_ioctl.h
>     :internal:
> =20
> +.. c:namespace-push:: gpu_drm
>  .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
>     :export:
> +.. c:namespace-pop::
> =20
>  .. kernel-doc:: drivers/gpu/drm/drm_ioc32.c
>     :export:

Works as expected, thanks!

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--jygN2+v8Ef8hw9M2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaF9FpQAKCRD2uYlJVVFO
o30+AQD0JcVjSsCcFjAd4jMRB1T4R+PpgE/ka0f8n3tq9MD4NwEA+FwOlvSfVA/C
MuG6SuSMSTogXWQx14VDQqzEGzhx6wQ=
=PST+
-----END PGP SIGNATURE-----

--jygN2+v8Ef8hw9M2--
