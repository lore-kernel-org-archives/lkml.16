Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF84D20CCD8;
	Wed,  5 Feb 2025 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786425; cv=none; b=MW2iWvf5wZHPALmpYTdxCtLMEwj1xYoOvXe143o5dRJs5ffIJH/wKH1NRx8UdL4eswj0C7GKh5WYVtpsNXqR158rba+HcsE8I/vwODVt/dKvEr7FSsi6JwjtwdpbqkShAxc6CtN3/ml2ZD6yIwYBWdaaNUOCeO7VInckWtv48DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786425; c=relaxed/simple;
	bh=1CURjxvGpOcq0l0S3rQd84eQvou3qxXxl/wRhILguLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njiwVu7b8JSL8s9TJ82QUX0hiQ+gIpKghs48vBWTKBSmLBSA7cu1EbznUoOTepYz546HcMCfEUjm7MNVODOkD8ncV+kUh2eTGh831VDX2HTXN/WAmEgnW/mTEClsqT6awjOvhG4E6bOJSgwH573h46/46+n4C8bQwbz+YVFB0uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqAh8nOr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqAh8nOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B12C4CED1;
	Wed,  5 Feb 2025 20:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738786423;
	bh=1CURjxvGpOcq0l0S3rQd84eQvou3qxXxl/wRhILguLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqAh8nOr1g8nY8YG8pspbysjsO68k/ycYNvavj4L4GvshSPHpv0p7jV3jEXAjn1Gu
	 DhYsU/NRjA7zhSG++fru/98hlQFb0po7dRaD3+lRiO/Cf4q/Vt7QFg89jV8kBi4sdS
	 S2gZa+ChhZ70TVUERQDV7NJLjgFZef7mtI0LnkpIOd0JXTZOHiu4/5YvO3ytVa8yWq
	 lelre2xbbKgQom3dfvtxxbnGUpo2h5QGpmwRFz9OFJjaOmR4rY6Ao4+ytcJfQa8uhC
	 GNhsSkUXmNSIH1EwNZTKN6KNup1KttUlqGQJUbdzdFRnytOmo/oi668qSUZrv1jia5
	 ms446XWhwtMBw==
Date: Wed, 5 Feb 2025 20:13:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Guenter Roeck <linux@roeck-us.net>, broonie@kernel.org,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt binding
Message-ID: <20250205-purge-debating-21273d3b0f40@spud>
References: <20250204180306.2755444-1-naresh.solanki@9elements.com>
 <20250204-mulled-evaluate-8a690cdfbd4d@spud>
 <CABqG17jHKfwJEfZxto_YA4opS8=QwqTqfNdkku8kcEv2_iW+XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UTue3Icjn2CmfZ6o"
Content-Disposition: inline
In-Reply-To: <CABqG17jHKfwJEfZxto_YA4opS8=QwqTqfNdkku8kcEv2_iW+XA@mail.gmail.com>


--UTue3Icjn2CmfZ6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 03:51:25PM +0530, Naresh Solanki wrote:
> On Wed, 5 Feb 2025 at 00:52, Conor Dooley <conor@kernel.org> wrote:
> > On Tue, Feb 04, 2025 at 11:33:03PM +0530, Naresh Solanki wrote:
> > > Move dt binding under hwmon/pmbus & align accordingly.
> > >
> > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > ---
> > >  .../hwmon/pmbus/infineon,ir38060.yaml         | 61 +++++++++++++++++=
++
> > >  .../bindings/regulator/infineon,ir38060.yaml  | 45 --------------
> > >  2 files changed, 61 insertions(+), 45 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/inf=
ineon,ir38060.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/regulator/infin=
eon,ir38060.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,i=
r38060.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir3806=
0.yaml
> > > new file mode 100644
> > > index 000000000000..e1f683846a54
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.=
yaml
> > > @@ -0,0 +1,61 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,ir38060.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Infineon Buck Regulators with PMBUS interfaces
> > > +
> > > +maintainers:
> > > +  - Not Me.
> >
> > How the hell did this get merged!
> >
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - infineon,ir38060
> > > +      - infineon,ir38064
> > > +      - infineon,ir38164
> > > +      - infineon,ir38263
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  regulators:
> > > +    type: object
> > > +    description:
> > > +      list of regulators provided by this controller.
> >
> > Can you explain why this change is justified? Your commit message is
> > explaining what you're doing but not why it's okay to do.

