Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D65B2E8E10;
	Tue, 17 Jun 2025 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177779; cv=none; b=MGTKFqX04NDLzRgxPKjle9jsLpthWtHRnqYmr0Q4wca8f9Wfqj2+5zKFBqaNJ9cioCy3gJ6K266vvhbwq3nNovJ6tfKz5kjFRZ1yBCU2s4ewAiRzyjAw7GvMtItYfmHPh9464bc89EzcIv9ARo5Nuu3LoYyPGReudRMu3WiJcJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177779; c=relaxed/simple;
	bh=rShkEFiN3B4/lnFN+KTqYUr+N+x16Xl6MwINsbfyY/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhUVWKXCm/qf3sNFDcmveRtlhlOzlGTUvJaQhS0ZNPvPTnJ74aN1nnvWXB//gdvCNk4aV54gNdpN3adl+WZesMJ8bY5vRgrVtAnaroOnCzxEQU9KDiFzlNdtBb/lZWWQz/ZR5DN7doINtSbwKdYL4hbtlBuLxuEbMWoLRjZq9JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pr1FiKOS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pr1FiKOS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABF6C4CEF0;
	Tue, 17 Jun 2025 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750177778;
	bh=rShkEFiN3B4/lnFN+KTqYUr+N+x16Xl6MwINsbfyY/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pr1FiKOSDtyZcoi1+CE6fklUnJXY2L6KqCsIJWxehcEJI7gk2wK/JOZvpSNq/DBu3
	 kF33Azyo3G7f///u4lOdj8T5M22Qtd2JzSTdJiP5voW0pYAsUiwxeOI/n7yZigcNON
	 f4B8vuv16p4Inr4SPdOFcUMYS7tRe6Ic6AGWYRKf0mdY9sxWIsKfeR4tpG1k/jXAxW
	 41uPG/KhIU9o1OTN947LwA1ehEERmOxUlCQD6vp2yBIbEs9HsKIfWbgQfTqNICyg4P
	 6ycyFzBZyJQUyZ7sOudYg6c7BTnv1gaHKmbPIjtivXJIUaeIr4CqOJGfdsJDQtb5II
	 8UuDjclv1csLw==
Date: Tue, 17 Jun 2025 17:29:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: airoha: Document support for
 AN7583 PCIe PHY
Message-ID: <20250617-thrower-syrup-05f1bdbee613@spud>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
 <20250606192208.26465-4-ansuelsmth@gmail.com>
 <20250609-shifty-dingbat-31aa70d7d7b1@spud>
 <68517436.050a0220.b9e1c.ed09@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5cZ2bQ10tXXgpc4h"
Content-Disposition: inline
In-Reply-To: <68517436.050a0220.b9e1c.ed09@mx.google.com>


--5cZ2bQ10tXXgpc4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 03:57:09PM +0200, Christian Marangi wrote:
> On Mon, Jun 09, 2025 at 05:51:10PM +0100, Conor Dooley wrote:
> > On Fri, Jun 06, 2025 at 09:22:04PM +0200, Christian Marangi wrote:
> > > Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> > > work. Add the rwquired register to configure the PCIe PHY and provide=
 an
