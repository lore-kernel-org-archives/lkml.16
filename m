Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC5288DB;
	Mon, 26 May 2025 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748274875; cv=none; b=Lt+lkGRhPNC4Ga1egAHpcRnwbarg2jb7cOvTt2He0L/TqZVOCai9dEYGFUscOPk9TItkboq0/oGIIJFPTp6o0/wBI/ZPRdSuReTkbz/CLOv3mCx0y9GgwITFccoP2khePSo+NAjPk+r35NJshBiWFiwU7laJ9XflvlDVctx8MRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748274875; c=relaxed/simple;
	bh=Sb8w3t/dNkEK/ZuTtthI1LdL+b5SAvMEWX+Ac00LuF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3sBzqo7WDoxN8NoUmK3qgbfMadxOGRmVv1pMOWE+mQmnC5AN0wKlHiqSpeF9VdczXu5HCtmbl/wPQrB82i9RkrtVnisG2SS81xDwX8Hh4hWV8s0jGYxIv+IjV+4G1i1RfutmUzT/TzTrYaJaZtluvlRrniSO41eIJt/9x0WAL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=At0jz7Ww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="At0jz7Ww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8225C4CEE7;
	Mon, 26 May 2025 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748274874;
	bh=Sb8w3t/dNkEK/ZuTtthI1LdL+b5SAvMEWX+Ac00LuF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=At0jz7WwcMqnFvgZakL8A0pxWGIMlW2bydUYyahUxtpUkBFuVNgmKj1lm1XmX0J0D
	 PTZSrM6RfIMzuVoKpU0quaykIk4NoiXqrxLUjocGL+NEY1kacHh/a1wBQrXiGgMUYh
	 Motfld2ZVJoLi5r8R0PwVxq9af/4WrOVYFjIcADjb8BkT7nfheXoGRybGw31IvpESA
	 jVHcKwpVXzPMIITfMRoOLTBwhlQzJxQdO2TcaoiFUvNYN+d5bkyq9z8GaMuBTHOThd
	 S9+cok0e+v8vyFzz7TQ3/NT5L7V5Ti02tInZZG+kxzEWmDSeNV8eC+AMnsVKzOptNW
	 jAf7br8ko+YyQ==
Date: Mon, 26 May 2025 16:54:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: add vf610 reset controller
Message-ID: <20250526-unpaid-mushy-d47196d04ad1@spud>
References: <20250522213951.506019-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JFc4LU9IsIE1KMjo"
Content-Disposition: inline
In-Reply-To: <20250522213951.506019-1-Frank.Li@nxp.com>


--JFc4LU9IsIE1KMjo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 05:39:50PM -0400, Frank Li wrote:
> Add vf610 reset controller, which used to reboot system to fix below
> CHECK_DTB warnings:
>=20
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon=
']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-s=
rc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml=
 b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> new file mode 100644
> index 0000000000000..4c92a5e4892bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#

It's a reset controller then, shouldn't it be in /reset, not //soc?

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale vf610 System Reset Controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  The System Reset Controller (SRC) generates the resets for the device.=
 The
> +  functional reset sources are programmable as either reset or interrupt=
=2E The
> +  block also generates interrupts for various device events.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,vf610-src
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    reset@4006e000 {

The generic node name here is reset-controller

> +        compatible =3D "fsl,vf610-src", "syscon";
> +        reg =3D <0x4006e000 0x1000>;
> +        interrupts =3D <96 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> --=20
> 2.34.1
>=20

--JFc4LU9IsIE1KMjo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSOtgAKCRB4tDGHoIJi
0jUOAQDQoc27GSHxRP7tOOEB3eThzeGn0UPkwWG1x+2578wSVQD7BI2VzjCyhPki
GriXRs9WSYTq7+FHXwaz+D9bmZa05ws=
=WC08
-----END PGP SIGNATURE-----

--JFc4LU9IsIE1KMjo--
