Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446B2E11BD;
	Fri, 13 Jun 2025 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824612; cv=none; b=NwF/nBtsrVrCz2JdypnK3kqGWpyxD72nW97hFzxTQ9SiHPvlN4ZLjbSacQexHH/6DF1cTBsrfzRY2T6PxxR18l1ldULyBjyOw9Rvw7c58tRhRRMqhlGTFN0GMOR57E/+qc7HwjOS6AflLIQ9iajkCiHloAwHMrekueupFtDivAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824612; c=relaxed/simple;
	bh=vxVIQ13yTdvjtGU/5yGrhhgARcgPO6VY5Sff0Jaw0AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXjnicKKe3hXjvtrXqz/Q1gmwDxcgD5TKOjRtlU9pbbliQlKMHfyYe2Ro3u56MI7qNUIje2ojtbjvAiyn5yV8gy2EWrsAVYRTTEKZjzgvOW8toy27161Gz6ehQoLIEOqKdhTlxBoDoHxmurXcAl68mbv5dMcmZcNL6Ne6HgqRoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juHLjt3n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juHLjt3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC32FC4CEE3;
	Fri, 13 Jun 2025 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824612;
	bh=vxVIQ13yTdvjtGU/5yGrhhgARcgPO6VY5Sff0Jaw0AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juHLjt3nRr8oondGj4pY5/C2UefEp94SEciT/Co+IndchJyEsxYd8pnyrrhc8Q8qz
	 0D/8YgFOdoG848c81CppPAXVZQ06Vkv6CMhj1fhwQDmqyhdBj76+ij+V8w8qS2RoSH
	 TjV4DlRnlbWKjLnAQqygDrAjbkqpVhzr3pQfwiiuASq/n8Xz1M3Zw7Zu/RQgQJlHve
	 65fyrM8OSUvjR/AC3SfiQPWEYqmff6AEK5lcUdCgF660Fn0Ljf/QIkwec+3j5rzMeY
	 vFRxEcSZZhTI27tX5N7e32pxrL4ccHMBq7Uj1rPUULDoE9BeYpRTLy/0Qzw//mxFeQ
	 m00VhbMb81E1g==
Date: Fri, 13 Jun 2025 15:23:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <20250613-paving-reimburse-fa5ed8c40c7f@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
 <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1vrTP4wZOtNtnkC0"
Content-Disposition: inline
In-Reply-To: <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>


--1vrTP4wZOtNtnkC0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 06:09:47AM +0800, Inochi Amaoto wrote:
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
> >=20
>=20
> This is is OK for me.
>=20
> > > +
> > > +  "phy@[0-9a-f]+$":
> > > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> >=20
> > Why are these permitting random addresses? Are they not at fixed
> > addreses given that you only support one platform (modulo the rebrand)?
> >=20
>=20
> IIRC, they are fixed address. I use random addresses as I see many one
> in binding do the same. Should I switch to the fixed one?

If things are actually possible to have at variable addresses, then sure
use pattern properties and a regex. It may be like that if a new device
is released that reuses the dmamux or phy but locates it differently or
on a platform with multiple phys etc. If not, then then just restrict the
address to the only permitted one.

--1vrTP4wZOtNtnkC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEw0XgAKCRB4tDGHoIJi
0mHVAP422bpYToyFRvNyvsMl7fHIbXsrtZOXXtSEguWI7y2XFwD+PpGmlMC+kvE5
QMlHPcjkFIyMBbeYtx/lKcoXkBMK5As=
=EHFn
-----END PGP SIGNATURE-----

--1vrTP4wZOtNtnkC0--
