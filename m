Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BBA86348;
	Thu,  3 Jul 2025 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556325; cv=none; b=p0ANbp7wFk+eIoByjM8Z8bFqQKYcL5sOUPik960gD3VnCiPflbRxNVUzCMobYz60CW1c3f+0MOYp5l7mlztOY2k0PMgsCYk9H8gNq+mv1FJqfI2UqH8eFVFL7V6GCqU0N8tbDjUpFNHToiH/qLvjOsU/IOSoTLIEcQ9ZNtdPxGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556325; c=relaxed/simple;
	bh=cgusV0AdBbzAaNHT9wtZ1hPqN9+elsYYRlfgDkBORTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjAVetw+JLpe+Xc9YOil/2o0mDM+UHRf0wMPoZdMNK4JTiSAkFKtU3BXIO2G5eElIqaAtfJWwnmpS44NZmbaTBfTUlHBAENe5Asn6H43hRgWIBYc063BbtCf4XqcWUI4PYtsLo2Kfd8M2UZi8e/shDYPuoYmr0gPygxiS8QdmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Om6PPHy3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Om6PPHy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E557FC4CEE3;
	Thu,  3 Jul 2025 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751556325;
	bh=cgusV0AdBbzAaNHT9wtZ1hPqN9+elsYYRlfgDkBORTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Om6PPHy3cLzu9g8gkKDyFTTFti1nAZWwx3pWpkfmpegQdzBQUEoZwg0U+HaGFVZ2v
	 G9X0o8hJIGArv3+Jqyg4+VMnMhCe12XIVqUX6CFeERPu2B8dvU4JMNX+sIbCkEVnna
	 p9Vv4Xyx5QFmXXF1RHfNxI3NRCYMBvi/lhKTlAGWZOlEqQmoVfqg58ofvhtixE+GUM
	 ImYieLOrBGARHWWgnVrXOhUd+jOgaZXlwzOz+ZXRflga7Kupc6izKwGxlT1xrtShti
	 NMfrAtFIWZRqJIrqEOf7akY2zOODz2C2NEddqeDf7kSBPczFLE6DP2PtFoxgDpIH0t
	 sm+wdZ1IRKtqw==
Date: Thu, 3 Jul 2025 16:25:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <8ef60a13-015f-4228-b834-799592342ae6@sirena.org.uk>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xBiVeRj1PViMsqNt"
Content-Disposition: inline
In-Reply-To: <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!


--xBiVeRj1PViMsqNt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 02, 2025 at 10:54:09PM +0300, Laurentiu Mihalcea wrote:
> On 7/2/2025 9:49 PM, Mark Brown wrote:
> > On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:

> >> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
> >> missing 'power-domains' property. The domain needs to be powered on before
> >> attempting to configure the security-related registers.

> > I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
> > system in -next which seem to bisect down to this commit,  I'm seeing
> > separate boot failures on the EVK so haven't been able to confirm the
> > status there.  There's no obvious logging, the dt selftest shows:

> Thanks for catching this!

> After browsing through the provided logs it would seem like no device under the
> AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is not being
> compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.

> Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?

This also appears to be the source of the boot issues I mentioned on the
EVK, affecting ramdisk only boots:

   https://lava.sirena.org.uk/scheduler/job/1533032

as well as NFS.  The board seems to get to userspace but then not
respond to serial input, it looks like it's hit something while loading
modules and locked up but ICBW.

Bisect log:

git bisect start
# status: waiting for both good and bad commits
# good: [bb2c96d4df623d7eb1ecc683fb621dc908d0ecd9] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect good bb2c96d4df623d7eb1ecc683fb621dc908d0ecd9
# status: waiting for bad commit, 1 good commit known
# bad: [8d6c58332c7a8ba025fcfa76888b6c37dbce9633] Add linux-next specific files for 20250703
git bisect bad 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
# bad: [a24f6fb0720d1298e25046c2afd417008986f11d] Merge branch 'mlx5-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git
git bisect bad a24f6fb0720d1298e25046c2afd417008986f11d
# bad: [1f96a201bce97b8b175753cdc9df4124f485e47c] Merge branch 'fs-next' of linux-next
git bisect bad 1f96a201bce97b8b175753cdc9df4124f485e47c
# bad: [99a5bbadf92feeec49a213682272731a6c968c9b] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
git bisect bad 99a5bbadf92feeec49a213682272731a6c968c9b
# good: [b6341cd003a394801ece1c80de80b37cceac4644] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
git bisect good b6341cd003a394801ece1c80de80b37cceac4644
# bad: [370374e41e0d1c3e1c82cee8dd041cb929b87a57] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git
git bisect bad 370374e41e0d1c3e1c82cee8dd041cb929b87a57
# good: [bd71a1d70117432ada29669dee349be3e9e817af] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
git bisect good bd71a1d70117432ada29669dee349be3e9e817af
# bad: [c78e0a2da7b1a1c61449945f51358b852088a130] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
git bisect bad c78e0a2da7b1a1c61449945f51358b852088a130
# good: [b4ff842d24c058e9518a188de2f5153956582f52] arm64: dts: imx943-evk: add bt-sco sound card support
git bisect good b4ff842d24c058e9518a188de2f5153956582f52
# good: [900dd54b8b6281b65612c2df87ddaf64f7989d4d] arm64: dts: imx95-19x19-evk: add GPIO reset for ethphy0
git bisect good 900dd54b8b6281b65612c2df87ddaf64f7989d4d
# good: [3ee18578689c6d5831d8455e138bd298977698ff] arm64: dts: imx93-qsb/evk: add usdhc3 and lpuart5
git bisect good 3ee18578689c6d5831d8455e138bd298977698ff
# good: [fc0d2840a00d75931777e6dba55fcce40f34a24a] arm64: dts: imx93-11x11-evk: remove the duplicated pinctrl_lpi2c3 node
git bisect good fc0d2840a00d75931777e6dba55fcce40f34a24a
# bad: [47773c360293b787a1fe5da5250724abbb4a9e64] arm64: dts: imx8mp: add aipstz-related definitions
git bisect bad 47773c360293b787a1fe5da5250724abbb4a9e64
# bad: [da472d13b1dcf5ffd0e0d151fa83c7059af67d63] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
git bisect bad da472d13b1dcf5ffd0e0d151fa83c7059af67d63
# first bad commit: [da472d13b1dcf5ffd0e0d151fa83c7059af67d63] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'

--xBiVeRj1PViMsqNt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhmoN4ACgkQJNaLcl1U
h9D6Dwf+KzAI9U31n188XYV/+hOA1Ej1gZqwYjIA4Q9ggJMgMlu7rnAWVQhxcgQH
arVPbWHXNRbPXBOW6oxFtB5DDYtgE8KwltDQBwN4b1IT5G0N9ilaUhmU7Eo+G6aF
Qrz756kgEySsV+WfpIeBS3VfrUuf+0kNCltHQdGdMVY5FmKZxJDiYGnYum3v6Vpa
ULmj2lXFCWf9cXLgRTB/vHB6Yv0g06khgxrdLmlgJrfuypyLjedvD6CoTYTZL/3g
DV2TrLqYZMzRcR3y9sBdXs0R4n6v71ZjGvLGBUdx4d4qOgR3fZ3qHezO3PZ487xo
LvIddVQco66F/Jf7/SmeK0VZ60MdEQ==
=Ni2y
-----END PGP SIGNATURE-----

--xBiVeRj1PViMsqNt--
