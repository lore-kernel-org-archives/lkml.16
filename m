Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BBD2248A4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010043; cv=none; b=EvdJKHG1gs98yitjXx/c8jxEO6QX8ihqVKbsuCUnb+HOWc6SJazd2VgaSNUWoOjEN2qTx4iRUwxmI/3y8AqkcJILbdS9fRdgfRvRlODdHPyLUfT3DVoPASu+r5IBYxUhqiqWww5LBrre2MS0XnGC1aMx/t0MdWUA7yb6n/gj6O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010043; c=relaxed/simple;
	bh=Vik9Kl1OnWUvLSlBk9v3zimdZysvG8TJElj2+wcY2ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ/zeySXKuhR+7zHQXM+SoVfPGKX/TiOftbJveiz6+BwRd6zS/29b5wBj1Gd3emGRWGElmgxH8XDCy2dsHLLxALOr8/G40i93r8w1vdoTHj5fTWWskFfRctZXzAvwZK3zCeIBJ89AyAdIFTp2OkWoHc8wCIboJptX3YSdbxaM+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdKqgeF7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdKqgeF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0470EC4CEDD;
	Mon,  7 Apr 2025 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744010042;
	bh=Vik9Kl1OnWUvLSlBk9v3zimdZysvG8TJElj2+wcY2ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YdKqgeF7KjA0dOunC1QwnM/KBFZNIQRyVPuBoB+cwfq7Zm9pGkT2+CO1Y+iXhNfhS
	 Z4/IzzwdCUnF7DjgZT5TCUy2jLXiw2IxI8kAzPC058T/Hlr9HM7BrTKFotqDcChADc
	 SSBhMXmUOt4bMgd4SEsPFsoU9OHk5uTYXhbjjFWtqi9AWEHv9So1xvGzZFD1+RSHct
	 l9xjWLy8jlXARnUw237dA9YTzXw6SDYVjQlaHNLuWCup+bOaVhJ4B2cjnEduN1w7qT
	 2t/UoBubjeW3fsAVyz9N0AdsdH5Dfw6HYin5ojOkTim0E8lxwPvSLtcOKm3LxQfrJ9
	 bPeWRB9yh0l3Q==
Date: Mon, 7 Apr 2025 09:13:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: sunliming@linux.dev
Cc: dave.stevenson@raspberrypi.com, mcanal@igalia.com, 
	kernel-list@raspberrypi.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, sunliming <sunliming@kylinos.cn>, 
	kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/vc4: fix uninitialized smatch warnings
Message-ID: <20250407-colorful-important-saluki-5e4ac5@houat>
References: <20250405024503.694981-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dcazzgp6om5urcyf"
Content-Disposition: inline
In-Reply-To: <20250405024503.694981-1-sunliming@linux.dev>


--dcazzgp6om5urcyf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/vc4: fix uninitialized smatch warnings
MIME-Version: 1.0

On Sat, Apr 05, 2025 at 10:45:03AM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
>=20
> Fix below smatch warnings:
> drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: unini=
tialized symbol 'ret'.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  drivers/gpu/drm/vc4/vc4_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 8125f87edc60..04ea1696fc5d 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -582,7 +582,7 @@ static int
>  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
>  			 struct drm_exec *exec_ctx)
>  {
> -	int ret;
> +	int ret =3D 0;
> =20
>  	/* Reserve space for our shared (read-only) fence references,
>  	 * before we commit the CL to the hardware.

I don't see a code path where ret is used without being initialized. Can
you clarify that in the commit log?

Maxime

--dcazzgp6om5urcyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ/N7MwAKCRAnX84Zoj2+
dnnpAX4p/k+3OSHIvHET/V8fbdfhdVwBNlqRL7LZ2Fr0GVM6Obd+QRYTXZbjhp5v
XZFVV6wBf2UbqWQOG6wq+GkK8EfOkZ57n/4XfTDLXB6yQyBEs1Ukd/LiBWWenKp5
45zpM5fWzQ==
=PWYe
-----END PGP SIGNATURE-----

--dcazzgp6om5urcyf--
