Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28CF30E83F;
	Fri, 20 Jun 2025 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750423346; cv=none; b=lZf3HB9d+yAPxlssb4y9mu83mOYvukxKKhNJv+RkvRSrOAe/bvaI8zdC3QDtGE08gSVvjCmcwiVjTt4M2oJG+aMJe/Ex5LQ7vTpM+/qPQf6DbKyZ6hSVvYqgWg/0fpvTeQPvlPkhciilEiWE+yRBAEBmJyItqW917o24jeXOXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750423346; c=relaxed/simple;
	bh=2huFaeDEjoAGMwB/zLIxtt0ECgU8Qt8KsCqKDNbHFfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obdGc9De7c1Ys1/gzNxUHjxYDKwWu6PBA74nzn+/K6OKhkNmA+pM6lPLmtGoHqKmLkwDBYwvpyyw5Wwv6bxGUwGG4WvFres3qPWh3rHrpeQk9lHVHYewuTBTbk9YlBUNMfi6wxm/QKea2ieiXIyYS5VvMQX1HBvINqZy1XSuFW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVofAPLm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVofAPLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00CFC4CEE3;
	Fri, 20 Jun 2025 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750423346;
	bh=2huFaeDEjoAGMwB/zLIxtt0ECgU8Qt8KsCqKDNbHFfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVofAPLmsm8sJNFu85mqOil1a9OS68qAWBDDtJ9EBSsrqEt4gk0Vp+kulCsFk7zyR
	 L44BDf+/t9drrbwmrfhNltgEOHzOi5WceilwGcr9DEHDS9lTSAoXZm75Wy+kijCNRc
	 eAx4JWVI8bNGkXSxL/rtevT1SxwHQl2fK9sgWAYpr8inJSZ/4/v/JakGdRUyvc8GS8
	 xdp/dJv5nohIm9Qqxo/OZmOhIZimiQtRcxiFKoyAOnwjYKPQMOkHNEIZZU3OgG8G9Z
	 1zeK9Ln4IjnT1pSccIY038auosCm3LnpCNLpaa5JBEEXiG/4b0cQgzG4syM+fOKDeb
	 79gu6AdZIUr7Q==
Date: Fri, 20 Jun 2025 13:42:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH v3] ASoC: wm8524: enable constraints when sysclk is
 configured.
Message-ID: <aFVXLMtEOuXFL8B-@finisterre.sirena.org.uk>
References: <20250620021403.624303-1-shengjiu.wang@nxp.com>
 <aFUbGFNAISmamfv8@opensource.cirrus.com>
 <aFUfEgY9hfhB3lKO@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2RBRzs0PeHwrpoSU"
Content-Disposition: inline
In-Reply-To: <aFUfEgY9hfhB3lKO@opensource.cirrus.com>
X-Cookie: Do not cut switchbacks.


--2RBRzs0PeHwrpoSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 09:42:58AM +0100, Charles Keepax wrote:
> On Fri, Jun 20, 2025 at 09:26:00AM +0100, Charles Keepax wrote:

> > This is kinda the opposite of what I was hoping we could do. The
> > idea was to make sure we returned an error if we can't support
> > the given rate. So if we don't have the constraint, we check the
> > value in hw_params. This looks like it checks in hw_params only
> > in the case the constraint existed, but in that case there is no
> > need to check because we had the constraint.

> Although perhaps I am mistaken here, I guess is the clock has
> been set by the machine driver then we would pass this check.
> Would it perhaps make more sense to return an error rather than
> zero here?

The link hw_params() should be run before the CODEC ones so we would be
able to insist on the clocks having been configured first. =20

Or I wonder if it might be easier to just implement clock API support in
the driver and if we get a MCLK we set it to a sensible value here?
That wouldn't work if the MCLK is coming from the other DAI though.
Also I'm really not sure how this bikeshed fits into the design concept
here.

--2RBRzs0PeHwrpoSU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhVVysACgkQJNaLcl1U
h9DVYAf/QqhuwU5yS2VL8enDE1PBL0GOC67S6gnrS4EJZYMapXkE7K7fD3b3vtxB
5fOBKlf3XNBygA6lhnBh4aMRDxJPCLNXGOC0RFg9J0FlSTLkLf4RxlyKpEEfF3cY
TL6xDWbG++zFGklSrze4cfksru8bmGefDQHc022zrGYuB4k+G4pcik5YATVXbemh
icRfUx69NN5WEZTukfIsIXe30A8arWLnFXgQAclFw8Lxvvwc9cBh+gJ5bRXjjbHM
XrRCoObz6mCF40TQKCCB041O0KriPk/eMu0GtcW2rmDsihFKlMJTlE/ntsQ5x39c
AeIfch/ei9EMgWjwxYN2czlzLQFqKw==
=dAfL
-----END PGP SIGNATURE-----

--2RBRzs0PeHwrpoSU--
