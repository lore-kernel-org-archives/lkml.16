Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AF62D5C88;
	Fri, 13 Jun 2025 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813676; cv=none; b=UyawX48MzfJEz2t9GbH+04edJfox2FVsI7/SmbzO0J0CXs9jZ5mEnqimzFCQgn59UcjmbktJX3Ilw1ZoTODLMFxUw+KpWFhrqYpd6Qfl4Kzvc4q2AoGl7YHb+UHGhAABss+MDxrs+qitklo6t3zTXGW0KvT5EhB+DKCaMW0SZyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813676; c=relaxed/simple;
	bh=VzCFaO5EvYXj74XVYWA+TK4eC3sDvKCDu0tRrR2diUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfQDizQluI0bqt+IhiPn/GRjBHY3XZEMf8Ig6cES5iFHh8GwPkcq9bYmJSc5KhPZr8FgvhKoS39bXGvlGjanktORPJvUsBVzy1elvZXzeGDBogj2Qb+FKq15xdSRv/Ogs9N3u+iKwhdUqIWlOG/fou4/dFHpkMopSCevC9fOMls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLSqHlGA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLSqHlGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4A9C4CEE3;
	Fri, 13 Jun 2025 11:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749813675;
	bh=VzCFaO5EvYXj74XVYWA+TK4eC3sDvKCDu0tRrR2diUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLSqHlGA4oFY7mIM9i1/yuPltk0mRTbczmVu7zwjFyKb+QsgPbYjCzg0fmtemLDgR
	 +6pNPgIfDn7eGopIeFbAcv/QY6vyfK5Nhn+9CSUT08bjach1A3i8rers9l2BnhQOSP
	 wMG+4NNTQEb9fl8RNjDp0Kirok6t1mHDBikifzKx3aDEhb2SOaIzMnovaNh2O9FLIm
	 w6DJVH5o5BOzJubdRFwcNd3/QIukgb4MlqPWlDo04U73JBXz8y7c82ofHnquaNu9QW
	 6WzSw84oSBS+X2ewcPJ+RPmFraxdkLlBcM9Qch+50eTZbls4NZ61G8jDcSOPs6m0eQ
	 6OAfvA6ly768w==
Date: Fri, 13 Jun 2025 12:21:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH] ASoC: wm8524: Remove the constraints of rate
Message-ID: <db0f3982-b99e-4d90-8c28-9d49c3c5e478@sirena.org.uk>
References: <20250613035216.1924353-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WdELm66K4STULC2W"
Content-Disposition: inline
In-Reply-To: <20250613035216.1924353-1-shengjiu.wang@nxp.com>
X-Cookie: Use extra care when cleaning on stairs.


--WdELm66K4STULC2W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 11:52:16AM +0800, Shengjiu Wang wrote:

> WM8524 is a codec which can only work in slave mode, the bit clock and
> frame sync clock are from cpu dai, if there is any constraint, the
> constraint should be from cpu dai, no need to add constraint in codec
> side.

No, there is a need here - the constraint is enforcing that the ratio
between the MCLK and sample rate is within spec which is a common
requirement for audio performance. =20

> On the other hand, with the constraint of rate in codec requires the
> sysclk to be fixed, which brings unnecessary limitations on sound card
> usage.

A common pattern is to only enforce constraints once a sysclk is
configured.

--WdELm66K4STULC2W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMCaYACgkQJNaLcl1U
h9Bf9wf/bPtLXfmMvk8+lyQL0YwP1a4IdU6IgeLX4/7IwkqhztZoXBDjzcO5zp1a
Gf+55kWmz/3Kp5H0i/kiV1plI5RBKQDy8JYlFP7O852FqcFjKEs++yxUfVUC3ULC
g4CXglMJU/X+oN3qbnt3xGWTUym5B2T0FZJv8WH3pmg40mOMelu5N0iveFcNW+U1
FFWyz/PCq3Mi9Yd7/SB0zBljM30eUPEj4zzcl9Ms/19KFDZ4vw1k8jNphhc00REu
pgjFWovuNBtRJaBIlDOF/4KiyxeobGkLOK24gbkJlLx3nwf91ZFzRoD6mPnJu2e0
RWA+Mg1WMqWls5q1NWvO5Mnnhs628Q==
=w10j
-----END PGP SIGNATURE-----

--WdELm66K4STULC2W--
