Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E07E9;
	Mon,  9 Jun 2025 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484869; cv=none; b=pcfZb0/9ovh0QJnCJtksolv9+jwcDoU+Y77ryrrNRNjPIlm7mMRgFfo95u0hV853aNWbrY06XMD/Vg9PR+C1gf2VHIN8a7xQ5fhLrlx7AzbZp8u/a1K/qVprQRoRvcAM64M4eWbIwKX6sycALf6PlMM7H2gJPwnNnYyEGGkkpjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484869; c=relaxed/simple;
	bh=4UANBXEFzzWNDjzkZyhCusk/3Ln3IBad0owyMaZA9s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0nOtuqdoOHuw7u26W5ztbzVtnVKach459pWwZYprHhWNLQWI0tU3n2usjQbKJrvQA0rnFNIJ/RoDYQkmk+W8/ER9wzIAgOIhyiU9OqVru/3uxnOxZOVhawvvLvH/CFopEiQjiOYiP/HPlXOgCJV+NpWl363wIlqPQ+vrLJg9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwLoh8ju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwLoh8ju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215E7C4CEEF;
	Mon,  9 Jun 2025 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749484868;
	bh=4UANBXEFzzWNDjzkZyhCusk/3Ln3IBad0owyMaZA9s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BwLoh8juJpB1j2JIPMu6yve9smAo41URpJXx8TMaktX+DpqaR3bMltvW/NELsNxaq
	 /mOBn3syLkiglEqEFPXGQMRzsZ/M06DsQHc8b9Ui2VopZpmtcZ17jIccv0bkmr3khZ
	 0Uye/8ScstG1DK4cE4r6vXnzrRRdBsxpcSJB9JFtk8LdTjBHfNw+qjEkkkTP9gk4ww
	 23hgllO3bCkLvr5N5rIDf3HC3kKju/R9jmEydgiKNdGuhd0jSDCSSZ4k1Ucb751j2t
	 XXBHgain3C8Z+mHZHr5kZcQomNJ8940/QnTIpHW+jUx4wapbkMTnNQVpQy3Wugsr4d
	 bk2BHaMbaKVww==
Date: Mon, 9 Jun 2025 17:01:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH v1 3/7] dt-bindings: interrupt-controller: add generic
 Risc-v aclint-sswi
Message-ID: <20250609-rejoice-disclose-b677f617f2de@spud>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250609134749.1453835-4-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0bO5XdsS6ddgc29+"
Content-Disposition: inline
In-Reply-To: <20250609134749.1453835-4-vladimir.kondratiev@mobileye.com>


--0bO5XdsS6ddgc29+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 04:47:45PM +0300, Vladimir Kondratiev wrote:
> Add generic, Risc-V spec compliant (see [1]) aclint-sswi binding
>=20
> Thead specific binding preserved, and converted to variant of the
> generic aclint-sswi
>=20
> Link: https://github.com/riscvarchive/riscv-aclint [1]

What is the ratification status of this spec?

>=20
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  .../riscv,aclint-sswi.yaml                    | 89 +++++++++++++++++++
>  .../thead,c900-aclint-sswi.yaml               | 58 ------------
>  2 files changed, 89 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/riscv,aclint-sswi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/thead,c900-aclint-sswi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
riscv,aclint-sswi.yaml
> new file mode 100644
> index 000000000000..cffddfcfcfea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint=
-sswi.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-ssw=
i.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Risc-V ACLINT Supervisor-level Software Interrupt Device

s/Risc-V/RISC-V/g

> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +description:
> +  The SSWI device is a part of the Risc-V ACLINT device. It provides
> +  supervisor-level IPI functionality for a set of HARTs on a THEAD
> +  platform. It provides a register to set an IPI (SETSSIP) for each
> +  HART connected to the SSWI device. See specification
> +  https://github.com/riscvarchive/riscv-aclint
> +
> +  T-HEAD C900 ACLINT is a variant of the ACLINT, using dedicated
> +  compatible string
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sophgo,sg2044-aclint-sswi
> +          - const: thead,c900-aclint-sswi
> +      - items:
> +          - const: riscv,aclint-sswi

You need a specific compatible for your implementation.
Whether or not this compatible is viable depends on the answer to the
ratification status and/or plan for the spec.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +  riscv,hart-indexes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 16384

maxItems is 4x what is allowed for interrupts-extended. Why?

> +    description:
> +      A list of hart indexes that APLIC should use to address each hart
> +      that is mentioned in the "interrupts-extended"

Please constrain this property to only be permitted on !thead.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    //Example 1
> +    interrupt-controller@94000000 {
> +      compatible =3D "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-ssw=
i";
> +      reg =3D <0x94000000 0x00004000>;
> +      #interrupt-cells =3D <0>;
> +      interrupt-controller;
> +      interrupts-extended =3D <&cpu1intc 1>,
> +                            <&cpu2intc 1>,
> +                            <&cpu3intc 1>,
> +                            <&cpu4intc 1>;
> +    };
> +
> +  - |
> +    //Example 2
> +    interrupt-controller@94000000 {
> +      compatible =3D "riscv,aclint-sswi";
> +      reg =3D <0x94000000 0x00004000>;
> +      #interrupt-cells =3D <0>;
> +      interrupt-controller;
> +      interrupts-extended =3D <&cpu1intc 1>,
> +                            <&cpu2intc 1>,
> +                            <&cpu3intc 1>,
> +                            <&cpu4intc 1>;
> +      riscv,hart-indexes =3D <0 1 0x10 0x11>;

Please be consistent. Hex or decimal, but not both.

Cheers,
Conor.

--0bO5XdsS6ddgc29+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcFPgAKCRB4tDGHoIJi
0syLAQCKcAg5MoUg65x8c8wmRQ4jrRHsbMrQwMf6m1ZzX/hBTQEA1/TVJcYfSH3+
tw9Ntl2G7mMGqeR1bjZWhBGDnH0mxgE=
=zT3n
-----END PGP SIGNATURE-----

--0bO5XdsS6ddgc29+--
