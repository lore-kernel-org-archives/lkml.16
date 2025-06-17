Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33948230D0E;
	Tue, 17 Jun 2025 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160964; cv=none; b=RzjS4l9WXa9qK3VWOAmqYuzKuOkXect9UA1uPenffFshpe8kWWsfBEJ/0A2MI559hHiKX/ul8/kOw4DscH4fG7hN4CExj4fOL5EEhRxlWRPk7XhUUZmmFtcong7+DVR+MWBnAbNtzwiHMyqpqRb+TsVKCAIIAS2+6kX5Z3vI8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160964; c=relaxed/simple;
	bh=ivb8ulGW66xtLXprfpBP9RPgCM0Nn6wscmZr8TdiVX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hT/wMhl5RJul6fQkhs2GvzZ0MpMOjA3WdbvP8aKYyo7C1ONFvbuuWWWQSzKX68PpJNY5r/8osiKzb3GrMkHjXmEF6hEduEcnSz6D6aMD2tWqd1bzi4+tXjaqxD+J67zujEeBgN2V4fmczZd1AguCAXpQyLHRTI9uc7QDzoJ4YpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiQ0xVKI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiQ0xVKI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34594C4CEE3;
	Tue, 17 Jun 2025 11:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750160963;
	bh=ivb8ulGW66xtLXprfpBP9RPgCM0Nn6wscmZr8TdiVX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aiQ0xVKIyQhm7iekWpRgkcf7yyvaZanm30HZ8p3qQ02wZjochLt1xbH/qFma6Rkci
	 FjwWciogtyWOTqecg6vE1KIqTchaLYm6Htkbk6R1pvQCSkLVX9u0mJtsSlcUkeKE+E
	 37I5msiIyuY7euYuEg2OGSVCcvcQO8ttrJPawqh50RH+dCxjsldbPWDSLEfn9VWs9v
	 5ywa7UjBNQstlJsHsLPgK6yiR5q9tDjnp3F/Wo1/NOa+9ujYD0agVM0vg6xPBBHyWP
	 WqzGnxC0kpifJ1YysT5/6vuG0y4jOZLa3J5RUP7//l68lXqILR6ml9/WveJd6N+1oa
	 bBEEFpBOb9rVw==
Date: Tue, 17 Jun 2025 12:49:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, frank.li@nxp.com,
	ye.li@nxp.com, ping.bai@nxp.com, aisheng.dong@nxp.com
Subject: Re: [PATCH v1 1/2] dt-bindings: regulator: add PF0900 regulator yaml
Message-ID: <d948dfe4-635d-4ec0-a89f-2e77134c3f75@sirena.org.uk>
References: <20250617102025.3455544-1-joy.zou@nxp.com>
 <20250617102025.3455544-2-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8rP5XpUZqA/isGvS"
Content-Disposition: inline
In-Reply-To: <20250617102025.3455544-2-joy.zou@nxp.com>
X-Cookie: It is your destiny.


--8rP5XpUZqA/isGvS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 17, 2025 at 06:20:24PM +0800, Joy Zou wrote:

> +        properties:
> +          nxp,dvs-run-microvolt:
> +            minimum: 300000
> +            maximum: 1350000
> +            description:
> +              PMIC default "RUN" state voltage in uV. SW1~5 have such
> +              dvs(dynamic voltage scaling) property.
> +
> +          nxp,dvs-standby-microvolt:
> +            minimum: 300000
> +            maximum: 1350000
> +            description:
> +              PMIC default "STANDBY" state voltage in uV. SW1~5 have such
> +              dvs(dynamic voltage scaling) property.

What are these states exactly - this feels like something that should be
either a standard property or discovered at runtime?

--8rP5XpUZqA/isGvS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhRVj0ACgkQJNaLcl1U
h9DujAf/T1CPnfvus4Y5eE5PTZhQE6QfHOOKjzeE0JojZt3cjd2QwuX3zLWD1+JO
w9gNp3YGwTS1jCV5Q/++Nt9o1bG+e8mF2/YPu9QKgfANU9aRfhY/K8ujgac3PfA+
EkbGrk24ohuEinPYs0ou0zd1H0LnbfysuBQXfmiaMeHdziUzL2vAR9LCEd/hnUNQ
btyAhRD0WABICYjZIxiTUrQYhHRFv08GyTp5BVBRVdTIqjAwpAUMG1kxRqro0Uzd
CahP4VJ7InNsOPKD6vVhzeSiZNmRmog4MeNTuVz7vzf4Br6uiGR1vRA85R+qcmqB
0N9/gt1tBNWJohcKy+BRQjPFUnUeCQ==
=qwXW
-----END PGP SIGNATURE-----

--8rP5XpUZqA/isGvS--
