Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9022054E6;
	Mon,  7 Apr 2025 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041456; cv=none; b=qN6rhTeRqgnIGuQmwrHZqHB03bdMPCInnh4D19hCMdANrBOVcB+8vHLFzypyo30wjdP4ZIid5cx4ul1tcDMOg12vsf8paH/o5rvkt6MTwc0hS0LG3QzX4MRyHdW0oRqb3o8OO3QOKPBfgtEm1B7sYj20i+pwAulYzasRgi0AM8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041456; c=relaxed/simple;
	bh=P6WfDcKUG6ij+O3XNj8oJSkT957LTNnQmlpDyjZOrAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4ZEBW5h4pJ2mjCY1MOhB6exiBX+01Q+RLyXHOzpkLt2fF+lL3s7W9UJ7b0Qh927l/14VxWjX3aHwOHv5g8Q5Qo2CKRnGe5z2Zw+1cGo5XUXVePp487SFXUZ2rdVRzWCRJxC89t4L+gLRbxL6DnHVJekV1JfgYCyOikopklZNSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZCBiS9n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZCBiS9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EE1C4CEDD;
	Mon,  7 Apr 2025 15:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744041456;
	bh=P6WfDcKUG6ij+O3XNj8oJSkT957LTNnQmlpDyjZOrAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZCBiS9nOSxiZcN7m5z0UG9ItN5pgt9XGQ+z+kz6T6gCVe2uFdzd6ylx8hwJih+he
	 l0fEmrm/6/U6Rcg7FvJEXlwWz6rrUv1PZCSixGhKMAcrNNZSoAOiLGKcwEOf9ED9LA
	 R+JjurDItjiKJVKA0i7Ex8b6XaMt/+5vRxA4dYT5v0J9Qi6EWHRZjn8qvzbjbo8br4
	 R0TCsVaGKoUGKaewTu1n0Jl/XWDQI2Y9I3jtv6SBiJF2VupvWINP1o9R6ubsWAzqKP
	 pEuZ8YXmHR1IZD6XVQf/y4ma6urkf0xa2QoH/WDU7LyhqeYwhZPwwNQXLegqj36/Ym
	 NoVyXEi7ByxPw==
Date: Mon, 7 Apr 2025 16:57:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Johann Neuhauser <jneuhauser@dh-electronics.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 0/3] regulator: userspace-consumer: Add regulator event
 uevents
Message-ID: <c74e44b7-87f7-46bd-93d7-fdb1568bae90@sirena.org.uk>
References: <20250404134009.2610460-1-jneuhauser@dh-electronics.com>
 <b5fa7d1a-16bf-4031-8990-f559cf589b67@sirena.org.uk>
 <a18c4ad3b9f647c08d71b4550b5f1cf9@dh-electronics.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DcO1LR1dPcZocI6S"
Content-Disposition: inline
In-Reply-To: <a18c4ad3b9f647c08d71b4550b5f1cf9@dh-electronics.com>
X-Cookie: Meester, do you vant to buy a duck?


--DcO1LR1dPcZocI6S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 02:17:10PM +0000, Johann Neuhauser wrote:
> From: Mark Brown <broonie@kernel.org>
> >On Fri, Apr 04, 2025 at 03:40:06PM +0200, Johann Neuhauser wrote:

> >> This series adds support for regulator event reporting via uevents to =
the
> >> userspace-consumer regulator driver. The goal is to provide userspace =
with
> >> a straightforward mechanism to monitor and respond to important regula=
tor
> >> events such as overcurrent conditions, voltage changes, and enable/dis=
able
> >> transitions.

> >This sounds like you're trying to use userspace-consumer in production
> >rather than as a test bodge...   what's the actual use case here?

> We have a hardware setup where the USB-A port is directly connected (D+/D-
> lines) to the SoC, while its VBUS line is driven by an external I=B2C-bas=
ed PMIC.
> If a connected USB device attempts to draw more than approximately 800mA,
> the PMIC detects an overcurrent condition, automatically disables the out=
put,
> and communicates an overcurrent event via the regulator framework.

You absolutely should not be using the userspace consumer for this.

> Currently, the generic USB HCD drivers lack a built-in mechanism for hand=
ling
> or recovering from such regulator-related events, particularly for report=
ing or
> re-enabling regulator outputs after an OC condition occurs. The DA8xx OHCI
> driver is one exception, as it indeed provides such functionality, but
> integrating similar support into the generic USB HCD drivers seemed unlik=
ely to
> be accepted upstream.

Why not?  This seems like a perfectly reasonable thing to want to do, if
only as far as generating notifications to userspace.

> While I was aware that using the userspace-consumer driver might be seen =
as
> somewhat of a workaround for special cases, I did not fully consider that=
 it
> was intended primarily as a temporary testing solution and perhaps not su=
itable
> for this kind of production usage. I'd be grateful for any suggestions or=
 advice you
> might have on the appropriate approach or alternative solutions you could
> recommend for upstream integration.

I'd expect the consumer driver to be listening for events and offering
some sort of handling and/or interface for this that's joined up with
whatever the consumer is doing.  That basically means that your initial
thought above sounds about right to me.

--DcO1LR1dPcZocI6S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfz9esACgkQJNaLcl1U
h9BMrgf9FRUpRdRSIzST7RGtwJ/rq8bRqv+jgbQq06eOIsvLQI+nLOZ+17Kc5CQe
AvPXgaY2fXCuMz+Kctu7ytlRxOh/A3wCRd2i8pvgoVugMLMoxSLuoTmfaTp9Sba9
y9dZWE8lxNfpjG5UU6JM5qNs1y8SH8iJ8YUpfkKhm/pJIPaxLfLWwYY/45Lpgz2c
AYvAVEmZ0RyyO6Byp999PRVb3Tjhdnro8ulN0nhP3pU6k0AwSuU5x3468MkfyfMI
a3BPI5EhYSMU9Np4BGkB0z4j5PU23ggUmfLEEm0h1lTPAErtJInpxEkYp8wuLsQ/
yEyrcXpQJirBFyHVw8JQf/tDKJBPDA==
=+dGy
-----END PGP SIGNATURE-----

--DcO1LR1dPcZocI6S--
