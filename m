Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93D6217701;
	Wed, 26 Feb 2025 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740570462; cv=none; b=csBDUdiE2bo5FauQmRtAqqsKApUmhy3MOPw+mk8WVpZkqFrG2a/w/1QAeJMSUaVaGkhrBGTq4lBM4NNBMqrAAioo2xUzjDmMLOuVeJBM+huZcdNjczhSSqlv02lkzYHnjATGik/te1j844S3KpL+KcNgLK8PTideRWdV8zscCXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740570462; c=relaxed/simple;
	bh=JOQo3/AMvkrL1dqwOqth1Sz1S7IiFRAbwLyLHcQKuZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwdDL4TXrzTXNwizhB24jd/RgfEZ1Ja6v77GW4ocr6m8Xkh9gZWOHLfFpA4p7J8yiulzCD+oOcjh8AZbI9NQVMOuadh+QEXp5gLePCPoB3JTu3GYzfo02usMCHIy1T8vM2gC8tpptIRF+SL9PmqWKvZJI1b6+ht16ob/vhH2KLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBvHyzQd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBvHyzQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE318C4CED6;
	Wed, 26 Feb 2025 11:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740570461;
	bh=JOQo3/AMvkrL1dqwOqth1Sz1S7IiFRAbwLyLHcQKuZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBvHyzQdQCpEbjbuVZQynljxXW4ZIyfPT+HBhocchWPRqewWdlQgD3A4zsUTR1Ijx
	 daVc1JVwYN6hev7qQrS2S7ciZGAgjExyXFq7mw7hpyaezkgmih9UlQ5wfkeh4DMSOJ
	 CV2GtFzC/e1ABejStfX5ejCjYmykN0vxNhLXbw4SF4RUTu8nWU1a3gE/35NtHCG3q7
	 wH/V3JDjIENUcecZ+0tiu/Vkz2ZrL9vUTdQ96q29/aJHIExaxYTiQnIFNQvvEYTZ9i
	 q7zqA1wCr+UorcQ7ZpdS2ZKsmElUX/5fD8nFwpCzzMLfZ5Qv+PqSdifWUg/KQv4mTW
	 t9BZ/LHKbEHrQ==
Date: Wed, 26 Feb 2025 11:47:36 +0000
From: Mark Brown <broonie@kernel.org>
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: add adi,adp5055-regulator
Message-ID: <dd547319-f8c8-4c3a-979d-4610971cdd25@sirena.org.uk>
References: <20250225-upstream-adp5055-v1-0-a5a7f8e46986@analog.com>
 <20250225-upstream-adp5055-v1-1-a5a7f8e46986@analog.com>
 <cf90cf64-202b-456c-9a9a-ba33d0e68961@sirena.org.uk>
 <SA1PR03MB6340A94474EBFE0F8428A581F1C22@SA1PR03MB6340.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vyNIygDModyIpM3c"
Content-Disposition: inline
In-Reply-To: <SA1PR03MB6340A94474EBFE0F8428A581F1C22@SA1PR03MB6340.namprd03.prod.outlook.com>
X-Cookie: I've been there.


--vyNIygDModyIpM3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 02:25:02AM +0000, Torreno, Alexis Czezar wrote:

> > > +      adi,disable-delay-us:
> > > +        description:
> > > +          Configures the disable delay for each channel. Dependent on Tset.
> > > +        enum: [0, 5200, 10400, 15600, 20800, 26000, 31200, 36400]
> > > +        default: 0

> > This looks a lot like the driver should implemnt the enable_time() and/or
> > set_ramp_delay() operations and use the constraints to configure this.

> Based on what I understand I agree implementing the enable_time() core
> function for this. However, shall I keep the code for the disable-delay-us?
> I don't think I saw a disable_time() equivalent

We don't generally worry about disable times, they're hugely load
dependent so the numbers tend to involve a lot of wishful thinking.

--vyNIygDModyIpM3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme+/1gACgkQJNaLcl1U
h9AJRgf/SbMsNIjw2JAqtkYzbbLh4A52BF7wEa29RpyV6CGwgPnhj84DYF3aRqfM
04oRlSwVzFRIUSTo2bzc6cf2uT8eUMCEVSpRCyfsPy9pZsy8Bma7d8sRwPyXO/vc
FUZIj8nNVDiFYLaKCAxOyj8iY4KmpPfoEnmpa8fXpEOH2dnyJoZA0dR3cArL/Cwx
XYcE5K9KyaK7wRfjWHF9M2g5AYklTespWcisxiAKJLBbUX+oqzuGAWEh0cfJfM4a
WzErIOflLqFm5npZE3HcI+FsTDi8g9pIsihhk1ppcPiYU4EI9Z2/3REbnHn1gGz7
y5y3ZM7j0RFp+rZiOJcL8y4dBMpsPw==
=HtnD
-----END PGP SIGNATURE-----

--vyNIygDModyIpM3c--
