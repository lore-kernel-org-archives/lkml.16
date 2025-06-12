Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7B5298CDD;
	Thu, 12 Jun 2025 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744293; cv=none; b=brZcyoa1VUnRHI3lbV5LUJoOxjrZ0tyyrJ1hBkO42x54wR5Y0SU2QSGgCyDWSyKYl4ePmxTT003pj4hIWwkxYdtrWmMDPchIc4a0Gj8XhJnfT4Tf+c8bfCmgXuhhoHxK0aq+ppycIUVXC14JtXAACSimW07ZLypoOJfp97iXhOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744293; c=relaxed/simple;
	bh=COIWAD9Jakpzo0yFDTumEeGqKLB4OHO2BnSyyumsKRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLm5ZnQI2fiU6r0SycUnIxal1Abl43ds9TFQWaGmltGUb1T3XQYkwJ3sL4e8Wngce4qWI29Prp1f3TDk+IPwDqqF1XNFYA4ujsg/5omp/k+W66WAD6XHmqA3cgOd/aDjv+pJRrydZXkRJvrNEos2nOiPn/DgxoZbSn7j32iNhiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFNDjx0X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFNDjx0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD165C4CEEA;
	Thu, 12 Jun 2025 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749744292;
	bh=COIWAD9Jakpzo0yFDTumEeGqKLB4OHO2BnSyyumsKRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFNDjx0X0nL62Q4iwIJDDPvVYY1lg8EPQ7a55Rg1ntWkbImh+4q9SBxg5s+21koyD
	 +xxlh7EfQXwsnxFgaPV6RIMDVndj3aXe2G3jyGdLmz9me6HQeyenSPnQaZGk/U3Z/d
	 fQk0vL+mB+pVIPnJoxv/iGsoMnotOT2DZPz1ENaGKpqJvZmUrUMRD7cuucMI0Zn9LE
	 LFfV3VdV9OUNgthpGqjQaKCYMgvr5GebfwYH6SQnf20ATPuzVUihOg6NfFkJUd3IZ7
	 IQlKojesNrBwsYPMgXkX0LfnFJbzG2pmvb5SxyvogRVivvwYQQrE1gdreM5QpUqBGJ
	 RL72qJ18+weJg==
Date: Thu, 12 Jun 2025 17:04:46 +0100
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
Message-ID: <20250612-culpable-roman-295df1360198@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vDGa67YNy/FrbwY3"
Content-Disposition: inline
In-Reply-To: <20250611082452.1218817-2-inochiama@gmail.com>


--vDGa67YNy/FrbwY3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> access to configure related modules. It includes a usb2 phy and a dma
> multiplexer.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,c=
v1800b-top-syscon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-=
top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv180=
0b-top-syscon.yaml
> new file mode 100644
> index 000000000000..e8093a558c4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-sys=
con.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV18XX/SG200X SoC top system controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +description:
> +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> +  register access to configure related modules.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: sophgo,cv1800b-top-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "dma-router@[0-9a-f]+$":
> +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#

I think you're supposed to add "unevaluatedProperties: false" to each of
these nodes.

> +
> +  "phy@[0-9a-f]+$":
> +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#

Why are these permitting random addresses? Are they not at fixed
addreses given that you only support one platform (modulo the rebrand)?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@3000000 {
> +      compatible =3D "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> +      reg =3D <0x03000000 0x1000>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <1>;
> +    };
> +
> +...
> --=20
> 2.49.0
>=20

--vDGa67YNy/FrbwY3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr6ngAKCRB4tDGHoIJi
0l2QAPwNaWEYplXDLHYU0BTmmeZDi2+B04/jYyy1li16HuxyqQEA/PaboP5bnjt0
CzDx5GBKh23TZLwdXLtMNxFSH3ZKTws=
=Bne3
-----END PGP SIGNATURE-----

--vDGa67YNy/FrbwY3--
