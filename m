Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24D222574
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192771; cv=none; b=bIIBmvJLyGuE7k54t8rCFuVxsgEd/7rtNAODsOUH1gwatXtXi6y/0cMKHMcM/bFaFNVvAqIW/F4d8jhFe7zEDnq+spEIbDMHTUMAeO96qFX9FUNTNBBX5Lb8QU/5cDN7DteSx/bzgQdaF7xsId+rFFTX2WhRRgxt00ZrFJ/+MYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192771; c=relaxed/simple;
	bh=j3hICYs3/T11N9/ectFdrzVfr9fCv+yddLAZvRSRGQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUTAG0V6sAsQLmD2l61ZssujDzQRFCE1RbJCmY9tpwf2DMNpCTJnWRxS8hdD1dqZgQwi1pCA84JQxBJqh6rPd2Mylp2Cffqs1aWlPxPwi6g2of6afS18tUxYEQGJN3hMT07nPHCo6902Wv1MMbSbYnDjHtRXJ2Gszd2/MyVIYIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N94xkSj9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N94xkSj9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82392C4CED1;
	Mon, 10 Feb 2025 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739192771;
	bh=j3hICYs3/T11N9/ectFdrzVfr9fCv+yddLAZvRSRGQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N94xkSj9iPOBQIPYubAYDMOhzFNoY5+SvUnIbtD+SSkyBJmpTiS3sRp3mMCt0cOFn
	 RrzgL+gDBf8oJkioyWd0IGuopmPy5xu4olZmhL+XkiDLPduZZH3KSAeISYOJmjyZOS
	 pWhvVET0fiR4n+KVDritmtDUzEGnPrckgBFUFXRDTcg5smbtbG2nQEYSzdCrxaXZ3y
	 yKd0L4ccCp7yuM6rJuJUgoUboc32bzk4ZcE2D6uxvHJxWxezYX82C+apsYUv4mm//f
	 m8drciofqG2i+cVh4Lkd2klLfljVsODYPm1wnajIOr1Oh2ehIQubF8izCP6oBwUPQ1
	 fTZzbAOuJglRg==
Date: Mon, 10 Feb 2025 13:06:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Luca Weiss <luca@lucaweiss.eu>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/3] regulator: core: do not silently ignore provided
 init_data
Message-ID: <8dec2123-3639-4f03-98f2-20c44a70aeb5@sirena.org.uk>
References: <20241008-regulator-ignored-data-v2-0-d1251e0ee507@baylibre.com>
 <20241008-regulator-ignored-data-v2-1-d1251e0ee507@baylibre.com>
 <5857103.DvuYhMxLoT@lucaweiss.eu>
 <1jwmdz0wim.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="869UQOOYca5OYHT9"
Content-Disposition: inline
In-Reply-To: <1jwmdz0wim.fsf@starbuckisacylon.baylibre.com>
X-Cookie: A beer delayed is a beer denied.


--869UQOOYca5OYHT9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 09, 2025 at 08:05:05PM +0100, Jerome Brunet wrote:

> Mark, do you want to revert this directly or shall I submit the change
> for you to apply ?

Could someone please send a patch describing the change.

--869UQOOYca5OYHT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmep+bwACgkQJNaLcl1U
h9ClAQf9FHi+lQXSlJu44qhVZIawyWiGzrQTxeg2vDzdxxJWTVZtG6U3d4xto9lI
L4X/jCV94Sru1GYKXteVr2BpoKtV5OC0uTWd2WbpFWP8u2ms9sdaLaV3L7++Lp8T
F/bOCL/RYXMvJZRTLLAe8PfKWwAokvczpDNodSaMi9K6o5+c9N9tZ460ulPHQ4z3
t0o0wYBVge6X8IPsoZ7NeW878OX0hnB02qqqV9t/qwAmTnX21EiuCl1xAqGSR24r
uKLMDZynZg2FK2hitBJn11iHUoNiG+Vgx5ehdd47/A10Z5RsaJ+hznKjPwZKMLx3
cqYbWfUTouk5+nmvIrBgoIMojagQcQ==
=h4lj
-----END PGP SIGNATURE-----

--869UQOOYca5OYHT9--
