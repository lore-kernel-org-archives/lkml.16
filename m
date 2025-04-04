Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9948D1F03CD;
	Fri,  4 Apr 2025 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786177; cv=none; b=fuoM4+ZlJF1zGZdcA+kw1qAcFzXYotrtbYLpe/BlcuWCeP47Vki65Aw6KpSJq3oLX6u2J988cJaA98v0hca9ZnoRJWmxb+z+JX35wIa6QqzKVMozq7TDCiCJzTKjIT3xezbRUGXB0mBtkFptIT9CEclAY0v6FuPdXpDWWj4xxrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786177; c=relaxed/simple;
	bh=oPnGwjxtjjs/5C3MfcR4X0HPMe5YHfPGa1R/ZL26eaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZbmm76h+AgV0Hytj+oaF/aQIelm6vjP9yAktY1ifPJNlsuOLu0XZZQGnZFuaYWzXCnCYYZyAlMSssSsyh3C/hwqo++5r1OCXgHQ8GmBJ4IhCo7Wc3FZG5wRxWPBS4gz9ZQOC1UfcY+QVnORAzsjPRF56a7cpvEeUfGpqxVlbFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctS8h6Ui; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctS8h6Ui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E855BC4CEE9;
	Fri,  4 Apr 2025 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743786177;
	bh=oPnGwjxtjjs/5C3MfcR4X0HPMe5YHfPGa1R/ZL26eaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctS8h6UiAWFI8jl0bgAEfAX7R4mchKnqjT+n0JWOg646pmH/zOivPZTrGIireM9sB
	 m/Rs11ArykManspipp/fM28gcraX4jU/hB+smFeTffWTlLhiI3jTmI8yKWAwJ3pu/8
	 3N6QmrMndLU0Y2z2lpIY+C6EeIGtFfmsm0Kz2rKNJ3bejXt7zNH2puZtdFWWc0lU4J
	 y3JJ5UC0N51vmOrv4kg8E9sJeNLD09LUSVwyWZ+88kyDcDzTYqo4aSgvu7psu2c3xo
	 HHmvAfKen39M9UTXY2YBauBV1RsKbAQOM+ISLza7gqZ4VzJlYEKhh1wdLHxNkK1IJj
	 m/czyoMdQtj8g==
Date: Fri, 4 Apr 2025 18:02:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Johann Neuhauser <jneuhauser@dh-electronics.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 0/3] regulator: userspace-consumer: Add regulator event
 uevents
Message-ID: <b5fa7d1a-16bf-4031-8990-f559cf589b67@sirena.org.uk>
References: <20250404134009.2610460-1-jneuhauser@dh-electronics.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jT5kjD0mLTfL7UhA"
Content-Disposition: inline
In-Reply-To: <20250404134009.2610460-1-jneuhauser@dh-electronics.com>
X-Cookie: You will soon forget this.


--jT5kjD0mLTfL7UhA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 03:40:06PM +0200, Johann Neuhauser wrote:
> This series adds support for regulator event reporting via uevents to the
> userspace-consumer regulator driver. The goal is to provide userspace with
> a straightforward mechanism to monitor and respond to important regulator
> events such as overcurrent conditions, voltage changes, and enable/disable
> transitions.

This sounds like you're trying to use userspace-consumer in production
rather than as a test bodge...   what's the actual use case here?

--jT5kjD0mLTfL7UhA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwELwACgkQJNaLcl1U
h9AxAAf8Cu5MhCLb1wWJCLWNM2VRJ6fqAj/TDBYj3J4N0xaB8DgkwDW+tI5Wv8pS
5qVmiMeZJRiLd1I2ExLLMK1Rs3qeaIORmsk8/C1tCpp30RzW0eYfuK5DtPnsj9K+
QWOeijYQJ7USFPSxdhkZdixgBTeMJHlAF+XmsVc1gSRx9Ii5w1O2SWRiZ+ZMkaYC
muL++Vf4+7qpfeljxzv4O46NMQvd8EjFWfQaBuf6+eCOWwjzy16gPCUdX9G4PyLJ
voDEW9T11bWfJUcTm6noxSRTco/trQ5UZVly4w4szU5qlBvsyb0qKJYW0amoT/kW
KuCZ/mZj6JdAeznPYndw3de06vb31Q==
=nnRE
-----END PGP SIGNATURE-----

--jT5kjD0mLTfL7UhA--
