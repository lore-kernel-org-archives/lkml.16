Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075211B040D;
	Fri,  6 Jun 2025 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226130; cv=none; b=pm0RnuPQkXmA5T0UnH2SBh7YvfbqNe4cOQF3CUsfN3aVR0F/mtoGV0o3r+cDn38qRqmdStdF9xznrYwsKomC+0nLCX6brDVI1u77Pj87dofwcSW3J2gV23TCI6FuYzB2zo3dyTX0Y0WhwBgq4KxM/QAqE9CTLN8tANab5mKWn9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226130; c=relaxed/simple;
	bh=m2TJ06NSfnjbzVgJp7+Aa4QRI/goAHsiXLyozAXhKBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHeW7jUV0Sbl8CB16bNMmVQDTLiPcGEhadPi5he0sriMhaB58EPuib8xoSJxvtV+ZD3ta2J/w+7zljg9E2xm4IrTR43RGfCM4orzwDyZWWhTk++RcjcLNo7fB1hE+GvpWmUNhlOAeA7dnuTleWSadvmzfhLj5jaAbmdmhVyBg9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AF+/+ynG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AF+/+ynG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CF1C4CEEB;
	Fri,  6 Jun 2025 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749226129;
	bh=m2TJ06NSfnjbzVgJp7+Aa4QRI/goAHsiXLyozAXhKBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AF+/+ynGBC9CqRuCphqPdWg19oKQBNefs5Uo86usrjuiyCzqXTz3arq/QRBB2kE++
	 WBYvqNa7gNTEV/V0/yaRnCRPEvR/T2etKdB1i7c6cdn3/OLhGg4/x+8NXs/Twzk5ID
	 5sidnesVZvfKDRX5IaC1qbNkEeLXxgJ8Ra40cCWABoVBFMUJEl5GME7FLU36gpRaaf
	 hLQScvfH7On4uCXpvL98u8/TyVLM8jvaqK0/WtemhWMzGZ+xlvH/LSvj7pQv64QrR+
	 2IZ1njtV5REZXtoj6KOUOcAh2Lirj9gyQRkJOxdrDNHCAaSH+UUJq+xn2MIXBWlOVK
	 nUabw3G++wPVQ==
Date: Fri, 6 Jun 2025 17:08:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250606-sliver-freeing-d01268258c25@spud>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6hQ4mkac1n7o3C5/"
Content-Disposition: inline
In-Reply-To: <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>


--6hQ4mkac1n7o3C5/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025 at 03:21:02PM +0200, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.
>=20
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 68 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/=
Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e7fae394ad8fd4143eb1fffb9=
591a30a2d6cc6ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices I3C Controller
> +
> +description: |
> +  The ADI I3C controller implements a subset of the I3C-basic specificat=
ion to
> +  interface I3C and I2C peripherals [1].
> +
> +  [1] https://analogdevicesinc.github.io/hdl/library/i3c_controller
> +
> +maintainers:
> +  - Jorge Marques <jorge.marques@analog.com>
> +
> +properties:
> +  compatible:
> +    const: adi,i3c-master

Seeing this with no versioning info is pretty suspect.
The adi spi, pwm, axi-dmac etc all have versioning info, please try to
emulate that.

Otherwise, I think this is okay.

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: The AXI interconnect clock.
> +      - description: The I3C controller clock.
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: i3c
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c@44a00000 {
> +        compatible =3D "adi,i3c-master";
> +        reg =3D <0x44a00000 0x1000>;
> +        interrupts =3D <0 56 4>;
> +        clocks =3D <&clkc 15>, <&clkc 15>;
> +        clock-names =3D "axi", "i3c";
> +        #address-cells =3D <3>;
> +        #size-cells =3D <0>;
> +
> +        /* I3C and I2C devices */
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..6f56e17dcecf902c6812827c1=
ec3e067c65e9894 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11243,6 +11243,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
>  F:	drivers/i3c/master/ast2600-i3c-master.c
> =20
> +I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
> +M:	Jorge Marques <jorge.marques@analog.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> +
>  I3C DRIVER FOR CADENCE I3C MASTER IP
>  M:	Przemys=C5=82aw Gaj <pgaj@cadence.com>
>  S:	Maintained
>=20
> --=20
> 2.43.0
>=20

--6hQ4mkac1n7o3C5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEMSjQAKCRB4tDGHoIJi
0rbTAP4spTJrUASLewamc2NSPCBtIjPY8qbsTcW2CmsKLmo9OwEAlhaoy3iBc6BX
xk8rWner/IjjAMNN64diVOneBUcjbgE=
=gjg3
-----END PGP SIGNATURE-----

--6hQ4mkac1n7o3C5/--
