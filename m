Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF4021579F;
	Mon,  9 Jun 2025 16:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485875; cv=none; b=Ra5oBBNqNLjJ/X7LJddXhIP2yhfyZHR3/iyrcuSs8qamJ5CVX6FWDhaDOCayoGEDls0xjoHI+uUvhy/Z/NqhppKZPSjXxPmGf3do65Y551zoapf+9YOhgfUJpJ+W7WzjIdQdZxxN/YQeP3bz77hRQJdnahffLA2y6fnwPsfr7LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485875; c=relaxed/simple;
	bh=VU0ezmyeQJzFia/lWEe/vXWrCvKWaOlWYTkg8Kfuy9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNtrr3s+uezYsMtfK3sjo6JxbWlXcQQnetPmZ8eFWu1Af9aCAUOqe8lTGMj8AhsrA74+ZbqoVjsK7I3FhLYk9rZhpcUQrBht2NeTkjFgp/PCFrfdZvQ5w0X6IZ/M+mrECg5YBoH+AecCcRDsCdk1661ZEg8OYwvoXznKzsbl8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlAIOFGc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlAIOFGc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F85C4CEEB;
	Mon,  9 Jun 2025 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485875;
	bh=VU0ezmyeQJzFia/lWEe/vXWrCvKWaOlWYTkg8Kfuy9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlAIOFGcbDC+m0wddJJr+b3+9hmh2x082s8zs/caxZPjEEPbXWrcsNF4PIm13ubwu
	 bwoawW+9It7BSEVHTx8LJKONYvTQna6C09uW3FytqWrNPUucMyIK6FwUC90YbZCZDm
	 6YORhIaKCKpDVjYQvNjJXI663IlhaOiFwaa8Mm4yoHagnwnXBlnWHDMYqZyDbDbqZY
	 Pg2HMquPvSsUSTr7bJHZthfJVGW4fgCbA0Gw/E7L8vpeVxUViHjz9YF6mgCMxMK4Mq
	 rrRLyR6OHckA1E0DpqE6PR5OKfv42YOVqxh81WJIDk+O3A4dTtDzclkgXOm2MJzSQL
	 6znZHVTDn8Ccw==
Date: Mon, 9 Jun 2025 17:17:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <20250609-twiddling-clamp-eaa0dd2b1cad@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
 <20250609-donut-oozy-4dcc8b8a292d@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KEnw/+reIV1mgEnt"
Content-Disposition: inline
In-Reply-To: <20250609-donut-oozy-4dcc8b8a292d@spud>


--KEnw/+reIV1mgEnt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 05:16:54PM +0100, Conor Dooley wrote:
> On Mon, Jun 09, 2025 at 08:06:07PM +0800, Ben Zong-You Xie wrote:
> > On Fri, Jun 06, 2025 at 05:00:06PM +0100, Conor Dooley wrote:
> > > [EXTERNAL MAIL]
> >=20
> > > Date: Fri, 6 Jun 2025 17:00:06 +0100
> > > From: Conor Dooley <conor@kernel.org>
> > > To: Ben Zong-You Xie <ben717@andestech.com>
> > > Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.e=
du,
> > >  alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.=
org,
> > >  tglx@linutronix.de, daniel.lezcano@linaro.org,
> > >  prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
> > >  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
> > >  tim609@andestech.com
> > > Subject: Re: [PATCH v5 0/8] add Voyager board support
> > >=20
> > > On Mon, Jun 02, 2025 at 02:07:39PM +0800, Ben Zong-You Xie wrote:
> > > > The Voyager is a 9.6=E2=80=9D x 9.6=E2=80=9D Micro ATX form factor =
development board
> > > > including Andes QiLai SoC. This patch series adds minimal device tr=
ee
> > > > files for the QiLai SoC and the Voyager board [1].
> > > >=20
> > > > Now only support basic uart drivers to boot up into a basic console=
=2E Other
> > > > features will be added later.
> > > >=20
> > > > [1] https://www.andestech.com/en/products-solutions/andeshape-platf=
orms/qilai-chip/
> > >=20
> > > Ball is in your court now, after rc1 make a tree and get it in
> > > linux-next, and then send a pr to soc@kernel.org with this new conten=
t.
> > > Perhaps the defconfig should go separately, I can take that one if you
> > > want.
> > >=20
> > > Cheers,
> > > Conor.
> >=20
> > Hi Conor,
> >=20
> > Thanks for your guidance on these patches. I will send a PR to
> > soc@kernel.org as you suggested.
> >=20
> > For the defconfig patch, I'm happy for you to handle it. Just let me
> > know if there's anything specific you'd like me to include.
>=20
> Okay, I picked it up on the basis that you'll send this all to Arnd for
> 6.17

Sorry, I think that was really poorly worded. I picked it up on the
basis that you're going to send the other patches in the series to Arnd
for 6.17.

--KEnw/+reIV1mgEnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcJLgAKCRB4tDGHoIJi
0h0gAQDoR2UYOM0WmjHCTYmKE7o6YujCEbz5BvotuMzHNQnVwAEA0Tu9ckL5FowB
Pxmih3qNPbs68Scaha+XM10tTZOe2A8=
=xlgg
-----END PGP SIGNATURE-----

--KEnw/+reIV1mgEnt--
