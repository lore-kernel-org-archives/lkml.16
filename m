Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BBD204F85;
	Tue,  4 Feb 2025 19:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696964; cv=none; b=DUDgupFrBdiBf5nI6QyjhEDcZq7CZxAgS7MMv0KBB8zVP8xxsgwOu/5+3EbhNa7KVG0gJefbYRYCUFtXcx0fe8U9F7HeX8cvJgyYXrw0tuEedPDB4XN7gKWnLc2AvBJAP2g/sLiZL/Ba+uM9+6GP7Dk3kOlk/mOfwbBCtIFuASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696964; c=relaxed/simple;
	bh=JIIYJevLdmFj/UppSjoqdwt4o9oRsJRr08DNrl9bKjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSvBSgkQHmz9Syl9ORhlz+2nmHIayt5s6JNaxOQHzeYJTXm1rlQwkMKxBLz7upkyNzLjdHNmPxhwAveRtNyPYaFsmgs2Pr4gcbfYRnGQDuB2nc/RKTq/bnU4/MvqOQQiYf2eP4uIJsn8Hv+CX4s6X4upuzPyWIaHgTwLFt+z624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiTKmsma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiTKmsma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32D1C4CEDF;
	Tue,  4 Feb 2025 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738696964;
	bh=JIIYJevLdmFj/UppSjoqdwt4o9oRsJRr08DNrl9bKjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiTKmsmaawtyzK3gFz6SoL3CCBbX2odSetSm8/RtFli99hdpbpEMGz5b45YIz2Lg+
	 3Y79cu+JjhlDD+sXz341Q6Lhk7gp/U2662fsol5SY/SexMRIK1S3JaEc4tMOWgkJqu
	 85SkbHnqeZ/jHVL3UtoHdl14znHvI9LacUUVRRXHzPsajkngZ+8TiFgsnYkDwzcz28
	 gbqZFk3x2CzQE/e5/23LZDZwUPEyu09jG4qDAic5Bq9cg8RRO1oiTMvqt2PW91NgA+
	 BWfs4iLOJQPUHOgTFbtrwsZRUsje5DMFW/84+OI4Ab3yhhMaTjBRq85LF1j7cAnRbZ
	 mqHsCzf2E7c0Q==
Date: Tue, 4 Feb 2025 19:22:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Guenter Roeck <linux@roeck-us.net>, broonie@kernel.org,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt binding
Message-ID: <20250204-mulled-evaluate-8a690cdfbd4d@spud>
References: <20250204180306.2755444-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HYb3Nichi2MrG9QF"
Content-Disposition: inline
In-Reply-To: <20250204180306.2755444-1-naresh.solanki@9elements.com>


--HYb3Nichi2MrG9QF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 11:33:03PM +0530, Naresh Solanki wrote:
> Move dt binding under hwmon/pmbus & align accordingly.
>=20
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
>  .../hwmon/pmbus/infineon,ir38060.yaml         | 61 +++++++++++++++++++
>  .../bindings/regulator/infineon,ir38060.yaml  | 45 --------------
>  2 files changed, 61 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineo=
n,ir38060.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/infineon,=
ir38060.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir380=
60.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.ya=
ml
> new file mode 100644
> index 000000000000..e1f683846a54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,ir38060.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon Buck Regulators with PMBUS interfaces
> +
> +maintainers:
> +  - Not Me.

How the hell did this get merged!

> +
> +properties:
> +  compatible:
> +    enum:
> +      - infineon,ir38060
> +      - infineon,ir38064
> +      - infineon,ir38164
> +      - infineon,ir38263
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description:
> +      list of regulators provided by this controller.

Can you explain why this change is justified? Your commit message is
explaining what you're doing but not why it's okay to do.

Cheers,
Conor.

> +
> +    properties:
> +      vout:
> +        $ref: /schemas/regulator/regulator.yaml#
> +        type: object
> +
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        regulator@34 {
> +            compatible =3D "infineon,ir38060";
> +            reg =3D <0x34>;
> +
> +            regulators {
> +                vout {
> +                    regulator-name =3D "p5v_aux";
> +                    regulator-min-microvolt =3D <437500>;
> +                    regulator-max-microvolt =3D <1387500>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/regulator/infineon,ir38060=
=2Eyaml b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> deleted file mode 100644
> index e6ffbc2a2298..000000000000
> --- a/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Infineon Buck Regulators with PMBUS interfaces
> -
> -maintainers:
> -  - Not Me.
> -
> -allOf:
> -  - $ref: regulator.yaml#
> -
> -properties:
> -  compatible:
> -    enum:
> -      - infineon,ir38060
> -      - infineon,ir38064
> -      - infineon,ir38164
> -      - infineon,ir38263
> -
> -  reg:
> -    maxItems: 1
> -
> -required:
> -  - compatible
> -  - reg
> -
> -unevaluatedProperties: false
> -
> -examples:
> -  - |
> -    i2c {
> -      #address-cells =3D <1>;
> -      #size-cells =3D <0>;
> -
> -      regulator@34 {
> -        compatible =3D "infineon,ir38060";
> -        reg =3D <0x34>;
> -
> -        regulator-min-microvolt =3D <437500>;
> -        regulator-max-microvolt =3D <1387500>;
> -      };
> -    };
>=20
> base-commit: bfbb730c4255e1965d202f48e7aa71baa9a7c65b
> --=20
> 2.42.0
>=20

--HYb3Nichi2MrG9QF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Jo/wAKCRB4tDGHoIJi
0n1LAQCvwcmBoxgsSDIQxYp6veyw89f+ngZJgwza+NLCdV/5GAEAqLOh4I/JlmHW
myWJFQTOAi+LyrfwSTy4LXwa7z9UVQk=
=+Bh3
-----END PGP SIGNATURE-----

--HYb3Nichi2MrG9QF--
