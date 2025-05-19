Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105013D52F;
	Mon, 19 May 2025 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656321; cv=none; b=I5Q6BDMmS9rxTiAiNqSxEuhBt0zkIyC9OSe0uX+sB8+BMEhWvTR72LKkEY+P/qggwUR31vzLVGXcMYcxhd3Xwf2ic/KqpeRx9OUUHmDGsISqIc6pFYFAUUGl41Ra+S5QXv43ugnOR0kPN9K5aWSHsS3390RCJXQiODcxIyk4958=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656321; c=relaxed/simple;
	bh=uaBVwUV7aElBCII+pwox4x6oSohZUw70T7BmwRHYa7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqmSS+DKRHadDLhCg8AE4xASWT6aXEppIQPFqCzW1EVObMrZoRZv3IQhyoeM+YomYrdSIcmhebyrpWLbNBDHogxbvzMr5iq7Msb0atBDy8DFyyseihnT0gGhYeUr+bPCg7Fx5ZOXFtbrYXq39gxULp8hR7CX73CdlwEJuXa9W+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ll/nAuUj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll/nAuUj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AB0C4CEE4;
	Mon, 19 May 2025 12:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747656320;
	bh=uaBVwUV7aElBCII+pwox4x6oSohZUw70T7BmwRHYa7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ll/nAuUjNrOyw8j2ZkTdy2sagqzkbs1Prucq/UAr/aTQL658hbos9KEspxJJnQb+J
	 zD3GHS564rMkVJmZl/Rm0enKRTfyCOEU2TwazlDhPahb8hisgBip9BtNm4ww68llte
	 l1N89ijETKpKJ/OBKTVhdIY5VXe1vhVDQ7gT2Qrdhh0xPHdZBn35WRxJXObcEX+5e3
	 pha845Cjb6Bm9LwuHHefAJxX694ZkKlRVoTNNbdRhzbjxs2kknGOHx2M23ip/2NVjg
	 Giw8VfnIjmuNt8LlG2/yXVZg1fFAzAkw0RmSZlY2abGtBzRFC8XNB0FFgHT7WRwIpD
	 V1r1gdk9dU91g==
Date: Mon, 19 May 2025 13:05:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM
 platforms
Message-ID: <64488c18-d86d-490d-828f-7c82f654876e@sirena.org.uk>
References: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AmBTndPcfU5+JRsO"
Content-Disposition: inline
In-Reply-To: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
X-Cookie: We have ears, earther...FOUR OF THEM!


--AmBTndPcfU5+JRsO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 03:49:27PM +0200, Dario Binacchi wrote:
> Commit 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock
> driver") breaks boot on i.MX8M{P,N} platforms.

=2E..

> In the imx8mp.dtsi device tree, the anatop compatible string is:
>=20
> compatible =3D "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
>=20
> So, in configurations like arm64 defconfig, where CONFIG_CLK_IMX8MP and
> CONFIG_CLK_IMX8MM as well as CONFIG_CLK_IMX8MN are enabled, the driver
> for the i.MX8MM anatop is incorrectly loaded.
>=20
> The patch fixes the regression by ensuring that the i.MX8MM anatop
> driver only probes on i.MX8MM platforms.

This *works* so=20

Tested-by: Mark Brown <broonie@kernel.org>

and we probably need it for existing built DTs, but shouldn't there also
be a patch to the DT source since the two blocks clearly don't seem to
be compatible.

--AmBTndPcfU5+JRsO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrHncACgkQJNaLcl1U
h9CqPwf6AnDPQlXq5+ODftAO94GVICXfG0CkD34290bl/C//PcNtkKwFLwEi08Ny
hv5H6y1Y2VNYHSE7dtfY1W8hzHczRKcnWqzVhN8Qqp2rpqA5GR4Cl6llJGMwkMFS
T0whNbLSVTJrrzHluALbF629AnThigYlhGGMGoCsgNEZsVtnwnBzv8jsFKP38EWS
4r2onOssrGcIDte2DdWzkOSJnm7xIwOTU10zBz4rVZwi2DpuFyivispFSJugv5j3
cl7zgoT9UrdntwYvZRktpd6Nhq0gq0C6ABaSMuX4WPvshOqfjRyb9t++FLg3v1YH
IKj/y81cV70tRM6qd4PID7u9fbsxmA==
=9WUQ
-----END PGP SIGNATURE-----

--AmBTndPcfU5+JRsO--
