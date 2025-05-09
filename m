Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA526B09A;
	Fri,  9 May 2025 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781223; cv=none; b=Fynu6mB0oWjAMeTk/UFQ36OeI0kTLNSp2h2NTWjdEzQuvq0ap/FK3ZUeBB3QUDFd7CV6vpmsR8IJe6eIDS3ijQmbqYzgXeRZ9oGVLyQlcaUCzkP7uhY9UN/BqL6psYCGszpg8f91+Wq8/h05pQ+VxdJjxpX8lzE2LufurDkuEDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781223; c=relaxed/simple;
	bh=WggMzPB4PnrTuJVx60/e7YDCOMcSJ2K4xopMb4oUKlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5L6xQJ8z8gXzCNGFeYMtTPW14olTDYbnh2Q1Rhl4UmYvFttszn2z9JgQebSuH/5gMYDoz47QUDTeZlmAoGMp9NO7MXr5Ka0H/a6sJb8HuG1mtvVespNojMqJbIrmz5L8fjr+5nrDfw0yNe5mf8dqDlY5Fem2wCuKe61RXtuLF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBGJSfUc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBGJSfUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E588C4CEE4;
	Fri,  9 May 2025 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746781222;
	bh=WggMzPB4PnrTuJVx60/e7YDCOMcSJ2K4xopMb4oUKlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBGJSfUcQQhwvIfaq6rz0bXdvpjSawL2rnIVRci9JQxF0vJytuc4Zt6AkacWf/R4Q
	 NkGsl35CCsc7X5QbWMJhEYe4eNgGqRv9+K3l32nYK5iNGvIgLejRnn7kIkIJWDkwO/
	 HMs1VlQRJ9fkwttxLy+FYYAiFcdcp0XAO9js/CyhiCk0B2nHWLJevYboF/y81KjGu8
	 R0ePIVKVQe3S5VNloWQ8IOnjmBxBIx3ZbRzMwGLqI/UYaiBN7TxhW1Wavz3Nd3HG9Q
	 q5faFlaW5CTMYk2m9mFaiPehhKJ3FggnNY5UhKCHv+PZlJN48Uf0N93FRP5pImIgO4
	 uZiQ4y1mjO6AQ==
Date: Fri, 9 May 2025 18:00:19 +0900
From: Mark Brown <broonie@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 11/19] clk: imx: add support for i.MX8MM anatop clock
 driver
Message-ID: <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
 <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk>
 <CABGWkvqySQugJpaj1s_jqGHkA5BONALJY5jn7JjZe=iLc5x60Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LNr9BVPJwGXcU9WK"
Content-Disposition: inline
In-Reply-To: <CABGWkvqySQugJpaj1s_jqGHkA5BONALJY5jn7JjZe=iLc5x60Q@mail.gmail.com>
X-Cookie: Well begun is half done.


--LNr9BVPJwGXcU9WK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 09, 2025 at 10:34:38AM +0200, Dario Binacchi wrote:

> From the log I see that you are testing a board with i.MX8MP, but it's
> probing the anatop for i.MX8MM.
> Is it possible that you have the CONFIG_CLK_IMX8MM option enabled?

This is an arm64 defconfig so whatever that has set, including the
above.  Note that arm64 is supposed to be single kernel build for all
platforms so we shouldn't explode due to config options for other
platforms.

Current -next defconfig:

   https://builds.sirena.org.uk/f48887a98b78880b7711aca311fbbbcaad6c4e3b/arm64/defconfig/config

> I have personally tested the patches on i.MX8MN and i.MX8MP
> architectures, with only
> CONFIG_CLK_IMX8MN and CONFIG_CLK_IMX8MP enabled respectively, and I
> didn't encounter any issues.

Given it's wide use for CI the defconfig really needs covering, any
random combination of options that can be set ought to work though.

--LNr9BVPJwGXcU9WK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgdxB0ACgkQJNaLcl1U
h9BSlwf/Vtb8OMqevi6wj00lKii/uNGXMGvMTb9ifa4UeAtfm5zK6qZXBmlEq0UC
cTA1i2924jNkx+ibv6O8m3+inlwjJL5Z6TFpHUn/4QinBhHQeqp0uAlw07lFR2rC
xzNOMYpxPqxoA8s+zzpXIKnlq7sVaPBj04pw9mlbFEeOf/6BRNOTPWePvkH4Ivl7
c34t8qAzUcfZjuVV0mDfrNUKrWTrMvwYTYJWhXemCXwO5QzhFD97YFWXnF+sGBlP
y388Wc4mqN8yO9ePREYfR8aN4jFtcB8+J6LUuDtotLw5QQS62DmPnZ3dC3sMeJGE
4xm+8aOZ1B4WIIQtQm2MPtwX350Srw==
=nfNO
-----END PGP SIGNATURE-----

--LNr9BVPJwGXcU9WK--
