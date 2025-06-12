Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DD62F4317;
	Thu, 12 Jun 2025 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744462; cv=none; b=jRlo1Oj3aRMOApcFGzpuxv00s47H029jm9XIIJabHFfWuuINsKFON6+J902Z4ob0oAsNJTfmWvcYTznP0J+MZ+Nn9Hj3LriQzkIAfpV4Ndvpf5BZr7cRk+5feuOBP+pV9F0M6VaNwGmpwkqgNzPt4MjZMJ0eSwWt2HtXkEhNYpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744462; c=relaxed/simple;
	bh=U2fEccG9fwLvIRudQJWjcfVnqPecNc7cIYAnmbd9khA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmzaQMhVc1HIQlsRQ2zg9IndE4zpG6XHGlTrwFx/NzqMp9Sb/+OjSuiTuGtB/ZzjYyry0LuxtbzXNgzzEAJauD70CsQ7eAR2wzpk/PkJrNGcowuu9ZmYfZgQMZWmHDsS2gjZxBL9gXsOnvHTBSByVqSEg5CtB3Tle6yJoKsT/x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEh3gMA+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEh3gMA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC20C4CEEA;
	Thu, 12 Jun 2025 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749744462;
	bh=U2fEccG9fwLvIRudQJWjcfVnqPecNc7cIYAnmbd9khA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEh3gMA+uqltfgyJQaJ90yWpKwGTygJsPr0O9fMOzml4JNjs87T06CgqshJcmeK2a
	 cR4rjIe2FUgOnMr7zcc4JULd1LTSgJdCmkTLzK0X8MhEy54PZZcTcO/W77Snrv9TAF
	 9jjbS3IrliMLjb1gBPawNk57SFosgtvTcfV/pUX81mHnson4FtH3k/D3anOyqOQTdI
	 tPOt1qpl894jqeGcBNZWQzyR0Zf/3LOnh26KTMCIGHm1+ymHK31BrfWy97HNfprnb1
	 PvYzNT8C0/5IDjb8GOKphXcGP+c4OHWz65CuE33bnZpsPCqmXSH6JZX0H2PEqk92Pk
	 NT4uu25RTCEwg==
Date: Thu, 12 Jun 2025 17:07:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <20250612-siesta-verbalize-6a7768ebc648@spud>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TJu6QFbeFePgDQPv"
Content-Disposition: inline
In-Reply-To: <20250611081804.1196397-2-inochiama@gmail.com>


--TJu6QFbeFePgDQPv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> "VBUS_DET" to get the right operation mode. If this pin is not
> connected, it only supports setting the mode manually.
>=20
> Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

I'm having a bit of trouble finding the v3 etc, could you provide a
link?
I think what is here is sane, but I want to make sure that review
comments on previous versions have been addressed. "dfn:" searches for
both driver and binding filenames turned up nothing.

> ---
>  .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-=
usb2-phy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-ph=
y.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
> new file mode 100644
> index 000000000000..2ff8f85d0282
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV18XX/SG200X USB 2.0 PHY
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-usb2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: PHY app clock
> +      - description: PHY stb clock
> +      - description: PHY lpm clock
> +
> +  clock-names:
> +    items:
> +      - const: app
> +      - const: stb
> +      - const: lpm
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@48 {
> +      compatible =3D "sophgo,cv1800b-usb2-phy";
> +      reg =3D <0x48 0x4>;
> +      #phy-cells =3D <0>;
> +      clocks =3D <&clk 93>, <&clk 94>, <&clk 95>;
> +      clock-names =3D "app", "stb", "lpm";
> +      resets =3D <&rst 58>;
> +    };
> --=20
> 2.49.0
>=20

--TJu6QFbeFePgDQPv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr7SQAKCRB4tDGHoIJi
0pktAP9VMMOkhXJg21RuCXXueBhHqnv5XmapThudPFOJGbmUdAEAvW5JBZ8R4b+W
fK8JZ5b3IEgK+NyZ4wGFRnCQlzB1Pg0=
=wnik
-----END PGP SIGNATURE-----

--TJu6QFbeFePgDQPv--
