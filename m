Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5D12153E8;
	Mon,  7 Apr 2025 17:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045897; cv=none; b=ajDr1XJaKSudkPjD3h++fWluYrkth/JbswDLFaFQU6xQk+w3aLtoiYu/8j9WGov9zthbUL2TeTA7F8ObDM6GpIPWT8UOt+0B37ZDeZo9lJ3nm6Xae0ioGbDV4X+J1bwDwUPlku/OOfSrnyDD9pgrsQYRuupS1cmiOsEEfOC37ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045897; c=relaxed/simple;
	bh=h8hkQ+a9L7QH3qLMb+9zOBt+y/DMLfKrkg17g1TKfMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfih0yihE1DiGJ3e8SLHqdZkr3j+8bxD7OZW4eXs133SgTr0Vx8Rn4fTYP/ihbOY1PgUzs5J432w6iY1Huxizd21fxSY0RqfSlH7mcFLB4ikeJpQC4esNJKgpTkmhPnHsFqu2MRw2dLK4gPEG0HXI3y3ZAigXDupd2MFB97X8Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDhbcY2h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDhbcY2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6013DC4CEDD;
	Mon,  7 Apr 2025 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744045896;
	bh=h8hkQ+a9L7QH3qLMb+9zOBt+y/DMLfKrkg17g1TKfMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDhbcY2hM1rGBBGrb6cP46UmsPPEIV4S2yLOnM2DgvyB9+dSSV4buTNHTEbQJM6sD
	 C6nnlX6+w/kAKjUN6fyI8dFldTvvCc93/PCFJBN7wfngkSOYs30a0WSWTtoJjj1FEd
	 2tov0j51zksxuhDAHjUxrw65Y0zsQsbT4st48vC2CCElGkAB3oCE//6hFQ76ECA1Jb
	 fQDEcUeV2YLnqR948sSMXInMLrAFX4jnkkMAE4a9vtBVbdn9gWFZDkVxOGfllJyur7
	 nxjSUQJ/KtarNGssQwnwAvBB5IxIzjuFxul90M4tdG6OOw/XReErskuksUrUeCBC1s
	 4sp2iwxnL/u3w==
Date: Mon, 7 Apr 2025 18:11:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] gpio: provide gpiod_is_equal()
Message-ID: <8377e050-59d2-4de5-8fd5-bbc26bb72b71@sirena.org.uk>
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
 <20250407-gpiod-is-equal-v1-1-7d85f568ae6e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q1RStVzK84G9v1DD"
Content-Disposition: inline
In-Reply-To: <20250407-gpiod-is-equal-v1-1-7d85f568ae6e@linaro.org>
X-Cookie: Meester, do you vant to buy a duck?


--q1RStVzK84G9v1DD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 09:08:14AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> There are users in the kernel that directly compare raw GPIO descriptor
> pointers in order to determine whether they refer to the same physical
> GPIO pin. This accidentally works like this but is not guaranteed by any
> API contract. Let's provide a comparator function that hides the actual
> logic.

Reviewed-by: Mark Brown <broonie@kernel.org>

--q1RStVzK84G9v1DD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf0B0MACgkQJNaLcl1U
h9AUnwf9Ema+8JLpJP+dNVdaXS4dwd4zlNxa4z+B/dMkxz7AnATG7MHBmuBhBnfl
Ly9wxIwoaVA/Y7RQp3W/V4x2lirJelRg8au/qzx07jxF5quyWvNCGUbodwzj3hN1
73rClWlh6wy5C9nUN/MpuIyF71fNywJwaGNX2W8XfdPr7p6jj6oZDcl8nYvt0hs0
ZLqlJ4Q5RvAwT0wx/iVKUA7HzMyQSYYC4498YPVmYTxJtkrd46u7m2os/BS8+VwM
7Y4tXv4xU3Hsv7Hr/m35GBkZKJ+CwHh35aCvrZVKnMg7pprA0wiUAwKkOqvnPn7y
QcA0lWwu8q/JKdATu3eEz5ZV/5qi0g==
=F6hV
-----END PGP SIGNATURE-----

--q1RStVzK84G9v1DD--
