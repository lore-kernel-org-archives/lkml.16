Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652B6189513;
	Mon,  9 Jun 2025 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487876; cv=none; b=VyZCYY0kpAfBSRe2EKo6IE3C1vN2vLSYte5yup3DiGTQXXqm7kez79kbi6oX2cabz/TljwH3pjCUNkdAtmPH9qvjNQjn7Fe4GRaPF72+WpXksgAMUk6FUFLLtfD32VFnLJHqzWZnbU2iudOdL56u+H+tCUUAkFqWXzLfTxJ+als=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487876; c=relaxed/simple;
	bh=J/wylyJBSAScDQUJw/zDYET2lTL47mjtpTQjkyteLQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0IlJ1YGmVIINeTM2BqOjItIvWuO5qhhLqYTWa8kkP8lUrbr1sa+ao/uaPy27hF1nksa3mTsbJdq0CtFLBugmX85BZN0ROIQ6NxFnij+miMq+aM/dqHysbxxMe6u5D3LGls6OWX9NvXO3QUa8x9Z1n/TlwuIuA/82ctArncDnps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5r97Jiw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5r97Jiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CEBC4CEEB;
	Mon,  9 Jun 2025 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749487875;
	bh=J/wylyJBSAScDQUJw/zDYET2lTL47mjtpTQjkyteLQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5r97JiwYDZa4ls6z2jIQEW2MxkhwJfHKemvYoo983wJVF+y14yLbvOG8Cr2vw0Gi
	 BC4Q+y8s73xWh+oXW2zeLAVckjuSxM8urn9R3V2DNYrgw3C0xVsJL5IAeEH0fQF+62
	 DV0mOzVfj6epWGh65sBsutvM7MZYKGnwDuH6+jy3GixFFP0/2Bz5HycTQ12d0Kz24C
	 IY/V+q4vBoM7kn1yaawj3nQeluIEpgsBVQSAMfCTGDBoJTKSuS0ZsoWfS6qXE6VTy0
	 CVLZpjPIh4PaClGDJcuvuOX00nvCGgSo8DaaGjIFBTM4tvs9odK/NNFRAemtNh+w6o
	 MF7oZoG0Fo2cA==
Date: Mon, 9 Jun 2025 17:51:10 +0100
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
Message-ID: <20250609-shifty-dingbat-31aa70d7d7b1@spud>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
 <20250606192208.26465-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SBK47IYpTz9XKfGh"
Content-Disposition: inline
In-Reply-To: <20250606192208.26465-4-ansuelsmth@gmail.com>


--SBK47IYpTz9XKfGh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025 at 09:22:04PM +0200, Christian Marangi wrote:
> Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> work. Add the rwquired register to configure the PCIe PHY and provide an
> example for it.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/phy/airoha,an7583-pcie-phy.yaml  | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-p=
cie-phy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy=
=2Eyaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> new file mode 100644
> index 000000000000..93252092c2e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7583 PCI-Express PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 =
port.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7583-pcie-phy
> +
> +  reg:
> +    items:
> +      - description: PCIE G3 analog base address
> +      - description: PCIE G3 PMA base address
> +      - description: PCIE QPhy analog base address
> +      - description: PCIE QPhy PMA base address
> +      - description: PCIE QPhy diagnostic base address
> +      - description: PCIE detection time base address
> +      - description: PCIE Rx AEQ base address
> +
> +  reg-names:
> +    items:
> +      - const: g3-ana
> +      - const: g3-pma
> +      - const: qp-ana
> +      - const: qp-pma
> +      - const: qp-dig
> +      - const: xr-dtime
> +      - const: rx-aeq
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        phy@11e80000 {
> +            compatible =3D "airoha,an7583-pcie-phy";
> +            #phy-cells =3D <0>;
> +            reg =3D <0x0 0x1fc7f000 0x0 0xfff>,
> +                  <0x0 0x1fc7e000 0x0 0xfff>,
> +                  <0x0 0x1fa5f000 0x0 0xff>,
> +                  <0x0 0x1fa5e000 0x0 0x8ff>,
> +                  <0x0 0x1fa5a000 0x0 0x3ff>,
> +                  <0x0 0x1fc30044 0x0 0x4>,
> +                  <0x0 0x1fc35030 0x0 0x4>;

Can you explain please why you have so many reg regions, some of which
are directly beside one another? Why is one (or more) larger region(s)
not viable here? Are some of these coming from a syscon that is not
modelled or are there other devices sharing in between?

> +            reg-names =3D "g3-ana", "g3-pma",
> +                        "qp-ana", "qp-pma", "qp-dig",
> +                        "xr-dtime", "rx-aeq";
> +        };
> +    };
> --=20
> 2.48.1
>=20

--SBK47IYpTz9XKfGh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcQ/gAKCRB4tDGHoIJi
0ghNAQDZVXyszTnaj2++b9YWhPi1v53MjfsCLhjAXHcqmT9OjQEAqFEmC+q6raBs
Ba9H2LAeRmFNXpoclo2Ls0FOBRskgg4=
=0D7n
-----END PGP SIGNATURE-----

--SBK47IYpTz9XKfGh--
