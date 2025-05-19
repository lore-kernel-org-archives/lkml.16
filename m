Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60003268FC8;
	Mon, 19 May 2025 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665060; cv=none; b=tr+0ro2PSkzlz7yjuthObWVDsq4rtMkiB286fEqKsuDjnHoSXdPj/fpYGhAwlD5sVwVVFvAGoPz/p4i1Gm234WrVfCXqOqaaCM1hWRrBGhBr2Abyvf6Z6PCk5L1HCTwjG5SxezhJGV12RnVFBXpXBgKI+s4a11ZRF/z2HjL5xcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665060; c=relaxed/simple;
	bh=Frb3sunV2ENhXKid51T6ZwuAujvRL92OYErynI1QNPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnZ0laXJEhdUYds6zy0H/0MxD12ylF5dK+BLh4ljCvnzdA7XNiu34bNcznX3hExTFOqjjVZOsctMUW/EKS+X7SNXCsIwChPt2zRQ7eKUpknLvuHt6rsDn1kcCjOEzVk3ErZHrRmQ5/pYFjnIJZvGNX5cdc0xFt0Le+npdaTceaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAb1fYLr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAb1fYLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FF5C4CEE9;
	Mon, 19 May 2025 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747665059;
	bh=Frb3sunV2ENhXKid51T6ZwuAujvRL92OYErynI1QNPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAb1fYLrBeKJGnk2IJ9S1cu3ZQ3cApkn8ZujBtE+RYvjtEGHDElYpRjBunsn+80Lq
	 gk7PazzgHIQVQeI56zkZ+8NeyF76SQ4V6VAjBrO2S6sP6NETgdLs0GB0cY/v1XW3kl
	 UU8egKVe04gTYI2DRfThddoiJq5HBN/WKwoMb1ryiTypcmq+CbsmfU/exzmlli70pH
	 Nw21n1gWRQG6dQB+diYGstG0SuBCeHEz3DksU3sPA68uI0TctlFgFWF7MKKpWGeJhg
	 cRV6BdKStlFX/HTNWaHq/prv34ePzJGq9QgL32YnwjMLeYHIVEy8Jt+thx6TpIfxVu
	 yuNctDG18pERA==
Date: Mon, 19 May 2025 15:30:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
Message-ID: <1ca1fe0b-2337-4aa6-b36d-f4d11df7b0f5@sirena.org.uk>
References: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
 <PAXPR04MB8459312B18CBAEDF9192A188889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <c929b7d8-6348-4978-824e-6902d0364a00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tcNGpct1qXGitB4"
Content-Disposition: inline
In-Reply-To: <c929b7d8-6348-4978-824e-6902d0364a00@linaro.org>
X-Cookie: We have ears, earther...FOUR OF THEM!


--5tcNGpct1qXGitB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 04:13:14PM +0200, Krzysztof Kozlowski wrote:

> You claim with this:

> 	compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";

> That 8mp is fully compatible with 8mm, yet here you claim that 8mm is
> not handled. So it is both compatible and not compatible.

Note that binding for anatop and the above compatible list are in
mainline so this is a preexisting issue, whatever differences there are
in the versions in the two SoCs aren't triggering problems with the code
that's in mainline.  The series adding actual clock drivers triggers the
issue but the claim that the two were compatible wasn't introduced by
it.  Given this if people are shipping DTBs based on the existing kernel
we might need something like this patch to work around them, even if we
fix the existing binding and .dtsi files.

--5tcNGpct1qXGitB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrQJ0ACgkQJNaLcl1U
h9DtDAf/YOhQ/EgQbcTye6iDeHwoQtdcs7hIDQQaJYA6f9Io0CcGpfOSYQHlbN/n
OIcXaNe+qIC2nc94z8vn5LvGkFTEb4qHUtW8PJKzXrRurP72HvOAk0oEdJN9OylP
6Lerjp0Z88s3h6t/aeXVedjzsnbDiil9dXtbAnR7QEzma03NJfWdsf/ecwcPFgXc
JsPSniUHinFE4f0bSq5iRPshTdBpwmHMgjbEI2jedSom27U8693k4uRhmq0qZ+ht
plwHnVPkcsH2V4dZe5XGr2pQ82CEyPZkfHYjfjSBBiDMAgOPgrIlUbjXCfuRgCYL
iEz7t/xV12xq7v9pp8sssHCZ2JSf0A==
=Lhqe
-----END PGP SIGNATURE-----

--5tcNGpct1qXGitB4--
