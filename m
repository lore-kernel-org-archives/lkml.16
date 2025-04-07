Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50E91B87CE;
	Mon,  7 Apr 2025 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034568; cv=none; b=UJ3G2awKvqRSVZUkzS9U3drJ4sUa6l77124dW6G0DN5OuQmbFwQotiVbeoIs5WfPrBOrXw7jIJsUi56yktfPozX8YLFYG+rYrQ9KSd008rBX8hKv9RPM6oPkf4JDqGRO+i47v7wZ7gSbBDBEIszly0jVnmsHtQ535pCIdyXjPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034568; c=relaxed/simple;
	bh=VlnB1YXWS5O4F3ARNUCiMdlsg4JVJ9h2WQuVh6h1KeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJgg91K7K0Rruli8BVBR7HDkhPSBkmac3V6Y9UblkFGZsI3icQN8spmMl3ndOrVk4Z4gs7m4RsztCenWVpDDQQR599DpYU9hxQKwkSnedDHW2bovSGf/ohkwxD+e9bhXs64P9rdMLA7IaVwnEQEnI+5sG+HOEI1HeulbBMlBPyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDPGs8hh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDPGs8hh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727E4C4CEE7;
	Mon,  7 Apr 2025 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034568;
	bh=VlnB1YXWS5O4F3ARNUCiMdlsg4JVJ9h2WQuVh6h1KeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDPGs8hhPWPp7SZy2qJI4GyM6iu8eJWJKPRzhkf0Wyo3/9U1TFc1XMP9ISn1+GptU
	 wWYdUpmWjEtXD2mc/ANf6f245z3zhapUvlVcySFN6htJPBSAdu2xDZ7/N6o4/dfPrE
	 i57miIGPYI8yvAbeEQRY5pcpx9AXWqjMb2LZKqeFAbFAWy+MzesopqIlXUPnHLWL1N
	 Zsc12Hz7+ZwYa2kihEuTxTBREFsBV70LmAY9DitzwobRBiSf1SXAlGHIUSQ29foCtK
	 Rl5ArISqbP97JTn/wxscP0H8vRQ+BijQJqyqyAOyVWAdbY585xWfSDMRbib+K6t8kb
	 JehuuDjyx7tTQ==
Date: Mon, 7 Apr 2025 15:02:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/2] Add support for ADP5055 triple buck regulator.
Message-ID: <f970a0ae-18db-4506-9f92-d4484ac079f0@sirena.org.uk>
References: <20250407-upstream-adp5055-v4-0-61dd82369ff2@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RMLSE6u+AWDcZBYs"
Content-Disposition: inline
In-Reply-To: <20250407-upstream-adp5055-v4-0-61dd82369ff2@analog.com>
X-Cookie: Meester, do you vant to buy a duck?


--RMLSE6u+AWDcZBYs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 07, 2025 at 12:07:49PM +0800, Alexis Czezar Torreno wrote:

> Changes in v4:
> - adp5055-regulator.c
>    - Removed custom adp5055_is_enabled function and let core handle it

The custom enable and disable functions are still there?

--RMLSE6u+AWDcZBYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfz2wMACgkQJNaLcl1U
h9CTiAf8DTjZx0ncV61oGe2IKc0tYtsQNqyC/XL5thlQABIU0uk5KpETiUNpjKYf
Gvx0SnBr15FjSV61QxfCB8pOiGWDvET9Ak7GLrUKn8zFSpZVqgUOsFiiqqFIhmZ2
zBFTpZ++P6oqfFPFmOUh4fwAUzm8MlIyV4Btlt83FPqTP2nfgqGEUnpFBPdO9jjE
M/xGL2/Loq9dzyc0lCelx0UmlB0zVc1+5NaToqKYT9yWI4An+3Va+DUYIBUFgOhD
qVFzZHilUte7tV2WlY7/lvABEldJ4UYPlekAfh2bu5vIqABErsXZpjUkOz5g6sGN
8efx4tGD4drZFKTdsHP38LIlaI0+nA==
=MCrc
-----END PGP SIGNATURE-----

--RMLSE6u+AWDcZBYs--
