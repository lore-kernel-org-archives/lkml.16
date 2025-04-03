Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A09C24BC06;
	Thu,  3 Apr 2025 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678535; cv=none; b=Id4fx2/IzRXIDPbC5IpXkfVMBR0eWz5PC14CiVYtTMO6Tr3OUHalV7u5sa3pIBHL/d1jsG8yPHogO5Y/hwwbbDWmP5EuAengLrLlaTgYowOLkENcfgtjieOZGyGf/5t4k2azjumXvK8ihGmA2zB4WWn1gGraqFC4YyFFb8kHEsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678535; c=relaxed/simple;
	bh=GKEt9+H2R/BBVU1EcSsDQRof8YSR4OUNYYAuJhrvhf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb72ALYpOo9SIlDhzLXRbD4FjWQRVhgycP6XlAoodeqRYjqn3Dfc973s4EJAeaLbpNABN0ExYNSYZNuADwpYUVzFPE24IoykkksrIs0zmyA4LFGzumfC8yAXKsmcZM6Id5znVBVzxbcG6d32AmRc0iyPD19iGDI5dHprQuebPqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYzgkkVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYzgkkVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038D9C4CEE3;
	Thu,  3 Apr 2025 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743678534;
	bh=GKEt9+H2R/BBVU1EcSsDQRof8YSR4OUNYYAuJhrvhf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYzgkkVeiRYF9zCy4gKM52vujByp5ui9ygD8xrGx34NekTj8dF1jD0hf3mhYOGxsO
	 3/bKeUsFiaiYtqMXIUIvMcugPptxiOG9GJnQYnVKdgRS9onCZTGzmjbOecYCCDbS4Z
	 TTBlVa2Bw/BnvUugX4HewKx9Fd1VEmDp1CQ+/fdIfNa+aeFCn5lZ9qUjswPAl0aPsQ
	 ixRDvXr6yPb/0eEmfqWgrPJtINcHq3TvRDkR3b3y288+uHfy/AEd6Glut0OwDiVp1a
	 foCiOxZeKnNCiTl/SFF8gtXVjtLkDBFMxtL55mPzaJvPj92OgWFs+n3H6OEbgjprrZ
	 vojUrXVw4osHA==
Date: Thu, 3 Apr 2025 12:08:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] regulator: adp5055: Add driver for adp5055
Message-ID: <360c60a4-d1ba-47bf-b65d-c6889801703f@sirena.org.uk>
References: <20250403-upstream-adp5055-v3-0-8eb170f4f94e@analog.com>
 <20250403-upstream-adp5055-v3-2-8eb170f4f94e@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gSdBgsLG39Werb+A"
Content-Disposition: inline
In-Reply-To: <20250403-upstream-adp5055-v3-2-8eb170f4f94e@analog.com>
X-Cookie: Logic is the chastity belt of the mind!


--gSdBgsLG39Werb+A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 10:43:11AM +0800, Alexis Czezar Torreno wrote:

> +static int adp5055_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct adp5055 *adp5055 = rdev_get_drvdata(rdev);
> +	int id = rdev_get_id(rdev);
> +	int val;
> +
> +	if (adp5055->en_mode_software)
> +		return regulator_is_enabled_regmap(rdev);
> +
> +	val = gpiod_get_value_cansleep(adp5055->en_gpiod[id]);
> +
> +	return val;
> +};

This is absolutely standard enable GPIO support, just let the core
handle everything.  Otherwise this looks fine.

--gSdBgsLG39Werb+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfubEEACgkQJNaLcl1U
h9BXJgf7B/M19Fy4OIGjEXNecGL5a/7pVfzIVZ1DwOY+Krz3An78y0gd8BwvLXGc
emWqI7yL2NZNopeJoV6MMQ0M6+vpvUqJC43YlH9g9k8w9+8CtjHsGSGoL3Hfa9nQ
/2/Eg0cqavnJIasvoTit2+OI2K7MZ9nhJ3G/fBK6J7APookJSEI9tuo92HCmPyob
6u7SnsG6gFA6sP/L/7u4ubqdPptnmuD5r+D5IJBlpxQTFJYPIbO3zVzdUvk5N6ef
fJlGjk6ZH6URe5SK2VfLsc6JHse144wSidO1T8B4cSx8zAd3O9WYTo7KdEw9CLyW
JM+OuZAveNkEsxv5xPqocLeC8W/SJg==
=Kj8X
-----END PGP SIGNATURE-----

--gSdBgsLG39Werb+A--
