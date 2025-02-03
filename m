Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6AA205AB5;
	Mon,  3 Feb 2025 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602352; cv=none; b=LrrZOZm20nQwFM1I9+/UbIzlMsh8rkL/pZow9ttQ5UzxUfFavpK0YrfEhBj54eGAmlgTNFjGQD05HeGYrYbaAuwPP6jCqj3C5yFbatEnb7wQraecGbJO9ze09sFDWUsMSc3RyyTabvVMGTjZsZzdo0mxby2Po32T5iUtCNDBX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602352; c=relaxed/simple;
	bh=RMfp5yZfxmyG4o70GVxiZ5KuZRXFftl6rIGl4/aOYI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kW8//+6Brb3PJyqJx3WUm8PIYQi30hOvYaAA9kQYh3Nmeo6miMkmObcMWWGCXTHZ7WXZHSvcMWUhbfZpLp/nTuKpdy8BwPoMAOHbLaWrzmlV3PaqY0uXcdLbLsM+lgZ/FSVqAXbJc3P7pQvqOPT/D1rqB5f+ZGgm4JnJ2vxfQrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+9/0oJp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+9/0oJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40ADC4CED2;
	Mon,  3 Feb 2025 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738602351;
	bh=RMfp5yZfxmyG4o70GVxiZ5KuZRXFftl6rIGl4/aOYI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+9/0oJpZZoVW1lMMiEnqfiYNuqH/aMcelr+OPyu/tH/W3a8NtOXlTI7H+k6Iw33Y
	 FfJ8VIQu3yV0u6rWIz2ka7OEoA2ZE5yrNnrrD9A83xyGWV2vM9GSZO8dVaiWzuDsDf
	 D7rj7CQGkhdi9RLvwus3Bk2zrEK8C6wdTWevwlghJQbhNgt035LyKd6T0Hoam0sEjL
	 5xdVlvyDM2F10ntC1bwGQzBEaNu3117K/dZ+lj64WjlLUq8Nz/63o7KGE1122qXy0K
	 hfBL/F0HuOQ0fCqeEMA0nB6pGSUak8bUoWxIhuMG0T9txgsrKt8r6pMO6Kh20WgX+Q
	 BjFA/A6vD3yaQ==
Date: Mon, 3 Feb 2025 17:05:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Nikola Jelic <nikola.jelic83@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rwalton@cmlmicro.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add cmx655 codec
Message-ID: <616eb3d5-3825-41b7-b7b7-89c166597f2d@sirena.org.uk>
References: <20250203170117.12004-1-nikola.jelic83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vrvwv9ZRy1/12yjy"
Content-Disposition: inline
In-Reply-To: <20250203170117.12004-1-nikola.jelic83@gmail.com>
X-Cookie: May your camel be as swift as the wind.


--vrvwv9ZRy1/12yjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 03, 2025 at 06:01:16PM +0100, Nikola Jelic wrote:

> +  pinctr-0:
> +    maxItems: 1
> +

Is this undescribed property supposed to be pinctrl-0?

--vrvwv9ZRy1/12yjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeg92oACgkQJNaLcl1U
h9AWmwf/Z6lGja8/xoFymNkQKZamkIaGZnDYCGcHciZTqviy08z2qAtyLAOuOo/5
ScOgD5Nt6Y+j7A6jtrmMEiM9WDQAFDqsIFKnhvyT+872m3AQngWDMQ1XfFEn8Izd
GktC4thWiFQa3/D6o7VGvzxIHfURF8C31UUSN9xfxmjNRxC1rO2FxZhLLeg6XgIX
O8IAefitD8Q+XqxemQSWpwCgcmmqWrRSStD7QKzWN8qFKpcTqnKTblH+2CqKX89W
zirA4s+eu0RAnHKdoi7donP9fjCmA5us3nIbSuqZGHGI7jWUWSxy36bIK9P6CaOo
zrbRq027GVLeKwSXn+hz3qXtmJ9c7A==
=FBJq
-----END PGP SIGNATURE-----

--vrvwv9ZRy1/12yjy--
