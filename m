Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B6A1E51EE;
	Fri,  4 Jul 2025 21:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751665961; cv=none; b=koGdG1Y6SF0yaVgELs+MCPn5XW0cQRk5UKH+KpZRqKteqdqrmEnHT4Dg8WXWrtd+vacZlgpYKDz/zbBwPzn9IokdzYX8EsyNOcQbt8RshVU2zpdegK6QnBWr5IS40KkUwlIq6gpqbRHJb45BhKB1nRCbR2f5WJ30HGrl8iFChyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751665961; c=relaxed/simple;
	bh=rGh/9x7GKS/zN0CBbLJXQvlsi/zZ/QHHtkX/ov0jyyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CggJoySgS/z241JxORlTQHrLDf3P8zh6oNkWGC2EnAJmR/epYvBX8nK0h1OleO2H4iPIcIatb9TKVsLkEbsLxFHetypj2SqJRNn67KCtKaw364IoHOvzh/CLXO9WeywodW8710Hpu2Ml5yVoFv88H0y1RwSeOCngo9sydvtH6As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 3B9261F00055;
	Fri,  4 Jul 2025 21:52:27 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 5F126ACA77B; Fri,  4 Jul 2025 21:52:25 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 52886ACA76F;
	Fri,  4 Jul 2025 21:52:23 +0000 (UTC)
Date: Fri, 4 Jul 2025 23:52:21 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/2] clk: sunxi-ng: v3s: Fix de clock definition
Message-ID: <aGhNFe3wGLX8aUC6@collins>
References: <20250704154008.3463257-1-paulk@sys-base.io>
 <4cd84b9e2227c9225d977107eb05b9c3813b8846.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RaiVzssz9gQuLCYX"
Content-Disposition: inline
In-Reply-To: <4cd84b9e2227c9225d977107eb05b9c3813b8846.camel@icenowy.me>


--RaiVzssz9gQuLCYX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Fri 04 Jul 25, 23:54, Icenowy Zheng a =C3=A9crit :
> =E5=9C=A8 2025-07-04=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 17:40 +0200=EF=
=BC=8CPaul Kocialkowski=E5=86=99=E9=81=93=EF=BC=9A
> > The de clock is marked with CLK_SET_RATE_PARENT, which is really not
> > necessary (as confirmed from experimentation) and significantly
> > restricts flexibility for other clocks using the same parent.
>=20
> With it not setting parent, is arbitary pixel clocks still possible?

Absolutely and the clock tree is very much improved, I think the flag was t=
he
reason that was preventing it from naturally keeping the tcon and de clocks
under the video pll in my case.

Now it can provide both the 33 Mhz for the pixel clock and runs the mixer at
nearly 150 MHz. The video pll now runs at 297 MHz which is a perfect fit for
csi-sclk camera main clock, so the algorithm is doing its job at its best!

So this means that I no longer have to change the mixer clock to 297 MHz to
keep it under the video pll. It pretty much solves all my problems at once.

Here is the relevant clk_summary extract:
    pll-video                        2       2        2        297000000   =
50000      0     50000      Y      deviceless                      no_conne=
ction_id        =20
       csi-sclk                      0       0        3        297000000   =
50000      0     50000      N         1cb8000.isp                     mod  =
                   =20
                                                                           =
                                      1cb0000.camera                  mod  =
                   =20
                                                                           =
                                      1cb1000.csi                     mod  =
                   =20
       tcon                          2       2        1        33000000    =
50000      0     50000      Y         1c0c000.lcd-controller          tcon-=
ch0                =20
          tcon-data-clock            1       1        1        33000000    =
50000      0     50000      Y            deviceless                      no=
_connection_id        =20
       de                            2       2        0        297000000   =
50000      0     50000      Y         1000000.clock                   mod  =
                   =20
          wb-div                     0       0        0        297000000   =
50000      0     50000      Y            deviceless                      no=
_connection_id        =20
             wb                      0       0        0        297000000   =
50000      0     50000      N               deviceless                     =
 no_connection_id        =20
          mixer0-div                 1       1        0        148500000   =
50000      0     50000      Y            deviceless                      no=
_connection_id        =20
             mixer0                  1       1        0        148500000   =
50000      0     50000      Y               1100000.mixer                  =
 mod                     =20

Cheers,

Paul

> >=20
> > In addition the source selection (parent) field is marked as using
> > 2 bits, when it the documentation reports that it uses 3.
> >=20
> > Fix both issues in the de clock definition.
> >=20
> > Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> > =C2=A0drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +--
> > =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > index 52e4369664c5..df345a620d8d 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > @@ -347,8 +347,7 @@ static
> > SUNXI_CCU_GATE(dram_ohci_clk,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0"dram-ohci",=C2=A0=C2=A0=C2=A0=C2=A0"dram",
> > =C2=A0
> > =C2=A0static const char * const de_parents[] =3D { "pll-video", "pll-
> > periph0" };
> > =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 2, BIT(31),
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 3, BIT(31), 0);
> > =C2=A0
> > =C2=A0static const char * const tcon_parents[] =3D { "pll-video", "pll-
> > periph0" };
> > =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_parents,
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--RaiVzssz9gQuLCYX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhoTRUACgkQhP3B6o/u
lQxbYA//RHcmC2v5VG/WOF5k4Jxlw3iw+cDIPEFZifNzFxgSMjXLP3+LgrG4Z3Yv
WusHzye4XCRui2HzEB0exnbhb2H/UgOqmbQin9q0c87H4ZBqWF1rNAbtOrKCGBqN
2c8k/e6W+5KzJ2gFwonc54jw+X4yKjgckE8vd3afHjIjs1OoPHN465ulYmsu56n/
3fRBIYonPB6LGPOQlGdpN40/emIpOmMNlKtM+R2UEUh8D17OKr7Mae3mtOZi7Tc/
T2YtEa+gzyn+bobKPAJ4HbvBfYy66Wh0JDc6J8EGMyLl13NX6+EU4N5Nu4tABY4K
75HDwyc27t6zKRHBePvmS+VvcUw5JOdpg80qgwWnVKc/XQ5WV5LDhOMwbrA3SnmP
h4pWBGcdlnd/ngHsZDAmb7xO94UJBnzc9X5PSrq9dRWBUnbok11aIKAH5TUR7Hyd
68wQtAzMT08oJb3XA8d5fj5fTsKRHBcqYCpyzuMFlZmumIR/yelfmyZNuWOphdqm
L0ZQd5d1FRYBUrNE6td439wbXoXL15e22nfNlkbL/CLXSuchodaWW+kPrSnf+/Bp
V7P9OwNtmaI8LA6ANIFrRXqoaYJ3T+8OjHgpsO5zXH8f4ltEDWaqNl8Jg5NdNC5U
inqvGtvmlsaUZ6wRQWreBp1trzhM5cmxJrYaKFZtyAtMgFiLrZM=
=/bFC
-----END PGP SIGNATURE-----

--RaiVzssz9gQuLCYX--
