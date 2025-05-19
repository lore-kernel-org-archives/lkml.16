Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300E26B2B1;
	Mon, 19 May 2025 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660043; cv=none; b=H2bwYBOiNx7Z2nDrInnkgpAN68EFoJS8xzxz7mViEid918dJpVKDL24R2zma4Y6NgOUp9LME7Ef3atRoJyb8T426FCPinY5CC9Mu708kSD1mBRKnBmMWzazb7ti/f14m7Grlu7j5siQl+EP9l1Mf6e83v01EPF5M475LyJRL69E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660043; c=relaxed/simple;
	bh=3Wg7xeXwWg57LwctIHTN36UKwYy2WkoauQgrpE6/j0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=My87Xth1kQPvZq4mAP4bsqyfxuDoTORWYU/oOEkSODbl2Y7OJhQgjB+5OPjE2Y9GWFEaJhSwRetDpz3MZLr416lZQL4SI+58kU2n84o9Pjiwl+GJCUdNHf33CzHUhdn5yu+LPtRBaTtSSMCHf45AR60nMx1HHGK4GyYXXM0TVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6LfSAIX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6LfSAIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDD6C4CEEF;
	Mon, 19 May 2025 13:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747660042;
	bh=3Wg7xeXwWg57LwctIHTN36UKwYy2WkoauQgrpE6/j0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6LfSAIXHN3Ee/wXz+FiJ7aHcVXuo5JBL6t6SyO0SQKXw1f48rt15b0jamMU2mpwI
	 ZwLK3BLryJ+WTYHp5ljoj+RTj3jpI5SHINo/TWUaHcwDKTJYA8oLFa7/FfRIsJaX1X
	 EHsa9iUuisfSj3vOJrWkWCMu7fbe/3AwW8N7BR93QPU0FfFujvI7jzPPxYiNuyWC1y
	 DYqmDJPw7nB1FwNI88bVh+W1GsDEzuA3g4g0HwJdWBWuyq/4sKEFQojdVveeNIZzaB
	 /rj1kcvpVEmf+rmFs5KJfP3bg22nd8YpKs7rUM3Fu+laYcptQC91NbKSL7teQCfKp6
	 9EXJhoMGULS2g==
Date: Mon, 19 May 2025 14:07:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM
 platforms
Message-ID: <671f0a01-34b4-4593-bd69-4fb5ed9667a1@sirena.org.uk>
References: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
 <PAXPR04MB8459312B18CBAEDF9192A188889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MBclyymphZ97chDx"
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459312B18CBAEDF9192A188889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-Cookie: We have ears, earther...FOUR OF THEM!


--MBclyymphZ97chDx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 12:58:48PM +0000, Peng Fan wrote:
> > Subject: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on
> > i.MX8MM platforms

> DT Maintainer Krzysztof NACKed [1] because of ABI break.

> Are we continuing breaking the ABI?=20

> [1] https://lore.kernel.org/imx/6a28f9bb-05fa-45ff-8c0b-790c0caf3252@kern=
el.org/T/#u

As I've reported a couple of times now (including in the thread you
link above) i.MX8MP platforms haven't booted -next for several weeks:

   https://lore.kernel.org/imx/6a28f9bb-05fa-45ff-8c0b-790c0caf3252@kernel.=
org/T/#m8f7886b2f57fe80e2d87e2242bc88389dedf2ae4a

These patches need to be either fixed or dropped.

--MBclyymphZ97chDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrLQQACgkQJNaLcl1U
h9Bnggf/dVpAK8GCD1ZnWPqRKPRHVdzjgULXGUb/rFn5DrklU1uBMK8sVMN/jp2G
EYcYEsSSAgF+shGKrwmAKvlBewxQG5Y59dCwtcBqQjJ8Va7M4YWm/SFQRUB2R+pV
O66RK+MaWWZlc+0b/vBG3AjWSRXrDmVj/z5en/6v3ThXxvJgm1k1l0pzDXOCIlkD
pdmCkUzoY1yKOGhpxSIycmJxxEf5lo8PwJvXRGxPD56UcFh0TcG7+p7gbaDihg6L
JDazog/9fov5QRTIk/urQk3n8sdl8FSTeMy4RVXNatSKcgtlH+AwOAEnO/KmdCtR
peijzQUTbAkAfOtVndqcNjd8bqm4tA==
=ph3t
-----END PGP SIGNATURE-----

--MBclyymphZ97chDx--
