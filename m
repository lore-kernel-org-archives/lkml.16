Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C5027F75D;
	Tue,  6 May 2025 13:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538580; cv=none; b=ByxFrw0icLRxQbGomCtrdqNJKbGBi5flWSdAJjah9IcNJffLKsy7YkwSCh66tAGtaTOfxT8qWidCf/1ieIst0LdNhQGcV8hfxWtcaifrCZudbOsWyCeLUIW7vz2KFRXWGCdxYVrumM+BqANsy1MnKEUpJxLj/WaiwpJsDD9+0HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538580; c=relaxed/simple;
	bh=GRwZtJM+r1SVQfkqc8R5j0dbv3VCLIfS4MJOtv7m3Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ButRAbTy5EPQ+gKpJEQDfCbnTlDNQ+mLgTGGSjI0OgjVzMeJgpNgGVg4gEindU5QBSjbmHVTi09+fHcrZNsC1Un/a+7A/TxN92ZAawmO3isPzZblWfYjoWbPSL2dgw8L0hJN2oElLpxs39LCv3384lTAmK36GMkPx2NBlOAid68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMZqE9Df; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMZqE9Df"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291FAC4CEEE;
	Tue,  6 May 2025 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746538578;
	bh=GRwZtJM+r1SVQfkqc8R5j0dbv3VCLIfS4MJOtv7m3Nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMZqE9DfXu8AT/pXF04YHC6wcoY8i/lDRg3ZSx8VaDPeHHBflcsUNkWfJxgsEOgHu
	 JNt3Gfs0n7saPZ+f+9l+4/pAxuqRA2ZdvEaXjCvP0j7LUnDZgZmy/hug3t3SmZLlfE
	 P0XfLOXoCINHn2Vax53+H+2z7uxUpvt3Si85v6gkf0Vsfvlp9qb209PTkOmmCXHg31
	 KM++wSBzXWZ93cM0+YG2PHZgjw+cmkCmdldgxIuivJrIXAWA9Xd1DsvXXX1WvchQmi
	 wN30oulto2k+KMizwgJTf//Z4abayaUjZUke+65CjwWdO9a0ro8kEscQ7gFaVBzn5n
	 /EbnIPsmUroBw==
Date: Tue, 6 May 2025 22:36:13 +0900
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH RESEND v1 0/5] Add support for CS35L63 Smart Amplifier
Message-ID: <aBoQTbaEq8wXPpzJ@finisterre.sirena.org.uk>
References: <20250506095903.10827-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5S0k61nx1tm+tHkV"
Content-Disposition: inline
In-Reply-To: <20250506095903.10827-1-sbinding@opensource.cirrus.com>
X-Cookie: Well begun is half done.


--5S0k61nx1tm+tHkV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 10:58:45AM +0100, Stefan Binding wrote:
> CS35L63 is a Mono Class-D PC Smart Amplifier, with Speaker Protection
> and Audio Enhancement Algorithms.
>=20
> CS35L63 uses a similar control interface to CS35L56 so support for
> it can be added into the CS35L56 driver.
> CS35L63 only has SoundWire and I2C control interfaces.

Please don't resend things when people have added tags, at a bare
minimum you should collect the tags.

--5S0k61nx1tm+tHkV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgaEEwACgkQJNaLcl1U
h9BchQf9E3IaqcJ8dEsaVWRb701fdW+NVkuUBj+M+RQpoiQxUg65bfZeKIivy50n
42f7zEnErykoyss2eFAW23M8N8Xc12v7mP9ACqbs0K5oE9W9rM6Nc1heKtaAmVQ9
Hs+mBwt9x/WYaTwweS69t6bDnJjT3EX8le1zvOOlJ2E6t4veXmhxftBWXezRe/Bz
UYB4OKC8z+/ngeC82Bk9Ui14UqQkQRdkSQTLf3eiWJ58t+W6JzrX7vejlX688SDt
xi32DHMcwShtKlTrxmPyUVc2pNVlKYGAVZfX6uGw7i3hko9z6CbkiU/9FVBYaWdI
E66VwIf4FM+ec4Z2PVUh43ASyKGKLw==
=cbac
-----END PGP SIGNATURE-----

--5S0k61nx1tm+tHkV--
