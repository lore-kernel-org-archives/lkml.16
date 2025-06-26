Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B2619E968;
	Thu, 26 Jun 2025 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954663; cv=none; b=rV1E5pOkrEvHzZ/3YdZfnb0UW9FRSaGovoisqOxIAnSC1uXH/SWDEGBlK6yNYf989HR6zncqfqqYLFH7U3TEijxgcyAm0tZlY2Br2hu3tEVDmyLUeV8KG57MVgxvzrnxNI2prieUp58gSyvOrlGQGp+zcppf8NKstQ6dltRXdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954663; c=relaxed/simple;
	bh=FcMAs4cr6VLQ5THiQAsVxnlsWy5vYErs3oBHPmAG8rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5lRKgkAF8omBiSUuOd7M0TzZFy2bv9YnTSdXOjVEoKUySQVXwwlEcgMbXOG78dASVX6bciWoqyQG88sctZ5en4rCsO6hoDTcRphgghcPBUL9RNRTBsMTHElCWADisFrm3ICOla25iSvsb8cNkb0sT5PW0w/ykuqCsuHRFyfFSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIwKM+p0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIwKM+p0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB5FC4CEEB;
	Thu, 26 Jun 2025 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750954661;
	bh=FcMAs4cr6VLQ5THiQAsVxnlsWy5vYErs3oBHPmAG8rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIwKM+p0PZQE8g8sIkRqSQ4pFAucadt2eHG9gKidUiUnYTNHh6SK8ua2r3gDc5lvO
	 FJ19t8rEjqbwq8j48SKX05rsC/DZ6QSNa46wMSnxJiiCMDgATUAkLBqHCAWB/ifFNX
	 A0fLpNl+YCMvPaeguUnKtSGYRX79Z8i4/dbgSWHjkTftrm+pOtjJ2dViSRqZ2z3ZIL
	 R6SZtShOUvmWS7bl140VQYeCs3EQVDcx3KLdTG94gXgpfVIaavjhLR5Y004OZgaBNA
	 Lt6c8xS6LoAUHtByo5WYe1zVDi1+hg/wAy8KqpJPbazJTRr4woZ/rRrkHWBVfxOYOV
	 aWwmh46j697Cw==
Date: Thu, 26 Jun 2025 17:17:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20250626-glandular-founder-2f44973683e5@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
 <20250625195858.GA2115486-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iC7+lZmyKlilUlMQ"
Content-Disposition: inline
In-Reply-To: <20250625195858.GA2115486-robh@kernel.org>


--iC7+lZmyKlilUlMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 02:58:58PM -0500, Rob Herring wrote:
> On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> > On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > > The Sophgo CV1800/SG2000 SoC top misc system controller provides regi=
ster
> > > access to configure related modules. It includes a usb2 phy and a dma
> > > multiplexer.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++=
++
> > >  1 file changed, 57 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/soph=
go,cv1800b-top-syscon.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv18=
00b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,c=
v1800b-top-syscon.yaml
> > > new file mode 100644
> > > index 000000000000..e8093a558c4e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top=
-syscon.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-sys=
con.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sophgo CV18XX/SG200X SoC top system controller
> > > +
> > > +maintainers:
> > > +  - Inochi Amaoto <inochiama@outlook.com>
> > > +
> > > +description:
> > > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > > +  register access to configure related modules.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: sophgo,cv1800b-top-syscon
> > > +          - const: syscon
> > > +          - const: simple-mfd
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 1
> > > +
> > > +patternProperties:
> > > +  "dma-router@[0-9a-f]+$":
> > > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> >=20
> > I think you're supposed to add "unevaluatedProperties: false" to each of
> > these nodes.
>=20
> Not necessary if the referenced schema has=20
> unevaluatedProperties/additionalProperties set to false. The tools check=
=20
> for this.

Oh cool, that's good to know, thanks.

--iC7+lZmyKlilUlMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaF1yoAAKCRB4tDGHoIJi
0psEAQCiyo1+b9AvMe/EpRaJklfQNqQpCR9Mv1sARmJoDpdRKwD+Me8ov5JrZ4p0
Q47E/uNqXiO6fziM3poa8aA91Wj/8w8=
=/sgH
-----END PGP SIGNATURE-----

--iC7+lZmyKlilUlMQ--
