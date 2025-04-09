Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC7E1EEF9;
	Wed,  9 Apr 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208650; cv=none; b=eYDCpEXQUo9TVB4KQNkwAvg2Ps7eAkDQyJ+pgyWR7tKKamzXaTj3rbTYL5WxbqCBSIl6xz6+kuPfqaXO7jOX94/EIq7PzopLzx6sn0Kw8vQPgT7XjSv2pbiauvRHiFa9xgfsCtbs2qvU+QqPyHv70NGPDaQrHUJKire8t8c3jo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208650; c=relaxed/simple;
	bh=+bUKzVAvFQYvkMjsCyigBf4UoBW+YWb6/sF+uZDucnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwuqcEHK29cKn/iv/5SXHID7WDU2Q1sJIOassgFoOqN5LTF8Rsl2r3Ut8BGVj3BAtNPin5eoTmL+HoESfwgvNYqxETuecTZcITRmaJDtDqQ/fo5IW9btofqrUQ+YDRzEF5Le9DRiCh2dAMoVZvUvR05xfNWj6gBWAjxTHgxtjdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pz7C2Awi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pz7C2Awi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D34C4CEE7;
	Wed,  9 Apr 2025 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744208649;
	bh=+bUKzVAvFQYvkMjsCyigBf4UoBW+YWb6/sF+uZDucnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pz7C2Awi2qN3TQS6JrMYXalXUoAJ8NiXCAj2KDVU71iXJrHuklPN63FU4bgUz0hP5
	 1wkjoganzMXRa5vI/apOM/XrMxgrg2PN0KMCwmAA4fhbjRWtYTSVuwzmGCghoCfS/C
	 JtpiMyb7iyFMPyncMFtQfMHfkfDWo/L62omJps7KT0KEvkTyvv3jFKlz2iXcNgP3Fo
	 BKwImXLAv+Xi8/RLn+Tq5Be3drgBPCjtv3uGPsOfv9Ox9SV4nhFooECBYsDqXsIHKZ
	 UdN7brVOZwzeJA09ypJaPVLQkZ1Q08ZJwoX5hHvswn+tEN6X63wxzqH4O64s9o9XRD
	 5bfuX2uBk//6Q==
Date: Wed, 9 Apr 2025 15:24:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
Message-ID: <a47c2074-2e28-43e6-a7a1-c3ac662723cf@sirena.org.uk>
References: <20250409104544.878475-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LjPT8NQEUqQoI9cF"
Content-Disposition: inline
In-Reply-To: <20250409104544.878475-1-rf@opensource.cirrus.com>
X-Cookie: Surprise due today.  Also the rent.


--LjPT8NQEUqQoI9cF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2025 at 11:45:44AM +0100, Richard Fitzgerald wrote:
> Depend on SND_SOC_CS_AMP_LIB instead of selecting it.
>=20
> KUNIT_ALL_TESTS should only build tests for components that are
> already being built, it should not cause other stuff to be added
> to the build.

>  config SND_SOC_CS_AMP_LIB_TEST
> -	tristate "KUnit test for Cirrus Logic cs-amp-lib"
> -	depends on KUNIT
> +	tristate "KUnit test for Cirrus Logic cs-amp-lib" if !KUNIT_ALL_TESTS
> +	depends on SND_SOC_CS_AMP_LIB && KUNIT
>  	default KUNIT_ALL_TESTS
> -	select SND_SOC_CS_AMP_LIB
>  	help
>  	  This builds KUnit tests for the Cirrus Logic common
>  	  amplifier library.

This by itself results in the Cirrus tests being removed from a kunit
--alltests run which is a regression in coverage.  I'd expect to see
some corresponding updates in the KUnit all_tests.config to keep them
enabled.

--LjPT8NQEUqQoI9cF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf2gwMACgkQJNaLcl1U
h9APhQf2IkAczMn1TG1mpvzVIO9PkrIMBo9XUTw/LAgmriLVU8bTq+Ds9SOtzv/y
bhZhab9lkzpNl3qbFzVuCkkvHcpNxlR9/B3g+EFRgR78rGw1rILoqOyZ9eUgyCp5
qGqIGty6oxxY3NJ3et4YPXBXwJpkBLwWhWn4aEq1lif4d3qCTKARSou3ARRR89mb
/+kYXF34GvtIfZaeI5Cl0xwy5WW85DCojUaLRam1hnPXydZ+viHHYbM52qqrYMKc
f+GVTOIvR3FadRuSJL1FxZKT+cz34ZXYdfrAxiJEgrRFtNAH+xYs6J/u3LKN5mRO
qctoPxg94qtE8ZTCxtZxt2F1GIv8
=0aND
-----END PGP SIGNATURE-----

--LjPT8NQEUqQoI9cF--