> This is based on other similar dt-bindings under hwmon/pmbus.

Okay, but what I am looking for is an explanation of why it is okay to
change the node from

| regulator@34 {
|   compatible =3D "infineon,ir38060";
|   reg =3D <0x34>;
|=20
|   regulator-min-microvolt =3D <437500>;
|   regulator-max-microvolt =3D <1387500>;
| };

to

| regulator@34 {
|     compatible =3D "infineon,ir38060";
|     reg =3D <0x34>;
|=20
|     regulators {
|         vout {
|             regulator-name =3D "p5v_aux";
|             regulator-min-microvolt =3D <437500>;
|             regulator-max-microvolt =3D <1387500>;
|         };
|     };

?

Will the driver handle both of these identically? Is backwards
compatibility with the old format maintained? Was the original format
wrong and does not work? Why is a list of regulators needed when the
device only provides one?

Cheers,
Conor.

> > > +    properties:
> > > +      vout:
> > > +        $ref: /schemas/regulator/regulator.yaml#
> > > +        type: object
> > > +
> > > +        unevaluatedProperties: false
> > > +
> > > +    additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        regulator@34 {
> > > +            compatible =3D "infineon,ir38060";
> > > +            reg =3D <0x34>;
> > > +
> > > +            regulators {
> > > +                vout {
> > > +                    regulator-name =3D "p5v_aux";
> > > +                    regulator-min-microvolt =3D <437500>;
> > > +                    regulator-max-microvolt =3D <1387500>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > diff --git a/Documentation/devicetree/bindings/regulator/infineon,ir3=
8060.yaml b/Documentation/devicetree/bindings/regulator/infineon,ir38060.ya=
ml
> > > deleted file mode 100644
> > > index e6ffbc2a2298..000000000000
> > > --- a/Documentation/devicetree/bindings/regulator/infineon,ir38060.ya=
ml
> > > +++ /dev/null
> > > @@ -1,45 +0,0 @@
> > > -# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > -%YAML 1.2
> > > ----
> > > -$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
> > > -$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > -
> > > -title: Infineon Buck Regulators with PMBUS interfaces
> > > -
> > > -maintainers:
> > > -  - Not Me.
> > > -
> > > -allOf:
> > > -  - $ref: regulator.yaml#
> > > -
> > > -properties:
> > > -  compatible:
> > > -    enum:
> > > -      - infineon,ir38060
> > > -      - infineon,ir38064
> > > -      - infineon,ir38164
> > > -      - infineon,ir38263
> > > -
> > > -  reg:
> > > -    maxItems: 1
> > > -
> > > -required:
> > > -  - compatible
> > > -  - reg
> > > -
> > > -unevaluatedProperties: false
> > > -
> > > -examples:
> > > -  - |
> > > -    i2c {
> > > -      #address-cells =3D <1>;
> > > -      #size-cells =3D <0>;
> > > -
> > > -      regulator@34 {
> > > -        compatible =3D "infineon,ir38060";
> > > -        reg =3D <0x34>;
> > > -
> > > -        regulator-min-microvolt =3D <437500>;
> > > -        regulator-max-microvolt =3D <1387500>;
> > > -      };
> > > -    };
> > >
> > > base-commit: bfbb730c4255e1965d202f48e7aa71baa9a7c65b
> > > --
> > > 2.42.0
> > >

--UTue3Icjn2CmfZ6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6PGcgAKCRB4tDGHoIJi
0hGkAQChLib7ZDWL+Gejwi/X2nLsQgm141ce305xUf+c7UozvAEA1rrwV/dOOJRn
pFlf7QuoXQV4s4yVRUdLvITtTaJTJAw=
=HyjM
-----END PGP SIGNATURE-----

--UTue3Icjn2CmfZ6o--
