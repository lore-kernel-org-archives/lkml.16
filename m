Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B31A83F2
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744465315; cv=none; b=Ol+U12PRzXmEqM0Xm6USeLOuEUczEETraa2U8AoYkMbyw4xWlraTb2DtZRBuRIMo9DO2dW585q2LNdd4GONUqTqhVm7ebSu/lpepTOiz289jOVfMXtjidgp9xVj9V8HP6DtKMHCawcnA8LWnEG1bBy3VhIcgFLhgIJHfQDJLWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744465315; c=relaxed/simple;
	bh=N8HcNW9CyPWC3bVBg970kSePn67+9k+JEyZ2haoX0WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=de/LlgoYpGlouOrLxxHqsbTO4S5Ek00yBAkch3IJAUukFnyO24Ai03Uwu8KXn6AGvouyTUOJCpXdOaD/mEaL/QbCeJT+SwmJQsGU+ADUgk+uPCkXRlJBBBZ/WokXzCsAifb1VhrLlk/y88UoxfLHBTUejki7W5TO/n0Gq5nkx90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1u3b6o-0001Jb-4t; Sat, 12 Apr 2025 15:41:22 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1u3b6k-004b7M-3B;
	Sat, 12 Apr 2025 15:41:19 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 7F9563F66F8;
	Sat, 12 Apr 2025 13:41:18 +0000 (UTC)
Date: Sat, 12 Apr 2025 15:41:17 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, upstream@lists.phytec.de, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
Message-ID: <20250412-tentacled-rugged-bee-fd7e9c-mkl@pengutronix.de>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-11-primoz.fiser@norik.com>
 <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
 <ef74e49d-c413-4719-a174-42df91384469@norik.com>
 <Z/knehHQeTTUXgr3@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gxqnwwxty7chqrbx"
Content-Disposition: inline
In-Reply-To: <Z/knehHQeTTUXgr3@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org


--gxqnwwxty7chqrbx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
MIME-Version: 1.0

On 11.04.2025 10:30:18, Frank Li wrote:
> On Fri, Apr 11, 2025 at 10:08:21AM +0200, Primoz Fiser wrote:
> > Hi Frank,
> >
> > On 10. 04. 25 17:23, Frank Li wrote:
> > > On Thu, Apr 10, 2025 at 11:02:48AM +0200, Primoz Fiser wrote:
> > >> Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flex=
can1
> > >> interface. The CAN1_EN regulator enables the SN65HVD234 CAN transcei=
ver
> > >> chip.
> > >
> > > Can you use drivers/phy/phy-can-transceiver.c to enable CAN phy inste=
ad
> > > of use hacked regulator-flexcan1-en.
> >
> > Sorry can't do.
> >
> > This doesn't align with other i.MX PHYTEC products using flexcan such as
> > imx8mp-phyboard-pollux-rdk.dts.
> >
> > Even the i.MX93 EVK uses the same mechanism.
>=20
> I think previous method is NOT good enough. Suggest involve CAN and PHY
> maintainer to discuss these.

Since d80bfde3c57a ("can: flexcan: add transceiver capabilities"), which
git mainline with v6.15-rc1 there is proper PHY support in the flexcan
driver. So from my point of view, there's no need to stick to regulator
hack.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--gxqnwwxty7chqrbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmf6bXoACgkQDHRl3/mQ
kZwtKQf/UtcudIKJDifikEV0AghboYKzi7fNrlv6P2KToZkTzAEVzcIRd+nmtol3
I1/xj7uJeFMIXZcjIFT/jvdLx7xot2SkQS0p1y3C96NMbeh6aAj9rtA0VYFN7y0C
PIQXb1K5YC4a4bZjcJO+JaJ2yE3PlZbwOKLP668zJyc+QCrg0bkLVsoYR4/x6liQ
nKQ2+qV40GzfUf00Z6qX4fCjZbRo7g49HWktiizh4pkbryBu7A1+f2Nrl3AN2ZCM
C7wafDh0zsN0DedbscwTJTVR1tQ1yP3YDwmQ2bYw2qs4wXqfnGTawgu7G38C4JO9
UM3PFskg4VWWndjcTNIKkc6L6VryyA==
=mCyB
-----END PGP SIGNATURE-----

--gxqnwwxty7chqrbx--
