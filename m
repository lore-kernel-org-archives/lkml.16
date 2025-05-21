Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B426D4D2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832411; cv=none; b=TIAs57TbtoIPbD7zytdcEzdOSjsMDap6Y85KCz3c75BD+/9lhmto3APONelINCh3q9IoI8FvuUFnf4qoa7naKD3/f1NNaMMFVzVLpPqRRpaVESpNz1A/OOimB+ZWOeSP3Uqi1xW521u1iiyLLNYCYlD+QUWCIXG6OuZbDLxFL/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832411; c=relaxed/simple;
	bh=0hRq0bSmR5JZNPD2Mx0NYL1bKkYX+m5s1ZMhJDwT44g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACbMY8oC+ksWvICJf/tdmD41XuTCLIiIltkYTh15x2rkO1FcHZEHYoI6bWCFsqb+FiyQTBmHmAPTpKfgJaBqU56KEOj8sHabd07RYe9qbmJ1BZgPAhPFbs+tFesyVQykSb2sX8spWIYC+tad2zQbh3Npv0TpRTz/Em6nxqKpbPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uHj32-00007s-NY; Wed, 21 May 2025 14:59:52 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uHj32-000ZXv-1X;
	Wed, 21 May 2025 14:59:52 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8452641698E;
	Wed, 21 May 2025 12:59:51 +0000 (UTC)
Date: Wed, 21 May 2025 14:59:50 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
Message-ID: <20250521-neon-yellow-groundhog-69f777-mkl@pengutronix.de>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
 <20250521-quizzical-tidy-worm-1fe67d-mkl@pengutronix.de>
 <CABGWkvrmuhaF4iHqHRkrNrrHb2gUNDBJKCT-jZ8ZuwZGRvm7Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a46t33bhnuh43qgg"
Content-Disposition: inline
In-Reply-To: <CABGWkvrmuhaF4iHqHRkrNrrHb2gUNDBJKCT-jZ8ZuwZGRvm7Lw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org


--a46t33bhnuh43qgg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
MIME-Version: 1.0

On 21.05.2025 12:32:19, Dario Binacchi wrote:
> Hello Marc,
>=20
> On Wed, May 21, 2025 at 11:35=E2=80=AFAM Marc Kleine-Budde <mkl@pengutron=
ix.de> wrote:
> >
> > On 21.05.2025 11:28:22, Dario Binacchi wrote:
> > > The board includes the following resources:
> > >  - 256 Mbytes NAND Flash
> > >  - 256 Mbytes SRAM
> > >  - LCD-TFT controller
> > >  - CAN
> >
> > [...]
> >
> > > +&can0 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&can0_pins_a>;
> > > +     xceiver-supply =3D <&reg_3v3>;
> >
> > Since v6.15-rc1 (d80bfde3c57a ("can: flexcan: add transceiver
> > capabilities")), the flexcan driver supports CAN transceivers via the
> > phy framework, see drivers/phy/phy-can-transceiver.c. Can you make use
> > of it?
>=20
> The board uses the SN65HVD233 transceiver, which is not listed among those
> supported by drivers/phy/phy-can-transceiver.c. So I can't use the PHY
> framework.

Hmmm, okay. Since the SN65HVD233 has features like loopback, we have to
think about it more than adding a new compatible to the existing driver.

> Do you agree?

Ok

> Or am I missing something?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--a46t33bhnuh43qgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgtzkIACgkQDHRl3/mQ
kZxORgf/WqqWv1YA6aA24pwIch/Mdi1hGSfsgp+sRP0Y+Rjp3ZFzW/NzCap+BoX8
VPtoygZEJLRnFjuApZePl2IwbhUX8gEjffcfl29qjLzAo6Z4MFQUlzzAr9+GZS8h
5XVxLVWher9z7xrW49Bhrebad+f9TEp+yFdez/W8LqTG6csHd2j/WhNvnA+iWp1u
1aNVS6/4dFWPgqB+aQItZ8WXJOalqhKEePqgONIWA61pPwtsF/u219pPYLLfVFAs
vL+7hVS2jph1b3sbLcUxTqZ6IV1kMUs8IyMmKyx9zYq7ziblcDGILMlPaJPkxvJO
xunHUUhFDU2GQso45w88F6DpSq2SCA==
=KaRh
-----END PGP SIGNATURE-----

--a46t33bhnuh43qgg--
