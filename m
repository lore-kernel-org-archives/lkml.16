Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF4227EBF;
	Fri, 16 May 2025 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396447; cv=none; b=atQkyy29Ct+CfJEh6rK1hBVKDkFuW9b0IJcnez3haO/Nwd6QV1jEsC9/3OD0PCz2qNPejG5MdBTrndeOnUGzFTecgAxoO//8pU6G7PWOwt4583u2yzxk+QzkfGeuyyWzDie9CInIQ3D6RmqVqvnmDG30JriBjGcz4kKutm+7rhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396447; c=relaxed/simple;
	bh=ivb/R1S6r2RO2WRrath55ToVi2bTf8rbS9vtwi1lNXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHfwRrhtMR4XsE7U0oE8SYkysyGQ3JL25Yz/zMU3IfdNJPGkdp9Xr/MAXoZD6NJBIliUiM4v3//fdaH/dJHR74yAGqzSg0XTfdL00QhAPIWyrB5HciJOYosyU/EbiZG0FxI4+fHLxW3ivdzDWmybKlMRP2Jeea6lQskeFOneWSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWjwXe3M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWjwXe3M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F951C4CEE4;
	Fri, 16 May 2025 11:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747396446;
	bh=ivb/R1S6r2RO2WRrath55ToVi2bTf8rbS9vtwi1lNXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWjwXe3M258XeEQx/NbmBcjmqJ7f1uTyDlXQ1hblDuMdCyXPQTViOIvrIFqvhEZcP
	 UryIx2mMeA7Vy2QaXRHgCclneb503DWTx6mhc20hXp238ML3v8Yj7FH6Vz8YtPL5B+
	 Ke6PP/AfYtcTYlYf/Xgt5BiUmzhplJZX5dTOia/xloJwWpm3Ro6PoccZKmCuoC1hkI
	 KzuvvBZ27H+zPBvGL2Ms2PX4Vogmc0Mt4/+iQQFdobGHABnoJKkKJBLb6+vBYjAuNd
	 vvDcUto+TIodhXnQaO5zI/GYISZ6Anhwr+BtXyPoU/t1m8NR6M70gACSaR88f2xHqP
	 G+KmMrXNLj6gw==
Date: Fri, 16 May 2025 13:54:03 +0200
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
Message-ID: <aCcnWx_BzfuLxZ9P@finisterre.sirena.org.uk>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
 <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f8trKPt590fsB1ic"
Content-Disposition: inline
In-Reply-To: <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk>
X-Cookie: Well begun is half done.


--f8trKPt590fsB1ic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 10:52:51AM +0900, Mark Brown wrote:
> On Thu, Apr 24, 2025 at 08:21:41AM +0200, Dario Binacchi wrote:
> > Support NXP i.MX8M anatop PLL module which generates PLLs to CCM root.
> > By doing so, we also simplify the CCM driver code. The changes are
> > backward compatible.
>=20
> This patch, which has been in -next for the past few days as
> 3cbc38cf42ca42d2, breaks boot on i.MX8MP platforms (I have the EVK and
> Verdin).  We die with:

This boot break is still present in -next, and I've not seen a fix
posted yet.  Should we just revert the relevant patches until a fix is
available?

--f8trKPt590fsB1ic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnJ1oACgkQJNaLcl1U
h9BzbQf/d3ddn7KIWiWYv5nwyTgmsfExEQyp3Lp5MbF71mb/UavAxr9ZsuPeyLix
mgUMGE+wP9XO5FI7/vRH7k398r/pYLdJq7lYi1FFie9L/eWwcYFjDAApLxuCJViZ
jEm7pQIi+OR013c2mVCTLByz3Ou7w4Ri4568iVf4+opqGERs0JD9Fr72mUGEz0OI
Y3m4sfZmr47hyI1PGVU/MXvcAmiTtHkrdwzGujJkoiX6cIe9lYPZ7yKnxdZ0jqUm
1CgokulV+6S1x0PWupckRCz/Apb//jW7/ciJ4shGOpexjKAxoreVm+WiWMZPSMDv
vE9T37v1qmm+YAZVaxu2bpgCrlQboQ==
=+wUm
-----END PGP SIGNATURE-----

--f8trKPt590fsB1ic--
