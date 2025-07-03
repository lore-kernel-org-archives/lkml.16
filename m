Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6D72045B6;
	Thu,  3 Jul 2025 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558000; cv=none; b=ulKZcEpM88zM8u+0s0yOmt2gBYJu/gMDPzK0imNYJvOhXlzSbZ20EDthExAnF6+zr2beLhT2eS+09U+TWTtM3/ggUoYVwLIw4yxM8FuW9gV2Pge2wmPm1IZbQFgXxGmo7SB21o9eV3SIjelDVMsVG94XFUDPHa04oBWfaGK4jwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558000; c=relaxed/simple;
	bh=7ZkAS2JYYvW6DUgBJBC+3Y0euDXDj7tfAQya4dZqio8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNk5deMdtU1ReHY0Axbo4nsyNK/yZYvAIGIB2uSzuC5cfD8QGOIMcof+UeuP3OHlkEeYsSVJUFXcOrahISVcU6VMiOPPni8saS0WltdUPYQlgrL1JtpiZsE3zWnopsaTGYfrbv09LEbQcIvO1MbZvp81wuwtqUbRoMHOxblNCKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNDYiHSf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNDYiHSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC50C4CEE3;
	Thu,  3 Jul 2025 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558000;
	bh=7ZkAS2JYYvW6DUgBJBC+3Y0euDXDj7tfAQya4dZqio8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNDYiHSf1wMeVVTUajE5QTDHdUB7IW/EJuZPrAme8a4JTtcH4J7V1Wza0M1XQdimL
	 esOhAP3nVDwCF9cgDXJ3XLDz/ooPorxqplUaYwjWY7D08fyh+XrB+LU6Td32YWu64u
	 fi3e6qn+v5txVbRUI9GndtiT+6uB6MEht1gTHSTvk/SBHxi0eBW3KwRW/sIBuQJ11z
	 Mo0SWecwMP2ZSvSvOT6NTg8yMOKZHXUwz4lrtVg6uM6OtvEZ+MZnVrB9R3lqI3PFcj
	 LWTIaoI1iKr1nqR4XA9hUCsOwwvcDfHDXJTrja4jONkIzd9mif0/sloypMm+rXm4Pg
	 hV865px6dJrxA==
Date: Thu, 3 Jul 2025 16:53:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ben Zong-You Xie <ben717@andestech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tim609@andestech.com
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <20250703-exposable-exes-fd41e7318fba@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
 <20250609-donut-oozy-4dcc8b8a292d@spud>
 <20250609-twiddling-clamp-eaa0dd2b1cad@spud>
 <aEmrHPd7RxUSOLAY@atctrx.andestech.com>
 <20250611-tapeless-arson-a6ace3c42c00@spud>
 <352681c3-88ca-4122-9ad3-0a0ef33caf7b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eJ54DOEKjtpZVjGl"
Content-Disposition: inline
In-Reply-To: <352681c3-88ca-4122-9ad3-0a0ef33caf7b@app.fastmail.com>


--eJ54DOEKjtpZVjGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03, 2025 at 05:32:08PM +0200, Arnd Bergmann wrote:
> On Wed, Jun 11, 2025, at 18:21, Conor Dooley wrote:
> > On Thu, Jun 12, 2025 at 12:13:16AM +0800, Ben Zong-You Xie wrote:
> >> On Mon, Jun 09, 2025 at 05:17:50PM +0100, Conor Dooley wrote:
> >> > > > >=20
> >> > > > > Ball is in your court now, after rc1 make a tree and get it in
> >> > > > > linux-next, and then send a pr to soc@kernel.org with this new=
 content.
> >> > > > > Perhaps the defconfig should go separately, I can take that on=
e if you
> >> > > > > want.
> >
> >> > > > Thanks for your guidance on these patches. I will send a PR to
> >> > > > soc@kernel.org as you suggested.
> >> > > >=20
> >> > > > For the defconfig patch, I'm happy for you to handle it. Just le=
t me
> >> > > > know if there's anything specific you'd like me to include.
> >> > >=20
> >> > > Okay, I picked it up on the basis that you'll send this all to Arn=
d for
> >> > > 6.17
> >> >=20
> >> > Sorry, I think that was really poorly worded. I picked it up on the
> >> > basis that you're going to send the other patches in the series to A=
rnd
> >> > for 6.17.
> >>=20
> >> According to the SoC maintainer documentation [1], I should send a
> >> patchset (not a PR) to soc@kernel.org. Since I'm not a submaintainer y=
et.
> >> I think I should not sent a PR to the main SoC maintainer. Is that rig=
ht?
> >
> > I think you can send a PR and not worry about it.
> >
> >> Further, I have two questions about sending a patchset:  =20
> >> 1. Should I send v5 or start a new patchset?
> >> 2. Should I continue excluding the defconfig patch, as we discussed
> >>    previously? I think it should be included now.
> >
> > Arnd, you okay with a defconfig in the same branch as the dts/core
> > bindings for a new platform? I'll happily drop it from by branch if it
> > can all go as one.
>=20
> Sorry I missed your question earlier, I finally got to it now as
> I am going through the pull requests in patchwork.

Yeah, I've been kinda out of it lately. Ordinarily I'd have pinged you
on IRC or something, but instead this thread has just been sitting in my
devicetree mail folder.

> Having the defconfig, MAINTAINERS and Kconfig updates in the branch
> for a new platform is fine, in this case it makes sense to keep
> everything together.

Okay, I have dropped it from my config branch.

> I'm also planning to have multiple new SoC targets in 6.17 and
> would put them into a separate branch that does not contain the
> dts changes for the existing SoCs.
>=20
> For the pull request that Ben sent, there were a couple of
> mistakes, I'll reply on that separately. It probably would made
> more sense to send the patches to soc@lists.linux.dev (note
> that the soc@kernel.org address got renamed but they still
> both work) than to send a pull request this time.

Is that a general comment btw? If there are other people coming in with
new platforms should I ask them to send patches to soc@lists.linux.dev
instead of a PR for their first time?


--eJ54DOEKjtpZVjGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGanagAKCRB4tDGHoIJi
0oxtAQC/emJTagK2s7eNu+LaXiETKXUzE658RJtlELVw2G2+PwEAwr21eS7DTVdk
KKKtwTjYS7KRgTPG96/98VaVPrPglAA=
=hY2F
-----END PGP SIGNATURE-----

--eJ54DOEKjtpZVjGl--
