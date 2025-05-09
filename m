Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F562235354;
	Fri,  9 May 2025 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806245; cv=none; b=XDkWsVLBlVR5RKA15mZC1QmIFVbNfeepif07Co3AnasX5iCobS7vlW6kICvqwPhSkwbh4GCb712DmjM19qpDnBXP4f1dBLdGkw3OYLgvSsctObyigiQ74xPE3TIz8oDBeYdcT7mAKul9qmmQtvUEYmq9r/fKiOTYOil50HcA6/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806245; c=relaxed/simple;
	bh=irAiBJ4YJtMSN3/kNYx23255IfNemC062kdIkHNceA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE5hg5QZ+9IVdFiQBbnsYqfTwdJXWBzUBB2ixhp7m4UsKbCTE6DhHnWOuLXI/k7lABBH58nMruWgVvN8oADRU9W+sgyV+OgHAquwlMBFaFsd/vxrGBWmSZFzrMPlnczfxfNx9h58iycdWYmEhD6y1ppjNpzFEQ1ARH2KkSzM6Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrcOu981; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrcOu981"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72ABC4CEE4;
	Fri,  9 May 2025 15:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746806245;
	bh=irAiBJ4YJtMSN3/kNYx23255IfNemC062kdIkHNceA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrcOu981Eb/JXWzNyJzuWf+rXY5JofO8oM07PIfEvNclk54RAnBV7ydFojLR9fhiS
	 EErehOIrszMyu+nHhIMkdj4y+ioLuye3amVISPqasL0N5sIePwU4CcUlNaB5XPrYTl
	 fm+lC3ZR/Ue5e6liQz7mOwtBCQATbQ0OGLQqC9IuBUsL9Kq2vkvgYyApfA7/esOx3W
	 yAMSAPkFjl4UV+8SmyDjkM30VfARhfGat65dxHb0eAua+eaWMEXkvo5VYighC7f22t
	 UQsQMa5XM9pAFDOhi5leKbM0aavrjtZneyCu/CLq7xMSHcT4z3003GSLwuJviL+iI3
	 1+dkcNuznBH8w==
Date: Fri, 9 May 2025 16:57:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Hu <nick.hu@sifive.com>, Cyan Yang <cyan.yang@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management
 controllers
Message-ID: <20250509-subtract-caramel-08d47ed3281c@spud>
References: <20250509021605.26764-1-nick.hu@sifive.com>
 <20250509-small-graceful-limpet-d0ea41@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YcA62LszQ5ASIZ/7"
Content-Disposition: inline
In-Reply-To: <20250509-small-graceful-limpet-d0ea41@kuoka>


--YcA62LszQ5ASIZ/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 08:40:28AM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 09, 2025 at 10:16:04AM GMT, Nick Hu wrote:
> > SiFive Domain Management controller includes the following components
> > - SiFive Tile Management Controller
> > - SiFive Cluster Management Controller
> > - SiFive Core Complex Management Controller
> >=20
> > These controllers control the clock and power domain of the
> > corresponding domain.
> >=20
> > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> >  .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++++
>=20
> Where is a patch with the driver (user of the binding)?
>=20
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.=
yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/=
Documentation/devicetree/bindings/power/sifive,tmc.yaml
> > new file mode 100644
> > index 000000000000..7ed4f290b94b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiFive Domain Management Controller
> > +
> > +maintainers:
> > +  - Cyan Yang <cyan.yang@sifive.com>
> > +  - Nick Hu <nick.hu@sifive.com>
> > +  - Samuel Holland <samuel.holland@sifive.com>
> > +
> > +description: |
> > +  This is the device tree binding for the following SiFive Domain Mana=
gement Controllers.
>=20
> Explain the hardware, not that "binding is a binding for ...".
>=20
> Also, wrap according to Linux coding style.
>=20
>=20
> > +  - Tile Management Controller
> > +      - TMC0
> > +      - TMC1
> > +      - TMC2
> > +      - TMC3
> > +  - Subsystem Management Controller
> > +      - SMC0
> > +      - SMC1
> > +      - SMC2
> > +      - SMC3
> > +  - Cluster Management Controller
> > +      - CMC2
> > +      - CMC3
> > +  SiFive Domain Management Controllers support the SiFive Quiet Interf=
ace
> > +  Protocol (SQIP) starting from the Version 1. The control method is
> > +  different from the Version 0, making them incompatible.
> > +
> > +allOf:
> > +  - $ref: power-domain.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - {}
> > +          - pattern: "^sifive,[ts]mc0$"
> > +      - items:
> > +          - {}
> > +          - pattern: "^sifive,[ts]mc3$"
> > +          - pattern: "^sifive,[ts]mc2$"
> > +          - pattern: "^sifive,[ts]mc1$"
> > +      - items:
> > +          - {}
> > +          - pattern: "^sifive,[ts]mc2$"
> > +          - pattern: "^sifive,[ts]mc1$"
> > +      - items:
> > +          - {}
> > +          - pattern: "^sifive,[ts]mc1$"
> > +      - items:
> > +          - {}
> > +          - const: sifive,cmc3
> > +          - const: sifive,cmc2
> > +      - items:
> > +          - {}
> > +          - const: sifive,cmc2
>=20
> All of this is just unexpected. Why any compatible should come with
> these?

It's also not quite correct either, right? Or may not be correct at
least. It permits "xxx", "tmc2", "smc1" and "xxx", "smc2", "tmc1"
which mean that the smc and tmc must be identical in terms of
programming model.

> You need to use SoC specific compatibles.

I think there's some slack to provide here, sifive are upstreaming it in
advance of there being customers (or customers ready to upstream) and this
format allows us to accept bindings/drivers and the customer will have
to add a soc-specific compatible in order to actually use these in a
dts. I think it's better to accept something along these lines than
stall out until a customer decides to upstream their user. That said, I
would expect this to come (as you mentioned above) with the driver.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  sifive,feature-level:
> > +    description: |
> > +      Supported power features. This property is absent if the full se=
t of features
> > +      is supported
>=20
> Compatible defines this. Drop.
>=20
>=20
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    enum: ["nopg", "ceasepg", "runonlypg"]
> > +
> > +  "#power-domain-cells":
> > +    const: 0
> > +
> > +if:
> > +  not:
> > +    properties:
> > +      compatible:
> > +        contains:
> > +          pattern: "^sifive,[tsc]mc3$"
> > +then:
> > +  properties:
> > +    sifive,feature-level: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
>=20
> Missing example.

You can't actually make an example that passes validation when the
soc-specific compatibles are not added, so this would require adding
some.

--YcA62LszQ5ASIZ/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaB4l4AAKCRB4tDGHoIJi
0u/WAQDc8Go2RA4WT2oOaA7PTcJU45RCSHFNuTC+pBcuZzUMKQD/Z+mLnHBPJzDI
IByAjSLLyqcA/arq1lsOjTdZr80OvAY=
=uK2r
-----END PGP SIGNATURE-----

--YcA62LszQ5ASIZ/7--
