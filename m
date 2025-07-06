Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBEC80B;
	Sun,  6 Jul 2025 00:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751760429; cv=none; b=TZagMLt7HXPl58m0Cktj46/cRfT5Z9yy5KC3Fh+tf5oSRgwRcXcIftX2Jr23tE1R7kNXanRt+KIhi4QmJCBm9dEjn54NjeDv4z7yEv5NBNCJes2sAf+JlNOgHn3D4TZahTNo7SqveII05/ixjQNkwDWucLnRP6OvV2teAIEM6PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751760429; c=relaxed/simple;
	bh=ZAB548LQDZBrJBh5YWoRXDTriGUozRf+t4s+9DCamyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAtq2HMVZ5lrEdLBJqRSiHN2Ol5ANjIqUz5IUDtxkCfuj9y/KsNpmiws7Ack9LbjuvQJ4gnOnL1hOO7NBmF1BWU1vNdahzjbxT4za9Hz14RpXsRzCyGJJkWPk6NYe+ArIz5hpM7isklf0BiySWZZFXUbj9KUSZTAZJjJamQtz8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id F25041F00053;
	Sun,  6 Jul 2025 00:06:59 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8A93BACA8A2; Sun,  6 Jul 2025 00:06:58 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 71A79ACA89B;
	Sun,  6 Jul 2025 00:06:55 +0000 (UTC)
Date: Sun, 6 Jul 2025 02:06:53 +0200
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
Message-ID: <aGm-HRnhxAQmj8d9@collins>
References: <20250704154008.3463257-1-paulk@sys-base.io>
 <4cd84b9e2227c9225d977107eb05b9c3813b8846.camel@icenowy.me>
 <aGhNFe3wGLX8aUC6@collins>
 <1d51b75f7b85ddb588bbb24366b36df63a60712e.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RtSzGXCSjNLtl0Rj"
Content-Disposition: inline
In-Reply-To: <1d51b75f7b85ddb588bbb24366b36df63a60712e.camel@icenowy.me>


--RtSzGXCSjNLtl0Rj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Sat 05 Jul 25, 14:38, Icenowy Zheng a =C3=A9crit :
> =E5=9C=A8 2025-07-04=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 23:52 +0200=EF=
=BC=8CPaul Kocialkowski=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >=20
> > Le Fri 04 Jul 25, 23:54, Icenowy Zheng a =C3=A9crit :
> > > =E5=9C=A8 2025-07-04=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 17:40 +0200=
=EF=BC=8CPaul Kocialkowski=E5=86=99=E9=81=93=EF=BC=9A
> > > > The de clock is marked with CLK_SET_RATE_PARENT, which is really
> > > > not
> > > > necessary (as confirmed from experimentation) and significantly
> > > > restricts flexibility for other clocks using the same parent.
> > >=20
> > > With it not setting parent, is arbitary pixel clocks still
> > > possible?
> >=20
> > Absolutely and the clock tree is very much improved, I think the flag
> > was the
> > reason that was preventing it from naturally keeping the tcon and de
> > clocks
> > under the video pll in my case.
> >=20
> > Now it can provide both the 33 Mhz for the pixel clock and runs the
> > mixer at
> > nearly 150 MHz. The video pll now runs at 297 MHz which is a perfect
>=20
> Did you test other pixel clocks?
>=20
> I suggest you to try a RGB-to-VGA bridge and test possible pixel clocks
> on the VGA port.

I don't have any such bridge and the V3/V3s boards I have would not easily
allow connecting such a display. But I would be glad if someone wants to te=
st
the patch with such a setup.

Cheers,

Paul


> > fit for
> > csi-sclk camera main clock, so the algorithm is doing its job at its
> > best!
> >=20
> > So this means that I no longer have to change the mixer clock to 297
> > MHz to
> > keep it under the video pll. It pretty much solves all my problems at
> > once.
> >=20
> > Here is the relevant clk_summary extract:
> > =C2=A0=C2=A0=C2=A0 pll-video=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csi-sclk=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 N=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > 1cb8000.isp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 1cb0000.camera=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 1cb1000.csi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > 33000000=C2=A0=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1c0c000.lcd-
> > controller=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcon-c=
h0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcon-data-clock=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 33000000=C2=A0=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > 1000000.clock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wb-div=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 wb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 N=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mixer0-div=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 148500000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 mixer0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
> > 148500000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 1100000.mixer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> >=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > >=20
> > > > In addition the source selection (parent) field is marked as
> > > > using
> > > > 2 bits, when it the documentation reports that it uses 3.
> > > >=20
> > > > Fix both issues in the de clock definition.
> > > >=20
> > > > Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
> > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > ---
> > > > =C2=A0drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +--
> > > > =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > > > b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > > > index 52e4369664c5..df345a620d8d 100644
> > > > --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > > > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > > > @@ -347,8 +347,7 @@ static
> > > > SUNXI_CCU_GATE(dram_ohci_clk,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0"dram-ohci",=C2=A0=C2=A0=C2=A0=C2=A0"dram",
> > > > =C2=A0
> > > > =C2=A0static const char * const de_parents[] =3D { "pll-video", "pl=
l-
> > > > periph0" };
> > > > =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 2, BIT(31),
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 3, BIT(31), =
0);
> > > > =C2=A0
> > > > =C2=A0static const char * const tcon_parents[] =3D { "pll-video", "=
pll-
> > > > periph0" };
> > > > =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_paren=
ts,
> > >=20
> >=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--RtSzGXCSjNLtl0Rj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhpvh0ACgkQhP3B6o/u
lQzw3BAAlZqZNsqv5fI1/5xfOK0MrnTVr2yeWJVICGYxyzcojdETTioT9fGpIvZd
+RTggHTRC5yXn6nHtfcsSZeJooEBQc327qTLBlZEilcr6eWaTwqvGzQujuO59oTK
ULLJk5dpMlTOYopK0zgIu7Yiv7bU0i1E3LG7A5a60JWT51qrWXKV8kvvRSFZYfRj
E+ckIIcJhcU4z8MkWuX2aVbORAVJCNa2P8pMbj03VxkaSFOG2fkblnX62Ke9UmZN
gJsPcvW3MLhYfUDQRJEs10EtvGrvOQ8b5/6sB8nyik3GJcTnQYoyCgNUlMd//qCL
mtkCJeWhxnKtFfrubCBut3zh79PE8eZj5Zqjk5XY8XgzEQsaXk6gU+UQExUrRYm0
+QBwLNwqlAkQkTP2Jo2W3DwptF1nh/npAMTYhxenA0MmAzm3iyu5MJRwSmOhSuw8
TiMGlysGjbZSHzYmXKoHQUlQ37gkIrOMDNpQZsbqfx9rmED1kVdwzN19fz7rojD4
+gBvLSc+56oJyPm267oXgfPort5tHncJlJtD6C2n66Z9wVWKWeUwWzq1PvTvn4IW
ePThwkZ3jLr9PO4l8rIADpl7MU0GpH6KyYtMdWG0jQ8EdY667T5ah+6teFmVZdA0
qmqpvetS96j0PTDhrzhBX7d47rOey3M9XO71qZ36QLbeNJxmO6o=
=LLPO
-----END PGP SIGNATURE-----

--RtSzGXCSjNLtl0Rj--