> > > example for it.
> > >=20
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  .../bindings/phy/airoha,an7583-pcie-phy.yaml  | 72 +++++++++++++++++=
++
> > >  1 file changed, 72 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an75=
83-pcie-phy.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie=
-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.ya=
ml
> > > new file mode 100644
> > > index 000000000000..93252092c2e3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.ya=
ml
> > > @@ -0,0 +1,72 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Airoha AN7583 PCI-Express PHY
> > > +
> > > +maintainers:
> > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > +
> > > +description:
> > > +  The PCIe PHY supports physical layer functionality for PCIe Gen2/G=
en3 port.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: airoha,an7583-pcie-phy
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: PCIE G3 analog base address
> > > +      - description: PCIE G3 PMA base address
> > > +      - description: PCIE QPhy analog base address
> > > +      - description: PCIE QPhy PMA base address
> > > +      - description: PCIE QPhy diagnostic base address
> > > +      - description: PCIE detection time base address
> > > +      - description: PCIE Rx AEQ base address
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: g3-ana
> > > +      - const: g3-pma
> > > +      - const: qp-ana
> > > +      - const: qp-pma
> > > +      - const: qp-dig
> > > +      - const: xr-dtime
> > > +      - const: rx-aeq
> > > +
> > > +  "#phy-cells":
> > > +    const: 0
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> > > +  - "#phy-cells"
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/phy/phy.h>
> > > +
> > > +    soc {
> > > +        #address-cells =3D <2>;
> > > +        #size-cells =3D <2>;
> > > +
> > > +        phy@11e80000 {

Oh also, this address doesn't match the reg property below.

> > > +            compatible =3D "airoha,an7583-pcie-phy";
> > > +            #phy-cells =3D <0>;
> > > +            reg =3D <0x0 0x1fc7f000 0x0 0xfff>,
> > > +                  <0x0 0x1fc7e000 0x0 0xfff>,
> > > +                  <0x0 0x1fa5f000 0x0 0xff>,
> > > +                  <0x0 0x1fa5e000 0x0 0x8ff>,
> > > +                  <0x0 0x1fa5a000 0x0 0x3ff>,
> > > +                  <0x0 0x1fc30044 0x0 0x4>,
> > > +                  <0x0 0x1fc35030 0x0 0x4>;
> >=20
> > Can you explain please why you have so many reg regions, some of which
> > are directly beside one another? Why is one (or more) larger region(s)
> > not viable here? Are some of these coming from a syscon that is not
> > modelled or are there other devices sharing in between?
> >
>=20
> It's to keep consistency with the documentation and how stuff is
> modelled in the SDK driver. The single region defined reflect real
> register space. In the middle they are invalid register that might cause
> system stall if read/written.

Some of the regions are directly bordering one another, with gaps of
only one byte? e.g. The second region runs from 0x1fc7e000 to 0x1fc7effe
and the next region starts at 0x1fc7ef000. One invalid byte in the
range is not worth splitting it out for. Although, are you sure that
there is exactly invalid byte and you're not propagating a mistake from
the en7581 where 0xfff was used instead of 0x1000 as a misunderstanding
of how to the size field worked?

I would expect, at the very least, that the 0x1fc7xxxx and 0x1fc5xxxx bits
should be grouped. The two 4-byte regions seem pretty suspect and really
do look like some sort of syscon that you're trying to expose only one word
=66rom. Are you sure that there is nothing at addresses 0x1fc30040 and
0x1fc30048, for example? It seems odd to me to put single words at these
addresses (and likewise on the en7581) with nothing at all around them.
Do you have a regmap for this device, or are you mostly working
backwards from some sdk?

> Also this is to keep consistency with the en7581 pcie phy driver.

But your reg regions aren't even the same as with that phy?
It has:
      - description: PCIE analog base address
      - description: PCIE lane0 base address
      - description: PCIE lane1 base address
      - description: PCIE lane0 detection time base address
      - description: PCIE lane1 detection time base address
      - description: PCIE Rx AEQ base address

of which only 3 map 1:1 with yours?

>=20
> Is it really that bad ? :(
>=20
> > > +            reg-names =3D "g3-ana", "g3-pma",
> > > +                        "qp-ana", "qp-pma", "qp-dig",
> > > +                        "xr-dtime", "rx-aeq";
> > > +        };
> > > +    };
> > > --=20
> > > 2.48.1
> > >=20
>=20
>=20
>=20
> --=20
> 	Ansuel

--5cZ2bQ10tXXgpc4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFGX7gAKCRB4tDGHoIJi
0i/1AP4l7cuShLhNKB3HPj7a/bggHv2B1//wt8nzpEJMDvOjLgD8DMBnBbyIkiGu
mKY9KLVXFaIoaqSEszOXztcOZYKLPQY=
=4xkD
-----END PGP SIGNATURE-----

--5cZ2bQ10tXXgpc4h--
