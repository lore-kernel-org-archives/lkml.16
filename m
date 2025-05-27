Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1373C465;
	Tue, 27 May 2025 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360870; cv=none; b=DcOAg4qG4VSaeD3N5U0ugcu5p5ahqQAA4JlZrkZ9D05+L1GyqIch0uh+ZVTEGMQsqZ1x3oZsDCxPFlXcnl2aFWGN8tAefJzBaOP81XPBJEUP5zzQelxiem4VRyJ4VoLBw+26z7K5gczbYVYb6i/8+7e4dgvbP7VjBzcswCpx0uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360870; c=relaxed/simple;
	bh=SXB/W5YGNq6LI6cMa8qdCfbwi61BqnQv3hX2p2dEEaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOqjvFqM2kgEBrFtT7llLUz3Omy4nclXV3JXBzOxoN5xZEnH2ExRQukdEe7f6b/gudi6SMiC3QEyivEBlEUV91ZP+iNwER5uTDvJMy5M6EHBcDRiiN8DFbL9aIpC2BZ88/TIgygP2x6rFf3QB2pr/ZfvsWJ/FOIVvYoNMnSaLlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N89J5Ogf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N89J5Ogf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D95C4CEE9;
	Tue, 27 May 2025 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748360870;
	bh=SXB/W5YGNq6LI6cMa8qdCfbwi61BqnQv3hX2p2dEEaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N89J5Ogf61kkviEXYSEru1lFMfWmBaDCr3850ZewH/QlCOnLhZYGcUGMt7qY6ZDMT
	 oFO7wik1FJ9+YT9T4cpQi+aaWKc09PiA+40HXWsssxaZIcNoudic/3QkT5jajkcKnw
	 y5MbqK1W17jxGwOXApecyKtE09bVt8+fLIkoNXmnTss4aTkR571BJqP26vt0ZrfBOn
	 Lx76dbKMykRXZJd41txdC41Z4gDnQ8Mc0THiQzT7GjGKoCgbHQydmF+veyG1UHawE3
	 qrj79aiJuqknL1+mDF6ef/rELc33h3fefrsyvC1AsjDFYXz/+J0AeLkwRYoqezXGzo
	 7OBkjmnn9r1Lw==
Date: Tue, 27 May 2025 16:47:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: interrupt-controller: Add fsl,icoll.yaml
Message-ID: <20250527-ancient-monstrous-2b867b95524b@spud>
References: <20250523192016.563540-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NabpYVU0Es9zW1+Z"
Content-Disposition: inline
In-Reply-To: <20250523192016.563540-1-Frank.Li@nxp.com>


--NabpYVU0Es9zW1+Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 03:20:15PM -0400, Frank Li wrote:
> Add fsl,icoll.yaml for i.MX23 and i.MX28.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../interrupt-controller/fsl,icoll.yaml       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/fsl,icoll.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,i=
coll.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,icol=
l.yaml
> new file mode 100644
> index 0000000000000..7b09fd7d588f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,icoll.ya=
ml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/fsl,icoll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MXS icoll Interrupt controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx23-icoll
> +              - fsl,imx28-icoll
> +          - const: fsl,icoll

Given this generic fallback, that would likely not be approved if this
were actually what it is presented as (a binding for some new device),
is only acceptable because it is already in use and this is some 15 year
old device, you should state pretty clearly in your commit message.
With it pointed out,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@80000000 {
> +        compatible =3D "fsl,imx28-icoll", "fsl,icoll";
> +        reg =3D <0x80000000 0x2000>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <1>;
> +    };
> +
> --=20
> 2.34.1
>=20

--NabpYVU0Es9zW1+Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDXeogAKCRB4tDGHoIJi
0hOBAPkBv8JYkIsYT13rVU0cUw9lky7j2QGQn086JoDm4uo3aAD9FFXCMfefltTB
ZwSKCZ6t5+SXVbpCLff58xih4e+JUg4=
=9mIs
-----END PGP SIGNATURE-----

--NabpYVU0Es9zW1+Z--
