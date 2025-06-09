Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1659670830;
	Mon,  9 Jun 2025 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485819; cv=none; b=igcT8lfCuTXLXyMkAOpyVWeJZyB45Dw7kUlMZszYhqOdITwR1bfLmLDCt1wLNJS0vZrqrSGkdnnLoSAbvjr6NTq5TzxxP32B1sTgvH8JBw4HvHFt/Rs1xmeSBBbcwE4PVoheJ7aLwg3cSR03LN439DT8+CzLT3/zBYZfvBaMTQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485819; c=relaxed/simple;
	bh=BDt+EnSMyugovQvGy6Ubv/cuTr+b0OgRnccv/d6A2/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNGBF5qF92i6DuwTbrS5OTbccaWYn40T8sbx1JqpeqF94PLJgWAvL2AGTX5zbfG/ghuMnBhBeKrtjwx3Gpeuxzp1Vy92cZmLGTEhqq4msHYxs9Pd6HUpnVaKjZydKiugJ3AnXeKOAcgLu8iTubbOzqDLKops/pYKxihaPwLUwuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KshWZfNM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KshWZfNM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2198EC4CEEB;
	Mon,  9 Jun 2025 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485818;
	bh=BDt+EnSMyugovQvGy6Ubv/cuTr+b0OgRnccv/d6A2/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KshWZfNMecvaiHnkIONsQ50d9Yp5Qe+bnB8MKfIB/q5aURqIFP3bjcUTeNxjGErt9
	 K+htwKahgSnFQaU8QGtS5ABs5RLYweIQd+Zt1neCy15lWSYdtfuInB/uvzAXqTIj29
	 7kSRDAF5ZEHFIdaoivavseD1gw/u0AGS7nmpWN2igTcS+I/YVqe41PB1kyUeumUhAA
	 jFHaqNEOcpHdVx5fBu7C/KWrYFITvXYNCfPsHafgbXosLAc06Rct3i/1GxPOkRc23W
	 YMTT7eyLnNF+SRTHAbdkTr8uz+0gDXNVDGnKaIKpGFy2SIwoXesIcoqy6EN+y4vt1t
	 jMowmX8qLG2vw==
Date: Mon, 9 Jun 2025 17:16:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <20250609-donut-oozy-4dcc8b8a292d@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iCuGkXnhoBvf8BTy"
Content-Disposition: inline
In-Reply-To: <aEbOLztcBsKs84pn@atctrx.andestech.com>


--iCuGkXnhoBvf8BTy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 08:06:07PM +0800, Ben Zong-You Xie wrote:
> On Fri, Jun 06, 2025 at 05:00:06PM +0100, Conor Dooley wrote:
> > [EXTERNAL MAIL]
>=20
> > Date: Fri, 6 Jun 2025 17:00:06 +0100
> > From: Conor Dooley <conor@kernel.org>
> > To: Ben Zong-You Xie <ben717@andestech.com>
> > Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
> >  alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.or=
g,
> >  tglx@linutronix.de, daniel.lezcano@linaro.org,
> >  prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
> >  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
> >  tim609@andestech.com
> > Subject: Re: [PATCH v5 0/8] add Voyager board support
> >=20
> > On Mon, Jun 02, 2025 at 02:07:39PM +0800, Ben Zong-You Xie wrote:
> > > The Voyager is a 9.6=E2=80=9D x 9.6=E2=80=9D Micro ATX form factor de=
velopment board
> > > including Andes QiLai SoC. This patch series adds minimal device tree
> > > files for the QiLai SoC and the Voyager board [1].
> > >=20
> > > Now only support basic uart drivers to boot up into a basic console. =
Other
> > > features will be added later.
> > >=20
> > > [1] https://www.andestech.com/en/products-solutions/andeshape-platfor=
ms/qilai-chip/
> >=20
> > Ball is in your court now, after rc1 make a tree and get it in
> > linux-next, and then send a pr to soc@kernel.org with this new content.
> > Perhaps the defconfig should go separately, I can take that one if you
> > want.
> >=20
> > Cheers,
> > Conor.
>=20
> Hi Conor,
>=20
> Thanks for your guidance on these patches. I will send a PR to
> soc@kernel.org as you suggested.
>=20
> For the defconfig patch, I'm happy for you to handle it. Just let me
> know if there's anything specific you'd like me to include.

Okay, I picked it up on the basis that you'll send this all to Arnd for
6.17

--iCuGkXnhoBvf8BTy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcI9QAKCRB4tDGHoIJi
0v76AQChF8SXV3tPX9YUO2D246RCtAdeJqY1xijoKS4uH+krRwD+PdF1c5ekrJ8O
9gc3f3JiiaRzFrvpTMdcP+Li/L8lSAg=
=sY/T
-----END PGP SIGNATURE-----

--iCuGkXnhoBvf8BTy--
