Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3074F18A6AE;
	Tue, 27 May 2025 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748361029; cv=none; b=liEXKlrEW3hiEiF8tnLeUT+pdmR9sddvm9+L2+oaKMWOr0+S0pU9psFIall27kZfAxrplxeS/UyrnmJRfc8yZokt1RDXN04X6Jtshs1doKDwB2zDiIN5MKGo3B6cKJ3bSBv1Nvp3N1ktK1mwh/KVm0YpnFLVHyKXcEb1g545PCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748361029; c=relaxed/simple;
	bh=DTawVXuGIStToPmMPbM4GIwtFCSgGRsiVFrlYK7qASY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQYf035+Jy4h2jokNZkhaA5c72f0rDFgSx5U7Ubbluw2bM7q/IUvyUR7JB7CkeTVhegyWwI6MtSi9YfToC7ZdMT8YBCRr8Qy3SAQZT5Aaw9O9LimmzrVw29/9WQzFjqAr+hNUTN0F3M+SGAezdzcqFmfR7UkJoKxD9ZYbWkUS7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9hSKi1s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9hSKi1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D94C4CEE9;
	Tue, 27 May 2025 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748361028;
	bh=DTawVXuGIStToPmMPbM4GIwtFCSgGRsiVFrlYK7qASY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9hSKi1shD+l4DCmMfv8Ijq/+2UomjDsRmMYD4ezDFulXkcF1CfTrpSguob0Lb/5K
	 kMkSVDrPseLI3zibGRYWx/cjfKCm4SP+5D9Ao/2UQzXIOB/sPNroXvQ96t63snJihA
	 ThyAam45KCNGsIruZ8+uxCEoNMAmjX4qCHZFpS+cD9Z0UwJogw4ZNxNyfPfgz9XOo7
	 h93sjZuViM8QrM41N4YKxZMJF9GezM5ycx/1XITHER7G7bbmF6fsI5lRXqKr14jvsw
	 SZpPFQqCPseeDJ/XvS8EtQRnt+dDN0VGx2IcdtNUL+DQ9CooKmAdNxa1XIojpXe3Ox
	 B0QNrTb37iNvQ==
Date: Tue, 27 May 2025 16:50:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: timer: Add fsl,timrot.yaml
Message-ID: <20250527-shawl-stencil-8987d27dd658@spud>
References: <20250523191928.563368-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WAHoCtr1g0GQMFYU"
Content-Disposition: inline
In-Reply-To: <20250523191928.563368-1-Frank.Li@nxp.com>


--WAHoCtr1g0GQMFYU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 03:19:28PM -0400, Frank Li wrote:
> Add fsl,timrot.yaml for i.MX23/i.MX28 timer.

Same here as the icoll.

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/timer/fsl,timrot.yaml | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/fsl,timrot.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/timer/fsl,timrot.yaml b/Do=
cumentation/devicetree/bindings/timer/fsl,timrot.yaml
> new file mode 100644
> index 0000000000000..3c9aacc356a57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/fsl,timrot.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/fsl,timrot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MXS Timer
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx23-timrot
> +          - fsl,imx28-timrot
> +      - const: fsl,timrot
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 4

You should mention what the items are I think in an items list, even if
that's just timer 0 through 3.

> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer: timer@80068000 {
> +        compatible =3D "fsl,imx28-timrot", "fsl,timrot";
> +        reg =3D <0x80068000 0x2000>;
> +        interrupts =3D <48>, <49>, <50>, <51>;
> +        clocks =3D <&clks 26>;
> +    };
> +
> --=20
> 2.34.1
>=20

--WAHoCtr1g0GQMFYU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDXfQAAKCRB4tDGHoIJi
0ghCAPwKEj3eE/KVOWlCmqiVlAuF+lEXbPXaeHo+dI+WEVoCfQEAkYk5dJiHJsao
NTicNhOOLpnx6Om7S8dgVHJzwaVxXgs=
=orA+
-----END PGP SIGNATURE-----

--WAHoCtr1g0GQMFYU--
