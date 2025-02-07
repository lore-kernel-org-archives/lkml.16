Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A23215F5C;
	Fri,  7 Feb 2025 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935132; cv=none; b=JL8EsdSmv+Z16SF7yPE/TvbwBPc1RP7i3VWLg+eVTAKsQp0fJnf9tiO13t9hD/Zjul1B6FBVXlhaiVr+GlpKiAPOBKfgSSA62x90a/WBDJZsZPwbY38STugu0yJhNdoV+CkTrGLD9+APVwtOMzXsFz75zdQXYzlX8qEfLqgbB9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935132; c=relaxed/simple;
	bh=J03El1fIwg9sWRo6dYAi97+3ceFhningAp/1mf98+ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bk37lXnovisgHd1xnZ3XeAJ/P1dWWvvyRwWv1zMGNiA6nZwOtLFXwLAZVk4C1xsxEjHO+e1qo9KOpMAkzLpwFW2RehTKSI5sGm1HdrQRGhiLHUhnFb77MyOMBMWVXo2PbfBQI4XjMky2gBPd+jYwHmQUIgfnyzr2YAWmQ9LHRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRiTmO80; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRiTmO80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DE7C4CEE2;
	Fri,  7 Feb 2025 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738935132;
	bh=J03El1fIwg9sWRo6dYAi97+3ceFhningAp/1mf98+ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRiTmO80WADYJTu3BNx7mKiVQ+260cmXVczTj3WjyfI8R1XthtfQHzWmYaqWm34jp
	 g6fK+6Ps+CtYu3BBrIrzdHnx6cXo6RAlCnZtcUWURfSLvBpAaWBIz2xKBZZMNe3K4T
	 yWZVwQzhg5KJZe4Bq3VxuKKcZ7399OpjYyTOYqQpBY5+Ywwh1wxb+7FAvepaJRXJ0L
	 8uTRz0JVDOgA7aKB9bKU+kY6IzT0PK+5W5i9qkhj7+5oTNf+XghPhF0pfKlA7C0yT3
	 O6yZufys5W/j3rUVrNonG9DzlxGcVWXW9WdWh6YQfFh+xdS9RjdDJNVvruYpXwYGIb
	 xNqF9i1oqoDSw==
Date: Fri, 7 Feb 2025 13:32:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, venkataprasad.potturu@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH V3 16/25] ASoC: amd: ps: add soundwire dma interrupts
 handling for ACP7.0 platform
Message-ID: <a799e6fa-5ef7-4e1b-993e-52555a73f2a8@sirena.org.uk>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
 <20250207062819.1527184-17-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uteoji9fEH0SwSgL"
Content-Disposition: inline
In-Reply-To: <20250207062819.1527184-17-Vijendar.Mukunda@amd.com>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!


--uteoji9fEH0SwSgL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 07, 2025 at 11:58:10AM +0530, Vijendar Mukunda wrote:

> +	if (adata->acp_rev == ACP63_PCI_REV) {
> +	} else  {

Unless I find something major in the rest of the series I'll apply this
but it's much better to write these as case statements, that way if you
get additional types to handle it's easier to extend the code sensibly.
Please update this incrementally.

--uteoji9fEH0SwSgL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemC1YACgkQJNaLcl1U
h9AZjgf/Re3/hzacc4lKEq0a/6HKcVZ9lkkHESE8nuwWhO5GTHJCSiHliGmuL9oY
3QdsdDNfP39UVLf7tN5MojsX49ROaBrJmph8xeAdjls1F4FUGvjfdr9GD8NNgoFf
XsmMmneCwS8sO/sdqmZ3VhxVrb2GQkmyE5oGFg2fxwXEz8afm+agfQrepQXR5FJN
uOWq6z5LqMAaNHUPSyUT8kr1RKMFiQu3S023J+RugahD/Ec4ghUX3niFU4WT4nJi
hAzMilXSffF8fZEjUtzfQO3AlzU8R3Gi9KvwgtA9grIp4jSFXHCv0bW+9BwMh1HW
pAegkRM8mQks3u1dVpNIkHa08i9Qqg==
=xGCR
-----END PGP SIGNATURE-----

--uteoji9fEH0SwSgL--
